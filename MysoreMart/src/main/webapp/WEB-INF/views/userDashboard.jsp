<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>

    <!-- Bootstrap 5 CSS for better responsiveness -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    
           <link rel="stylesheet" href="<c:url value='/css/userprofile/dashboard.css'/>"> <!--  externalcss -->
    


</head>

<body>
    <!-- Navbar Section -->
    <nav class="navbar navbar-expand-lg navbar-light shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">MysoreMart</a>
            <div class="d-flex align-items-center ms-auto">
                <div class="row">
                    <div class="col-12 text-center mb-4">
                        <p class="welcome-message">Welcome, 
                        <strong>      <%-- ${sessionScope.fullname} --%></strong>!</p>
                    </div>
                </div>

                <!-- Dropdown for User Options (Profile and Logout) -->
                <div class="dropdown">
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="userDropdown"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        User Options
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="userDropdown">
                        <!-- Existing Logout Option -->
                        <li><a class="dropdown-item" href="<c:url value='/logout'/>">Logout</a></li>
                        
                        <!-- New "Change Password" Option -->
                        <li><a class="dropdown-item" href="<c:url value='/forgot'/>">Change Password</a></li>
                        
                        <!-- New "Contact Us" Option -->
                        <li><a class="dropdown-item" href="<c:url value='#'/>">Contact Us</a></li>
                    </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content Section -->
    <div class="container-fluid mt-5">
        <!-- Dashboard Cards Section (4 cards per row) -->
        <div class="row">
            <!-- Orders Card -->
            <div class="col-md-3">
                <div class="card shadow-sm hover-effect">
                    <div class="card-body text-center">
                        <h5 class="card-title">My Orders</h5>
                        <p class="card-text">View and manage your orders.</p>
                        <a href="#" class="btn btn-primary">Go to Orders</a>
                    </div>
                </div>
            </div>

            <!-- Cart Card -->
            <div class="col-md-3">
                <div class="card shadow-sm hover-effect">
                    <div class="card-body text-center">
                        <h5 class="card-title">My Cart</h5>
                        <p class="card-text">Review items  before checkout.</p>
                        <a href="#" class="btn btn-primary">Go to Cart</a>
                    </div>
                </div>
            </div>

            <!-- Track Order Card -->
            <div class="col-md-3">
                <div class="card shadow-sm hover-effect">
                    <div class="card-body text-center">
                        <h5 class="card-title">Track My Order</h5>
                        <p class="card-text">Check the status of your orders.</p>
                        <a href="#" class="btn btn-primary">Track Order</a>
                    </div>
                </div>
            </div>

            <!-- Address Card -->
            <div class="col-md-3">
                <div class="card shadow-sm hover-effect">
                    <div class="card-body text-center">
                        <h5 class="card-title">Manage Address</h5>
                        <p class="card-text">Add or update your shipping address.</p>
                        <a href="#" class="btn btn-primary">Add Address</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 MysoreMart | All Rights Reserved</p>
    </footer>

    <!-- Optional JavaScript (Bootstrap 5 Bundle) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    
        <script src="<c:url value='/js/userProfile/dashboard.js'/>"></script> <!-- Link to external JS -->
    
</body>

</html>
