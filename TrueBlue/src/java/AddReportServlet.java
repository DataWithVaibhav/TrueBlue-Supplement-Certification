import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddReportServlet")
public class AddReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("product_name");
        String category = request.getParameter("category");
        String batchNo = request.getParameter("batch_no");
        String mfgDateStr = request.getParameter("mfg_date");
        String expDateStr = request.getParameter("exp_date");
        String datePublishedStr = request.getParameter("date_published");
        String testedBy = request.getParameter("tested_by");
        String testingStatus = request.getParameter("testing_status");
        String macroAccuracy = request.getParameter("macro_accuracy");
        String aminoSpikingStatus = request.getParameter("amino_spiking_status");
        String melamineSpikingStatus = request.getParameter("melamine_spiking_status");
        String melamineLoq = request.getParameter("melamine_loq");
        String melamineResult = request.getParameter("melamine_result");
        String heavyMetals = request.getParameter("heavy_metals");
        String aflatoxins = request.getParameter("aflatoxins");
        String pesticides = request.getParameter("pesticides");

        // Replace with your database connection details
        String url = "jdbc:derby://localhost:1527/tru"; // Derby database URL
        String user = "app"; // Derby username
        String password = "app"; // Derby password

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date mfgDate = null;
        java.util.Date expDate = null;
        java.util.Date datePublished = null;

        try {
            mfgDate = dateFormat.parse(mfgDateStr);
            expDate = dateFormat.parse(expDateStr);
            datePublished = dateFormat.parse(datePublishedStr);
        } catch (ParseException e) {
            e.printStackTrace(response.getWriter());
            return;
        }

        String query = "INSERT INTO reports (product_name, category, batch_no, mfg_date, exp_date, date_published, tested_by, testing_status, macro_accuracy, amino_spiking_status, melamine_spiking_status, melamine_loq, melamine_result, heavy_metals, aflatoxins, pesticides) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, productName);
            stmt.setString(2, category);
            stmt.setString(3, batchNo);
            stmt.setDate(4, new java.sql.Date(mfgDate.getTime()));
            stmt.setDate(5, new java.sql.Date(expDate.getTime()));
            stmt.setDate(6, new java.sql.Date(datePublished.getTime()));
            stmt.setString(7, testedBy);
            stmt.setString(8, testingStatus);
            stmt.setString(9, macroAccuracy);
            stmt.setString(10, aminoSpikingStatus);
            stmt.setString(11, melamineSpikingStatus);
            stmt.setString(12, melamineLoq);
            stmt.setString(13, melamineResult);
            stmt.setString(14, heavyMetals);
            stmt.setString(15, aflatoxins);
            stmt.setString(16, pesticides);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("admin_reports.jsp");
            } else {
                response.getWriter().println("Failed to insert data.");
            }
        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}