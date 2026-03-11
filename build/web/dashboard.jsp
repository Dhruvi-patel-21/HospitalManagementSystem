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
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
    <div class="nav-title">Hospital Management System</div>
    <!--<span>Hospital Management System</span>-->
    <a href="LogoutServlet" class="logout">Logout</a>
</div>

    
<div class="welcome"><br> 
   <%--WELCOME, <%= username.toUpperCase() %>--%>
   <% if ("ADMIN".equalsIgnoreCase(role)) { %>
        WELCOME, <%= username.toUpperCase() %>
   <% } else if ("DOCTOR".equalsIgnoreCase(role)) { %>
        WELCOME, DR.<%= username.toUpperCase() %>
   <% } %>
</div>


<div class="dashboard">
    <ul>
    <% if ("ADMIN".equalsIgnoreCase(role)) { %>
    <br>
    <a href="addDoctor.jsp" class="card">Add Doctor</a>
    <a href="viewDoctor.jsp" class="card">View Doctors</a>
    <a href="addPatient.jsp" class="card">Add Patient</a>
    <a href="viewPatient.jsp" class="card">View Patients</a>
    <a href="addAppointment.jsp" class="card">Add Appointments</a>
    <a href="viewAppointment.jsp" class="card">View Appointments</a>

    <% } else if ("DOCTOR".equalsIgnoreCase(role)) { %>

        <a href="viewDoctor.jsp" class="card">View Doctors</a>
        <a href="viewPatient.jsp" class="card">View Patients</a>
        <a href="viewAppointment.jsp" class="card">View Appointments</a>

    <% } %>
    </ul>
</div>

</body>
</html>

