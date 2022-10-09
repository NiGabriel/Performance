package staffpack;

import mypackage.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FulfillMileMidEdit extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession sess = request.getSession(true);
            user u = (user) sess.getAttribute("logStaff");
            if (u == null) {
                response.sendRedirect("index.jsp");
            } else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Fullfilling Milestone in Mid year</title>");
                out.println("</head>");
                out.println("<body>");

                String g = request.getParameter("goal");
                int goal = Integer.parseInt(g);
                String description = request.getParameter("description");
                String target = request.getParameter("target");
                String achieved = request.getParameter("achieved");
                String weight = request.getParameter("weight");
                double weightVal = Double.parseDouble(weight);
                String category = request.getParameter("category");
                LocalDateTime idate = LocalDateTime.now();
                String staffname = request.getParameter("staffnamep");

                String depname = u.getStdepartmentname();

                user FullModel = new user.fulfillmile(goal, description, target, achieved, weightVal, category, idate.toString(), staffname, depname);

                //create a database model
                UserDatabase regFull = new UserDatabase(ConnectionPro.getConnection());
                if (regFull.saveFulfill(FullModel)) {

                    response.sendRedirect("Staff.jsp");
                } else {
                    String errorMessage = "User Available";
                    HttpSession regSession = request.getSession();
                    regSession.setAttribute("RegError", errorMessage);
                    response.sendRedirect("Staff.jsp");
                }
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

}
