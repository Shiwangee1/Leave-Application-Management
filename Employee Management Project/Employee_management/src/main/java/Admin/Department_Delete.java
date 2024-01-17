package Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Department_Delete")
public class Department_Delete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String departmentId = request.getParameter("id");

        Connection conn = null;
        PreparedStatement pstmt = null;

        String sql = "DELETE FROM departments WHERE Department_id = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, departmentId);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // Department deleted successfully
                response.sendRedirect("Admin/Departments.jsp");
            } else {
                // No department found with the given ID
                response.sendRedirect("bye.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources in a finally block to ensure they are always closed
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
