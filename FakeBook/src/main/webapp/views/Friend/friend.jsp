<%-- 
    Document   : friend
    Created on : Dec 5, 2023, 1:50:51 AM
    Author     : LENOVO
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fakebook</title>
        <link rel="stylesheet" href="assets/css/style.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="../Layout/header.jsp"%>
        <%            Map<User, Integer> listFriend = (Map<User, Integer>) request.getAttribute("listFriend");
        %>
        <div class="friend-list-container">
            <%for (Map.Entry<User, Integer> entry : listFriend.entrySet()) {
                    User key = entry.getKey();
                    int value = entry.getValue();
                    {
            %>
            <div class="friend-list-card">
                <div class="friend-list-card-body">
                    <div class="friend-list-media">
                        <img src=".<%=key.getAvatar()%>" alt="alt"class="avatar avatar-xl mr-3"/>
                        <div class="friend-list-media-body overflow-hidden">
                            <h5 class="friend-list-card-text mb-0"><%=key.getFirstName() + " " + key.getLastName()%></h5>
                            <p class="friend-list-card-text text-uppercase text-muted"><%=value%> Friend(s)</p>
                            <p class="friend-list-card-text">
                                <%=key.getEmail()%><br><abbr title="Phone">P: </abbr><%=key.getPhone()%>
                            </p>
                        </div>
                    </div>
                    <a href="./myprofile?people_name=<%=key.getUsername()%>" class="friend-list-tile-link"></a>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
        <script src="assets/js/function.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
