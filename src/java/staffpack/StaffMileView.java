package staffpack;

import mypackage.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StaffMileView extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter();) {
            HttpSession sess = request.getSession(true);
            user u = (user) sess.getAttribute("logStaff");
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

                out.println("<title>Staff - View Milestone</title>");
                out.println("</head>");
                out.println("<body>");

                String id = request.getParameter("goal");
                int myId = Integer.parseInt(id);

                user e = UserDatabase.getMilestoneById(myId);

                out.println("<div class=\"card\">");

                out.println("<div class=\"card-header\">\n"
                        + "			    <h2> Appraisal performance system - View Milestone's data</h2>\n"
                        + "			</div>");

                out.println("<div class=\"modal-content\">");
                out.println("<div class=\"modal-body\">");

                out.println("<button class=\"btn btn-success badge-pill\" data-bs-toggle=\"modal\" onclick=\"window.print();return false;\" style=\"width: 80px;\"> PRINT </button>");
                out.println("<button class=\"btn btn-success badge-pill\" data-bs-toggle=\"modal\" style=\"width: 80px;\"> <a href=\"Staff.jsp\" style=\"color: white;\">BACK</a> </button>");
                out.print("<form action='' method='post'>");
                out.println("<div class=\"mb-3\">");
                out.print("<input type ='hidden' name ='goal' value ='" + e.getGoal() + "' readonly/>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("Description:<textarea name='description' class=\"form-control\" style='width: 400px; height: 120px;' readonly>" + e.getDescription() + "</textarea>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("Target:<textarea name='target' class='form-control' style='width: 400px; height: 120px;' readonly>" + e.getTarget() + "</textarea>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("Category: <input type ='text' name ='catename' class='form-control' style='width: 400px;' value ='" + e.getCategory() + "' readonly/>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("Input date: <input type ='datetime-local' class='form-control' name ='idate' style='width: 400px;' value ='" + e.getIdate() + "' readonly/>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("End date: <input type ='datetime-local' class='form-control' name ='edate' style='width: 400px;' value ='" + e.getEdate() + "' readonly/>");
                out.println("</div>");
                out.println("<div class=\"mb-3\">");
                out.print("Weight: <input type ='text' name ='weight' class='form-control' style='width: 400px;' value ='" + e.getWeight() + "' readonly/>");
                out.println("</div>");

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
