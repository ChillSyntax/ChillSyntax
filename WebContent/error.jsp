<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error - ChillSyntax Shop</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/changes.css">
    <style>
        .error-container {
            text-align: center;
            margin-top: 100px;
            margin-bottom: 100px;
        }
        
        .error-icon {
            font-size: 64px;
            color: #e74c3c;
            margin-bottom: 20px;
        }
        
        .error-title {
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 15px;
        }
        
        .error-message {
            color: #7f8c8d;
            margin-bottom: 30px;
        }
        
        .back-button {
            padding: 10px 30px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <div class="error-container">
            <div class="error-icon">
                <i class="fa fa-exclamation-circle"></i>
            </div>
            <h2 class="error-title">Oops! Something went wrong</h2>
            <p class="error-message">
                <%
                String message = request.getParameter("message");
                if (message == null || message.isEmpty()) {
                    message = "An unexpected error occurred";
                }
                out.println(message);
                %>
            </p>
            <a href="javascript:history.back()" class="btn btn-primary back-button">
                <i class="fa fa-arrow-left"></i> Go Back
            </a>
        </div>
    </div>
    
    <%@ include file="footer.html" %>
</body>
</html>
