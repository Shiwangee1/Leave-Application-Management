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

@WebServlet("/AddEmployeeDaoDelete")
public class Add_EmployeeDao_Delete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
            String sql = "DELETE FROM add_employee WHERE id = ?";
            pstmt = conn.prepareStatement(sql);

            // Set the parameter with the received 'id' value
            pstmt.setString(1, id);

            int row = pstmt.executeUpdate();
            if (row > 0) {
                response.sendRedirect("Admin/Employee_Section.jsp");
            } else {
                response.sendRedirect("Admin/Employee_Section.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources (Connection, PreparedStatement) in a finally block
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
