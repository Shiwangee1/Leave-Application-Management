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






@WebServlet("/ManageAdminDelete")
public class ManageAdminDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		String sql= "delete from employee_management.manage_admin where id=?;";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int row= pstmt.executeUpdate();
			if(row>0) {
				response.sendRedirect("Admin/Manage_Admin.jsp");
			}
			else {
				response.sendRedirect("Admin/Manage_Admin.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
	}

}
