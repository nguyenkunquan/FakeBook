<%-- 
    Document   : post
    Created on : 07-12-2023, 16:20:03
    Author     : MSI ADMIN
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="Model.Comment"%>
<%@page import="DAO.PostDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@include file="/views/Layout/header.jsp"%>
    <%        String user_name = (String) request.getSession().getAttribute("User");
        Map<String, Object> post = (Map<String, Object>) request.getAttribute("post");
        PostDAO postDao = new PostDAO();
        String postStr = String.valueOf(post.get("id_post"));
        int postID = Integer.parseInt(postStr);
        boolean isLiked = postDao.isLiked(postID, user_name);
        Map<Comment, User> listComment = request.getAttribute("listComment") != null ? (Map<Comment, User>) request.getAttribute("listComment") : null;
    %>
    <!-- content-area------------ -->
    <div class="total" >
        <div class="container">


            <!-- main-content------- -->

            <div class="content-area">


                <!-- MAIN POST -->
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
                        </div>

                        <div class="status-field">
                            <p><%=post.get("content")%> </p>
                            <img src=".<%=post.get("img")%>" alt="card image cap">

                        </div>
                        <div class="post-reaction">
                            <div class="activity-icons">
                                <%
                                    if (isLiked) {
                                %>
                                <div>       
                                    <form id="likeForm" action="./deletelike?posId=<%=post.get("id_post")%>" method="POST">

                                        <button id="likeButton"> <img  src="images/like-blue.png"><%=post.get("like_num")%></button>
                                    </form>
                                </div>
                                <%
                                } else {
                                %>
                                <div>       
                                    <form id="likeForm" action="./likecontroller?posId=<%=post.get("id_post")%>" method="POST">

                                        <button id="likeButton"> <img  src="images/like.png"><%=post.get("like_num")%></button>
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
                        <div class="post-upload-textarea" >
                            <form action="./comment?posId=<%=post.get("id_post")%>" method="POST" >
                                <textarea name="content1" placeholder="What's on your mind, Alex?" id="" cols="30" rows="3"></textarea>
                                <button type="submit">Post</button>
                            </form>
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
                                        <img src=".<%=value.getAvatar()%>" alt="">
                                        <div>
                                            <p><%=value.getFirstName() + " " +value.getFirstName()%></p>
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
                </html>
