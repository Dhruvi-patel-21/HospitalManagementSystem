
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Doctor</title>

   
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>


<div class="form-box">

    <h1>Add Doctor</h1>

    <form action="DoctorServlet" method="post">

        <label>Doctor Name</label>
        <input type="text" name="name" required>

        <label>Specialization</label>
        <input type="text" name="specialization" required>

        <button type="submit">Add Doctor</button>

    </form>

    <br>
    <a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>

</div>

</body>
</html>


