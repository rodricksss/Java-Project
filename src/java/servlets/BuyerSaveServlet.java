/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.BuyerBean;
import connections.BuyerModel;
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
public class BuyerSaveServlet extends HttpServlet {

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
            String mobile = request.getParameter("mobile").trim();
            String landline = request.getParameter("landline").trim();
            String gender = request.getParameter("gender").trim();
            String dob = request.getParameter("dob").trim();
            String answer = request.getParameter("answer").trim();
            int planid=Integer.parseInt(request.getParameter("planid").trim());
            int secid=Integer.parseInt(request.getParameter("secid").trim());
            int cityid=Integer.parseInt(request.getParameter("cityid").trim());
            int stateid=Integer.parseInt(request.getParameter("stateid").trim());
                        
            RequestDispatcher rd = null;

            BuyerBean bb = new BuyerBean();
            bb.setFname(fname);
            bb.setLname(lname);
            bb.setUname(uname);
            bb.setUpass(upass);
            bb.setEmail(email);
            bb.setAdd1(add1);
            bb.setAdd2(add2);
            bb.setMobile(mobile);
            bb.setLandline(landline);
            bb.setGender(gender);
            bb.setDob(dob);
            bb.setAnswer(answer);
            bb.setStateid(stateid);
            bb.setCityid(cityid);
            bb.setPlanid(planid);
            bb.setSecid(secid);

            BuyerModel bm = new BuyerModel();
            boolean flag = bm.buyerInsert(bb);
            
            if (flag) 
            {
                response.sendRedirect("buyerslist.jsp");
                JOptionPane.showMessageDialog(null,"Buyer Added");   
            } 
            else 
            {
                response.sendRedirect("buyerslist.jsp");
                JOptionPane.showMessageDialog(null,"Buyer Not Added");
            }

            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyerSaveServlet</title>");            
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
