package com.info.MysoreMart.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MartController {

    @GetMapping("/")
    public String home() {
        return "index"; // This maps to /WEB-INF/views/index.jsp
    }

    @GetMapping("/cart")
    public String cart() {
        return "cart"; // This maps to /WEB-INF/views/cart.jsp
    }
}
