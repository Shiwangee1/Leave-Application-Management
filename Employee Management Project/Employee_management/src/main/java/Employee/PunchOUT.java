package Employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/punchOUT")
public class PunchOUT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String employeeId = request.getParameter("employeeId");
		String attendanceCode = request.getParameter("Attendance_Code");

		PrintWriter out = response.getWriter();
		out.print("Attendance Code " + attendanceCode);
		out.print("Employee Code " + employeeId);

		Date currentDate = new Date();

		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

		if (employeeId != null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");

				// Validate if Punch IN has been done for the given employee
				PreparedStatement validatePunchIN = conn.prepareStatement(
						"SELECT * FROM employee_attendance WHERE Employee_Id = ? AND PunchOut_Time IS NULL");
				validatePunchIN.setString(1, employeeId);

				ResultSet resultSet = validatePunchIN.executeQuery();

				if (!resultSet.next()) {
					// No Punch IN record found for the employee
					response.sendRedirect("User_login.jsp");
					return; // Exit the servlet
				}

				// Continue with the Punch OUT logic
				PreparedStatement psmt = conn
						.prepareStatement("UPDATE employee_attendance SET PunchOut_Time=? WHERE Employee_Id = ? ");

				// Format Date and Time
				String formattedTime = timeFormat.format(currentDate);

				// Set values for the prepared statement
				psmt.setString(1, formattedTime);
				psmt.setString(2, employeeId);

				// Execute the SQL statement
				int row = psmt.executeUpdate();

				if (row >= 1) {
					System.out.println("Successfully updated the value punch out");
					response.sendRedirect("Employee/Employee_Attendence.jsp?id=" + employeeId);
				} else {
					response.sendRedirect("User_login.jsp");
				}

				// Close resources
				resultSet.close();
				validatePunchIN.close();
				psmt.close();
				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("User_login.jsp");
		}
	}
}