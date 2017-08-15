<%-- 
    Document   : findproperty
    Created on : 27 Apr, 2014, 7:07:27 PM
    Author     : sony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connections.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <%
                    response.setHeader("Cache-Control", "no-cache");
                    response.setHeader("Cache-Control", "no-store");
                    response.setHeader("Pragma", "no-cache");
                    response.setDateHeader("Expires", 0);
        %>
        <%@include file="masterbuyer.jsp" %>

        <div id="content-outer">
            <!-- start content -->
            <div id="content">

                <!--  start page-heading -->
                <div id="page-heading">
                    <h1>User</h1>
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


                                    <%!            
                                        ResultSet rs = null;
                                    %>
                                    <form action="propertyviewbuyer.jsp" method="post">
                                        <table>
                                            <tr><td><label>Category:</label></td><td><select name="catid" onchange="getsubcat(this.value)">
                                                        <option value="" disabled selected class="s">-- Select Category --</option>
                                                        <%
                                                            MyConnection.pst.close();
                                                            MyConnection.pst = MyConnection.con.prepareStatement("select * from category");
                                                            rs = MyConnection.pst.executeQuery();
                                                            while (rs.next()) {
                                                        %>
                                                        <option value="<%=rs.getInt("cat_id")%>"> <%= rs.getString("cat_name")%></option>
                                                        <%
                                                            }
                                                            MyConnection.pst.close();
                                                        %>
                                                    </select></td></tr>
                                            <tr><td><label>Sub-Category:</label></td>
                                                <td><select name="subcatid" id="txtSubCat">
                                                        <option value="" disabled selected class="s">-- Select Sub-Category --</option>
                                                    </select></td></tr>
                                            <tr><td><label>State:</label></td><td><select name="stateid" onchange="getcity(this.value)">
                                                        <option value="" disabled selected class="s">-- Select State --</option>
                                                        <%
                                                            MyConnection.pst.close();
                                                            MyConnection.pst = MyConnection.con.prepareStatement("select * from state");
                                                            rs = MyConnection.pst.executeQuery();
                                                            while (rs.next()) {
                                                        %>
                                                        <option value="<%=rs.getInt("state_id")%>"> <%= rs.getString("state_name")%></option>
                                                        <%
                                                            }
                                                            MyConnection.pst.close();
                                                        %>
                                                    </select></td></tr>
                                            <tr><td><label>City:</label></td>
                                                <td><select name="cityid" id="txtCity">
                                                        <option value="" disabled selected class="s">-- Select City --</option>
                                                    </select></td></tr>
                                            <tr><td><label>Choose Price Range:</label></td><td></td></tr>
                                            <tr><td><label>From:</label></td>
                                                <td><select name="from">
                                                        <option value="" disabled selected class="s">-- Select --</option>
                                                        <option value="100000.00">1 lakh</option>
                                                        <option value="5000000.00">50 lakh</option>
                                                        <option value="10000000.00">1 crore</option>
                                                        <option value="15000000.00">1.5 crore</option>
                                                        <option value="20000000.00">2 crore</option>
                                                    </select>
                                                </td></tr>
                                            <tr><td><label>To:</label></td>
                                                <td><select name="to">
                                                        <option value="" disabled selected class="s">-- Select --</option>
                                                        <option value="5000000.00">50 lakh</option>
                                                        <option value="10000000.00">1 crore</option>
                                                        <option value="150000000.00">1.5 crore</option>
                                                        <option value="200000000.00">2 crore</option>
                                                        <option value="250000000.00">2.5 crore</option>
                                                    </select>                        
                                                </td></tr>
                                        </table>     
                                        <br><input type="submit" value="Submit" class="btn btn-blue"/><br/><br/>

                                    </form>

                                </div>
                                <!--  end table-content  -->

                                <div class="clear"></div>

                            </div>
                            <!--  end content-table-inner ............................................END  -->
                        </td>
                        <td id="tbl-border-right"></td>
                    </tr>
                    <tr>
                        <th class="sized bottomleft"></th>
                        <td id="tbl-border-bottom">&nbsp;</td>
                        <th class="sized bottomright"></th>
                    </tr>
                </table>

                <div class="clear">&nbsp;</div>

            </div>
            <!--  end content -->
            <div class="clear">&nbsp;</div>
        </div>
        <!--  end content-outer........................................................END -->

        <div class="clear">&nbsp;</div>

    </body>
</html>


