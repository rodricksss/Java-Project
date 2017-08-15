/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.SellerBean;
import connections.SellerModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author sony
 */
public class SellerSaveServlet extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
            
            String fname = request.getParameter("fname").trim();
            String lname = request.getParameter("lname").trim();
            String uname = request.getParameter("uname").trim();
            String upass = request.getParameter("upass").trim();
            String email = request.getParameter("email").trim();
            String add1 = request.getParameter("add1").trim();
            String add2 = request.getParameter("add2").trim();
            int stateid=Integer.parseInt(request.getParameter("stateid").trim());
            int cityid=Integer.parseInt(request.getParameter("cityid").trim());
            String mobile = request.getParameter("mobile").trim();
            String landline = request.getParameter("landline").trim();
            String gender = request.getParameter("gender").trim();
            String dob = request.getParameter("dob").trim();
            int planid=Integer.parseInt(request.getParameter("planid"));
            String answer = request.getParameter("answer").trim();
            int secid=Integer.parseInt(request.getParameter("secid"));
            
            RequestDispatcher rd = null;

            SellerBean sb = new SellerBean();
            sb.setFname(fname);
            sb.setLname(lname);
            sb.setUname(uname);
            sb.setUpass(upass);
            sb.setEmail(email);
            sb.setAdd1(add1);
            sb.setAdd2(add2);
            sb.setMobile(mobile);
            sb.setLandline(landline);
            sb.setGender(gender);
            sb.setDob(dob);
            sb.setAnswer(answer);
            sb.setCityid(cityid);
            sb.setStateid(stateid);
            sb.setPlanid(planid);
            sb.setSecid(secid);

            SellerModel sm = new SellerModel();
            boolean flag = sm.sellerInsert(sb);

            if (flag) 
            {                                      
                response.sendRedirect("ownerslist.jsp");
                JOptionPane.showMessageDialog(null,"Seller Added");                
            } 
            else 
            {
                response.sendRedirect("ownerslist.jsp");
                JOptionPane.showMessageDialog(null,"Seller Not Added");
            }


            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SellerSaveServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
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
