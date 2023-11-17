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
import java.util.jar.Attributes.Name;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;


/**
 *
 * @author LENOVO
 */
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop","root","");
            if (con!= null) {
                out.println("Connection Successful");
            } else {
                out.println(" not Connected ");
            }   
           
            
            
            String uname =request.getParameter("Name");
            String pswd = request.getParameter("Password");
//            out.println(uname);
//            out.println(pswd);
            HttpSession session = request.getSession();
            
            if(uname.equalsIgnoreCase("admin") && pswd.equalsIgnoreCase("admin"))
            {
                session.setAttribute("uname", "admin");
                response.sendRedirect("admin.jsp");
            }
            else{
                Statement stmt = con.createStatement();
                String qr ="select * from user_details where User_name= '"+uname+"' && password = '"+pswd+"'";
                ResultSet rs = stmt.executeQuery(qr);
                if(rs.next())
                {
//                    out.println(rs.getString(1));
                    session.setAttribute("uid", rs.getString(1));
                    session.setAttribute("uname", uname);
                    session.setAttribute("paswd",pswd);
                    response.sendRedirect("Home.jsp");
                    
                }else
                {
                    response.sendRedirect("Login.jsp");
                }
            }
        }
        catch(Exception e)
        {
           System.out.println(e.getMessage()); 
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
