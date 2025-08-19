<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="register.css">
    <script>
        function sendOTP() {
            var email = document.getElementById("emid1").value;
            var obj = new XMLHttpRequest();

            obj.onreadystatechange = function () {
                if (obj.readyState === 4 && obj.status === 200) {
                    document.getElementById("hotp1").value = obj.responseText.trim(); // Store OTP
                }
            };

            obj.open("GET", "sendEmail.jsp?a=" + email, true);
            obj.send();
            alert("OTP Successfully Sent");
        }

        function matchOTP() {
            var enteredOTP = document.getElementById("otp1").value.trim();
            var storedOTP = document.getElementById("hotp1").value.trim();

            if (enteredOTP !== storedOTP) {
                alert("OTP doesn't match. Please try again.");
                return false;
            }
            return true;
        }

        function handleFormSubmit(event) {
            event.preventDefault();
            if (matchOTP()) {
                document.getElementById("registerForm").submit();
            }
        }
    </script>
</head>
<body>

    <div class="form-container">
        <div class="form-title">Register</div>
        <form id="registerForm" action="Register_server.jsp" method="post">
            <input type="text" name="name" id="name" placeholder="Enter Name" required>
            <input type="email" name="emid1" id="emid1" placeholder="Enter Email" required>
            <button type="button" onclick="sendOTP()">GENERATE OTP</button>
            <input type="number" name="otp" id="otp1" placeholder="Enter OTP" required>
            <input type="hidden" name="hotp" id="hotp1">
            <input type="password" name="psw1" id="password1" placeholder="Enter Password" required>
            <input type="password" name="psw2" id="password2" placeholder="Confirm Password" required>
            <button type="submit" onclick="handleFormSubmit(event)">REGISTER</button>
            <a href="login.jsp">Already a member? Login here</a>
        </form>
    </div>

</body>
</html>