package com.chillsyntax.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chillsyntax.beans.UserBean;
import com.chillsyntax.service.impl.UserServiceImpl;

@WebServlet("/UpdateUserSrv")
public class UpdateUserSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (email == null || password == null) {
            response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
            return;
        }        String name = "ChillSyntax";
        Long mobile = 860070089L;
        String address = "Galgotias University, Noida";
        int pinCode = 241013;

        UserBean updatedUser = new UserBean(name, mobile, email, address, pinCode, password);
        UserServiceImpl userService = new UserServiceImpl();
        String status = userService.updateUser(updatedUser);

        response.sendRedirect("userProfile.jsp?message=" + status);
    }
}
