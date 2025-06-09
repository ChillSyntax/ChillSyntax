<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - ChillSyntax Shop</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/changes.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8ef 100%);
        }
        
        .login-container {
            margin-top: 60px;
            margin-bottom: 60px;
        }
        
        .login-panel {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            position: relative;
            display: flex;
            min-height: 500px;
        }
        
        .login-sidebar {
            flex: 0 0 240px;
            background: linear-gradient(135deg, #4CAF50 0%, #45a049 100%);
            padding: 40px;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        
        .login-sidebar h2 {
            font-size: 26px;
            font-weight: 700;
            margin-bottom: 15px;
        }
        
        .login-sidebar p {
            font-size: 15px;
            opacity: 0.9;
            line-height: 1.6;
        }
        
        .login-main {
            flex: 1;
            padding: 50px 60px;
            max-width: 480px;
            margin: 0 auto;
        }
        
        .login-header {
            margin-bottom: 40px;
            text-align: center;
        }
        
        .login-header h3 {
            font-size: 28px;
            color: #333;
            font-weight: 700;
            margin-bottom: 10px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            line-height: 32px;
        }
        
        .login-header h3 i {
            font-size: 32px;
            color: #4CAF50;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 32px;
            width: 32px;
        }
        
        .login-header p {
            color: #666;
            font-size: 15px;
        }
        
        .form-group {
            margin-bottom: 24px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #2c3e50;
            font-weight: 600;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .input-group {
            display: flex;
            align-items: center;
            height: 45px;
            background: #f8f9fa;
            border-radius: 10px;
            transition: all 0.3s ease;
            padding: 0;
        }
        
        .input-group:hover {
            background: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        }
        
        .input-group-icon {
            color: #4CAF50;
            font-size: 16px;
            min-width: 45px;
            height: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: transparent;
        }
        
        .form-control {
            flex: 1;
            height: 45px;
            border: 2px solid transparent;
            border-radius: 0 10px 10px 0;
            padding: 0 16px;
            font-size: 15px;
            font-weight: 500;
            color: #2c3e50;
            background: transparent;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #4CAF50;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(76,175,80,0.1);
        }
        
        .form-control::placeholder {
            color: #95a5a6;
            font-weight: 400;
        }
        
        select.form-control {
            cursor: pointer;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='%234CAF50' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: calc(100% - 16px) center;
            padding-right: 40px;
        }
        
        .btn-login {
            width: 100%;
            height: 48px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #4CAF50 0%, #45a049 100%);
            color: white;
            font-size: 15px;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 32px;
            padding: 0 32px;
            box-shadow: 0 4px 12px rgba(76,175,80,0.15);
        }
        
        .btn-login i {
            position: absolute;
            left: 32px;
            font-size: 18px;
            height: 18px;
            width: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-login span {
            flex: 1;
            text-align: center;
        }
        
        .message-box {
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 12px;
            background-color: #e8f5e9;
            border-left: 4px solid #4CAF50;
        }
        
        .message-box p {
            margin: 0;
            color: #2e7d32;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
        }
        
        .message-box p i {
            font-size: 16px;
        }
        
        .register-link {
            text-align: center;
            margin-top: 25px;
            color: #666;
            font-size: 14px;
        }
        
        .register-link a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: 500;
            margin-left: 5px;
        }
        
        .register-link a:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 768px) {
            .login-sidebar {
                display: none;
            }
            
            .login-main {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="container login-container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="login-panel">
                    <div class="login-sidebar">
                        <div>
                            <h2>Welcome Back!</h2>
                            <p>Sign in to access your account and explore our latest collection of electronic products.</p>
                        </div>
                        <div>
                            <p style="margin-bottom: 0;">Need help? Contact support</p>
                        </div>
                    </div>
                    <div class="login-main">
                        <div class="login-header">
                            <h3><i class="fa fa-user-circle-o"></i> Sign In</h3>
                            <p>Welcome back! Please sign in to your account</p>
                        </div>
  <% String message = request.getParameter("message");
                           if (message != null) { %>
                            <div class="message-box">
                                <p><i class="fa fa-info-circle"></i> <%= message %></p>
                            </div>
                        <% } %>
                        
                        <form action="./LoginSrv" method="post">
                            <div class="form-group">
                                <label for="username">Email Address</label>
                                <div class="input-group">
                                    <i class="input-group-icon fa fa-envelope"></i>
                                    <input type="email" 
                                           class="form-control" 
                                           id="username"
                                           name="username"
                                           placeholder="Enter your email address"
                                           required>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="password">Password</label>
                                <div class="input-group">
                                    <i class="input-group-icon fa fa-lock"></i>
                                    <input type="password" 
                                           class="form-control" 
                                           id="password"
                                           name="password"
                                           placeholder="Enter your password"
                                           required>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="usertype">Login As</label>
                                <div class="input-group">
                                    <i class="input-group-icon fa fa-users"></i>
                                    <select class="form-control" 
                                            id="usertype"
                                            name="usertype"
                                            required>
                                        <option value="customer">Customer</option>
                                        <option value="admin">Admin</option>
                                    </select>
                                </div>
                            </div>
                            
                            <button type="submit" class="btn-login">
                                <i class="fa fa-sign-in"></i>
                                <span>Sign In</span>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.html" %>
</body>
</html>
