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
public class AddBookController extends HttpServlet {

    private static final String ADD_BOOK_SUCCESS = "SearchController";
    private static final String ADD_BOOK_ERROR = "add_book_page.jsp";

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
        String url = ADD_BOOK_ERROR;
        BookErrorDTO bookErrorDTO = new BookErrorDTO();
        try {
            boolean check = true;
            String bookId = request.getParameter("bookId");
            if (bookId.isEmpty()) {
                bookErrorDTO.setBookIdError("ID cannot be null!!!");
                check = false;
            }

            String bookName = request.getParameter("bookName");
            if (bookName.isEmpty()) {
                bookErrorDTO.setBookNameError("Name cannot be null!!!");
                check = false;
            }
            String bookAuthor = request.getParameter("bookAuthor");
            String bookPublisher = request.getParameter("bookPublisher");
            int bookTotal = 0;
            try {
                bookTotal = Integer.parseInt(request.getParameter("bookTotal"));
            } catch (Exception e) {
                bookErrorDTO.setBookTotalError("This must be a number");
                check = false;
            }
            int bookExportYear = 0;
            try {
                if (!request.getParameter("bookExportYear").equals("")) {
                    bookExportYear = Integer.parseInt(request.getParameter("bookExportYear"));
                }
            } catch (Exception e) {
                bookErrorDTO.setBookYearExError("This must be a number");
                check = false;
            }
            if (check) {
                url = ADD_BOOK_SUCCESS;
                BookDTO bookDTO = new BookDTO(bookId, bookName, bookAuthor, bookPublisher, bookTotal, bookTotal, bookExportYear, 0);
                BookDAO.addBook(bookDTO);

            } else {
                request.setAttribute("BOOK_ERROR", bookErrorDTO);
            }

        } catch (Exception e) {
            System.out.println(e.toString());
            log(e.toString());
            if (e.toString().contains("duplicate")) {
                bookErrorDTO.setBookIdError("This ID existed!!!");
                request.setAttribute("BOOK_ERROR", bookErrorDTO);
                url = ADD_BOOK_ERROR;
            }
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
