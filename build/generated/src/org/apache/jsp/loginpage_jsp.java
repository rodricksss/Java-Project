package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class loginpage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\" />\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\"> \n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"> \n");
      out.write("        <title>Login Page</title>\n");
      out.write("       \n");
      out.write("        <meta name=\"keywords\" content=\"css3, login, form, custom, input, submit, button, html5, placeholder\" />\n");
      out.write("        \n");
      out.write("        <link rel=\"shortcut icon\" href=\"../favicon.ico\"> \n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/stylelogin.css\"/>\n");
      out.write("\t\t<script src=\"js/modernizr.custom.63321.js\"></script>\n");
      out.write("\t\t<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->\n");
      out.write("\t\t<style>\n");
      out.write("\t\t\t@import url(http://fonts.googleapis.com/css?family=Ubuntu:400,700);\n");
      out.write("\t\t\tbody \n");
      out.write("                        {\n");
      out.write("\t\t\t\tbackground: url(images/blurred.jpg) no-repeat center top;\n");
      out.write("\t\t\t\t-webkit-background-size: cover;\n");
      out.write("\t\t\t\t-moz-background-size: cover;\n");
      out.write("\t\t\t\tbackground-size: cover;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\t.container > header h1,.container > header h2 \n");
      out.write("                        {\n");
      out.write("\t\t\t\tcolor: #fff;\n");
      out.write("\t\t\t\ttext-shadow: 0 1px 1px rgba(0,0,0,0.7);\n");
      out.write("\t\t\t}\n");
      out.write("\t\t</style>\n");
      out.write("                                    \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

                    response.setHeader("Cache-Control", "no-cache");
                    response.setHeader("Cache-Control", "no-store");
                    response.setHeader("Pragma", "no-cache");
                    response.setDateHeader("Expires", 0);

        
      out.write("\n");
      out.write("        \n");
      out.write("\n");
      out.write("        <div class=\"container\">\t\t\t\n");
      out.write("\t\t\t<section class=\"main\">\n");
      out.write("                            <form class=\"form-1\" action=\"LoginCheckServlet\" method=\"post\">\n");
      out.write("\t\t\t\t    <p class=\"clearfix\">\n");
      out.write("\t\t\t\t        <label for=\"login\">Username</label>\n");
      out.write("                                        <input type=\"text\" name=\"login\" id=\"login\"  value=\"Username\" autocomplete=\"off\" onfocus=\"if(this.value=='Username'){this.value='';}\" onblur=\"if(this.value==''){this.value='Username';}\">\n");
      out.write("\t\t\t\t    </p>\n");
      out.write("\t\t\t\t    <p class=\"clearfix\">\n");
      out.write("\t\t\t\t        <label for=\"password\">Password</label>\n");
      out.write("\t\t\t\t        <input type=\"password\" name=\"password\" id=\"password\" value=\"Password\" onfocus=\"if(this.value=='Password'){this.value='';}\" onblur=\"if(this.value==''){this.value='Password';}\"> \n");
      out.write("\t\t\t\t    </p>\n");
      out.write("\t\t\t\t    <p class=\"clearfix\">\n");
      out.write("                                        \n");
      out.write("\t\t\t\t        \n");
      out.write("\t\t\t\t    </p>\n");
      out.write("                                    \n");
      out.write("                                    <p class=\"clearfix\">\n");
      out.write("                                        <label for=\"forgot\"><a href=\"forgotpassword.jsp\">Forgot Password?</a></label>\n");
      out.write("                                    </p>\n");
      out.write("\t\t\t\t    <p class=\"clearfix\">\n");
      out.write("                                        <input type=\"submit\" name=\"submit\" value=\"Sign In\"/>\n");
      out.write("\t\t\t\t    </p> \n");
      out.write("                                    <p class=\"clearfix\">\n");
      out.write("                                        <label for=\"goto\"><a href=\"index.jsp\">Go To Home Page</a></label>\n");
      out.write("                                    </p>\n");
      out.write("\t\t\t\t</form>​\n");
      out.write("\t\t\t</section>\n");
      out.write("\t\t\t\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
