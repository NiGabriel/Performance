package superpack;

import mypackage.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MileEditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession sess = request.getSession(true);
            user u = (user) sess.getAttribute("logSupervisor");
            if (u == null) {
                response.sendRedirect("index.jsp");
            } else {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Milestone Edit</title>");
                out.println("</head>");
                out.println("<body>");

                String sid = request.getParameter("goal");
                int id = Integer.parseInt(sid);
                String description = request.getParameter("description");
                String target = request.getParameter("target");
                String category = request.getParameter("category");
                String idate = request.getParameter("idate");
                String edate = request.getParameter("edate");
                String weight = request.getParameter("weight");
                int weightVal = Integer.parseInt(weight);

                user e = new user();
                e.setGoal(id);
                e.setDescription(description);
                e.setTarget(target);
                e.setCategory(category);
                e.setIdate(idate);
                e.setEdate(edate);
                e.setWeight(weightVal);

                int status = UserDatabase.updateMile(e);
                if (status > 0) {
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
