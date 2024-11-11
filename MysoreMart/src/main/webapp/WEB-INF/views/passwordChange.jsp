<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Mysore Mart</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
	
	    <link rel="stylesheet" href="<c:url value='/css/userprofile/passwordChange.css'/>">
	

</head>
<body>

    <div class="container mt-5">
        <div class="forgot-password-box">
            <h2>Forgot Password</h2>

            <!-- OTP Sent Notification -->
            <div class="alert alert-info text-center" id="otpSentAlert" style="display:none;">
                <strong>OTP Sent!</strong> An OTP has been sent to your email/phone number. Please check your inbox and enter the OTP below.
            </div>

            <!-- Step 2: OTP Verification Form (Initially Hidden) -->
            <div id="otpForm">
                <form id="otpVerificationForm">
                    <div class="form-group">
                        <label for="otp">Enter OTP</label>
                        <input type="text" id="otp" name="otp" class="form-control" placeholder="Enter OTP" required aria-required="true">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-success btn-block">Verify OTP</button>
                    </div>
                </form>
                <div id="otpError" class="text-danger" style="display:none;">Invalid OTP. Please try again.</div>
            </div>

            <!-- Step 3: New Password Form (Initially Hidden) -->
            <div id="newPasswordForm" style="display:none;">
                <form action="<c:url value='/changePassword'/>" method="post" id="newPasswordFormSubmit">
                    <!-- Hidden field to store the user's email/phone -->
                    <input type="hidden" name="emailOrPhone" id="emailOrPhone" value="">
                    
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" id="newPassword" name="newPassword" class="form-control" placeholder="Enter new password" required aria-required="true">
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm new password" required aria-required="true">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-success btn-block">Update Password</button>
                    </div>
                </form>
            </div>

            <div class="text-center">
                <p>Remember your password? <a href="<c:url value='/login'/>">Login</a></p>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
		
		    <script src="<c:url value='/js/userProfile/passwordChange.js'/>"></script> <!-- Link to external JS -->
		
 
</body>
</html>
