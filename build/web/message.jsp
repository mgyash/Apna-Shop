<%-- 
    Document   : message
    Created on : 19 Oct, 2023, 11:45:29 PM
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
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
      <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!--Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
        <link href="css/message.css" rel="stylesheet" type="text/css"/>

	<title>AdminHub</title>
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
			<!-- <li>
				<a href="#">
					<i class='bx bxs-doughnut-chart' ></i>
					<span class="text">Analytics</span>
				</a>
			</li> -->
			<li>
				<a href="category.jsp">
					<i class='bx bx-category'></i>
					<span class="text">Category Management</span>
				</a>
			</li>
			<li>
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
                        <a href="message.jsp" class="notification" >
				<i class='bx bxs-bell active' >
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
				</i>
			</a>
			<a href="#" class="profile">
                           <span><i class='bx bxs-user-circle'></i></span>
			</a>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Inquiry Message</h1>
					
				</div>
<!--				 <a href="#" class="btn-download">
					<i class='bx bxs-cloud-download' ></i>
					<span class="text">Download PDF</span>
				</a> -->
			

			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>OUR USERS</h3>
						<!-- <i class='bx bx-search' ></i> -->
						<!-- <i class='bx bx-filter' ></i> -->
					</div>
					<table>
						<thead>
							<tr>
								<th>Message ID</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
								<th>Phone NO</th>
                                                                <th>Message</th>
                                                                
								
							</tr>
						</thead>
						<tbody>
							<%
                    try {
                        Connection con = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");

                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from inquiry_message");

                        while (rs.next()) {
                            out.println(" <tr >");
                            out.println("<td>" + rs.getInt(1) + "</td>");
                            out.println("<td>" + rs.getString(2) + "</td>");
                            out.println("<td>" + rs.getString(3) + "</td>");
                            out.println("<td>" + rs.getString(4) + "</td>");
                            out.println("<td>" + rs.getString(5) + "</td>");
                            out.println("<td>" + rs.getString(6) + "</td>");
                            out.println("<td>");
                            out.println("<a class=btn href=deletemessage?uid="+rs.getString(1)+"><button type='button' values='delete' class='btn btn-danger'>Delete</button></a>");
                            out.println("<td>");
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
				</div>
				
			</div>
		</main>
		<!-- MAIN 
	</section>
	<!-- CONTENT -->
	

        <script src="javascirpt/script.js" type="text/javascript"></script>
</body>
</html>
