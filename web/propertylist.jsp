<%-- 
    Document   : propertylist
    Created on : 25 Apr, 2014, 1:58:01 PM
    Author     : Neha
--%>

<%@page import="connections.MyConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property List</title>
    </head>
    <body>
        
        <%@include file="masterseller.jsp" %>
        
        <%!    
            ResultSet rs = null;
            int seller_id=0;            
        %>
        
        <%   
            HttpSession sess=request.getSession();
            int seller_id=(Integer)sess.getAttribute("seller_id");
            try 
            {
                RequestDispatcher rd = null;
                String str = request.getParameter("button1");

                if (str.equals("View")) {
                    rd = request.getRequestDispatcher("propertyview.jsp");
                    rd.forward(request, response);
                    return;
                }

                if (str.equals("Delete")) 
                {
                    rd = request.getRequestDispatcher("PropertyDeleteServlet");
                    rd.forward(request, response);
                    return;
                }
                
                if (str.equals("Add Pictures")) 
                {
                    rd = request.getRequestDispatcher("addpropertypics.jsp");
                    rd.forward(request, response);
                    return;
                }
            } 
            catch (Exception ex) 
            {
              //out.println(ex);
            }
        %>

        
        <%
            ResultSet rs = null;
            
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("select p.property_id, c.cat_name, sc.subcat_name, st.state_name, ct.city_name, p.seller_id from property p "
                    + "join category c on p.cat_id=c.cat_id "
                    + "join subcategory sc on p.subcat_id=sc.subcat_id "
                    + "join state st on p.state_id=st.state_id "
                    + "join city ct on p.city_id=ct.city_id where p.seller_id=?");
            MyConnection.pst.setInt(1, seller_id);
            rs = MyConnection.pst.executeQuery();
            //rs.next();
        %>
        
        <div id="content-outer">
<!-- start content -->
<div id="content">

	<!--  start page-heading -->
	<div id="page-heading">
		<h1>User </h1>
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
					<th class="table-header-repeat line-left minwidth-1"><a href="">Category</a>	</th>
					<th class="table-header-repeat line-left minwidth-1"><a href="">Sub-Category</a></th>
					<th class="table-header-repeat line-left minwidth-1"><a href="">State</a></th>
					<th class="table-header-repeat line-left minwidth-1"><a href="">City</a></th>
									
                                        <th class="table-header-options"><a href="">View</a></th>
                                        <th class="table-header-options"><a href="">Delete</a></th>
                                        <th class="table-header-options"><a href="">Pictures</a></th>
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
                        
                                            <input type="hidden" name="propertyid" value="<%=rs.getInt(1)%>"/>
                                            <td><%=count%></td>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%=rs.getString(3)%></td>
                                            <td><%=rs.getString(4)%></td>
                                            <td><%=rs.getString(5)%></td>
                                            <input type="hidden" name="sellerid" value="<%=rs.getInt(6)%>"/>
                                            
                                            <td><input type="submit" name="button1" value="View" class="btn btn-blue"/></td>
                                            <td><input type="submit" name="button1" value="Delete" class="btn btn-blue"/></td>  
                                            <td><input type="submit" name="button1" value="Add Pictures" class="btn btn-blue" style="width: 80%"/></td>  
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
                                    <form action="propertyreg.jsp" method="post">
                                        <input type="submit" value="Add New Property" style="margin-left:550px; width: 200px" class="btn btn-blue"/>
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
