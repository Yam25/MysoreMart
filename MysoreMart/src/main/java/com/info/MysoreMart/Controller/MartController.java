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
        return "login"; 
    }
    
    @GetMapping("/register")
    public String register() {
        return "register"; 
    }
    
    @GetMapping("/forget")
    public String forgot() {
        return "forget";  
    }
    
    @GetMapping("/fruits")
    public String fruits() {
        return "fruits";  
    }
    @GetMapping("/biscuits")
    public String biscuits() {
        return "biscuits";  
    }
    
    @GetMapping("/dal-pulses")
    public String dalpulses() {
        return "dal-pulses";  
    }
    
    @GetMapping("/grocery")
    public String grocery() {
        return "grocery";  
    }
    
    @GetMapping("/dryFruits")
    public String dryFruits() {
        return "dryFruits";  
    }
    
    @GetMapping("/cart")
    public String getCartItems(Model model) {
        List<CartDetails> cartItems = cartService.getAllCartItems();
        System.out.println("Fetched cart items: " + cartItems); 
        model.addAttribute("cartItems", cartItems);
        return "cart"; 
    }
    

}
