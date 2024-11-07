package com.info.MysoreMart.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.info.MysoreMart.Model.CartDetails;
import com.info.MysoreMart.Service.CartService;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @PostMapping("/add") // Maps to the action of the form in your JSP
    public ResponseEntity<String> insertProduct(
            @RequestParam("pname") String productName,
            @RequestParam("price") double price,
            @RequestParam("selectedQuantity") String selectedQuantity,
            @RequestParam("img") String imgUrl) { // img is now mandatory

        // Create a new CartDetails object
        CartDetails cartDetails = new CartDetails();
        cartDetails.setProductName(productName);
        cartDetails.setPrice(price);
        cartDetails.setSelectedQuantity(selectedQuantity);
        cartDetails.setImgUrl(imgUrl); // Set imgUrl directly since it's mandatory

        // Save the product to the cart
        try {
            cartService.addCartItem(cartDetails);
            return ResponseEntity.ok("Item added to cart successfully");
        } catch (Exception e) {
            e.printStackTrace(); // Print the stack trace for debugging
            return ResponseEntity.status(500).body("Error adding item to cart");
        }
    }
    
    // Delete method to remove an item from the cart
    @PostMapping("/remove") // New method to handle item removal
    public ResponseEntity<String> deleteProduct(@RequestParam("pname") String productName) {
        try {
            boolean deleted = cartService.deleteCartItemByName(productName);
            if (deleted) {
                return ResponseEntity.ok("Item removed from cart successfully");
            } else {
                return ResponseEntity.status(404).body("Item not found in cart");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error removing item from cart");
        }
    }
   
}
