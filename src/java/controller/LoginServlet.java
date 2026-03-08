package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import dao.DBConnection;
import dao.UserDAO;
import jakarta.servlet.annotation.WebServlet;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            UserDAO dao = new UserDAO(DBConnection.getConnection());
            User user = dao.login(username, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRole());
                response.sendRedirect("dashboard.jsp");
            } else {
                response.sendRedirect("index.jsp?error=Invalid Login");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=Server Error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
