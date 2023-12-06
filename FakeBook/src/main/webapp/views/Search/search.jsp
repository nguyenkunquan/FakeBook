<%-- 
    Document   : search
    Created on : Dec 5, 2023, 12:15:35 PM
    Author     : ADMIN
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Fakebook</title>
        <script src="https://kit.fontawesome.com/ef7e2b893b.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <%@include file="../Layout/header.jsp"%>
        <%            
            Map<User, Boolean> users = (Map<User, Boolean>) request.getAttribute("listPeople");
        %>
        <!-- content-area------------ -->

        <div class="container">
            <div class="filter-field">
                <div class="filter-choice">
                    <h1>Search results</h1>
                    <h3>Filters</h3>
                    <a href="#all" class="active"><img src="images/all.png" alt="">All</a>
                    <a href="#people" ><img src="images/people.png" alt="">People</a>
                    <a href="#post" ><img src="images/post.png" alt="">Post</a>
                </div>
            </div>

            <!-- main-content------- -->

            <div class="search-field">

                <div class="people-field">
                    <h2>People</h2>
                    <%  for (Map.Entry<User, Boolean> entry : users.entrySet()) {
                            User key = entry.getKey();
                            Boolean value = entry.getValue();
                            if (value) {%>
                    <div class="user-profile-search">
                        <a href="./myprofile?people_name=<%=key.getUsername()%>" style="text-decoration: none;color:#626262;">
                            <div class="profile-info">
                                <img src=".<%=key.getAvatar()%>" alt="">
                                <p> <%=key.getFirstName() + " " + key.getLastName()%></p>
                            </div>
                        </a>

                        <div>
                            <a href="./myprofile?people_name=<%=key.getUsername()%>"><button class="friend-button">Friend</button></a>
                        </div>
                    </div>        
                    <%
                    } else {%>
                    <div class="user-profile-search">
                        <a href="./myprofile?people_name=<%=key.getUsername()%>" style="text-decoration: none;color:#626262;">
                            <div class="profile-info">
                                <img src=".<%=key.getAvatar()%>" alt="">
                                <p> <%=key.getFirstName() + " " + key.getLastName()%></p>
                            </div>
                        </a>
                        <div>
                            <a href="./add?people_name=<%=key.getUsername()%>"><button class="add-friend-button">Add Friend</button></a>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>


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
                                    href="#">#This_Post_is_Better!!!!</a> </p>
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
                                    href="#">#This_Post_is_Bigger!!!!</a> </p>
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
                                    href="#">#This_Post_is_faster!!!!</a> </p>
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
                                    href="#">#This_Post_is_perfect!!!!</a> </p>
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
            <%@include file="../Layout/footer.jsp"%>
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var filterLinks = document.querySelectorAll('.filter-choice a');
                    var allFilter = document.querySelector('.filter-choice a[href="#all"]');
                    var peopleFilter = document.querySelector('.filter-choice a[href="#people"]');
                    var postFilter = document.querySelector('.filter-choice a[href="#post"]');
                    var peopleField = document.querySelector('.people-field');
                    var statusFieldContainers = document.querySelectorAll('.status-field-container');

                    filterLinks.forEach(function (link) {
                        link.addEventListener('click', function (event) {
                            event.preventDefault();

                            // Loại bỏ trạng thái active cho tất cả các liên kết
                            filterLinks.forEach(function (otherLink) {
                                otherLink.classList.remove('active');
                            });

                            // Thêm trạng thái active cho liên kết được nhấn
                            link.classList.add('active');
                        });
                    });
                    function toggleElement(element, isVisible) {
                        if (isVisible) {
                            element.style.display = 'block';
                        } else {
                            element.style.display = 'none';
                        }
                    }

                    // Xử lý sự kiện khi nhấn vào "All"
                    allFilter.addEventListener('click', function (event) {
                        event.preventDefault();

                        // Hiển thị cả "People" và "Status Field Containers"
                        toggleElement(peopleField, true);
                        statusFieldContainers.forEach(function (container) {
                            toggleElement(container, true);
                        });
                    });

                    // Xử lý sự kiện khi nhấn vào "People"
                    peopleFilter.addEventListener('click', function (event) {
                        event.preventDefault();

                        // Hiển thị chỉ "People" và ẩn tất cả "Status Field Containers"
                        toggleElement(peopleField, true);
                        statusFieldContainers.forEach(function (container) {
                            toggleElement(container, false);
                        });
                    });

                    // Xử lý sự kiện khi nhấn vào "Post"
                    postFilter.addEventListener('click', function (event) {
                        event.preventDefault();

                        // Ẩn "People" và hiển thị tất cả "Status Field Containers"
                        toggleElement(peopleField, false);
                        statusFieldContainers.forEach(function (container) {
                            toggleElement(container, true);
                        });
                    });

                });
            </script>
            <script src="assets/js/function.js"></script>
    </body>
</html>
