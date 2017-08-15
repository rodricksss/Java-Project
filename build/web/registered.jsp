<%-- 
    Document   : registered
    Created on : 29 Apr, 2014, 4:04:10 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
        <link rel="shortcut icon" href="../favicon.ico"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Registration</title>
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
                        p
                        {
                            letter-spacing: 1px;
                            font-size: 24px;
                            text-shadow: 0 1px 0 #000;
                            color: white; 
                            margin-bottom: 30px;
                        }
                        p1
                        {  
                            font-family: sans-serif;
                            font-size: 16px;
                            margin-left: 155px;
                            margin-bottom: 5px;
                            color: wheat;
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

        <div class="pwd3">            
            <p align="center"><b>Registration Done</b></p>
            <p1><a href="loginpage.jsp"><b>Click Here To Login</b></a></p1>
        </div>
        
    </body>
</html>
