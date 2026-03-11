<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Appointment</title>

   
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

    <h1>Add Appointment</h1>

    <form action="AppointmentServlet" method="post">

        <label>Patient ID</label>
        <input type="text" name="patient_id" required>

        <label>Doctor ID</label>
        <input type="text" name="doctor_id" required>

        <label>Date</label>
        <input type="date" name="date" required>

        <button type="submit">Add Appointment</button>

    </form>

    <br>
    <a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>

</div>

</body>
</html>

