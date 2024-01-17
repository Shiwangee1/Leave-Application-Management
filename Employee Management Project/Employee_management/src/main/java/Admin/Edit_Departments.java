package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.PreparableStatement;

@WebServlet("/Edit_Departments")
public class Edit_Departments extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String departmentId = request.getParameter("id");
		String departmentName = request.getParameter("departmentName");
		String shortForm = request.getParameter("shortForm");
		String code = request.getParameter("code");
		
		/*
		 * System.out.println("depart"+departmentId );
		 * System.out.println("depart"+departmentName );
		 * System.out.println("depart"+shortForm ); System.out.println("depart"+code );
		 */
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");

			String sql = "UPDATE departments SET Department_Name=?, Shortform=?, code=? WHERE Department_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, departmentName);
			pstmt.setString(2, shortForm);
			pstmt.setString(3, code);
			pstmt.setString(4, departmentId);

			int rowsUpdated = pstmt.executeUpdate();

			if (rowsUpdated > 0) {
				response.sendRedirect("Admin/Departments.jsp");
			} else {
				response.sendRedirect("Leave_type.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
