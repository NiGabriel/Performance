package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import mypackage.*;
import mypackage.user;

public final class Admin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

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
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 user user = (user) session.getAttribute("logAdmin");
    if (user == null) {
        if (session.getAttribute("logAdmin") == null) {
            response.sendRedirect("index.jsp");
        }
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>BDF - PERFORMANCE APPRAISAL SYSTEM</title>\n");
      out.write("\n");
      out.write("        <link rel=\"icon\" href=\"img/bdflogo.jfif\" type=\"image/x-icon\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("\n");
      out.write("        <script src=\"https://kit.fontawesome.com/82c8618027.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <section id=\"menu\">\n");
      out.write("            <div class=\"logo\">\n");
      out.write("                <img src=\"img/bdflogo.jfif\" alt=\"\">\n");
      out.write("                <h2>BDF RWANDA</h2>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"items\">\n");
      out.write("                <li><i class=\"fa-solid fa-chart-pie\"></i><a href=\"#\">Dashboard</a></li>\n");
      out.write("                <li><i class=\"fa-brands fa-uikit\"></i><a href=\"#\">UI Elements</a></li>\n");
      out.write("                <li><i class=\"fa-solid fa-table-cells-large\"></i><a href=\"#\">Tabels</a></li>\n");
      out.write("                <li><i class=\"fa-solid fa-table-cells-large\"></i><a href=\"#\">Forms</a></li>\n");
      out.write("                <li><i class=\"fa-solid fa-address-card\"></i><a href=\"#\">Cards</a></li>\n");
      out.write("                <li><i class=\"fa-solid fa-display\"></i><a href=\"#\">Modal</a></li>\n");
      out.write("                <li><i class=\"fa-solid fa-chart-line\"></i><a href=\"#\">Blank</a></li>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        <section id=\"interface\">\n");
      out.write("            <div class=\"navigation\">\n");
      out.write("                <div class=\"n1\">\n");
      out.write("                    <div class=\"\">\n");
      out.write("                        <i id=\"menu-btn\" class=\"fa-solid fa-bars\"></i>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"search\">\n");
      out.write("\n");
      out.write("                        <i class=\"fa-solid fa-magnifying-glass\"></i>\n");
      out.write("                        <form action=\"\" method=\"get\">\n");
      out.write("                            <input name=\"search\" type=\"text\" placeholder=\"Search\">\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"profile\">\n");
      out.write("                    <i class=\"fa-solid fa-bell\"></i>\n");
      out.write("                    <i class=\"fa-solid fa-user\">\n");
      out.write("                        ");
if (session != null) {
                                if (session.getAttribute("logAdmin") != null) {

                                    out.println(session.getAttribute("logAdmin"));
                                }
                            }
      out.write("</i>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <h3 class=\"i-name\">\n");
      out.write("                Dashboard\n");
      out.write("            </h3>\n");
      out.write("            ");

                Connection conCo = ConnectionPro.getConnection();
                Connection conCo1 = ConnectionPro.getConnection();
                Connection conCo2 = ConnectionPro.getConnection();
                Connection conCo3 = ConnectionPro.getConnection();
                Statement stCo, stCo1, stCo2, stCo3 = null;
                ResultSet rsCo, rsCo1, rsCo2, rsCo3 = null;
                stCo = conCo.createStatement();
                stCo1 = conCo1.createStatement();
                stCo2 = conCo2.createStatement();
                stCo3 = conCo3.createStatement();

                String qCo = "SELECT count( * ) FROM staff";
                String qCo1 = "SELECT count( * ) FROM supervisor";
                String qCo2 = "SELECT count( * ) FROM department";
                String qCo3 = "SELECT count( * ) FROM role";
                rsCo = stCo.executeQuery(qCo);
                rsCo1 = stCo1.executeQuery(qCo1);
                rsCo2 = stCo2.executeQuery(qCo2);
                rsCo3 = stCo3.executeQuery(qCo3);

                rsCo.next();
                rsCo1.next();
                rsCo2.next();
                rsCo3.next();
            
      out.write("\n");
      out.write("            <div class=\"values\">\n");
      out.write("                <div class=\"val-box\">\n");
      out.write("                    <i class=\"fa-solid fa-users\"></i>\n");
      out.write("                    <div>\n");
      out.write("                        <h3>");
      out.print(rsCo.getInt(1));
      out.write("</h3>\n");
      out.write("                        <span>Staff</span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"val-box\">\n");
      out.write("                    <i class=\"fa-solid fa-cart-shopping\"></i>\n");
      out.write("                    <div>\n");
      out.write("                        <h3>");
      out.print(rsCo1.getInt(1));
      out.write("</h3>\n");
      out.write("                        <span>Supervisors</span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"val-box\">\n");
      out.write("                    <i class=\"fa-brands fa-sellcast\"></i>\n");
      out.write("                    <div>\n");
      out.write("                        <h3>");
      out.print(rsCo2.getInt(1));
      out.write("</h3>\n");
      out.write("                        <span>Department</span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"val-box\">\n");
      out.write("                    <i class=\"fa-solid fa-money-bill\"></i>\n");
      out.write("                    <div>\n");
      out.write("                        <h3>");
      out.print(rsCo3.getInt(1));
      out.write("</h3>\n");
      out.write("                        <span>Role</span>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"board\">\n");
      out.write("                <table width=\"100%\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Username</td>\n");
      out.write("                            <td>Position</td>\n");
      out.write("                            <td>Status</td>\n");
      out.write("                            <td>Role</td>\n");
      out.write("                            <td></td>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");

                            Connection connecti = ConnectionPro.getConnection();
                            Statement stts = null;
                            ResultSet resus = null;
                            stts = connecti.createStatement();
                            String qsearch = request.getParameter("search");
                            String das;
                            if (qsearch != null) {
                                //das = "SELECT CONCAT(firstname,' ',lastname) AS firstname, email, position, role FROM supervisor where firstname like '%" + qsearch + "%' or position like '%" + qsearch + "%' or role like '%" + qsearch + "%' UNION SELECT CONCAT(firstname,' ',lastname) AS firstname, email, position, role FROM staff where firstname like '%" + qsearch + "%' or position like '%" + qsearch + "%' or role like '%" + qsearch + "%' UNION SELECT CONCAT(firstname,' ',lastname) AS firstname, username, position, role FROM admin ORDER BY role where firstname like '%" + qsearch + "%' or position like '%" + qsearch + "%' or role like '%" + qsearch + "%' ";
                                das = "select CONCAT(firstname,' ',lastname) AS firstname, email, position, role from staff where role like '%" + qsearch + "%' or firstname like '%" + qsearch + "%' or lastname like '%" + qsearch + "%' or username like '%" + qsearch + "%' or position like '%" + qsearch + "%' UNION SELECT firstname, email, position, role FROM supervisor WHERE firstname like '%" + qsearch + "%' or lastname like '%" + qsearch + "%' or username like '%" + qsearch + "%' or position like '%" + qsearch + "%' or role like '%" + qsearch + "%' UNION SELECT CONCAT(firstname,' ',lastname) AS firstname, username, position, role FROM admin WHERE firstname like '%" + qsearch + "%' or lastname like '%" + qsearch + "%' or username like '%" + qsearch + "%' or position like '%" + qsearch + "%' or role like '%" + qsearch + "%'";
                            } else {
                                das = "SELECT CONCAT(firstname,' ',lastname) AS firstname, email, position, role FROM supervisor UNION SELECT CONCAT(firstname,' ',lastname) AS firstname, email, position, role FROM staff UNION SELECT CONCAT(firstname,' ',lastname) AS firstname, username, position, role FROM admin ORDER BY role";
                            }
                            resus = stts.executeQuery(das);
                            while (resus.next()) {
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td class=\"people\">\n");
      out.write("                                <!--<img src=\"\" alt=\"\">-->\n");
      out.write("                                <div class=\"people-de\">\n");
      out.write("                                    <h5>");
      out.print(resus.getString(1));
      out.write("</h5>\n");
      out.write("                                    <p>");
      out.print(resus.getString(2));
      out.write("</p>\n");
      out.write("                                </div>\n");
      out.write("                            </td>\n");
      out.write("                            <td class=\"people-des\">\n");
      out.write("                                <h5>");
      out.print(resus.getString(3));
      out.write("</h5>\n");
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                            <td class=\"active\">\n");
      out.write("                                ");

                                    if (session != null) {
                                        if (session.getAttribute("logAdmin") != null) {

                                        }
      out.write("\n");
      out.write("                                <p>Active</p> \n");
      out.write("                                ");

                                } else {
                                
      out.write("<p>inactive</p>\n");
      out.write("                                ");

                                    }
                                
      out.write("</td>\n");
      out.write("                            <td class=\"role\">\n");
      out.write("                                <p>");
      out.print(resus.getString(4));
      out.write("</p>\n");
      out.write("                            </td>\n");
      out.write("                            <td class=\"edit\"><a href=\"#\">Edit</a></td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        <script>\n");
      out.write("            $('#menu-btn').click(function () {\n");
      out.write("                $('#menu').toggleClass(\"active\");\n");
      out.write("            })\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
