<%-- 
    Document   : buyerprofile
    Created on : 25 Apr, 2014, 1:42:15 PM
    Author     : Neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
    </head>
    <body>
      <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
      
        <%@include file="masterbuyer.jsp" %>
        <%
            HttpSession sess = request.getSession();
        %>
        <div id="content-outer">
<!-- start content -->
<div id="content">

	<!--  start page-heading -->
	<div id="page-heading">
		<h1>Buyer</h1>
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
			<h2>   <img src="BuyerImageDisplay" id="photo" height="130" width="130" alt="images/imageicon.jpg"/>
            <form enctype="multipart/form-data" action="BuyerImageInsert" method="post">
            <input type="file" name="file"/>
          <input type="submit" name="submit" value="Upload" class="btn btn-blue"/> </h2>
                       <b>Username: </b><h3><%=sess.getAttribute("buyerid")%></h3>
                       <b>Session Id: </b><h3><%=sess.getId()%></h3>
                        Hello <b>User</b>!!!<br/>
                        Welcome to <b>ThinkAHome</b><br/><br/>
                         We assure you that it is a unique experience for you to use this particular module.<br/>
                        A specially designed panel for your ease.<br/><br/>
			
                        This allows you to buy the existing properties according to the requirements felt necessary.<br/><br/>		
			
                        As per the plan selected by you, you can access your account only within the bounds of the duration allocated.<br/>
                        You can buy as many properties as you want but when your plan expires then you have to renew your plan or otherwise your account will be deactivated.
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
