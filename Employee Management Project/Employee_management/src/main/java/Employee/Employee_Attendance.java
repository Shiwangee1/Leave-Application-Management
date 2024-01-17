package Employee;

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

@WebServlet("/Employee_Attendance")
public class Employee_Attendance extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat dayFormat = new SimpleDateFormat("EEEE");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");

            String action = request.getParameter("action");

            if ("punchIn".equals(action)) {
                String sql = "INSERT INTO employee_attendance (PunchIN_Date, PunchIN_Time, PunchIN_Day, Attendance_Code, Employee_id) VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, dateFormat.format(currentDate));
                pstmt.setString(2, timeFormat.format(currentDate));
                pstmt.setString(3, dayFormat.format(currentDate));
                pstmt.setInt(4, 1); // Assuming Attendance_Code is an integer, adjust it accordingly
                pstmt.setInt(5, Integer.parseInt(request.getParameter("employeeId")));
                pstmt.executeUpdate();
            } else if ("punchOut".equals(action)) {
                String sql1 = "UPDATE employee_attendance SET PunchOut_Time = ? WHERE Employee_id = ?";
                pstmt = conn.prepareStatement(sql1);
                pstmt.setTimestamp(1, new Timestamp(currentDate.getTime()));
                pstmt.setInt(2, Integer.parseInt(request.getParameter("employeeId")));
                pstmt.executeUpdate();
            } else {
                response.sendRedirect("Admin/Employee_Attendance.jsp");
                return; // Added return to exit the method after redirection
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
