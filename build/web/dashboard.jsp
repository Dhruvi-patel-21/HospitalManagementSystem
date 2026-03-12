<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
    <div class="nav-title">Hospital Management System</div>
    <a href="LogoutServlet" class="logout">Logout</a>
</div>

<div class="welcome">
   <% if ("ADMIN".equalsIgnoreCase(role)) { %>
        WELCOME, <%= username.toUpperCase() %>
   <% } else if ("DOCTOR".equalsIgnoreCase(role)) { %>
        WELCOME, DR.<%= username.toUpperCase() %>
   <% } %>
</div>

<div class="dashboard">
    <ul>
    <% if ("ADMIN".equalsIgnoreCase(role)) { %>
        <li><a href="addPatient.jsp" class="card">Add Patient</a></li>
        <li><a href="viewPatient.jsp" class="card">View Patients</a></li>
        <li><a href="addDoctor.jsp" class="card">Add Doctor</a></li>
        <li><a href="viewDoctor.jsp" class="card">View Doctors</a></li>
        <li><a href="addAppointment.jsp" class="card">Add Appointments</a></li>
        <li><a href="viewAppointment.jsp" class="card">View Appointments</a></li>
        
    <% } else if ("DOCTOR".equalsIgnoreCase(role)) { %>
    
        <li><a href="viewPatient.jsp" class="card">View Patients</a></li>
        <li><a href="viewDoctor.jsp" class="card">View Doctors</a></li>
        <li><a href="viewAppointment.jsp" class="card">View Appointments</a></li>
    <% } %>
    </ul>
</div>

</body>
</html>
