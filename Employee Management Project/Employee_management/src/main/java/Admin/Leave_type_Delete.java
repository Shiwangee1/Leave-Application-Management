package Admin;

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


@WebServlet("/LeavetypeDelete")
public class Leave_type_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		String sql="Delete from leavetype where id=?";
		try {
			/*"com.mysql.cj.jdbc.Driver"   "jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@"*/
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			int row=pstmt.executeUpdate();
			if(row>0) {
			response.sendRedirect("Admin/Leave_type.jsp");
			}
			else {
				response.sendRedirect("Admin/Leave_type.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	
	}

}
