/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import connections.MyConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sony
 */
public class DisplayImageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            
            String imgLen = null;
            HttpSession sess = request.getSession();
            int adminid = (Integer) sess.getAttribute("admin_id");
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("select pics from admin where admin_id=?");
            MyConnection.pst.setInt(1, adminid);
            ResultSet rs = MyConnection.pst.executeQuery();
            if (rs.next()) {
                imgLen = rs.getString("pics");
                System.out.println(imgLen.length());
            }
            rs.close();
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("select pics from admin where admin_id=?");
            MyConnection.pst.setInt(1, adminid);
            rs = MyConnection.pst.executeQuery();
            if (rs.next()) {
                int len = imgLen.length();
                byte[] rb = new byte[len];
                InputStream readImg = rs.getBinaryStream("pics");
                int index = readImg.read(rb, 0, len);
                System.out.println("index" + index);
                response.reset();
                response.setContentType("image/jpg");
                response.getOutputStream().write(rb, 0, len);
                response.getOutputStream().flush();
            }          
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DisplayImageServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DisplayImageServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
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
            Logger.getLogger(DisplayImageServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DisplayImageServlet.class.getName()).log(Level.SEVERE, null, ex);
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
