/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.UserDAO;
import dtos.PasswordErrorDTO;
import dtos.UserDTO;
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
public class ChangePasswordController extends HttpServlet {

    public static final String CHANGE_PASS_SUCCESS = "login.jsp";
    public static final String CHANGE_PASS_ERROR = "change_pass_page.jsp";

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
        String url = CHANGE_PASS_ERROR;
        try {
            boolean check = true;
            HttpSession session = request.getSession();
            UserDTO userDTO = (UserDTO) session.getAttribute("USER_DTO");
            String userId = userDTO.getUserId();
            String currentPass = request.getParameter("currentPass");
            String newPass = request.getParameter("newPass");
            String reNewPass = request.getParameter("reNewPass");
            PasswordErrorDTO passwordErrorDTO = new PasswordErrorDTO();
            if (currentPass.equals("")) {
                check = false;
                passwordErrorDTO.setCurrenPassError("this field cannot be empty!!!");
            }
            if (newPass.equals("")) {
                check = false;
                passwordErrorDTO.setNewPassError("this field cannot be empty!!!");
            }
            if (reNewPass.equals("")) {
                check = false;
                passwordErrorDTO.setReNewPassError("this field cannot be empty!!!");
            }
            if (!newPass.equals(reNewPass)) {
                check = false;
                passwordErrorDTO.setReNewPassError("Password and re-password are not matched!!!");
            }
            if (check) {
                if (UserDAO.updatePassword(userId, currentPass, newPass)) {
                    url = CHANGE_PASS_SUCCESS;
                } else {
                    passwordErrorDTO.setCurrenPassError("Wrong password!!!");
                    request.setAttribute("CHANGE_PASS_MESSAGE", passwordErrorDTO);
                }
            } else {
                request.setAttribute("CHANGE_PASS_MESSAGE", passwordErrorDTO);
            }
        } catch (Exception e) {
            System.out.println("Change pass controller " + e);
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
