
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.User" %>

<%
    User profile = (User) request.getAttribute("profile");

    if (profile == null) {
        profile = (User) session.getAttribute("user");
    }

    if (profile == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Profile - Food Management System</title>
    <link rel="stylesheet"
          href="<%= contextPath %>/css/style.css">
</head>

<body>

   <div class="navbar">
    <div class="logo">
        Food Management
    </div>

    <div class="profile-nav-links">
        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/GetAllFoodsServlet">Foods</a>
        <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
    </div>
</div>   

    <div class="container">
        <div class="card">
            <h2>My Profile</h2>

            <p><strong>Name:</strong> <%= profile.getName() %></p>
            <p><strong>Email:</strong> <%= profile.getEmail() %></p>
            <p><strong>Role:</strong> <%= profile.getRole() %></p>

            <br>

            <a href="<%= contextPath %>/admin.jsp"
               class="btn btn-blue">
                Back to Dashboard
            </a>
        </div>
    </div>

</body>
</html>
