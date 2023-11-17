<%-- 
    Document   : Login
    Created on : 18 Sep, 2023, 11:14:39 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        
    </head>
    
    <body>
        <nav class="navbar">
          <div class="row container d-flex">
            <div class="logo">
              <img class="image" src="./jsp/brandlogo.png" alt="">
            </div>
            <div class="hamburger">
              
            </div>
          </div>
        </nav>
        <div class="wrapper">
            <form action="Login" method="post" >
                <h1>Login</h1>
                <div class="input-box">
                    <input type="text" name="Name" placeholder="Username" required> <i class='bx bxs-user'></i>
                </div>
                <div class="input-box">
                    <input type="password" name="Password" placeholder="Password" required> <i class='bx bxs-lock-alt' ></i>
                </div>
                <div class="remember-forget">
                    <label><input type="checkbox" > Remember me</label>
                    <a href="#">Forgot password?</a>
                </div>
                <button type="submit" class="btn">Login</button>
                <div class="register-link">
                    <p>Don't have an account? <a href="Register.jsp">Register</a></p>
                </div>
            </form>
            
        </div>
    </body>
</html>
