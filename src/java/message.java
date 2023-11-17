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
@WebServlet(urlPatterns = {"/message"})
public class message extends HttpServlet {

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
            Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop","root","");
            if (con!= null) {
                out.println("Connection Successful");
            } else {
                out.println(" not Connected ");
            }   

            String fname =request.getParameter("FirstName");
            String lname = request.getParameter("LastName");
            String email =request.getParameter("email");
            String mob_no =request.getParameter("MobileNumber");
            String messa =request.getParameter("Messages");
            out.println(fname+" "+lname+" "+email+" "+mob_no+" "+messa);
//            out.println(pswd);
            
            String sql = "INSERT INTO inquiry_message(First_name,Last_name,Email,mobile_no"
                    + ",Message)"+"VALUES(?,?,?,?,?)";
            
            PreparedStatement p = con.prepareStatement(sql);
            p.setString(1,fname);
            p.setString(2,lname);
            p.setString(3,email);
            p.setString(4,mob_no);
            p.setString(5,messa);
            
            int rowsInserted = p.executeUpdate();
            if(rowsInserted>0)
            {
                response.sendRedirect("contact.jsp");
            }
            else
            {
                out.print("Not sended");
//                response.sendRedirect("Register.jsp");
            }

        }
        catch(Exception e)
        {
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
   