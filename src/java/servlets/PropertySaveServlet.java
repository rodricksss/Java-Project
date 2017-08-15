/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.PropertyBean;
import connections.PropertyModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author sony
 */
public class PropertySaveServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sess=request.getSession();
        RequestDispatcher rd;
        try {
            /* TODO output your page here. You may use following sample code. */
            int seller_id=(Integer)sess.getAttribute("seller_id");
            String avail=request.getParameter("avail");
            int catid=Integer.parseInt(request.getParameter("catid"));
            int subcatid=Integer.parseInt(request.getParameter("subcatid"));
            int stateid=Integer.parseInt(request.getParameter("stateid"));
            int cityid=Integer.parseInt(request.getParameter("cityid"));
            String paddress=request.getParameter("paddress");
            String area=request.getParameter("area");
            float price=Float.parseFloat(request.getParameter("price"));
            String describe=request.getParameter("describe");
            String status=request.getParameter("pstate");
            
            PropertyBean pb=new PropertyBean();
            pb.setCatid(catid);
            pb.setSubcatid(subcatid);
            pb.setCityid(cityid);
            pb.setStateid(stateid);
            pb.setDescription(describe);
            pb.setStatus(status);
            pb.setPrice(price);
            pb.setAddress(paddress);
            pb.setAvail(avail);
            pb.setArea(area);
            
            PropertyModel pm=new PropertyModel();
            boolean flag=pm.insertProperty(pb, seller_id);
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PropertySaveServlet</title>");            
            out.println("</head>");
            out.println("<body>");
             
            if(flag)
            {
                response.sendRedirect("propertylist.jsp");
                JOptionPane.showMessageDialog(null,"Property Added."); 
            }
            else
            {
                response.sendRedirect("propertylist.jsp");
                JOptionPane.showMessageDialog(null,"Property Not Added."); 
            }
            
            out.println("</body>");
            out.println("</html>");
        } 
        finally 
        {            
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
        processRequest(request, response);
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
        processRequest(request, response);
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
