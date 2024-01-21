package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Menu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html lang=\"pt-br\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Estudo de Caso</title>\n");
      out.write("        <!-- Aqui chamamos o nosso arquivo css externo -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\"  href=\"conf/estilo.css\" />\n");
      out.write("        <!--[if lte IE 8]>\n");
      out.write("     <script src=\"http://html5shim.googlecode.com/svn/trunk/html5.js\"></script>\n");
      out.write("     <![endif]-->   \n");
      out.write("        \n");
      out.write("        \n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"css/font-awesome.css\">\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"css/fsbanner.css\">\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"css/countdown.css\">\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"css/animate.css\">\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"css/hover.css\">\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"css/menu.css\">\n");
      out.write("\n");
      out.write("\t\t<script src=\"js/jquery.js\"></script>\n");
      out.write("\t\t<script src=\"js/popper.js\"></script>\n");
      out.write("\t\t<script src=\"js/bootstrap.js\"></script>\n");
      out.write("\t\t<script src=\"js/fsbanner.js\"></script>\n");
      out.write("\t\t<script src=\"js/jquery.downCount.js\"></script>\n");
      out.write("\t\t<script src=\"js/smooth_navigation.js\"></script>\n");
      out.write("\t\t<script src=\"js/wow.min.js\"></script>\n");
      out.write("\t\t<script src=\"js/backtotop.js\"></script>\n");
      out.write("\t\t\n");
      out.write("                <script src=\"js/validadados.js\"></script>\n");
      out.write("\t\t\n");
      out.write("                \n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <img src=\"imagens/logo.jpg\" width=\"500\" height=\"115\" alt=\"logo\"/>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <nav>\n");
      out.write("\n");
      out.write("           \n");
      out.write("                 <ul class=\"menu\">\n");
      out.write("                <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                <li><a href=\"#\">Cadastro</a>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"CadastroCidade.jsp\">Cidade</a></li>\n");
      out.write("                        <li><a href=\"CadastroFuncionario.jsp\">Funcionário</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li><a href=\"#\">Relatórios</a> \n");
      out.write("                    <ul>\n");
      out.write("                        <li><a target=\"blank\" href=\"RelatorioCidade.jsp\">Cidade</a></li>\n");
      out.write("                        <li><a target=\"blank\" href=\"RelatorioFuncionario.jsp\" >Funcionário</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li><a href=\"Contato.jsp\">Contato</a></li>                \n");
      out.write("                <li><a href=\"Sobre.jsp\">Sobre</a></li> \n");
      out.write("                  \n");
      out.write("                    ");
 if (session.getAttribute("nome") != null) {
      out.write("\n");
      out.write("                    <li>\n");
      out.write("                    Bem Vindo, ");
      out.print( session.getAttribute("nome"));
      out.write("\n");
      out.write("                    <a href=\"logoff.jsp\">logoff</a>\n");
      out.write("                     </li>\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("               \n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("    </body>\n");
      out.write("    <br>\n");
      out.write("</html>\n");
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
