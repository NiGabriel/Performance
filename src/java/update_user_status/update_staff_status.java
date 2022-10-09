/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package update_user_status;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mypackage.ConnectionPro;

/**
 *
 * @author IPRC KARONGI
 */
public class update_staff_status extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        
            
            
            HttpSession session = request.getSession();
            session.getAttribute("logStaff");
            long t = session.getCreationTime()+10;
            String username = request.getParameter("email");
            int status = 0;
            try {
                Connection con = ConnectionPro.getConnection();
                PreparedStatement ps = con.prepareStatement("update staff set last_login=? where username=?");
                
                
                ps.setLong(1, t);
                
                ps.setString(2, username);
                
                status = ps.executeUpdate();
                
                if(status != 0){
                   RequestDispatcher rd = request.getRequestDispatcher("LoginServlet");
                   rd.forward(request,response);
                }
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
           
        }
    }

}
