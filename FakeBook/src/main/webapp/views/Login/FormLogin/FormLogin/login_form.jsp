

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - www.codingnepalweb.com -->
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facebook Login Page | CodingNepal</title>
    <link rel="stylesheet" href="views/Login/FormLogin/style.css">
  </head>
  <body>
    <div class="container flex">
      <div class="facebook-page flex">
        <div class="text">
          <h1>fakebook</h1>
          <p>Connect with friends and the world </p>
          <p> around you on Fakebook.</p>
        </div>
          <form method="POST" action="./Login" >
              <input name="user_name_l" type="text" placeholder="User name" required>
              <input name="passwork_l" type="password" placeholder="Password" required>
          <div class="link">
            <button type="submit" class="login">Login</button>
            <a href="#" class="forgot">Forgot password?</a>
          </div>
          <hr>
          <div class="button">
            <a href="./Register">Create new account</a>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
