/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.UserDAO;
import dtos.UserDTO;
import dtos.UserErrorDTO;
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
public class UpDateProfileController extends HttpServlet {

    public static final String UPDATE_PROFILE_SUCESS = "view_profile_page.jsp";

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
        String url = UPDATE_PROFILE_SUCESS;
        try {
            UserErrorDTO userErrorDTO = new UserErrorDTO();
            HttpSession session = request.getSession();
            UserDTO userDTOSession = (UserDTO) session.getAttribute("USER_DTO");
            String userId = request.getParameter("userId");
            String name = request.getParameter("name");
            String gender = request.getParameter("cbxGender");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            if (name.isEmpty()) {
                userErrorDTO.setNameError("Full name can not be empty");
                request.setAttribute("ERROR_UPDATE", userErrorDTO);
            } else {
                UserDTO userDTO = new UserDTO(userId, "", userDTOSession.getRole(), name, gender, phone, address);
                UserDAO.updateProfile(userDTO);
                session.setAttribute("USER_DTO", userDTO);
                request.setAttribute("MESSAGE_UPDATE", "Update successfully!!!");
            }
        } catch (Exception e) {
            System.out.println("Update Controller " + e);
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
