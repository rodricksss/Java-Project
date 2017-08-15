<%-- 
    Document   : ownerslist
    Created on : 18 Apr, 2014, 7:25:04 PM
    Author     : Mannu
--%>
<%@page import="connections.MyConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Portal</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <%@include file="master.jsp" %>
         <%
            try {
                RequestDispatcher rd = null;
                String str = request.getParameter("button1");

                if (str.equals("View")) {
                    rd = request.getRequestDispatcher("sellerview.jsp");
                    rd.forward(request, response);
                }

                if (str.equals("Delete")) 
                {
                    rd = request.getRequestDispatcher("SellerDeleteServlet");
                    rd.forward(request, response);
                }
            } 
            catch (Exception ex) 
            {
              //  out.println(ex);
            }
        %>

        
        <%
            ResultSet rs = null;
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("select * from seller");
            rs = MyConnection.pst.executeQuery();
        %>
        
        <div id="content-outer">
<!-- start content -->
<div id="content">

	<!--  start page-heading -->
	<div id="page-heading">
		<h1>Administrator </h1>
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
					<th class="table-header-repeat line-left minwidth-1"><a href="">First Name</a>	</th>
					<th class="table-header-repeat line-left minwidth-1"><a href="">Last Name</a></th>
					<th class="table-header-repeat line-left minwidth-1"><a href="">User Name</a></th>
					<th class="table-header-repeat line-left minwidth-1"><a href="">Password</a></th>
					<th class="table-header-repeat line-left minwidth-1"><a href="">Email</a></th>
					<th class="table-header-repeat line-left minwidth-1"><a href="">Mobile</a></th>
                                        <th class="table-header-options"><a href="">View</a></th>
                                        <th class="table-header-options"><a href="">Delete</a></th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <%
                                    int count=0;
                                     while(rs.next())
                                     {
                                         count++;
                                 %>
				<tr>
					<form action="" method="post">
                        
                                            <input type="hidden" name="sellerid" value="<%=rs.getInt("seller_id")%>"/>
                                            <td><%=count%></td>
                                            <td><%=rs.getString("f_name")%></td>
                                            <td><%=rs.getString("l_name")%></td>
                                            <td><%=rs.getString("user_name")%></td>
                                            <td><%=rs.getString("user_pass")%></td>
                                            <td><%=rs.getString("email_id")%></td>
                                            <td><%=rs.getString("mobile_no")%></td>
                                            <td><input type="submit" name="button1" value="View" class="btn btn-blue"/></td>
                                            <td><input type="submit" name="button1" value="Delete" class="btn btn-blue"/></td>  
                                        </form>
                                            <%
                                                }
                                            %>
                                </tr>
                                
                                </tbody>
				
				</table>
				<!--  end product-table................................... --> 
				</form>
			<table>
                            <thead>
                                <th>
                                    <form action="sellerreg.jsp" method="post">
                                        <input type="submit" value="Add New Seller" style="margin-left:550px; width: 200px" class="btn btn-blue"/>
                                    </form>
                                </th>
                            </thead>
                        </table>
			
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
