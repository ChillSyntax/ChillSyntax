package com.chillsyntax.util;

public class ShoppingCartException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public ShoppingCartException(String message) {
        super(message);
    }

    public ShoppingCartException(String message, Throwable cause) {
        super(message, cause);
    }

    public static class ValidationException extends ShoppingCartException {
        private static final long serialVersionUID = 1L;

        public ValidationException(String message) {
            super(message);
        }
    }

    public static class AuthenticationException extends ShoppingCartException {
        private static final long serialVersionUID = 1L;

        public AuthenticationException(String message) {
            super(message);
        }
    }

    public static class DatabaseException extends ShoppingCartException {
        private static final long serialVersionUID = 1L;

        public DatabaseException(String message, Throwable cause) {
            super(message, cause);
        }
    }

    public static class ProductException extends ShoppingCartException {
        private static final long serialVersionUID = 1L;

        public ProductException(String message) {
            super(message);
        }

        public ProductException(String message, Throwable cause) {
            super(message, cause);
        }
    }
}
