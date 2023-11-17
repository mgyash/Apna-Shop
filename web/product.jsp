<%-- 
    Document   : product
    Created on : 28 Sep, 2023, 8:19:05 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- ====== Favicon ====== -->
     <link rel="shortcut icon" href="./images/favicon-32x32.png" type="image/x-icon">
     <!-- ====== Boxicons ====== -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css">
     <!-- ====== Swiper CSS ====== -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
 
     <!-- ====== Custom CSS ====== -->
     <link rel="stylesheet" href="./css/product1.css"/>
    <title>Product 1</title>
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
                <div class="icon d-flex"><i class='bx bx-search'></i></div>
                <div class="icon d-flex user-icon"><i class='bx bx-user'></i></div>
                <div class="icon d-flex">
                  <i class='bx bx-bell'></i>
                  <span></span>
                </div>
              </div>
  
              <div class="hamburger">
                <i class='bx bx-menu-alt-right'></i>
              </div>
            </div>
          </nav>
  </header>


  <section id="prodetails" class="section-p1">
    <div class="single-pro-image">
      <img src="jsp/f1.jpg" width="100%" id="MainImg" alt="" />

      <div class="small-img-group">
        <div class="small-img-col">
          <img
            src="jsp/f2.jpg"
            width="100%"
            class="small-img"
            alt=""
          />
        </div>
        <div class="small-img-col">
          <img
            src="jsp/f3.jpg"
            width="100%"
            class="small-img"
            alt=""
          />
        </div>
        <div class="small-img-col">
          <img
            src="jsp/f4.jpg"
            width="100%"
            class="small-img"
            alt=""
          />
        </div>
        <div class="small-img-col">
          <img
            src="jsp/f5.jpg"
            width="100%"
            class="small-img"
            alt=""
          />
        </div>
      </div>
    </div>
    <div class="single-pro-details">
      <h6>Home / T-shirt</h6>
      <h4>Men's Fashion T Shirt</h4>
      <h2>$139.00</h2>
      <select>
        <option>Select Size</option>
        <option>XL</option>
        <option>XXL</option>
        <option>Small</option>
        <option>Large</option>
      </select>
      <input type="number" value="1" />
      <button class="normal">Add To Cart</button>
      <h4>Product Details</h4>
      <span
        >Lorem ipsum dolor sit amet consectetur, adipisicing elit. Soluta quos
        sit quam excepturi voluptate optio nemo eligendi voluptatibus! Aliquid
        consectetur quidem commodi nam nostrum. Error dolor corporis qui
        fugiat autem!</span>
    </div>
  </section>

 




  

   <!-- ====== Footer ====== -->
<footer class="footer">
    <div class="row container">
      <div class="col">
        <div class="logo d-flex">
          <img src="./images/brandlogo.png" alt="">
        </div>
        <p>Lorem ipsum dolor sit amet consectetur </br> elit. Perferendis harum cupiditate!</p>
        <div class="icons d-flex">
          <div class="icon d-flex"><i class='bx bxl-twitter'></i></div>
          <div class="icon d-flex"><i class='bx bxl-instagram'></i></div>
          <div class="icon d-flex"><i class='bx bxl-youtube'></i></div> 
        </div>
        <p class="color">
  Copyright 2023 </br>
  Lorem ipsum dolor sit amet.
        </p>
      </div>
      <div class="col">
        <div>
          <h4>Product</h4>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
        </div>
        <div>
          <h4>Category</h4>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
        </div>
        <div>
          <h4>My Account</h4>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
          <a href="">Download</a>
        </div>
        <div>
          <h4>Contact Us</h4>
          <div class="d-flex">
            <div class="icon"><i class='bx bxs-map'></i></div>
              <span>123 Street Trafford, London , UK</span>
            
          </div>
          <div class="d-flex">
            <div class="icon"><i class='bx bxs-envelope'></i></div>
              <span>info@sitename.com</span>
            
          </div>
          <div class="d-flex">
            <div class="icon"><i class='bx bxs-phone'></i></div>
              <span>+456 789 789 001</span>
            
          </div>
        </div>
      </div>
    </div>
  </footer>
  <script>
    let MainImg = document.getElementById("MainImg");
    let smallimg = document.getElementsByClassName("small-img");

    smallimg[0].onclick = function(){
        MainImg.src = smallimg[0].src;
    }
    smallimg[1].onclick = function(){
        MainImg.src = smallimg[1].src;
    }
    smallimg[2].onclick = function(){
        MainImg.src = smallimg[2].src;
    }
    smallimg[3].onclick = function(){
        MainImg.src = smallimg[3].src;
    }
</script>


  
</body>
</html>
