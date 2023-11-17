<%-- 
    Document   : Cart
    Created on : 15 Oct, 2023, 9:48:28 PM
    Author     : LENOVO
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        
        <!-- ====== Favicon ====== -->
        <link rel="shortcut icon" href="jsp/favicon-32x32.png" type="image/x-icon">
        <!-- ====== Boxicons ====== -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css">
        <!-- ====== Swiper CSS ====== -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <!-- ====== Custom CSS ====== -->
        <link rel="stylesheet" href="./css/cart.css"/>
        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
        <!--<link href="css/style.css" rel="stylesheet" type="text/css"/>-->
        <title>Apna Shop</title>
          <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if (session.getAttribute("uname") == null) {
                response.sendRedirect("Login.jsp");
            }

            %>
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

                   

                    

                    <div class="hamburger">
                        <i class='bx bx-menu-alt-right'></i>
                    </div>
                </div>
            </nav>
        </header>
        <!--Cart data-->
        <div class="table-data">
            <div class="order">
                <div class="head">
                    
                    <!-- <i class='bx bx-search' ></i> -->
                    <!-- <i class='bx bx-filter' ></i> -->
                </div>
                <!--category table-->
        <table style="margin-left: 220px; margin-top: 10px; width: 75%; font-size: 20px;" class="table table-hover">
            <div class="cart-title">
            <h1 style="margin-left: 700px; font-size: 30px; margin-bottom: 30px;">Your Cart</h1>
</div>
            <div class="cart-item">
                <thead>
                    <tr class="cart-item1">
                     <th scope="col">Product Name</th>
                     <th scope="col">Price</th>
                     <th scope="col">Size</th>
                     <th scope="col">Image</th>
                     <th scope="col">Brand</th>
                     <th scope="col">Quantity</th>
                </tr>
            </thead>
            </div>
            <tbody>
            <!--<div class="cart-table">-->
                        <%            try {
                                String UID = session.getAttribute("uid").toString();
                                Connection con = null;
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");
       //out.println(UID);
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("select * from cart_tbl where Uid ='" + UID + "'");

                                while (rs.next()) {
                                    int productid = rs.getInt(2);
                                    String query2 = "SELECT  product_id ,p_name,price,size,image_url,brand,PQTY FROM product_tbl, cart_tbl WHERE product_tbl.product_id = cart_tbl.Pid AND cart_tbl.Uid='"+UID+"'";
                                    Statement st2 = con.createStatement();
                                    ResultSet rs2 = st2.executeQuery(query2);
                                    while(rs2.next())
                                    {
                                        out.println(" <tr >");
                                            out.println("<td>" + rs2.getString(2) + "</td>");
                                            out.println("<td>" + rs2.getString(3) + "</td>");
                                            out.println("<td>" + rs2.getString(4) + "</td>");
                                            out.println("<td>" + "<img style=height: 50px; width=60px  src=pimages/"+ rs2.getString(5) + "> </td>");
                                            out.println("<td>" + rs2.getString(6) + "</td>");
                                            out.println("<td>" + rs2.getString(7) + "</td>");
                                            out.println("<td>");
                                          
                                            out.println("<a class=btn   href=deletecart?pid="+rs2.getString(1)+"><button type='button'  class='btn btn-danger'>Delete</button></a>");
                                            out.println("<td>");
                                            out.println("<br>");

                                            out.println(" </tr >");
                                    }
                                    break;
                                }

                                con.close();

                            } catch (Exception e) {
                                out.println(e.toString());
                            }
                        %>
                        <!--</div>-->
           
            </tbody> 
        </table>
                         <div>
                <a href="Home.jsp"><button type="button" class="btn btn-outline-dark" style="height: 30px; width: 50px; font-size: 15px; margin-left: 20px;">Back</button></a>
            </div>
            </div>
        </div>



    </body>
</html>
