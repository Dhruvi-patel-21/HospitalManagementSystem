<%@ page import="java.util.*, dao.*, model.*, dao.DBConnection"
         contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Patients</title>

  
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
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


