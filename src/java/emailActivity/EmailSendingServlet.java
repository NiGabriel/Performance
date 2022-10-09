package emailActivity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mypackage.ConnectionPro;
import mypackage.UserDatabase;
import mypackage.user;

public class EmailSendingServlet extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        PrintWriter out = response.getWriter();

        String recipient = request.getParameter("emailres");
        String subject = "Password reset";
        String rolen = request.getParameter("rolep");
        String content = null;

        UserDatabase db = new UserDatabase(ConnectionPro.getConnection());
        user userAdmin = db.logAdministrator(recipient, rolen);
        user userSupervisor = db.logSupervisor(recipient, rolen);
        user userStaff = db.logStaff(recipient, rolen);
        user userHuman = db.logHuman(recipient, rolen);
        user e = new user();

        if (userAdmin != null) {
            try {

                Connection conp = ConnectionPro.getConnection();

                PreparedStatement pstp = conp.prepareStatement("select firstname, password from admin where username = '"+recipient+"'");

                ResultSet rsp = pstp.executeQuery();
                while (rsp.next()) {
                    
                    content = "Hello " + rsp.getString("firstname") + ", Your current password is: " + rsp.getString("password");
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception en) {
                out.print(en);
            }
        } else if (userStaff != null) {
            try {

                Connection conp = ConnectionPro.getConnection();

                PreparedStatement pstp = conp.prepareStatement("select firstname, password from staff where email='"+recipient+"'");

                ResultSet rsp = pstp.executeQuery();
                while (rsp.next()) {
                    content = "Hello " + rsp.getString("firstname") + ", Your current password is: " + rsp.getString("password");
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception en) {
                out.print(en);
            }
        } else if (userSupervisor != null) {
            try {

                Connection conp = ConnectionPro.getConnection();

                PreparedStatement pstp = conp.prepareStatement("select firstname, password from supervisor where email='"+recipient+"'");

                ResultSet rsp = pstp.executeQuery();
                while (rsp.next()) {
                    content = "Hello " + rsp.getString("firstname") + ", Your current password is: " + rsp.getString("password");
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception en) {
                out.print(en);
            }
        } else if (userHuman != null) {
            try {

                Connection conp = ConnectionPro.getConnection();

                PreparedStatement pstp = conp.prepareStatement("select firstname, password from human_resource where email='"+recipient+"'");

                ResultSet rsp = pstp.executeQuery();
                while (rsp.next()) {
                    content = "Hello " + rsp.getString("firstname") + ", Your current password is: " + rsp.getString("password");
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception en) {
                out.print(en);
            }
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Username doesn't exists!!!!);");
            out.println("location='index.jsp';");
            out.println("</script>");
        }

        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            //Mailer.send(recipient,subject,content);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('The email sent successfully);");
            out.println("location='index.jsp';");
            out.println("</script>");
        } catch (Exception ex) {
            ex.printStackTrace();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('There was an error);");
            out.println("location='index.jsp';");
            out.println("</script>");
        }
    }
}
