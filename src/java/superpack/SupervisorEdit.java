package superpack;

import mypackage.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SupervisorEdit extends HttpServlet {

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
                out.println("<title>Supervisor Edit</title>");
                out.println("</head>");
                out.println("<body>");

                String sid = request.getParameter("sid");
                int idsupervisor = Integer.parseInt(sid);
                String suname = request.getParameter("suname");
                String spass = request.getParameter("spass");
                String sfname = request.getParameter("sfname");
                String slname = request.getParameter("slname");
                String position = request.getParameter("position");
                String stel = request.getParameter("stel");
                String semail = request.getParameter("semail");
                String sroln = request.getParameter("roln");
                String sdepartment = request.getParameter("sdepartment");

                user e = new user();
                e.setSid(idsupervisor);
                e.setSuname(suname);
                e.setSpass(spass);
                e.setSfname(sfname);
                e.setSlname(slname);
                e.setSposition(position);
                e.setStel(stel);
                e.setSemail(semail);
                e.setSroln(sroln);
                e.setSdepartment(sdepartment);
                int status = UserDatabase.updateSupervisor(e);
                if (status > 0) {
                    HttpSession session = request.getSession();
                    session.removeAttribute("logSupervisor");
                    response.sendRedirect("index.jsp");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Sorry! Unable to update record!');");
                    out.println("location='Supervisors.jsp';");
                    out.println("</script>");
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
