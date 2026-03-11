package controller;

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

       
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age"));
        String disease = request.getParameter("disease");

        
        Patient patient = new Patient();
        patient.setName(name);
        patient.setGender(gender);
        patient.setAge(age);
        patient.setDisease(disease);

       
        Connection con = DBConnection.getConnection();
        PatientDAO dao = new PatientDAO(con);
        dao.addPatient(patient);

      
        response.sendRedirect("success.jsp?msg=Patient Added Successfully");
    }
}
