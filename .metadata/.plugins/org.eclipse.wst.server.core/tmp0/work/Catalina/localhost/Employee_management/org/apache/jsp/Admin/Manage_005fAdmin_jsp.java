/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.80
 * Generated at: 2023-12-23 05:45:56 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Manage_005fAdmin_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<title>Admin Dashboard</title>\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\"\r\n");
      out.write("	rel=\"stylesheet\"\r\n");
      out.write("	integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\"\r\n");
      out.write("	crossorigin=\"anonymous\">\r\n");
      out.write("\r\n");
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
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("	href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css\"\r\n");
      out.write("	integrity=\"sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==\"\r\n");
      out.write("	crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("	<div class=\"row\">\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/Admin/include.jsp", out, false);
      out.write("\r\n");
      out.write("		\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		<!-- ==================================== Second Div Start ===================== -->\r\n");
      out.write("		<div class=\"container col-lg-9 bg-light mt-8\">\r\n");
      out.write("\r\n");
      out.write("			<div class=\"card-body\">\r\n");
      out.write("				<nav class=\"navbar navbar-light bg-light\">\r\n");
      out.write("					<div class=\"container-fluid\">\r\n");
      out.write("						<a class=\"navbar-brand\" href=\"Add_Departments\"><h4>Manage Admin\r\n");
      out.write("								Section</h4></a> <a class=\"navbar-brand\" href=\"Leave_type\">Manage Admin/Admin\r\n");
      out.write("							Page</a>\r\n");
      out.write("						<!-- 	<button type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("							style=\"hight: 200px; width: 200px\">Admin</button> -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("						<div class=\"dropdown nav-item \">\r\n");
      out.write("							<a class=\"btn btn-success dropdown-toggle btn-lg  btn-wider \"\r\n");
      out.write("								href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\"\r\n");
      out.write("								aria-expanded=\"false\">Admin</a>\r\n");
      out.write("							<ul class=\"dropdown-menu\">\r\n");
      out.write("								<li><a class=\"dropdown-item\" href=\"#\">Log-Out</a></li>\r\n");
      out.write("							</ul>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</nav>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("			<hr>\r\n");
      out.write("			<div class=\"container\">\r\n");
      out.write("				<div class=\"text-center mt-3 mb-3\">\r\n");
      out.write("					<a href=\"Add_ManageAdmin.jsp\" class=\"btn btn-primary \">Add\r\n");
      out.write("						Admin</a>\r\n");
      out.write("\r\n");
      out.write("				</div>\r\n");
      out.write("				<table class=\"table\">\r\n");
      out.write("					<thead>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<th scope=\"col\">ID</th>\r\n");
      out.write("							<th scope=\"col\">Name</th>\r\n");
      out.write("							<th scope=\"col\">User Name</th>\r\n");
      out.write("							<th scope=\"col\">Email</th>\r\n");
      out.write("							<th scope=\"col\">Account Created On</th>\r\n");
      out.write("							<th scope=\"col\">Action</th>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("						</tr>\r\n");
      out.write("						");

						Connection conn = null;
						PreparedStatement pstmt = null;
						String sql = "SELECT * FROM manage_admin";
						ResultSet rs = null;

						try {
							Class.forName("com.mysql.cj.jdbc.Driver");
							conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();
							while (rs.next()) {
						
      out.write("\r\n");
      out.write("						<tr>\r\n");
      out.write("							<td>");
      out.print(rs.getString("Id"));
      out.write("</td>\r\n");
      out.write("							<td>");
      out.print(rs.getString("Name"));
      out.write("</td>\r\n");
      out.write("							<td>");
      out.print(rs.getString("Username"));
      out.write("</td>\r\n");
      out.write("							<td>");
      out.print(rs.getString("Email"));
      out.write("</td>\r\n");
      out.write("							<td>");
      out.print(rs.getString("AccountCreatedOn"));
      out.write("</td>\r\n");
      out.write("							<td>\r\n");
      out.write("								<form action=\"../ManageAdminDelete\" method=\"post\">\r\n");
      out.write("									<!-- Hidden input to store the Department_id value -->\r\n");
      out.write("									<input type=\"hidden\" name=\"id\"\r\n");
      out.write("										value=\"");
      out.print(rs.getString("id"));
      out.write("\">\r\n");
      out.write("									<!-- Submit button with the trash icon -->\r\n");
      out.write("									<button type=\"submit\" class=\"btn btn-link\">\r\n");
      out.write("										<i class=\"fa-solid fa-trash\"></i>\r\n");
      out.write("									</button><a\r\n");
      out.write("								href=\"Edit_ManageAdmin.jsp?id=");
      out.print(rs.getString("id"));
      out.write("\"\r\n");
      out.write("								class=\"\"><i class=\"fa-solid fa-pen-to-square\"></i></a>\r\n");
      out.write("								</form></td>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("							<!-- Add more columns as needed -->\r\n");
      out.write("						</tr>\r\n");
      out.write("						");

						}
						} catch (Exception e) {
						e.printStackTrace();
						} finally {
						if (rs != null) {
						rs.close();
						}
						if (pstmt != null) {
						pstmt.close();
						}
						if (conn != null) {
						conn.close();
						}
						}
						
      out.write("\r\n");
      out.write("					\r\n");
      out.write("					</tbody>\r\n");
      out.write("				</table>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
      out.write("		<script\r\n");
      out.write("			src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\"\r\n");
      out.write("			integrity=\"sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL\"\r\n");
      out.write("			crossorigin=\"anonymous\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
