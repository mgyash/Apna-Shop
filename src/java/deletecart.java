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
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
@WebServlet(urlPatterns = {"/deletecart"})
public class deletecart extends HttpServlet {

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
            HttpSession session = request.getSession();
            String uid = session.getAttribute("uid").toString();
            String p_id = request.getParameter("pid");
//          out.println(uid+" "+p_id);
            int qty = 1;
            int c_id = 0;
            Statement stmt = con.createStatement();
            String qr1 = "select * from cart_tbl where Pid= '" + p_id + "' && Uid= '" + uid + "'";
            out.println(qr1);
            ResultSet rs = stmt.executeQuery(qr1);
            if (rs.next()) {
                c_id = rs.getInt(1);
                qty = rs.getInt(4);
                qty--;
//                out.println(qty);
//                out.println(c_id);
                if (qty > 0) {
                    String sql = "UPDATE cart_tbl set PQTY=? where cart_id='" + c_id + "'";
                    PreparedStatement P = con.prepareStatement(sql);
                    P.setInt(1, qty);
                    int rowupdated = P.executeUpdate();
                    if (rowupdated > 0) {
                        out.println("Row updated");
                        response.sendRedirect("Cart.jsp");
                    } else {
                        out.println("Row  not Updated");
//                    response.sendRedirect("Home.jsp");
                    }
                } else {
                    String sql1 = "Delete from cart_tbl where cart_id='" + c_id + "'";
                    PreparedStatement P = con.prepareStatement(sql1);
                    int rowInserted = P.executeUpdate();

                    if (rowInserted > 0) {
                        out.println("Data deleted successfully");
                        response.sendRedirect("Cart.jsp");
                    } else {
                        out.println("data no deleted");
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
/**
 * Handles the HTTP <code>POST</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
