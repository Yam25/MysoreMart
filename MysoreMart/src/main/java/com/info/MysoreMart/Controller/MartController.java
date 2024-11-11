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
        return "index"; 
    }


    @GetMapping("/login")
    public String login() {
        return "login";  // Return login.jsp or login.html
    }
    
    @GetMapping("/register")
    public String register() {
        return "register";  // Return login.jsp or login.html
    }
    
    @GetMapping("/forget")
    public String forgot() {
        return "forget";  // Return userForget.jsp  or userForget.html
    }
    
    
    @GetMapping("/cart")
    public String getCartItems(Model model) {
        List<CartDetails> cartItems = cartService.getAllCartItems();
        System.out.println("Fetched cart items: " + cartItems); 
        model.addAttribute("cartItems", cartItems);
        return "cart"; 
    }
    

}
