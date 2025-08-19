<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.*" %>

<%
String email = (String) session.getAttribute("email");

if (email == null) {
    response.sendRedirect("login.jsp");
    return;
}

// Email and SMTP details
final String username = "vaibhavs22it@student.mes.ac.in"; // Replace with your sender email
final String password = "9653309241"; // Use a secure method to store this
String smtphost = "smtp.gmail.com";
String from = "vaibhavs22it@student.mes.ac.in"; // Replace with sender email
String to = email;

// Email content
String subject = "Order Confirmation - TrueBlue";
String htmlContent = "<html><body style='font-family: Arial, sans-serif; background-color: #f9f5ff; padding: 20px;'>";
htmlContent += "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
htmlContent += "<tr><td align='center'>";
htmlContent += "<table width='600' border='0' cellspacing='0' cellpadding='0' style='background-color: #ffffff; border: 1px solid #e1d5ff; border-radius: 10px;'>";
htmlContent += "<tr><td align='center' style='padding: 20px; background-color: #0077b6; border-radius: 10px 10px 0 0;'>";
htmlContent += "<h1 style='color: #ffffff; font-size: 24px; margin: 0;'>Order Confirmed!</h1>";
htmlContent += "</td></tr>";
htmlContent += "<tr><td style='padding: 20px;'>";
htmlContent += "<p style='font-size: 16px; color: #333; line-height: 1.5;'>Dear <strong>" + email + "</strong>,</p>";
htmlContent += "<p style='font-size: 16px; color: #333; line-height: 1.5;'>Thank you for choosing <strong>TrueBlue</strong> for your supplement certification needs.</p>";
htmlContent += "<p style='font-size: 16px; color: #333; line-height: 1.5;'>Your request has been successfully placed, and we will notify you once the certification process is completed.</p>";
htmlContent += "<p style='font-size: 16px; color: #333; line-height: 1.5;'>If you have any questions, feel free to contact our support team at <a href='mailto:support@trueblue.com' style='color: #0077b6; text-decoration: none;'>support@trueblue.com</a>.</p>";
htmlContent += "<p style='font-size: 16px; color: #333; line-height: 1.5;'>Best regards,<br><strong>TrueBlue Team</strong></p>";
htmlContent += "</td></tr>";
htmlContent += "<tr><td align='center' style='padding: 20px; background-color: #e1eff6; border-top: 1px solid #0077b6;'>";
htmlContent += "<p style='font-size: 14px; color: #666;'>© 2024 TrueBlue. All Rights Reserved.</p>";
htmlContent += "</td></tr>";
htmlContent += "</table>";
htmlContent += "</td></tr>";
htmlContent += "</table>";
htmlContent += "</body></html>";


// Send email
try {
    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", smtphost);
    props.put("mail.smtp.port", "587");

    Session mailSession = Session.getInstance(props, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });

    Message msg = new MimeMessage(mailSession);
    msg.setFrom(new InternetAddress(from, "TrueBlue"));
    msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
    msg.setSubject(subject);
    msg.setContent(htmlContent, "text/html");

    Transport.send(msg);
} catch (Exception e) {
    out.println("Error sending email: " + e.getMessage());
}
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        /* General Styling */
        /* General Styling */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #1a1a1d; /* Dark background */
    color: #ffffff; /* White text */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

/* Confirmation Container */
.container {
    background: rgba(255, 255, 255, 0.1); /* Slight transparency */
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0px 4px 15px rgba(255, 255, 255, 0.2);
    text-align: center;
    max-width: 400px;
    border: 1px solid #3330ef; /* Blue border */
}

/* Heading */
h2 {
    color: #ffffff; /* White text */
    font-family: 'Playfair Display', serif;
    font-size: 26px;
    margin-bottom: 15px;
}

/* Paragraph Styling */
p {
    font-size: 18px;
    margin-bottom: 20px;
    color: #cccccc; /* Light gray text */
}

/* Highlighted Email */
.email {
    font-weight: bold;
    color: #007bff; /* Bright blue */
}

/* Home Button */
.home-btn {
    text-decoration: none;
    background: #3330ef; /* Deep Blue */
    color: white;
    padding: 12px 20px;
    border-radius: 8px;
    font-size: 16px;
    display: inline-block;
    transition: background 0.3s;
    border: none;
}

.home-btn:hover {
    background: #004080; /* Darker Blue */
}

/* Icon Styling */
.icon {
    font-size: 24px;
    color: #3330ef; /* Blue icon */
    margin-right: 8px;
}

    </style>
</head>
<body>

    <div class="container">
        <h2><i class="fa-solid fa-circle-check icon"></i> Order Confirmed!</h2>
        <p>Thank you for your purchase, <span class="email"><%= (email != null) ? email : "Customer" %></span>!</p>
        <a href="home.jsp" class="home-btn"><i class="fa-solid fa-house"></i> Return to Home</a>
    </div>

</body>
</html>

