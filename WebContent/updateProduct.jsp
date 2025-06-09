<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.chillsyntax.service.impl.*, com.chillsyntax.service.*,com.chillsyntax.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Product</title>
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
.product-form-card {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
    padding: 30px;
    margin: 40px 0;
}

.product-form-card h2 {
    color: #2D3748;
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 30px;
    text-align: center;
}

.form-group {
    margin-bottom: 20px;
}

.control-label {
    color: #4A5568;
    font-weight: 500;
    margin-bottom: 8px;
}

.form-control {
    height: 45px;
    border-radius: 8px;
    border: 2px solid #E2E8F0;
    padding: 10px 15px;
    font-size: 15px;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #6366F1;
    box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
}

textarea.form-control {
    height: auto;
    min-height: 100px;
}

.form-control[readonly] {
    background-color: #F7FAFC;
    cursor: not-allowed;
}

select.form-control {
    appearance: none;
    -webkit-appearance: none;
    padding-right: 30px;
    background: #fff url('data:image/svg+xml;utf8,<svg fill="%234A5568" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>') no-repeat right 10px center;
}

.btn {
    padding: 10px 20px;
    font-weight: 500;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.btn-update {
    background: #6366F1;
    color: white;
    border: none;
}

.btn-update:hover {
    background: #4F46E5;
}

.btn-cancel {
    background: #EDF2F7;
    color: #4A5568;
    border: none;
    margin-left: 10px;
}

.btn-cancel:hover {
    background: #E2E8F0;
    color: #2D3748;
}

.message-box {
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 8px;
    background: #E6FFFA;
    border-left: 4px solid #38B2AC;
}

.message-box p {
    margin: 0;
    color: #234E52;
    font-size: 14px;
}

.file-input-wrapper {
    position: relative;
}

.file-input-wrapper input[type="file"] {
    opacity: 0;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    cursor: pointer;
}

.file-input-wrapper .file-input-button {
    display: block;
    width: 100%;
    height: 45px;
    border-radius: 8px;
    border: 2px dashed #E2E8F0;
    color: #4A5568;
    text-align: center;
    line-height: 41px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.file-input-wrapper:hover .file-input-button {
    border-color: #6366F1;
    color: #6366F1;
}
</style>
</head>
<body>
	<%
	/* Checking the user credentials */
	String utype = (String) session.getAttribute("usertype");
	String uname = (String) session.getAttribute("username");
	String pwd = (String) session.getAttribute("password");
	String prodid = request.getParameter("prodid");
	ProductBean product = new ProductServiceImpl().getProductDetails(prodid);
	if (prodid == null || product == null) {
		response.sendRedirect("updateProductById.jsp?message=Please Enter a valid product Id");
		return;
	} else if (utype == null || !utype.equals("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");
		return;
	} else if (uname == null || pwd == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
		return;
	}
	%>

	<jsp:include page="header.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="product-form-card">
					<h2><i class="fa fa-pencil"></i> Update Product</h2>
					
					<%
					String message = request.getParameter("message");
					if (message != null) {
					%>
					<div class="message-box">
						<p><i class="fa fa-info-circle"></i> <%=message%></p>
					</div>
					<%
					}
					%>
					
					<form action="./UpdateProductSrv" method="post" enctype="multipart/form-data" class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-sm-3">Product ID</label>
							<div class="col-sm-9">
								<input type="text" name="pid" readonly class="form-control"
									value="<%=product.getProdId()%>" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Name</label>
							<div class="col-sm-9">
								<input type="text" name="name" class="form-control"
									value="<%=product.getProdName()%>" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Type</label>
							<div class="col-sm-9">
								<select name="type" class="form-control" required>
									<option value="mobile" <%=product.getProdType().equals("mobile") ? "selected" : ""%>>Mobile</option>
									<option value="tv" <%=product.getProdType().equals("tv") ? "selected" : ""%>>TV</option>
									<option value="laptop" <%=product.getProdType().equals("laptop") ? "selected" : ""%>>Laptop</option>
									<option value="camera" <%=product.getProdType().equals("camera") ? "selected" : ""%>>Camera</option>
									<option value="speaker" <%=product.getProdType().equals("speaker") ? "selected" : ""%>>Speaker</option>
									<option value="tablet" <%=product.getProdType().equals("tablet") ? "selected" : ""%>>Tablet</option>
									<option value="projector" <%=product.getProdType().equals("projector") ? "selected" : ""%>>Projector</option>
									<option value="appliance" <%=product.getProdType().equals("appliance") ? "selected" : ""%>>Appliance</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Description</label>
							<div class="col-sm-9">
								<textarea name="info" class="form-control" required rows="4"><%=product.getProdInfo()%></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Price</label>
							<div class="col-sm-9">
								<input type="number" name="price" class="form-control"
									value="<%=product.getProdPrice()%>" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Quantity</label>
							<div class="col-sm-9">
								<input type="number" name="quantity" class="form-control"
									value="<%=product.getProdQuantity()%>" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Image</label>
							<div class="col-sm-9">
								<div class="file-input-wrapper">
									<div class="file-input-button">
										<i class="fa fa-cloud-upload"></i> Choose Image
									</div>
									<input type="file" name="image" class="form-control">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-update">
									<i class="fa fa-check"></i> Update Product
								</button>
								<a href="adminViewProduct.jsp" class="btn btn-cancel">
									<i class="fa fa-times"></i> Cancel
								</a>
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
