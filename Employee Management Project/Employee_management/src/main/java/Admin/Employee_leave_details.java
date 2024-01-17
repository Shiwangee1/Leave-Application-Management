package Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/employee_leave_details")
public class Employee_leave_details extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String status = request.getParameter("status");
		String leaveCode = request.getParameter("leaveCode");
		int id = Integer.parseInt(request.getParameter("id"));
		String description = request.getParameter("description");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
			PreparedStatement pstmt = con.prepareStatement(
					"UPDATE apply_leave SET Apply_Status = ?, Admin_Remarks = ?, Admin_Action_ON = ? WHERE leaveCode = ? AND id = ?");

			// Set the values to be updated
			pstmt.setString(1, status);
			pstmt.setString(2, description);

			// Set the current date and time
			Date currentDate = new Date();
			Timestamp timestamp = new Timestamp(currentDate.getTime());
			pstmt.setTimestamp(3, timestamp);

			pstmt.setString(4, leaveCode);
			pstmt.setInt(5, id);

			int query = pstmt.executeUpdate();
			if (query >= 0) {
				// Pass leaveCode and id as parameters in the URL
				response.sendRedirect("Admin/Employee_leave_detail.jsp?leaveCode=" + leaveCode + "&id=" + id);
			} else {
				response.sendRedirect("User_login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}