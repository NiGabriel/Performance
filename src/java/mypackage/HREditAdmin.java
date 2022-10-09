package mypackage;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HREditAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter();) {
            HttpSession sess = request.getSession(true);
            user u = (user) sess.getAttribute("logAdmin");
            if (u == null) {
                response.sendRedirect("index.jsp");
            }
            else{
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

            out.println("<title>Admin - Edit Human resource</title>");
            out.println("</head>");
            out.println("<body>");

            String idxs = request.getParameter("sidhr");
            int myId = Integer.parseInt(idxs);

            user e = UserDatabase.getHrById(myId);

            out.println("<div class=\"card\">");

            out.println("<div class=\"card-header\">\n"
                    + "			    <h2> Appraisal performance system - Modify HR's data</h2>\n"
                    + "			</div>");

            out.println("<div class=\"modal-content\">");
            out.println("<div class=\"modal-body\">");

            out.println("<button class=\"btn btn-success badge-pill\" data-bs-toggle=\"modal\" onclick=\"window.print();return false;\" style=\"width: 80px;\"> PRINT </button>");
            out.println("<button class=\"btn btn-success badge-pill\" data-bs-toggle=\"modal\" style=\"width: 80px;\"> <a href=\"Admin.jsp\" style=\"color: white;\">BACK</a> </button>");
            out.print("<form action='HREditAdminServlet' method='post'>");
            out.println("<div class=\"mb-3\">");
            out.print("<input type ='hidden' name ='hid' value ='" + e.getHrid() + "'/>");
            out.println("</div>");
            out.println("<div class=\"mb-3\">");
            out.print("username of HR:<input type='text' name='huname' class=\"form-control\" style=\"width: 270px;\" value='" + e.getHruname() + "'/>");
            out.println("</div>");
            out.println("<div class=\"mb-3\">");
            out.print("Password:<input type='password' name='hpass' class=\"form-control\" style=\"width: 270px;\" pattern=\"(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}\" title=\"Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters\" required/>");
            out.println("</div>");
            out.println("<div class=\"mb-3\">");
            out.print("First name:<input type='text' name='hfname' class=\"form-control\" style=\"width: 270px;\" value='" + e.getHrfname() + "' required");
            out.println("</div>");
            out.println("<div class=\"mb-3\">");
            out.print("Last name:<input type='text' name='hlname' class=\"form-control\" style=\"width: 270px;\" value='" + e.getHrlname() + "' required/>");
            out.println("</div>");
            out.println("<div class=\"mb-3\">");
            out.print("Telephone:<input type='text' name='htel' class=\"form-control\" style=\"width: 270px;\" value='" + e.getHrtel() + "' required");
            out.println("</div>");
            out.println("<div class=\"mb-3\">");
            out.print("Email:<input type='email' name='hemail' class=\"form-control\" style=\"width: 270px;\" value='" + e.getHremail() + "' required/>");
            out.println("</div>");
            out.println("<div class=\"mb-3\">");
            out.print("Role:<input type='text' name='hrole' class=\"form-control\" style=\"width: 270px;\" value='" + e.getHrrole() + "' readonly required/>");
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
            }}
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
