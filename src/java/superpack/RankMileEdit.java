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

public class RankMileEdit extends HttpServlet {

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
                out.println("<title>Ranking Milestone</title>");
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
                user e = new user();
                e.setRankgoal(goal);
                e.setRankachieved(achieved);
                e.setRankweightVal(weightVal);
                e.setRankmidyratingVal(midyratingVal);
                e.setRankendyratingVal(endyratingVal);
                e.setRankaverageannualscore(averageannualscore);
                e.setRanktotalpoint(totalpoint);
                e.setRankdate(rankdate.toString());
                e.setRankstaffname(staffname);
                e.setRankcomment(comment);
                int status = UserDatabase.updateRankMile(e);
                if (status > 0) {
                    UserDatabase.deleteAssMileStaff(goal, staffname);
                    UserDatabase.deletePendMileStaff(goal, staffname);
                    response.sendRedirect("Supervisors.jsp");
                } else {
                    out.println("Sorry! unable to update record");
                }
                out.close();

                out.println("</body>");
                out.println("</html>");
            }
        }
    }

}
