<%-- 
    Document   : viewDoctor
    Created on : 27 Jan 2026, 5:39:06 pm
    Author     : dhruv
--%>

<%@ page import="java.util.*, dao.*, model.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Doctors</title>

    <!-- ✅ CSS LINK -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<%
    // Session check
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Get all doctors from DAO
    DoctorDAO dao = new DoctorDAO(DBConnection.getConnection());
    List<Doctor> list = dao.getAllDoctors();
%>

<!-- ✅ CONTAINER -->
<div class="form-box">

    <h1>All Doctors</h1>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Specialization</th>
        </tr>

        <%
            if (list.isEmpty()) {
        %>
        <tr>
            <td colspan="3">No doctors found</td>
        </tr>
        <%
            } else {
                for (Doctor d : list) {
        %>
        <tr>
            <td><%= d.getId() %></td>
            <td><%= d.getName() %></td>
            <td><%= d.getSpecialization() %></td>
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
        <title>View Doctors</title>
    </head>
    <body>
        <%
            if (session == null || session.getAttribute("username") == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            DoctorDAO dao = new DoctorDAO(DBConnection.getConnection());
            List<Doctor> list = dao.getAllDoctors();
        %>

        <h1>All Doctors</h1>

        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Specialization</th>
            </tr>
            <%
                for (Doctor d : list) {
            %>
            <tr>
                <td><%= d.getId() %></td>
                <td><%= d.getName() %></td>
                <td><%= d.getSpecialization() %></td>
            </tr>
            <%
                }
            %>
        </table>

        <br>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </body>
</html>--%>


