<%-- 
    Document   : forgotpassword
    Created on : 15 Apr, 2014, 11:06:00 AM
    Author     : sony
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connections.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
        <link rel="shortcut icon" href="../favicon.ico"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password Page 1</title>
        <link rel="stylesheet" type="text/css" href="css/stylelogin.css"/>
        <script src="js/modernizr.custom.63321.js"></script>
                <style>
                        @import url(http://fonts.googleapis.com/css?family=Ubuntu:400,700);
                        body 
                        {
				background: url(images/blurred.jpg) no-repeat center top;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				background-size: cover;
			}					
                </style>
    </head>
    <body>
        <%
            ResultSet rs;
            RequestDispatcher rd;
            try
            {           
                String email=request.getParameter("email");
                String uname=request.getParameter("uname");
                String str=request.getParameter("button");
                if(str.equals("Continue"))
                {
                    try
                    {
                        MyConnection.pst.close();
                        MyConnection.pst=MyConnection.con.prepareStatement("select * from admin where user_name=? and email_id=?");
                        MyConnection.pst.setString(1, uname);
                        MyConnection.pst.setString(2, email);                        
                        rs=MyConnection.pst.executeQuery();
                        if(rs.next())
                        {  
                            response.sendRedirect("forgotpasswordfinal.jsp");
                            session.setAttribute("uname", uname);
                            session.setAttribute("email", email);                            
                        }  
                        else
                        {
                            JOptionPane.showMessageDialog(null, "Incorrect Username or Email Id. Retry.");
                        }
                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                }
                if(str.equals("Go Back"))
                {
                    response.sendRedirect("loginpage.jsp");
                }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
        <div class="container">			
			<section class="main">
                            <form class="pwd1" action="" method="post">
                                    <p class="clearfix">
				        <label>Username</label>
				        <input type="text" name="uname" value="Username" autocomplete="off" onfocus="if(this.value=='Username'){this.value='';}" onblur="if(this.value==''){this.value='Username';}">
				    </p>
                                    
				    <p class="clearfix">
				        <label>Email Id</label>
				        <input type="text" name="email" value="Email Id" autocomplete="off" onfocus="if(this.value=='Email Id'){this.value='';}" onblur="if(this.value==''){this.value='Email Id';}">
				    </p>
				        
				    <p class="clearfix">
				        <input type="submit" name="button" value="Continue">   
                                        <input type="submit" name="button" value="Go Back">
				    </p> 
				</form>​
   			</section>
        
    </body>
</html>
