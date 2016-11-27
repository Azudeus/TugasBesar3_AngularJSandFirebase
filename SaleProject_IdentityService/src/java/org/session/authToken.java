/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.session;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.account.DBConnect;

/**
 *
 * @author user
 */
@WebServlet(name = "authToken", urlPatterns = {"/authToken"})
public class authToken extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        try {
            Connection con = DBConnect.connect();
            String key = request.getParameter("access_token");
            
             
            PreparedStatement searchToken = con.prepareStatement
                   ("Select * from token where token_key = ?");
            searchToken.setString(1, key);
            ResultSet res =searchToken.executeQuery();
            if (res.next()) {
                Date dreq = new Date(res.getTimestamp("last_access").getTime());
                Date dnow = new Date();
                long diff = (dnow.getTime()-dreq.getTime())/60000;
                if (diff<3) {
                    Timestamp param = new Timestamp(dnow.getTime());
                    PreparedStatement updateTimestamp = con.prepareStatement
                            ("UPDATE token SET last_access=? WHERE token_key=?");
                    updateTimestamp.setObject(1,dnow);
                    updateTimestamp.setString(2,key);
                    int i =updateTimestamp.executeUpdate();
                    if(i>0){
                        out.print("True");
                    }
           
                }else {
                    out.print("False");                    
                }
            }else{
                out.print("Key not Found");                    
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(authToken.class.getName()).log(Level.SEVERE, null, ex);
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
