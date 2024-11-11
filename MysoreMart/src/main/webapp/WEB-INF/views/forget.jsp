<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Mysore Mart</title>

    <!-- Bootstrap and custom CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/userprofile/forget-password.css'/>">
</head>
<body>

    <div class="container-fluid">
        <div class="forgot-password-box">
            <h2 class="text-center">Forgot Password</h2>

            <!-- Step 1: Form to enter email or phone number -->
            <form id="forgot" action="<c:url value='/forgot'/>" method="post">
                <div class="form-group">
                    <label for="emailOrPhone">Enter Email or Mobile Number</label>
                    <input type="text" id="emailOrPhone" name="emailOrPhone" class="form-control" placeholder="Email or Mobile" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Verify</button>
                </div>

                <!-- Error message for invalid email or phone -->
                <div id="error-msg" class="alert alert-danger d-none" role="alert">
                    The provided email or phone number is not found in our records. Please try again.
                </div>

                <div class="text-center">
                    <p>Remember your password? <a href="<c:url value='/login'/>">Login</a></p>
                </div>
            </form>
        </div>
    </div>

    <!-- Optional JavaScript and jQuer -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
