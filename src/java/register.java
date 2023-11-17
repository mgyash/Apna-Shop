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
import javafx.scene.control.Alert;
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
@WebServlet(urlPatterns = {"/register"})
public class register extends HttpServlet {

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
            Connection con =null;
            Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop","root","");
            if (con!= null) {
                out.println("Connection Successful");
            } else {
                out.println(" not Connected ");
            }
            String uname=request.getParameter("Uname") ;
            String Email=request.getParameter("Email");
            String pno=request.getParameter("Ph_no");
            String pswd=request.getParameter("pswd");
            out.println(uname+" "+Email+" "+pno+" "+pswd+" ");
            String uvalidate = null;
           
//                        Statement stmt = con.createStatement();
//                        ResultSet rs = stmt.executeQuery("select * from user_details where User_name='"+uname+"'");
//
//                        while (rs.next()) {
//                            if(rs.getString(2).equalsIgnoreCase(uname))
//                            {
////                                response.sendRedirect("Register.jsp");
//                               uvalidate="username is not available";
//                            }
//                        }
//    if(uvalidate.equals("username is not available")){
//        out.println("username is not available");
//    }
//    else{
                  
            out.println(uname+"  "+Email+" "+pno+" "+pswd);
            String sql = "INSERT INTO user_details(User_name,U_email,Phone_no"
                    + ",Password)"+"VALUES(?,?,?,?)";
            
            PreparedStatement p = con.prepareStatement(sql);
            p.setString(1,uname);
            p.setString(2,Email);
            p.setString(3,pno);
            p.setString(4,pswd);
            
            int rowsInserted = p.executeUpdate();
            if(rowsInserted>0)
            {
                response.sendRedirect("Login.jsp");
            }
            else
            {
                response.sendRedirect("Register.jsp");
            }
            
        }
//        }
        catch(Exception e){
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
