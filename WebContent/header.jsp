<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.chillsyntax.service.impl.*, com.chillsyntax.service.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Logout Header</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<link rel="stylesheet" href="css/product-cards.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.navbar {
    color: black !important;
    background-color: rgb(38, 38, 38) !important;
    box-shadow: 0 2px 10px rgb(0, 0, 0);
    border: none;
    margin-bottom: 0;
    height: 100px;
    min-height: 100px;
}

.navbar > .container {
    height: 70px;
}

.navbar-header {
    height: 100px;
}

.navbar-brand {
    font-size: 16px;
    font-weight: 600;
    color: black !important;
    height: 35px;
    line-height: 35px;
    display: flex;
    align-items: center;
}

.navbar-brand i {
    color: black !important;
    font-size: 20px;
    margin-right: 5px;
    display: flex;
    align-items: center;
}

.navbar-nav {
    margin: 0;
    height: 52px;
    display: flex;
    align-items: center;
}

.navbar-nav > li {
    color: black;
    height: 52px;
    display: flex;
    align-items: center;
    margin: 0;
}

/* Standard navigation items */
.navbar-nav > li > a:not(.dropdown-toggle) {
    font-size: 14px;
    font-weight: 500;
    color: black !important;
    transition: color 0.3s;
    padding: 0 12px;
    height: 35px;
    display: flex;
    align-items: center;
    border-radius: 18px;
    margin: 7px 4px;  /* Increased top margin from 6px to 7px */
    line-height: 36px;
}

/* Categories dropdown specific */
.navbar-nav > li > a.dropdown-toggle {
    font-size: 14px;
    font-weight: 500;
    color: black !important;
    transition: color 0.3s;
    padding: 0 12px;
    height: 35px;
    display: flex;
    align-items: center;
    border-radius: 18px;
    margin: 8px 4px;
    line-height: 30px;
}

.navbar-nav > li > a i {
    color: #6366F1;
    font-size: 16px;
    width: 25px;
    height: 25px;
    margin-right: 6px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    line-height: 1;
}

.cart-icon {
    position: relative;
    display: inline-flex !important;
    align-items: center;
    justify-content: center;
    height: 35px !important;
    line-height: 35px !important;
    margin: 7px 4px !important;  /* Increased top margin from 6px to 7px */
}

.cart-icon i {
    font-size: 16px !important;
    line-height: 1;
    margin: 0 !important;
    width: auto !important;
}

