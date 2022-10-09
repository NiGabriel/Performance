package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HrRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession sess = request.getSession(true);
            user u = (user) sess.getAttribute("logAdmin");
            if (u == null) {
                response.sendRedirect("index.jsp");
            } else {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet HrRegisterServlet</title>");
                out.println("</head>");
                out.println("<body>");

                String huname = request.getParameter("huname");
                String hpass = request.getParameter("hpass");
                String hfname = request.getParameter("hfname");
                String hlname = request.getParameter("hlname");
                String htel = request.getParameter("htel");
                String hemail = request.getParameter("hemail");
                String hrole = request.getParameter("hrole");
                //int lastlogin = 0;

                //make user object
                user HrModel = new user.human(huname, hpass, hfname, hlname, htel, hemail, hrole);

                //create a database model
                UserDatabase regHr = new UserDatabase(ConnectionPro.getConnection());
                if (regHr.saveHuman(HrModel)) {
                    response.sendRedirect("Admin.jsp");
                } else {
                    response.sendRedirect("Admin.jsp");
                }
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

}
