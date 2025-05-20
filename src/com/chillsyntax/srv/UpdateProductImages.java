package com.chillsyntax.srv;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateProductImages {
      public static void main(String[] args) throws ClassNotFoundException, SQLException, IOException {
        String[] productIds = new String[] {
            "P20240519001", "P20240519002", "P20240519003", "P20240519004", 
            "P20240519005", "P20240519006", "P20240519007", "P20240519008", 
            "P20240519009", "P20240519010", "P20240519011", "P20240519012", 
            "P20240519013", "P20240519014", "P20240519015", "P20240519016", 
            "P20240519017", "P20240519018", "P20240519019", "P20240519020", 
            "P20240519021", "P20240519022", "P20240519023", "P20240519024"
        };
        
        String[] imageFiles = new String[] {
            "apple mackbook m3.png", "Galaxy-Book5-Pro.png", "hp spector x360 14.png",
            "Fujifilm-X100VI-Black.png", "Nikon-Z-fc-DX.png", "Sony-ZV-E10.png",
            "ipad 11 pro.png", "Samsung-Galaxy-Tab-S9.png", "xiomai ipad 6.png",
            "iphone 15pro max.png", "oneplus 13.png", "samsung-galaxy-z-fold6.png",
            "Godrej WFEON.png", "Godrej WS EDGE.png", "Godrej WTEON.png",
            "LG 32LQ635BPSA.png", "LG 32LR570B6LA.png", "LG 32LR605B6LC.png",
            "JBL Boombox 3.png", "JBL Charge 5.png", "JBL Flip 6.png",
            "XElectron C9 Plus.png", "XElectron C9 Standard.png", "XElectron iProjector.png"
        };
        
        String currentDir = System.getProperty("user.dir");
        String basePath = currentDir + "/WebContent/new-images/";
        System.out.println("Looking for images in: " + basePath);
        updateImages(productIds, imageFiles, basePath);
    }    private static void updateImages(String[] productIds, String[] imageFiles, String basePath) throws ClassNotFoundException, SQLException, IOException {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping-cart", "root", "root");
             PreparedStatement pstmt = conn.prepareStatement("UPDATE product SET image = ? WHERE pid = ?")) {
            
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            for (int i = 0; i < productIds.length; i++) {
                File file = new File(basePath + imageFiles[i]);
                if (!file.exists()) {
                    System.out.println("File not found: " + file.getAbsolutePath());
                    continue;
                }
                
                try (FileInputStream fis = new FileInputStream(file)) {
                    pstmt.setBinaryStream(1, fis, (int)file.length());
                    pstmt.setString(2, productIds[i]);
                    pstmt.executeUpdate();
                    System.out.println("Updated image for product: " + productIds[i] + " with file: " + file.getName());
                }
            }
        }
    }
}
