/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.80
 * Generated at: 2023-12-23 05:00:09 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;

public final class Single_005fEmployee_005fAttendance_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<title>Admin Dashboard</title>\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\"\r\n");
      out.write("	rel=\"stylesheet\"\r\n");
      out.write("	integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\"\r\n");
      out.write("	crossorigin=\"anonymous\">\r\n");
      out.write("<script src=\"https://kit.fontawesome.com/f327e1d3d1.js\"\r\n");
      out.write("	crossorigin=\"anonymous\"></script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".full-height-sidebar {\r\n");
      out.write("	height: 100vh;\r\n");
      out.write("	background-color: #111;\r\n");
      out.write("	color: white;\r\n");
      out.write("\r\n");
      out.write("	/* Set a high z-index to ensure it appears above other content */\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".custom-width {\r\n");
      out.write("	width: 280px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".right-content {\r\n");
      out.write("	overflow-y: auto;\r\n");
      out.write("	height: calc(100vh - 72px); /* Adjust the height as needed */\r\n");
      out.write("	padding: 20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn-toggle, .btn-toggle-nav a {\r\n");
      out.write("	color: #fff; /* White color */\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn-toggle:focus, .btn-toggle-nav a:focus {\r\n");
      out.write("	outline: none; /* Remove focus outline */\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<div class=\"row\">\r\n");
      out.write("		<div\r\n");
      out.write("			class=\"d-flex flex-column  text-bg-dark  col-lg-2 full-height-sidebar custom-width  \">\r\n");
      out.write("			<a href=\"Admin_dashboard.jsp\"\r\n");
      out.write("				class=\"d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none\">\r\n");
      out.write("				<svg class=\"bi pe-none me-2\" width=\"40\" height=\"32\">\r\n");
      out.write("				<use xlink:href=\"#bootstrap\"></use></svg> <span class=\"fs-4\">Employeee\r\n");
      out.write("					Department </span>\r\n");
      out.write("			</a>\r\n");
      out.write("			<hr>\r\n");
      out.write("			<ul class=\"nav nav-pills flex-column mb-auto container-fluid\">\r\n");
      out.write("				<li class=\"nav-item\"><a href=\"#\" class=\"nav-link active\"\r\n");
      out.write("					aria-current=\"page\"> <svg class=\"bi pe-none me-2\" width=\"16\"\r\n");
      out.write("							height=\"16\">\r\n");
      out.write("						<use xlink:href=\"#home\"></use></svg> Dashboard\r\n");
      out.write("				</a></li>\r\n");
      out.write("				<li><a href=\"Employee_Section.jsp\" class=\"nav-link text-white\">\r\n");
      out.write("						<svg class=\"bi pe-none me-2\" width=\"16\" height=\"16\">\r\n");
      out.write("						<use xlink:href=\"#speedometer2\"></use></svg> Employee Section\r\n");
      out.write("				</a></li>\r\n");
      out.write("				<li><a href=\"Departments.jsp\" class=\"nav-link text-white\">\r\n");
      out.write("						<svg class=\"bi pe-none me-2\" width=\"16\" height=\"16\">\r\n");
      out.write("						<use xlink:href=\"#table\"></use></svg> Department Section\r\n");
      out.write("				</a></li>\r\n");
      out.write("				<li><a href=\"#\" class=\"nav-link text-white\"> <svg\r\n");
      out.write("							class=\"bi pe-none me-2\" width=\"16\" height=\"16\">\r\n");
      out.write("						<use xlink:href=\"#grid\"></use></svg> Leave Types\r\n");
      out.write("				</a></li>\r\n");
      out.write("\r\n");
      out.write("				<li><a href=\"Employee_Attendance_Admin.jsp\"\r\n");
      out.write("					class=\"nav-link text-white\"> <svg class=\"bi pe-none me-2\"\r\n");
      out.write("							width=\"16\" height=\"16\">\r\n");
      out.write("						<use xlink:href=\"#speedometer2\"></use></svg> Employee Attendance\r\n");
      out.write("				</a></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("				<!-- 	<li><a href=\"#\" class=\"nav-link text-white\"> <svg\r\n");
      out.write("							class=\"bi pe-none me-2\" width=\"16\" height=\"16\">\r\n");
      out.write("						<use xlink:href=\"#people-circle\"></use></svg> Manage Leaves\r\n");
      out.write("		\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("				<!-- manage leave Drop-down end -->\r\n");
      out.write("     	<li class=\"nav-item dropdown\"><a href=\"Add_Departments.jsp\"\r\n");
      out.write("					class=\"nav-link text-white dropdown-toggle\"\r\n");
      out.write("					data-bs-toggle=\"dropdown\" aria-expanded=\"false\"> <svg\r\n");
      out.write("							class=\"bi pe-none me-2\" width=\"16\" height=\"16\">\r\n");
      out.write("                <use xlink:href=\"#grid\"></use>\r\n");
      out.write("            </svg> Manage Leave\r\n");
      out.write("				</a>\r\n");
      out.write("					<ul\r\n");
      out.write("						class=\"dropdown-menu bg-dark dropdown-menu-center position-absolute\"\r\n");
      out.write("						style=\"left: 50%; transform: translateX(-50%) \">\r\n");
      out.write("						<li><a class=\"dropdown-item text-white\" href=\"Pending.jsp\"> <i class=\"fa-solid fa-arrow-rotate-right\" style=\"\"></i>\r\n");
      out.write("						Pending\r\n");
      out.write("								</a></li>\r\n");
      out.write("						<li><a class=\"dropdown-item text-white\" href=\"Approved.jsp\"><i class=\"fa-solid fa-check\" style=\"\"></i> Approved</a></li>\r\n");
      out.write("						<li><a class=\"dropdown-item text-white\" href=\"Decline.jsp\"> <i class=\"fa-solid fa-circle-xmark\" style=\"\"></i> Declined</a></li>\r\n");
      out.write("						<li><a class=\"dropdown-item text-white\" href=\"Leave_Histroy.jsp\"> <i class=\"fa-solid fa-arrows-rotate\" style=\"\"></i>Leave\r\n");
      out.write("								History</a></li>\r\n");
      out.write("					</ul></li>\r\n");
      out.write("				<li class=\"nav-item\"><a href=\"Manage_Admin.jsp\"\r\n");
      out.write("					class=\"nav-link text-white\"> <svg class=\"bi pe-none me-2\"\r\n");
      out.write("							width=\"16\" height=\"16\">\r\n");
      out.write("                        <use xlink:href=\"#people-circle\"></use>\r\n");
      out.write("                    </svg> Manage Admin\r\n");
      out.write("				</a></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("				<li class=\"nav-item\">\r\n");
      out.write("					<button class=\"btn btn-toggle rounded border-0 collapsed\"\r\n");
      out.write("						data-bs-toggle=\"collapse\" data-bs-target=\"#manageLeaveCollapse\"\r\n");
      out.write("						aria-expanded=\"false\" style=\"margin-left: 30px;\">Manage\r\n");
      out.write("						Leave</button>\r\n");
      out.write("					<div class=\"collapse \" id=\"manageLeaveCollapse\">\r\n");
      out.write("						<div class=\"row text-center\">\r\n");
      out.write("							<ul class=\"nav nav-pills flex-column mb-auto container-fluid\">\r\n");
      out.write("								<li><a href=\"Approved.jsp\"\r\n");
      out.write("									class=\"link-body-emphasis d-inline-flex text-decoration-none rounded text-white\"\r\n");
      out.write("									style=\"margin-left: 17px;\">Approved</a> <i\r\n");
      out.write("									class=\"fa-solid fa-check\" style=\"\"></i></li>\r\n");
      out.write("								<li><a href=\"Decline.jsp\"\r\n");
      out.write("									class=\"link-body-emphasis d-inline-flex text-decoration-none rounded text-white\">Decline\r\n");
      out.write("								</a> <i class=\"fa-solid fa-circle-xmark\" style=\"\"></i></li>\r\n");
      out.write("								<li><a href=\"Pending.jsp\"\r\n");
      out.write("									class=\"link-body-emphasis d-inline-flex text-decoration-none rounded text-white\">\r\n");
      out.write("										Pending </a><i class=\"fa-solid fa-arrow-rotate-right\" style=\"\"></i></li>\r\n");
      out.write("								<li><a href=\"Leave_Histroy.jsp\"\r\n");
      out.write("									class=\"link-body-emphasis d-inline-flex text-decoration-none rounded text-white\"\r\n");
      out.write("									style=\"margin-left: 55px;\">View Leave History</a></li>\r\n");
      out.write("							</ul>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			</ul>\r\n");
      out.write("			<hr>\r\n");
      out.write("			<div class=\"dropdown\">\r\n");
      out.write("				<a href=\"#\"\r\n");
      out.write("					class=\"d-flex align-items-center text-white text-decoration-none dropdown-toggle\"\r\n");
      out.write("					data-bs-toggle=\"dropdown\" aria-expanded=\"false\"> <img\r\n");
      out.write("					src=\"https://github.com/mdo.png\" alt=\"\" width=\"32\" height=\"32\"\r\n");
      out.write("					class=\"rounded-circle me-2\"> <strong>mdo</strong>\r\n");
      out.write("				</a>\r\n");
      out.write("				<ul class=\"dropdown-menu dropdown-menu-dark text-small shadow\">\r\n");
      out.write("					<li><a class=\"dropdown-item\" href=\"#\">New project...</a></li>\r\n");
      out.write("					<li><a class=\"dropdown-item\" href=\"#\">Settings</a></li>\r\n");
      out.write("					<li><a class=\"dropdown-item\" href=\"#\">Profile</a></li>\r\n");
      out.write("					<li><hr class=\"dropdown-divider\"></li>\r\n");
      out.write("					<li><a class=\"dropdown-item\" href=\"#\">Sign out</a></li>\r\n");
      out.write("				</ul>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		<div class=\"container col-lg-9 bg-light mt-4 right-content\">\r\n");
      out.write("\r\n");
      out.write("			<div class=\"card-body\">\r\n");
      out.write("				<nav class=\"navbar navbar-light bg-light\">\r\n");
      out.write("					<div class=\"container-fluid\">\r\n");
      out.write("						");

						int id = Integer.parseInt(request.getParameter("employeeId"));
						try {
							Connection conn1 = DriverManager
							.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
							PreparedStatement pstmt = conn1.prepareStatement("SELECT * FROM add_employee where id = ?");
							pstmt.setInt(1, id);
							ResultSet rs1 = pstmt.executeQuery();

							if (rs1.next()) {
						
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("						<a class=\"navbar-brand\" href=\"#\"><h4>");
      out.print(rs1.getString("employeeId"));
      out.write("</h4></a>\r\n");
      out.write("						<a class=\"navbar-brand\" href=\"#\">");
      out.print(rs1.getString("firstName"));
      out.write("\r\n");
      out.write("							");
      out.print(rs1.getString("lastName"));
      out.write(" </a>\r\n");
      out.write("						<div class=\"dropdown nav-item \">\r\n");
      out.write("					\r\n");
      out.write("							 <a class=\"btn btn-info btn-sm dropdown-toggle btn-lg btn-wider \"\r\n");
      out.write("								href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\"\r\n");
      out.write("								aria-expanded=\"false\">");
      out.print(rs1.getString("department"));
      out.write("</a> \r\n");
      out.write("							<ul class=\"dropdown-menu\">\r\n");
      out.write("								<li><a class=\"dropdown-item\" href=\"#\">Log-Out</a></li>\r\n");
      out.write("							</ul>\r\n");
      out.write("						</div>\r\n");
      out.write("						");

						}
						rs1.close();
						pstmt.close();
						conn1.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("				</nav>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("			<hr>\r\n");
      out.write("			<!-- =============================================================================================== -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			<table class=\"table table-bordered\">\r\n");
      out.write("				<thead>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<th scope=\"col\">SR.NO</th>\r\n");
      out.write("						<th scope=\"col\">Attendance Code</th>\r\n");
      out.write("						<th scope=\"col\">Check IN</th>\r\n");
      out.write("						<th scope=\"col\">Day</th>\r\n");
      out.write("						<th scope=\"col\">Check OUT</th>\r\n");
      out.write("\r\n");
      out.write("					</tr>\r\n");
      out.write("				</thead>\r\n");
      out.write("				<tbody>\r\n");
      out.write("\r\n");
      out.write("					");

					try {

						String sql = "SELECT add_employee.employeeId, add_employee.firstName, add_employee.lastName, "
						+ "employee_attendance.id, employee_attendance.PunchIN_Date, employee_attendance.PunchIN_Time, "
						+ "employee_attendance.PunchIN_Day, employee_attendance.PunchOut_Time, "
						+ "employee_attendance.Attendance_Code, employee_attendance.Employee_id " + "FROM add_employee "
						+ "JOIN employee_attendance ON add_employee.id = employee_attendance.Employee_id "
						+ "WHERE add_employee.id = ? AND employee_attendance.Employee_id = ?";

						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
						PreparedStatement psmt = conn.prepareStatement(sql);
						psmt.setInt(1, id);
						psmt.setInt(2, id);
						ResultSet rs = psmt.executeQuery();

						while (rs.next()) {
					
      out.write("\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td>");
      out.print(rs.getString("id"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(rs.getString("Attendance_Code"));
      out.write("</td>\r\n");
      out.write("\r\n");
      out.write("						<td>");
      out.print(rs.getString("PunchIN_Date"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(rs.getString("PunchIN_Day"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(rs.getString("PunchIN_Time"));
      out.write("</td>\r\n");
      out.write("\r\n");
      out.write("					</tr>\r\n");
      out.write("				</tbody>\r\n");
      out.write("				");

				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				
      out.write("\r\n");
      out.write("\r\n");
      out.write("			</table>\r\n");
      out.write("\r\n");
      out.write("			<div class=\"text-center mt-3 mb-3\">\r\n");
      out.write("				<div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\"\r\n");
      out.write("					aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("					<!-- Modal content (unchanged) -->\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<script\r\n");
      out.write("		src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\"\r\n");
      out.write("		integrity=\"sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL\"\r\n");
      out.write("		crossorigin=\"anonymous\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
