<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Remove Product</title>
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

.product-form-card h3 {
    color: #2D3748;
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 25px;
    text-align: center;
}

.form-group label {
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

.btn {
    padding: 10px 20px;
    font-weight: 500;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.btn-cancel {
    background: #EDF2F7;
    color: #4A5568;
    border: none;
}

.btn-cancel:hover {
    background: #E2E8F0;
    color: #2D3748;
}

.btn-remove {
    background: #F56565;
    color: white;
    border: none;
}

.btn-remove:hover {
    background: #E53E3E;
}

.message-box {
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 8px;
    background: #FED7D7;
    border-left: 4px solid #F56565;
}

.message-box p {
    margin: 0;
    color: #C53030;
    font-size: 14px;
}
</style>
</head>
<body>
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

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="product-form-card">
					<h3><i class="fa fa-trash"></i> Remove Product</h3>
					
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
					
					<form action="./RemoveProductSrv" method="post">
						<div class="form-group">
							<label for="prodid">Product ID</label>
							<input type="text" name="prodid" id="prodid"
								class="form-control" placeholder="Enter Product ID"
								required>
						</div>
						<div class="text-center" style="margin-top: 25px;">
							<a href="adminViewProduct.jsp" class="btn btn-cancel">
								<i class="fa fa-times"></i> Cancel
							</a>
							<button type="submit" class="btn btn-remove">
								<i class="fa fa-trash"></i> Remove Product
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>
