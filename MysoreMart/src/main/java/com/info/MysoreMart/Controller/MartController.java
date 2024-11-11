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
    
    @GetMapping("/index")
    public String index() {
        return "index"; 
    }
	
	@GetMapping("/dairyProducts")
    public String dairyProducts() {
        return "dairyProducts"; 
    }
	
	@GetMapping("/dryFruits")
    public String dryfruits() {
        return "dryFruits"; 
    }
	
	@GetMapping("/vegetable")
    public String veggies() {
        return "vegetable"; 
    }
	
	@GetMapping("/spices")
    public String spices() {
        return "spices"; 
    }
	
	@GetMapping("/fruits")
    public String fruits() {
        return "fruits"; 
    }
	
	@GetMapping("/biscuits")
    public String dummy() {
        return "biscuits"; 
    }
	
	@GetMapping("/dal-pulses")
    public String dal_pulses() {
        return "dal-pulses"; 
    }
	
	@GetMapping("/grocery")
    public String grocery() {
        return "grocery"; 
    }

    
    
    @GetMapping("/cart")
    public String getCartItems(Model model) {
        List<CartDetails> cartItems = cartService.getAllCartItems();
        System.out.println("Fetched cart items: " + cartItems); 
        model.addAttribute("cartItems", cartItems);
        return "cart"; 
    }
    

}
