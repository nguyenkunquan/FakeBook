<%-- 
    Document   : post
    Created on : 07-12-2023, 16:20:03
    Author     : MSI ADMIN
--%>

<%@page import="Service.PostService"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="Model.Comment"%>
<%@page import="DAO.PostDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@include file="/views/Layout/header.jsp"%>
    <%  
        boolean isExist =(boolean) request.getAttribute("isExist");
        if (!isExist) {
    %>        
    <div class="total" >
        <div class="container" style="justify-content: center;">
            <div class="postdetail">


                <!-- main-content------- -->

                <div class="content-area">
                    <!-- MAIN POST -->
                    <div class="total1" id="blur">
                        <div class="status-field-container write-post-container" style="text-align: center" >               
                            <p>This post is not available!</p>
                        </div>
                    </div>
                    <script src="assets/js/function.js"></script>
                </div>
            </div>
        </div>
    </div>    
    <%}else{ 
        String user_name = (String) request.getSession().getAttribute("User");
        Map<String, Object> post = (Map<String, Object>) request.getAttribute("post");
        PostService postService = new PostService();
        String postStr = String.valueOf(post.get("id_post"));
        int postID = Integer.parseInt(postStr);
        boolean isLiked = postService.isLiked(postID, user_name);
        Map<Comment, User> listComment = request.getAttribute("listComment") != null ? (Map<Comment, User>) request.getAttribute("listComment") : null;
    %>
    <!-- content-area------------ -->
    <div class="total" >
        <div class="container" style="justify-content: center;">
            <div class="postdetail">


                <!-- main-content------- -->

                <div class="content-area">


                    <!-- MAIN POST -->
                    <div class="total1" id="blur">
                        <div class="status-field-container write-post-container" >               
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <img src=".<%=post.get("avatar")%>" alt="">
                                    <div>
                                        <p><%=post.get("first_name") + " " + post.get("last_name")%></p>
                                        <small><%=post.get("createdTime")%></small>
                                    </div>
                                </div>
                                <%
                                    String user_name_per = (String) post.get("user_name");
                                    String user_name_session = (String) u.getUsername();
                                    if (user_name_per.matches(user_name_session)) {
                                %>

                                <div class="select-post" id="select-post"><!--   <a href="#"><i class="fas fa-ellipsis-v"></i></a> -->    
                                    <ul>
                                        <li>
                                            <a ><i class="fas fa-ellipsis-v"></i></a>
                                            <ul>
                                                <li><a onclick="BlurPost()"><i class="fas fa-edit"></i></a></li>
                                                <li><a href="./deletepost?posId=<%=post.get("id_post")%>"><img src="images/icons8-trash-can-50.png" alt="alt"/></a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="write-post-container" id="popup">
                                    <div class="user-profile">
                                        <img src=".<%=u.getAvatar()%>" alt="">
                                        <div>
                                            <p><%=u.getFirstName() + " " + u.getLastName()%></p>
                                            <small>Public <i class="fas fa-caret-down"></i></small>
                                        </div>
                                    </div>

                                    <div class="post-upload-textarea">
                                        <form action="./updatepost?posId=<%=post.get("id_post")%>" method="POST" enctype="multipart/form-data">
                                            <textarea  name="content" placeholder="What's on your mind, <%=u.getLastName()%>?" id="" cols="30" rows="3"></textarea>
                                            <div class="add-post-links">
                                                <input class="form-control" name="postAvatar" type="file" id="formFile">
                                                <button type="submit">Post</button>
                                                <a onclick="BlurPost()">Close</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>



                                <%     }%>
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
                                    <%
                                        if (isLiked) {
                                    %>
                                    <div>       
                                        <form id="likeForm" action="./deletelike?posId=<%=post.get("id_post")%>" method="POST">

                                            <button id="likeButton" style="border:none; background-color:#fff"> <img  src="images/like-blue.png"><%=post.get("like_num")%></button>
                                        </form>
                                    </div>
                                    <%
                                    } else {
                                    %>
                                    <div>       
                                        <form id="likeForm" action="./likecontroller?posId=<%=post.get("id_post")%>" method="POST">

                                            <button id="likeButton" style="border:none; background-color:#fff"> <img  src="images/like.png"><%=post.get("like_num")%></button>
                                        </form>
                                    </div>
                                    <%
                                        }
                                    %>

                                    <!--                                <div><img src="images/like-blue.png" alt=""></div>-->
                                    <div><img src="images/comments.png" alt=""><%=post.get("comment")%></div>
                                    <div><img src="images/share.png" alt=""></div>
                                </div>

                            </div>
                            <div style="padding:20px 0 20px 0; border-bottom: 1px solid #d6d3d3; border-top: 1px solid #d6d3d3; ">
                                <div class="user-profile">
                                    <img src=".<%=u.getAvatar()%>" alt="">
                                    <div>
                                        <p><%=u.getFirstName() + " " + u.getLastName()%></p>
                                    </div>
                                </div>        
                                <div class="post-upload-textarea" >
                                    <form action="./comment?posId=<%=post.get("id_post")%>" method="POST" >
                                        <textarea name="content1" placeholder="Type your comment here" id="" cols="30" rows="3"></textarea>
                                        <button type="submit" style="border-radius: 5px; border-color: #fff; background-color: #1876f1; color:#fff">Send</button>
                                    </form>
                                </div>         
                            </div>

                            <div>
                                <!-- day la comment -->
                                <%
                                    for (Entry<Comment, User> entry : listComment.entrySet()) {
                                        Comment key = entry.getKey();
                                        User value = entry.getValue();
                                %>
                                <div class="status-field-container write-post-container" >               
                                    <div class="user-profile-box">
                                        <div class="user-profile">
                                            <a href="./myprofile?people_name=<%=value.getUsername()%>"><img src=".<%=value.getAvatar()%>" alt=""></a>
                                            
                                            <div>
                                                <p><%=value.getFirstName() + " " + value.getLastName()%></p>
                                                <small><%=key.getCreatedTime()%></small>
                                            </div>
                                        </div>
                                        <%
                                            if (value.getUsername().equals(user_name)) {
                                        %>
                                        <div class="select-post" id="select-post">
                                            <ul>
                                                <li>
                                                    <a ><i class="fas fa-ellipsis-v"></i></a>
                                                    <ul>
                                                        <li><a href="./deletecomment?postID=<%=postID%>&commentId=<%=key.getIdComment()%>"><img src="images/icons8-trash-can-50.png" alt="alt"/></a></li>
                                                </li>
                                            </ul>
                                        </div>
                                        <%
                                            }
                                        %>

                                    </div>

                                    <div class="status-field">
                                        <p><%=key.getContent()%> </p>

                                    </div>
                                </div>
                                <%
                                    }
                                %>

                            </div>
                        </div>
                    </div>


                    <!-- sidebar------------ -->




                    <!-- POPUP POST EDIT -->

                    <script src="assets/js/function.js"></script>
                </div>
            </div>
        </div>
    </div>
    <%}%>
</html>
