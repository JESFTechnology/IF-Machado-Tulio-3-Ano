package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.DAOItemVenda;
import modelo.ItemVenda;
import modelo.DAOProduto;
import modelo.Produto;
import modelo.Modelo;
import modelo.DAOModelo;
import modelo.Marca;
import java.util.List;
import modelo.DAOMarca;

public final class loja_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
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
      out.write("        \n");
      out.write("        <title>JSP Loja</title>\n");
      out.write("    </head>\n");
      out.write("    ");

       String mensagem = request.getParameter("mensagem");
       String selecao = request.getParameter("selecao");
       
       if(selecao == null){
           selecao = "2";
       }
       
       DAOMarca objDAOMarca = new DAOMarca();
       List<Marca> listaMarca = objDAOMarca.listarMarca();
       
       DAOModelo objDAOModelo = new DAOModelo();
       List<Modelo> listaModelo = objDAOModelo.listarModelo();
       
       DAOProduto objDAOProduto = new DAOProduto();
       List<Produto> listaProduto = objDAOProduto.listarProduto();
       
       DAOItemVenda objDAOItemVenda = new DAOItemVenda();
       List<ItemVenda> listaItemVenda = objDAOItemVenda.listarItemVenda();
    
      out.write("\n");
      out.write("    <style>\n");
      out.write("        body{\n");
      out.write("            background-image: url(\"img/fundo2.jpg\");\n");
      out.write("            background-repeat: no-repeat;\n");
      out.write("            background-size: cover;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .caixaProduto{\n");
      out.write("            background-color: #bebebf;\n");
      out.write("            width: 285px;\n");
      out.write("            height: 290px;\n");
      out.write("            margin-bottom: 10px;\n");
      out.write("            margin-left: 10px;\n");
      out.write("            margin-right: 10px;\n");
      out.write("            margin-top: 10px;\n");
      out.write("            border-radius: 20px;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("\t\t<nav class=\"navbar navbar-expand-md .px-4\">\n");
      out.write("\t\t\t<div class=\"navbar-brand\">\n");
      out.write("                            <a href=\"index.jsp\"><img src=\"img/logoIF.png\" alt=\"logo png\" class=\"logopngif\"></a>\n");
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
      out.write("                                <li class=\"nav-item\"><a href=\"login.jsp\" class=\"nav-link text-white\">Login</a></li>\n");
      out.write("\t\t\t</ul>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t</nav>\n");
      out.write("\t</header>\n");
      out.write("        <h1 style=\"text-align: center\">LOJA</h1>\n");
      out.write("        <div style=\"float: right; height: auto; width: 20%; border-radius: 20px;\">\n");
      out.write("                    <h4>Lista de compras não completas: </h4>\n");
      out.write("                    \n");
      out.write("                    ");
 for(ItemVenda itemVenda:listaItemVenda){if("Em andamento".equals(itemVenda.getObjVenda().getStatus())){
      out.write("\n");
      out.write("                    \n");
      out.write("                        <p>Compra: </p>\n");
      out.write("                        <p>Produto: ");
      out.print( itemVenda.getObjProduto().getNome() );
      out.write("</p>\n");
      out.write("                        <p>Quantidade: ");
      out.print( itemVenda.getQuantVenda() );
      out.write("</p>\n");
      out.write("                        <p>Cliente: ");
      out.print( itemVenda.getObjVenda().getObjCliente().getNome() );
      out.write("</p>\n");
      out.write("                        \n");
      out.write("                    ");
 }} 
      out.write("\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <div style=\"float: left\">\n");
      out.write("        <form action=\"loja.jsp\">\n");
      out.write("            <p><label>Selecione aqui a marca do seu produto: </label>\n");
      out.write("                <select name=\"selecao\">\n");
      out.write("                        <option value=\"1\">Nada</option>\n");
      out.write("                    \n");
      out.write("                    <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->\n");
      out.write("                    ");
 for(Marca marca:listaMarca){
      out.write("\n");
      out.write("                    \n");
      out.write("                        <option value=\"");
      out.print( marca.getCodigo() );
      out.write('"');
      out.write('>');
      out.print( marca.getMarca());
      out.write(" </option>\n");
      out.write("                      \n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                    \n");
      out.write("                </select>\n");
      out.write("            </p>\n");
      out.write("            <input type=\"submit\">\n");
      out.write("        </form>\n");
      out.write("                <div class=\"row\" style=\"width: 75%; align-items: center; float: left\">  \n");
      out.write("                    ");
 for(Produto produto:listaProduto){if(selecao.equals(String.valueOf(produto.getObjMarca().getCodigo()))){ 
      out.write("\n");
      out.write("                    <div class=\"caixaProduto\">\n");
      out.write("                        <img src=\"img/arduino uno.jpg\" style=\"width: 100px; margin-top: 10px\">\n");
      out.write("                        <p>Nome: ");
      out.print( produto.getNome() );
      out.write("</p>\n");
      out.write("                        <p>R$");
      out.print( produto.getPreco() );
      out.write("</p>\n");
      out.write("                        <form>\n");
      out.write("                            <p>Quantidade: <input type=\"number\" name=\"quantidade\" style=\"background-color:transparent;\" checked=\"\"></p>\n");
      out.write("                            <p><input type=\"submit\" value=\"Comprar\"></p>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                ");
 }} 
      out.write("\n");
      out.write("                </div>\n");
      out.write("        </div>\n");
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
