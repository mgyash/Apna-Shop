/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
@WebServlet(urlPatterns = {"/productCRUD"})
public class productCRUD extends HttpServlet {

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
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apna_shop", "root", "");
            if (con != null) {
                out.println("Connection Successful");
            } else {
                out.println(" not Connected ");
            }
            String p_name = request.getParameter("pname");
            String Desc = request.getParameter("Desc");
            String price = request.getParameter("price");
            String size = request.getParameter("size");
            String cat_name = request.getParameter("cat_name");
            String Brand_name = request.getParameter("Brand_name");
//            String img_url = request.getParameter("img_url");
            String p1 = request.getParameter("submit");
            int cat_id=0;
            String ssql = "select * from category_table where cat_name= '" +cat_name+ "'";
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(ssql);
                while(rs.next())
                {
                    cat_id=rs.getInt(1);
//                    out.println(cat_id);
                }
                      rs.close();
            if (p1.equals("Add"))
            {
                String sql = "INSERT INTO product_tbl(p_name,description,price,size,cat_id,image_url,brand)"
                        + " VALUES(?,?,?,?,?,?,?)";

                PreparedStatement P = con.prepareStatement(sql);
                Part file = request.getPart("img_url");
                    String imageFileName = file.getSubmittedFileName();
                    out.println("file name is " + imageFileName);
                    String uploadpath = ("D:/java projects/tryout/web/pimages/" + imageFileName);
                    out.println("upload file name is " + uploadpath);
                    try {
                        FileOutputStream fos = new FileOutputStream(uploadpath);
                        InputStream is = file.getInputStream();

                        byte[] data = new byte[is.available()];
                        is.read(data);
                        fos.write(data);
                        fos.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                P.setString(1, p_name);
                P.setString(2, Desc);
                P.setString(3, price);
                P.setString(4, size);
                P.setInt(5, cat_id);
                P.setString(6, imageFileName);
                P.setString(7, Brand_name);
//out.print(sql);
//                    out.println(p_name+" "+Desc+" "+price+" "+size+" "+cat_id+" "+img_url+" "+Brand_name);
                int rowupdated= P.executeUpdate();
                out.println(rowupdated);
                if (rowupdated > 0) {
                    response.sendRedirect("productadmin.jsp");
                } else {
                    out.println("data no updated");
                } 
            } 
            else if(p1.equals("Update"))
            {String P_rename=request.getParameter("p_name");
//                 out.println(p_name+" "+Desc+" "+price+" "+size+" "+cat_id+" "+img_url+" "+Brand_name+" "+p1+" "+P_rename);
                String sql="UPDATE product_tbl set p_name=?,description=?,price=?,size=?,cat_id=?,image_url=?,brand=? where p_name='"+P_rename+"'";
                
                PreparedStatement P = con.prepareStatement(sql);
                Part file = request.getPart("img_url");
                    String imageFileName = file.getSubmittedFileName();
                    out.println("file name is " + imageFileName);
                    String uploadpath = ("D:/java projects/tryout/web/pimages/" + imageFileName);
                    out.println("upload file name is " + uploadpath);
                    try {
                        FileOutputStream fos = new FileOutputStream(uploadpath);
                        InputStream is = file.getInputStream();

                        byte[] data = new byte[is.available()];
                        is.read(data);
                        fos.write(data);
                        fos.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                P.setString(1,p_name);
                P.setString(2,Desc);
                P.setString(3,price);
                P.setString(4,size);
                P.setInt(5,cat_id);
                P.setString(6,imageFileName);
                P.setString(7,Brand_name);
               
                int rowupdated= P.executeUpdate();
                if(rowupdated>0)
                {
                    out.println("Row updated");
                    response.sendRedirect("productadmin.jsp");
                }else
                {
                    out.println("Row  not Updated");
                }
            }
            else if(p1.equals("Delete"))
            {
                String s1=request.getParameter("p_name");
                String sq = "Delete from product_tbl where p_name='"+s1+"'";
                out.println(sq);
                    PreparedStatement P = con.prepareStatement(sq);
                    int rowInserted = P.executeUpdate();
                    
                    if (rowInserted > 0) {
                        out.println("Data deleted successfully");
                        response.sendRedirect("productadmin.jsp");
                    } else {
                        out.println("data no deleted");
                    }
            }
        } catch (Exception e) {
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
