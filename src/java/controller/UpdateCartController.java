/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.BookDAO;
import dtos.BookDTO;
import dtos.CartDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class UpdateCartController extends HttpServlet {

    public final static String VIEW_CART_SUCCESS = "ViewCartController";
    public final static String VIEW_CART_ERROR = "ViewCartController";

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
        String url = VIEW_CART_SUCCESS;
        try {
            String bookId = request.getParameter("bookId");
            BookDTO bookDTO = BookDAO.getBook(bookId);
            if (bookDTO != null) {
                if (bookDTO.isIsExisted()) {
                    try {
                        int numInCart = Integer.parseInt(request.getParameter("numInCart"));
                        HttpSession session = request.getSession();
                        CartDTO cartDTO = (CartDTO) session.getAttribute("CART");
                        int availableBook = bookDTO.getAvailableBook();
                        if (numInCart >= 0) {
                            if (availableBook >= numInCart) {
                                cartDTO.updateQuantity(bookId, numInCart);
                            } else {
                                request.setAttribute("MESSAGE_CART", "This have only " + availableBook + " available books!!!");
                            }
                        } else {
                            request.setAttribute("MESSAGE_CART", "This must be a positive number!!!");
                        }

                    } catch (Exception e) {
                    }
                } else {
                    request.setAttribute("MESSAGE_CART", "This book does not exist anymore!!!");
                }
            } else {
                request.setAttribute("MESSAGE_CART", "This book does not exist anymore!!!");
            }

        } catch (Exception e) {
            System.out.println("UpdateCartController " + e);
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
