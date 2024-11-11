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
	background: linear-gradient(135deg, #B6F1A0, #FFB3B3);
	background-size: cover;
	background-position: center;
	color: #333; 
}

.dryfruit-card {
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

.dryfruit-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.dryfruit-card:hover {
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
</style>
<script>
    let currentPage = 1;
    const itemsPerPage = 6;

    function showPage(page) {
        const items = document.querySelectorAll('.dryfruit-item');
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
        const totalItems = document.querySelectorAll('.dryfruit-item').length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        let paginationHtml = '';

        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<a href="javascript:void(0);" onclick="showPage(${i})">${i}</a>`;
        }

        document.getElementById('pagination').innerHTML = paginationHtml;
        currentPage = page;
    }

    function searchDryFruits() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const items = document.querySelectorAll('.dryfruit-item');
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
							<li><a class="dropdown-item" href="fruits">Fruits</a></li>
							<li><a class="dropdown-item" href="vegetable">Vegetables</a></li>
							<li><a class="dropdown-item" href="biscuits">Sip-Snack</a></li>
							<li><a class="dropdown-item" href="dairyProducts">Dairy
									Products</a></li>
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
					<li class="nav-item ms-2"><a class="nav-link"
						href="/MysoreMart/cart"> <i
							class="bi bi-cart4 text-danger cart-icon fs-1"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="text-center mb-4">
		<div class="search-container w-50 d-inline">
			<input type="text" id="searchInput" class="form-control"
				placeholder="Search dry fruits by name..."
				onkeyup="searchDryFruits()"> <i
				class="fas fa-search search-icon"></i>
		</div>
	</div>

	<div id="menu" class="container mt-5">
		<h2 class="text-center mb-4">Fresh Dry Fruits</h2>
		<div class="row">
			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/almonds.jpg"
						class="card-img-top" alt="Almonds">
					<div class="card-body">
						<h5 class="card-title">Almonds</h5>
						<p class="card-text">A nutrient-dense nut rich in healthy
							fats, protein, and fiber.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/cashews.jpg"
						class="card-img-top" alt="Cashews">
					<div class="card-body">
						<h5 class="card-title">Cashews</h5>
						<p class="card-text">Creamy, mild-flavored nuts packed with
							vitamins, minerals antioxidants.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/walnuts.jpg"
						class="card-img-top" alt="Walnuts">
					<div class="card-body">
						<h5 class="card-title">Walnuts</h5>
						<p class="card-text">A rich source of omega-3 brain health and
							heart function.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/pista.jpg" class="card-img-top"
						alt="Pistachios">
					<div class="card-body">
						<h5 class="card-title">Pistachios</h5>
						<p class="card-text">Small, crunchy nuts rich in protein,
							fiber, and antioxidants.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/raisins.jpg"
						class="card-img-top" alt="Raisins">
					<div class="card-body">
						<h5 class="card-title">Raisins</h5>
						<p class="card-text">Dried grapes high in iron, fiber, and
							antioxidants.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/dates.jpg" class="card-img-top"
						alt="Dates">
					<div class="card-body">
						<h5 class="card-title">Dates</h5>
						<p class="card-text">Naturally sweet and nutrient-packed
							fruits, rich in fiber, antioxidants.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/prunes.jpg" class="card-img-top"
						alt="Prunes">
					<div class="card-body">
						<h5 class="card-title">Prunes</h5>
						<p class="card-text">Dried plums, rich in fiber, potassium,
							and antioxidants.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/figs.jpg" class="card-img-top"
						alt="Figs">
					<div class="card-body">
						<h5 class="card-title">Figs</h5>
						<p class="card-text">Sweet, chewy fruits that are high in
							fiber, minerals, and antioxidants.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/apricots.jpg"
						class="card-img-top" alt="Apricots">
					<div class="card-body">
						<h5 class="card-title">Apricots</h5>
						<p class="card-text">Small, sweet fruits that are high in
							vitamins A and C, antioxidants.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/cherries.jpg"
						class="card-img-top" alt="Cherries">
					<div class="card-body">
						<h5 class="card-title">Cherries</h5>
						<p class="card-text">A sweet, tangy fruit, cherries are rich
							in antioxidants and vitamins.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/hazelnuts.jpg"
						class="card-img-top" alt="Hazelnuts">
					<div class="card-body">
						<h5 class="card-title">Hazelnuts</h5>
						<p class="card-text">A sweet, slightly buttery nut with a rich
							flavor, fiber, and vitamin E.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/macadamia.jpg"
						class="card-img-top" alt="Macadamia Nuts">
					<div class="card-body">
						<h5 class="card-title">Macadamia Nuts</h5>
						<p class="card-text">Rich, buttery-flavored nuts with a
							high-fat content.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/brazil.jpg" class="card-img-top"
						alt="Brazil Nuts">
					<div class="card-body">
						<h5 class="card-title">Brazil Nuts</h5>
						<p class="card-text">A highly nutritious nut, rich in selenium
							and healthy fats.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/cranberry.jpg"
						class="card-img-top" alt="Cranberries (Dried)">
					<div class="card-body">
						<h5 class="card-title">Cranberries (Dried)</h5>
						<p class="card-text">Tart, dried cranberries, high in
							antioxidants, vitamin C.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/gojiberry.jpg"
						class="card-img-top" alt="Goji Berries">
					<div class="card-body">
						<h5 class="card-title">Goji Berries</h5>
						<p class="card-text">Tiny red berries packed with
							antioxidants, vitamins, and minerals.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/mulberries.jpg"
						class="card-img-top" alt="Mulberries (Dried)">
					<div class="card-body">
						<h5 class="card-title">Mulberries (Dried)</h5>
						<p class="card-text">Sweet, chewy dried berries, high in
							vitamin C, iron, and antioxidants.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/blueberry.jpg"
						class="card-img-top" alt="Blueberries (Dried)">
					<div class="card-body">
						<h5 class="card-title">Blueberries (Dried)</h5>
						<p class="card-text">Sweet and tangy dried berries, rich in
							antioxidants, vitamins.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4 dryfruit-item">
				<div class="card dryfruit-card">
					<img src="images/product/dryFruits/blackberries.jpg"
						class="card-img-top" alt="Blackberries (Dried)">
					<div class="card-body">
						<h5 class="card-title">Blackberries (Dried)</h5>
						<p class="card-text">Sweet, tart berries that are high in
							vitamins C and K, fiber.</p>
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
						<button class="btn btn-outline-danger add-to-cart">Add to
							Cart</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="pagination" class="pagination-container"></div>

	<footer class="text-center">
		<p>Dry Fruits Mart.</p>
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

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>