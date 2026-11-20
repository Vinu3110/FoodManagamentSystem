
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Foods</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
    <div class="logo">Food Management</div>
    <div>
        <a href="index.jsp">Home</a>
        <a href="GetAllFoodsServlet">All Foods</a>
        <a href="login.jsp">Login</a>
    </div>
</div>

<div class="form-box">
    <h2>Search Food Items</h2>

    <form action="SearchFoodServlet" method="get">
        <label>Food Name or Category</label>
        <input type="text" name="name" placeholder="Example: Pizza, Breakfast" required>

        <button type="submit">Search Food</button>
    </form>
</div>

</body>
</html>
