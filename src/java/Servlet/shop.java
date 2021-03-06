package Servlet;

import Cupcake.*;
import Data.DBConnector;
import Data.DataAccessObject;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(name = "shop", urlPatterns = {"/shop"})
public class shop extends HttpServlet {

//    DBConnector conn;
//    DataAccessObject DAO;
//
//    public shop() throws Exception {
//        this.conn = new DBConnector();
//        DAO = new DataAccessObject(conn);
//    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        HttpSession session = request.getSession();

        DBConnector conn = new DBConnector();
        DataAccessObject DAO = new DataAccessObject(conn);

        ArrayList<Bottom> bottoms = DAO.getBottom();
        ArrayList<Toppings> toppings = DAO.getToppings();
        session.setAttribute("bottoms", bottoms);
        session.setAttribute("toppings", toppings);
        
        ArrayList<Cupcake> basket = new ArrayList<Cupcake>();
        
        if(session.getAttribute("basket") != null){
            basket = (ArrayList<Cupcake>) session.getAttribute("basket");
        }
        
        String bottom = request.getParameter("bottomHid");
        System.out.println(bottom);
        String topping = request.getParameter("toppingHid");
        System.out.println(topping);
        
        try {
            if (topping != null && bottom != null) {
                float price = DAO.getPriceOfCupcake(bottom, topping);
                Cupcake c = new Cupcake(bottom, topping, price, 1);
                basket.add(c);
                System.out.println(basket.size());
            } 
        } catch (Exception e) {
        }
        
        session.setAttribute("basket", basket);
        request.getRequestDispatcher("/shop.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(shop.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(shop.class.getName()).log(Level.SEVERE, null, ex);
        }
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
