<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description"
	content="MysuruMart offers the best deals on groceries, home goods, and more. Shop now for amazing discounts and fast delivery.">
 
<meta name="keywords"
	content="grocery, provisions, home goods, online shopping, MysoreMart, buy online, best deals">
<meta name="robots" content="index, follow">
    <title>MysoreMart - Shop the Best Deals on Groceries &
	Provisions</title>
	<link rel="icon" href="images/product/mart.png" sizes="256x256"
	type="image/png">
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
			<a class="navbar-brand ms-0" href="/MysoreMart/"> <img
				src="images/product/mart.png" alt="Mysore Mart" width="200"
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
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Shop by
							Category </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="fruits">Fruits</a></li>
							<li><a class="dropdown-item" href="vegetable">Vegetables</a></li>
							<li><a class="dropdown-item" href="biscuits">Snacks</a></li>
							<li><a class="dropdown-item" href="dairyProducts">Dairy
									Products</a></li>
							<li><a class="dropdown-item" href="dryFruits">Dry Fruits</a></li>
							<li><a class="dropdown-item" href="spices">Spices/Oils</a></li>
							<li><a class="dropdown-item" href="dal-pulses">Dal/Pulses</a></li>
							<li><a class="dropdown-item" href="grocery">Wholesome
									Grains</a></li>
						</ul></li>
				</ul>
				<form class="d-flex mx-auto" role="search">
					<input class="form-control fs-5 me-2" type="search"
						placeholder="Search" aria-label="Search" style="min-width: 300px;">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<ul
					class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex align-items-center">
					<!-- Added d-flex and align-items-center -->
					<li class="nav-item"><a class="nav-link" href="/MysoreMart/login">
							<button type="button" class="btn btn-outline-dark">Login/SignUp</button>
					</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="/MysoreMart/cart" style="position: relative;">
                        <i class="bi bi-cart4 text-danger fs-2"></i>
                        <span id="cart-count" class="badge bg-danger" style="display: none;">0</span>
                    </a>
                </li>
            </ul>
        </div>
        </div>
    </nav>

    <main>
        <div id="success-alert" class="alert alert-success" role="alert" style="display: none;">
            Item has been added to cart successfully.
        </div>
        <section id="carouselExampleAutoplaying" class="carousel slide mt-3"
			data-bs-ride="carousel" data-bs-interval="1500">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="4" aria-label="Slide 5"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="5" aria-label="Slide 6"></button>
			</div>
			<div class="carousel-inner col-6 col-md-4 col-lg-4 mb-4">
				<div class="carousel-item active">
					<img src="images/product/fruits.jpg"
						class="d-block w-100 c-img  img-fluid" alt="Fruits">
				</div>
				<div class="carousel-item">
					<img src="images/product/veggies.jpg"
						class="d-block w-100 c-img img-fluid " alt="Vegetables">
				</div>
				<div class="carousel-item">
					<img src="images/product/milk and dairy products.jpg"
						class="d-block w-100 c-img img-fluid"
						alt="Milk and Dairy Prodducts">
				</div>
				<div class="carousel-item">
					<img src="images/product/pulses.jpg"
						class="d-block w-100 c-img  img-fluid" alt="Pulses">
				</div>
				<div class="carousel-item">
					<img
						src="images/product/Mobile Shop Ad - Made with PosterMyWall.jpg"
						class="d-block w-100 img-fluid" alt="Banner">
				</div>
				<div class="carousel-item">
					<video class="d-block w-100 autoplay loop muted" controls>
						<source
							src="images/product/Fresh organic vegetable flyer - Made with PosterMyWall.mp4"
							type="video/mp4">
					</video>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</section>
 
		<section id="filter">
			<div class="category-container">

				<a href="fruits" class="category-link">
					<button class="category-btn" aria-label="Fresh Fruits">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/fruits.jpg" alt="Fresh Fruits" />
							</div>
							<div class="category-text">Fruits</div>
						</div>
					</button>
				</a> <a href="dairyProducts" class="category-link">
					<button class="category-btn" aria-label="Dairy Products">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/milk and dairy products.jpg"
									alt="Dairy Products" />
							</div>
							<div class="category-text">Dairy</div>
						</div>
					</button>
				</a> <a href="dal-pulses" class="category-link">
					<button class="category-btn" aria-label="Pulses">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/pulses.jpg" alt="Pulses" />
							</div>
							<div class="category-text">Dal/Pulses</div>
						</div>
					</button>
				</a> <a href="vegetable" class="category-link">
					<button class="category-btn" aria-label="Fresh Vegetables">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/veggies.jpg" alt="Fresh Vegetables" />
							</div>
							<div class="category-text">Vegetables</div>
						</div>
					</button>
				</a> <a href="biscuits" class="category-link">
					<button class="category-btn" aria-label="Sip-Snack">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/snacks.jpg" alt="Sip-Snack" />
							</div>
							<div class="category-text">Sip-Snack</div>
						</div>
					</button>
				</a> <a href="dryFruits" class="category-link">
					<button class="category-btn" aria-label="Dry Fruits">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/dry-fruits.jpg" alt="Dry Fruits" />
							</div>
							<div class="category-text">Dry Fruits</div>
						</div>
					</button>
				</a> <a href="grocery" class="category-link">
					<button class="category-btn" aria-label="Wholesome Grains">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/grains.jpg" alt="Wholesome Grains" />
							</div>
							<div class="category-text">Grains</div>
						</div>
					</button>
				</a>  <a href="spices" class="category-link">
					<button class="category-btn" aria-label="Spices/Oils">
						<div class="category-content">
							<div class="veggies">
								<img src="images/product/spices.jpg" alt="Spices/Oils" />
							</div>
							<div class="category-text">Spices</div>
						</div>
					</button>
				</a>
			</div>
		</section>
		<form action="add" method="post" id="cart-form">
			<div class="row">
				<div class="col-md-4 mb-4 product">
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
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="100">500g - ₹100</option>
									<option value="1kg" data-price="200">1kg - ₹200</option>
								</select>
							</div>
							<button type="button" class="btn btn-outline-danger add-to-cart">Add
								to Cart</button>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 mb-4 product">
					<div class="card spice-card-whole">
						<img src="images/product/apples.jpg" class="card-img-top"
							alt="Turmeric">
						<div class="card-body">
							<h5 class="card-title">Apple</h5>
							<span class="badge badge-danger">Spice</span>
							<p class="card-text">Bright yellow, adds earthy flavor to
								dishes.</p>
							<p class="card-text">
								<strong>&#8377;200</strong>
							</p>
							<div class="mb-3">
								<select class="form-select" id="selectedQuantity"
									name="selectedQuantity">
									<option value="500g" data-price="200">500g - ₹200</option>
									<option value="1kg" data-price="400">1kg - ₹400</option>
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