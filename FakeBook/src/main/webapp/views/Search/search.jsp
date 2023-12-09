<%-- 
    Document   : search
    Created on : Dec 5, 2023, 12:15:35 PM
    Author     : ADMIN
--%>

<%@page import="Service.PostService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="../Layout/header.jsp"%>
    <%            Map<User, Boolean> users = (Map<User, Boolean>) request.getAttribute("listPeople");
        List<Map<String, Object>> posts = (List<Map<String, Object>>) request.getAttribute("listPost");
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
                <%  if (users.size() == 0) {
                %>
                <div class="user-profile-search">
                    <p>User is not available!</p>
                </div>
                <%
                } else {
                    for (Map.Entry<User, Boolean> entry : users.entrySet()) {
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
                        <a href="./myprofile?people_name=<%=key.getUsername()%>"><button class="add-friend-button">Friend</button></a>
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
                    }
                %>
            </div>
            <% if (posts.size() != 0) { %>
            <% for (Map<String, Object> post : posts) {
                    PostService postService = new PostService();
                    String postStr = String.valueOf(post.get("id_post"));
                    int postID = Integer.parseInt(postStr);
                    boolean isLiked = postService.isLiked(postID, u.getUsername());
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
            } else {
            %>
            <div class="total1" id="blur">
                <div class="status-field-container write-post-container" style="text-align: center">               
                    <p>There are no related posts</p>
                </div>
            </div>
            <%
                }%>

        </div>

    </div>
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
