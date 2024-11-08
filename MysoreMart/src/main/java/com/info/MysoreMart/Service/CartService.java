package com.info.MysoreMart.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.info.MysoreMart.Model.CartDetails;
import com.info.MysoreMart.Repository.CartRepo;

@Service
public class CartService {
    @Autowired
    private CartRepo cartRepo;

    public void addCartItem(CartDetails cartDetails) {
        cartRepo.addCartItem(cartDetails);
    }

    public List<CartDetails> getAllCartItems() {
        return cartRepo.getAllCartItems(); // Fetch all cart items from the database
    }

	public boolean deleteCartItemById(long id) {
		
		return cartRepo.deleteCartItemById(id);
	}
}
