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

public class FeedbackRegisterServlet extends HttpServlet {

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
                out.println("<title>Servlet FeedbackRegisterServlet</title>");
                out.println("</head>");
                out.println("<body>");

                String stfname = request.getParameter("stfname");
                String description = request.getParameter("description");
                String depname = request.getParameter("depname");
                LocalDateTime idate = LocalDateTime.now();

                user FeedModel = new user.feedback(stfname, description, idate.toString(), depname);

                //create a database model
                UserDatabase regFeed = new UserDatabase(ConnectionPro.getConnection());
                if (regFeed.saveFeed(FeedModel)) {
                    response.sendRedirect("Staff.jsp");
                } else {
                    response.sendRedirect("Staff.jsp");
                }
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

}
