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
import java.io.PrintWriter;
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
        
        ArrayList<Cupcake> basket = (ArrayList<Cupcake>) session.getAttribute("basket");
        if (basket == null) {
            basket = new ArrayList<Cupcake>();
        }
        
        String bottom = request.getParameter("bottomHid");
        System.out.println(bottom);
        String topping = request.getParameter("toppingHid");
        System.out.println(topping);
        float price = DAO.getPriceOfCupcake(bottom, topping);
        System.out.println(price);
        Cupcake c = new Cupcake(bottom, topping, price, 1);
        basket.add(c);
        
        for (Cupcake cupcake : basket) {
            System.out.println(cupcake.getBottom());
            System.out.println(cupcake.getTopping());
            System.out.println(cupcake.getPrice());
            System.out.println(cupcake.getAmount());
        }
        
        session.setAttribute("basket", basket);
        User user = (User) request.getAttribute("user");
        int topNo = DAO.getNumberOfTopping(topping);
        int botNo = DAO.getNumberOfTopping(topping);
        //DAO.createOrder(topNo, botNo, user.getUno(), price);
        
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
