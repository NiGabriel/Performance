package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StaffEditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
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
                out.println("<title>Staff Edit</title>");
                out.println("</head>");
                out.println("<body>");

                String sid = request.getParameter("stid");
                int idstaff = Integer.parseInt(sid);
                String suname = request.getParameter("stuname");
                String spass = request.getParameter("stpass");
                String sfname = request.getParameter("stfname");
                String slname = request.getParameter("stlname");
                String position = request.getParameter("stposition");
                String depname = request.getParameter("stdepname");
                String stel = request.getParameter("sttel");
                String semail = request.getParameter("stemail");
                String sroln = request.getParameter("stroln");

                user e = new user();
                e.setStid(idstaff);
                e.setStuname(suname);
                e.setStpass(spass);
                e.setStfname(sfname);
                e.setStlname(slname);
                e.setStposition(position);
                e.setStdepartmentname(depname);
                e.setSttel(stel);
                e.setStemail(semail);
                e.setStroln(sroln);
                int status = UserDatabase.updateStaff(e);
                if (status > 0) {
                    response.sendRedirect("Admin.jsp#staffs");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Sorry! Unable to update record!');");
                    out.println("location='Admin.jsp';");
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
