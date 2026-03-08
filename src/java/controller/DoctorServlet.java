package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.*;
import jakarta.servlet.annotation.WebServlet;
import model.*;

@WebServlet("/DoctorServlet")
public class DoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Doctor d = new Doctor();
        d.setName(request.getParameter("name"));
        d.setSpecialization(request.getParameter("specialization"));

        DoctorDAO dao = new DoctorDAO(DBConnection.getConnection());
        dao.addDoctor(d);

        response.sendRedirect("success.jsp?msg=Doctor Added Successfully");
    }
}
