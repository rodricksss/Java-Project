/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import connections.MyConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


public class LoginCheckServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd;  
        ResultSet rs;
       
        try 
        {
            /* TODO output your page here. You may use following sample code. */
            String uname=request.getParameter("login").trim();
            String upass=request.getParameter("password").trim();
                       
            HttpSession sess = request.getSession(true);
            int admin_id;
            int seller_id;
            int buyer_id;  
            
            MyConnection.pst.close();
            MyConnection.pst=MyConnection.con.prepareStatement("select * from admin where user_name=? and user_pass=?");
            MyConnection.pst.setString(1, uname);
            MyConnection.pst.setString(2, upass);
            rs = MyConnection.pst.executeQuery();
             
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginCheckServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            if (rs.next()) 
            {
                admin_id = rs.getInt("admin_id");                
                uname = rs.getString("user_name");

                sess.setAttribute("admin_id", admin_id);
                sess.setAttribute("adminid", uname);
                
                rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
                MyConnection.pst.close();
                return;
            }
            
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("select * from seller where user_name = ? and user_pass= ?");
            MyConnection.pst.setString(1, uname);
            MyConnection.pst.setString(2, upass);
            rs = MyConnection.pst.executeQuery();

            if (rs.next()) 
            {
                seller_id = rs.getInt("seller_id");
                uname = rs.getString("user_name");
                
                sess.setAttribute("seller_id", seller_id);
                sess.setAttribute("sellerid", uname);
                rd = request.getRequestDispatcher("sellerprofile.jsp");
                rd.forward(request, response);
                MyConnection.pst.close();
                return;
            }

            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("select * from buyer where user_name = ? and user_pass= ?");
            MyConnection.pst.setString(1, uname);
            MyConnection.pst.setString(2, upass);
            rs = MyConnection.pst.executeQuery();

            if (rs.next()) 
            {
                buyer_id = rs.getInt("buyer_id");
                uname = rs.getString("user_name");
                
                sess.setAttribute("buyer_id", buyer_id);
                sess.setAttribute("buyerid", uname);
                rd = request.getRequestDispatcher("buyerprofile.jsp");
                rd.forward(request, response);
                MyConnection.pst.close();
                return;
            }            
            else
            {
                response.sendRedirect("loginpage.jsp");
                JOptionPane.showMessageDialog(null,"Incorrect Username or Password."); 
            }
            
            out.println("</body>");
            out.println("</html>");
            }
            finally 
            {            
                out.close();
                MyConnection.pst.close();
            }                        
   
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginCheckServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginCheckServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
