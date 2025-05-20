<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.chillsyntax.service.impl.*, com.chillsyntax.service.*,com.chillsyntax.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard - ChillSyntax Shop</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
    body {
        background-color: #f8f9fa;
    }

    .dashboard-container {
        padding: 40px 0;
    }

    .dashboard-card {
        background: white;
        border-radius: 12px;
        padding: 25px;
        margin-bottom: 30px;
        transition: transform 0.2s;
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        text-align: center;
    }

    .dashboard-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 15px rgba(0,0,0,0.1);
    }

    .dashboard-icon {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        background: linear-gradient(135deg, #4CAF50 0%, #45a049 100%);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 20px;
    }

    .dashboard-icon i {
        font-size: 24px;
    }

    .dashboard-card h3 {
        color: #333;
        font-size: 20px;
        margin: 0 0 15px;
        font-weight: 600;
    }

    .dashboard-btn {
        background: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 6px;
        font-weight: 500;
        transition: background-color 0.3s;
    }

    .dashboard-btn:hover {
        background: #45a049;
        color: white;
    }

    .welcome-section {
        text-align: center;
        margin-bottom: 40px;
    }

    .welcome-section h2 {
        color: #333;
        font-weight: 700;
        margin-bottom: 10px;
    }

    .welcome-section p {
        color: #666;
        font-size: 16px;
    }
</style>
</head>
<body>
	<%
	String userType = (String) session.getAttribute("usertype");
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userType == null || !userType.equals("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");
	} else if (userName == null || password == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	}
	%>

	<jsp:include page="header.jsp" />

	<div class="container dashboard-container">
        <div class="welcome-section">
            <h2>Admin Dashboard</h2>
            <p>Welcome to the ChillSyntax Shop administration panel. Manage your products and orders here.</p>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="dashboard-card">
                    <div class="dashboard-icon">
                        <i class="fa fa-cubes"></i>
                    </div>
                    <h3>View Products</h3>
                    <p>Browse and manage your product catalog</p>
                    <a href="adminViewProduct.jsp" class="btn dashboard-btn">
                        <i class="fa fa-arrow-right"></i> View Products
                    </a>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="dashboard-card">
                    <div class="dashboard-icon">
                        <i class="fa fa-plus-circle"></i>
                    </div>
                    <h3>Add Products</h3>
                    <p>Add new products to your store</p>
                    <a href="addProduct.jsp" class="btn dashboard-btn">
                        <i class="fa fa-plus"></i> Add Products
                    </a>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="dashboard-card">
                    <div class="dashboard-icon">
                        <i class="fa fa-trash"></i>
                    </div>
                    <h3>Remove Products</h3>
                    <p>Remove products from your catalog</p>
                    <a href="removeProduct.jsp" class="btn dashboard-btn">
                        <i class="fa fa-trash"></i> Remove Products
                    </a>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="dashboard-card">
                    <div class="dashboard-icon">
                        <i class="fa fa-pencil"></i>
                    </div>
                    <h3>Update Products</h3>
                    <p>Modify existing product details</p>
                    <a href="updateProductById.jsp" class="btn dashboard-btn">
                        <i class="fa fa-pencil"></i> Update Products
                    </a>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="dashboard-card">
                    <div class="dashboard-icon">
                        <i class="fa fa-truck"></i>
                    </div>
                    <h3>View Orders</h3>
                    <p>Manage customer orders and shipments</p>
                    <a href="unshippedItems.jsp" class="btn dashboard-btn">
                        <i class="fa fa-clock-o"></i> View Orders
                    </a>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="dashboard-card">
                    <div class="dashboard-icon">
                        <i class="fa fa-database"></i>
                    </div>
                    <h3>Stock Management</h3>
                    <p>Monitor and manage product inventory</p>
                    <a href="adminStock.jsp" class="btn dashboard-btn">
                        <i class="fa fa-database"></i> View Stock
                    </a>
                </div>
            </div>
        </div>
    </div>

	<%@ include file="footer.html"%>
</body>
</html>
