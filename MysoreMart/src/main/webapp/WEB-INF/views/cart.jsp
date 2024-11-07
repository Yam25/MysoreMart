
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<link href="<c:url value='/css/cart.css'/>" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container">
			<a class="navbar-brand ms-0" href="/MysoreMart/"> <img
				src="images/product/mart.png" alt="Bootstrap" width="200"
				height="75">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown">
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Fruits</a></li>
							<li><a class="dropdown-item" href="#">Vegetables</a></li>
							<li><a class="dropdown-item" href="#">Sip-Snack</a></li>
							<li><a class="dropdown-item" href="#">Dairy Products</a></li>
							<li><a class="dropdown-item" href="#">Dry Fruits</a></li>
							<li><a class="dropdown-item" href="#">Spices/Oils</a></li>
							<li><a class="dropdown-item" href="#">Dal/Pulses</a></li>
							<li><a class="dropdown-item" href="#">Wholesome Grains</a></li>
						</ul>
					</li>
				</ul>
				<ul
					class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex align-items-center">
					<!-- Added d-flex and align-items-center -->
					<li class="nav-item"><a class="nav-link"
						href="/MysoreMart/login">
							<button type="button" class="btn btn-outline-dark">Login/SignUp</button>
					</a></li>
					<li class="nav-item ms-2"><a class="nav-link"
						href="/MysoreMart/cart"> <i
							class="bi bi-cart4 text-danger cart-icon fs-2"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<main>
		<section class="container py-5 text-center" id="cart">
			<h1 class="title">Shopping Cart</h1>
			<p class="item" id="cart-item-count">0 items in your cart</p>
		</section>
		<section class="container py-3" id="cart-items">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="card mb-4 shadow">
							<div class="card-body">
								<div class="row">
									<div class="col-12 mb-5 product" data-price="">
										<div class="d-flex align-items-center">
											<img src="images/product/apples.jpg" class="img-fluid me-2"
												alt="Product Image" style="width: 110px; height: 110px;">
											<div class="flex-grow-1">
												<h5 class="card-title m-1">Apple</h5>
												<p class=" text-secondary m-1">1kg</p>
												<p class="card-text m-1">
													&#8377;<span class="price">100.00</span>
												</p>
												<div class="d-flex align-items-center">
													<button class="btn btn-outline-success me-2 decrease-qty">
														<i class="bi bi-dash" title="Decrease Quantity"></i>
													</button>
													<input type="number" value="1" min="1"
														class="form-control w-25 me-2 quantity">
													<button class="btn btn-outline-success ms-2 increase-qty">
														<i class="bi bi-plus" title="Increase Quantity"></i>
													</button>
													<button class="btn btn-danger ms-2 remove-item">Remove</button>
												</div>
											</div>
										</div>
									</div>

									<div class="col-12 mb-3 product" data-price="">
										<div class="d-flex align-items-center">
											<img src="images/product/blueberries.jpg"
												class="img-fluid me-2" alt="Product Image"
												style="width: 110px; height: 110px;">
											<div class="flex-grow-1">
												<h5 class="card-title m-1">Blueberries</h5>
												<p class="text-secondary m-1">500g</p>
												<p class="card-text m-1">
													&#8377;<span class="price">250.00</span>
												</p>
												<div class="d-flex align-items-center">
													<button class="btn btn-outline-success me-2 decrease-qty">
														<i class="bi bi-dash" title="Decrease Quantity"></i>
													</button>
													<input type="number" value="1" min="1"
														class="form-control w-25 me-2 quantity">
													<button class="btn btn-outline-success ms-2 increase-qty">
														<i class="bi bi-plus" title="Increase Quantity"></i>
													</button>
													<button class="btn btn-danger ms-2 remove-item">Remove</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 shadow border-light">
							<div class="card-body">
								<h4 class="card-title text-center">Bill Details</h4>
								<hr>
								<h5 class="d-flex justify-content-between align-items-center">
									<span>Subtotal:</span> <span>&#8377;<span id="subtotal"></span></span>
								</h5>
								<h5 class="d-flex justify-content-between align-items-center">
									<span>GST (5%):</span> <span>&#8377;<span id="gst"></span></span>
								</h5>
								<h5 class="d-flex justify-content-between align-items-center">
									<strong>Delivery Charges:</strong> <span id="delivery-charges">
										<span id="delivery-fee" style="font-size: smaller;">&#8377;<span
											id="delivery-fee-value">30.00</span></span> <span id="free-label"
										class="text-muted" style="font-size: smaller; display: none;">free</span>
									</span>
								</h5>

								<h5 class="d-flex justify-content-between align-items-center">
									<strong>Total:</strong> <strong>&#8377;<span
										id="cart-total"></span></strong>
								</h5>
								<hr>
								<button class="btn btn-success w-100">Checkout</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="empty-cart" class="container py-5 text-center"
			style="display: none;">
			<h1 class="title">Cart is Empty</h1>
			<i class="bi bi-cart-x" style="font-size: 4rem;"></i>
			<p class="item">You have no items in your cart.</p>
		</section>
	</main>
	<script src="<c:url value='/js/cart.js'/>"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>