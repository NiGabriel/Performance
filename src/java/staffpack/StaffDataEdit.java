package staffpack;

import mypackage.*;
import staffpack.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StaffDataEdit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Staff Edit</title>");
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
            e.setStid(idsupervisor);
            e.setStuname(suname);
            e.setStpass(spass);
            e.setStfname(sfname);
            e.setStlname(slname);
            e.setStposition(position);
            e.setSttel(stel);
            e.setStemail(semail);
            e.setStroln(sroln);
            e.setStdepartmentname(sdepartment);
            int status = UserDatabase.updateStaff(e);
            if (status > 0) {
                HttpSession session = request.getSession();
                session.removeAttribute("logStaff");
                response.sendRedirect("index.jsp");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Sorry! Unable to update record!');");
                out.println("location='Staff.jsp';");
                out.println("</script>");
            }
            out.close();

            out.println("</body>");
            out.println("</html>");
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
