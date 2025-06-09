package com.chillsyntax.srv;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chillsyntax.service.impl.ProductServiceImpl;

@WebServlet("/ShowImage")
public class ShowImage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(ShowImage.class.getName());

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String prodId = request.getParameter("pid");
        if (prodId == null || prodId.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID is required");
            return;
        }

        try {
            ProductServiceImpl dao = new ProductServiceImpl();
            byte[] imageData = dao.getImage(prodId);
            
            if (imageData == null || imageData.length == 0) {
                try {
                    imageData = getPlaceholderImage(request);
                    response.setHeader("Cache-Control", "private, max-age=3600"); // Cache for 1 hour
                } catch (IOException e) {
                    LOGGER.log(Level.WARNING, "Failed to load placeholder image", e);
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load image");
                    return;
                }
            } else {
                response.setHeader("Cache-Control", "private, max-age=86400"); // Cache for 24 hours
            }
            response.setHeader("Pragma", "cache");
            
            writeImageResponse(response, imageData);
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Error processing image for product ID {0}", prodId);
            LOGGER.log(Level.SEVERE, "Exception details:", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing image");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error for product ID {0}", prodId);
            LOGGER.log(Level.SEVERE, "Exception details:", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unexpected error");
        }
    }

    private byte[] getPlaceholderImage(HttpServletRequest request) throws IOException {
        File placeholderFile = new File(request.getServletContext().getRealPath("images/noimage.jpg"));
        if (!placeholderFile.exists()) {
            LOGGER.log(Level.WARNING, "Placeholder image not found at {0}", placeholderFile.getAbsolutePath());
            throw new IOException("Placeholder image not found");
        }
        
        BufferedImage originalImage = ImageIO.read(placeholderFile);
        if (originalImage == null) {
            throw new IOException("Failed to read placeholder image");
        }
        
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        if (!ImageIO.write(originalImage, "jpg", baos)) {
            throw new IOException("No appropriate image writer found");
        }
        return baos.toByteArray();
    }

    private void writeImageResponse(HttpServletResponse response, byte[] imageData) throws IOException {
        response.setContentType("image/jpeg");
        response.setContentLength(imageData.length);
        try (OutputStream out = response.getOutputStream()) {
            out.write(imageData);
            out.flush();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
