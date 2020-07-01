/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.BookDAO;
import daos.OrderDAO;
import daos.OrderDetailDAO;
import dtos.BookDTO;
import dtos.CartDTO;
import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import dtos.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class BorrowBookController extends HttpServlet {

    public final static String BORROW_BOOK_CART_VIEW = "view_cart.jsp";
    public final static String BORROW_BOOK_CART_INFO = "ShowBookInfoController";
    public final static String BORROW_BOOK_CART_SEARCH = "SearchController";
    public final static String BORROW_BOOK_CART_ERROR = "error_page.jsp";

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
        String url = BORROW_BOOK_CART_ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO userDTO = (UserDTO) session.getAttribute("USER_DTO");
            String userId = userDTO.getUserId();
            //get current date
            DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
            Date currentDate = new Date();
            String borrowDate = dateFormat.format(currentDate);
            //get return date (1 month later)
            Calendar c = Calendar.getInstance();
            c.setTime(currentDate);
            c.add(Calendar.MONTH, 1);
            Date currentDatePlusOne = c.getTime();
            String returnDate = dateFormat.format(currentDatePlusOne);
            OrderDTO orderDTO = new OrderDTO(userId, borrowDate, returnDate);
            int orderId = OrderDAO.addOrder(orderDTO);

            int quantity = 1;
            if (request.getParameter("bookId") != null) {
                String bookId = request.getParameter("bookId");

                if (request.getParameter("quantityInCart") != null) {
                    try {
                        quantity = Integer.parseInt(request.getParameter("quantityInCart"));
                        int available = Integer.parseInt((String) request.getParameter("available"));
                        if (quantity <= available && quantity > 0) {
                            request.setAttribute("AVAILABLE", available - quantity);
                            OrderDetailDTO orderDetailDTO = new OrderDetailDTO(orderId, bookId, quantity);
                            OrderDetailDAO.addOrderDetail(orderDetailDTO);
                            BookDAO.updateAvailable(bookId, quantity);
                            request.setAttribute("BORROW_MESSAGE", "Borrow successfully!!!");
                        } else {
                            request.setAttribute("BORROW_MESSAGE", "The number of this book is limited!!!");
                        }
                    } catch (Exception e) {
                        request.setAttribute("BORROW_MESSAGE", "Please enter quantity!!!");
                    }
                    url = BORROW_BOOK_CART_INFO;
                } else {
                    OrderDetailDTO orderDetailDTO = new OrderDetailDTO(orderId, bookId, quantity);
                    OrderDetailDAO.addOrderDetail(orderDetailDTO);
                    BookDAO.updateAvailable(bookId, quantity);
                    request.setAttribute("BORROW_MESSAGE", "Borrow successfully!!!");
                    url = BORROW_BOOK_CART_SEARCH;
                }

            } else {
                CartDTO cartDTO = (CartDTO) session.getAttribute("CART");
                if (cartDTO != null) {
                    Set setKey = cartDTO.getCart().keySet();
                    Iterator it = setKey.iterator();
                    List<OrderDetailDTO> listDetail = new ArrayList<>();
                    while (it.hasNext()) {
                        BookDTO bookDTO = cartDTO.getCart().get((String) it.next());
                        OrderDetailDTO orderDetailDTO = new OrderDetailDTO(orderId, bookDTO.getBookId(), bookDTO.getNumInCart());
                        listDetail.add(orderDetailDTO);
                    }
                    OrderDetailDAO.addOrderDetail(listDetail);
                    BookDAO.updateAvailable(listDetail);
                    request.setAttribute("BORROW_MESSAGE", "Borrow successfully!!!");
                    session.setAttribute("CART", null);
                    url = BORROW_BOOK_CART_VIEW;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
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
