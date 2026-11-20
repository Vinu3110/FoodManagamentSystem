
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.User" %>

<%
    User loggedUser = (User) session.getAttribute("user");

    if (loggedUser != null) {
        if ("ADMIN".equalsIgnoreCase(loggedUser.getRole())) {
            response.sendRedirect(request.getContextPath() + "/admin.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/GetAllFoodsServlet");
        }
        return;
    }

    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Register - Food Management System</title>
    <link rel="stylesheet" href="<%= contextPath %>/css/style.css">
</head>

<body>

    <!-- NAVBAR -->
    <div class="navbar">
        <div class="logo">Food Management</div>

        <div class="nav-links">
            <a href="<%= contextPath %>/index.jsp">Home</a>
            <a href="<%= contextPath %>/aboutus.jsp">About Us</a>
            <a href="<%= contextPath %>/GetAllFoodsServlet">Foods</a>
            <a href="<%= contextPath %>/contactus.jsp">Contact Us</a>
            <a href="<%= contextPath %>/login.jsp">Login</a>
            <a href="<%= contextPath %>/register.jsp">Register</a>
        </div>
    </div>

    <!-- REGISTRATION FORM -->
    <div class="form-box">

        <h2>Create User Account</h2>

        <% if ("exists".equals(request.getParameter("error"))) { %>
            <div class="error-message">
                Email already registered. Please login.
            </div>
        <% } %>

        <% if ("empty".equals(request.getParameter("error"))) { %>
            <div class="error-message">
                Please fill in all fields.
            </div>
        <% } %>

        <form action="<%= contextPath %>/RegisterServlet" method="post">

            <label>Full Name</label>
            <input type="text"
                   name="name"
                   placeholder="Enter your name"
                   required>

            <label>Email</label>
            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

            <label>Password</label>
            <input type="password"
                   name="password"
                   placeholder="Create password"
                   required>

            <button type="submit">Register</button>

        </form>

        <p>
            Already have an account?
            <a href="<%= contextPath %>/login.jsp">Login here</a>
        </p>

    </div>

</body>
</html>
