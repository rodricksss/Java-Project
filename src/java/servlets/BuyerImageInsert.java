/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import connections.MyConnection;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sony
 */
public class BuyerImageInsert extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession sess=request.getSession();
        try 
        {
            String contentType = request.getContentType();
            if ((contentType != null) && (contentType.indexOf("multipart/form-data")>=0)) 
            {
                DataInputStream in = new DataInputStream(request.getInputStream());
                int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                while (totalBytesRead < formDataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
                }
                String file = new String(dataBytes);
                String saveFile = file.substring(file.indexOf("filename=\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1, contentType.length());
                int pos;
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                File usedFile = new File(saveFile);
                String nm = usedFile.getName();
                File newFile = new File(nm);
                String renamedFile = newFile.getName();
                usedFile.renameTo(newFile);
                FileOutputStream fileOut = new FileOutputStream(renamedFile);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close();
                //out.println("File upload with file name" + renamedFile);
                FileInputStream fis;
                try {
                    File f = new File(renamedFile);
                    
                    MyConnection.pst.close();
                    MyConnection.pst = MyConnection.con.prepareStatement("update buyer set pics=? where buyer_id=?");
                    fis = new FileInputStream(f);
                    MyConnection.pst.setBinaryStream(1, (InputStream) fis, (int) (f.length()));
                    MyConnection.pst.setInt(2, (Integer)sess.getAttribute("buyer_id"));
                    int s = MyConnection.pst.executeUpdate();
                    if (s > 0) 
                    {                        
                        response.sendRedirect("buyerprofile.jsp");                        
                    } 
                    else 
                    {
                        out.println("Unsucessful to upload file.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        } catch (Exception ex) {
            out.println(ex);
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
