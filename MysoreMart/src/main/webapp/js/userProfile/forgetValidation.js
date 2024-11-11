$(document).ready(function() {

    // Step 1: Validate and Send Email/Phone via AJAX
    $("#emailOrPhoneForm").on("submit", function(event) {
        event.preventDefault();

        // Clear previous error messages
        $(".error").remove();

        var isValid = true;
        var emailOrPhone = $("#emailOrPhone").val().trim();

        if (emailOrPhone === "") {
            isValid = false;
            $("#emailOrPhone").after('<div class="error text-danger">Email or Mobile number is required.</div>');
        }

        if (isValid) {
            // Send email or phone via AJAX to server
            $.ajax({
                url: '<c:url value="/verify-email-phone"/>',
                type: 'POST',
                data: { emailOrPhone: emailOrPhone },
                success: function(response) {
                    if (response.status === 'success') {
                        // Show OTP form and hide email/phone form
                        $("#otpForm").show();
                        $("#emailOrPhoneForm").hide();
                    } else {
                        // Handle error (e.g., email/phone not found)
                        $("#emailOrPhone").after('<div class="error text-danger">' + response.message + '</div>');
                    }
                },
                error: function() {
                    alert('Error occurred while verifying email/phone.');
                }
            });
        }
    });

    // Step 2: Validate OTP via AJAX
    $("#otpVerificationForm").on("submit", function(event) {
        event.preventDefault();

        // Clear previous error messages
        $(".error").remove();

        var isValid = true;
        var otp = $("#otp").val().trim();

        if (otp === "") {
            isValid = false;
            $("#otp").after('<div class="error text-danger">OTP is required.</div>');
        } else if (otp.length !== 6) {  // Assuming OTP should be 6 digits
            isValid = false;
            $("#otp").after('<div class="error text-danger">OTP must be 6 digits long.</div>');
        }

        if (isValid) {
            // Send OTP via AJAX to server for validation
            $.ajax({
                url: '<c:url value="/verify-otp"/>',
                type: 'POST',
                data: { otp: otp },
                success: function(response) {
                    if (response.status === 'success') {
                        // Show New Password form and hide OTP form
                        $("#newPasswordForm").show();
                        $("#otpForm").hide();
                    } else {
                        // Handle error (e.g., incorrect OTP)
                        $("#otp").after('<div class="error text-danger">' + response.message + '</div>');
                    }
                },
                error: function() {
                    alert('Error occurred while verifying OTP.');
                }
            });
        }
    });

    // Step 3: Validate and Update New Password via AJAX
    $("#newPasswordFormSubmit").on("submit", function(event) {
        event.preventDefault();

        // Clear previous error messages
        $(".error").remove();

        var isValid = true;
        var newPassword = $("#newPassword").val().trim();
        var confirmPassword = $("#confirmPassword").val().trim();

        if (newPassword === "") {
            isValid = false;
            $("#newPassword").after('<div class="error text-danger">New Password is required.</div>');
        }

        if (confirmPassword === "") {
            isValid = false;
            $("#confirmPassword").after('<div class="error text-danger">Confirm Password is required.</div>');
        }

        if (newPassword !== confirmPassword) {
            isValid = false;
            $("#confirmPassword").after('<div class="error text-danger">Passwords do not match.</div>');
        }

        if (isValid) {
            // Send new password via AJAX to server for updating
            $.ajax({
                url: '<c:url value="/update-password"/>',
                type: 'POST',
                data: {
                    newPassword: newPassword
                },
                success: function(response) {
                    if (response.status === 'success') {
                        // Handle success (e.g., show success message or redirect)
                        alert('Password successfully updated!');
                        window.location.href = "<c:url value='/userLogin'/>";  // Redirect to login
                    } else {
                        // Handle error (e.g., password update failed)
                        $("#confirmPassword").after('<div class="error text-danger">' + response.message + '</div>');
                    }
                },
                error: function() {
                    alert('Error occurred while updating password.');
                }
            });
        }
    });
});
