import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // Get form parameters
            String productID = request.getParameter("product_id");
            String productName = request.getParameter("product_name");
            String category = request.getParameter("category");
            String passFail = request.getParameter("pass/fail"); // Added pass_fail field
            String productUrl = request.getParameter("product_url"); // Added product_url field

            // Get uploaded file
            Part filePart = request.getPart("image_data"); // Must match input `name="image_data"`
            InputStream inputStream = null;
            if (filePart != null && filePart.getSize() > 0) {
                inputStream = filePart.getInputStream();
            }

            // Database connection
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/tru", "app", "app");

            // SQL query with 6 placeholders (added product_url)
            String sql = "INSERT INTO products (product_id, product_name, category, pass_fail, image_data, product_url) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, productID);
            ps.setString(2, productName);
            ps.setString(3, category);
            ps.setString(4, passFail); // Set pass_fail field
            ps.setString(6, productUrl); // Set product_url field
            
            // Set image correctly (Optional: Allow null values)
            if (inputStream != null) {
                ps.setBlob(5, inputStream); // Use setBlob for BLOB type
            } else {
                ps.setNull(5, java.sql.Types.BLOB);
            }

            // Execute update
            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("admin.jsp?msg=Product Added Successfully!");
            } else {
                response.sendRedirect("admin.jsp?msg=Failed to Add Product!");
            }

            // Close resources
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}