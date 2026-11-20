
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.User" %>

<%
    User loggedUser = (User) session.getAttribute("user");

    if (loggedUser == null ||
        loggedUser.getRole() == null ||
        !"ADMIN".equalsIgnoreCase(loggedUser.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Food Management System</title>
    <link rel="stylesheet"
          href="<%= contextPath %>/css/style.css">
</head>

<body class="admin-page">

    <!-- NAVBAR -->
    <div class="navbar">
        <div class="logo">Food Management Admin</div>

        <div class="nav-links">
            <a href="<%= contextPath %>/admin.jsp">Dashboard</a>
            <a href="<%= contextPath %>/GetAllFoodsServlet">View Foods</a>
            <a href="<%= contextPath %>/ViewProfileServlet">My Profile</a>
            <a href="<%= contextPath %>/LogoutServlet">Logout</a>
        </div>
    </div>

    <!-- WELCOME SECTION -->
    <div class="admin-welcome">
        <h1>Welcome, Admin!</h1>
        <p>Manage your food records easily from one place.</p>
    </div>

    <!-- DASHBOARD SECTION -->
    <div class="admin-dashboard">

        <h2>Admin Dashboard</h2>

        <p class="dashboard-description">
            Manage your food items, update food details,
            and keep your food records organized.
        </p>

        <div class="admin-actions">

            <!-- MY PROFILE -->
            <a href="<%= contextPath %>/ViewProfileServlet"
               class="admin-action-card">
                <span class="admin-icon">&#128100;</span>
                <h3>My Profile</h3>
                <p>View your admin profile and account details.</p>
            </a>

            <!-- VIEW ALL FOODS -->
            <a href="<%= contextPath %>/GetAllFoodsServlet"
               class="admin-action-card">
                <span class="admin-icon">&#9776;</span>
                <h3>View All Foods</h3>
                <p>View all available food items.</p>
            </a>

            <!-- MANAGE FOODS -->
            <a href="<%= contextPath %>/GetAllFoodsServlet"
               class="admin-action-card">
                <span class="admin-icon">&#9998;</span>
                <h3>Manage Foods</h3>
                <p>Edit, delete, and update food records.</p>
            </a>

        </div>
    </div>

    <!-- FOOTER -->
    <div class="footer">
        Food Management System | Admin Panel
    </div>

</body>
</html>
