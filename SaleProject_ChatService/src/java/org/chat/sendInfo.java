/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.chat;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Personal
 */
@WebServlet(name = "sendInfo", urlPatterns = {"/sendInfo"})
public class sendInfo extends HttpServlet {

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
        try{
            PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            String fbtoken = request.getParameter("fbtoken");
            String username = request.getParameter("username");
            out.println("abc");
            Connection con = DBChatConnect.connect();
            PreparedStatement ps =con.prepareStatement
                    ("INSERT INTO registry(username,fbtoken) values (?,?)");
            ps.setString(1,username);
            ps.setString(2,fbtoken);
            
            PreparedStatement dupecheck = con.prepareStatement
                   ("Select * from registry where username=? AND fbtoken=?");
            dupecheck.setString(1, username);
            dupecheck.setString(2, fbtoken);
            ResultSet check =dupecheck.executeQuery();
            if (!check.next()) {
                int i =ps.executeUpdate();
                if (i>0) {
                    out.println("Success");
                }else{
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                }
            }else {
                response.setStatus(HttpServletResponse.SC_CONFLICT);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            PrintWriter out = response.getWriter();
            out.println(ex);
            
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
