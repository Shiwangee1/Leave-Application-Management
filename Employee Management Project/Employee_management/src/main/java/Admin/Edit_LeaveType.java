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

@WebServlet("/Edit_LeaveType")
public class Edit_LeaveType extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        String id = request.getParameter("id");
        String Leave_type = request.getParameter("leave_type"); // Corrected parameter name
        String shortname = request.getParameter("shortform_discription"); // Corrected parameter name
        String DATEtime = request.getParameter("dateTime"); // Corrected parameter name

        Connection conn = null;
        PreparedStatement pstmt = null;

        // Corrected SQL query to use placeholders
        String sql = "UPDATE leavetype SET Leave_Type=?, short_discription=?, dataTIME=? WHERE id=?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, Leave_type);
            pstmt.setString(2, shortname);
            pstmt.setString(3, DATEtime);
            pstmt.setString(4, id);

            int row = pstmt.executeUpdate();

            if (row > 0) {
                response.sendRedirect("Admin/Leave_type.jsp");
            } else {
                response.sendRedirect("Admin/Leave_type.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
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
