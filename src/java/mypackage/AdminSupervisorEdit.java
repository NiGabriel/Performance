package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminSupervisorEdit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter();) {
            HttpSession sess = request.getSession(true);
            user u = (user) sess.getAttribute("logAdmin");
            if (u == null) {
                response.sendRedirect("index.jsp");
            } else {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel=\"stylesheet\" href=\"css/styleAdmin.css\">");
                out.println("<script src =\"https://kit.fontawesome.com/a076d05399.js\"></script>");
                out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\">");
                out.println("<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\" integrity=\"sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy\" crossorigin=\"anonymous\"></script>");
                out.println("<script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js\" integrity=\"sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN\" crossorigin=\"anonymous\"></script>");
                out.println("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js\" integrity=\"sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/\" crossorigin=\"anonymous\"></script>");
                out.println("<script src=\"https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js\"></script>");

                out.println("<title>Admin - Edit Supervisor</title>");
                out.println("</head>");
                out.println("<body>");

                String idxs = request.getParameter("sidx");
                int myId = Integer.parseInt(idxs);

                user e = UserDatabase.getSupervisorById(myId);

                out.println("<div class=\"card\">");

                out.println("<div class=\"card-header\">\n"
                        + "			    <h2> Appraisal performance system - Modify supervisor's data</h2>\n"
                        + "			</div>");

                out.println("<div class=\"modal-content\">");
                out.println("<div class=\"modal-body\">");

                out.println("<button class=\"btn btn-success badge-pill\" data-bs-toggle=\"modal\" onclick=\"window.print();return false;\" style=\"width: 80px;\"> PRINT </button>");
                out.println("<button class=\"btn btn-success badge-pill\" data-bs-toggle=\"modal\" style=\"width: 80px;\"> <a href=\"Admin.jsp\" style=\"color: white;\">BACK</a> </button>");
                out.print("<form action='SupervisorEditServlet' method='post'>");
                out.println("<div class=\"mb-3\">");
                out.print("<input type ='hidden' name ='sid' value ='" + e.getSid() + "'/>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("username of supervisor:<input type='text' name='suname' class=\"form-control\" style=\"width: 270px;\" value='" + e.getSuname() + "'/>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("Password:<input type='password' name='spass' class=\"form-control\" style=\"width: 270px;\" pattern=\"(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}\" title=\"Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters\" required/>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("First name:<input type='text' name='sfname' class=\"form-control\" style=\"width: 270px;\" value='" + e.getSfname() + "' required");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("Last name:<input type='text' name='slname' class=\"form-control\" style=\"width: 270px;\" value='" + e.getSlname() + "' required/>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("Position:<select name=\"position\" class='form-control' style=\"width: 270px;\"> ");
                try {
                    Connection con = ConnectionPro.getConnection();

                    PreparedStatement pst = con.prepareStatement("select pname from jobposition");

                    ResultSet rs = pst.executeQuery();

                    while (rs.next()) {
                        String name = rs.getString("pname");

                        out.print("<option value=" + name + ">" + name + "</option>");
                    }
                } catch (Exception ec) {
                    ec.printStackTrace();
                }
                out.print("</select>");
                out.println("</div>");

                out.println("<div class=\"mb-3\">");
                out.print("Telephone:<input type='text' name='stel' class=\"form-control\" style=\"width: 270px;\" value='" + e.getStel() + "' pattern=\"^\\d{10}$\" required/>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("Email:<input type='email' name='semail' class=\"form-control\" style=\"width: 270px;\" value='" + e.getSemail() + "' required/>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("Role name:<input type='text' name='roln' class=\"form-control\" style=\"width: 270px;\" value='" + e.getSroln() + "' required readonly/>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("Department:<select name='sdepartment' class='form-control' style=\"width: 270px;\"> ");
                try {
                    Connection conn = ConnectionPro.getConnection();
                    PreparedStatement psts = conn.prepareStatement("select dename from department");

                    ResultSet rss = psts.executeQuery();

                    while (rss.next()) {
                        String n = rss.getString("dename");

                        out.print("<option value=" + n + ">" + n + "</option>");
                    }
                } catch (Exception ec) {
                    ec.printStackTrace();
                }
                out.print("</select>");
                out.println("</div>");

                out.println("<div class=\"mb-3\">");

                out.print("<input type='submit' class=\"btn btn-primary\" value='Edit & Save '/>");
                out.println("</div>");
                out.print("</form>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");

                out.close();
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
