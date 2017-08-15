<%-- 
    Document   : categoryreg
    Created on : 19 Apr, 2014, 1:20:21 AM
    Author     : Mannu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Portal</title>
        <style>
            td
            {
                font-size: 14px;
                padding: 5px;
            }
            
        </style>
    </head>
    <body>
        <%@include file="master.jsp" %>
         
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
        <form action="CategorySaveServlet" method="post">
            <table>
                <tr><td><label>Category Name:</label></td><td><input type="text" name="category" value=""/></td></tr>
            </table>
            <br><input type="submit" value="Submit" class="btn btn-blue"/><br/><br/>            
        </form>

                            </form>
                            <form action="categorylist.jsp" method="post">
                                <input type="submit" value="Back" class="btn btn-blue"/>
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
