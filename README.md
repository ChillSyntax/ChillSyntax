# Online Shopping Cart (E-Commerce Website)

A comprehensive e-commerce solution for electronics products built with Java EE technologies.

## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Technical Architecture](#technical-architecture)
4. [Project Structure](#project-structure)
5. [Database Design](#database-design)
6. [Implementation Details](#implementation-details)
7. [UI Design](#ui-design)
8. [Setup Instructions](#setup-instructions)
9. [Email Configuration](#email-configuration)

## Overview

In this projects a user can visit the websites, registers and login to the website. They can check all the products available for shopping, filter and search item based on different categories, and then add to cart. They can add multiple item to the cart and also plus or minus the quantity in the cart. Once the cart is updated, the user can proceed to checkout and click the credit card payment details to proceed. Once the payment is success the orders will be placed and users will be able to see the orders details in the orders section along with the shipping status of the product.

The admin also plays an important role for this project as the admin is the one responsible for adding any product to the store, updating the items, removing the item from the store as well as managing the inventory. The admin can see all the product orders placed and also can mark them as shipped or delivered based on the conditions.

One of the best functionality that the projects include is mailing the customers, so once a user registers to the website, they will recieve a mail for the successful registration to the website, and along with that whenever a user orders any product or the product got shipped from the store, then the user will also receive the email for its confirmation.
Sometimes, if the user tried to add any item which is out of stock, them they will get an email one the item is available again the stock.

Note: The payment page is created only for demo purpose and its not fully integrated with any payment gateway. So for now any credit card details will be accepted and the demo orders will be placed.

## Highlights :--

### The users will get a mail to their registered mail Id during:-
- New User Registration
- Order Successfully Placed
- The Item was out of stock while exploring but now it got available in the store
- Successful shipment and delivery of the Item

### Technologies used:-
1. Front-End Development:
- HTML
- CSS
- Javascript
- BootStrap

2. Back-End Development:
- Java [JDK 8+]
- JDBC
- Servlet
- JSP

3. Database:
- MySql

### ================ Software And Tools Required ================
- : Git [https://www.youtube.com/watch?v=gv7VPQ4LZ7g]
- : Java JDK 8+ [https://www.youtube.com/watch?v=O9PWH9SeTTE]
- : Eclipse EE (Enterprise Edition) [https://www.youtube.com/watch?v=8aDsEV7txXE]
- : Apache Maven [https://www.youtube.com/watch?v=jd2zx3dLjuw]
- : Tomcat v8.0+ [https://youtu.be/mLFPodZO8Iw?t=903]
- : MySQL Server [https://www.youtube.com/watch?v=Ydh5jYA6Frs]
- : MySQL Workbench [https://www.youtube.com/watch?v=t79oCeTXHwg]

### ================= Dummy Database Initialization =================
STEP 1: Open MySQL Command Prompt or MySQL Workbench

STEP 2: Login to the administrator user of MySql:
	 ```mysql -u <username> -p``` (Enter Password if asked)

STEP 3: Copy paste and execute the MySQL Query from the following file:-
- Run the Sql Query From this file: [databases/mysql_query.sql](./databases/mysql_query.sql)

### ======GENERATING GMAIL APP PASSWORD [For Mailing Functionalities]========
Step 1: Create a gmail account or login to existing account in any browser

Step 2 : Go to [https://myaccount.google.com/security](https://myaccount.google.com/security) and check if 2 step verifications is enabled or not, enable it if not enabled

Step 3: Go to [https://myaccount.google.com/apppasswords](https://myaccount.google.com/apppasswords) and enter password if asked

Step 4: In Select an App Section: select Other (custom name) => enter "ChillSyntax Shop" => Generate

Step 5: After that it will generate 16 digits app password which you need to copy and save for future configurations.

Step 6: Done : Now continue to importing the project. [Don't share the above password generated to anyone]

### ========== Importing and Running The Project Through Eclipse EE ==========

Step 1: Open Eclipse Enterprise Edition. [Install, if not already installed.]

Step 2: Click On File > Import > Git > Projects From Git > Clone Uri > Paste The Repository Url as: ```https://github.com/shashirajraja/shopping-cart.git```> Select master Branch > Next > Next > Finish.

Step 3: Go inside ```Java Resources > src > application.properties``` and update the values as below:
- a) Update value for db.username and db.password according to your installed mysql credentials.
- b) Update value for mailer.email and mailer.password, with the same email and app password that you generated earlier in above section [ NOTE:Actual gmail password will not work]

Step 4: Right Click on Project > Run as > Maven Build > In the goals field enter "clean install" > apply > run

Step 5: Right Click On Project > Build Path > Configure Build Path > Libraries > Remove and Update Any Libraries if Red Mark Exists > Finish.

Step 6: Right Click on Project > maven > update project > select force update > apply > close

Step 7: Tomcat Configurations:
- If Tomcat Server is not configured in Eclipse :
	-  Right Click On Project > Run As > Run On Server > Manually Define a new server > Select server type > select Tomcat v8.0+ > (Select Tomcat V8.0+ Installation Location If Asked) > Next > Add the current project > Finish.

- Else If Tomcat Server is already configured in Eclipse:
	- Right Click On Project > Run As > Run On Server > Select Tomcat Version > Next > Add the project > Finish.
		<p align='center'>or</p>
	- You can directly goto server tab, select the tomcat server and use the debug or run button to start the previously ran project

Step 8: Check Running The Site At  [http://localhost:8080/shopping-cart/](http://localhost:8080/shopping-cart/)

Step 9:  [To Change the Port, if getting error like 'port already in use'] Open The Server Tab > Double Click On Tomcat Server > Ports > Change The Port Number For Http/1.1 To 8083 > Close And Save. Now Start and you can access the project on [http://localhost:8083/shopping-cart/](http://localhost:8083/shopping-cart/)

Step 10: Default Username And Password For Admin Is "admin@gmail.com" And "admin"

Step 11: The default Username And Password For User Is "guest@gmail.com" And "guest"

## Features

### Customer Features
- User registration and authentication
- Product browsing and search functionality 
- Category-based filtering
- Shopping cart management
  - Add/remove products
  - Update quantities
  - Cart count tracking
- Order placement and history
- Email notifications for:
  - Registration confirmation
  - Order placement
  - Order shipping updates
  - Back-in-stock alerts

### Admin Features
- Product management
  - Add/edit/remove products
  - Update prices and inventory
  - Upload product images
- Order management
  - View all orders
  - Update shipping status
  - Track sold items

## Technical Architecture

### Models
1. User Model (`com.chillsyntax.beans.UserBean`)
   - Attributes: email, name, mobile, address, pincode, password

2. Product Model (`com.chillsyntax.beans.ProductBean`)
   - Attributes: prodId, prodName, prodType, prodInfo, prodPrice, prodQuantity, prodImage

3. Cart Model (`com.chillsyntax.beans.CartBean`)
   - Attributes: userId, prodId, quantity

4. Order Model (`com.chillsyntax.beans.OrderBean`)
   - Attributes: transactionId, productId, quantity, amount, shipped

### Data Access Layer
The project uses JDBC for database operations with the following key services:

1. Product Service (`ProductServiceImpl`)
   ```java
   - addProduct(ProductBean product)
   - updateProduct(ProductBean prevProduct, ProductBean updatedProduct)
   - removeProduct(String prodId)
   - getAllProducts()
   - getProductDetails(String prodId)
   - searchAllProducts(String search)
   ```

2. Cart Service (`CartServiceImpl`)
   ```java
   - addProductToCart(String userId, String prodId, int prodQty)
   - updateProductToCart(String userId, String prodId, int prodQty)
   - removeProductFromCart(String userId, String prodId)
   - getAllCartItems(String userId)
   - getCartCount(String userId)
   ```

3. Order Service (`OrderServiceImpl`)
   ```java
   - paymentSuccess(String userName, double paidAmount)
   - addOrder(OrderBean order)
   - getAllOrders()
   - getOrdersByUserId(String emailId)
   - shipNow(String orderId, String prodId)
   ```

### Database Design
The database schema includes the following tables:

1. `user` 
   ```sql
   CREATE TABLE user (
     email VARCHAR(60) PRIMARY KEY,
     name VARCHAR(30),
     mobile BIGINT,
     address VARCHAR(250),
     pincode INT,
     password VARCHAR(20)
   )
   ```

2. `product`
   ```sql
   CREATE TABLE product (
     pid VARCHAR PRIMARY KEY,
     pname VARCHAR,
     ptype VARCHAR,
     pinfo TEXT,
     pprice DOUBLE,
     pquantity INT,
     image BLOB
   )
   ```

3. `usercart`
   ```sql
   CREATE TABLE usercart (
     username VARCHAR REFERENCES user(email),
     prodid VARCHAR REFERENCES product(pid),
     quantity INT
   )
   ```

4. `orders`
   ```sql
   CREATE TABLE orders (
     orderid VARCHAR,
     prodid VARCHAR REFERENCES product(pid),
     quantity INT,
     amount DOUBLE,
     shipped INT
   )
   ```

## UI Design & Components

The application uses JSP for server-side rendering with Bootstrap for responsive design:

1. Customer Interface
   - Header with navigation and cart count
   - Product grid with filtering options
   - Cart management interface
   - Order history view
   - Responsive mobile design

2. Admin Interface 
   - Product management dashboard
   - Order tracking system
   - Inventory management
   
## Component Layout

The project follows a layered architecture:

```
shopping-cart/
├── src/
│   └── com/chillsyntax/
│       ├── beans/           # Model classes
│       ├── service/         # Service interfaces
│       ├── service/impl/    # Service implementations
│       ├── utility/         # Helper classes
│       └── srv/            # Servlet controllers
├── WebContent/
│   ├── admin/              # Admin interface JSPs
│   ├── customer/           # Customer interface JSPs
│   ├── css/               # Stylesheets
│   ├── js/                # JavaScript files
│   └── images/            # Static resources
└── databases/             # Database scripts
`````

## Setup Instructions

### Prerequisites
1. Java JDK 8+ 
2. Eclipse EE (Enterprise Edition)
3. Apache Maven
4. MySQL Server & Workbench
5. Apache Tomcat 8.0+

### Database Setup
1. Open MySQL Workbench and connect to your local MySQL server
2. Execute the database creation script from `databases/mysql_query.sql`
3. Verify the tables are created: user, product, usercart, orders, transactions

### Email Configuration
1. Create/use a Gmail account for sending notifications
2. Enable 2-step verification at https://myaccount.google.com/security
3. Generate an App Password:
   - Go to https://myaccount.google.com/apppasswords
   - Select "Other (Custom name)" and enter "ChillSyntax Shop"
   - Copy the generated 16-digit password

### Project Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/shashirajraja/shopping-cart.git
   ```

2. Import into Eclipse:
   - File > Import > Git > Projects From Git > Clone URI
   - Enter repo URL and select master branch
   - Import as Maven project

3. Configure application properties:
   - Open `src/application.properties`
   - Update database credentials:
     ```properties
     db.username=your_mysql_username
     db.password=your_mysql_password
     ```
   - Update email settings:
     ```properties
     mailer.email=your_gmail
     mailer.password=your_app_password
     ```

4. Build the project:
   - Right-click project > Run as > Maven Build
   - Goals: `clean install`
   - Apply and run

5. Server configuration:
   - Right-click project > Run As > Run on Server
   - Choose Tomcat v8.0+
   - Start the server

6. Access the application:
   - Open http://localhost:8080/shopping-cart/
   - Default admin credentials are in the database script

### Troubleshooting
- Port conflicts: Change Tomcat port in server.xml
- Database connection: Verify MySQL is running and credentials are correct
- Build errors: Update Maven dependencies and project facets
- Classpath issues: Verify all required JARs are in WEB-INF/lib

## Contributing
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request


