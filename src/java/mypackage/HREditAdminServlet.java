package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HREditAdminServlet extends HttpServlet {

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
                out.println("<title>Admin - HR Edit</title>");
                out.println("</head>");
                out.println("<body>");

                String hid = request.getParameter("hid");
                int idHr = Integer.parseInt(hid);
                String huname = request.getParameter("huname");
                String hpass = request.getParameter("hpass");
                String hfname = request.getParameter("hfname");
                String hlname = request.getParameter("hlname");
                String htel = request.getParameter("htel");
                String hemail = request.getParameter("hemail");
                String hrole = request.getParameter("hrole");

                user e = new user();
                e.setHrid(idHr);
                e.setHruname(huname);
                e.setHrpass(hpass);
                e.setHrfname(hfname);
                e.setHrlname(hlname);
                e.setHrtel(htel);
                e.setHremail(hemail);
                e.setHrrole(hrole);
                int status = UserDatabase.updateHr(e);
                if (status > 0) {
                    response.sendRedirect("Admin.jsp");
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
