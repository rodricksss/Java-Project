<%-- 
    Document   : error
    Created on : 15 May, 2014, 7:38:00 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
        <link rel="shortcut icon" href="../favicon.ico"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
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
                            margin-left: 10px;
                            margin-bottom: 5px;
                            color: whitesmoke;
                        }
                </style>
    </head>
    <body>
        <div class="pwd3">            
            <p align="center"><b>Error</b></p>
            <p1><b>Message:</b> &nbsp; <font color="wheat"><%=request.getAttribute("ErrorMessage")%></font></p1>
            <br><br><p1><font color="wheat"><a style="font-style: oblique" href="forgotpassword.jsp">Click to Try Again</a></font></p1>
        </div>
    </body>
</html>