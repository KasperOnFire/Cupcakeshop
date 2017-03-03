package Servlet;

import Data.DBConnector;
import Data.DataAccessObject;
import User.Password;
import User.User;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Password pass = new Password();

        DBConnector conn = new DBConnector();
        DataAccessObject DAO = new DataAccessObject(conn);

        User user = DAO.getUserByUsername(username);
        if (session.getAttribute("loggedIn") == null) {
            session.setAttribute("loggedIn", false);
        }

        if (!(Boolean) session.getAttribute("loggedIn")) {
            if (user.getHashedPW().equals(pass.get_SHA_512_SecurePassword(password, user.getSalt()))) {
                session.setAttribute("loggedIn", true);
                session.setAttribute("user", user);
                session.setAttribute("username", user.getUname());
                getServletContext().getRequestDispatcher("/test.jsp").forward(request, response);                
            }else{
                String eMessage = "Wrong username / password";
                request.setAttribute("errorCode", eMessage);
                getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            String eMessage = "Already logged in!";
            request.setAttribute("errorCode", eMessage);
            getServletContext().getRequestDispatcher("/test.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
