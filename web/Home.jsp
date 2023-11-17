<%-- 
    Document   : Home
    Created on : 18 Sep, 2023, 9:02:10 PM
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
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ====== Favicon ====== -->
        <link rel="shortcut icon" href="jsp/favicon-32x32.png" type="image/x-icon">
        <!-- ====== Boxicons ====== -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css">
        <!-- ====== Swiper CSS ====== -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

        <!-- ====== Custom CSS ====== -->
        <link rel="stylesheet" href="./css/styles.css"/>
        <title>Apna shop</title>
        
    </head>
    <body> 
        <!-- ====== Header ====== -->
        <header class="header">
            <!-- ====== NAvigation ====== -->
            <nav class="navbar">
                <div class="row container d-flex">
                    <div class="logo">
                        <img class="image" src="./jsp/brandlogo.png" alt="">
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
                            <a class="btn" href="userPage.jsp"><i class='bx bx-user'></i></a></div>
                        <div class="icon d-flex">
                            <a class="btn" href="Cart.jsp"><i class='bx bx-cart'></i></a>
                           
                        </div>
                        <li>
                            <%
                     response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                            if (session.getAttribute("uname") == null) {
                               out.println("<a href=Login.jsp class=Login>");
                                 out.println("<i class=bx bxs-log-out-circle></i>");    
                                 out.println("<span class=text>Login</span>");
                                 out.println("</a>");
                            } else {
                                 out.println("<a href=logout class='logout'>");
                                 out.println("<i class='bx bxs-log-out-circle'></i>");    
                                 out.println("<span class=text>Logout</span>");
                                 out.println("</a>");
                            }
                    
                            %>
                </li>
                    </div>

                    <div class="hamburger">
                        <i class='bx bx-menu-alt-right'></i>
                    </div>
                </div>
            </nav>

            <!--- HERO --->
            <!--- HERO --->
            <div class="hero">
                <div class="row container d-flex">
                    <div class="col">
                        <span class="subtitle">Limited Time only For Winter</span>
                        <h1>fash<span class="i">i</span>on</h1>
                        <p>LOOK YOUR BEST ON YOUR BEST DAY</p>
                        <button class="btn" >Explore Now!</button>

                    </div>
                    <img src="jsp/hero-1.png" alt=""/>
                </div>
            </div>

        </header>



        <!-- ====== New Arrival ====== -->
        <section class="section new-arrival">
            <div class="title">
                <span>New Arrival</span>
                <h2>Latest Collection</h2>
            </div>

            <div class="row container">
                <div class="col col-1">
                    <img src="jsp/poster-1.png" alt="" />
                    <h3>
                        2021 Trends </br>
                        Women's Smart Skirt
                    </h3>
                </div>
                <div class="col col-2">
                    <img src="jsp/poster-2.png" alt="" />
                    <h3>
                        2021 Trends</br>
                        Women's Smart Skirt   
                    </h3>
                </div>
                <div class="col col-3">
                    <img src="jsp/poster-3.png" alt="" />
                    <h3>
                        2021 Trends</br>
                        Women's Smart Shirt</br>
                        <span>Discover More:</span>
                    </h3>
                </div>
            </div>
        </section>

        <!-- ====== Categories ====== -->

        <section class="section categories">
            <div class="title">
                <span>COLLECTION</span>
                <h2>2021 Latest Collection</h2>
            </div>





            <div class="products container">

                <%            try {
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

        <!-- ====== Statistics ====== -->

        <section class="section statistics">
            <div class="title">
                <span>STATS</span>
                <h2>Our Statistics</h2>
            </div>

            <div class="row container">
                <div class="col">
                    <div class="icon"><i class='bx bxs-check-square'></i></div>
                    <h3>Easy Order System</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit, sed.</p>
                </div>
                <div class="col">
                    <div class="icon"><i class='bx bxs-user'></i></div>
                    <h3>On Time Delievery</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit, sed.</p>
                </div>
                <div class="col">
                    <div class="icon"><i class='bx bxs-dollar-circle'></i></div>
                    <h3>Money Back Gaurantee</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit, sed.</p>
                </div>
                <div class="col">
                    <div class="icon"><i class='bx bxs-user '></i></div>
                    <h3>24/7 Customer Support</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit, sed.</p>
                </div>
            </div>
        </section>


        <!-- ====== Blogs ====== -->
        <section class="section blog">
            <div class="title">
                <span>BLOGS</span>
                <h2>Latest News</h2>
            </div>

            <div class="row container">
                <div class="col">
                    <div class="top">
                        <img src="jsp/blog-1.png" alt="">
                    </div>
                    <div class="bottom">
                        <h3>Trendy</h3>
                        <h4>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis, ipsam?</h4>
                        <span>10 January 2022</span>
                    </div>
                </div>
                <div class="col">
                    <div class="top">
                        <img src="jsp/blog-2.png" alt="">
                    </div>
                    <div class="bottom">
                        <h3>Trendy</h3>
                        <h4>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis, ipsam?</h4>
                        <span>10 January 2022</span>
                    </div>
                </div>
                <div class="col">
                    <div class="top">
                        <img src="jsp/blog-3.png" alt="">
                    </div>
                    <div class="bottom">
                        <h3>Trendy</h3>
                        <h4>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis, ipsam?</h4>
                        <span>10 January 2022</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- ====== Footer ====== -->
        <footer class="footer">
            <div class="row container">
                <div class="col" style="margin-top: -110px">
                    <div class="logo d-flex">
                        <img src="./images/brandlogo.png" alt="">
                    </div>
                    <p>Lorem ipsum dolor sit amet consectetur </br> elit. Perferendis harum cupiditate!</p>
                    <div class="icons d-flex">
                        <div class="icon d-flex"><i class='bx bxl-twitter'></i></div>
                        <div class="icon d-flex"><i class='bx bxl-instagram'></i></div>
                        <div class="icon d-flex"><i class='bx bxl-youtube'></i></div> 
                    </div>
                    
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
                            out.println("<a href='productPage.jsp?productId="+rs.getString(1)+"'>"+rs.getString(2)+"</a>");

                        }

                        con.close();

                    } catch (Exception e) {
                        out.println(e.toString());
                    }
                %>
                    </div>
                    <div>
                        <h4>Category</h4>
                        <%            try {
                        Connection con = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from category_table ");

                        while (rs.next()) {
                            out.println("<a href='categoryPage.jsp?catId="+rs.getString(1)+"'>"+rs.getString(2)+"</a>");

                        }

                        con.close();

                    } catch (Exception e) {
                        out.println(e.toString());
                    }
                %>
                    </div>
                    <div>
                        <h4>My Account</h4>
                        <a href="userPage.jsp"><%
                            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                            if (session.getAttribute("uname") == null) {
//                                response.sendRedirect("Login.jsp");
                            } else {
//                                out.println("<a href='categoryPage.jsp?catId="</a>");

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


        <!-- ====== Login and Signup Form ====== -->

        <!-- ====== SwiperJs ====== -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
        <!-- ====== Custom Script ====== -->
        <script src="javascirpt/main.js" type="text/javascript"></script>
        <script src="javascirpt/product.js" type="text/javascript"></script>
        <a href="products.json"></a>
    </body>
</html>

