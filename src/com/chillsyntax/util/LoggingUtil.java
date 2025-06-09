package com.chillsyntax.util;

import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class LoggingUtil {
    private static final Logger LOGGER = Logger.getLogger(LoggingUtil.class.getName());
    private static FileHandler fileHandler;
    
    static {
        try {
            // Initialize file handler
            fileHandler = new FileHandler("shopping-cart.log", true);
            fileHandler.setFormatter(new SimpleFormatter());
            LOGGER.addHandler(fileHandler);
            LOGGER.setLevel(Level.ALL);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void logInfo(String message) {
        LOGGER.info(message);
    }
    
    public static void logWarning(String message) {
        LOGGER.warning(message);
    }
    
    public static void logError(String message, Throwable throwable) {
        LOGGER.log(Level.SEVERE, message, throwable);
    }
    
    public static void logDebug(String message) {
        LOGGER.fine(message);
    }
}
