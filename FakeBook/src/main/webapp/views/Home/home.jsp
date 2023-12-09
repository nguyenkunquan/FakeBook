<%-- 
    Document   : index
    Created on : Dec 3, 2023, 9:35:58 PM
    Author     : ADMIN
--%>
<%@page import="java.util.Set"%>
<%@page import="Service.PostService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@include file="/views/Layout/header.jsp"%>
    <%        List<Map<String, Object>> posts = (List<Map<String, Object>>) request.getAttribute("listPos");
        Map<User, Integer> listFriend = (Map<User, Integer>) request.getAttribute("listFriend");
    %>
    <!-- content-area------------ -->
    <div class="container">
        <div class="left-sidebar">
            <div class="important-links">
                <a href="#"><img src="images/news.png" alt="">Latest News</a>
                <a href="./friend"><img src="images/friends.png" alt="">Friends</a>
                <a href="#"><img src="images/group.png" alt="">Groups</a>
                <a href="#"><img src="images/marketplace.png" alt="">marketplace</a>
                <a href="#"><img src="images/watch.png" alt="">Watch</a>
                <a href="#">See More</a>
            </div>

            <div class="shortcut-links">
                <p>Your Shortcuts</p>
                <a href="#"> <img src="images/shortcut-1.png" alt="">Web Developers</a>
                <a href="#"> <img src="images/shortcut-2.png" alt="">Web Design Course</a>
                <a href="#"> <img src="images/shortcut-3.png" alt="">Full Stack Development</a>
                <a href="#"> <img src="images/shortcut-4.png" alt="">Website Experts</a>
            </div>
        </div>

        <!-- main-content------- -->

        <div class="content-area">

            <div class="write-post-container">
                <div class="user-profile">
                    <img src=".<%=u.getAvatar()%>" alt="">
                    <div>
                        <p><%=u.getFirstName() + " " + u.getLastName()%></p>
                        <small>Public <i class="fas fa-caret-down"></i></small>
                    </div>
                </div>

                <div class="post-upload-textarea">
                    <form action="./post" method="POST" enctype="multipart/form-data">
                        <textarea name="content" placeholder="What's on your mind, <%=u.getLastName()%>?" id="" cols="30" rows="3"></textarea>

                        <div class="add-post-links">
                            <input class="form-control" name="postAvatar" type="file" id="formFile">
                            <button type="submit">Post</button>
                        </div>
                    </form>
                </div>
            </div>

            <% if (posts != null) { %>
            <% for (Map<String, Object> post : posts) {
                    PostService postService = new PostService();
                    MyProfileService myProfileService = new MyProfileService();
                    User user = myProfileService.getMyProfileByUserName((String) post.get("user_name"));
                    String postStr = String.valueOf(post.get("id_post"));
                    int postID = Integer.parseInt(postStr);
                    boolean isLiked = postService.isLiked(postID, u.getUsername());
                    //             boolean isLiked = true;
%>
            <div class="total1" id="blur">
                <div class="status-field-container write-post-container" >               
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <a href="./myprofile?people_name=<%=post.get("user_name")%>"><img src=".<%=post.get("avatar")%>" alt=""></a>

                            <div>
                                <p><%=post.get("first_name") + " " + post.get("last_name")%></p>
                                <small><%=post.get("createdTime")%></small>
                            </div>
                        </div>
                    </div>

                    <div class="status-field">
                        <p><%=post.get("content")%> </p>
                        <%
                            String show = (String) post.get("img");
                            if (show.length() > 10) {%>
                        <img src=".<%=post.get("img")%>" alt="card image cap">
                        <%}%>
                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div>       
                                <img  src=<%=isLiked ? "images/like-blue.png" : "images/like.png"%>>
                                <%=post.get("like_num")%>
                            </div>
                            <div><img src="images/comments.png" alt=""><%=post.get("comment")%></div>
                            <div><a href="./post?postID=<%=post.get("id_post")%>"><img src="images/share.png" alt=""></a></div>
                        </div>

                    </div>
                </div>
            </div>
            

            <% }
                }%>
        </div>

        <!-- sidebar------------ -->
        <div class="right-sidebar">


            <div class="heading-link">
                <h4>Conversation</h4>
                <a href="">Chat</a>
            </div>
            <%
                Set<Map.Entry<User, Integer>> entrySet = listFriend.entrySet();

                // Quét qua các entry trong entrySet
                for (Map.Entry<User, Integer> entry : entrySet) {
                    User key = entry.getKey();
            %>
            <div class="online-list">
                <div class="online">
                    <a href="./myprofile?people_name=<%=key.getUsername()%>"><img src="./<%= key.getAvatar()%>" alt=""></a>
                    
                </div>
                <p><%=key.getName()%></p>
            </div>
            <%
                }
            %>
            


        </div>
    </div>


    <script src="assets/js/function.js"></script>
</html>
