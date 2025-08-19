# TrueBlue — Supplement Authentication & Certification Platform

**TrueBlue** is a Java/JSP web application that authenticates and certifies dietary supplements (protein powders, creatine, BCAAs, multivitamins, fish oil / omega-3, pre-workout, etc.)
by running lab tests, publishing lab reports, and providing a certification workflow for brands. This README contains a detailed developer guide with **Apache Derby database setup**.

---

## 📌 Project Overview
TrueBlue is designed to solve a very common problem in the supplement industry: **lack of trust and transparency**.  
Many supplements sold in the market are either under-dosed, contaminated, or falsely labeled. Consumers have no easy way to verify whether what’s written on the label is actually inside the product.  

To address this, **TrueBlue provides an independent authentication and certification platform**.  

- **For Consumers:**  
  Users can browse supplements on the platform and check whether they are certified. Certified products display detailed **lab reports** that prove the supplement matches its label
  (e.g., protein quantity, ingredient purity, absence of harmful substances). Users can also **vote for products** they want to see tested next, creating a **community-driven testing system**.  

- **For Manufacturers:**  
  Supplement companies can **apply for certification** through the platform. Once they submit their product, it undergoes testing (in real labs).
  If the product passes quality checks, it receives the **TrueBlue Certification**, which can be showcased on their product packaging and listing.  

- **For Admins/Labs:**  
  Administrators and testing labs can **review certification applications, upload lab reports, approve/reject products**, and manage the platform.  

In short, **TrueBlue connects consumers, manufacturers, and labs into one ecosystem** where transparency and authenticity of supplements can be verified easily.  


**Author:** Vaibhav Sunil Singh (DataWithVaibhav)

---

## 🚀 Features
- Product catalog & details  
- Manufacturer certification workflow  
- Admin dashboard to approve/reject certifications and upload lab reports (PDF)  
- User registration/login with roles (user, admin, lab)  
- Voting system to prioritize testing  
- Lab report viewer (embed/download PDFs)  
- Secure redirect/shop links with verification codes  

---

## 🛠 Tech Stack
- **Backend:** Java Servlets + JSP  
- **Frontend:** HTML, CSS, JavaScript, JSP  
- **Database:** Apache Derby  
- **App Server:** GlassFish  
- **Build:** Ant / NetBeans (build.xml included)

---

## 📂 Repository Structure
/ (repo root)
├─ TrueBlue/
│ ├─ src/ # Java source (servlets, dao, models, utils)
│ ├─ web/ # JSPs, WEB-INF, static assets
│ └─ build.xml
├─ lib/ # external jars (e.g., derbyclient.jar, derby.jar)
└─ README.md


---

## 🗄 Derby Database Setup

### Modes
- **Embedded mode** (simpler, single-user): Derby runs inside the same JVM.  
- **Client/Server mode** (recommended): Run Derby as a network server (`localhost:1527`) and connect multiple clients.

### Jars Needed
- `derby.jar` → for embedded  
- `derbyclient.jar` → for client/server  
- Place them in `TrueBlue/WEB-INF/lib` or in GlassFish `lib/` folder.

### JDBC URLs
- Embedded:  
jdbc:derby:TrueBlueDB;create=true

Driver: `org.apache.derby.jdbc.EmbeddedDriver`  

- Client/Server:  
jdbc:derby://localhost:1527/TrueBlueDB;create=true


Driver: `org.apache.derby.jdbc.ClientDriver`

---

## ⚙️ Configuration (example `config.properties`)
Put this inside `TrueBlue/web/WEB-INF/` (or classpath):

```properties
db.driver=org.apache.derby.jdbc.ClientDriver
db.url=jdbc:derby://localhost:1527/TrueBlueDB;create=true
db.user=app
db.password=app_password

# For embedded, use:
# db.driver=org.apache.derby.jdbc.EmbeddedDriver
# db.url=jdbc:derby:TrueBlueDB;create=true

file.storage.path=/path/to/TrueBlue/uploads
app.context=TrueBlue

🗃 SQL Schema (Derby)
Run this in ij or via NetBeans SQL window:

CREATE TABLE users (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  username VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  role VARCHAR(20) DEFAULT 'user',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  brand VARCHAR(255),
  category VARCHAR(100),
  label_info CLOB,
  posted_by INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE certification_applications (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  product_id INT,
  manufacturer VARCHAR(255),
  status VARCHAR(20) DEFAULT 'pending',
  applied_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  reviewed_on TIMESTAMP,
  reviewed_by INT
);

CREATE TABLE lab_reports (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  application_id INT,
  file_path VARCHAR(1024),
  issued_on DATE,
  summary CLOB
);

CREATE TABLE votes (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  user_id INT,
  product_id INT,
  voted_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample admin user (replace password with a real hash)
INSERT INTO users (username, password_hash, email, role)
VALUES ('admin', 'hashed_password_here', 'admin@example.com', 'admin');


💻 Sample Java DB Connection
import java.sql.*;

public class DBConnection {
    public static Connection getConnection() throws Exception {
        String driver = "org.apache.derby.jdbc.ClientDriver";
        String url = "jdbc:derby://localhost:1527/TrueBlueDB;create=true";
        String user = "app";
        String pass = "app_password";

        Class.forName(driver);
        return DriverManager.getConnection(url, user, pass);
    }
}


For embedded:
Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
Connection conn = DriverManager.getConnection("jdbc:derby:TrueBlueDB;create=true");


▶️ Run in NetBeans
Open NetBeans → File → Open Project → TrueBlue/

Add GlassFish server in NetBeans (Services → Servers → Add).

Ensure derbyclient.jar or derby.jar is added to project libraries.

Start Derby network server (if using client mode).

java -jar lib/derbyrun.jar server start
Right-click project → Clean and Build → Run.

Visit: http://localhost:8080/TrueBlue

🔍 Troubleshooting
ClassNotFoundException (Derby driver) → Add derbyclient.jar to WEB-INF/lib or GlassFish lib folder.

Database lock error (embedded) → Only one JVM can access embedded DB. Use client/server mode for multi-user.

Connection refused → Ensure Derby server is running (port 1527).

Expected exception on shutdown → Derby throws SQLState XJ015 when shutdown is successful.

🔒 Security Notes
Use hashed passwords (BCrypt/Argon2).

Don’t store card/payment details in DB.

Store DB credentials in environment variables or config outside Git.

Use HTTPS in production + secure cookies.


📄 License
MIT License (add LICENSE file if missing).

📬 Contact
GitHub: DataWithVaibhav

Author: Vaibhav Singh
