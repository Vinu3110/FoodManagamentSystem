
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
    <title>Login - Food Management System</title>
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

    <!-- LOGIN FORM -->
    <div class="form-box">

        <h2>Login Page</h2>

        <% if ("invalid".equals(request.getParameter("error"))) { %>
            <div class="error-message">
                Invalid Login Credentials!
            </div>
        <% } %>

        <% if ("success".equals(request.getParameter("registered"))) { %>
            <div class="success-message">
                Registration Successful! Please Login.
            </div>
        <% } %>

        <form action="<%= contextPath %>/LoginServlet" method="post">

            <label>Email</label>
            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

            <label>Password</label>
            <input type="password"
                   name="password"
                   placeholder="Enter your password"
                   required>

            <button type="submit">Login</button>

        </form>

        <p>
            Don't have an account?
            <a href="<%= contextPath %>/register.jsp">Register here</a>
        </p>

    </div>

</body>
</html>
