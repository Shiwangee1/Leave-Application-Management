package Employee;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class Employee_Attendance_Demo
 */
@WebServlet("/Employee_Attendance_demo")
public class Employee_Attendance_Demo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String punchIN = request.getParameter("PunchInTime");
		String punchOUT = request.getParameter("PunchOutTime");
		
		PrintWriter out = response.getWriter();
		out.print(punchIN);
		out.print(punchOUT);

		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat dayFormat = new SimpleDateFormat("EEEE");

		if (punchIN != null) {
			out.print(punchIN);
			try {
				System.out.println("My Darling");
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
				String sql = "INSERT INTO employee_attendence (Date, Time, Day) VALUES (?, ?, ?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dateFormat.format(currentDate));
				pstmt.setString(2, timeFormat.format(currentDate));
				pstmt.setString(3, dayFormat.format(currentDate));
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (punchOUT != null) {
			out.print(punchOUT);
			try {
				System.out.println("sonaaaa");
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
				 String sql1 = "UPDATE employee_attendence SET punch_out = ? ";
				 PreparedStatement pstmt = conn.prepareStatement(sql1);
	                pstmt.setTimestamp(1, new Timestamp(currentDate.getTime()));
	                pstmt.setInt(2, Integer.parseInt(request.getParameter("employeeId")));
	                pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else {
			System.out.println("Java bolo naa ");
			response.sendRedirect("Employee/Employee_Attendence.jsp");
		}
	}

}
