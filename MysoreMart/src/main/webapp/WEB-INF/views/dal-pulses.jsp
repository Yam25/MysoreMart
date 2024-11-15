<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MysoreMart - Shop the Best Deals on Groceries &
	Provisions</title> 
<link rel="icon" href="images/product/logo 1.png" type="image/png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
}

body {
	background-size: cover;
	background-position: center; 
	color: #333; 
}

.dal-card {
	width: 300px;
	height: 460px;
	margin: auto;
	overflow: hidden;
	text-align: center;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
}

.dal-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.dal-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

footer {
	margin-top: 40px;
	font-weight: bold;
}

.btn {
	transition: background-color 0.3s, transform 0.2s;
}

.btn:hover {
	transform: scale(1.25);
}

input[type="text"] {
	width: 80%;
	padding: 10px;
	margin: 10px 0;
	border: flex;
	border-radius: 5px;
	background-color: #ffffff;
	color: #444;
	font-size: 16px;
}

.search-container {
	position: relative;
	width: 100%;
}

#searchInput {
	width: 100%;
	padding: 10px 15px 10px 15px;
	padding-right: 40px;
	font-size: 1rem;
	border: 1px solid #ddd;
	outline: none;
	transition: box-shadow 0.3s ease;
}

#searchInput:focus {
	box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
	border-color: #007bff;
}

#searchInput::placeholder {
	color: #aaa;
}

.search-icon {
	position: absolute;
	top: 50%;
	right: 15px;
	transform: translateY(-50%);
	color: #aaa;
	font-size: 1rem;
}

.pagination-container {
	text-align: center;
	margin-top: 20px;
}

.pagination-container a {
	padding: 8px 15px;
	margin: 0 5px;
	border: 1px solid #ddd;
	border-radius: 5px;
	color: #007bff;
	text-decoration: none;
}

.pagination-container a:hover {
	background-color: #007bff;
	color: white;
}

#success-alert {
	position: fixed;
	top: 20px;
	left: 50%;
	transform: translateX(-50%);
	z-index: 1050;
	width: auto;
	padding: 10px 20px;
	background-color: rgba(144, 238, 144, 0.8);
	color: darkgreen;
	border-radius: 5px;
}

.cart-icon {
	position: relative;
}

#cart-count {
	position: absolute;
	top: -10px;
	right: -10px;
	display: none;
	z-index: 10;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
