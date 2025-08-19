<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.*"%>

<%
    String email = request.getParameter("a");

    // Email and SMTP details
    final String username = "vaibhavs22it@student.mes.ac.in";
    final String password = "9653309241"; // Use environment variables or a config file
    String smtphost = "smtp.gmail.com";
    String from = "vaibhavs22it@student.mes.ac.in";
    String to = email;

    // OTP generation
    Random r = new Random();
    int otp = 100000 + r.nextInt(900000);
    session.setAttribute("storedOTP", String.valueOf(otp)); // Store in session

    // Email setup
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

        // Create a multipart message
        MimeMessage msg = new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress(from, "TrueBlue Support"));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        msg.setSubject("Your OTP Code");

        // Create the HTML content
        String htmlContent = "<html><body style='font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px;'>";
        htmlContent += "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
        htmlContent += "<tr><td align='center'>";
        htmlContent += "<table width='600' border='0' cellspacing='0' cellpadding='0' style='background-color: #ffffff; border: 1px solid #eaeaea; border-radius: 10px;'>";
        htmlContent += "<tr><td align='center' style='padding: 20px; background-color: #3330ef; border-radius: 10px 10px 0 0;'>";
        htmlContent += "<h1 style='color: #ffffff; font-size: 24px; margin: 0;'>TrueBlue OTP Verification</h1>";
        htmlContent += "</td></tr>";
        htmlContent += "<tr><td style='padding: 20px;'>";
        htmlContent += "<p style='font-size: 16px; color: #333; line-height: 1.5;'>Hello,</p>";
        htmlContent += "<p style='font-size: 16px; color: #333; line-height: 1.5;'>Your One-Time Password (OTP) for TruuBlue is: <strong style='font-size: 24px; color: #004080;'>" + otp + "</strong></p>";
        htmlContent += "<p style='font-size: 16px; color: #333; line-height: 1.5;'>Please use this OTP to complete your registration or login process.</p>";
        htmlContent += "<p style='font-size: 16px; color: #333; line-height: 1.5;'>If you did not request this OTP, please ignore this email.</p>";
        htmlContent += "<p style='font-size: 16px; color: #333; line-height: 1.5;'>Best regards,<br>TrueBlue Support Team</p>";
        htmlContent += "</td></tr>";
        htmlContent += "<tr><td align='center' style='padding: 20px; background-color: #f4f4f4; border-top: 1px solid #eaeaea;'>";
        htmlContent += "<p style='font-size: 14px; color: #666;'>© 2024 TruuBlue. All Rights Reserved.</p>";
        htmlContent += "</td></tr>";
        htmlContent += "</table>";
        htmlContent += "</td></tr>";
        htmlContent += "</table>";
        htmlContent += "</body></html>";

        // Set the HTML content
        msg.setContent(htmlContent, "text/html");

        // Send the email
        Transport.send(msg);

        out.println(otp);  // Send OTP back to client
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error while sending OTP: " + e.getMessage());
    }
%>