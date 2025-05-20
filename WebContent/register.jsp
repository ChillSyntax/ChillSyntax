<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
  <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/changes.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
    body {
      background-color: #f0f8f0;
      font-family: Arial, sans-serif;
    }
    .login-panel {
      margin-top: 50px;
      margin-bottom: 50px;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    .login-header {
      background-color: #4CAF50;
      color: white;
      padding: 15px;
      text-align: center;
      font-size: 24px;
      font-weight: bold;
    }
    .login-body {
      background-color: white;
      padding: 25px;
    }
    .form-group {
      margin-bottom: 20px;
    }
    label {
      display: block;
      margin-bottom: 5px;
      font-weight: normal;
    }

    /* Input fields styling - fixed icon centering */
    .custom-input-group {
      display: flex;
      width: 100%;
      border-radius: 4px;
      overflow: hidden;
      border: 1px solid #ccc;
    }
    .icon-container {
      width: 46px;
      height: 46px;
      flex: 0 0 46px;
      background-color: #f5f5f5;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .icon-container i {
      color: #555;
      font-size: 18px;
      display: block;
      text-align: center;
      width: 18px;
      height: 18px;
      line-height: 18px;
    }
    .custom-input-group input.form-control,
    .custom-input-group textarea.form-control {
      flex: 1;
      padding: 10px 12px;
      height: 46px;
      box-sizing: border-box;
      border: none;
      box-shadow: none;
    }
    .custom-input-group input.form-control:focus,
    .custom-input-group textarea.form-control:focus {
      outline: none;
      box-shadow: none;
    }
    .custom-input-group textarea.form-control {
      height: 46px;
      resize: none;
      padding-top: 13px;
    }

    /* Perfect button symmetry */
    .row-btn {
      display: flex;
      margin-left: -15px;
      margin-right: -15px;
    }
    .row-btn > div {
      padding-left: 15px;
      padding-right: 15px;
      width: 50%;
    }
    .btn {
      height: 46px;
      font-weight: 500;
      text-transform: uppercase;
      border-radius: 4px;
      font-size: 16px;
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 0;
    }
    .btn-danger {
      background-color: #d9534f;
      border-color: #d43f3a;
      color: white;
    }
    .btn-success {
      background-color: #4CAF50;
      border-color: #4CAF50;
      color: white;
    }
  </style>
</head>
<body>
  <%@ include file="header.jsp" %>
  <%
    String message = request.getParameter("message");
  %>
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="login-panel">
          <div class="login-header">Registration Form</div>
          <div class="login-body">
            <% if (message != null) { %>
              <div class="message-box">
                <p style="color: #388E3C; margin: 0;"><%= message %></p>
              </div>
            <% } %>
            <form action="./RegisterSrv" method="post">
              <div class="form-group">
                <label for="username">Name</label>
                <div class="custom-input-group">
                  <div class="icon-container">
                    <i class="glyphicon glyphicon-user"></i>
                  </div>
                  <input type="text"
                         name="username"
                         id="username"
                         class="form-control"
                         placeholder="Enter your name"
                         required>
                </div>
              </div>

              <div class="form-group">
                <label for="email">Email</label>
                <div class="custom-input-group">
                  <div class="icon-container">
                    <i class="glyphicon glyphicon-envelope"></i>
                  </div>
                  <input type="email"
                         name="email"
                         id="email"
                         class="form-control"
                         placeholder="Enter your email"
                         required>
                </div>
              </div>

              <div class="form-group">
                <label for="address">Address</label>
                <div class="custom-input-group">
                  <div class="icon-container">
                    <i class="glyphicon glyphicon-home"></i>
                  </div>
                  <textarea name="address"
                            id="address"
                            class="form-control"
                            placeholder="Enter your address"
                            required></textarea>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 form-group">
                  <label for="mobile">Mobile</label>
                  <div class="custom-input-group">
                    <div class="icon-container">
                      <i class="glyphicon glyphicon-earphone"></i>
                    </div>
                    <input type="number"
                           name="mobile"
                           id="mobile"
                           class="form-control"
                           placeholder="Enter mobile"
                           required>
                  </div>
                </div>
                <div class="col-md-6 form-group">
                  <label for="pincode">Pin Code</label>
                  <div class="custom-input-group">
                    <div class="icon-container">
                      <i class="glyphicon glyphicon-map-marker"></i>
                    </div>
                    <input type="number"
                           name="pincode"
                           id="pincode"
                           class="form-control"
                           placeholder="Enter pin code"
                           required>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 form-group">
                  <label for="password">Password</label>
                  <div class="custom-input-group">
                    <div class="icon-container">
                      <i class="glyphicon glyphicon-lock"></i>
                    </div>
                    <input type="password"
                           name="password"
                           id="password"
                           class="form-control"
                           placeholder="Enter password"
                           required>
                  </div>
                </div>
                <div class="col-md-6 form-group">
                  <label for="confirmPassword">Confirm Password</label>
                  <div class="custom-input-group">
                    <div class="icon-container">
                      <i class="glyphicon glyphicon-lock"></i>
                    </div>
                    <input type="password"
                           name="confirmPassword"
                           id="confirmPassword"
                           class="form-control"
                           placeholder="Confirm password"
                           required>
                  </div>
                </div>
              </div>

              <div class="row-btn">
                <div>
                  <button type="reset" class="btn btn-danger">RESET</button>
                </div>
                <div>
                  <button type="submit" class="btn btn-success">REGISTER</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="footer.html" %>
</body>
</html>
