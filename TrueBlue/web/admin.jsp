<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrueBlue Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #1a1a1a; /* Dark background */
            color: white;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #1a1a1a; /* Darker background */
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 10px;
            font-size: 18px;
            display: flex;
            align-items: center;
        }

        .header a i {
            margin-right: 8px;
        }

        .header-right {
            display: flex;
            gap: 20px;
        }

        .topnav {
            background-color: #2a2a2a; /* Slightly lighter for contrast */
            overflow: hidden;
            padding: 12px;
            text-align: center;
        }

        .topnav a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            font-weight: bold;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .update_p {
            background-color: #333; /* Lighter background for content */
            padding: 20px;
            margin: 50px auto;
            width: 50%;
            box-shadow: 0px 0px 10px #555;
            border-radius: 10px;
            text-align: center;
        }

        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #555;
            border-radius: 5px;
            background-color: #444;
            color: white;
        }

        input[type="file"] {
            padding: 5px;
        }

        input[type="submit"] {
            background-color: #1e90ff; /* Blue color */
            color: white;
            padding: 12px 20px;
            margin: 20px 0;
            border: none;
            cursor: pointer;
            width: 50%;
            border-radius: 5px;
            font-size: 16px;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #1c86ee; /* Darker blue on hover */
        }

        .button-container {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .button-container a {
            background-color: #1e90ff; /* Blue color */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            text-decoration: none;
            transition: 0.3s;
        }

        .button-container a:hover {
            background-color: #1c86ee; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <div class="header">
        <a href="#">TrueBlue</a>
        <div class="header-right">
            <a href="admin_feedback.jsp"><i class="fas fa-comments"></i>Votes</a>
            <a href="admin_view.jsp"><i class="fas fa-box"></i> Products</a>
            <a href="admin_logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
    
    <div class="topnav">
        <a href="admin.jsp"><i class="fas fa-plus"></i> Add Products</a>
        <a href="admin_product.jsp"><i class="fas fa-edit"></i> Update Products</a>
        <a href="admin_view.jsp"><i class="fas fa-eye"></i> View Products</a>
      
        <ul style="position: relative; padding: 10px; color: #fefefe; display: flex; align-items: center; justify-content: center; font-family: 'Poppins', sans-serif; font-size: 18px; font-weight: bold; gap: 10px;">
            <i class="fas fa-user-circle" style="font-size: 22px;"></i>
            <span>Welcome, Vaibhav</span>
        </ul>
    </div>
    
    <div class="update_p">
        <h2 align="center"> Add Product </h2>
        <form action="AddProductServlet" method="POST" enctype="multipart/form-data">
            <table border="0" align="center">
                <tr>
                    <td><b>Product ID:</b></td>
                    <td><input type="text" name="product_id" id="product_id" required></td>
                </tr>
                <tr>
                    <td><b>Brand Name:</b></td>
                    <td><input type="text" name="product_name" id="product_name" required></td>
                </tr>
                <tr>
                    <td><b>Category:</b></td>
                    <td><input type="text" name="category" id="category" required></td>
                </tr>
                <tr>
                    <td><b>Pass / Fail:</b></td>
                    <td><textarea id="description" name="pass/fail" rows="3" cols="40"></textarea></td>
                </tr>
                <tr>
                    <td><b>Product URL:</b></td>
                    <td><input type="text" name="product_url" id="product_url" required></td>
                </tr>
                <tr>
                    <td><b>Product Image:</b></td>
                    <td><input type="file" name="image_data" id="productImageInput" onchange="openFile(event)"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Add Product">
                    </td>
                </tr>
            </table>
            <img src="" id="productImage" width="100" height="100" style="display:block; margin:auto;">
        </form>
    </div>
</body>
</html>