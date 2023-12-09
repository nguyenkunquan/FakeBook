

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Facebook Sign up Page 2022</title>
        <link rel="stylesheet" href="views/Login/FormRegister/style.css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet" />
    </head>
    <body>
        <!--Facebook Signup from start-->
        <div class="main">
            <form method="POST" action="./Register" enctype="multipart/form-data">
                <h2 class="first_title" style=" font-size: 40px;
                    padding: 10px 10px 10px 10px;">Sign Up</h2>
                <p class="first_sub_title"> </p>
                <hr />
                <!--Input section start-->
                <div class="input">
                    <input name="id_user" type="text" placeholder="Id" class="id_user" id="all" required />
                    <br />
                    <input name="first_name" type="text" placeholder="First Name" class="first_name" id="all" required />
                    <input name="last_name" type="text" placeholder="Last Name" class="last_name" id="all" required />
                    <br />
                    <input name="user_name" type="text" placeholder="User name" id="all1" required />
                    <br />
                    <input name="password" type="password" placeholder="New password" id="all1" required />
                    <br />
                    <input name="phone" type="number" placeholder="Phone number"  id="all1" required />
                    <br />
                    <input name="email" type="email" placeholder="Email"  id="all1" required />
                    <br />
                </div>
                <p class="sub_title_2" id="sub_title" style="margin-left: 12px; margin-top: 10px">Date of Birth</p>
                <select name="daySelect" style="
                        width: 125px;
                        margin-left: 10px;
                        margin-top: 10px;
                        height: 35px;
                        font-size: 15px;
                        background: none;
                        border: 1px solid #aaaa;
                        border-radius: 5px;">
                    <% for (int i = 1; i<= 31 ; i++) { %>
                    <option><%=i%></option>
                    <%}%>
                </select>
                <select name="monthSelect" style="
                        width: 125px;
                        margin-left: 10px;
                        margin-top: 10px;
                        height: 35px;
                        font-size: 15px;
                        background: none;
                        border: 1px solid #aaaa;
                        border-radius: 5px;">
                    <% for (int i = 1; i<= 12 ; i++) { %>
                    <option><%=i%></option>
                    <%}%>
                </select>
                <select name="yearSelect" style="
                        width: 125px;
                        margin-left: 10px;
                        margin-top: 10px;
                        height: 35px;
                        font-size: 15px;
                        background: none;
                        border: 1px solid #aaaa;
                        border-radius: 5px;">
                     <% for (int i = 2023; i >=1990 ; i--) { %>
                    <option><%=i%></option>
                    <%}%>
                </select>
                <!--Date of Birth section end-->
                <br />
                <!--Gender section start-->
                <div>
                    <div class="mb-3">
                        <select class="form-select" id="all1" name="gender" aria-label="Default select example">
                            <option selected value="-1">chọn giới tính</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                </div>
                <br />
                <div ><input type="submit" value="Signup" class="submit" /></div>
                <br />


            </form>
        </div>
        <!--Facebook Signup from end-->
    </body>
</html>
