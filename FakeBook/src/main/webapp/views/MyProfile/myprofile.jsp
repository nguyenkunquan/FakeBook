<%-- 
    Document   : myprofile
    Created on : Dec 3, 2023, 9:43:49 PM
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@include file="/views/Layout/header.jsp"%>
    <%        String myAccount = (String) request.getAttribute("myAccount");
        User user = (User) request.getAttribute("user");
        boolean isMyAccount = myAccount.equals(user.getUsername());
        boolean isFriend = request.getAttribute("isFriend") != null ? (boolean) request.getAttribute("isFriend") : null;
        Map<User, Integer> listFriend = (Map<User, Integer>) request.getAttribute("listFriend");
    %> 

    <!-- profile-page-------------------------- -->
    <div class="profile-container">
        <img src=".<%= user.getBackground()%>" class="coverImage" alt="" id="coverImage">
        <% if (isMyAccount) {%>
        <form action="./myprofile" method="POST" enctype="multipart/form-data" class="hidden-form-cover" id="postForm-cover">              
            <div class="add-post-links">
                <input class="form-control" name="cusCover" type="file" id="formFile">
                <button type="submit">Update cover image</button>
            </div>
        </form>
        <% }%>
        <div class="dashboard">
            <div class="left-dashboard">
                <img src=".<%= user.getAvatar()%>" class="dashboard-img" alt="" id="dashboard-img">
                <div class="left-dashboard-info">
                    <h3><%= user.getFirstName() + " " + user.getLastName()%></h3>
                    <p><%=listFriend.size()%> Friends</p>

                    <div class="mutual-friend-images">
                        <%
                            int count = 0;
                            for (Map.Entry<User, Integer> entry : listFriend.entrySet()) {
                                if (count < 3) {
                        %>
                        <a href="./myprofile?people_name=<%=entry.getKey().getUsername()%>"><img src=".<%=entry.getKey().getAvatar()%>" alt=""></a>
                            <%
                                        count++;
                                    } else {
                                        break;
                                    }
                                }
                            %>
                    </div>
                </div>
            </div>
            <div></div>
            <% if (!isMyAccount) {%>
            <div class="right-dashboard-info">
                <div class="right-dashboard-info-top">
                    <%if (isFriend) {
                    %>
                    <button type="button">Friend</button>
                    <%
                    } else {
                    %>
                    <a href="./add?people_name=<%= user.getUsername()%>">
                        <button type="button"><i class="fas fa-user-plus"></i> Friends</button>
                    </a>
                    <%
                        }
                    %>
                    <button type="button"><i class="far fa-envelope"></i> messages</button>
                </div>
            </div>
            <% }%>
        </div>
        <% if (isMyAccount) {%>
        <form action="./myprofile" method="POST" enctype="multipart/form-data" class="hidden-form-avatar" id="postForm-avatar">              
            <div class="add-post-links">
                <input class="form-control" name="cusAvatar" type="file" id="formFile">
                <button type="submit">Update avatar image</button>
            </div>
        </form>
        <% }%>
        <div class="container content-profile-container">
            <div class="left-sidebar profile-left-sidebar">
                <div class="left-profile-sidebar-top">
                    <div class="intro-bio">
                        <h4>intro</h4>
                        <p>Belive in yourself and you do unbelievable things <i class="far fa-smile-beam"></i></p>
                        <hr>
                    </div>
                    <div class="background-details">
                        <a id="myGender" >
                            <img src="images/icons8-gender-64.png">
                            <p><%= user.getGender()%></p>
                        </a>
                        <% if (isMyAccount) {%>
                        <form action="./updatemyprofile" method="POST" class="hidden-form-gender" id="showFormGender" style="display: none">              
                            <select class="form-select" name="newGender" aria-label="Default select example">
                                <option selected value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                            <button type="submit" style="width: 100%">Update gender</button>
                        </form>
                        <% }%>
                        <a id="myBirthday">
                            <img src="images/icons8-birthday-64.png">
                            <p><%= user.getBirthday()%></p>
                        </a>
                        <% if (isMyAccount) {%>
                        <form action="./updatemyprofile" method="POST" class="hidden-form-birthday" id="showFormBirthday" style="display: none">              
                            <select name="newDay" style="
                                    width: 125px;
                                    margin-left: 10px;
                                    margin-top: 10px;
                                    height: 35px;
                                    font-size: 15px;
                                    background: none;
                                    border: 1px solid #aaaa;
                                    border-radius: 5px;">
                                <% for (int i = 1; i <= 31; i++) {%>
                                <option><%=i%></option>
                                <% }%>
                            </select>
                            <select name="newMonth" style="
                                    width: 125px;
                                    margin-left: 10px;
                                    margin-top: 10px;
                                    height: 35px;
                                    font-size: 15px;
                                    background: none;
                                    border: 1px solid #aaaa;
                                    border-radius: 5px;">
                                <% for (int i = 1; i <= 12; i++) {%>
                                <option><%=i%></option>
                                <% }%>
                            </select>
                            <select name="newYear" style="
                                    width: 125px;
                                    margin-left: 10px;
                                    margin-top: 10px;
                                    height: 35px;
                                    font-size: 15px;
                                    background: none;
                                    border: 1px solid #aaaa;
                                    border-radius: 5px;">
                                <option>2022</option>
                                <option>2021</option>
                                <option>2020</option>
                                <option>2019</option>
                                <option>2018</option>
                                <option>2017</option>
                                <option>2016</option>
                                <option>2015</option>
                                <option>2014</option>
                                <option>2013</option>
                                <option>2012</option>
                                <option>2011</option>
                                <option>2010</option>
                                <option>2009</option>
                                <option>2008</option>
                                <option>2007</option>
                                <option>2006</option>
                                <option>2005</option>
                                <option>2004</option>
                                <option>2003</option>
                                <option>2002</option>
                                <option>2001</option>
                                <option>2000</option>
                                <option>1999</option>
                            </select>
                            <button type="submit" style="width: 100%">Update birthday</button>
                        </form>
                        <% }%>
                        <a id="myPhone">
                            <img src="images/icons8-phone-50.png">
                            <p><%= user.getPhone()%></p>
                        </a>
                        <% if (isMyAccount) {%>
                        <form action="./updatemyprofile" method="POST" class="hidden-form-phone" id="showFormPhone" style="display: none">              
                            <input name="newPhone" type="number" placeholder="Phone number" required />
                            <button type="submit" style="width: 100%">Update phone</button>
                        </form>
                        <% }%>
                        <a id="myEmail">
                            <img src="images/icons8-email-50.png">
                            <p><%= user.getEmail()%></p>
                        </a>
                        <% if (isMyAccount) {%>
                        <form action="./updatemyprofile" method="POST" class="hidden-form-email" id="showFormEmail" style="display: none">              
                            <input name="newEmail" type="email" placeholder="Email" required />
                            <button type="submit" style="width: 100%">Update email</button>
                        </form>
                        <% }%>
                        <a>
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
                            <%
                                int count1 = 0;
                                for (Map.Entry<User, Integer> entry : listFriend.entrySet()) {
                                    if (count1 < 9) {
                            %>
                            <div>
                                <a href="./myprofile?people_name=<%=entry.getKey().getUsername()%>"><img src=".<%=entry.getKey().getAvatar()%>" alt=""></a>
                                <p><%=entry.getKey().getFirstName() + " " + entry.getKey().getLastName()%></p>
                            </div>
                            <%          count1++;
                                    } else {
                                        break;
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>

            </div>

            <!-- main-content------- -->

            <div class="content-area profile-content-area">
                <% if (isMyAccount) {%>
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
                <% }%>

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
            </div>
        </div>
    </div>

    <script src="assets/js/function.js"></script>

</html>
