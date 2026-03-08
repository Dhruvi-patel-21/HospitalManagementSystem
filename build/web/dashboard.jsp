<%-- 
    Document   : dashboard
    Created on : 27 Jan 2026, 5:37:43 pm
    Author     : dhruv
--%>

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


<%--<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>

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

<!-- 🔹 NAVBAR -->
<div class="navbar">
    <span>Hospital Management System</span>
    <span class="user">Welcome, <%= session.getAttribute("username") %></span>
    <a href="LogoutServlet" class="logout">Logout</a>
</div>

<!-- 🔹 DASHBOARD CARDS -->
<div class="dashboard">

    <li><a href="addPatient.jsp" class="card">Add Patient</a></li>
    <li><a href="viewPatient.jsp" class="card">View Patients</a></li>

    <li><a href="addDoctor.jsp" class="card">Add Doctor</a></li>
    <li><a href="viewDoctor.jsp" class="card">View Doctors</a></li>

    <li><a href="addAppointment.jsp" class="card">Add Appointment</a></li>
    <li><a href="viewAppointment.jsp" class="card">View Appointments</a></li>

</div>

</body>
</html>





<%--<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
    </head>
    <body>
        <%
            if (session == null || session.getAttribute("username") == null) {
                response.sendRedirect("index.jsp");
                return;
            }
        %>

        <h1>Welcome, <%= session.getAttribute("username") %></h1>

        <ul>
            <li><a href="addPatient.jsp">Add Patient</a></li>
            <li><a href="viewPatient.jsp">View Patients</a></li>
            <li><a href="addDoctor.jsp">Add Doctor</a></li>
            <li><a href="viewDoctor.jsp">View Doctors</a></li>
            <li><a href="addAppointment.jsp">Add Appointment</a></li>
            <li><a href="viewAppointment.jsp">View Appointments</a></li>
            <li><a href="LogoutServlet">Logout</a></li>
        </ul>
    </body>
</html>--%>
