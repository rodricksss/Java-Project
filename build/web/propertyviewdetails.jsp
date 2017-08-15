<%-- 
    Document   : propertyviewdetails
    Created on : Apr 29, 2014, 3:51:47 PM
    Author     : sony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connections.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property Details</title>
        <script language="javascript" src="js/ajax.js" type="text/javascript"></script>
        <style>
            td
            {
                padding: 5px;
                width: 50px;
            }            
        </style>
    </head>
    <body>
        <%@include file="masterbuyer.jsp"%>
        <%           
            int id=Integer.parseInt(request.getParameter("pid").trim());
            System.out.println("@@@@@@"+id+"@@@@@@");
            ResultSet rs = null;
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("select * from property where property_id=?");
            MyConnection.pst.setInt(1, id);
            rs = MyConnection.pst.executeQuery();
        %> 
        
        <div id="content-outer">
            <!-- start content -->
            <div id="content">

                <!--  start page-heading -->
                <div id="page-heading">
                    <h1>Property Details</h1>
                </div>
                <!-- end page-heading -->

                <table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
                    <tr>
                        <th rowspan="3" class="sized"><img src="images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
                        <th class="topleft"></th>
                        <td id="tbl-border-top">&nbsp;</td>
                        <th class="topright"></th>
                        <th rowspan="3" class="sized"><img src="images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
                    </tr>
                    <tr>
                        <td id="tbl-border-left"></td>
                        <td>
                            <!--  start content-table-inner ...................................................................... START -->
                            <div id="content-table-inner">

                                <!--  start table-content  -->
                                <div id="table-content">
                                  
                                        <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                                            <thead>
                                                <tr>
                                                    <th class="table-header-repeat line-left"><a href="">S.No.</a></th>
                                                    <th class="table-header-repeat line-left"><a href="">Availability</a></th>
                                                    <th class="table-header-repeat line-left minwidth-1"><a href="">Address</a></th>
                                                    <th class="table-header-repeat line-left minwidth-1"><a href="">Area</a></th>
                                                    <th class="table-header-repeat line-left minwidth-1"><a href="">Price</a></th>
                                                    <th class="table-header-repeat line-left minwidth-1" style="width: 150px"><a href="">Describe</a></th>
                                                    <th class="table-header-repeat line-left minwidth-1"><a href="">Status</a></th>                                                    
                                                    <th class="table-header-options"><a href="">Buying</a></th>
                                                </tr>
                                            </thead>
                                                <tbody>
                                                    <%
                                                    int count = 0;
                                                    while (rs.next()) 
                                                    {
                                                        count++;                                                                                                               
                                                    %>                                                     
                                        <tr>             
					<form action="MailingServlet" method="post">                                            
                                            <td><%=count%></td>
                                            <input type="hidden" name="propertyid" value="<%=rs.getInt("property_id")%>"/>
                                            <td><%=rs.getString("available_option")%></td>
                                            <td><%=rs.getString("address_line")%></td>
                                            <td><%=rs.getString("area")%></td>
                                            <td><%=rs.getFloat("price")%></td>
                                            <td><%=rs.getString("describe")%></td>
                                            <td><%=rs.getString("know_status")%></td>                                 
                                            <td><input type="submit" name="button" value="Buy" class="btn btn-blue"/></td>                                                                                 
                                       </form>
                                                <%                               
                                                    }
                                                    MyConnection.pst.close();                                                   
                                                %>                                                
                                                                                 
                                       </tr>
                                       </tbody>
                                       </table>                                                
                                  
                                           <form action="findproperty.jsp" method="post">
                                                    <br/><input type="submit" value="Back" class="btn btn-blue"/><br/><br/>
                                           </form>
                                     
                                        <form id="mainform" action="">
                                        <table border="0" width="40%" cellpadding="0" cellspacing="0" id="product-table">
                                            <thead>
                                                <tr>                                                    
                                                    <th class="table-header-repeat line-left"><a href="">Serial Order</a></th>
                                                    <th class="table-header-repeat line-left minwidth-1"><a href=""> Property Image</a></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                            <%
                            try 
                            {
                            MyConnection.pst.close();
                            MyConnection.pst = MyConnection.con.prepareStatement("select * from images where property_id=?");
                            MyConnection.pst.setInt(1, id);
                         
                            rs = MyConnection.pst.executeQuery();
                            int sno = 0;
                            while (rs.next()) 
                            {
                                sno++;
                                int y=rs.getInt("image_id");
                                System.out.println(y);                                
                            %>           
                            <tr>             
                                <td><%=sno%></td>
                                <td align="center"><img src="image.jsp?imgid=<%=y%>" id="photo" width="200" height="140"></td>                    
                            </tr>                                               
                        <%
                            }
                                rs.close();  
                                MyConnection.pst.close();
                            } 
                            catch(Exception e) 
                            {
                                e.getMessage();
                            }
                        %>
                         </tbody>
                        </table>
                        </form> 
                    </tr>
                    </table>
             </div>
        </div>                   
</body>
</html>
