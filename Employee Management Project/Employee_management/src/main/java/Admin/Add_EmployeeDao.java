package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Add_Employee")
public class Add_EmployeeDao extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      
        SimpleDateFormat dayFormat = new SimpleDateFormat("EEEE");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        long contact = Long.parseLong(request.getParameter("contact"));
        String country = request.getParameter("country");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String password = request.getParameter("password");
        String employeeId = request.getParameter("employeeId");

        PrintWriter out = response.getWriter();

        try {
            // Use a connection pool in a production environment
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");

            // Use try-with-resources to automatically close resources
            try (PreparedStatement psmt = conn.prepareStatement(
                    "INSERT INTO add_employee(employeeId,firstName,lastName,email,department,gender,dob,contact,country,address,city,password,Joining_day,Joining_Date) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)")) {

                psmt.setString(1, employeeId);
                psmt.setString(2, firstName);
                psmt.setString(3, lastName);
                psmt.setString(4, email);
                psmt.setString(5, department);
                psmt.setString(6, gender);
                psmt.setString(7, dob);
                psmt.setLong(8, contact);
                psmt.setString(9, country);
                psmt.setString(10, address);
                psmt.setString(11, city);
                psmt.setString(12, password);
                psmt.setString(13, dayFormat.format(currentDate));
                psmt.setString(14, dateFormat.format(currentDate));
              

                int inserted = psmt.executeUpdate();

                if (inserted > 0) {
                    response.sendRedirect("Admin/Employee_Section.jsp");
                } else {
                    response.sendRedirect("Admin/Add_Employee.jsp");
                }
            }
        } catch (Exception e) {
            // Log the exception or provide a user-friendly message
            e.printStackTrace();
        }
    }
}
