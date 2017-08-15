<%-- 
    Document   : planselect
    Created on : 19 Apr, 2014, 2:18:53 PM
    Author     : sony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connections.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plan Selection Page</title>
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/stylelogin.css"/>
		<script src="js/modernizr.custom.63321.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
		<style>
			@import url(http://fonts.googleapis.com/css?family=Ubuntu:400,700);
			body 
                        {
				background: url(images/blurred.jpg) no-repeat center top;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				background-size: cover;
			}                      
                        td 
                        {
                            padding: 30px;
                        }
                        #division
                        {
                            height: 65%;
                            width: 75%;
                            margin: 0px auto;
                            margin-top: 30px; 
                            border-radius: 0.2em; 
                        }
                        p
                        {
                            letter-spacing: 1px;
                            font-size: 24px;
                            text-shadow: 0 1px 0 #000;
                            color: white;   
                        }
                        ul
                        {
                            font-style: oblique; 
                            margin-left: 30px;
                            margin-top: 20px;
                            margin-right: 10px;
                            
                        }
                        li
                        {
                            margin-bottom: 10px;
                        }  
                        p1
                        {  
                            margin-left: 40px;
                            margin-bottom: 5px;
                            color: whitesmoke;
                        }
                        #cost
                        {                           
                            margin-top: 10px;
                            width: 30%;
                        }
                        #duration
                        {
                            width: 30%;
                        }
                        
                        input[type=submit]
                        {
                            margin-left: 3px;
                            font-family: 'Patua One', cursive;
                            color: #fff;
                            width: 100px;
                            height: 2.8em;
                            font-size: 1.00em;
                            padding: 0.5em;
                            letter-spacing: 0.05em;
                            text-transform: none;
                            background: #ce2700;
                            border-radius: 3px;
                            box-sizing: border-box;                            
                            cursor: pointer;
                            appearance: button;
                            
                        }
                        input[type=submit]:hover
                        {
                            background: #333 !important;
                            color: whitesmoke;
                        }
                      
                                            
		</style>
    </head>
    <body>
               
        <%
            RequestDispatcher rd;
            HttpSession sess=request.getSession(true);
   
            try
            {
                String str=request.getParameter("button");
                int st=Integer.parseInt(request.getParameter("identity"));
                if(st==1)
                {    
                    sess.setAttribute("identity", st);
                    if(str.equals("Select"))
                    {                        
                        rd=request.getRequestDispatcher("registration.jsp");
                        rd.forward(request, response);
                        return;
                    }
                }
                if(st==2)
                {   
                    sess.setAttribute("identity", st);
                    if(str.equals("Select"))
                    {                        
                        rd=request.getRequestDispatcher("registration.jsp");
                        rd.forward(request, response); 
                        return;
                    }                    
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        %>
        <%
            ResultSet rs=null;
        %>
        <table style="margin: 0px auto">
            <tr><td>
       
                <form class="form-2" action="" method="post">
        
                    <div id="division" style="background-color: #b288ab">
                        <p align="center"><b>Silver Plan</b></p>
                        <ul>
                            <b>
                            <li>This plan is free of cost for 1 month.</li>
                            <li>Customer can benefit from it.</li>
                            <li>Benefits to view various properties of interest.</li>
                            <li>Getting latest updates regarding lease/sale of land/property.</li>
                            <li>Make changes to personal profile.</li>
                            </b>
                        </ul>                      
                    </div>
                    <%
                        MyConnection.pst.close();
                        MyConnection.pst=MyConnection.con.prepareStatement("select * from plans where plan_name='silver'");
                        rs=MyConnection.pst.executeQuery();
                        while(rs.next())
                        {
                    %>
                    
                    <input type="hidden" value="<%=rs.getInt("plan_id")%>" name="planid"/>
                    <p1><b>Cost:</b></p1> &nbsp;<input type="text" id="cost" value="<%=rs.getFloat("cost")%>" disabled/><br/><br/>
                    <p1><b>Duration:<b></p1> &nbsp;<input type="text" id="duration" value="<%=rs.getString("duration")%>" disabled/><br/><br/>
                    <%
                        }                        
                    %>                   
                    <p3><img src="images/button.png" style="margin-left: 40%; float: left"/>
                  
                        <input type="submit" value="Select" name="button"/>
                    </p3>
                </form>        
            </td>
            <td>
        		
            
                <form class="form-3" action="https://www.paypal.com/cgi-bin/webscr" method="post">
                    <div id="division" style="background-color: goldenrod">
                        <p align="center"><b>Golden Plan</b><p>
                            <ul>
                            <b>
                            <li>This plan is not free of cost. Required charges mentioned below.</li>
                            <li>Customer can benefit from it.</li>
                            <li>Benefits to view various properties of interest.</li>
                            <li>Interaction amongst buyers and owners.</li>
                            <li>Make changes to personal profile.</li>
                            </b>
                        </ul>                        
                    </div> 
                    <%
                        MyConnection.pst.close();
                        MyConnection.pst=MyConnection.con.prepareStatement("select * from plans where plan_name='golden'");
                        rs=MyConnection.pst.executeQuery();
                        while(rs.next())
                        {
                    %> 
                        <input type="hidden" value="<%=rs.getInt("plan_id")%>" name="planid"/>
                        <%
                            float price=rs.getFloat("cost");
                            String duration=rs.getString("duration").trim();                            
                        %>
                        <input type="hidden" name="cmd" value="_xclick"/>
                        <input type="hidden" name="business" value="accounts@freelanceswitch.com"/>
                        <input type="hidden" name="duration" value="<%=duration%>"/>
                        <input type="hidden" name="amount" value="<%=price%>">
                        <p1><b>Cost:</b></p1> &nbsp;<input type="text" id="cost" value="<%=price%>" disabled/><br/><br/>
                        <p1><b>Duration:<b></p1> &nbsp;<input type="text" id="duration" value="<%=duration%>" disabled/><br/><br/>
                        <input type="hidden" name="currency_code" value="USD">
                        <input type="hidden" name="return_url" value="">
                        <input type="hidden" name="cancel_url" value="">
                    <%
                        }                        
                    %>
                    <p3><img src="images/button.png" style="margin-left: 40%; float: left"/>
                            <input type="submit" value="Select" name="button1"/>
                        </p3>
                </form>            
        
            </td>          
            <td>           
                <form class="form-4" action="https://www.paypal.com/cgi-bin/webscr" method="post">
                    <div id="division" style="background-color: #51cbee">
                        <p align="center"><b>Platinum Plan</b></p>
                        <ul>
                            <b>
                            <li>This plan is not free of cost. Required charges mentioned below.</li>
                            <li>Customer can benefit from it.</li>
                            <li>Benefits to view various properties of interest.</li>
                            <li>Interaction amongst buyers and owners.</li>
                            <li>Make changes to personal profile.</li>
                            <l1>Share pictures/videos related to asset.</l1>
                            </b>
                        </ul>                        
                    </div> 
                    <%
                        MyConnection.pst.close();
                        MyConnection.pst=MyConnection.con.prepareStatement("select * from plans where plan_name='platinum'");
                        rs=MyConnection.pst.executeQuery();
                        while(rs.next())
                        {
                    %> 
                        <input type="hidden" value="<%=rs.getInt("plan_id")%>" name="planid"/>
                        <%
                            float price=rs.getFloat("cost");
                            String duration=rs.getString("duration").trim();                            
                        %>
                        <input type="hidden" name="cmd" value="_xclick"/>
                        <input type="hidden" name="business" value="accounts@freelanceswitch.com"/>
                        <input type="hidden" name="duration" value="<%=duration%>"/>
                        <input type="hidden" name="amount" value="<%=price%>">
                        <p1><b>Cost:</b></p1> &nbsp;<input type="text" id="cost" value="<%=price%>" disabled/><br/><br/>
                        <p1><b>Duration:<b></p1> &nbsp;<input type="text" id="duration" value="<%=duration%>" disabled/><br/><br/>
                        <input type="hidden" name="currency_code" value="USD">
                        <input type="hidden" name="return_url" value="">
                        <input type="hidden" name="cancel_url" value="">
                    <%
                        }                        
                    %>
                    <p3><img src="images/button.png" style="margin-left: 40%; float: left"/>
                    <input type="submit" value="Select" name="button2"/></p3>
                </form>        
        
            </td></tr>
        </table>
    </body>
</html>
