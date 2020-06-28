/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class MainController extends HttpServlet {

    public final static String LOGIN = "LoginController";
    public final static String ERROR = "error_page.jsp";
    public final static String REGISTER = "RegisterController";
    public final static String LOGOUT = "LogoutController";
    public final static String SEARCH = "SearchController";
    public final static String UPDATE_BOOK_PAGE = "update_book.jsp";
    public final static String UPDATE_BOOK = "UpdateBookController";
    public final static String DELETE_BOOK = "DeleteBookController";
    public final static String ADD_BOOK = "AddBookController";

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
        String url = ERROR;
        try {
            String action = request.getParameter("btnAction");
            switch (action) {
                case "Login":
                    url = LOGIN;
                    break;
                case "Create account":
                    url = REGISTER;
                    break;
                case "Search":
                    url = SEARCH;
                    break;
                case "Logout":
                    url = LOGOUT;
                    break;
                case "Update Page":
                    url = UPDATE_BOOK_PAGE;
                    break;
                case "Update Book":
                    url = UPDATE_BOOK;
                    break;
                case "Delete Book":
                    url = DELETE_BOOK;
                    break;
                case "Add Book":
                    url = ADD_BOOK;
                    break;
            }
        } catch (Exception e) {
            System.out.println("Error at MainController " + e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
