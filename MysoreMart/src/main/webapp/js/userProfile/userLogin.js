    // Client-Side Form Validation and AJAX request
    $(document).ready(function() {
        $("#loginForm").on("submit", function(e) {
            e.preventDefault(); // Prevent the default form submission

            var emailOrPhone = $('#emailOrPhone').val().trim();
            var password = $('#password').val().trim();

            // Validation before AJAX call
            if (emailOrPhone === "") {
                alert("Email or Mobile Phone Number is required.");
                return false;
            } else if (password === "") {
                alert("Password is required.");
                return false;
            }

            // Perform AJAX request to login endpoint
            $.ajax({
                url: 'login',  // Use the URL for the login endpoint
                type: 'POST',
                data: {
                    emailOrPhone: emailOrPhone,
                    password: password
                },
                success: function(response) {
                    // If login is successful, you can redirect or show a success message
                    if (response === "success") {
                        window.location.href = "userDashboard"; // Redirect to dashboard
                    } else {
                        // Handle login failure
                        alert(response);  // Show the error message returned from the server
                    }
                },
                error: function(xhr, status, error) {
                	 var errorMessage = "No Data Found. Please check your credentials.";
                	 
                    // Handle AJAX error
                    alert("No Data Found or Chek your login details " + error);
                }
            });
        });
    });