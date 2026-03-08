<%-- 
    Document   : viewPatient
    Created on : 27 Jan 2026, 5:38:25 pm
    Author     : dhruv
--%>

<%@ page import="java.util.*, dao.*, model.*, dao.DBConnection"
         contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Patients</title>

    <!-- CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<%
    // ===== Session Check =====
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // ===== Fetch patients =====
    PatientDAO dao = new PatientDAO(DBConnection.getConnection());
    List<Patient> list = dao.getAllPatients();
%>

<!-- ===== CONTAINER ===== -->
<div class="form-box">

    <h1>All Patients</h1>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Age</th>
            <th>Disease</th>
        </tr>

        <%
            if (list.isEmpty()) {
        %>
        <tr>
            <td colspan="5">No patients found</td>
        </tr>
        <%
            } else {
                for (Patient p : list) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getGender() %></td>
            <td><%= p.getAge() %></td>
            <td><%= p.getDisease() %></td>
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



<%--<%@ page import="java.util.*, dao.*, model.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Patients</title>
    </head>
    <body>
        <%
            if (session == null || session.getAttribute("username") == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            PatientDAO dao = new PatientDAO(DBConnection.getConnection());
            List<Patient> list = dao.getAllPatients();
        %>

        <h1>All Patients</h1>

        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
            </tr>
            <%
                for (Patient p : list) {
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getName() %></td>
                <td><%= p.getEmail() %></td>
                <td><%= p.getPhone() %></td>
            </tr>
            <%
                }
            %>
        </table>

        <br>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </body>
</html>--%>


