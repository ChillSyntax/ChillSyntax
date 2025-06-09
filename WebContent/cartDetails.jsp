<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.chillsyntax.service.impl.*, com.chillsyntax.service.*,com.chillsyntax.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Cart Details</title>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.3.2/lazysizes.min.js"
	async></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.cart-table {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
    margin: 20px 0;
}

.cart-table th {
    background: #6366F1 !important;
    color: white;
    padding: 15px;
    font-weight: 500;
    font-size: 14px;
}

.cart-table td {
    padding: 15px;
    vertical-align: middle;
}

.cart-image-container {
    width: 80px;
    height: 80px;
    background: #f7fafc;
    border-radius: 4px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
}

.cart-image {
    width: 100%;
    height: 100%;
    object-fit: contain;
    opacity: 0;
    transition: opacity 0.3s ease-in-out;
}

.cart-image.lazyloaded {
    opacity: 1;
}

.cart-image[src$="noimage.jpg"] {
    opacity: 0.5;
}

.cart-product-name {
    font-weight: 500;
    color: #2D3748;
}

.cart-price {
    color: #6366F1;
    font-weight: 600;
}

.cart-quantity {
    width: 80px;
    text-align: center;
}

.cart-total {
    padding: 20px;
    background: #F9FAFB;
    border-radius: 8px;
    margin-top: 20px;
}

.cart-total-text {
    font-size: 18px;
    font-weight: 600;
    color: #2D3748;
}

.cart-total-amount {
    font-size: 24px;
    font-weight: 700;
    color: #6366F1;
}

.btn-cart-action {
    padding: 6px 12px;
    border-radius: 6px;
}

.empty-cart {
    text-align: center;
    padding: 40px 20px;
}

.empty-cart i {
    font-size: 48px;
    color: #CBD5E0;
    margin-bottom: 16px;
}

.empty-cart p {
    font-size: 16px;
    color: #718096;
}
</style>
</head>
<body>
	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
		return;
	}

	String addS = request.getParameter("add");
	if (addS != null) {
		int add = Integer.parseInt(addS);
		String uid = request.getParameter("uid");
		String pid = request.getParameter("pid");
		int avail = Integer.parseInt(request.getParameter("avail"));
		int cartQty = Integer.parseInt(request.getParameter("qty"));
		CartServiceImpl cart = new CartServiceImpl();

		if (add == 1) {
			//Add Product into the cart
			cartQty += 1;
			if (cartQty <= avail) {
				cart.addProductToCart(uid, pid, 1);
			} else {
				response.sendRedirect("./AddtoCart?pid=" + pid + "&pqty=" + cartQty);
			}
		} else if (add == 0) {
			//Remove Product from the cart
			cart.removeProductFromCart(uid, pid);
		}
	}
	%>

	<jsp:include page="header.jsp" />

	<div class="container">		<h2 class="text-center" style="margin: 30px 0; color: #2D3748;">Shopping Cart</h2>
		<div id="message" class="text-center" style="color: #e74c3c;"></div>
		<%
		CartServiceImpl cart = new CartServiceImpl();
		List<CartBean> cartItems = cart.getAllCartItems(userName);
		if (cartItems == null || cartItems.isEmpty()) {
		%>
			<div class="empty-cart">
				<i class="fa fa-shopping-cart"></i>
				<h3>Your cart is empty</h3>
				<p>Looks like you haven't added anything to your cart yet</p>
				<a href="userHome.jsp" class="btn btn-primary" style="margin-top: 20px;">
					Continue Shopping
				</a>
			</div>
		<%
		} else {
		%>
		<div class="cart-table">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Product</th>
						<th>Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Actions</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					<%
					double totAmount = 0;
					for (CartBean item : cartItems) {
						String prodId = item.getProdId();
						if (prodId == null) continue;
						
						int prodQuantity = item.getQuantity();
						ProductBean product = new ProductServiceImpl().getProductDetails(prodId);
						if (product == null) {
							System.err.println("Product not found: " + prodId);
							continue;
						}
						
						double amount = product.getProdPrice() * prodQuantity;
						totAmount += amount;
					%>
					<tr>						<td>
							<div class="cart-image-container">
								<img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
									 data-src="./ShowImage?pid=<%=product.getProdId()%>"
									 class="cart-image lazyload"
									 alt="<%=product.getProdName()%>"
									 onerror="this.onerror=null; this.src='images/noimage.jpg';">
							</div>
						</td>
						<td>
							<div class="cart-product-name"><%=product.getProdName()%></div>
							<small class="text-muted"><%=product.getProdInfo().substring(0, Math.min(product.getProdInfo().length(), 50))%>...</small>
						</td>
						<td class="cart-price">
							<span class="rupee">&#8377;</span><%=product.getProdPrice()%>
						</td>
						<td>
							<span class="cart-quantity"><%=prodQuantity%></span>
						</td>
						<td>
							<div class="btn-group">
								<a href="cartDetails.jsp?add=1&uid=<%=userName%>&pid=<%=prodId%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>"
									class="btn btn-add-cart btn-cart-action">
									<i class="fa fa-plus"></i>
								</a>
								<a href="cartDetails.jsp?add=0&uid=<%=userName%>&pid=<%=prodId%>"
									class="btn btn-remove-cart btn-cart-action">
									<i class="fa fa-trash"></i>
								</a>
							</div>
						</td>
						<td class="cart-price">
							<span class="rupee">&#8377;</span><%=amount%>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

		<div class="cart-total">
			<div class="row">
				<div class="col-md-6">
					<a href="userHome.jsp" class="btn btn-buy-now">
						<i class="fa fa-arrow-left"></i> Continue Shopping
					</a>
				</div>
				<div class="col-md-6 text-right">
					<div class="cart-total-text">Total Amount:</div>
					<div class="cart-total-amount">
						<span class="rupee">&#8377;</span><%=totAmount%>
					</div>
					<div style="margin-top: 20px;">
						<a href="payment.jsp?amount=<%=totAmount%>" class="btn btn-add-cart">
							Proceed to Payment <i class="fa fa-arrow-right"></i>
						</a>
					</div>
				</div>
			</div>		</div>
		<%
		}
		%>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>
