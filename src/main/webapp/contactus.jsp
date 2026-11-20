
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">

    <div class="logo">
        Food Management
    </div>

    <div class="nav-links">
        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/aboutus.jsp">About Us</a>
        <a href="<%= request.getContextPath() %>/GetAllFoodsServlet">Foods</a>
        <a href="<%= request.getContextPath() %>/contactus.jsp">Contact</a>
        <a href="<%= request.getContextPath() %>/login.jsp">Login</a>
        <a href="<%= request.getContextPath() %>/register.jsp">Register</a>
    </div>

</div>

<div class="container">
    <div class="card">
        <h2>Contact Us</h2>

        <p>Have questions or need assistance? Contact us using the details below.</p>

        <br>

        <p><strong>Project:</strong> Food Management System</p>
        <p><strong>Email:</strong> support@foodmanagement.com</p>
        <p><strong>Address:</strong> Vijayawada, Andhra Pradesh, India</p>

        <br>

        <p>We are happy to help you with your queries.</p>
    </div>
</div>

<div class="footer">Food Management System</div>

</body>
</html>
