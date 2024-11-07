<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
          rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        #success-alert {
            position: fixed; /* Fixed position at the top */
            top: 20px; /* Distance from the top */
            left: 50%; /* Center horizontally */
            transform: translateX(-50%); /* Offset to the left by half the width */
            z-index: 1050; /* Above other content */
            width: auto; /* Auto width */
            padding: 10px 20px; /* Padding for better appearance */
            background-color: rgba(144, 238, 144, 0.8);
            /* Light transparent green */
            color: darkgreen; /* Dark green text */
            border-radius: 5px; /* Rounded corners */
        }
        .cart-icon {
            position: relative; /* Ensure the icon is the reference for positioning */
        }

        #cart-count {
            position: absolute; /* Position badge absolutely */
            top: -10px; /* Adjust this value as necessary */
            right: -10px; /* Adjust this value as necessary */
            display: none; /* Initially hide the badge */
            z-index: 10; /* Ensure badge is on top */
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container">
        <a class="navbar-brand ms-0" href="/MysoreMart/">
            <img src="images/product/mart.png" alt="Bootstrap" width="200" height="75">
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
                    <a class="nav-link dropdown-toggle" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false"> Shop by Category </a>
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
            <form class="d-flex mx-auto" role="search">
                <input class="form-control fs-5 me-2" type="search"
                       placeholder="Search" aria-label="Search" style="min-width: 300px;">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">
                        <button type="button" class="btn btn-outline-dark">Login/SignUp</button>
                    </a>
                </li>
                <li class="nav-item ms-2">
                    <a class="nav-link" href="/MysoreMart/cart" style="position: relative;"> <!-- Added position relative -->
                        <i class="bi bi-cart4 text-danger cart-icon fs-2"></i>
                        <span id="cart-count" class="badge bg-danger"
                              style="position: absolute; top: -10px; right: -10px; display: none;">0</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<main>
    <div id="success-alert" class="alert alert-success" role="alert"
         style="display: none;">Item has been added to cart successfully.
    </div>
    <div class="row">
        <div class="col-md-4 mb-4 spice-item">
            <div class="card spice-card-whole">
                <img src="images/turmeric.jpg" class="card-img-top" alt="Turmeric">
                <div class="card-body">
                    <h5 class="card-title">Turmeric</h5>
                    <span class="badge badge-danger">Spice</span>
                    <p class="card-text">Bright yellow, adds earthy flavor to dishes.</p>
                    <p class="card-text">
                        <strong>&#8377;249</strong>
                    </p>
                    <div class="mb-3">
                        <select class="form-select" id="quantity-spices"
                                name="quantity-spices">
                            <option value="500" data-price="200">500g - ₹200</option>
                            <option value="3000" data-price="1200">3kg - ₹1200</option>
                        </select>
                    </div>
                    <button class="btn btn-outline-danger add-to-cart">Add to Cart</button>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4 spice-item">
            <div class="card spice-card-whole">
                <img src="images/turmeric.jpg" class="card-img-top" alt="Turmeric">
                <div class="card-body">
                    <h5 class="card-title">Turmeric</h5>
                    <span class="badge badge-danger">Spice</span>
                    <p class="card-text">Bright yellow, adds earthy flavor to dishes.</p>
                    <p class="card-text">
                        <strong>&#8377;249</strong>
                    </p>
                    <div class="mb-3">
                        <select class="form-select" id="quantity-spices"
                                name="quantity-spices">
                            <option value="500" data-price="200">500g - ₹200</option>
                            <option value="3000" data-price="1200">3kg - ₹1200</option>
                        </select>
                    </div>
                    <button class="btn btn-outline-danger add-to-cart">Add to Cart</button>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    $(document).ready(function() {
        // Initialize cart count
        let cartCount = 0;

        // Functionality for adding to cart
        $(".add-to-cart").on("click", function () {
            // Increment the cart count
            cartCount++;

            // Update the cart count badge
            if (cartCount > 0) {
                $("#cart-count").text(cartCount).show(); // Show the badge and set its value
            }

            // Show the success alert
            $("#success-alert").fadeIn(400).delay(2000).fadeOut(400);
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
