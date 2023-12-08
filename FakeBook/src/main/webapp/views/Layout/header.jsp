<%-- 
    Document   : header
    Created on : Dec 3, 2023, 9:25:51 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    <%@page import="Model.User"%>
    <%@page import="javax.servlet.http.HttpSession"%>
    String search = request.getAttribute("search_name") != null ? (String)request.getAttribute("search_name") : null;
    User user_profile = (User) request.getSession().getAttribute("user_name_pro");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Fakebook</title>
        <script src="https://kit.fontawesome.com/ef7e2b893b.js" crossorigin="anonymous"></script>
    </head>
    
    <nav class="navbar">
        <div class="nav-left"><img class="logo" src="images/logo.png" alt="">
            <ul class="navlogo">
                <li><img src="images/notification.png"></li>
                <li><img src="images/inbox.png"></li>
                <li><img src="images/video.png"></li>
            </ul>
        </div>
        <div class="nav-right">
            <div class="search-box">
                <form action="./search" method="GET" class="search-form" role="search" onsubmit="return validateSearchForm()">
                    <button class="search-button" type="submit"></button>
                    <input value="<%=(search!=null) ? search:"" %>" id="searchInput" name="search" type="search" placeholder="Search" aria-label="Search">
                </form>
            </div>
            <div class="profile-image online" onclick="UserSettingToggle()">
                <img src="images/profile-pic.png" alt="">
            </div>

        </div>
        <div class="user-settings">
            <div class="profile-darkButton">
                <div class="user-profile">
                    <img src="images/profile-pic.png" alt="">
                    <div>
                        <p> <%=user_profile.getFirstName()+ " " +user_profile.getLastName()%></p>
                        <a href="#">See your profile</a>
                    </div>
                </div>
                <div id="dark-button" onclick="darkModeON()">
                    <span></span>
                </div>
            </div>
            <hr>
            <div class="user-profile">
                <img src="images/feedback.png" alt="">
                <div>
                    <p> Give Feedback</p>
                    <a href="#">Help us to improve</a>
                </div>
            </div>
            <hr>
            <div class="settings-links">
                <img src="images/setting.png" alt="" class="settings-icon">
                <a href="#">Settings & Privary <img src="images/arrow.png" alt=""></a>
            </div>

            <div class="settings-links">
                <img src="images/help.png" alt="" class="settings-icon">
                <a href="#">Help & Support <img src="images/arrow.png" alt=""></a>
            </div>

            <div class="settings-links">
                <img src="images/display.png" alt="" class="settings-icon">
                <a href="#">Display & Accessibility <img src="images/arrow.png" alt=""></a>
            </div>

            <div class="settings-links">
                <img src="images/logout.png" alt="" class="settings-icon">
                <a href="#">Logout <img src="images/arrow.png" alt=""></a>
            </div>

        </div>
    </nav>
</html>
