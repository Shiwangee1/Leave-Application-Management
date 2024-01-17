/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.80
 * Generated at: 2023-12-14 04:50:16 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class PieChart_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<title>Pie Chart</title>\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css\"\r\n");
      out.write("	integrity=\"sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N\"\r\n");
      out.write("	crossorigin=\"anonymous\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/style.css\">\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/chart.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("<!--\r\n");
      out.write("Your\r\n");
      out.write(" \r\n");
      out.write("existing\r\n");
      out.write(" \r\n");
      out.write("styles\r\n");
      out.write(" \r\n");
      out.write("remain\r\n");
      out.write(" \r\n");
      out.write("unchanged\r\n");
      out.write(" \r\n");
      out.write("-->\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<section class=\"pie_chart_content\">\r\n");
      out.write("		<div class=\"overlay\">\r\n");
      out.write("			<div class=\"container\">\r\n");
      out.write("				<div class=\"row\">\r\n");
      out.write("					<div class=\"col-md-6\">\r\n");
      out.write("						<div class=\"main_box\">\r\n");
      out.write("							<h1>Covid -19 Corona VALUE</h1>\r\n");
      out.write("							<canvas id=\"mychart\"></canvas>\r\n");
      out.write("						</div>\r\n");
      out.write("						");

						
						
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"col-md-6\">\r\n");
      out.write("					<div class=\"count_box\">\r\n");
      out.write("							<div class=\"form-group\">\r\n");
      out.write("								<label for=\"coronavirus-input\">Total Number of Cases</label> <input\r\n");
      out.write("									type=\"text\" value=\"1234\"\r\n");
      out.write("									class=\"total-input form-control\" id=\"coronavirus-input\"\r\n");
      out.write("									readonly>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"form-group\">\r\n");
      out.write("								<label for=\"active-input\">Active Cases</label> <input\r\n");
      out.write("									type=\"text\" value=\"1234\" name=\"active-input\"\r\n");
      out.write("									class=\"active-input form-control\" id=\"active-input\">\r\n");
      out.write("							</div>\r\n");
      out.write("							<!-- Include similar input fields for Deaths and Recovered -->\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</section>\r\n");
  

Connection conn =null; 
PreparedStatement pstmt= null;
ResultSet rs= null;
String sql="";
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	
}
catch(Exception e){
	e.printStackTrace();
	
}

      out.write("\r\n");
      out.write("	<script>\r\n");
      out.write("    document.addEventListener('DOMContentLoaded', function () {\r\n");
      out.write("        const activeCases = document.getElementById('active-input');\r\n");
      out.write("        const deaths = document.getElementById('death-input');\r\n");
      out.write("        const recovered = document.getElementById('recovered-input');\r\n");
      out.write("        const ctx = document.getElementById('mychart').getContext('2d');\r\n");
      out.write("\r\n");
      out.write("        let mychart = new Chart(ctx, {\r\n");
      out.write("            type: 'pie',\r\n");
      out.write("            data: {\r\n");
      out.write("                labels: ['Active cases', 'Deaths', 'Recovered'],\r\n");
      out.write("                datasets: [{\r\n");
      out.write("                    label: 'Number of cases',\r\n");
      out.write("                    data: [0, 0, 0],\r\n");
      out.write("                    backgroundColor: ['red', 'orange', 'yellow'],\r\n");
      out.write("                    borderWidth: 1\r\n");
      out.write("                }]\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        const updateChartValue = (input, dataOrder) => {\r\n");
      out.write("            input.addEventListener('input', () => {\r\n");
      out.write("                mychart.data.datasets[0].data[dataOrder] = input.value;\r\n");
      out.write("                mychart.update();\r\n");
      out.write("            });\r\n");
      out.write("        };\r\n");
      out.write("\r\n");
      out.write("        updateChartValue(activeCases, 0);\r\n");
      out.write("        updateChartValue(deaths, 1);\r\n");
      out.write("        updateChartValue(recovered, 2);\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        // Function to calculate the total days excluding weekends\r\n");
      out.write("        const calculateTotalDays = () => {\r\n");
      out.write("            const joinDate = new Date('your_joining_date_here'); // Replace with the actual joining date\r\n");
      out.write("            const currentDate = new Date();\r\n");
      out.write("            let totalDays = 0;\r\n");
      out.write("\r\n");
      out.write("            while (joinDate <= currentDate) {\r\n");
      out.write("                if (joinDate.getDay() !== 0 && joinDate.getDay() !== 6) {\r\n");
      out.write("                    totalDays++;\r\n");
      out.write("                }\r\n");
      out.write("                joinDate.setDate(joinDate.getDate() + 1);\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            return totalDays;\r\n");
      out.write("        };\r\n");
      out.write("\r\n");
      out.write("        // Update the \"Total Days of Employment\" input\r\n");
      out.write("        const totalDaysInput = document.getElementById('coronavirus-input');\r\n");
      out.write("        totalDaysInput.value = calculateTotalDays();\r\n");
      out.write("        \r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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