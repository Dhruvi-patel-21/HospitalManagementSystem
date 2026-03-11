<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="form-box">
    
    <h1>Hospital Login</h1>

    <form action="LoginServlet" method="post">

        <label>Username</label>
        <input type="text" name="username" required>

        <label>Password</label>
       <input type="password" name="password" required>

        <button type="submit">Login</button>

    </form>

    <% 
        String error = request.getParameter("error");
        if (error != null) { 
    %>
        <p class="error-msg"><%= error %></p>
    <% } %>

</div>

</body>
</html>


