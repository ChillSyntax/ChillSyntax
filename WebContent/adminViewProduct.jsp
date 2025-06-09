<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.chillsyntax.service.impl.*, com.chillsyntax.service.*,com.chillsyntax.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>View Products</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body >

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String userType = (String) session.getAttribute("usertype");

	if (userType == null || !userType.equals("admin")) {

		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

	}

	else if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}
	ProductServiceImpl prodDao = new ProductServiceImpl();
	List<ProductBean> products = new ArrayList<ProductBean>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "All Products";
	if (search != null) {
		products = prodDao.searchAllProducts(search);
		message = "Showing Results for '" + search + "'";
	} else if (type != null) {
		products = prodDao.getAllProductsByType(type);
		message = "Showing Results for '" + type + "'";
	} else {
		products = prodDao.getAllProducts();
	}
	if (products.isEmpty()) {
		message = "No items found for the search '" + (search != null ? search : type) + "'";
		products = prodDao.getAllProducts();
	}
	%>



	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="color: black; font-size: 14px; font-weight: bold;"><%=message%></div>
	<!-- Start of Product Items List -->
	<div class="container product-grid">
		<div class="row">
			<%
			for (ProductBean product : products) {
				String description = product.getProdInfo();
				description = description.substring(0, Math.min(description.length(), 100));
			%>
			<div class="col-sm-4">
				<div class="product-card">
					<div class="product-image-container">
						<img src="./ShowImage?pid=<%=product.getProdId()%>" alt="<%=product.getProdName()%>"
							class="product-image">
					</div>
					<div class="product-info">
						<h3 class="product-name"><%=product.getProdName()%></h3>
						<p class="product-description"><%=description%>...</p>						<div class="product-price"><span class="rupee">&#8377;</span><%=product.getProdPrice()%></div>
						<div class="product-stock">Stock: <%=product.getProdQuantity()%> units</div>
						<form method="post" class="product-actions">
							<a href="updateProduct.jsp?prodid=<%=product.getProdId()%>"
								class="btn btn-add-cart">Update Product</a>
							<a href="removeProduct.jsp?prodid=<%=product.getProdId()%>"
								class="btn btn-remove-cart">Remove Product</a>
						</form>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<!-- End of Product Items List -->

	<%@ include file="footer.html"%>

</body>
</html>
