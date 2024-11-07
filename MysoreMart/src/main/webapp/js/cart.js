$(document).ready(function () {
    // Functionality for decreasing quantity
    $(".decrease-qty").on("click", function () {
        const quantityInput = $(this).closest('.product').find('.quantity');
        let quantity = parseInt(quantityInput.val());

        if (quantity > 1) {
            quantity--;
            quantityInput.val(quantity);
            updateCartTotal();
        }
    });

    // Functionality for increasing quantity
    $(".increase-qty").on("click", function () {
        const quantityInput = $(this).closest('.product').find('.quantity');
        let quantity = parseInt(quantityInput.val());

        quantity++;
        quantityInput.val(quantity);
        updateCartTotal();
    });

    // Functionality for removing an item
    $(".remove-item").on("click", function () {
        $(this).closest('.product').remove();
        updateCartTotal();
    });

	function updateCartTotal() {
	    let subtotal = 0;
	    let totalItems = 0; // Variable to count total items in the cart

	    $(".product").each(function () {
	        const price = parseFloat($(this).find('.price').text()); // Get product price from element
	        const quantity = parseInt($(this).find('.quantity').val()); // Get the current quantity
	        subtotal += price * quantity; // Add to subtotal
	        totalItems += quantity; // Count items
	    });

	    const gstRate = 0.05; // GST rate (5%)
	    const gst = subtotal * gstRate; // Calculate GST
	    const deliveryFee = calculateDeliveryCharges(subtotal); // Calculate delivery charges
	    const total = subtotal + gst + deliveryFee; // Calculate total including GST and delivery

	    // Update the totals in the DOM
	    $("#subtotal").text(subtotal.toFixed(2)); // Update subtotal display
	    $("#gst").text(gst.toFixed(2)); // Update GST display

	    // Update delivery charges display
	    if (deliveryFee === 0) {
	        $("#delivery-fee").html(`&#8377;<span id="delivery-fee-value" style="text-decoration: line-through;">30.00</span> <span id="free-label" class="text-muted" style="font-size: smaller;">free</span>`);
	    } else {
	        $("#delivery-fee").html(`&#8377;<span id="delivery-fee-value">${deliveryFee.toFixed(2)}</span>`);
	        $("#free-label").hide(); // Hide the free label if not applicable
	    }

	    $("#cart-total").text(total.toFixed(2)); // Update total in the DOM

	    // Update the cart item count
	    $("#cart-item-count").text(`${totalItems} item${totalItems !== 1 ? 's' : ''} in your cart`); // Update the item count message

	    // Show/hide empty cart message
	    if (subtotal === 0) {
	        $("#empty-cart").show();        // Show the empty cart message
	        $("#cart-items").hide();        // Hide the cart items
	    } else {
	        $("#empty-cart").hide();        // Hide the empty cart message
	        $("#cart-items").show();        // Show the cart items
	    }
	}


    // Function to calculate delivery charges based on subtotal
    function calculateDeliveryCharges(subtotal) {
        if (subtotal < 100) {
            return 50; // Delivery fee for subtotal less than 100
        } else if (subtotal >= 100 && subtotal <= 199) {
            return 30; // Delivery fee for subtotal between 100 and 199
        } else if (subtotal >= 200 && subtotal <= 300) {
            return 15; // Delivery fee for subtotal between 200 and 300
        } else {
            return 0; // Free delivery for subtotal above 300
        }
    }

    // Initial call to update totals on page load
    updateCartTotal();
});
