package Admin;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddManageAdmin")
public class Add_Manage_Admin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Name = request.getParameter("name");
        String username = request.getParameter("UserName");
        String Email = request.getParameter("Email");

        Connection conn = null;
        PreparedStatement pstmt = null;

        String sql = "INSERT INTO manage_admin (Name, Username, Email, AccountCreatedOn) VALUES (?, ?, ?, NOW())";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, Name);
            pstmt.setString(2, username);
            pstmt.setString(3, Email);

            // Use executeUpdate for INSERT operation
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // The record was inserted successfully
                response.sendRedirect("Admin/Manage_Admin.jsp");
            } else {
                // Something went wrong
                response.getWriter().println("Admin/Add_ManageAdmin.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // Close resources in the finally block
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
