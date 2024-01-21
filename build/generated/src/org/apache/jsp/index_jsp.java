package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.DAOCliente;
import modelo.Cliente;
import modelo.Modelo;
import modelo.DAOModelo;
import java.util.List;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");

DAOModelo objDAOModelo = new DAOModelo();
List<Modelo> listaModelo = objDAOModelo.listarModelo();
DAOCliente daoCliente = new DAOCliente();
List<Cliente> listaCliente = daoCliente.getLista();
String user = "Login";
String nome = "Login",email = "",sobrenome="",cpf="",pix="",senha="";
if(session.getAttribute("user")!=null)
    {
        user = session.getAttribute("user").toString();
        for(Cliente cliente:listaCliente){
            if(user.equals(String.valueOf(cliente.getCodigo()))){
                nome = cliente.getNome();
                email = cliente.getEmail();
                sobrenome = cliente.getSobrenome();
                cpf = cliente.getCpf();
                pix = cliente.getPix();
                senha = cliente.getSenha();
                }
            }
    }

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Hello World</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"img/logoIF.png\" type=\"image/x-icon\"> \n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/all.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/estilo.css\">\n");
      out.write("          \n");
      out.write("\t<!--Javascript-->\n");
      out.write("\t<script src=\"js/bootstrap.bundle.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        body{\n");
      out.write("            background-image: url(\"img/fundo2.jpg\");\n");
      out.write("            background-repeat: no-repeat;\n");
      out.write("            background-size: cover;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <body>    \n");
      out.write("        <header>\n");
      out.write("\t\t<nav class=\"navbar navbar-expand-md px-4 bg-black\">\n");
      out.write("\t\t\t<div class=\"navbar-brand\">\n");
      out.write("                            <a href=\"index.jsp\"><img src=\"img/logo.png\" alt=\"logo png\" class=\"logopngif\"></a>\n");
      out.write("\t\t\t</div >\n");
      out.write("\t\t\t<button class=\"navbar-toggler\" data-bs-toggle=\"collapse\" data-bs-target=\"#menubar\"><span class=\"fa-solid fa-bars\"></span></button>\n");
      out.write("\n");
      out.write("\t\t\t<div class=\"collapse navbar-collapse\" id=\"menubar\">\n");
      out.write("\t\t\t<ul class=\"navbar-nav\">\n");
      out.write("                            <li class=\"nav-item\"><a href=\"index.jsp\" class=\"nav-link text-white\">Home</a></li>\n");
      out.write("\t\t\t\t<li class=\"nav-item dropdown\">\n");
      out.write("\t\t\t\t\t<a href=\"#\" class=\"nav-link text-white dropdown-toggle\" data-bs-toggle=\"dropdown\">Modelos</a>\n");
      out.write("\t\t\t\t<ul class=\"dropdown-menu p-3\">\n");
      out.write("                                    <li><a href=\"cadastroCidade.jsp\"class=\"dropdown-item text-white\">Cidade</a></li>\n");
      out.write("                                    <li><a href=\"cadastroFuncionario.jsp\"class=\"dropdown-item text-white\">Funcionários</a></li>\n");
      out.write("                                    <li><a href=\"cadastroProdutos.jsp\"class=\"dropdown-item text-white\">Produtos</a></li>\n");
      out.write("                                    <li><a href=\"cadastroVeiculos.jsp\"class=\"dropdown-item text-white\">Transporte TESTE</a></li>\n");
      out.write("                                    <li><a href=\"cadastroCliente.jsp\"class=\"dropdown-item text-white\">Clientes</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li class=\"nav-item dropdown\"><a href=\"#\" class=\"nav-link text-white dropdown-toggle\" data-bs-toggle=\"dropdown\">Caminhões</a>\n");
      out.write("\t\t\t\t<ul class=\"dropdown-menu\">\n");
      out.write("                                        ");
 for(Modelo modelo:listaModelo){
      out.write("\n");
      out.write("\t\t\t\t\t<li><a href=\"https://www.caminhoesecarretas.com.br/venda/caminhao/");
      out.print( modelo.getModelo() );
      out.write("/marca/");
      out.print( modelo.getCodigo() );
      out.write("\"class=\"dropdown-item text-white\">");
      out.print(modelo.getModelo());
      out.write("</a></li>\n");
      out.write("                                        ");
}
      out.write("\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("                                <li class=\"nav-item\"><a href=\"loja.jsp\" class=\"nav-link text-white\">Loja</a></li>\n");
      out.write("                                <li class=\"nav-item\"><a href=\"login.jsp\" class=\"nav-link text-white\">");
      out.print( nome );
      out.write("</a></li>\n");
      out.write("\t\t\t</ul>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t</nav>\n");
      out.write("        </header>\n");
      out.write("        <h1 style=\"text-align: center\">HOME</h1>\n");
      out.write("    </body>\n");
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
