

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrueBlue | Admin - Add Reports</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #1a1a1a;
            color: white;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #1a1a1a;
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
            background-color: #2a2a2a;
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
            background-color: #333;
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
        input[type="submit"] {
            background-color: #1e90ff;
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
            background-color: #1c86ee;
        }
    </style>
</head>
<body>
    <div class="header">
        <a href="#">TrueBlue</a>
        <div class="header-right">
            <a href="admin_feedback.jsp"><i class="fas fa-comments"></i> Client Feedback</a>
            <a href="admin_view.jsp"><i class="fas fa-box"></i> Products</a>
            <a href="admin_logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
    
    <div class="topnav">
        <a href="admin.jsp"><i class="fas fa-plus"></i> Add Products</a>
        <a href="admin_product.jsp"><i class="fas fa-edit"></i> Update Products</a>
        <a href="admin_view.jsp"><i class="fas fa-eye"></i> View Products</a>
        <a href="admin_reports.jsp"><i class="fas fa-file-alt"></i> Add Reports</a>
        <ul style="position: relative; padding: 10px; color: #fefefe; display: flex; align-items: center; justify-content: center; font-family: 'Poppins', sans-serif; font-size: 18px; font-weight: bold; gap: 10px;">
            <i class="fas fa-user-circle" style="font-size: 22px;"></i>
            <span>Welcome, Vaibhav</span>
        </ul>
    </div>
    
    <div class="update_p">
        <h2 align="center"> Add Report </h2>
        <form action="AddReportServlet" method="POST">
            <table border="0" align="center">
                <tr>
                    <td><b>Product Name:</b></td>
                    <td><input type="text" name="product_name" id="product_name" required></td>
                </tr>
                <tr>
                    <td><b>Category:</b></td>
                    <td><input type="text" name="category" id="category" required></td>
                </tr>
                <tr>
                    <td><b>Batch No. Tested:</b></td>
                    <td><input type="text" name="batch_no" id="batch_no" required></td>
                </tr>
                <tr>
                    <tr>
    <td><b>Mfg Date:</b></td>
    <td><input type="date" name="mfg_date" id="mfg_date" required></td>
</tr>
<tr>
    <td><b>Exp Date:</b></td>
    <td><input type="date" name="exp_date" id="exp_date" required></td>
</tr>
<tr>
    <td><b>Date Published:</b></td>
    <td><input type="date" name="date_published" id="date_published" required></td>
</tr>
                <tr>
                    <td><b>Tested By:</b></td>
                    <td><input type="text" name="tested_by" id="tested_by" required></td>
                </tr>
                <tr>
                    <td><b>Testing Status:</b></td>
                    <td><input type="text" name="testing_status" id="testing_status" required></td>
                </tr>
                <tr>
                    <td><b>Macro Accuracy:</b></td>
                    <td><input type="text" name="macro_accuracy" id="macro_accuracy" required></td>
                </tr>
                <tr>
                    <td><b>Amino Spiking Status:</b></td>
                    <td><input type="text" name="amino_spiking_status" id="amino_spiking_status" required></td>
                </tr>
                <tr>
                    <td><b>Melamine Spiking Status:</b></td>
                    <td><input type="text" name="melamine_spiking_status" id="melamine_spiking_status" required></td>
                </tr>
                <tr>
                    <td><b>Limit of Detection (LOQ):</b></td>
                    <td><input type="text" name="melamine_loq" id="melamine_loq" required></td>
                </tr>
                <tr>
                    <td><b>Result:</b></td>
                    <td><input type="text" name="melamine_result" id="melamine_result" required></td>
                </tr>
                <tr>
                    <td><b>Heavy Metals:</b></td>
                    <td><input type="text" name="heavy_metals" id="heavy_metals" required></td>
                </tr>
                <tr>
                    <td><b>Aflatoxins (B1, B2, G1, G2, M1):</b></td>
                    <td><input type="text" name="aflatoxins" id="aflatoxins" required></td>
                </tr>
                <tr>
                    <td><b>Pesticides:</b></td>
                    <td><input type="text" name="pesticides" id="pesticides" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Add Report">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>