package Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();

		System.out.println("Email :" + email);
		System.out.println("password:" + password);

		if (email.equalsIgnoreCase("admin@gmail.com") && password.equals("123")) {
			System.out.println("Email :" + email);
			response.sendRedirect("Admin/Admin_dashboard.jsp");
		} else {
			System.out.println("password:" + password);
			response.sendRedirect("Index.jsp");
		}
	}
}
