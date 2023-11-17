<%-- 
    Document   : contact
    Created on : 28 Sep, 2023, 8:08:04 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ====== Favicon ====== -->
    <link rel="shortcut icon" href="jsp/favicon-32x32.png" type="image/x-icon">
    <title>Contact Page</title>
     <!-- ====== Boxicons ====== -->
   <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css">
        <!-- ====== Custom CSS ====== -->
        <link rel="stylesheet" href="./css/contact.css"/>
</head>
<body><%
                            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                            if (session.getAttribute("uname") == null) {
                                response.sendRedirect("Login.jsp");
                            } else {
//                                out.println("<a href='categoryPage.jsp?catId="</a>");

//                                out.println(session.getAttribute("uname").toString());
                            }


                            %>
    <!-- ====== Header ====== -->
    <header class="header">
        <!-- ====== NAvigation ====== -->
          <nav class="navbar">
            <div class="row container d-flex">
              <div class="logo">
                <img src="jsp/brandlogo.png" alt="">
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
               
                </div>
              </div>
  
              <div class="hamburger">
                <i class='bx bx-menu-alt-right'></i>
              </div>
            </div>
          </nav>
</header>
<!--========= Contact Form  ===========-->

<div class="contactUs">
    <div class="title">
        <!-- <h2>Get in Touch</h2> -->
    </div>
    <div class="box">
        <div class="contact form">
            <h3>Send a Message</h3>
            <form method="get" action="message">
                <div class="formBox">
                    <div class="row50">
                        <div class="inputBox">
                            <span>First Name</span>
                            <input type="text" name="FirstName" placeholder="Write First Name here">
                        </div>
                        <div class="inputBox">
                            <span>Last Name</span>
                            <input type="text" name="LastName" placeholder="Write Last Name here">
                        </div>
                    </div>

                    <div class="row50">
                        <div class="inputBox">
                            <span>Email</span>
                            <input type="text" name="email" placeholder="Write Email here">
                        </div>
                        <div class="inputBox">
                            <span>Mobile Number</span>
                            <input type="text" name="MobileNumber" placeholder="+91">
                        </div>
                    </div>
                    
                    <div class="row100">
                        <div class="inputBox">
                            <span>Message</span>
                            <textarea name="Messages" placeholder="Write your message here..."></textarea>
                        </div>
                    </div>

                    <div class="row100">
                        <div class="inputBox">
                            <button type="submit" style="background-color: black; color: white; width: 80px; height: 50px" class="btn">Send</button>
                         
                        </div>
                    </div>

                </div>
               
            </form>
           
            <!-- Form -->
        </div>
        <!-- <span id="msg">Succefully send</span> -->
        <!-- info box -->
        <div class="contact info">
          <h3>Contact Info</h3>
          <div class="infoBox">
            <div>
                <span><ion-icon name="location-outline"></ion-icon></span>
                <p>Athwalines, Surat<br>INDIA</p>
            </div>
            <div>
                <span><ion-icon name="mail-outline"></ion-icon></span>
                <a href="mailto:lorem@gmail.com">Apnashop@gmail.com</a>
            </div>
            <div>
                <span><ion-icon name="call-outline"></ion-icon></span>
                <a href="tel:+91987654323">+91 987654323
            </div>
          <ul class="sci">
            <li><a href=""></a></li>
          </ul>
          </div>
            <!-- social media link -->
            <ul class="sci">
              <li><a href="#"><ion-icon name="logo-facebook"></ion-icon></a></li>
              <li><a href="#"><ion-icon name="logo-twitter"></ion-icon></a></li>
              <li><a href="#"><ion-icon name="logo-linkedin"></ion-icon></a></li>
              <li><a href="#"><i class='bx bxl-instagram'></i></a></li>
            </ul>

        </div>
        <div class="contact map">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7440.368624858927!2d72.80515059132391!3d21.184835925824316!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be04e70a8b209e7%3A0x95f943ff9b175056!2sAthwa%20Gate%2C%20Surat%2C%20Gujarat%20395008!5e0!3m2!1sen!2sin!4v1695752720810!5m2!1sen!2sin" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

            <!-- map -->
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</header>
</body>
</html>


