package com.chillsyntax.util;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class GlobalExceptionHandler implements Filter {
    private static final Logger LOGGER = Logger.getLogger(GlobalExceptionHandler.class.getName());

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        try {
            chain.doFilter(request, response);
        } catch (RuntimeException e) {
            LOGGER.log(Level.SEVERE, "Unhandled exception: ", e);
            handleException(e, (HttpServletRequest) request, (HttpServletResponse) response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unhandled exception: ", e);
            handleException(e, (HttpServletRequest) request, (HttpServletResponse) response);
        }
    }

    private void handleException(Exception e, HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        String errorMessage = e.getMessage();
        if (errorMessage == null || errorMessage.isEmpty()) {
            errorMessage = "An unexpected error occurred";
        }

        if (e instanceof IllegalArgumentException) {
            response.sendRedirect("error.jsp?message=Invalid input: " + errorMessage);
        } else if (e instanceof IllegalStateException) {
            response.sendRedirect("error.jsp?message=Invalid operation: " + errorMessage);
        } else {
            response.sendRedirect("error.jsp?message=System error: " + errorMessage);
        }
    }

    @Override
    public void destroy() {
        // Cleanup if needed
    }
}
