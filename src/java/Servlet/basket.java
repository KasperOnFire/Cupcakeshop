/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Cupcake.*;
import Data.*;
import User.*;
import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author Kasper
 */
@WebServlet(name = "basket", urlPatterns = {"/basket"})
public class basket extends HttpServlet {
    
    DBConnector conn;
    DataAccessObject DAO;
    
    public basket() throws Exception {
        this.conn = new DBConnector();
        DAO = new DataAccessObject(conn);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        ArrayList<Cupcake> basket = new ArrayList();
        
        
        if(session.getAttribute("basket") != null){
            basket = (ArrayList<Cupcake>) session.getAttribute("basket");
        }
        
        float totalPrice = 0;
        
        for (Cupcake cupcake : basket) {
            totalPrice += cupcake.getPrice();
        }
        
        session.setAttribute("totalPrice", totalPrice);
        
        if(request.getParameter("order") != null){
            for (Cupcake cupcake : basket) {
                User user = (User) session.getAttribute("user");
                int topNo = DAO.getNumberOfTopping(cupcake.getTopping());
                int botNo = DAO.getNumberOfBottom(cupcake.getBottom());
                float price = cupcake.getPrice();
                DAO.createOrder(topNo, botNo, user.getUno(), price);
            }
            basket = new ArrayList();
        }
        
        session.setAttribute("basket", basket);
        request.getRequestDispatcher("/basket.jsp").forward(request, response);
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
