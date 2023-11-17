<%-- 
    Document   : Register
    Created on : 18 Sep, 2023, 11:08:55 PM
    Author     : LENOVO
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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
            <form action="register">
                <h1>Register</h1>
                <div class="input-box">
                    <input type="text" name="Uname" placeholder="Username" required> <i class='bx bxs-user'></i>
                </div> <%            try {
                        Connection con = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");
                         String uname=request.getParameter("Uname");
//                         out.println(uname);
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from user_details where User_name='"+uname+"'");

                        while (rs.next()) {
                            out.println(rs.getString(2));

                        }

                        con.close();

                    } catch (Exception e) {
                        out.println(e.toString());
                    }
                %>
                <div class="input-box">
                    <input type="email"name="Email" placeholder="email" required> <i class='bx bxs-envelope'></i>
                </div>
                <div class="input-box">
                     <input type="number" name ="Ph_no" placeholder="Phone Number" required> <i class='bx bxs-phone'></i>
                </div>
                <div class="input-box">
                    <input type="password" name="pswd" placeholder="Password" required> <i class='bx bxs-lock-alt' ></i>
                </div>
                 
                <div class="remember-forget">
                    <label><input type="checkbox" > Remember me</label>
                    <a href="#">Forgot password?</a>
                </div>
                <button type="submit" class="btn">Register</button>
                <div class="register-link">
                    <p>Already have an account? <a href="Login.jsp">Login</a></p>
                </div>
            </form>
            
        </div>
    </body>
</html>
