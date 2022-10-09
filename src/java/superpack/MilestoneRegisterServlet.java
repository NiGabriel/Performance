package superpack;

import mypackage.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MilestoneRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession sess = request.getSession(true);
            user u = (user) sess.getAttribute("logSupervisor");
            if (u == null) {
                response.sendRedirect("index.jsp");
            } else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet MilestoneRegisterServlet</title>");
                out.println("</head>");
                out.println("<body>");

                String description = request.getParameter("description");
                String target = request.getParameter("target");
                String category = request.getParameter("category");
                String idate = request.getParameter("idate");
                String edate = request.getParameter("edate");
                String weight = request.getParameter("weight");
                int weightVal = Integer.parseInt(weight);
                String depname = u.getSdepartment();
                //int lastlogin = 0;
                //make user object
                user MileModel = new user.milestone(description, target, category, idate, edate, weightVal, depname);

                //create a database model
                UserDatabase regMile = new UserDatabase(ConnectionPro.getConnection());
                if (regMile.saveMile(MileModel)) {
                    response.sendRedirect("Supervisors.jsp");
                } else {
                    String errorMessage = "User Available";
                    HttpSession regSession = request.getSession();
                    regSession.setAttribute("RegError", errorMessage);
                    response.sendRedirect("Supervisors.jsp");
                }
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

}
