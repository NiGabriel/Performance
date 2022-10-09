package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DepEditServlet extends HttpServlet {

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
                out.println("<title>Department Edit</title>");
                out.println("</head>");
                out.println("<body>");

                String sid = request.getParameter("depid");
                int id = Integer.parseInt(sid);
                String name = request.getParameter("depname");

                user e = new user();
                e.setDpid(id);
                e.setDpname(name);

                int status = UserDatabase.updateDep(e);
                if (status > 0) {
                    response.sendRedirect("Admin.jsp#department");
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
