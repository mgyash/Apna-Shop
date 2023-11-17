<%-- 
    Document   : about
    Created on : 28 Sep, 2023, 7:55:01 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <!-- ====== Favicon ====== -->
    <link rel="shortcut icon" href="jsp/favicon-32x32.png" type="image/x-icon">
    <!-- ====== Boxicons ====== -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css"
    />
    <!-- ====== Swiper CSS ====== -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"
    />
    <script src="javascirpt/main.js" type="text/javascript"></script>
    <script src="javascirpt/product.js" type="text/javascript"></script>
    
    <!-- ====== Custom CSS ====== -->
    <link rel="stylesheet" href="./css/About.css" />
    <link href="css/team.css" rel="stylesheet" type="text/css"/>
    
    <title>About</title>
  </head>
  <body>
      <%
                            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                            if (session.getAttribute("uname") == null) {
                                response.sendRedirect("Login.jsp");
                            } else {
//                                out.println("<a href='categoryPage.jsp?catId="</a>");

//                                out.println(session.getAttribute("uname").toString());
                            }


                            %>
    <!-- =======header======= -->
    <header class="header">
      <!-- ====== NAvigation ====== -->
      <nav class="navbar">
        <div class="row container d-flex">
          <div class="logo">
            <img class="image" src="jsp/brandlogo.png" alt="" />
          </div>

          <div class="nav-list d-flex">
            <a href="Home.jsp">Home</a>
            <a href="shop.jsp">Shop</a>
            <a href="about.jsp">About</a>
            <a href="contact.jsp">Contact</a>
            <div class="close">
              <i class="bx bx-x"></i>
            </div>
             
          </div>

          <div class="icons d-flex">
            
            <div class="icon d-flex user-icon" >
                <a class="btn" href="userPage.jsp" style="background-color:white; color: black"><i class='bx bx-user'></i></a>
            </div>
            <div class="icon d-flex">
             <a class="btn" href="Cart.jsp" style="background-color:white; color: black"><i class='bx bx-cart'></i></a>
            </div>
              <a href=logout class='logout'>
                <i class='bx bxs-log-out-circle'></i>    
                                 <span class=text>Logout</span> </a>
          </div>

        </div>
      </nav>
    </header>

    <!-- About Secion -->
<!--    <div class="heading">
      <h1>About Us</h1>
      <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum amet vero
        numquam earum pariatur quisquam.
      </p>
    </div>-->
<section style="margin-top: -150px">
        <div class="row">
            <h1>Our Team</h1>
        </div>
        <div class="row">
            <!-- column 1 -->
            <div class="column">
                <div class="card">
                    <div class="img-container">
                        <img src="jsp/person1.jpg" />    
                    </div>
                    <h3>Yash Mangrola</h3>
                    <p>Developer</p>
                    <div class="icons">
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-github"></i></a>
                        <a href="#"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
            </div>
            <!-- column 2 -->
            <div class="column">
                <div class="card">
                    <div class="img-container">
                     <img src="jsp/person2.jpg" />    
                    </div>
                    <h3>Vaibhav Sajankar</h3>
                    <p>Developer</p>
                    <div class="icons">
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-github"></i></a>
                        <a href="#"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
            </div>
            <!-- column 3 -->
            <div class="column">
                <div class="card">
                    <div class="img-container">
                     <img src="jsp/person3.jpg" />    
                    </div>
                    <h3>Vraj Golakiya</h3>
                    <p>Developer</p>
                    <div class="icons">
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-github"></i></a>
                        <a href="#"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
      </div>
    </div>
  </body>
</html>