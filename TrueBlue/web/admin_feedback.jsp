<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel - Votes</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #1a1a1a; /* Dark background */
            color: white;
            text-align: center;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #333; /* Lighter background for content */
            box-shadow: 0px 0px 10px #555;
        }
        th, td {
            border: 2px solid #555;
            padding: 15px;
            text-align: center;
        }
        th {
            background-color: #2a2a2a; /* Slightly lighter for contrast */
            color: white;
        }
        .product-info {
            background-color: white; /* White background for product info */
            color: black;
        }
        img {
            width: 150px;
            height: 150px;
        }
        .delete-btn, .cart-btn, .report-btn, .buy-btn {
            background-color: #1e90ff; /* Blue color */
            font-family: 'Poppins', sans-serif;
            color: white;
            padding: 10px 20px; /* Increased padding for larger buttons */
            border: none;
            cursor: pointer;
            font-size: 18px; /* Increased font size */
            border-radius: 5px;
        }
        .delete-btn:hover {
            background-color: #1c86ee; /* Darker blue on hover */
        }
        .buy-btn {
            background-color: #1e90ff; /* Blue color */
            font-family: 'Poppins', sans-serif;
            color: white;
            padding: 10px 20px; /* Increased padding for larger buttons */
            border: none;
            cursor: pointer;
            font-size: 18px; /* Increased font size */
        }
        .buy-btn:hover {
            background-color: #1c86ee; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <h1>Vote Data</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Whey Protein</th>
                <th>Creatine</th>
                <th>BCAAs</th>
                <th>Multivitamins</th>
                <th>Omega-3</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Load the JDBC driver
                    Class.forName("org.apache.derby.jdbc.ClientDriver");

                    // Establish the connection
                    conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tru", "app", "app");

                    // Prepare the SQL statement
                    String sql = "SELECT * FROM Votes";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    // Iterate through the result set and display the data
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("wheyProtein") %></td>
                <td><%= rs.getString("creatine") %></td>
                <td><%= rs.getString("bcaas") %></td>
                <td><%= rs.getString("multivitamins") %></td>
                <td><%= rs.getString("omega3") %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    // Close the resources
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>