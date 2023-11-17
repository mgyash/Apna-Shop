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
import javax.servlet.http.*;

/**
 *
 * @author LENOVO
 */
@WebServlet(urlPatterns = {"/categorycrud"})
public class categorycrud extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
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
            String c_name=request.getParameter("cname");
            String category=request.getParameter("cat_name");
            String p1=request.getParameter("submit");
            out.println(c_name);
            out.println(category);
            
//            String sql1="SELECT cat_id from category_table where cat_name="+category+"";
////            Statement stmt=con.createStatement();
////            ResultSet rs=stmt.executeQuery("");
//            out.println(sql1);
////            out.println(rs.getInt(1));
            if(p1.equals("Add"))
            {
                String sql ="INSERT INTO category_table(cat_name)VALUES(?)";
                PreparedStatement P = con.prepareStatement(sql);
                P.setString(1,c_name);
                int rowupdated= P.executeUpdate();
                if(rowupdated>0)
                {
                    out.println("Row inserted");
                    response.sendRedirect("category.jsp");
                }else
                {
                    out.println("Row  not inserted");
                }
            }
            else if(p1.equals("Update"))
            {
                
                String sql="UPDATE category_table set cat_name='"+c_name+"' where cat_name ='"+category+"'";
                
                PreparedStatement P = con.prepareStatement(sql);
//                P.setString(1,c_name);
                int rowupdated= P.executeUpdate();
                if(rowupdated>0)
                {
                    out.println("Row updated");
                    response.sendRedirect("category.jsp");
                }else
                {
                    out.println("Row  not Updated");
                }
            }   else if(p1.equals("Delete"))
                {
                    String sq = "Delete from category_table  where cat_name='"+category+"'";
                    PreparedStatement P = con.prepareStatement(sq);
                    
                    int rowInserted = P.executeUpdate();
                    
                    if (rowInserted > 0) {
                        out.println("Data deleted successfully");
                        response.sendRedirect("category.jsp");
                    } else {
                        out.println("data no deleted");
                    }
                    
                }
            
        }
        catch(Exception e)
        {
            
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
