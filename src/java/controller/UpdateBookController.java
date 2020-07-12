/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.BookDAO;
import dtos.BookDTO;
import dtos.BookErrorDTO;
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
public class UpdateBookController extends HttpServlet {

    public static final String UPDATE_SUCCESS = "SearchController";
    public static final String UPDATE_ERROR = "update_book.jsp";
    //public static final String UPDATE_ERROR = "error_page.jsp";

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
        String url = UPDATE_ERROR;
        try {
            BookErrorDTO bookErrorDTO = new BookErrorDTO();
            boolean check = true;
            String bookId = request.getParameter("bookId");
            BookDTO currrentBookDTO = BookDAO.getBook(bookId);
            int currentTotal = currrentBookDTO.getTotalBook();
            int currentAvaible = currrentBookDTO.getAvailableBook();
            int currentBorrowed = currentTotal - currentAvaible;
            String bookName = request.getParameter("bookName");
            if (bookName.isEmpty()) {
                bookErrorDTO.setBookNameError("Name cannot be null!!!");
                check = false;
            }
            String bookAuthor = request.getParameter("bookAuthor");
            String bookPublisher = request.getParameter("bookPublisher");
            int yearOfExport = 0;
            if (!request.getParameter("yearOfExport").equals("")) {
                try {
                    yearOfExport = Integer.parseInt(request.getParameter("yearOfExport"));
                } catch (Exception e) {
                    bookErrorDTO.setBookYearExError("This must be a number!!!");
                }
            }
            int bookTotal = 0;
            int bookAvailable = Integer.parseInt(request.getParameter("bookAvailable"));
            try {
                bookTotal = Integer.parseInt(request.getParameter("bookTotal"));
                if (bookTotal < currentBorrowed) {
                    check = false;
                    bookErrorDTO.setBookTotalError("The number of borrowed books is larger than this number!!!");
                } else {
                    bookAvailable = bookTotal - currentBorrowed;
                }
            } catch (Exception e) {
                bookErrorDTO.setBookTotalError("This must be a number!!!");
                check = false;
            }

            if (check) {
                BookDTO bookDTO = new BookDTO(bookId, bookName, bookAuthor, bookPublisher, bookTotal, bookAvailable, yearOfExport, 0);
                BookDAO.updateBook(bookDTO);
                url = UPDATE_SUCCESS;
            } else {
                request.setAttribute("BOOK_ERROR", bookErrorDTO);
            }

        } catch (Exception e) {
            log("Error at UpdateBookController " + e);
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
