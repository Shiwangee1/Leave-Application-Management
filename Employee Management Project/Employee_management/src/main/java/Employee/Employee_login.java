package Employee;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Employee_login")
public class Employee_login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
            PreparedStatement psmt = conn.prepareStatement("select * from add_employee where email=? and password=?");
            psmt.setString(1, email);
            psmt.setString(2, password);

            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                System.out.println("Id for employee " + id);
                HttpSession session = request.getSession(true);

                // Set the user's email in the session attribute
                session.setAttribute("email", email);
                session.setAttribute("employeeId", id);

                response.sendRedirect("Employee/Employee_dashboard.jsp");

            } else {
                response.sendRedirect("Employee/Employee.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}