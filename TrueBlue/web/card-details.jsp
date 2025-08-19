<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Card Details</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #1a1a1a; /* Dark background */
            color: white;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .update-form {
            width: 100%; /* Full width of the viewport */
            max-width: 600px; /* Maximum width of the form */
            background: #333; /* Lighter background for content */
            padding: 30px;
            box-shadow: 0px 0px 10px #555;
            border-radius: 10px;
            text-align: center;
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            color: #1e90ff; /* Blue color */
            margin-bottom: 20px;
        }

        label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 14px;
            color: #555;
        }

        select, input {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 8px;
            margin-bottom: 12px;
            border: 1px solid #555;
            border-radius: 5px;
            background: #444;
            color: white;
        }

        button {
            background-color: #1e90ff; /* Blue color */
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        button:hover {
            background-color: #1c86ee; /* Darker blue on hover */
        }

        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .price {
            color: #1e90ff;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="update-form">
        <h2>Testing Level Selection</h2>
        
        <form action="card_process.jsp" method="post">
            <!-- Level Selection -->
            <div class="form-group">
                <label for="testLevel">Select Testing Level:</label>
                <select id="testLevel" name="testLevel" onchange="updatePrice()">
                    <option value="6">6th Level - ₹69,999</option>
                    <option value="7" selected>7th Level - ₹89,999</option>
                </select>
            </div>

            <!-- Display Price Dynamically -->
            <div class="price">
                Price: ₹<span id="priceDisplay">89,999</span>
            </div>

            <!-- Hidden Input to Send Price to Backend -->
            <input type="hidden" id="selectedPrice" name="selectedPrice" value="89999">

            <h2>Enter Card Details</h2>

            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardnumber" placeholder="1234 5678 9012 3456" required>
            </div>

            <div class="form-group">
                <label for="cardHolder">Card Holder Name:</label>
                <input type="text" id="cardHolder" name="cardholder" placeholder="Vaibhav Singh" required>
            </div>

            <div class="form-group">
                <label for="expiry">Expiry Date (MM/YY):</label>
                <input type="text" id="expiry" name="expiry" placeholder="MM/YY" required>
            </div>

            <div class="form-group">
                <label for="cvv">CVV:</label>
                <input type="password" id="cvv" name="cvv" placeholder="***" required>
            </div>

            <button type="submit">Submit</button>
        </form>
    </div>

    <script>
        function updatePrice() {
    const priceDisplay = document.getElementById("priceDisplay");
    const selectedPrice = document.getElementById("selectedPrice");
    const testLevel = document.getElementById("testLevel").value;

    // Define price mapping for levels
    const priceMap = {
        "6": "69,999",
        "7": "89,999"
    };

    // Update price display and hidden input
    priceDisplay.textContent = priceMap[testLevel];
    selectedPrice.value = priceMap[testLevel].replace(",", ""); // Remove comma for backend processing
}

    </script>

</body>
</html>