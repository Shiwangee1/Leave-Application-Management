package Employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Apply_leave")
public class Apply_Leave extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		String leaveType = request.getParameter("leave_type");
		String longText = request.getParameter("longText");
		String leaveCode = request.getParameter("leaveCode");
		String Apply_Status = "Pending";

		PrintWriter out = response.getWriter();

		System.out.print("longText " + longText);
		System.out.println("Id in apply leave " + id);
		System.out.println("Leave code " + leaveCode);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");

			// Validate inputs and handle exceptions

			// TODO: Validate the date format and other inputs

			PreparedStatement psmt = conn.prepareStatement(
					"INSERT INTO apply_leave (id,start_date, end_date, leave_type,long_text,applied , leaveCode , Apply_Status) VALUES (?,?, ?, ?,?,NOW(),?,?)");
			psmt.setInt(1, id);
			psmt.setString(2, startDate);
			psmt.setString(3, endDate);
			psmt.setString(4, leaveType);
			psmt.setString(5, longText);
			psmt.setString(6, leaveCode);
			psmt.setString(7, Apply_Status);

			int rowsAffected = psmt.executeUpdate();

			if (rowsAffected >= 1) {
				// Successful application
				response.sendRedirect("Employee/Employee_dashboard.jsp");
			} else {
				// Application failed
				response.sendRedirect("Employee/Employee.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			// Log the exception or provide an appropriate error message to the user
			response.sendRedirect("error.jsp");
		}
	}
}