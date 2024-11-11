	package com.info.MysoreMart.Controller;

import com.info.MysoreMart.Model.Userprofile;
import com.info.MysoreMart.Service.UserProfileService;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserProfileController {

    @Autowired
    private UserProfileService ups;

    // Success page after login or registration
    @GetMapping("/success")
    public String success() {
        return "success";  // Return success.jsp or success.html
    }

    

    // User Dashboard after login
    @GetMapping("/userDashboard")
    public String userDashboard( ) {
       
        return "userDashboard";  // Return userDashboard.jsp or userDashboard.html
    }
    
    // Registration endpoint
    @PostMapping("/register")
    @ResponseBody
    public String registerUser(
        @RequestParam(name = "fullName") String fullName,
        @RequestParam(name = "email") String email,
        @RequestParam(name = "phone") String phone,
        @RequestParam(name = "password") String password
    ) {
        // Check if full name already exists
        if (ups.isFullNameExists(fullName)) {
            return "Full name already exists. Please choose a different name.";
        }

        // Check if email already exists
        if (ups.isEmailExists(email)) {
            return "Email already exists. Please log in.";
        }

        // Check if phone already exists
        if (ups.isPhoneExists(phone)) {
            return "Phone number already exists. Please log in.";
        }

        // Create Userprofile object and set the fields
        Userprofile user = new Userprofile();
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        user.setFullName(fullName);

        // Save user to the database
        ups.save(user);

        return "redirect:/userDashboard";  // Redirect to dashboard after successful registration
    }

    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<String> loginUser(
            @RequestParam(name = "emailOrPhone") String emailOrPhone,
            @RequestParam(name = "password") String password,
            HttpSession session
    ) {
        // Find the user by email or phone
        Userprofile user = null;
        if (emailOrPhone.contains("@")) {
            user = ups.findByEmail(emailOrPhone);
        } else {
            user = ups.findByPhone(emailOrPhone);
        }

        // Validate user credentials
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("user", user);  // Store the user object in session
            return ResponseEntity.ok("success");  // Return success message
        } else {
            return ResponseEntity.status(401).body("Invalid email or password.");  // Return failure message with 401 Unauthorized status
        }
    }

    
    // Display password change form after checking if user exists
    @PostMapping("/forgot")
    public String forgotPassword(
            @RequestParam(name = "emailOrPhone") String emailOrPhone,
            HttpSession session
    ) {
    	
        // Find the user by email or phone
        Userprofile user = null; 
        if (emailOrPhone.contains("@")) {
            user = ups.findByEmail(emailOrPhone);
        } else {
            user = ups.findByPhone(emailOrPhone);
        }

        // If user exists, allow password change (show form)
        if (user != null) {
            session.setAttribute("userToChangePassword", user);  // Store the user in session
            return "passwordChange";  // Redirect to a password change form (create this page)
        } else {
            // If user doesn't exist, show an error or redirect back to forgot page
            return "redirect:/forgot?error=true";  // You can show an error message
        }
    }

    @ResponseBody
    @PostMapping("/changePassword")
    public String changePassword(
            @RequestParam(name = "newPassword") String newPassword,
            HttpSession session
    ) {
        // Get the user object from session
        Userprofile user = (Userprofile) session.getAttribute("userToChangePassword");

        if (user != null) {
            // Update the password (But as per your requirement, we won't update it in DB yet)
            user.setPassword(newPassword);  // Update password temporarily
            
            // Assuming the password update logic is handled by your service
            boolean updateSuccess = ups.updatePassword(user);
            
            // If the update is successful, return "success", otherwise return "error"
            if (updateSuccess) {
                return "success";  // Return success string
            } else {
                return "error";  // Return error string if update fails
            }
        } else {
            // If no user is found in session, return "error"
            return "error";  // Return error if no user is found in session
        }
    }


    @PostMapping("/checkEmailOrPhone")
    @ResponseBody
    public String checkEmailOrPhone(@RequestParam("emailOrPhone") String emailOrPhone) {
        // Check if it's an email or phone number
        Userprofile user = null;
        
        if (emailOrPhone.contains("@")) {
            user = ups.findByEmail(emailOrPhone);  // Check by email
        } else {
            user = ups.findByPhone(emailOrPhone);  // Check by phone number
        }

        // If user is found, return "found", else return "not_found"
        if (user != null) {
            return "redirect:/passwordChange";  // User exists
        } else {
            return "not_found";  // User doesn't exist
        }
    }
    
    
    // Logout functionality
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();  // Invalidate the session to log out
        return "redirect:/login";  // Redirect to login page after logout
    }
}// WORKING 
