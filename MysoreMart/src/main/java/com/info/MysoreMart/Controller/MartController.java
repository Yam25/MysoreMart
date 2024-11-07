package com.info.MysoreMart.Controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.info.MysoreMart.Model.CartDetails;
import com.info.MysoreMart.Service.CartService;

@Controller
public class MartController {

	@Autowired
    private CartService cartService;
    @GetMapping("/")
    public String home() {
        return "index"; // This maps to /WEB-INF/views/index.jsp
    }

    @GetMapping("/cart")
    public String getCartItems(Model model) {
        List<CartDetails> cartItems = cartService.getAllCartItems();
        System.out.println("Fetched cart items: " + cartItems); // Log fetched cart items
        model.addAttribute("cartItems", cartItems);
        return "cart"; // Return the view name for cart.jsp
    }

}
