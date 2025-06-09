package com.chillsyntax.srv;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.chillsyntax.service.impl.ProductServiceImpl;
import com.chillsyntax.util.LoggingUtil;

@WebServlet("/AddProductSrv")
@MultipartConfig(maxFileSize = 16177215)
public class AddProductSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            validateSession(request, response);
            
            String prodName = validateAndGetParameter(request, "name", "Product name");
            String prodPrice = validateAndGetParameter(request, "price", "Product price");
            String prodQuantity = validateAndGetParameter(request, "quantity", "Product quantity");
            String prodType = validateAndGetParameter(request, "type", "Product type");
            String prodInfo = validateAndGetParameter(request, "info", "Product info");
            
            // Validate numeric values
            validateNumericValue(prodPrice, "Product price");
            validateNumericValue(prodQuantity, "Product quantity");
            
            Part part = request.getPart("image");
            InputStream inputStream = null;
            if (part != null) {
                inputStream = part.getInputStream();
            }

            ProductServiceImpl dao = new ProductServiceImpl();
            String status = dao.addProduct(prodName, prodType, prodInfo, Double.parseDouble(prodPrice), 
                                         Integer.parseInt(prodQuantity), inputStream);
            
            LoggingUtil.logInfo("Product added: " + prodName + " with status: " + status);
            response.sendRedirect("addProduct.jsp?message=" + status);

        } catch (IllegalArgumentException e) {
            LoggingUtil.logError("Invalid product data", e);
            response.sendRedirect("addProduct.jsp?message=Error: " + e.getMessage());
        } catch (IOException | ServletException e) {
            LoggingUtil.logError("Error adding product", e);
            response.sendRedirect("error.jsp?message=Error while adding product: " + e.getMessage());
        } catch (Exception e) {
            LoggingUtil.logError("Unexpected error adding product", e);
            response.sendRedirect("error.jsp?message=Unexpected error while adding product");
        }
    }

    private void validateSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String userType = (String) session.getAttribute("usertype");
        String userName = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (userType == null || !userType.equals("admin")) {
            LoggingUtil.logWarning("Unauthorized access attempt to AddProductSrv");
            response.sendRedirect("login.jsp?message=Access Denied!");
            throw new IllegalStateException("Unauthorized access");
        }

        if (userName == null || password == null) {
            LoggingUtil.logWarning("Session expired for AddProductSrv");
            response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
            throw new IllegalStateException("Session expired");
        }
    }

    private String validateAndGetParameter(HttpServletRequest request, String paramName, String fieldName) {
        String value = request.getParameter(paramName);
        if (value == null || value.trim().isEmpty()) {
            throw new IllegalArgumentException(fieldName + " is required");
        }
        return value.trim();
    }

    private void validateNumericValue(String value, String fieldName) {
        try {
            double numericValue = Double.parseDouble(value);
            if (numericValue < 0) {
                throw new IllegalArgumentException(fieldName + " cannot be negative");
            }
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException(fieldName + " must be a valid number");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
