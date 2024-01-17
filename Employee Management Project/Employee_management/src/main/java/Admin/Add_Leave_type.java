package Admin;

import java.io.IOException;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Add_Leave_type")
public class Add_Leave_type extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        String LeaveType = request.getParameter("leave_type");
        String ShortDerscription = request.getParameter("shortform_discription");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Date date = new Date();
		/* java.sql.Date sqldate = new java.sql.Date(date.getTime()); */
        Timestamp timestamp = new Timestamp(date.getTime());
        String sql1 = "INSERT INTO leavetype (Leave_Type, short_description,dataTIME) VALUES (?, ?,?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
            pstmt = conn.prepareStatement(sql1);
            pstmt.setString(1, LeaveType);
            pstmt.setString(2, ShortDerscription);
			/* pstmt.setDate(3, timestamp); */
            pstmt.setTimestamp(3, timestamp);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("Admin/Leave_type.jsp");
            } else {
                response.sendRedirect("Admin/Add_Leave_type.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
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
