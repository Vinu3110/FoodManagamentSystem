
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <title>Food Management System - Home</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>

    <!-- NAVIGATION BAR -->

    <div class="navbar">

        <div class="logo">
            Food Management
        </div>

        <div class="nav-links">

            <a href="<%= request.getContextPath() %>/index.jsp">
                Home
            </a>

            <a href="<%= request.getContextPath() %>/GetAllFoodsServlet">
                Foods
            </a>

            <a href="<%= request.getContextPath() %>/aboutus.jsp">
                About Us
            </a>

            <a href="<%= request.getContextPath() %>/contactus.jsp">
                Contact
            </a>

            <a href="<%= request.getContextPath() %>/login.jsp">
                Login
            </a>

            <a href="<%= request.getContextPath() %>/register.jsp">
                Register
            </a>

        </div>

    </div>


    <!-- HOME CONTENT -->

    <div class="home-container">

        <div class="hero">

            <h1>
                Welcome to Food Management System
            </h1>

            <p>
                Discover delicious food, explore our menu
                and manage your food choices easily.
            </p>

            <a class="btn"
               href="<%= request.getContextPath() %>/GetAllFoodsServlet">
                Explore Foods
            </a>

            <a class="btn"
               href="<%= request.getContextPath() %>/register.jsp">
                Create Account
            </a>

        </div>


        <!-- INFORMATION CARD -->

        <div class="card">

            <h2>Fresh Food, Better Experience</h2>

            <p>
                Our Food Management System makes it easy to manage
                food information and explore available dishes.
            </p>

        </div>

    </div>


    <!-- FOOTER -->

    <div class="footer">

        Food Management System | All Rights Reserved

    </div>

</body>
</html>
