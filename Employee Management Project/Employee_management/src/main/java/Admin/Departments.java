package Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Departments")
public class Departments extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("department_name");
        String shortform = request.getParameter("shortform");
        String code = request.getParameter("code");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO departments (Department_Name, Shortform, code) VALUES (?, ?, ?)");
            pstmt.setString(1, username);
            pstmt.setString(2, shortform);
            pstmt.setString(3, code);
            int query = pstmt.executeUpdate();
            if (query >= 0) {
                response.sendRedirect("Admin/Departments.jsp");
            } else {
            	 response.sendRedirect("Admin/Add_Departments.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
