/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(urlPatterns = {"/deletemessage"})
public class deletemessage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");
            if (con != null) {
                out.println("Connection Successful");
            } else {
                out.println(" not Connected ");
            }
            
            String uid=request.getParameter("uid");
            out.println(uid);
            String sql1 = "Delete from inquiry_message where message_id=" + uid + "";
            out.println(sql1);
                    PreparedStatement P = con.prepareStatement(sql1);
                    int rowInserted = P.executeUpdate();
//
                    if (rowInserted > 0) {
                        out.println("Data deleted successfully");
                        response.sendRedirect("admin.jsp");
                    } else {
                        out.println("data no deleted");
                    }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        }
    }

    