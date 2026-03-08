<%-- 
    Document   : addPatient
    Created on : 27 Jan 2026, 5:38:00 pm
    Author     : dhruv
--%>


<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Patient</title>

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

    <h1>Add Patient</h1>

<form action="PatientServlet" method="post">

    <label>Patient Name</label>
    <input type="text" name="name" required>

    <label>Gender</label>
    <select name="gender" required>
        <option value="">Select Gender</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
    </select>

    <label>Age</label>
    <input type="number" name="age" min="0" required>

    <label>Disease</label>
    <input type="text" name="disease" required>

    <button type="submit">Add Patient</button>

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
        <title>Add Patient</title>
    </head>
    <body>
        <%
            if (session == null || session.getAttribute("username") == null) {
                response.sendRedirect("index.jsp");
                return;
            }
        %>

        <h1>Add Patient</h1>

        <form action="PatientServlet" method="post">
            Name: <input type="text" name="name"><br><br>
            Email: <input type="text" name="email"><br><br>
            Phone: <input type="text" name="phone"><br><br>
            <input type="submit" value="Add Patient">
        </form>

        <br>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </body>
</html>--%>

