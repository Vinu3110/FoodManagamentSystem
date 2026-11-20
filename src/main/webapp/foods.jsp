
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null || user.getRole() == null ||
            !"ADMIN".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String contextPath = request.getContextPath();
    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add New Food - Food Management System</title>
    <link rel="stylesheet" href="<%= contextPath %>/css/style.css">
</head>
<body>

    <div class="navbar">
        <div class="logo">Food Management</div>
        <div class="nav-links">
            <a href="<%= contextPath %>/admin.jsp">Dashboard</a>
            <a href="<%= contextPath %>/GetAllFoodsServlet">View Foods</a>
            <a href="<%= contextPath %>/ViewProfileServlet">My Profile</a>
            <a href="<%= contextPath %>/LogoutServlet">Logout</a>
        </div>
    </div>

    <div class="form-box">
        <h2>Add New Food</h2>

        <% if ("empty".equals(error)) { %>
            <p class="error-message">Please fill in all required fields.</p>
        <% } else if ("invalid".equals(error)) { %>
            <p class="error-message">Please enter a valid price.</p>
        <% } else if ("add".equals(error) || "failed".equals(error)) { %>
            <p class="error-message">Unable to add food. Please try again.</p>
        <% } %>

        <form action="<%= contextPath %>/AddFoodServlet" method="post">

            <label>Food Name</label>
            <input type="text" name="name"
                   placeholder="Enter food name" required>

            <label>Category</label>
            <select name="category" required>
                <option value="">Select Category</option>
                <option value="Breakfast">Breakfast</option>
                <option value="Lunch">Lunch</option>
                <option value="Dinner">Dinner</option>
                <option value="Snacks">Snacks</option>
                <option value="Dessert">Dessert</option>
                <option value="Beverages">Beverages</option>
            </select>

            <label>Description</label>
            <textarea name="description"
                      placeholder="Enter food description"
                      rows="4"></textarea>

            <label>Price (₹)</label>
            <input type="number" name="price"
                   placeholder="Enter price"
                   min="0" step="0.01" required>

            <label>Availability</label>
            <select name="availability" required>
                <option value="">Select Availability</option>
                <option value="Available">Available</option>
                <option value="Not Available">Not Available</option>
            </select>

            <button type="submit">Add Food</button>
        </form>

        <p>
            <a href="<%= contextPath %>/GetAllFoodsServlet">
                Back to Food List
            </a>
        </p>
    </div>

    <div class="footer">
        Food Management System | All Rights Reserved
    </div>

</body>
</html>
