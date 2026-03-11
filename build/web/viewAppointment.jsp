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


