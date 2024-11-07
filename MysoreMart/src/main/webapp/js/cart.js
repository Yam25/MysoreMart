$(document).ready(function () {
    // Update the cart totals on page load
    updateCart();

    // Increase quantity of an item
    $(".increase-qty").click(function () {
        let quantityInput = $(this).siblings(".quantity");
        let newQuantity = parseInt(quantityInput.val()) + 1;
        quantityInput.val(newQuantity);
        updateCart();
    });

    // Decrease quantity of an item
    $(".decrease-qty").click(function () {
        let quantityInput = $(this).siblings(".quantity");
        let newQuantity = Math.max(1, parseInt(quantityInput.val()) - 1);
        quantityInput.val(newQuantity);
        updateCart();
    });

	$(".remove-item").click(function () {
	    var productName = $(this).closest(".product").find('.card-title').text().trim();

	    $.ajax({
	        url: baseUrl,
	        type: 'POST',
	        contentType: 'application/x-www-form-urlencoded', // Explicitly stating the content type
	        data: { pname: productName },
	        success: function(response) {
	            alert(response);
	            $(this).closest(".product").remove();
	            updateCart();
	        }.bind(this),
	        error: function(xhr) {
	            alert('Error deleting item: ' + xhr.responseText);
	        }
	    });
	});
    // Function to update the cart totals and item count
    function updateCart() {
        let subtotal = 0;
        let itemCount = 0;

        // Calculate subtotal and item count
        $(".product").each(function () {
            let price = parseFloat($(this).data("price"));
            let quantity = parseInt($(this).find(".quantity").val());
            subtotal += price * quantity;
            itemCount += quantity; // Update total item count
        });

        // Calculate GST and delivery fees based on subtotal
        let gst = subtotal * 0.05; // 5% GST
        let deliveryFee;

        // Determine delivery fee based on subtotal
        if (subtotal < 100) {
            deliveryFee = 50;
        } else if (subtotal >= 100 && subtotal <= 199) {
            deliveryFee = 30;
        } else if (subtotal >= 200 && subtotal < 300) {
            deliveryFee = 15;
        } else {
            deliveryFee = 0;
        }

        let total = subtotal + gst + deliveryFee;

        // Update the displayed totals
        $("#subtotal").text(subtotal.toFixed(2));
        $("#gst").text(gst.toFixed(2));
        $("#delivery-fee-value").text(deliveryFee.toFixed(2));
        $("#cart-total").text(total.toFixed(2));

        // Update the cart item count display
        $("#cart-item-count").text(itemCount + " items in your cart");

        // Show or hide the empty cart message
        if ($(".product").length === 0) {
            $("#empty-cart").show();
            $("#cart-items").hide();
        } else {
            $("#empty-cart").hide();
            $("#cart-items").show();
        }
    }
});
