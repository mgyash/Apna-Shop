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
@WebServlet(urlPatterns = {"/Cart"})
public class Cart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");
//            if (con!= null) {
//                out.println("Connection Successful");
//            } else {
//                out.println(" not Connected ");
//            }   

            HttpSession session = request.getSession();
            String uid = session.getAttribute("uid").toString();
            String p_id = request.getParameter("p_id");
          out.println(uid+" "+p_id);
          
            int qty = 1;
            int c_id = 0;
            Statement stmt = con.createStatement();
            String qr1 = "select * from cart_tbl where Pid= '" + p_id + "' && Uid= '" + uid + "'";
            ResultSet rs = stmt.executeQuery(qr1);
            if (rs.next()) {
                c_id = rs.getInt(1);
                qty = rs.getInt(4);
                qty++;
                out.println(qty);
                out.println(c_id);
                String sql = "UPDATE cart_tbl set PQTY=? where cart_id='" + c_id + "'";
                PreparedStatement P = con.prepareStatement(sql);
                P.setInt(1, qty);
                int rowupdated = P.executeUpdate();
                if (rowupdated > 0) {
                    out.println("Row updated");
                    response.sendRedirect("Cart.jsp");
                } else {
                    out.println("Row  not Updated");
                    response.sendRedirect("Home.jsp");
                }
            } else {

                String sql = "INSERT INTO cart_tbl(Pid,Uid,PQTY)" + "VALUES(?,?,?)";

                PreparedStatement p = con.prepareStatement(sql);
                p.setString(1, p_id);
                p.setString(2, uid);
                p.setInt(3, qty);

                int rowsInserted = p.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("Cart.jsp");
                } else {
                    response.sendRedirect("Home.jsp");
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
