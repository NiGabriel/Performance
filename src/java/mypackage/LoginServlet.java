
package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ResultSet rs;
        String unm = null;
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");

            //feth data from login form
            String logemail = request.getParameter("email");
            String logpass = request.getParameter("password");
            String rolen = request.getParameter("roln");

            UserDatabase db = new UserDatabase(ConnectionPro.getConnection());
            user userAdmin = db.logAdministrator(logemail, logpass, rolen);
            user userSupervisor = db.logSupervisor(logemail, logpass, rolen);
            user userStaff = db.logStaff(logemail, logpass, rolen);
            user userHuman = db.logHuman(logemail, logpass,rolen);
            user e = new user();
            
            if (userAdmin != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("logAdmin", userAdmin);
                    //session.setMaxInactiveInterval(30);
                    response.sendRedirect("Admin.jsp");
                } 
            else if(userStaff != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("logStaff", userStaff);
                    //session.setMaxInactiveInterval(30);
                    response.sendRedirect("Staff.jsp");
                } 
            else if (userSupervisor != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("logSupervisor", userSupervisor);
                    response.sendRedirect("Supervisors.jsp");
                } 
            else if (userHuman != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("logHuman", userHuman);
                    response.sendRedirect("humanr.jsp");
                } 
            else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid Username or Password');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                }
      
            out.println("</body>");
            out.println("</html>");

        }
   
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            session.getAttribute("logAdmin");
            long t = session.getCreationTime() + 10;
            String username = request.getParameter("email");
            int status = 0;
            try {
                Connection con = ConnectionPro.getConnection();
                PreparedStatement ps = con.prepareStatement("update admin set last_login=? where username=?");

                ps.setLong(1, t);

                ps.setString(2, username);

                status = ps.executeUpdate();

                if (status != 0) {

                    RequestDispatcher rd = request.getRequestDispatcher("LoginServlet");
                    rd.forward(request, response);

                }
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        }
    }

}
