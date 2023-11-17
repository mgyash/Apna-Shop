<%-- 
    Document   : store
    Created on : 2 Oct, 2023, 6:21:17 PM
    Author     : LENOVO
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS --> 

        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <!--<link rel="stylesheet" href="store.css">-->
        <link href="css/store.css" rel="stylesheet" type="text/css"/>
        <!--<link href="style.css" rel="stylesheet" type="text/css"/>-->
        <title>Product</title>
    </head>
    <body>

        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if (session.getAttribute("uname") == null) {
                response.sendRedirect("login.html");
            }

            %>
        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="#" class="brand">
                <i class='bx bxs-smile'></i>
                <span class="text">AdminHub</span>
            </a>
            <ul class="side-menu top">
                <li>
                    <a href="admin.jsp">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li  class="active">
                    <a href="#">
                        <i class='bx bxs-shopping-bag-alt' ></i>
                        <span class="text">Product Management</span>
                    </a>
                </li>

                <li>
                    <a href="category.jsp">
                        <i class='bx bx-category'></i>
                        <span class="text">Category Management</span>
                    </a>
                </li>
                <li >
                    <a href="Team.jsp">
                        <i class='bx bxs-group' ></i>
                        <span class="text"> Our Team</span>
                    </a>
                </li>
            </ul>
            <ul class="side-menu">
                <!-- <li>
                        <a href="#">
                                <i class='bx bxs-cog' ></i>
                                <span class="text">Settings</span>
                        </a>
                </li> -->
                <li>
                    <a href="logout" class="logout">
                        <i class='bx bxs-log-out-circle' ></i>
                        <span class="text">Logout</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- SIDEBAR -->



        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>
                <a href="#" class="nav-link">Categories</a>
                <form action="#">
                    <div class="form-input">
                        <input type="search" placeholder="Search...">
                        <button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
                    </div>
                </form>
                <input type="checkbox" id="switch-mode" hidden>
                <label for="switch-mode" class="switch-mode"></label>
                <a href="message.jsp" class="notification">
				<i class='bx bxs-bell' ></i>
                                 <%            try {
                        Connection con = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from inquiry_message");
                        int i=0;
                        while (rs.next()) {
                            i++;
                        }
                        out.println("<span class=num>"+i+"</span>");
                        con.close();

                    } catch (Exception e) {
                        out.println(e.toString());
                    }
                %>	
				
			</a>
                <a href="#" class="profile">
                <span><i class='bx bxs-user-circle'></i></span>
                </a>
            </nav>
            <!-- NAVBAR -->


        </section>
        <!-- CONTENT -->
        <!-- Button trigger modal -->
        <button style="margin-left: 300px; margin-top: 20px" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            ADD Product
        </button>


        <!-- Add product Modal-->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-dialog ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!--<h1 class="modal-title fs-5" id="staticBackdropLabel">ADD Product</h1>-->
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="wrapper">
                            <form name="p_add" action="productCRUD" method="post" enctype="multipart/form-data">
                                <h1>Add Product</h1>
                                <div class="input-box">
                                    <input type="text" name="pname" placeholder="product name" required> </i>
                                    <!-- <i class='bx bxs-user'></i> -->
                                </div>
                                <div class="input-box">
                                    <input type="text" name="Desc" placeholder="decription" required></i>
                                    <!-- <i class='bx bxs-envelope'> -->
                                </div>
                                <div class="input-box right-product">
                                    <input type="number" name ="price" placeholder="Price" required> </i>
                                    <!-- <i class='bx bxs-phone'></i> -->
                                </div>
                                <div class="input-box left-product">
                                    <input type="text" name ="size" placeholder="Size" required> </i>
                                    <!-- <i class='bx bxs-phone'></i> -->
                                </div>

                                <div class="input-box right-product">
                                    <%
                                        try {
                                            Connection con = null;
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                                            Statement stmt = con.createStatement();
                                            ResultSet rs = stmt.executeQuery("select * from category_table");

                                            out.println("<select name='cat_name' >");
                                            while (rs.next()) {
                                                out.println("<option>");
                                                out.println("<br>");
                                                out.println(rs.getString(2));
                                                out.println("<br>");
                                                out.println("</option>");
                                            }
                                            out.println("</select>");
                                            con.close();

                                        } catch (Exception e) {
                                            out.println(e.toString());
                                        }
                                    %>
                                </div>
                                <div class="input-box left-product">
                                    <input type="text" name ="Brand_name" placeholder="brand" required> </i>
                                    <!-- <i class='bx bxs-phone'></i> -->
                                </div>
                                <div class="input-box img-upload"  >
                                    <input style="margin-bottom: 10px" type="file" name="img_url" placeholder="images" class="file" required></i>
                                    <!-- <i class='bx bxs-lock-alt' > -->
                                </div>
                                <!-- <div class="remember-forget">
                                  <label><input type="checkbox" > Remember me</label>
                                  <a href="#">Forgot password?</a>
                              </div> -->
                                <button type="submit" name="submit" value="Add" class="btn">ADD</button>
                            </form>
                        </div>




                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>



                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Button trigger modal -->
        <button type="button" style="margin-left: 3px; margin-top: 20px" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Update Product
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <!--<h1 class="modal-title fs-5" id="exampleModalLabel">update Product</h1>-->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="wrapper">
                            <form action="productCRUD" method="post" enctype="multipart/form-data">
                                <h1>Update Product</h1>
                                <div class="input-box right-product">
                                    <%
                                        try {
                                            Connection con = null;
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                                            Statement stmt = con.createStatement();
                                            ResultSet rs = stmt.executeQuery("select p_name from product_tbl");

                                            out.println("<select name='p_name'>");
                                            while (rs.next()) {
                                                out.println("<option>");
                                                out.println("<br>");
                                                out.println(rs.getString(1));
                                                out.println("<br>");
                                                out.println("</option>");
                                            }
                                            out.println("</select>");
                                            con.close();

                                        } catch (Exception e) {
                                            out.println(e.toString());
                                        }
                                    %>
                                </div>
                                <div class="input-box">
                                    <input type="text" name="pname" placeholder="product name" required> </i>
                                    <!-- <i class='bx bxs-user'></i> -->
                                </div>
                                <div class="input-box">
                                    <input type="text" name="Desc" placeholder="decription" required></i>
                                    <!-- <i class='bx bxs-envelope'> -->
                                </div>
                                <div class="input-box right-product">
                                    <input type="number" name ="price" placeholder="Price" required> </i>
                                    <!-- <i class='bx bxs-phone'></i> -->
                                </div>
                                <div class="input-box left-product">
                                    <input type="text" name ="size" placeholder="Size" required> </i>
                                    <!-- <i class='bx bxs-phone'></i> -->
                                </div>
                                <div class="input-box right-product">
                                    <%
                                        try {
                                            Connection con = null;
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                                            Statement stmt = con.createStatement();
                                            ResultSet rs = stmt.executeQuery("select * from category_table");

                                            out.println("<select name='cat_name'>");
                                            while (rs.next()) {
                                                out.println("<option>");
                                                out.println("<br>");
                                                out.println(rs.getString(2));
                                                out.println("<br>");
                                                out.println("</option>");
                                            }
                                            out.println("</select>");
                                            con.close();

                                        } catch (Exception e) {
                                            out.println(e.toString());
                                        }
                                    %>
                                </div>
                                <div class="input-box left-product">
                                    <input type="text" name ="Brand_name" placeholder="brand" required> </i>
                                    <!-- <i class='bx bxs-phone'></i> -->
                                </div>
                                <div class="input-box img-upload"  >
                                    <input style="margin-bottom: 10px" type="file" name="img_url" placeholder="images" class="file" required></i>
                                    <!-- <i class='bx bxs-lock-alt' > -->
                                </div>
                                <!-- <div class="remember-forget">
                                  <label><input type="checkbox" > Remember me</label>
                                  <a href="#">Forgot password?</a>
                              </div> -->
                                <button type="submit" name="submit" value="Update" class="btn">ADD</button>
                            </form>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    </div>
                </div>
            </div>
        </div>

        <!--delete product modal-->

        <button type="button" class="btn btn-primary" style="margin-left: 3px; margin-top: 20px" data-bs-toggle="modal" data-bs-target="#deletemodal">
            Delete Product
        </button>

        <!-- Modal -->
        <div class="modal fade" id="deletemodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <!--        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>-->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="wrapper">
                            <form action="productCRUD">
                                <h1>Delete Product</h1>


                                <div class="input-box right-product" style="text-align: center;">
                                    <%
                                        try {
                                            Connection con = null;
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                                            Statement stmt = con.createStatement();
                                            ResultSet rs = stmt.executeQuery("select p_name from product_tbl");

                                            out.println("<select name='p_name'>");
                                            while (rs.next()) {
                                                out.println("<option>");
                                                out.println("<br>");
                                                out.println(rs.getString(1));
                                                out.println("<br>");
                                                out.println("</option>");
                                            }
                                            out.println("</select>");
                                            con.close();

                                        } catch (Exception e) {
                                            out.println(e.toString());
                                        }
                                    %>
                                </div>
                                <button type="submit" name="submit" value="Delete" class="btn">Delete </button>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    </div>
                </div>
            </div>
        </div>
        <!--product table--> 

        <!--category table-->
        <table style="margin-left: 300px; margin-top: 10px; width: 75%" class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Product ID</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Product Description</th>
                    <th scope="col">Price</th>
                    <th scope="col">Size</th>
                    <th scope="col">Category Id</th>
                    <th scope="col">Image</th>
                    <th scope="col">Brand</th>
                </tr>
            </thead>
            <tbody>

                <%
                    try {
                        Connection con = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from product_tbl");

                        while (rs.next()) {
                            out.println(" <tr >");
                            out.println("<td>" + rs.getInt(1) + "</td>");
                            out.println("<td>" + rs.getString(2) + "</td>");
                            out.println("<td>" + rs.getString(3) + "</td>");
                            out.println("<td>" + rs.getString(4) + "</td>");
                            out.println("<td>" + rs.getString(5) + "</td>");
                            out.println("<td>" + rs.getInt(6) + "</td>");
                            out.println("<td>" + rs.getString(7) + "</td>");
                            out.println("<td>" + rs.getString(8) + "</td>");
                            out.println("<br>");
                            out.println(" </tr >");
                        }

                        con.close();

                    } catch (Exception e) {
                        out.println(e.toString());
                    }
                %>

            </tbody>
        </table>

        <script src="javascirpt/script.js" type="text/javascript"></script>

    </body>
</html>
