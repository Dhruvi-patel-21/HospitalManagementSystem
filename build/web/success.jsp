<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success</title>

  
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String msg = request.getParameter("msg");
    if (msg == null) {
        msg = "Operation completed successfully";
    }
%>


<div class="success-box">

    <h1>SUCCESS ✅</h1>

    <p><%= msg %></p>

    <a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>

</div>

</body>
</html>


