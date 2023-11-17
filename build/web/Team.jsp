<%-- 
    Document   : Team
    Created on : 2 Oct, 2023, 6:30:40 PM
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
        <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
        <!--<link href="css/style.css" rel="stylesheet" type="text/css"/>-->
        <link href="css/Team1.css" rel="stylesheet" type="text/css"/>
        <title>Team</title>
</head>
<body>


        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if (session.getAttribute("uname") == null) {
                response.sendRedirect("Login.jsp");
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
			<li>
				<a href="productadmin.jsp">
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
			<li  class="active">
				<a href="Team.jsp">
					<i class='bx bxs-group' ></i>
					<span class="text">Our Team</span>
				</a>
			</li>
		</ul>
		<ul class="side-menu">
		
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
				<!--<img src="img/people.png">-->
			</a>
		</nav>
		<!-- NAVBAR -->

	
	</section>
	<!-- CONTENT -->
	
        <section class="section">
        <div class="row">
            <h1>Our Team</h1>
        </div>
        <div class="row">
            <!-- column 1 -->
            <div class="column">
                <div class="card">
                    <div class="img-container">
                        <img src="jsp/person1.jpg" alt=""/>
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
                        <img src="jsp/person2.jpg" alt=""/>
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
            <!-- column 3 -->
            <div class="column">
                <div class="card">
                    <div class="img-container">
                        <img src="jsp/person3.jpg" alt=""/>
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
        </div>
    </section>
    
        <script src="javascirpt/script.js" type="text/javascript"></script>
	
</body>
</html>