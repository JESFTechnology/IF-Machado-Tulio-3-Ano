package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Modelo;
import modelo.DAOModelo;
import modelo.Cidade;
import java.util.List;
import modelo.DAOCidade;

public final class cadastroCidade_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/listarCidade.jsp");
  }

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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

    String mensagem = request.getParameter("mensagem");
    String nomeCidade = request.getParameter("nomeCidade");
    String ufCidade = request.getParameter("ufCidade");
    String codigoCidade = request.getParameter("codigoCidade");
    if(codigoCidade==null)
    {
        codigoCidade ="0";
    }
    String opcao = request.getParameter("opcao");
    if(opcao==null){
        opcao="cadastrar";
    }
    

    DAOModelo objDAOModelo = new DAOModelo();
    List<Modelo> listaModelo = objDAOModelo.listarModelo();
    


      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"img/logoIF.png\" type=\"image/x-icon\">\n");
      out.write("        <!--CSS-->\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/all.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/estilo.css\">\n");
      out.write("          \n");
      out.write("\t<!--Javascript-->\n");
      out.write("\t<script src=\"js/bootstrap.bundle.js\"></script>\n");
      out.write("          \n");
      out.write("        <title>JSP Cidade</title>\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        body{\n");
      out.write("            background-image: url(\"img/fundo2.jpg\");\n");
      out.write("            background-repeat: no-repeat;\n");
      out.write("            background-size: cover;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("         <header>\n");
      out.write("\t\t<nav class=\"navbar navbar-expand-md .px-4 bg-black\">\n");
      out.write("\t\t\t<div class=\"navbar-brand\">\n");
      out.write("                            <a href=\"index.jsp\"><img src=\"img/logoIF.png\" alt=\"logo png\" class=\"logopngif\"></a>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<button class=\"navbar-toggler\" data-bs-toggle=\"collapse\" data-bs-target=\"#menubar\"><span class=\"fa-solid fa-bars\"></span></button>\n");
      out.write("\n");
      out.write("\t\t\t<div class=\"collapse navbar-collapse\" id=\"menubar\">\n");
      out.write("\t\t\t<ul class=\"navbar-nav bg-black\">\n");
      out.write("                            <li class=\"nav-item\"><a href=\"index.jsp\" class=\"nav-link text-white\">Home</a></li>\n");
      out.write("\t\t\t\t<li class=\"nav-item dropdown bg-black\">\n");
      out.write("\t\t\t\t\t<a href=\"#\" class=\"nav-link text-white dropdown-toggle\" data-bs-toggle=\"dropdown\">Modelos</a>\n");
      out.write("                                <ul class=\"dropdown-menu p-3 bg-black\">\n");
      out.write("                                    <li><a href=\"cadastroCidade.jsp\"class=\"dropdown-item text-white\">Cidade</a></li>\n");
      out.write("                                    <li><a href=\"cadastroFuncionario.jsp\"class=\"dropdown-item text-white\">Funcionários</a></li>\n");
      out.write("                                    <li><a href=\"cadastroProdutos.jsp\"class=\"dropdown-item text-white\">Produtos</a></li>\n");
      out.write("                                    <li><a href=\"cadastroVeiculos.jsp\"class=\"dropdown-item text-white\">Transporte TESTE</a></li>\n");
      out.write("                                    <li><a href=\"cadastroCliente.jsp\"class=\"dropdown-item text-white\">Clientes</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li class=\"nav-item dropdown bg-black\"><a href=\"#\" class=\"nav-link text-white dropdown-toggle\" data-bs-toggle=\"dropdown\">Caminhões</a>\n");
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
      out.write("                                <li class=\"nav-item\"><a href=\"login.jsp\" class=\"nav-link text-white\">Login</a></li>\n");
      out.write("                                \n");
      out.write("\t\t\t</ul>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t</nav>\n");
      out.write("\t</header>\n");
      out.write("        <h1 style=\"text-align: center\">CADASTRO DE CIDADES</h1>\n");
      out.write("        <form name=\"cadastro\" method=\"get\" action=\"CAECidade.jsp\" class=\"formCidade\">\n");
      out.write("            <p style=\"margin-top: 10px\"><label>Cidade: </label> <input type=\"text\" name=\"nomeCidade\" value=\"");
      out.print( (nomeCidade==null)?"":nomeCidade);
      out.write("\" size=\"30\" /></p>\n");
      out.write("            <p><label>UF: </label> <input type=\"text\" name=\"ufCidade\" value=\"");
      out.print( (ufCidade==null)?"":ufCidade);
      out.write("\" size=\"30\" /></p>\n");
      out.write("            \n");
      out.write("            ");
if(opcao.equals("cadastrar")){
      out.write("\n");
      out.write("            <input type=\"submit\" value=\"Cadastrar\" name=\"cadastrar\" class=\"botaoCadastrar\"/>\n");
      out.write("            ");
}else if(opcao.equals("alterar")){
      out.write("\n");
      out.write("            <input type=\"submit\" value=\"Alterar\" name=\"alterar\" class=\"botaoCadastrar\"/>\n");
      out.write("            ");
}else if(opcao.equals("excluir")){
      out.write("\n");
      out.write("            <input type=\"submit\" value=\"Excluir\" name=\"excluir\" class=\"botaoExcluir\"/>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("            <input type=\"hidden\" name=\"opcao\" value=\"");
      out.print(opcao);
      out.write("\"/>\n");
      out.write("            <input type=\"hidden\" name=\"codigoCidade\" value=\"");
      out.print(codigoCidade);
      out.write("\"/>\n");
      out.write("            <input type=\"reset\" value=\"Limpar\" name=\"limpar\" class=\"botaoLimpar\"/>\n");
      out.write("        </form>\n");
      out.write("        <p>");
      out.print((mensagem==null)?"":mensagem);
      out.write("</p>\n");
      out.write("        <p></p>\n");
      out.write("        <p></p>\n");
      out.write("        <div style=\"float: right;\">\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    
    DAOCidade objDAOCidade = new DAOCidade();
    List<Cidade> listaCidade = objDAOCidade.listarCidade();
    

      out.write("\n");
      out.write("\n");
      out.write("<table border=\"1\">\n");
      out.write("    <thead>\n");
      out.write("        <tr>\n");
      out.write("            <th>Código</th>\n");
      out.write("            <th>Cidade</th>\n");
      out.write("            <th>UF</th>\n");
      out.write("            <th>ALTERAR</th>\n");
      out.write("            <th>EXCLUIR</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");
 for(Cidade cidade:listaCidade){
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print( cidade.getCodigo() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( cidade.getNomeCidade() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( cidade.getUfCidade() );
      out.write("</td>\n");
      out.write("            <td><a href=\"cadastroCidade.jsp?opcao=alterar&codigoCidade=");
      out.print( cidade.getCodigo() );
      out.write("&nomeCidade=");
      out.print( cidade.getNomeCidade() );
      out.write("&ufCidade=");
      out.print( cidade.getUfCidade() );
      out.write("\">Alterar</a></td>\n");
      out.write("            <td><a href=\"cadastroCidade.jsp?opcao=excluir&codigoCidade=");
      out.print( cidade.getCodigo() );
      out.write("&nomeCidade=");
      out.print( cidade.getNomeCidade() );
      out.write("&ufCidade=");
      out.print( cidade.getUfCidade() );
      out.write("\">Excluir</a></td>\n");
      out.write("        </tr>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <br>\n");
      out.write("        \n");
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
