/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.UserDAO;
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
 * @author Admins
 */
public class LoginGoogleController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String DEFAULT_PASSWORD = "Q:nC3$v~]/'.R`kc";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String url = LoginController.LOGIN_ERROR;
        if (code == null || code.isEmpty()) {
            System.out.println("Error");
        } else {
            try  {
                String token = utils.GoogleUtils.getToken(code);
                String email = utils.GoogleUtils.getUserInfo(token);
                String name = email.split("@")[0];
                UserDTO user = UserDAO.checkLogin(email, DEFAULT_PASSWORD);
                if (user == null) {
                    user = new UserDTO(email, DEFAULT_PASSWORD, "US",  name, "", "", "");
                    UserDAO.registAcc(user);
                }
                if (user.getRole().contains("admin")) {
                    url = LoginController.SEARCH_SUCCESS_ADMIN;
                } else {
                    url = LoginController.SEARCH_SUCCESS_USER;
                }
                HttpSession session = request.getSession();
                session.setAttribute("USER_DTO", user);
                System.out.println(user);
            } catch (Exception e) {
                System.out.println("LoginGoogleController:"+e);
            }
            finally {
                response.sendRedirect(url);
            }
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
