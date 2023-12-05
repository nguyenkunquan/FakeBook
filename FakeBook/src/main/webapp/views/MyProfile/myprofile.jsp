<%-- 
    Document   : myprofile
    Created on : Dec 3, 2023, 9:43:49 PM
    Author     : ADMIN
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@include file="/views/Layout/header.jsp"%>
    <%
    User user = (User)request.getAttribute("user");
    %>
    
    <!-- profile-page-------------------------- -->
    <div class="profile-container">
        <img src=".<%= user.getBackground()%>" class="coverImage" alt="" id="coverImage">
        <form action="./myprofile" method="POST" enctype="multipart/form-data" class="hidden-form-cover" id="postForm-cover">              
            <div class="add-post-links">
                <input class="form-control" name="cusCover" type="file" id="formFile">
                <button type="submit">Update cover image</button>
            </div>
        </form>
        <div class="dashboard">
            <div class="left-dashboard">
                <img src=".<%= user.getAvatar()%>" class="dashboard-img" alt="" id="dashboard-img">
                <div class="left-dashboard-info">
                    <h3><%= user.getFirstName() + " " + user.getLastName() %></h3>
                    <p>120 Friends - 20 mutuals</p>
                    <div class="mutual-friend-images">
                        <img src="images/member-1.png" alt="">
                        <img src="images/member-2.png" alt="">
                        <img src="images/member-3.png" alt="">
                        <img src="images/member-5.png" alt="">
                    </div>
                </div>
            </div>
            <div></div>
            <div class="right-dashboard-info">
                <div class="right-dashboard-info-top">

                    <button type="button"><i class="fas fa-user-plus"></i> Friends</button>
                    <button type="button"><i class="far fa-envelope"></i> messages</button>
                </div>
                <div class="right-div-single-logo"> <a href="#"> <i class="fas fa-ellipsis-h"></i></a></div>
            </div>
        </div>
        <form action="./myprofile" method="POST" enctype="multipart/form-data" class="hidden-form-avatar" id="postForm-avatar">              
            <div class="add-post-links">
                <input class="form-control" name="cusAvatar" type="file" id="formFile">
                <button type="submit">Update avatar image</button>
            </div>
        </form>

        <div class="container content-profile-container">
            <div class="left-sidebar profile-left-sidebar">
                <div class="left-profile-sidebar-top">
                    <div class="intro-bio">
                        <h4>intro</h4>
                        <p>Belive in yourself and you do unbelievable things <i class="far fa-smile-beam"></i></p>
                        <hr>
                    </div>
                    <div class="background-details">
                        <a href="#">
                            <img src="images/icons8-gender-64.png">
                            <p><%= user.getGender() %></p>
                        </a>
                        <a href="#">
                            <img src="images/icons8-birthday-64.png">
                            <p><%= user.getBirthday() %></p>
                        </a>
                        <a href="#">
                            <img src="images/icons8-phone-50.png">
                            <p><%= user.getPhone() %></p>
                        </a>
                        <a href="#">
                            <img src="images/icons8-email-50.png">
                            <p><%= user.getEmail() %></p>
                        </a>
                        <a href="#">
                            <img src="images/icons8-location-50.png">
                            <p>From Quy Nhon, VietNam</p>
                        </a>
                    </div>
                </div>

                <div class="left-profile-sidebar-top gallery">
                    <div class="heading-link profile-heading-link">
                        <h4>Photos</h4>
                        <a href="">All Photos</a>
                    </div>

                    <div class="gallery-photos">
                        <div class="gallery-photos-rowFirst">
                            <img src="images/photo1.png" alt="">
                            <img src="images/photo2.png" alt="">
                            <img src="images/photo3.png" alt="">

                            <img src="images/photo4.png" alt="">
                            <img src="images/photo5.png" alt="">
                            <img src="images/photo6.png" alt="">
                        </div>
                    </div>
                </div>

                <div class="left-profile-sidebar-top gallery">
                    <div class="heading-link profile-heading-link">
                        <h4>Friends</h4>
                        <a href="">All Friends</a>
                    </div>

                    <div class="gallery-photos">
                        <div class="gallery-photos-rowFirst">
                            <div class="first-friend">
                                <img src="images/member-1.png" alt="">
                                <p>Nathan M</p>
                            </div>
                            <div class="second-friend">
                                <img src="images/member-2.png" alt="">
                                <p>Joseph N</p>
                            </div>
                            <div class="third-friend">
                                <img src="images/member-3.png" alt="">
                                <p>Blondie K</p>
                            </div>
                            <div class="forth-friend">
                                <img src="images/member-4.png" alt="">
                                <p>Jonathon J</p>
                            </div>
                            <div class="fifth-friend">
                                <img src="images/member-5.png" alt="">
                                <p>Mark K</p>
                            </div>
                            <div class="sixth-friend">
                                <img src="images/member-6.png" alt="">
                                <p>Emilia M</p>
                            </div>
                            <div class="seventh-friend">
                                <img src="images/member-7.png" alt="">
                                <p>Max P</p>
                            </div>
                            <div class="eighth-friend">
                                <img src="images/member-8.png" alt="">
                                <p>Layla M</p>
                            </div>
                            <div class="ninth-friend">
                                <img src="images/member-9.png" alt="">
                                <p>Edward M</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- main-content------- -->

            <div class="content-area profile-content-area">
                <div class="write-post-container">
                    <div class="user-profile">
                        <img src=".<%= user.getAvatar()%>" alt="">
                        <div>
                            <p> <%= user.getFirstName() + " " + user.getLastName()%></p>
                            <small>Public <i class="fas fa-caret-down"></i></small>
                        </div>
                    </div>

                    <div class="post-upload-textarea">
                    <form action="./myprofile" method="POST" enctype="multipart/form-data">
                    <textarea name="content" placeholder="What's on your mind, <%= user.getLastName()%>?" id="" cols="30" rows="3"></textarea>                   
                    <div class="add-post-links">
                            <input class="form-control" name="cusAvatar" type="file" id="formFile">
                        <button type="submit">Post</button>
                    </div>
                    </form>
                </div>
                </div>

                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <img src="images/profile-pic.png" alt="">
                            <div>
                                <p> Alex Carry</p>
                                <small>August 13 1999, 09.18 pm</small>
                            </div>
                        </div>
                        <div>
                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                        </div>
                    </div>
                    <div class="status-field">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                            laborum nihil accusantium odit laboriosam, sed sit autem! <a
                                href="#">#This_Post_is_Better!!!!</a>
                        </p>
                        <img src="images/feed-image-1.png" alt="">

                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><img src="images/like-blue.png" alt="">120</div>
                            <div><img src="images/comments.png" alt="">52</div>
                            <div><img src="images/share.png" alt="">35</div>
                        </div>
                        <div class="post-profile-picture">
                            <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                        </div>
                    </div>
                </div>
                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <img src="images/profile-pic.png" alt="">
                            <div>
                                <p> Alex Carry</p>
                                <small>August 13 1999, 09.18 pm</small>
                            </div>
                        </div>
                        <div>
                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                        </div>
                    </div>
                    <div class="status-field">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                            laborum nihil accusantium odit laboriosam, sed sit autem! <a
                                href="#">#This_Post_is_Bigger!!!!</a>
                        </p>
                        <img src="images/feed-image-2.png" alt="">

                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><img src="images/like-blue.png" alt="">120</div>
                            <div><img src="images/comments.png" alt="">52</div>
                            <div><img src="images/share.png" alt="">35</div>
                        </div>
                        <div class="post-profile-picture">
                            <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                        </div>
                    </div>
                </div>
                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <img src="images/profile-pic.png" alt="">
                            <div>
                                <p> Alex Carry</p>
                                <small>August 13 1999, 09.18 pm</small>
                            </div>
                        </div>
                        <div>
                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                        </div>
                    </div>
                    <div class="status-field">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                            laborum nihil accusantium odit laboriosam, sed sit autem! <a
                                href="#">#This_Post_is_faster!!!!</a>
                        </p>
                        <img src="images/feed-image-3.png" alt="">

                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><img src="images/like-blue.png" alt="">120</div>
                            <div><img src="images/comments.png" alt="">52</div>
                            <div><img src="images/share.png" alt="">35</div>
                        </div>
                        <div class="post-profile-picture">
                            <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                        </div>
                    </div>
                </div>
                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <img src="images/profile-pic.png" alt="">
                            <div>
                                <p> Alex Carry</p>
                                <small>August 13 1999, 09.18 pm</small>
                            </div>
                        </div>
                        <div>
                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                        </div>
                    </div>
                    <div class="status-field">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                            laborum nihil accusantium odit laboriosam, sed sit autem! <a
                                href="#">#This_Post_is_perfect!!!!</a>
                        </p>
                        <img src="images/feed-image-4.png" alt="">

                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><img src="images/like-blue.png" alt="">120</div>
                            <div><img src="images/comments.png" alt="">52</div>
                            <div><img src="images/share.png" alt="">35</div>
                        </div>
                        <div class="post-profile-picture">
                            <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn-LoadMore" onclick="LoadMoreToggle()">Load More</button>
            </div>
        </div>
    </div>
    <%@include file="../Layout/footer.jsp"%>

    <script src="assets/js/function.js"></script>

</html>
