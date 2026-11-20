
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dao.FoodDAO" %>
<%@ page import="com.model.Food" %>
<%@ page import="com.model.User" %>
<%
    Food food = null;

    try {
        int id = Integer.parseInt(request.getParameter("id"));
        food = new FoodDAO().fetchFood(id);
    } catch (Exception e) {
        response.sendRedirect("GetAllFoodsServlet");
        return;
    }

    if (food == null) {
        response.sendRedirect("GetAllFoodsServlet");
        return;
    }

    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Food Details</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
    <div class="logo">Food Management</div>
    <div>
        <a href="index.jsp">Home</a>
        <a href="GetAllFoodsServlet">All Foods</a>
        <% if (user != null) { %>
            <a href="LogoutServlet">Logout</a>
        <% } else { %>
            <a href="login.jsp">Login</a>
        <% } %>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2><%= food.getName() %></h2>

        <p><strong>Food ID:</strong> <%= food.getId() %></p>
        <p><strong>Category:</strong> <%= food.getCategory() %></p>
        <p><strong>Description:</strong> <%= food.getDescription() %></p>
        <p><strong>Price:</strong> ₹<%= food.getPrice() %></p>
        <p><strong>Availability:</strong> <%= food.getAvailability() %></p>

        <br>

        <a class="btn btn-blue" href="GetAllFoodsServlet">Back to Foods</a>

        <% if (user != null && "ADMIN".equals(user.getRole())) { %>
            <a class="btn" href="edit.jsp?id=<%= food.getId() %>">Edit Food</a>
        <% } %>
    </div>
</div>

</body>
</html>
