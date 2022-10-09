package superpack;

import mypackage.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AssignMileEdit extends HttpServlet {

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
                out.println("<title>Assign Mile</title>");
                out.println("</head>");
                out.println("<body>");

                String g = request.getParameter("goal");
                int goal = Integer.parseInt(g);
                String description = request.getParameter("description");
                String target = request.getParameter("target");
                String category = request.getParameter("category");
                String idate = request.getParameter("idate");
                String edate = request.getParameter("edate");
                String weight = request.getParameter("weight");
                int weightVal = Integer.parseInt(weight);
                String staffname = request.getParameter("staffname");

                String depname = u.getSdepartment();

                user AssignModel = new user.assignmile(goal, description, target, category, idate, edate, weightVal, staffname, depname);

                //create a database model
                UserDatabase regAssign = new UserDatabase(ConnectionPro.getConnection());

                try {
                    Connection con = ConnectionPro.getConnection();

                    PreparedStatement ps = con.prepareStatement("(select description from assignedmilestone where goal = '" + goal + "' and staffname = '" + staffname + "')union(select description from report where goal = '" + goal + "' and staffname = '" + staffname + "')");
                    //PreparedStatement ps = con.prepareStatement("select description from assignedmilestone where goal = '" + goal + "' and staffname = '" + staffname + "'");

                    ResultSet rs = ps.executeQuery();

                    if (!rs.next()) {

                        if (regAssign.saveAssign(AssignModel)) {
                            response.sendRedirect("Supervisors.jsp");
                        } else {
                            String errorMessage = "User Available";
                            HttpSession regSession = request.getSession();
                            regSession.setAttribute("RegError", errorMessage);
                            response.sendRedirect("Supervisors.jsp");
                        }
                    } else {
                        response.sendRedirect("Supervisors.jsp");
                    }
                } catch (Exception ec) {
                    ec.printStackTrace();
                }
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

}
