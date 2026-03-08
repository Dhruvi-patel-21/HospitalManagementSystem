<%-- 
    Document   : addDoctor
    Created on : 27 Jan 2026, 5:38:52 pm
    Author     : dhruv
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Doctor</title>

    <!-- ✅ CSS LINK -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!-- ✅ FORM CONTAINER -->
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





<%--<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Doctor</title>
    </head>
    <body>
        <%
            if (session == null || session.getAttribute("username") == null) {
                response.sendRedirect("index.jsp");
                return;
            }
        %>

        <h1>Add Doctor</h1>

        <form action="DoctorServlet" method="post">
            Name: <input type="text" name="name"><br><br>
            Specialization: <input type="text" name="specialization"><br><br>
            <input type="submit" value="Add Doctor">
        </form>

        <br>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </body>
</html>--%>
