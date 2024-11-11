/*$(document).ready(function() {
    // Form submission handler
    $('#forgot').on('submit', function(e) {
        e.preventDefault();  // Prevent the default form submission

        var emailOrPhone = $('#emailOrPhone').val().trim();

        // Clear any previous error message
        $('#error-msg').addClass('d-none');

        // Validate input - check if email or phone number is provided
        if (emailOrPhone === '') {
            alert("Please enter an email or mobile number.");
            return false;
        }

        // Perform AJAX request to check if email or phone exists in the database
        $.ajax({
            url: '<c:url value="/checkEmailOrPhone" />',  // URL to check if the email or phone exists
            type: 'POST',
            data: {
                emailOrPhone: emailOrPhone,
            },
            success: function(response) {
                // Log the response to inspect what's returned
                console.log("Response from server: " + response);

                // If email or phone is found, redirect to password change form
                if (response === "found") {
                    window.location.href = "<c:url value='/passwordChange'/>"; // Redirect to password change form
                } else {
                    // If not found, show the error message
                    $('#error-msg').removeClass('d-none');
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX error: " + error);
                alert("An error occurred while checking your details. Please try again later.");
            }
        });
    });
});
*/
$(document).ready(function() {
    // Simulate OTP being sent
    setTimeout(function() {
        $("#otpSentAlert").show(); // Show OTP sent alert after some time
        $("#otpForm").show(); // Show the OTP input form
    }, 1000); // Simulate a 1-second delay before OTP is "sent"

    // Handle OTP verification
    $("#otpVerificationForm").on("submit", function(event) {
        event.preventDefault(); // Prevent form submission

        var enteredOtp = $("#otp").val();
        var validOtp = "123456"; // This is the hardcoded OTP for now

        if (enteredOtp === validOtp) {
            // Show new password form if OTP is correct
            $("#newPasswordForm").show();
            $("#otpForm").hide();
            $("#otpError").hide(); // Hide OTP error message
        } else {
            // Show error message if OTP is incorrect
            $("#otpError").show();
        }
    });

    // Handle password update with AJAX
    $("#newPasswordFormSubmit").on("submit", function(event) {
        event.preventDefault(); // Prevent form submission

        var newPassword = $("#newPassword").val();
        var confirmPassword = $("#confirmPassword").val();

        // Check if new password and confirm password match
        if (newPassword === confirmPassword) {
            // Prepare data for submission
            var emailOrPhone = "<c:out value='${sessionScope.emailOrPhone}'/>"; // Retrieve the email/phone from session if needed
            var newPasswordData = {
                emailOrPhone: emailOrPhone,
                newPassword: newPassword
            };

            // Send AJAX request to backend to update password
            $.ajax({
                url: 'changePassword',  // Backend endpoint for password change
                type: 'POST',
                data: newPasswordData,
                success: function(response) {
                    // Assuming the response is success if password is updated successfully
                    if (response === "success") {
                        // Show success alert before redirecting
                        alert("Your password has been successfully updated!");

                        // Redirect to login page or another page
                        window.location.href = "<c:url value='/userLogin' />";
                    } else {
                        // Show error alert if something goes wrong
                        alert("There was an error updating your password. Please try again.");
                    }
                },
                error: function(xhr, status, error) {
                    // Handle any AJAX errors
                    alert("An error occurred. Please try again later.");
                }
            });
        } else {
            // Show error if passwords don't match
            alert("Passwords do not match. Please try again.");
        }
    });
});
