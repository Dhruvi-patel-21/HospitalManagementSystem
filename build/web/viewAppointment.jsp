<%-- 
    Document   : viewAppointment
    Created on : 27 Jan 2026, 5:39:59 pm
    Author     : dhruv
--%>

<%@ page import="java.util.*, dao.*, model.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Appointments</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    AppointmentDAO dao = new AppointmentDAO(DBConnection.getConnection());
    List<Appointment> list = dao.getAllAppointments();
%>

<div class="form-box">

    <h1>All Appointments</h1>

    <table>
        <tr>
            <th>ID</th>
            <th>Patient Name</th>
            <th>Doctor Name</th>
            <th>Date</th>
        </tr>

        <%
            if (list == null || list.isEmpty()) {
        %>
        <tr>
            <td colspan="4">No appointments found</td>
        </tr>
        <%
            } else {
                for (Appointment a : list) {
        %>
        <tr>
            <td><%= a.getId() %></td>
            <td><%= a.getPatientName() %></td>
            <td><%= a.getDoctorName() %></td>
            <td><%= a.getDate() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <br>
    <a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>

</div>

</body>
</html>













<%--
<%@ page import="java.util.*, dao.*, model.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Appointments</title>

    <!-- CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<%
    // Session check
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Get all appointments
    AppointmentDAO dao = new AppointmentDAO(DBConnection.getConnection());
    List<Appointment> list = dao.getAllAppointments();
%>

<!-- CONTAINER -->
<div class="form-box">

    <h1>All Appointments</h1>

    <table>
        <tr>
            <th>ID</th>
            <th>Patient ID</th>
            <th>Doctor ID</th>
            <th>Date</th>
        </tr>

        <%
            if (list == null || list.isEmpty()) {
        %>
        <tr>
            <td colspan="4">No appointments found</td>
        </tr>
        <%
            } else {
                for (Appointment a : list) {
        %>
        <tr>
            <td><%= a.getId() %></td>
            <td><%= a.getPatientId() %></td>
            <td><%= a.getDoctorId() %></td>

            <!-- ✅ FIXED LINE (NO SimpleDateFormat) -->
            <td><%= a.getDate() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <br>
    <a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>

</div>

</body>
</html>
--%>










<%--<%@ page import="java.util.*, dao.*, model.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Appointments</title>
    </head>
    <body>
        <%
            if (session == null || session.getAttribute("username") == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            AppointmentDAO dao = new AppointmentDAO(DBConnection.getConnection());
            List<Appointment> list = dao.getAllAppointments();
        %>

        <h1>All Appointments</h1>

        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Patient ID</th>
                <th>Doctor ID</th>
                <th>Date</th>
            </tr>
            <%
                for (Appointment a : list) {
            %>
            <tr>
                <td><%= a.getId() %></td>
                <td><%= a.getPatientId() %></td>
                <td><%= a.getDoctorId() %></td>
                <td><%= a.getDate() %></td>
            </tr>
            <%
                }
            %>
        </table>

        <br>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </body>
</html>--%>
