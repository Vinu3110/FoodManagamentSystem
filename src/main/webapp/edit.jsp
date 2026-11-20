
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dao.FoodDAO" %>
<%@ page import="com.model.Food" %>
<%@ page import="com.model.User" %>
<%
    User user = (User) session.getAttribute("user");

    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

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
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Food</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
    <div class="logo">Food Management</div>
    <div>
        <a href="admin.jsp">Dashboard</a>
        <a href="GetAllFoodsServlet">View Foods</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<div class="form-box">
    <h2>Edit Food Details</h2>

    <form action="EditFoodServlet" method="post">

        <input type="hidden" name="id" value="<%= food.getId() %>">

        <label>Food Name</label>
        <input type="text" name="name"
               value="<%= food.getName() %>" required>

        <label>Category</label>
        <input type="text" name="category"
               value="<%= food.getCategory() %>" required>

        <label>Description</label>
        <textarea name="description" required><%= food.getDescription() %></textarea>

        <label>Price</label>
        <input type="number" name="price" min="0.01" step="0.01"
               value="<%= food.getPrice() %>" required>

        <label>Availability</label>
        <select name="availability" required>
            <option value="Available"
                <%= "Available".equals(food.getAvailability()) ? "selected" : "" %>>
                Available
            </option>
            <option value="Unavailable"
                <%= "Unavailable".equals(food.getAvailability()) ? "selected" : "" %>>
                Unavailable
            </option>
        </select>

        <button type="submit">Update Food</button>
    </form>
</div>

</body>
</html>
