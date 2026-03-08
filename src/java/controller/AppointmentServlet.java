package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.*;
import jakarta.servlet.annotation.WebServlet;
import model.*;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Appointment a = new Appointment();
        a.setPatientId(Integer.parseInt(request.getParameter("patient_id")));
        a.setDoctorId(Integer.parseInt(request.getParameter("doctor_id")));
        a.setDate(request.getParameter("date"));

        AppointmentDAO dao = new AppointmentDAO(DBConnection.getConnection());
        dao.addAppointment(a);

        response.sendRedirect("success.jsp?msg=Appointment Added Successfully");
    }
}
