<%-- 
    Document   : header
    Created on : Dec 3, 2023, 9:25:51 PM
    Author     : ADMIN
--%>

<%@page import="Service.MyProfileService"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String search = request.getAttribute("search_name") != null ? (String)request.getAttribute("search_name") : null;
    String myUserProfile = (String) request.getSession().getAttribute("User");
    User u = new MyProfileService().getMyProfileByUserName(myUserProfile);;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Socialbook</title>
        <script src="https://kit.fontawesome.com/ef7e2b893b.js" crossorigin="anonymous"></script>
    </head>
    
    <nav class="navbar">
        <div class="nav-left">
            <a href="./Home" style="display: inline-block; width: 160px; height: 32.8px;">
                <img class="logo" src="images/logo.png" alt="">
            </a>
        </div>
        <div class="nav-right">
            <div class="search-box">
                <form action="./search" method="GET" class="search-form" role="search" onsubmit="return validateSearchForm()">
                    <button class="search-button" type="submit"></button>
                    <input value="<%=(search!=null) ? search:"" %>" id="searchInput" name="search" type="search" placeholder="Search" aria-label="Search">
                </form>
            </div>
            <div class="profile-image online" onclick="UserSettingToggle()">
                <img src=".<%= u.getAvatar()%>" alt="">
            </div>

        </div>
        <div class="user-settings">
            <div class="profile-darkButton">
                <div class="user-profile">
                    <img src=".<%= u.getAvatar()%>" alt="">
                    <div>
                        <p> <%= u.getName()%></p>
                        <a href="./myprofile?people_name=<%=myUserProfile%>">See your profile</a>
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
                <a href="./Logout">Logout <img src="images/arrow.png" alt=""></a>
            </div>

        </div>
    </nav>
</html>
