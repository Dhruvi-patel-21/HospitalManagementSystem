package servlet;

import dao.PatientDAO;
import model.Patient;
import dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/PatientServlet")
public class PatientServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ===== Get form data =====
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));
        String disease = request.getParameter("disease");

        // ===== Create Patient object =====
        Patient patient = new Patient();
        patient.setName(name);
        patient.setGender(gender);
        patient.setAge(age);
        patient.setDisease(disease);

        // ===== Database operation =====
        Connection con = DBConnection.getConnection();
        PatientDAO dao = new PatientDAO(con);
        dao.addPatient(patient);

        // ===== Redirect to success page =====
        response.sendRedirect("success.jsp?msg=Patient Added Successfully");
    }
}
