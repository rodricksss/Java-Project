<%-- 
    Document   : propertyviewbuyer
    Created on : 28 Apr, 2014, 12:21:40 PM
    Author     : sony
--%>

<%@page import="connections.MyConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property List</title>
        <script language="javascript" src="js/ajax.js" type="text/javascript"></script>
        <style>
            td
            {
                padding: 5px;
            }            
        </style>
    </head>
    <body>
        <%@include file="masterbuyer.jsp"%>

        <%

            try {

                String str = request.getParameter("button");

                RequestDispatcher rd = null;

                if (str.equals("View")) {
                    //response.sendRedirect("propertyviewdetails.jsp");
                    rd = request.getRequestDispatcher("propertyviewdetails.jsp");
                    rd.forward(request, response);
                    return;
                }
            } 
            catch (Exception ex) 
            {
                System.out.println(ex);
            }

        %>


        <%
            try {
                int catid = Integer.parseInt(request.getParameter("catid"));
                int subcatid = Integer.parseInt(request.getParameter("subcatid"));
                int stateid = Integer.parseInt(request.getParameter("stateid"));
                int cityid = Integer.parseInt(request.getParameter("cityid"));
                float pfrom = Float.parseFloat(request.getParameter("from"));
                float pto = Float.parseFloat(request.getParameter("to"));

                ResultSet rs = null;
                MyConnection.pst.close();
                MyConnection.pst = MyConnection.con.prepareStatement("select * from property where cat_id=? and subcat_id=? and state_id=? and city_id=? and price between ? and ? and know_status='not sold'");
                MyConnection.pst.setInt(1, catid);
                MyConnection.pst.setInt(2, subcatid);
                MyConnection.pst.setInt(3, stateid);
                MyConnection.pst.setInt(4, cityid);
                MyConnection.pst.setFloat(5, pfrom);
                MyConnection.pst.setFloat(6, pto);
                rs = MyConnection.pst.executeQuery();
        %>

        <div id="content-outer">
            <!-- start content -->
            <div id="content">

                <!--  start page-heading -->
                <div id="page-heading">
                    <h1>Property Found</h1>
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


                                    <form id="mainform" action="">
                                        <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                                            <thead>
                                                <tr>
                                                    <th class="table-header-repeat line-left"><a href="">S.No</a></th>
                                                    <th class="table-header-repeat line-left"><a href="">Image</a></th>
                                                    <th class="table-header-repeat line-left minwidth-1"><a href="">Address</a>	</th>
                                                    <th class="table-header-repeat line-left minwidth-1"><a href="">Price</a></th>
                                                    <th class="table-header-repeat line-left minwidth-1"><a href="">Status</a></th>                                                    
                                                    <th class="table-header-options"><a href="">View</a></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    int count = 0;
                                                    while (rs.next()) {
                                                        count++;
                                                %>

                                                <tr>
                                            <form action="propertyviewdetails.jsp" method="post">

                                                <td><%=count%></td>                                             
                                                <td>
                                                    <%
                                                        int x = rs.getInt("property_id");
                                                        String a = rs.getString("address_line").trim();
                                                    %> 
                                                    <img src="displayimageproperty.jsp?pid=<%=x%>" id="photo" height="140" width="200"/>
                                                </td>                                                                                    
                                                <td><%=a%></td>                                            
                                                <td><%=rs.getFloat("price")%></td>
                                                <td><%=rs.getString("know_status")%></td> 
                                                <input type="hidden" name="pid" value="<%=x%>"/> 
                                                                                           
                                                <td><input type="submit" name="button" value="View" class="btn btn-blue"/></td>
                                            </form>
                                            <%
                                                    }
                                                } catch (Exception ex) {
                                                    System.out.println(ex);
                                                } finally {
                                                    MyConnection.pst.close();
                                                }

                                            %>

                                            </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                        </body>
                                        </html>
