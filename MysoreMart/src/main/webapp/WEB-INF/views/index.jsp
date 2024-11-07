<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="<c:url value='/css/index.css'/>" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        // Define the base URL for AJAX requests
        var baseUrl = "<c:url value='/add'/>"; 
    </script>
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container">
            <a class="navbar-brand" href="/MysoreMart/">
                <img src="images/product/mart.png" alt="Bootstrap" width="200" height="75">
            </a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">
                        <button type="button" class="btn btn-outline-dark">Login/SignUp</button>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/MysoreMart/cart" style="position: relative;">
                        <i class="bi bi-cart4 text-danger fs-2"></i>
                        <span id="cart-count" class="badge bg-danger" style="display: none;">0</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <main>
        <div id="success-alert" class="alert alert-success" role="alert" style="display: none;">
            Item has been added to cart successfully.
        </div>

		<form action="add" method="post" id="cart-form">
			<div class="row">
				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/turmeric.jpg" class="card-img-top"
							alt="Turmeric">
						<div class="card-body">
							<h5 class="card-title">Turmeric</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Bright yellow, adds earthy flavor to
								dishes.</p>
							<p class="card-text">
								<strong>&#8377;100</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="quantity-spices"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="3000" data-price="1200">3kg - ₹1200</option>
								</select>
							</div>
							<button type="button" class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>
				<div class="col-md-4 mb-4 spice-item">
					<div class="card spice-card-whole">
						<img src="images/product/apples.jpg" class="card-img-top"
							alt="Turmeric">
						<div class="card-body">
							<h5 class="card-title">Apple</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Bright yellow, adds earthy flavor to
								dishes.</p>
							<p class="card-text">
								<strong>&#8377;250</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="quantity-spices"
									name="selectedQuantity">
									<option value="500" data-price="200">500g - ₹200</option>
									<option value="3000" data-price="1200">3kg - ₹1200</option>
								</select>
							</div>
							<button type="button" class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>

			</div>
		</form>
	</main>
	<script src="<c:url value='/js/index.js'/>"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</body>
</html>
