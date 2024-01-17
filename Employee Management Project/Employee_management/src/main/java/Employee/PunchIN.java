package Employee;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

@WebServlet("/punchIN")
public class PunchIN extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve data from the form
		String employeeId = request.getParameter("employeeId");
		String punchType = request.getParameter("punchType");
		String attendance_Code = request.getParameter("uniqueCode");

		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat dayFormat = new SimpleDateFormat("EEEE");

		// Do something with the retrieved data (e.g., print to console)
		System.out.println("Employee ID: " + employeeId);
		System.out.println("Punch Type: " + punchType);
		System.out.println("Attendance Code : " + attendance_Code);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");

			PreparedStatement psmt = conn.prepareStatement(
					"INSERT INTO employee_attendance (punchIN_Date, punchIN_Time, punchIN_Day, Attendance_Code, Employee_Id) VALUES (?,?,?,?,?)");

			// Format Date and Time
			String formattedDate = dateFormat.format(currentDate);
			String formattedTime = timeFormat.format(currentDate);
			String formattedDay = dayFormat.format(currentDate);

			// Set values for the prepared statement
			psmt.setString(1, formattedDate);
			psmt.setString(2, formattedTime);
			psmt.setString(3, formattedDay);
			psmt.setString(4, attendance_Code);
			psmt.setString(5, employeeId);
			HttpSession session = request.getSession();
			// Execute the SQL statement
			int row = psmt.executeUpdate();
			if (row >= 1) {
				session.setAttribute("Attendance_Code", attendance_Code);
				System.out.println("Successfully updated the value");
				response.sendRedirect("Employee/Employee_Attendence.jsp?id=" + employeeId);
			} else {
				response.sendRedirect("User_login.jsp");
			}

			// Close resources
			psmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}