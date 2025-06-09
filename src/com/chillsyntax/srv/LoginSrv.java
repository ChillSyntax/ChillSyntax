package com.chillsyntax.srv;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chillsyntax.beans.UserBean;
import com.chillsyntax.service.impl.UserServiceImpl;
import com.chillsyntax.util.LoggingUtil;

@WebServlet("/LoginSrv")
public class LoginSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() {
        LoggingUtil.logInfo("LoginSrv initialized");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String userName = request.getParameter("username");
            String password = request.getParameter("password");
            String userType = request.getParameter("usertype");

            if (userName == null || password == null || userType == null) {
                throw new IllegalArgumentException("Username, password, and user type are required");
            }

            response.setContentType("text/html");
            LoggingUtil.logInfo("Login attempt for user: " + userName + " as " + userType);

            if (userType.equals("admin")) {
                handleAdminLogin(userName, password, userType, request, response);
            } else {
                handleCustomerLogin(userName, password, userType, request, response);
            }

        } catch (IllegalArgumentException e) {
            LoggingUtil.logError("Invalid login parameters", e);
            response.sendRedirect("login.jsp?message=" + e.getMessage());
        } catch (IOException | RuntimeException e) {
            LoggingUtil.logError("Error during login", e);
            response.sendRedirect("error.jsp?message=" + e.getMessage());
        }
    }

    private void handleAdminLogin(String userName, String password, String userType,
            HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (password.equals("admin") && userName.equals("admin@gmail.com")) {
            LoggingUtil.logInfo("Admin login successful");
            HttpSession session = request.getSession();
            session.setAttribute("username", userName);
            session.setAttribute("password", password);
            session.setAttribute("usertype", userType);
            response.sendRedirect("adminViewProduct.jsp");
        } else {
            LoggingUtil.logWarning("Failed admin login attempt for user: " + userName);
            response.sendRedirect("login.jsp?message=Invalid admin credentials");
        }
    }

    private void handleCustomerLogin(String userName, String password, String userType,
            HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserServiceImpl udao = new UserServiceImpl();
        String loginStatus = udao.isValidCredential(userName, password);

        if (loginStatus.equalsIgnoreCase("valid")) {
            try {
                UserBean user = udao.getUserDetails(userName, password);
                HttpSession session = request.getSession();
                session.setAttribute("userdata", user);
                session.setAttribute("username", userName);
                session.setAttribute("password", password);
                session.setAttribute("usertype", userType);
                LoggingUtil.logInfo("Customer login successful for user: " + userName);
                response.sendRedirect("userHome.jsp");
            } catch (Exception e) {
                LoggingUtil.logError("Error retrieving user details", e);
                response.sendRedirect("error.jsp?message=Error retrieving user details");
            }
        } else {
            LoggingUtil.logWarning("Failed customer login attempt for user: " + userName);
            response.sendRedirect("login.jsp?message=" + loginStatus);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        doGet(request, response);
    }

    @Override
    public void destroy() {
        LoggingUtil.logInfo("LoginSrv destroyed");
    }
}
