/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author Personal
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
         JSONObject jsonResponse = new JSONObject();
         try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();  
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            int postal = Integer.parseInt(request.getParameter("postal"));
            int number = Integer.parseInt(request.getParameter("number"));
            
            Connection con = DBConnect.connect();
            PreparedStatement ps =con.prepareStatement
                ("INSERT INTO account(username,email,password,name,address,postal,number)values (?,?,?,?,?,?,?)");
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, name);
            ps.setString(5, address);
            ps.setInt(6, postal);
            ps.setInt(7, number);
            
            PreparedStatement dupecheck = con.prepareStatement
                   ("Select * from account where email = ? and password = ?");
            dupecheck.setString(1, email);
            dupecheck.setString(2, password);
            ResultSet check =dupecheck.executeQuery();
            if (!check.next()) {
                int i =ps.executeUpdate();
                if (i>0) {
                    
                    PreparedStatement newrec =con.prepareStatement
                         ("select * from account where email=? and password=?");
                    newrec.setString(1, email);
                    newrec.setString(2, password);

                    ResultSet res =newrec.executeQuery();
                    if (res.next()){
                        int retid = res.getInt("account_id");
                        jsonResponse.put("id",retid);
                        jsonResponse.put("username",Login.findUsernamebyId(retid));
                        out.write(jsonResponse.toString());
                        out.flush();
                    }
     
                } else {
                    out.println("Error Registration");
                    RequestDispatcher rs = request.getRequestDispatcher("");
                    rs.include(request,response);
                }
            }else {
                out.println("There is another same account"
                        + "");
                RequestDispatcher rs = request.getRequestDispatcher("");
                rs.include(request,response);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
