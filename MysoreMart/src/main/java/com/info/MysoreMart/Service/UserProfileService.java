package com.info.MysoreMart.Service;

import com.info.MysoreMart.Model.Userprofile;
import com.info.MysoreMart.Repository.UserProfileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserProfileService {

    @Autowired
    private UserProfileRepository upr;

    // Save user profile to database
	
	 public void save(Userprofile user) { 
		 upr.save(user); 
		 }
	 

    // Check if email exists
    public boolean isEmailExists(String email) {
        return upr.existsByEmail(email);
    }
 
    // Check if phone exists
    public boolean isPhoneExists(String phone) {
        return upr.existsByPhone(phone);
    }

    // Check if full name exists
    public boolean isFullNameExists(String fullName) {
        return upr.existsByFullName(fullName);
    }

    // Find user by email
    public Userprofile findByEmail(String email) {
        return upr.findByEmail(email).orElse(null);
    }

    // Find user by phone
    public Userprofile findByPhone(String phone) {
        return upr.findByPhone(phone).orElse(null);
    }
    
    public boolean updatePassword(Userprofile user) {
        upr.updatePassword(user);  // Assuming an updatePassword method in repository
		return false;
    }
}
