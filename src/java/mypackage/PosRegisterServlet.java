package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PosRegisterServlet extends HttpServlet {

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
                out.println("<title>Servlet PosRegisterServlet</title>");
                out.println("</head>");
                out.println("<body>");

                String pname = request.getParameter("pname");

                //int lastlogin = 0;
                //make user object
                user PosModel = new user.position(pname);

                //create a database model
                UserDatabase regPos = new UserDatabase(ConnectionPro.getConnection());
                if (regPos.savePos(PosModel)) {
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
