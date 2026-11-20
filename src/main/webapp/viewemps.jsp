
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Food" %>
<%@ page import="com.model.User" %>

<%
    List<Food> foods = (List<Food>) request.getAttribute("foods");
    User user = (User) session.getAttribute("user");

    boolean isAdmin = user != null
            && user.getRole() != null
            && "ADMIN".equalsIgnoreCase(user.getRole());

    String contextPath = request.getContextPath();

    String searchName = request.getAttribute("searchName") == null
            ? "" : (String) request.getAttribute("searchName");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Available Food Items</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= contextPath %>/css/style.css">
</head>

<body>

    <div class="navbar">
        <div class="logo">Food Management</div>

        <div class="nav-links">
            <a href="<%= contextPath %>/index.jsp">Home</a>

            <% if (isAdmin) { %>
                <a href="<%= contextPath %>/admin.jsp">Dashboard</a>
            <% } %>

            <% if (user != null) { %>
                <a href="<%= contextPath %>/ViewProfileServlet">My Profile</a>
                <a href="<%= contextPath %>/LogoutServlet">Logout</a>
            <% } else { %>
                <a href="<%= contextPath %>/login.jsp">Login</a>
                <a href="<%= contextPath %>/register.jsp">Register</a>
            <% } %>
        </div>
    </div>

    <main class="food-container">

        <div class="food-heading">
            <h1>Available Food Items</h1>
            <p>Explore and manage the food items available in our system.</p>
        </div>

        <% if (isAdmin) { %>
            <div class="food-toolbar">
                <a class="btn btn-primary"
                   href="<%= contextPath %>/foods.jsp">
                    + Add New Food
                </a>
            </div>
        <% } %>

        <form class="search-form"
              action="<%= contextPath %>/SearchFoodServlet"
              method="get">

            <input type="text"
                   name="name"
                   placeholder="Search food by name or category..."
                   value="<%= searchName %>">

            <button type="submit" class="btn btn-primary">
                Search
            </button>

            <a class="btn btn-secondary"
               href="<%= contextPath %>/GetAllFoodsServlet">
                View All
            </a>
        </form>

        <% if (foods == null || foods.isEmpty()) { %>

            <div class="empty-food-card">
                <h2>No Food Items Found!</h2>
                <p>There are currently no food items to display.</p>

                <% if (isAdmin) { %>
                    <a class="btn btn-primary"
                       href="<%= contextPath %>/food.jsp">
                        Add Your First Food
                    </a>
                <% } %>
            </div>

        <% } else { %>

            <div class="food-table-wrapper">
                <table class="food-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Availability</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <% for (Food food : foods) { %>
                            <tr>
                                <td><%= food.getId() %></td>
                                <td><strong><%= food.getName() %></strong></td>
                                <td><%= food.getCategory() %></td>
                                <td><%= food.getDescription() %></td>
                                <td>₹<%= food.getPrice() %></td>
                                <td><%= food.getAvailability() %></td>

                                <td>
                                    <div class="food-actions">

                                        <a class="btn btn-secondary"
                                           href="<%= contextPath %>/viewemp.jsp?id=<%= food.getId() %>">
                                            View
                                        </a>

                                        <% if (isAdmin) { %>
                                            <a class="btn btn-edit"
                                               href="<%= contextPath %>/edit.jsp?id=<%= food.getId() %>">
                                                Edit
                                            </a>

                                            <form action="<%= contextPath %>/DeleteFoodServlet"
                                                  method="post"
                                                  onsubmit="return confirm('Are you sure you want to delete this food?');">

                                                <input type="hidden"
                                                       name="id"
                                                       value="<%= food.getId() %>">

                                                <button type="submit"
                                                        class="btn btn-delete">
                                                    Delete
                                                </button>
                                            </form>
                                        <% } %>

                                    </div>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

        <% } %>

    </main>

    <div class="footer">
        Food Management System | All Rights Reserved
    </div>

</body>
</html>
