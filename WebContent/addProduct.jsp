<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/changes.css">
</head>
<body >
	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userType == null || !userType.equals("admin")) {

		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

	}

	else if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}
	%>

	<jsp:include page="header.jsp" />

	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="product-card" style="padding: 30px; margin: 30px 0;">
					<h2 class="text-center" style="margin-bottom: 30px; color: #2d3748;">Add New Product</h2>
					
					<form action="./AddProductSrv" method="post"
						enctype="multipart/form-data" class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-sm-3">Name</label>
							<div class="col-sm-9">
								<input type="text" name="name" placeholder="Product Name" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Type</label>
							<div class="col-sm-9">
								<select name="type" class="form-control" required>
									<option value="mobile">Mobile</option>
									<option value="tv">TV</option>
									<option value="laptop">Laptop</option>
									<option value="camera">Camera</option>
									<option value="speaker">Speaker</option>
									<option value="tablet">Tablet</option>
									<option value="projector">Projector</option>
									<option value="appliance">Appliance</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Description</label>
							<div class="col-sm-9">
								<textarea name="info" placeholder="Product Description" class="form-control" required rows="4"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Price</label>
							<div class="col-sm-9">
								<input type="number" name="price" placeholder="Product Price" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Quantity</label>
							<div class="col-sm-9">
								<input type="number" name="quantity" placeholder="Product Quantity" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Image</label>
							<div class="col-sm-9">
								<input type="file" name="image" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-add-cart">Add Product</button>
								<a href="adminViewProduct.jsp" class="btn btn-buy-now">Cancel</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>
