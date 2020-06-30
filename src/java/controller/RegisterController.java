/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.UserDAO;
import dtos.UserDTO;
import dtos.UserErrorDTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author dell
 */
public class RegisterController extends HttpServlet {

    public static final String REGISTER_SUCCESS = "login.jsp";
    public static final String REGISTER_ERROR = "register.jsp";

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
        String url = REGISTER_ERROR;
        UserErrorDTO userErrorDTO = new UserErrorDTO();
        try {
            boolean isValid = true;
            request.setCharacterEncoding("UTF-8");
            String userId = request.getParameter("userId");
            String name = request.getParameter("name");
            String gender = request.getParameter("cbxGender");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String rePass = request.getParameter("rePassword");

            if (userId.isEmpty()) {
                userErrorDTO.setUserIdError(name+"User name can not be empty có có");
                isValid = false;
            }
            if (name.isEmpty()) {
                userErrorDTO.setNameError("Full name can not be empty");
                isValid = false;
            }
            if (!password.endsWith(rePass)) {
                userErrorDTO.setPasswordError("Password and repassword is not matched");
                isValid = false;
            } else if (password.isEmpty()) {
                userErrorDTO.setPasswordError("Password can not be empty");
                isValid = false;
            }
            request.setAttribute("USER_ID_VALUE", userId);
            request.setAttribute("NAME_VALUE", name);
            request.setAttribute("GENDER_VALUE", gender);
            request.setAttribute("PHONE_VALUE", phone);
            request.setAttribute("ADDRESS_VALUE", address);
            request.setAttribute("PASSWORD_VALUE", password);
            request.setAttribute("RE_PASSWORD_VALUE", rePass);

            if (isValid) {
                url = REGISTER_SUCCESS;
                UserDTO userDTO = new UserDTO(userId, password, "US", name, gender, phone, address);
                UserDAO.registAcc(userDTO);

            } else {
                request.setAttribute("ERROR_ACCOUNT", userErrorDTO);
            }

        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                userErrorDTO.setUserIdError("This user name existed!!!");
                request.setAttribute("ERROR_ACCOUNT", userErrorDTO);
                url = REGISTER_ERROR;
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
