package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SupervisorRegisterServlet extends HttpServlet {

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
                out.println("<title>Servlet SupervisorRegisterServlet</title>");
                out.println("</head>");
                out.println("<body>");

                String suname = request.getParameter("suname");
                String spass = request.getParameter("spass");
                String sfname = request.getParameter("sfname");
                String slname = request.getParameter("slname");
                String position = request.getParameter("position");
                String stel = request.getParameter("stel");
                String semail = request.getParameter("semail");
                String roln = request.getParameter("roln");
                String depart = request.getParameter("sdepartment");

                //make user object
                user SupervisorModel = new user.supervisor(suname, spass, sfname, slname, position, stel, semail, roln, depart);

                //create a database model
                UserDatabase regSupervisor = new UserDatabase(ConnectionPro.getConnection());
                if (regSupervisor.saveSupervisor(SupervisorModel)) {
                    response.sendRedirect("Admin.jsp");
                } else {
                    String errorMessage = "User Available";
                    HttpSession regSession = request.getSession();
                    regSession.setAttribute("RegError", errorMessage);
                    response.sendRedirect("Admin.jsp");
                }
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

}
