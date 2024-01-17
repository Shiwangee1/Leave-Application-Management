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

@WebServlet("/EditmanageAdmin")
public class Edit_manageAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("Name");
        String userName = request.getParameter("UserName"); // corrected variable name
        String email = request.getParameter("Email"); // corrected variable name
        String accountNo = request.getParameter("dateTime"); // corrected variable name

        Connection conn = null;
        PreparedStatement pstmt = null;

        String sql = "update manage_admin set Name=?, Username=?, Email=?, AccountCreatedOn=? where id=?";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, userName);
            pstmt.setString(3, email);
            pstmt.setString(4, accountNo);
            pstmt.setString(5, id);

            int row = pstmt.executeUpdate();

            if (row > 0) {
                response.sendRedirect("Admin/Manage_Admin.jsp");
            } else {
                response.sendRedirect("Admin/Edit_ManageAdmin.jsp");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
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
