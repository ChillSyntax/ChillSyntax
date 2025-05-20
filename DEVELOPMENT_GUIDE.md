# Shopping Cart Development Guide

This guide explains the key development aspects of the ChillSyntax Shop project with specific examples from our implementation.

## 1. Project Setup

### JDK & IDE Setup
- JDK 8+ required
- Eclipse EE used for development
- Project configured as Maven project for dependency management

Example from our `pom.xml`:
```xml
<properties>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
</properties>
```

## 2. Project Structure

Our project follows the MVC pattern:
```
shopping-cart/
├── src/
│   └── com/chillsyntax/
│       ├── beans/         # Models (ProductBean, CartBean, etc.)
│       ├── service/       # Business logic interfaces
│       ├── service/impl/  # Service implementations
│       └── utility/       # Helper classes
├── WebContent/           # View layer (JSP pages)
└── databases/           # Database scripts
```

## 3. Database Design

### Schema Design
Real example from our project (`databases/mysql_query.sql`):
```sql
CREATE TABLE product (
  pid VARCHAR(60) NOT NULL,
  pname VARCHAR(100) NULL DEFAULT NULL,
  ptype VARCHAR(100) NULL DEFAULT NULL,
  pinfo VARCHAR(2000) NULL DEFAULT NULL,
  pprice DOUBLE NULL DEFAULT NULL,
  pquantity INT NULL DEFAULT NULL,
  PRIMARY KEY (pid)
);
```

### Table Relationships
Example relationship from our project:
```sql
ALTER TABLE usercart
  ADD CONSTRAINT useremail
    FOREIGN KEY (username) REFERENCES user(email),
  ADD CONSTRAINT prodidcart
    FOREIGN KEY (prodid) REFERENCES product(pid);
```

## 4. JDBC Implementation

### Database Connection
Example from our `DBUtil` class:
```java
public static Connection provideConnection() {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/shopping-cart",
            "root",
            "root"
        );
    } catch (Exception e) {
        e.printStackTrace();
        return null;
    }
}
```

## 5. Model & DAO Classes

### Model Example
From `CartBean.java`:
```java
public class CartBean implements Serializable {
    private String userId;
    private String prodId;
    private int quantity;
    // Getters and setters
}
```

### DAO Implementation
From `ProductServiceImpl.java`:
```java
public List<ProductBean> getAllProducts() {
    List<ProductBean> products = new ArrayList<>();
    Connection con = DBUtil.provideConnection();
    try {
        PreparedStatement ps = con.prepareStatement("select * from product");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            ProductBean product = new ProductBean();
            product.setProdId(rs.getString(1));
            product.setProdName(rs.getString(2));
            products.add(product);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return products;
}
```

## 6. UI Implementation

### Visual Design
Example from our header.jsp:
```css
.header-banner {
    background: linear-gradient(135deg, #6366F1 0%, #8B5CF6 100%);
    color: white;
    padding: 40px 0;
    margin-top: 50px;
}

.navbar-brand {
    font-size: 16px;
    font-weight: 600;
    color: #6366F1 !important;
}
```

### Component Layout
Example of search component from header.jsp:
```html
<div class="header-banner">
    <div class="container-fluid text-center">
        <h2>ChillSyntax Shop</h2>
        <form class="search-form" action="index.jsp" method="get">
            <div class="input-group">
                <input type="text" class="form-control" name="search"
                    placeholder="Search for products..." required>
                <div class="input-group-btn">
                    <button type="submit" class="btn">Search</button>
                </div>
            </div>
        </form>
    </div>
</div>
```

### Responsive Design
Example from our header.jsp:
```css
@media (max-width: 767px) {
    .navbar-nav {
        height: auto;
    }
    
    .navbar-nav > li {
        height: 46px;
    }
    
    .navbar-toggle {
        margin-top: 9px;
        margin-bottom: 9px;
    }
}
```

## 7. Accessibility Features

1. Semantic HTML:
```html
<nav class="navbar navbar-default">
<header class="header-banner">
<main class="container">
```

2. ARIA labels:
```html
<button aria-label="Toggle navigation">
<input aria-label="Search products">
```

3. Color Contrast:
```css
.navbar-brand {
    color: #6366F1; /* High contrast with white background */
}
```

## Development Tips

1. Database Operations:
   - Always use prepared statements to prevent SQL injection
   - Close connections in finally blocks or use try-with-resources

2. UI Development:
   - Test responsive design using Chrome DevTools
   - Validate HTML and CSS
   - Test with different browsers

3. Code Organization:
   - Follow MVC pattern strictly
   - Keep business logic in service layer
   - Use interfaces for loose coupling
