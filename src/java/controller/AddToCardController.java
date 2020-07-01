/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dtos.BookDTO;
import dtos.CartDTO;
import dtos.UserDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class AddToCardController extends HttpServlet {

    public final static String ADD_TO_CARD_SEARCH = "SearchController";
    public final static String ADD_TO_CARD_INFOR = "book_infor.jsp";
    public final static String ADD_TO_CARD_ERROR = "error_page.jsp";

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
        String url = ADD_TO_CARD_ERROR;
        try {
            String bookId = request.getParameter("bookId");
            String bookName = request.getParameter("bookName");
            int availableBook = Integer.parseInt(request.getParameter("available"));
            HttpSession session = request.getSession();
            BookDTO bookDTO = new BookDTO(bookId, bookName, 1, availableBook);
            CartDTO cartDTO = (CartDTO) session.getAttribute("CART");
            if (cartDTO == null) {
                cartDTO = new CartDTO("", null);
            }
            if (request.getParameter("quantityInCart") != null) {
                int numInCart = 0;
                try {
                    numInCart = Integer.parseInt(request.getParameter("quantityInCart"));
                    if (numInCart > 0 && numInCart <= availableBook) {
                        if (cartDTO.addToCard(bookDTO, numInCart)) {
                            session.setAttribute("CART", cartDTO);
                            request.setAttribute("MESSAGE_CART", "You add " + bookName + " successfully!!!");
                            request.setAttribute("NUM_IN_CARD", numInCart);
                        } else {
                            request.setAttribute("MESSAGE_CART", "The number of " + bookName + " is limmited!!!");
                        }
                    } else {
                        request.setAttribute("MESSAGE_CART", "The number of " + bookName + " is limmited!!!");
                    }
                } catch (Exception e) {
                    request.setAttribute("MESSAGE_CART", "This must be an number!!!");
                } finally {
                    url = ADD_TO_CARD_INFOR;
                    request.setAttribute("AVAILABLE", availableBook);
                }
            } else {
                int numInCart = 0;
                if (cartDTO.getCart() != null) {
                    if (cartDTO.getCart().containsKey(bookId)) {
                        numInCart = cartDTO.getCart().get(bookId).getNumInCart();
                    }
                }

                if (numInCart == availableBook) {
                    request.setAttribute("MESSAGE_CART", "The number of " + bookName + " is limmited!!!");
                } else {
                    request.setAttribute("MESSAGE_CART", "You add " + bookName + " successfully!!!");
                    cartDTO.addToCard(bookDTO, 1);

                }
                session.setAttribute("CART", cartDTO);
                url = ADD_TO_CARD_SEARCH;
            }
        } catch (Exception e) {
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