<script>
    let currentPage = 1;
    const itemsPerPage = 6;

    function showPage(page) {
        const items = document.querySelectorAll('.dal-item');
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;

        items.forEach((item, index) => {
            if (index >= start && index < end) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });

        updatePagination(page);
    }

    function updatePagination(page) {
        const totalItems = document.querySelectorAll('.dal-item').length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        let paginationHtml = '';

        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<a href="javascript:void(0);" onclick="showPage(${i})">${i}</a>`;
        }

        document.getElementById('pagination').innerHTML = paginationHtml;
        currentPage = page;
    }

    function searchDals() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const items = document.querySelectorAll('.dal-item');
        items.forEach(item => {
            const title = item.querySelector('.card-title').textContent.toLowerCase();
            if (title.includes(searchInput)) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });

        updatePagination(currentPage);
    }

    window.onload = function() {
        showPage(1);
    };
    
    document.addEventListener('DOMContentLoaded', function () {
		
    	  const productContainer = document.querySelector('#menu'); 

    	  if (productContainer) {
    	    productContainer.addEventListener('change', function (event) {
    	      
    	      if (event.target && event.target.tagName.toLowerCase() === 'select') {
    	        const selectedOption = event.target.options[event.target.selectedIndex];
    	        const price = selectedOption.getAttribute('data-price');
    	        const priceElement = event.target.closest('.card-body').querySelector('strong');
    	        
    	        if (priceElement) {
    	          priceElement.textContent = `₹${price}`;
    	        }
    	      }
    	    });

    	    
    	    const selectElements = productContainer.querySelectorAll('select');
    	    selectElements.forEach(function (select) {
    	      const selectedOption = select.options[select.selectedIndex];
    	      const priceElement = select.closest('.card-body').querySelector('strong');
    	      const price = selectedOption.getAttribute('data-price');
    	      if (priceElement) {
    	        priceElement.textContent = `₹${price}`;
    	      }
    	    });
    	  }
    	});
</script>
<script>
        // Define the base URL for AJAX requests
        var baseUrl = "<c:url value='/add'/>";
    </script>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container">
			<a class="navbar-brand ms-0" href="index"> <img
				src="images/product/logo 1.png" alt="Mysore Mart" width="200"
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
							<li><a class="dropdown-item" href="vegetable">Vegetables</a></li>
							<li><a class="dropdown-item" href="biscuits">Sip-Snack</a></li>
							<li><a class="dropdown-item" href="dairyProducts">Dairy
									Products</a></li>
							<li><a class="dropdown-item" href="dryFruits">Dry Fruits</a></li>
							<li><a class="dropdown-item" href="spices">Spices/Oils</a></li>
							<li><a class="dropdown-item" href="dal-pulses">Dal/Pulses</a></li>
							<li><a class="dropdown-item" href="grocery">Wholesome
									Grains</a></li>
						</ul></li>
				</ul>
				
				<ul
					class="navbar-nav ms-auto mb-2 mb-lg-0 d-flex align-items-center">
					<!-- Added d-flex and align-items-center -->
					<li class="nav-item"><a class="nav-link" href="login.jsp">
							<button type="button" class="btn btn-outline-dark">Login/SignUp</button>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/MysoreMart/cart" style="position: relative;"> <i
							class="bi bi-cart4 text-danger fs-2"></i> <span id="cart-count"
							class="badge bg-danger" style="display: none;">0</span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div id="success-alert" class="alert alert-success" role="alert"
		style="display: none;">Item has been added to cart successfully.
	</div>

	<div class="text-center mb-4">
		<div class="search-container w-50 d-inline">
			<input type="text" id="searchInput" class="form-control"
				placeholder="Search dals/pulses by name..." onkeyup="searchDals()">
			<i class="fas fa-search search-icon"></i>
		</div>
	</div>

<form action="add" method="post" id="cart-form">
	<div id="menu" class="container mt-5">
		<h2 class="text-center mb-4">Indian Dals & Pulses</h2>
		<div class="row">
			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/toor-dal.jpg"
						class="card-img-top" alt="Toor Dal">
					<div class="card-body">
						<h5 class="card-title">Toor Dal</h5>
						<p class="card-text">Popular yellow lentils used in curries
							and dals.</p>
						<p class="card-text">
							<strong>&#8377;50</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="50">100g - ₹50</option>
								<option value="500" data-price="220">500g - ₹220</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/chana-dal.jpg"
						class="card-img-top" alt="Chana Dal">
					<div class="card-body">
						<h5 class="card-title">Chana Dal</h5>
						<p class="card-text">Split chickpeas, often used in soups and
							snacks.</p>
						<p class="card-text">
							<strong>&#8377;60</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="60">100g - ₹60</option>
								<option value="500" data-price="250">500g - ₹250</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/masoor-dal.jpg"
						class="card-img-top" alt="Masoor Dal">
					<div class="card-body">
						<h5 class="card-title">Masoor Dal</h5>
						<p class="card-text">Red lentils that cook quickly, used in
							dals and soups.</p>
						<p class="card-text">
							<strong>&#8377;40</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="40">100g - ₹40</option>
								<option value="500" data-price="180">500g - ₹180</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/moong-dal.jpg"
						class="card-img-top" alt="Moong Dal">
					<div class="card-body">
						<h5 class="card-title">Moong Dal</h5>
						<p class="card-text">Green gram, split or whole, used in soups
							and curries.</p>
						<p class="card-text">
							<strong>&#8377;70</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="70">100g - ₹70</option>
								<option value="500" data-price="300">500g - ₹300</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/urad-dal.jpg"
						class="card-img-top" alt="Urad Dal">
					<div class="card-body">
						<h5 class="card-title">Urad Dal</h5>
						<p class="card-text">Black gram, often used in South Indian
							dishes.</p>
						<p class="card-text">
							<strong>&#8377;80</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="80">100g - ₹80</option>
								<option value="500" data-price="350">500g - ₹350</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/arhar-dal.jpg"
						class="card-img-top" alt="Arhar Dal">
					<div class="card-body">
						<h5 class="card-title">Arhar Dal</h5>
						<p class="card-text">Another name for Toor Dal, commonly used
							in dals and curries.</p>
						<p class="card-text">
							<strong>&#8377;55</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="55">100g - ₹55</option>
								<option value="500" data-price="240">500g - ₹240</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/rajma.jpg" class="card-img-top"
						alt="Rajma">
					<div class="card-body">
						<h5 class="card-title">Rajma</h5>
						<p class="card-text">Kidney beans, often used in Indian
							curries.</p>
						<p class="card-text">
							<strong>&#8377;100</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="100">100g - ₹100</option>
								<option value="500" data-price="450">500g - ₹450</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/kabuli.jpg"
						class="card-img-top" alt="Kabuli Chana">
					<div class="card-body">
						<h5 class="card-title">Kabuli Chana</h5>
						<p class="card-text">Chickpeas, widely used in curries and
							salads.</p>
						<p class="card-text">
							<strong>&#8377;120</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="120">100g - ₹120</option>
								<option value="500" data-price="550">500g - ₹550</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/kala-chana.jpg"
						class="card-img-top" alt="Kala Chana">
					<div class="card-body">
						<h5 class="card-title">Kala Chana</h5>
						<p class="card-text">Black chickpeas, often used in Indian
							stews and curries.</p>
						<p class="card-text">
							<strong>&#8377;110</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="110">100g - ₹110</option>
								<option value="500" data-price="480">500g - ₹480</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/moth-bean.jpg"
						class="card-img-top" alt="Moth Beans">
					<div class="card-body">
						<h5 class="card-title">Moth Beans</h5>
						<p class="card-text">Also known as Matki, used in a variety of
							Indian dishes.</p>
						<p class="card-text">
							<strong>&#8377;60</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="60">100g - ₹60</option>
								<option value="500" data-price="250">500g - ₹250</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/lobia.jpg" class="card-img-top"
						alt="Lobia">
					<div class="card-body">
						<h5 class="card-title">Lobia</h5>
						<p class="card-text">Black-eyed peas, often used in curries
							and stews.</p>
						<p class="card-text">
							<strong>&#8377;90</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="90">100g - ₹90</option>
								<option value="500" data-price="400">500g - ₹400</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/sabut-methi.jpg"
						class="card-img-top" alt="Sabut Methi">
					<div class="card-body">
						<h5 class="card-title">Sabut Methi</h5>
						<p class="card-text">Fenugreek seeds, often used for their
							bitter flavor.</p>
						<p class="card-text">
							<strong>&#8377;30</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="30">100g - ₹30</option>
								<option value="500" data-price="140">500g - ₹140</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/double-bean.jpg"
						class="card-img-top" alt="Tuar Dal">
					<div class="card-body">
						<h5 class="card-title">Double Bean</h5>
						<p class="card-text">They are rich in protein, fiber, iron,
							and other essential nutrients.</p>
						<p class="card-text">
							<strong>&#8377;50</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="quantity-tuar-dal"
								name="selectedQuantity">
								<option value="100" data-price="50">100g - ₹50</option>
								<option value="500" data-price="220">500g - ₹220</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/bengal-gram.jpg"
						class="card-img-top" alt="Bengal Gram">
					<div class="card-body">
						<h5 class="card-title">Bengal Gram</h5>
						<p class="card-text">A type of chickpea used in a variety of
							recipes.</p>
						<p class="card-text">
							<strong>&#8377;85</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="85">100g - ₹85</option>
								<option value="500" data-price="400">500g - ₹400</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/green-gram.jpg"
						class="card-img-top" alt="Green gram">
					<div class="card-body">
						<h5 class="card-title">Green Gram</h5>
						<p class="card-text">It is a rich source of protein, fiber,
							and nutrients, vitamins A, C, and E.</p>
						<p class="card-text">
							<strong>&#8377;50</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="quantity-green-gram">
								<option value="100" data-price="50">100g - ₹50</option>
								<option value="500" data-price="220">500g - ₹220</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dal-item">
				<div class="card dal-card">
					<img src="images/product/dal-pulses/mix-pulses.jpg"
						class="card-img-top" alt="Pulses Mix">
					<div class="card-body">
						<h5 class="card-title">Pulses Mix</h5>
						<p class="card-text">A mix of various lentils and pulses for
							everyday cooking.</p>
						<p class="card-text">
							<strong>&#8377;100</strong>
						</p>
						<div class="mb-3">
							<select class="form-select" id="selectedQuantity"
								name="selectedQuantity">
								<option value="100" data-price="100">100g - ₹100</option>
								<option value="500" data-price="450">500g - ₹450</option>
							</select>
						</div>
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

	<div id="pagination" class="pagination-container"></div>

	<footer class="text-center mt-5">
		<p>Dals & Pulses - The Taste of Tradition!</p>
	</footer>
	<footer class="text-center mt-5">
		<p>Enjoy Nature's Fresh Fruits!</p>
		<p>
			<a href="index" class="text-success">Go back to Home</a>
		</p>
	</footer>
	<footer class="bg-dark py-3 mt-3">
		<div id="contact" class="conatiner text-light text-center">
			<h4>Contact Us</h4>
			<p>Email: support@mysoremart.com</p>
			<p>Phone: +91 9988776655</p>
		</div>
		<div class="container text-light text-center">
			<a class="navbar-brand ms-0" href="index"> <img
				src="images/product/logo 1.png" alt="Mysore Mart" width="200"
				height="75">
			</a> <br> <small class="text-white-50">&copy; 2024
				MysoreMart. All rights reserved. </small>
			<!-- copy symbol and  white text with 50% opacity -->
		</div>
	</footer>
	<script src="<c:url value='/js/index.js'/>"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>
