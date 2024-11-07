let cartCount = 0; // Initialize cart count

	$(document).ready(function () {
	    $(".add-to-cart").on("click", function (e) {
	        e.preventDefault(); // Prevent the default form submission

	        const $card = $(this).closest('.card'); // Get the closest card element
	        const productName = $card.find('.card-title').text().trim(); // Get the product name
	        const priceText = $card.find('.card-text strong').text(); // Get the price text
	        const price = parseFloat(priceText.replace(/[^0-9.-]+/g, "")); // Extract numeric value from price text
	        const selectedQuantity = $card.find('select[name="selectedQuantity"]').val(); // Get the selected quantity
	        const imgUrl = $card.find('img').attr('src'); // Get the image source

	        // Check if all required values are provided
	        if (!productName || !selectedQuantity || !imgUrl) {
	            alert("Product name, selected quantity, and image URL are required.");
	            return; // Stop execution if required fields are empty
	        }

	        $.ajax({
	            type: "POST",
	            url: baseUrl, //using base url
	            contentType: 'application/x-www-form-urlencoded',
	            data: {
	                pname: productName,
	                price: price,
	                selectedQuantity: selectedQuantity,
	                img: imgUrl // Send img URL to the server
	            },
	            success: function () {
	                // Show success alert
	                $("#success-alert").fadeIn(400).delay(2000).fadeOut(400);
	                cartCount++; // Increment the cart count
	                $("#cart-count").text(cartCount).show(); // Update the cart count badge
	            },
	            error: function () {
	                alert("There was an error adding the item to the cart.");
	            }
	        });
	    });
	});