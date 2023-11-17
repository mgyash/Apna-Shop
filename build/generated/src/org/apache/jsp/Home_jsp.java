package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class Home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\" />\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("        <!-- ====== Favicon ====== -->\n");
      out.write("        <link rel=\"shortcut icon\" href=\"jsp/favicon-32x32.png\" type=\"image/x-icon\">\n");
      out.write("        <!-- ====== Boxicons ====== -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css\">\n");
      out.write("        <!-- ====== Swiper CSS ====== -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css\" />\n");
      out.write("\n");
      out.write("        <!-- ====== Custom CSS ====== -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/styles.css\"/>\n");
      out.write("        <title>Apna shop</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body> \n");
      out.write("        <!-- ====== Header ====== -->\n");
      out.write("        <header class=\"header\">\n");
      out.write("            <!-- ====== NAvigation ====== -->\n");
      out.write("            <nav class=\"navbar\">\n");
      out.write("                <div class=\"row container d-flex\">\n");
      out.write("                    <div class=\"logo\">\n");
      out.write("                        <img class=\"image\" src=\"./jsp/brandlogo.png\" alt=\"\">\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"nav-list d-flex\">\n");
      out.write("                        <a href=\"Home.jsp\">Home</a>\n");
      out.write("                        <a href=\"shop.jsp\">Shop</a>\n");
      out.write("                        <a href=\"about.jsp\">About</a>\n");
      out.write("\n");
      out.write("                        <a href=\"contact.jsp\">Contact</a>\n");
      out.write("                        <div class=\"close\">\n");
      out.write("                            <i class=\"bx bx-x\"></i>\n");
      out.write("                        </div>\n");
      out.write("                        <a href=\"\" class=\"user-link\">Login</a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"icons d-flex\">\n");
      out.write("\n");
      out.write("                        <div class=\"icon d-flex user-icon\">\n");
      out.write("                            <a class=\"btn\" href=\"userPage.jsp\"><i class='bx bx-user'></i></a></div>\n");
      out.write("                        <div class=\"icon d-flex\">\n");
      out.write("                            <a class=\"btn\" href=\"Cart.jsp\"><i class='bx bx-cart'></i></a>\n");
      out.write("                           \n");
      out.write("                        </div>\n");
      out.write("                        <li>\n");
      out.write("                            ");

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
                    
                            
      out.write("\n");
      out.write("                </li>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"hamburger\">\n");
      out.write("                        <i class='bx bx-menu-alt-right'></i>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("            <!--- HERO --->\n");
      out.write("            <!--- HERO --->\n");
      out.write("            <div class=\"hero\">\n");
      out.write("                <div class=\"row container d-flex\">\n");
      out.write("                    <div class=\"col\">\n");
      out.write("                        <span class=\"subtitle\">Limited Time only For Winter</span>\n");
      out.write("                        <h1>fash<span class=\"i\">i</span>on</h1>\n");
      out.write("                        <p>LOOK YOUR BEST ON YOUR BEST DAY</p>\n");
      out.write("                        <button class=\"btn\" >Explore Now!</button>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <img src=\"jsp/hero-1.png\" alt=\"\"/>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- ====== New Arrival ====== -->\n");
      out.write("        <section class=\"section new-arrival\">\n");
      out.write("            <div class=\"title\">\n");
      out.write("                <span>New Arrival</span>\n");
      out.write("                <h2>Latest Collection</h2>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"row container\">\n");
      out.write("                <div class=\"col col-1\">\n");
      out.write("                    <img src=\"jsp/poster-1.png\" alt=\"\" />\n");
      out.write("                    <h3>\n");
      out.write("                        2021 Trends </br>\n");
      out.write("                        Women's Smart Skirt\n");
      out.write("                    </h3>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col col-2\">\n");
      out.write("                    <img src=\"jsp/poster-2.png\" alt=\"\" />\n");
      out.write("                    <h3>\n");
      out.write("                        2021 Trends</br>\n");
      out.write("                        Women's Smart Skirt   \n");
      out.write("                    </h3>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col col-3\">\n");
      out.write("                    <img src=\"jsp/poster-3.png\" alt=\"\" />\n");
      out.write("                    <h3>\n");
      out.write("                        2021 Trends</br>\n");
      out.write("                        Women's Smart Shirt</br>\n");
      out.write("                        <span>Discover More:</span>\n");
      out.write("                    </h3>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <!-- ====== Categories ====== -->\n");
      out.write("\n");
      out.write("        <section class=\"section categories\">\n");
      out.write("            <div class=\"title\">\n");
      out.write("                <span>COLLECTION</span>\n");
      out.write("                <h2>2021 Latest Collection</h2>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"products container\">\n");
      out.write("\n");
      out.write("                ");
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
                
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </section>  \n");
      out.write("\n");
      out.write("        <!-- ====== Statistics ====== -->\n");
      out.write("\n");
      out.write("        <section class=\"section statistics\">\n");
      out.write("            <div class=\"title\">\n");
      out.write("                <span>STATS</span>\n");
      out.write("                <h2>Our Statistics</h2>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"row container\">\n");
      out.write("                <div class=\"col\">\n");
      out.write("                    <div class=\"icon\"><i class='bx bxs-check-square'></i></div>\n");
      out.write("                    <h3>Easy Order System</h3>\n");
      out.write("                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit, sed.</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col\">\n");
      out.write("                    <div class=\"icon\"><i class='bx bxs-user'></i></div>\n");
      out.write("                    <h3>On Time Delievery</h3>\n");
      out.write("                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit, sed.</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col\">\n");
      out.write("                    <div class=\"icon\"><i class='bx bxs-dollar-circle'></i></div>\n");
      out.write("                    <h3>Money Back Gaurantee</h3>\n");
      out.write("                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit, sed.</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col\">\n");
      out.write("                    <div class=\"icon\"><i class='bx bxs-user '></i></div>\n");
      out.write("                    <h3>24/7 Customer Support</h3>\n");
      out.write("                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit, sed.</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- ====== Blogs ====== -->\n");
      out.write("        <section class=\"section blog\">\n");
      out.write("            <div class=\"title\">\n");
      out.write("                <span>BLOGS</span>\n");
      out.write("                <h2>Latest News</h2>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"row container\">\n");
      out.write("                <div class=\"col\">\n");
      out.write("                    <div class=\"top\">\n");
      out.write("                        <img src=\"jsp/blog-1.png\" alt=\"\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"bottom\">\n");
      out.write("                        <h3>Trendy</h3>\n");
      out.write("                        <h4>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis, ipsam?</h4>\n");
      out.write("                        <span>10 January 2022</span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col\">\n");
      out.write("                    <div class=\"top\">\n");
      out.write("                        <img src=\"jsp/blog-2.png\" alt=\"\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"bottom\">\n");
      out.write("                        <h3>Trendy</h3>\n");
      out.write("                        <h4>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis, ipsam?</h4>\n");
      out.write("                        <span>10 January 2022</span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col\">\n");
      out.write("                    <div class=\"top\">\n");
      out.write("                        <img src=\"jsp/blog-3.png\" alt=\"\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"bottom\">\n");
      out.write("                        <h3>Trendy</h3>\n");
      out.write("                        <h4>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Blanditiis, ipsam?</h4>\n");
      out.write("                        <span>10 January 2022</span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <!-- ====== Footer ====== -->\n");
      out.write("        <footer class=\"footer\">\n");
      out.write("            <div class=\"row container\">\n");
      out.write("                <div class=\"col\" style=\"margin-top: -110px\">\n");
      out.write("                    <div class=\"logo d-flex\">\n");
      out.write("                        <img src=\"./images/brandlogo.png\" alt=\"\">\n");
      out.write("                    </div>\n");
      out.write("                    <p>Lorem ipsum dolor sit amet consectetur </br> elit. Perferendis harum cupiditate!</p>\n");
      out.write("                    <div class=\"icons d-flex\">\n");
      out.write("                        <div class=\"icon d-flex\"><i class='bx bxl-twitter'></i></div>\n");
      out.write("                        <div class=\"icon d-flex\"><i class='bx bxl-instagram'></i></div>\n");
      out.write("                        <div class=\"icon d-flex\"><i class='bx bxl-youtube'></i></div> \n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                <div class=\"col\">\n");
      out.write("                    <div>\n");
      out.write("                        <h4>Product</h4>\n");
      out.write("                        \n");
      out.write("                        ");
            try {
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
                
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <h4>Category</h4>\n");
      out.write("                        ");
            try {
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
                
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <h4>My Account</h4>\n");
      out.write("                        <a href=\"userPage.jsp\">");

                            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                            if (session.getAttribute("uname") == null) {
//                                response.sendRedirect("Login.jsp");
                            } else {
//                                out.println("<a href='categoryPage.jsp?catId="</a>");

                                out.println(session.getAttribute("uname").toString());
                            }


                            
      out.write("</a>\n");
      out.write("                    </div>\n");
      out.write("                    <div>\n");
      out.write("                        <h4>Contact Us</h4>\n");
      out.write("                        <div class=\"d-flex\">\n");
      out.write("                            <div class=\"icon\"><i class='bx bxs-map'></i></div>\n");
      out.write("                            <span>ATHWA GATE,SURAT,GUJARAT</span>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"d-flex\">\n");
      out.write("                            <div class=\"icon\"><i class='bx bxs-envelope'></i></div>\n");
      out.write("                            <span>Apnashop@gmail.com</span>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"d-flex\">\n");
      out.write("                            <div class=\"icon\"><i class='bx bxs-phone'></i></div>\n");
      out.write("                            <span>02612 24 0170</span>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- ====== Login and Signup Form ====== -->\n");
      out.write("\n");
      out.write("        <!-- ====== SwiperJs ====== -->\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js\"></script>\n");
      out.write("        <!-- ====== Custom Script ====== -->\n");
      out.write("        <script src=\"javascirpt/main.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"javascirpt/product.js\" type=\"text/javascript\"></script>\n");
      out.write("        <a href=\"products.json\"></a>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
