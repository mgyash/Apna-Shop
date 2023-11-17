<%-- 
    Document   : categoryPage
    Created on : 15 Oct, 2023, 9:59:26 AM
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
         <!-- ====== Favicon ====== -->
        <link rel="shortcut icon" href="jsp/favicon-32x32.png" type="image/x-icon">
        <!-- ====== Boxicons ====== -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css">
        <!-- ====== Swiper CSS ====== -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />


        <!-- ====== Custom CSS ====== -->
        <link href="css/productpage.css" rel="stylesheet" type="text/css"/>
        
        <title>Apna Shop</title>
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

                        <div class="icon d-flex user-icon"><i class='bx bx-user'></i></div>
                        <div class="icon d-flex">
                            <i class='bx bx-cart'></i>
                            <span></span>
                        </div>
                    </div>

                    <div class="hamburger">
                        <i class='bx bx-menu-alt-right'></i>
                    </div>
                </div>
            </nav>
            </header>
             <section class="section categories">
            <div class="products container">
                
                 <%            try {
                     String pid =request.getParameter("catId");
//                     out.println(pid);
                        Connection con = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from product_tbl where cat_id ="+pid+"");

                        while (rs.next()) {
                            out.println("<div class= product>");
                            out.println("<div class='top d-flex'>");
                            out.println("<img src=pimages/" + rs.getString(7) + " alt='" + rs.getString(3) + "'>");
//                            out.println("<div class='icon d-flex'>");
//                            out.println("<i class='bx bxs-heart'></i>");
//                            out.println("</div>");
                            out.println("</div>");

        //                             bottom
                            out.println("<div class='bottom'>");
                            out.println("<h4>"+rs.getString(2)+"<h4>");
                            out.println("<div class='d-flex'>");
                            
                            out.println("<h4>" + rs.getString(3) + "</h4>");
                            out.println("</div>");
                            
                            out.println("<h3> Size: "+rs.getString(5)+"</h3>");
                            out.println("<h3> Brand: "+rs.getString(8)+"</h3>");
                            out.println("<div class='d-flex'>");
                            out.println("</div>");
                            out.print("<br>");
                            out.println("<div class='d-flex'>");
                            out.println("<div class='price'>₹" + rs.getString(4) + "</div>");
                            out.println("</div>");
                            out.println("<br>");
                            out.println("<a href='productPage.jsp?productId="+rs.getString(1)+"' class='btn cart-btn'>Add to Cart</a>");
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
    </body>
        
    </body>
</html>
