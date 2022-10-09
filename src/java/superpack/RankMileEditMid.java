package superpack;

import mypackage.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RankMileEditMid extends HttpServlet {

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
                out.println("<title>Ranking Milestone in Mid year</title>");
                out.println("</head>");
                out.println("<body>");

                String g = request.getParameter("goal");
                int goal = Integer.parseInt(g);
                String description = request.getParameter("description");
                String target = request.getParameter("target");
                String achieved = request.getParameter("achieved");
                String weight = request.getParameter("weight");
                double weightVal = Double.parseDouble(weight);
                String midyrating = request.getParameter("midyrating");
                double midyratingVal = Double.parseDouble(midyrating);
                String endyrating = request.getParameter("endyrating");
                double endyratingVal = Double.parseDouble(endyrating);
                double averageannualscore = (midyratingVal * endyratingVal) / weightVal;
                double totalpoint = (averageannualscore * weightVal) / 100;
                String category = request.getParameter("category");
                String idate = request.getParameter("idate");
                LocalDateTime rankdate = LocalDateTime.now();
                String staffname = request.getParameter("staffnamep");
                String comment = request.getParameter("comment");

                String depname = u.getSdepartment();

                user RankModel = new user.rankmile(goal, description, target, achieved, weightVal, midyratingVal, endyratingVal, averageannualscore, totalpoint, category, idate, rankdate.toString(), staffname, depname, comment);

                //create a database model
                UserDatabase regRank = new UserDatabase(ConnectionPro.getConnection());
                if (regRank.saveRank(RankModel)) {
                    UserDatabase.deletePendMileStaff(goal, staffname);
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
