<%-- 
    Document   : shop
    Created on : 28 Sep, 2023, 7:51:00 PM
    Author     : LENOVO
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ====== Favicon ====== -->
        <link rel="shortcut icon" href="jsp/favicon-32x32.png" type="image/x-icon">
        <!-- ====== Boxicons ====== -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css">
        <!-- ====== Swiper CSS ====== -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <!-- ====== Custom CSS ====== -->
        <link rel="stylesheet" href="./css/styles.css"/>
           <!--====== Custom javascript ======--> 
             <!--<script src="javascirpt/shop.js" type="text/javascript"></script>-->
        <title>Apna Shop</title>
    </head>
    <body>
        <!-- ====== Header ====== -->
        <header class="header">
            <!-- ====== NAvigation ====== -->
            <nav class="navbar">
                <div class="row container d-flex">
                    <div class="logo">
                        <img class="image" src="jsp/brandlogo.png" alt="">
                    </div>

                    <div class="nav-list d-flex">
                        <a href="Home.jsp">Home</a>
                        <a href="shop.jsp">Shop</a>
                        <a href="about.jsp">About</a>

                        <a href="contact.jsp">Contact</a>

                        <div class="close">
                            <i class="bx bx-x"></i>
                        </div>
                        <a href="" class="user-link">Login</a>
                    </div>

                    <div class="icons d-flex">

                        <div class="icon d-flex user-icon">
                        <a class="btn" href="userPage.jsp"><i class='bx bx-user'></i></a>
                        </div>
                        <div class="icon d-flex">
                               <a class="btn" href="Cart.jsp"><i class='bx bx-cart'></i></a>
                </div>
                        <a href=logout class='logout'>
                <i class='bx bxs-log-out-circle'></i>    
                                 <span class=text>Logout</span> </a>
                    </div>
                    </div>

                    <div class="hamburger">
                        <i class='bx bx-menu-alt-right'></i>
                    </div>

             
            </nav>
        </header>

        <!-- ======Product Here===== -->
        <section class="section categories">
            <div class="title">
                <span>CATEGORIES</span>
                <h2>2021 Latest Collection</h2>
            </div>
            <div class="products container">
                <%
                    try {
                        Connection con = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from product_tbl");

                        while (rs.next()) {
                            out.println("<div class= product>");
                            out.println("<div class='top d-flex'>");
                            out.println("<img src=pimages/" + rs.getString(7) + " alt='" + rs.getString(3) + "'>");

                            out.println("<div class='icon d-flex'>");
                            out.println("<i class='bx bxs-heart'></i>");
                            out.println("</div>");
                            out.println("</div>");

        //                             bottom
                            out.println("<div class='bottom'>");
                            out.println("<div class='d-flex'>");
                            out.println("<h4>" + rs.getString(3) + "</h4>");
//                            out.println("<a href='shop.html' class='btn cart-btn'>Shop Now</a>");
                            out.println("</div>");
                            out.println("<div class='d-flex'>");
                            out.println("<div class='price'>₹" + rs.getString(4) + "</div>");
                            out.println("</div>");
                            out.println("<br>");
                            out.println("<a href='Cart?p_id="+rs.getString(1)+"' class='btn cart-btn'>Add to Cart</a>");
                            out.println("<a href='productPage.jsp?productId="+rs.getString(1)+"' class='btn cart-btn'>Shop Now</a>");
                            
                            out.println("</div>");
                            out.println("</div>");

                        }

                        con.close();

                    } catch (Exception e) {
                        out.println(e.toString());
                    }
                %>
            </div>

        </section> 

        <!-- ====== Footer ====== -->
        <footer class="footer">
            <div class="row container">
                <div class="col" style="margin-top: -25px">
                    <div class="logo d-flex">
                        <!--<img src="jsp/brandlogo.png" alt="">-->
                    </div>
                    <p>Lorem ipsum dolor sit amet consectetur </br> elit. Perferendis harum cupiditate!</p>
                    <div class="icons d-flex">
                        <div class="icon d-flex"><i class='bx bxl-twitter'></i></div>
                        <div class="icon d-flex"><i class='bx bxl-instagram'></i></div>
                        <div class="icon d-flex"><i class='bx bxl-youtube'></i></div> 
                    </div>
<!--                    <p class="color">
                        Copyright 2023 </br>
                        Lorem ipsum dolor sit amet.
                    </p>-->
                </div>
                <div class="col">
                    <div>
                        <h4>Product</h4>

                        <%            try {
                                Connection con = null;
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("select * from product_tbl");

                                while (rs.next()) {
                                    out.println("<a href=''>" + rs.getString(2) + "</a>");

                                }

                                con.close();

                            } catch (Exception e) {
                                out.println(e.toString());
                            }
                        %>
                    </div>
                    <div>
                        <h4>Category</h4>
                        <a href="">Sportswear</a>
                        <%            try {
                                Connection con = null;
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("select * from category_table ");

                                while (rs.next()) {
                                    out.println("<a href=''>" + rs.getString(2) + "</a>");

                                }

                                con.close();

                            } catch (Exception e) {
                                out.println(e.toString());
                            }
                        %>
                    </div>
                    <div>
                        <h4>My Account</h4>
                        <a href=""><%
                            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                            if (session.getAttribute("uname") == null) {
                                response.sendRedirect("Login.jsp");
                            } else {
                                out.println(session.getAttribute("uname").toString());
                            }


                            %></a>
                    </div>
                    <div>
                        <h4>Contact Us</h4>
                        <div class="d-flex">
                            <div class="icon"><i class='bx bxs-map'></i></div>
                            <span>ATHWA GATE,SURAT,GUJARAT</span>

                        </div>
                        <div class="d-flex">
                            <div class="icon"><i class='bx bxs-envelope'></i></div>
                            <span>Apnashop@gmail.com</span>

                        </div>
                        <div class="d-flex">
                            <div class="icon"><i class='bx bxs-phone'></i></div>
                            <span>02612 24 0170</span>

                        </div>
                    </div>
                </div>
            </div>
        </footer>

    </body>
</html>