.badge {
    background: #EC4899;
    padding: 0 6px;
    font-size: 11px;
    position: absolute;
    top: -6px;
    right: -6px;
    border-radius: 10px;
    min-width: 18px;
    height: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Dropdown specific styling */
.dropdown-toggle {
    height: 35px !important;
    display: inline-flex !important;
    align-items: center !important;
    line-height: 35px !important;
}

.dropdown-toggle .caret {
    margin-left: 6px;
    margin-top: 0;
    vertical-align: middle;
}

.dropdown-menu {
    background: #FFFFFF;
    margin-top: 4px;
    border-radius: 8px;
    border: none;
    box-shadow: 0 2px 10px rgba(99, 102, 241, 0.1);
    padding: 4px 0;
}

.dropdown-menu > li > a {
    color: black !important;
    padding: 8px 12px;
    height: 30px;
    line-height: 20px;
    display: flex;
    align-items: center;
    font-size: 14px;
}

.dropdown-menu > li > a i {
    width: 20px;
    margin-right: 8px;
    font-size: 14px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
}

.header-banner {
    background: linear-gradient(135deg, #6366F1 0%, #8B5CF6 100%);
    color: white;
    padding: 70px 0;
    margin-top: 50px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: bottom;
}

.header-banner h2 {
    font-weight: 700;
    margin-bottom: 10px;
}

.header-banner h6 {
    opacity: 0.9;
    font-size: 16px;
    margin-bottom: 20px;
}

.search-form {
    max-width: 650px;
    margin: 0 auto;
}

.search-form .input-group {
    background: white;
    border-radius: 30px;
    overflow: hidden;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.search-form input {
    border: none;
    padding: 15px 25px;
    font-size: 16px;
}

.search-form .btn {
    padding: 12px 30px;
    background: #6366F1;
    color: white;
    border: none;
    font-weight: 500;
}

.btn-primary {
    background: #6366F1;
    border-color: #6366F1;
}

.btn-primary:hover {
    background: #4F46E5;
    border-color: #4F46E5;
}

.btn-secondary {
    background: #8B5CF6;
    border-color: #8B5CF6;
}

.btn-secondary:hover {
    background: #7C3AED;
    border-color: #7C3AED;
}

.form-control {
    border: 1px solid rgba(99, 102, 241, 0.2);
}

.form-control:focus {
    border-color: #6366F1;
    box-shadow: 0 0 0 2px rgba(99, 102, 241, 0.1);
}

/* Success and error states */
.alert-success {
    background: rgba(16, 185, 129, 0.1);
    border: 1px solid #10B981;
    color: #065F46;
}

.alert-danger {
    background: rgba(236, 72, 153, 0.1);
    border: 1px solid #EC4899;
    color: #831843;
}

/* Cart badge and notifications */
.cart-badge {
    background: #EC4899;
}

.notification {
    background: #EC4899;
}

/* Card styles */
.card {
    background: #FFFFFF;
    border: 1px solid rgba(99, 102, 241, 0.1);
    box-shadow: 0 2px 10px rgba(99, 102, 241, 0.05);
}

.card-header {
    background: #F9FAFB;
    border-bottom: 1px solid rgba(99, 102, 241, 0.1);
}

/* Table styles */
.table thead th {
    background: #F9FAFB;
    border-bottom: 2px solid rgba(99, 102, 241, 0.1);
    color: #1F2937;
}

.table tbody td {
    border-bottom: 1px solid rgba(99, 102, 241, 0.1);
}

@media (max-width: 767px) {
    .navbar-nav {
        height: auto;
    }
    
    .navbar-nav > li {
        height: 46px;
    }
    
    .navbar-nav > li > a {
        height: 30px;
        margin: 5px 0;
    }
    
    .navbar-toggle {
        margin-top: 9px;
        margin-bottom: 9px;
    }
}

/* Admin specific header styles */
.admin-header .navbar {
    background-color: rgb(38, 38, 38) !important;
    border-color: transparent;
}

.admin-header .navbar-brand {
    color: black !important;
    font-size: 15px;
    letter-spacing: 0.3px;
}

.admin-header .navbar-brand i {
    color: #6366F1;
    font-size: 18px;
    margin-right: 10px;
    display: flex;
    align-items: center;
    height: 52px;
}

.admin-header .navbar-nav > li > a:not(.dropdown-toggle) {
    color: black !important;
    font-size: 13.5px;
    font-weight: 500;
    letter-spacing: 0.3px;
    height: 52px;
    display: flex;
    align-items: center;
    margin-top: -3.5px;
}

.admin-header .navbar-nav > li > a.dropdown-toggle {
    color: black !important;
    font-size: 13.5px;
    font-weight: 500;
    letter-spacing: 0.3px;
    height: 52px;
    display: flex;
    align-items: center;
    margin-top: 0px; /* Moving dropdown items down by 0.5px */
}

.admin-header .navbar-nav > li > a:hover {
    color: black !important;
    background-color: rgba(99, 102, 241, 0.15);
}

.admin-header .navbar-nav > li > a i {
    color: #8B5CF6;
    font-size: 15px;
    width: 18px;
    text-align: center;
    margin-right: 8px;
    line-height: 1;
}

.admin-header .dropdown-menu {
    background: #FFFFFF;
    border: 1px solid rgba(99, 102, 241, 0.1);
    box-shadow: 0 3px 12px rgba(0,0,0,0.2);
    margin-top: 0;
    border-radius: 4px;
}

.admin-header .dropdown-menu > li > a {
    color: black !important;
    font-size: 13px;
    padding: 10px 15px;
    display: flex;
    align-items: center;
}

.admin-header .dropdown-menu > li > a:hover {
    background: rgba(99, 102, 241, 0.15);
    color: #fff;
}

.admin-header .dropdown-menu > li > a i {
    color: #8B5CF6;
    margin-right: 10px;
    width: 16px;
    text-align: center;
}

.admin-header .navbar-toggle .icon-bar {
    background-color: rgba(255,255,255,0.8);
}

/* Additional rules to ensure navbar brand color is black */
.navbar .navbar-brand {
    color: black !important;
}

.navbar .navbar-brand * {
    color: black !important;
}

.navbar-default .navbar-brand {
    color: black !important;
}

.navbar .navbar-header .navbar-brand {
    color: black !important;
}

/* Add these rules after the existing navbar styles */
.navbar-brand,
.navbar-brand:hover,
.navbar-brand:focus,
.navbar-brand:active {
    color: black !important;
}
</style>
</head>
<body>
    <div class="header-banner">
        <div class="container-fluid text-center">
            <h2>ChillSyntax Shop</h2>
            <h6>Your One-Stop Electronics Store</h6>
            <form class="search-form" action="index.jsp" method="get">
                <div class="input-group">
                    <input type="text" class="form-control" name="search"
                        placeholder="Search for products..." required>
                    <div class="input-group-btn">
                        <button type="submit" class="btn">Search</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

	<%
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { // LOGGED OUT
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>				<a class="navbar-brand" href="index.jsp">
					<i class="fa fa-store"></i> ChillSyntax
				</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp"><i class="fa fa-compass"></i> Browse</a></li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							<i class="fa fa-th-large"></i> Categories <span class="caret"></span>
						</a>						<ul class="dropdown-menu">
							<li><a href="index.jsp?type=mobile">Mobiles</a></li>
							<li><a href="index.jsp?type=tv">TVs</a></li>
							<li><a href="index.jsp?type=laptop">Laptops</a></li>
							<li><a href="index.jsp?type=camera">Cameras</a></li>
							<li><a href="index.jsp?type=speaker">Speakers</a></li>
							<li><a href="index.jsp?type=tablet">Tablets</a></li>
							<li><a href="index.jsp?type=projector">Projectors</a></li>
							<li><a href="index.jsp?type=appliance">Appliances</a></li>
						</ul>
					</li>
					<li><a href="login.jsp"><i class="fa fa-key"></i> Login</a></li>
					<li><a href="register.jsp"><i class="fa fa-user-circle"></i> Register</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else if ("customer".equalsIgnoreCase(userType)) { // CUSTOMER HEADER
	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="userHome.jsp">
					<i class="fa fa-shopping-bag"></i> ChillSyntax
				</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userHome.jsp">Browse</a></li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							Categories <span class="caret"></span>
						</a>						<ul class="dropdown-menu">
							<li><a href="userHome.jsp?type=mobile">Mobiles</a></li>
							<li><a href="userHome.jsp?type=tv">TVs</a></li>
							<li><a href="userHome.jsp?type=laptop">Laptops</a></li>
							<li><a href="userHome.jsp?type=camera">Cameras</a></li>
							<li><a href="userHome.jsp?type=speaker">Speakers</a></li>
							<li><a href="userHome.jsp?type=tablet">Tablets</a></li>
							<li><a href="userHome.jsp?type=projector">Projectors</a></li>
							<li><a href="userHome.jsp?type=appliance">Appliances</a></li>
							<li><a href="userHome.jsp?type=tablet">Tablets</a></li>
						</ul>
					</li>
					<li>
						<a href="cartDetails.jsp" class="cart-icon">
							<i class="fa fa-shopping-cart"></i>
							<% if (notf > 0) { %>
							<span class="badge"><%=notf%></span>
							<% } %>
						</a>
					</li>
					<li><a href="orderDetails.jsp"><i class="fa fa-list"></i> Orders</a></li>
					<li><a href="userProfile.jsp"><i class="fa fa-user"></i> Profile</a></li>
					<li><a href="./LogoutSrv"><i class="fa fa-sign-out"></i> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%	} else { // ADMIN HEADER
	%>
	<div class="admin-header">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="adminViewProduct.jsp">
						<i class="fa fa-dashboard"></i> Admin Dashboard
					</a>
				</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="adminViewProduct.jsp"><i class="fa fa-cubes"></i> Products</a></li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							<i class="fa fa-tags"></i> Categories <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="adminViewProduct.jsp?type=mobile">Mobiles</a></li>
							<li><a href="adminViewProduct.jsp?type=tv">TVs</a></li>
							<li><a href="adminViewProduct.jsp?type=laptop">Laptops</a></li>
							<li><a href="adminViewProduct.jsp?type=camera">Cameras</a></li>
							<li><a href="adminViewProduct.jsp?type=speaker">Speakers</a></li>
							<li><a href="adminViewProduct.jsp?type=tablet">Tablets</a></li>
						</ul>
					</li>
					<li><a href="adminStock.jsp"><i class="fa fa-database"></i> Stock</a></li>
					<li><a href="shippedItems.jsp"><i class="fa fa-truck"></i> Shipped</a></li>
					<li><a href="unshippedItems.jsp"><i class="fa fa-clock-o"></i> Pending</a></li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							<i class="fa fa-cog"></i> Manage <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="addProduct.jsp"><i class="fa fa-plus"></i> Add Product</a></li>
							<li><a href="removeProduct.jsp"><i class="fa fa-trash"></i> Remove Product</a></li>
							<li><a href="updateProductById.jsp"><i class="fa fa-pencil"></i> Update Product</a></li>
						</ul>
					</li>
					<li><a href="./LogoutSrv"><i class="fa fa-sign-out"></i> Logout</a></li>
				</ul>			</div>
		</div>
	</nav>
	</div>
	<%
	}
	%>
</body>
</html>
