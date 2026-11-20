
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.User" %>
<%
    User profile = (User) request.getAttribute("profile");

    if (profile == null) {
        response.sendRedirect("ViewProfileServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
    <div class="logo">Food Management</div>
    <div>
        <a href="index.jsp">Home</a>
        <a href="GetAllFoodsServlet">Foods</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2>My Profile</h2>

        <p><strong>User ID:</strong> <%= profile.getId() %></p>
        <p><strong>Name:</strong> <%= profile.getName() %></p>
        <p><strong>Email:</strong> <%= profile.getEmail() %></p>
        <p><strong>Account Type:</strong> <%= profile.getRole() %></p>

        <br>
        <a class="btn btn-blue" href="GetAllFoodsServlet">Browse Foods</a>
    </div>
</div>

</body>
</html>
