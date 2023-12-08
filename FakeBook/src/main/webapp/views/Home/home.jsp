<%-- 
    Document   : index
    Created on : Dec 3, 2023, 9:35:58 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="Model.Post"%>
<%@page import="DAO.PostDAO"%>
<%@page import= "java.util.Map"%>
<%@ page import="java.util.Date" %>
<%@page import="Model.User"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    List<Map<String, Object>> posts = (List<Map<String, Object>>) request.getAttribute("listPos");
    User user_profile_1 = (User) request.getSession().getAttribute("user_name_pro");
%>
<!DOCTYPE html>
<html lang="en">
    
    <%@include file="/views/Layout/header.jsp"%>

    <!-- content-area------------ -->
    <div class="container">
        <div class="left-sidebar">
            <div class="important-links">
                <a href="#"><img src="images/news.png" alt="">Latest News</a>
                <a href="#"><img src="images/friends.png" alt="">Friends</a>
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
                    <img src="images/profile-pic.png" alt="">
                    <div>
                        <p><%=user_profile_1.getFirstName() + " " + user_profile_1.getLastName()%></p>
                        <small>Public <i class="fas fa-caret-down"></i></small>
                    </div>
                </div>

                <div class="post-upload-textarea">
                    <form action="./post" method="POST" enctype="multipart/form-data">
                    <textarea name="content" placeholder="What's on your mind,<%=user_profile_1.getLastName()%>?" id="" cols="30" rows="3"></textarea>
                    
                    <div class="add-post-links">
                            <input class="form-control" name="postAvatar" type="file" id="formFile">
                        <button type="submit">Post</button>
                    </div>
                    </form>
                </div>
            </div>

               <% if (posts != null) { %>
                <% for (Map<String, Object> post : posts) {
                        PostDAO postDao = new PostDAO();
                        String postStr = String.valueOf(post.get("id_post"));
                        int postID = Integer.parseInt(postStr);
                        boolean isLiked = postDao.isLiked(postID, user_profile_1.getUsername());
                        //             boolean isLiked = true;
%>
                <div class="total1" id="blur">
                    <div class="status-field-container write-post-container" >               
                        <div class="user-profile-box">
                            <div class="user-profile">
                                <img src=".<%=post.get("avatar")%>" alt="">
                                <div>
                                    <p><%=post.get("user_name")%></p>
                                    <small><%=post.get("createdTime")%></small>
                                </div>
                            </div>
                            <%String user_name_per = (String) post.get("user_name");
                                String user_name_session = (String) user_profile_1.getUsername();
                                if (user_name_per.matches(user_name_session)) {
                            %>

                            <div class="select-post" id="select-post"><!--   <a href="#"><i class="fas fa-ellipsis-v"></i></a> -->    
                                <ul>
                                    <li>
                                        <a ><i class="fas fa-ellipsis-v"></i></a>
                                        <ul>
                                            <li><a onclick="BlurPost()"><i class="fas fa-edit"></i></a></li>
                                            <li><a onclick="deletePost(<%=post.get("id_post")%>)"><img src="images/icons8-trash-can-50.png" alt="alt"/></a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>




                            <%     }%>
                        </div>

                        <div class="status-field">
                            <p><%=post.get("content")%> </p>
                            <img src=".<%=post.get("img")%>" alt="card image cap">

                        </div>
                        <div class="post-reaction">
                            <div class="activity-icons">
                                <div>       
                                    <form id="likeForm" action="" method="POST">

                                        <button id="likeButton" name="posId" > <img  src=<%=isLiked ? "images/like-blue.png" : "images/like.png"%>><%=post.get("like_num")%></button>
                                    </form>
                                </div>
                                <div><img src="images/comments.png" alt=""><%=post.get("comment")%></div>
                                <div><a href="./post?postID=<%=post.get("id_post")%>"><img src="images/share.png" alt=""></a></div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="write-post-container" id="popup">
                    <div class="user-profile">
                        <img src=".<%=user_profile_1.getAvatar()%>" alt="">
                        <div>
                            <p><%=user_profile_1.getFirstName() + " " + user_profile_1.getLastName()%></p>
                            <small>Public <i class="fas fa-caret-down"></i></small>
                        </div>
                    </div>

                    <div class="post-upload-textarea">
                        <form action="./updatepost?posId=<%=post.get("id_post")%>" method="POST" enctype="multipart/form-data">
                            <textarea name="content" placeholder="What's on your mind, Alex?" id="" cols="30" rows="3"></textarea>
                            <div class="add-post-links">
                                <input class="form-control" name="postAvatar" type="file" id="formFile">
                                <button type="submit">Post</button>
                                <a onclick="BlurPost()">Close</a>
                            </div>
                        </form>
                    </div>
                </div>

                <% }
                    }%>
            <button type="button" class="btn-LoadMore" onclick="LoadMoreToggle()">Load More</button>
        </div>

        <!-- sidebar------------ -->
        <div class="right-sidebar">


            <div class="heading-link">
                <h4>Conversation</h4>
                <a href="">Hide Chat</a>
            </div>

            <div class="online-list">
                <div class="online">
                    <img src="images/member-1.png" alt="">
                </div>
                <p>Alison Mina</p>
            </div>

            <div class="online-list">
                <div class="online">
                    <img src="images/member-2.png" alt="">
                </div>
                <p>Jackson Aston</p>
            </div>
            <div class="online-list">
                <div class="online">
                    <img src="images/member-3.png" alt="">
                </div>
                <p>Samona Rose</p>
            </div>
        </div>
    </div>
    <%@include file="../Layout/footer.jsp"%>

    <script src="assets/js/function.js"></script>
</html>
