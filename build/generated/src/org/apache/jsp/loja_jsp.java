package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.DAOCliente;
import modelo.Funcionario;
import modelo.DAOTransporte;
import modelo.Transporte;
import modelo.DAOItensVenda;
import modelo.ItensVenda;
import modelo.DAOCaixa;
import modelo.Caixa;
import modelo.DAOLogin;
import modelo.Cliente;
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

       String dados = "N";
       String mensagem = request.getParameter("mensagem");
       String selecao = request.getParameter("selecao");
       String user;
       String nome = "Login",email = "",cargo="",cpf="",pix="",senha="",codVenda="0",transporteVenda = "0",codCliente="";
       if(selecao == null){
           selecao = "2";
       }
       
       DAOMarca objDAOMarca = new DAOMarca();
       List<Marca> listaMarca = objDAOMarca.listarMarca();
       
       DAOLogin objDAOCliente = new DAOLogin();
       List<Funcionario> listaFuncionario = objDAOCliente.listarCliente();
       
       DAOModelo objDAOModelo = new DAOModelo();
       List<Modelo> listaModelo = objDAOModelo.listarModelo();
       
       DAOProduto objDAOProduto = new DAOProduto();
       List<Produto> listaProduto = objDAOProduto.listarProduto();
       
       DAOCaixa objVenda = new DAOCaixa();
       DAOItensVenda objDAOItensVenda = new DAOItensVenda();
       
       DAOTransporte objDAOTransporte = new DAOTransporte();
       List<Transporte> listaTransporte = objDAOTransporte.listarTransporte();
       
       DAOCliente objDAOCliente1 = new DAOCliente();
       List<Cliente> listaCliente = objDAOCliente1.listarCliente();
       
    if(session.getAttribute("user")==null)
    {
        user = "Login";
    }
    else
    {
        user = String.valueOf(session.getAttribute("user"));
        List<Caixa> listaVenda = objVenda.selecionarVendaAuto();
        
        for(Funcionario funcionario:listaFuncionario){
            if(user.equals(String.valueOf(funcionario.getCodigo()))){
                nome = funcionario.getNomeFuncionario();
                cargo = funcionario.getCargoFuncionario();
                email = funcionario.getEmailFuncionario();
                senha = funcionario.getSenhaFuncionario();
            }
        }
        
        for(Caixa venda:listaVenda){
            
            codVenda = String.valueOf(venda.getIdCaixa());
            codCliente = String.valueOf(venda.getCliente().getCodigo());
            transporteVenda = String.valueOf(venda.getTransporte().getCodigo());
        }
        
        if(codVenda.equals("0")){
            dados = "N";
        }
        else
        {
            dados = "S";
        }
        
        if(transporteVenda.equals("0") || transporteVenda==null){
            transporteVenda = "0";
        }
        
    }
    
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
      out.write("\t\t<nav class=\"navbar navbar-expand-md px-4 bg-black\">\n");
      out.write("\t\t\t<div class=\"navbar-brand\">\n");
      out.write("                            <a href=\"index.jsp\"><img src=\"img/logo.png\" alt=\"logo png\" class=\"logopngif\"></a>\n");
      out.write("\t\t\t</div >\n");
      out.write("\t\t\t<button class=\"navbar-toggler\" data-bs-toggle=\"collapse\" data-bs-target=\"#menubar\"><span class=\"fa-solid fa-bars\"></span></button>\n");
      out.write("\n");
      out.write("\t\t\t<div class=\"collapse navbar-collapse\" id=\"menubar\">\n");
      out.write("\t\t\t<ul class=\"navbar-nav\">\n");
      out.write("                            <li class=\"nav-item\"><a href=\"index.jsp\" class=\"nav-link text-white\">Home</a></li>\n");
      out.write("                                ");
 if(user!="Login"){
      out.write("\t\n");
      out.write("                                <li class=\"nav-item dropdown\">\n");
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
      out.write("                                ");
}
      out.write("\n");
      out.write("                                <li class=\"nav-item\"><a href=\"loja.jsp\" class=\"nav-link text-white\">Loja</a></li>\n");
      out.write("                                <li class=\"nav-item\"><a href=\"login.jsp\" class=\"nav-link text-white\">");
      out.print( nome );
      out.write("</a></li>\n");
      out.write("\t\t\t</ul>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t</nav>\n");
      out.write("\t</header>\n");
      out.write("        <h1 style=\"text-align: center\">LOJA</h1>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-9\">\n");
      out.write("            <form action=\"loja.jsp\">\n");
      out.write("                <p><label>Selecione aqui a marca do seu produto: </label>\n");
      out.write("                    <select name=\"selecao\">\n");
      out.write("                            <option value=\"1\">Nada</option>\n");
      out.write("\n");
      out.write("                        <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->\n");
      out.write("                        ");
 for(Marca marca:listaMarca){
      out.write("\n");
      out.write("\n");
      out.write("                            <option value=\"");
      out.print( marca.getCodigo() );
      out.write('"');
      out.write('>');
      out.print( marca.getMarca());
      out.write(" </option>\n");
      out.write("\n");
      out.write("                        ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("                    </select>\n");
      out.write("                </p>\n");
      out.write("                <input type=\"submit\">\n");
      out.write("            </form>\n");
      out.write("                    <div class=\"row\">  \n");
      out.write("                        ");
 for(Produto produto:listaProduto){if(selecao.equals(String.valueOf(produto.getObjMarca().getCodigo()))){ 
      out.write("\n");
      out.write("                        <div class=\"col-3 caixaProduto\">\n");
      out.write("                            ");
 if(produto.getObjMarca().getMarca().equals("Arduino")){ 
      out.write("\n");
      out.write("                                <img src=\"img/arduino-logo.png\" style=\"width: 100px; margin-top: 10px\">\n");
      out.write("                            ");
 }else if(produto.getObjMarca().getMarca().equals("WIFI")){ 
      out.write("\n");
      out.write("                                <img src=\"img/net-logo.png\" style=\"width: 100px; margin-top: 10px\">\n");
      out.write("                            ");
 }else if(produto.getObjMarca().getMarca().equals("Módulo")){ 
      out.write("\n");
      out.write("                                <img src=\"img/extencao-logo.png\" style=\"width: 100px; margin-top: 10px\">\n");
      out.write("                            ");
 }else if(produto.getObjMarca().getMarca().equals("Motores")){ 
      out.write("\n");
      out.write("                                <img src=\"img/motor-logo.png\" style=\"width: 100px; margin-top: 10px\">\n");
      out.write("                            ");
 }else if(produto.getObjMarca().getMarca().equals("Sensor")){ 
      out.write("\n");
      out.write("                                <img src=\"img/sensor-logo.png\" style=\"width: 100px; margin-top: 10px\">\n");
      out.write("                            ");
 } 
      out.write("\n");
      out.write("                            <p>Nome: ");
      out.print( produto.getNome() );
      out.write("</p>\n");
      out.write("                            <p>R$");
      out.print( produto.getPreco() );
      out.write("</p>\n");
      out.write("                            <form action=\"CAEloja.jsp\">\n");
      out.write("                                <p>Quantidade: <input value=\"1\" type=\"number\" name=\"quantidade\" style=\"background-color:transparent;\" checked=\"\"></p>\n");
      out.write("                                <input type=\"hidden\" name=\"codProduto\" value=\"");
      out.print( produto.getCodigo() );
      out.write("\">\n");
      out.write("                                <input type=\"hidden\" name=\"codVenda\" value=\"");
      out.print( codVenda );
      out.write("\">\n");
      out.write("                                <input type=\"hidden\" name=\"codCliente\" value=\"");
      out.print( user );
      out.write("\">\n");
      out.write("                                <input type=\"hidden\" name=\"valor\" value=\"");
      out.print( produto.getPreco() );
      out.write("\">\n");
      out.write("                                <input type=\"hidden\" name=\"nomeP\" value=\"");
      out.print( produto.getNome() );
      out.write("\">\n");
      out.write("                                <input type=\"hidden\" value=\"comprar\" name=\"opcao\">\n");
      out.write("                                <p><input type=\"submit\" name=\"opcao\" value=\"Comprar\"></p>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    ");
 }} 
      out.write("\n");
      out.write("                    </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-3\">\n");
      out.write("                        <h4>Lista de compras não completas:</h4>\n");
      out.write("                        <h6>Bem vindo ");
      out.print( nome);
      out.write(" </h6>\n");
      out.write("                        <p>");
      out.print( (mensagem==null)?"":mensagem );
      out.write("</p>\n");
      out.write("                        ");
 List<ItensVenda> listaItens = objDAOItensVenda.getLista(Integer.valueOf(codVenda)); 
      out.write("\n");
      out.write("                            ");
 for(ItensVenda itensVenda:listaItens){ 
      out.write("\n");
      out.write("                            <form action=\"CAEloja.jsp\" class=\"card border-dark mt-2\">\n");
      out.write("                                <p class=\"text-center\">Compra</p>\n");
      out.write("                                <p>Produto: ");
      out.print( itensVenda.getProduto().getNome() );
      out.write(" R$");
      out.print( itensVenda.getProduto().getPreco() );
      out.write("</p>\n");
      out.write("                                <p>Modelo: ");
      out.print( itensVenda.getProduto().getObjMarca().getMarca() );
      out.write("</p>\n");
      out.write("                                <p>Quantidade: ");
      out.print( itensVenda.getQuantidade() );
      out.write("</p>\n");
      out.write("                                <p>Valor: ");
      out.print( itensVenda.getValorProduto() );
      out.write("</p>\n");
      out.write("                                <input type=\"hidden\" name=\"codCliente\" value=\"");
      out.print( user );
      out.write("\">\n");
      out.write("                                <input type=\"hidden\" name=\"codItemVenda\" value=\"");
      out.print( itensVenda.getIdItens() );
      out.write("\">\n");
      out.write("                                <p><input class=\"botaoExcluir\" type=\"submit\" name=\"opcao\" value=\"remover\"></p>\n");
      out.write("                            </form>\n");
      out.write("                            ");
 } 
      out.write("\n");
      out.write("                        <form action=\"CAEloja.jsp\">\n");
      out.write("                            ");
 if(!user.equals("Login")){ 
      out.write("\n");
      out.write("                            ");
 if(dados.equals("S")){
      out.write("\n");
      out.write("                                <p>Deseja concluir seu carrinho de compras?</p>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                    <p><input class=\"botaoCadastrar\" type=\"submit\" name=\"opcao\" value=\"concluir\"></p>\n");
      out.write("                                    <!--<p><input class=\"botaoCadastrar\" type=\"submit\" name=\"opcao\" value=\"salvar\"></p>-->\n");
      out.write("                                    <p><input class=\"botaoExcluir\" type=\"submit\" name=\"opcao\" value=\"cancelar\"></p>\n");
      out.write("                                    </div>\n");
      out.write("                                <p><label>Transportadora ");
      out.print( transporteVenda );
      out.write(": </label>\n");
      out.write("                                    <select name=\"codTransporte\">\n");
      out.write("\n");
      out.write("                                        <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->\n");
      out.write("                                        ");
 for(Transporte transporte:listaTransporte){
      out.write(" \n");
      out.write("                                        \n");
      out.write("                                           ");
 if (transporteVenda.equals(String.valueOf(transporte.getCodigo()))) {
      out.write("\n");
      out.write("\n");
      out.write("                                            <option selected value=\"");
      out.print(  transporte.getCodigo());
      out.write('"');
      out.write('>');
      out.print( transporte.getTransportadora() );
      out.write(" </option>\n");
      out.write("\n");
      out.write("                                          ");
} else {
      out.write("\n");
      out.write("\n");
      out.write("                                            <option value=\"");
      out.print( transporte.getCodigo() );
      out.write('"');
      out.write('>');
      out.print( transporte.getTransportadora());
      out.write(" </option>\n");
      out.write("\n");
      out.write("                                        ");
 }} 
      out.write("\n");
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </p>\n");
      out.write("                                <input type=\"hidden\" name=\"codCliente\" value=\"");
      out.print( user );
      out.write("\">\n");
      out.write("                                <input type=\"hidden\" name=\"codVenda\" value=\"");
      out.print( codVenda );
      out.write("\">\n");
      out.write("                                </div>\n");
      out.write("                                \n");
      out.write("                            ");
 }else{
      out.write(" \n");
      out.write("                                <p>Deseja iniciar a compra com qual cliente?</p>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                <p><label>Clientes</label>\n");
      out.write("                                    <select name=\"codCliente\">\n");
      out.write("\n");
      out.write("                                        <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->\n");
      out.write("                                        ");
 for(Cliente cliente:listaCliente){
      out.write(" \n");
      out.write("                                        ");
 if (listaCliente.equals(String.valueOf(codCliente))) {
      out.write("\n");
      out.write("\n");
      out.write("                                            <option class=\"formLogin\" selected value=\"");
      out.print(  cliente.getCodigo());
      out.write('"');
      out.write('>');
      out.print(  cliente.getCodigo());
      out.write(' ');
      out.print( cliente.getNome() );
      out.write("</option>\n");
      out.write("\n");
      out.write("                                          ");
} else {
      out.write("\n");
      out.write("\n");
      out.write("                                            <option class=\"formLogin\" value=\"");
      out.print( cliente.getCodigo() );
      out.write('"');
      out.write('>');
      out.print(  cliente.getCodigo());
      out.write(' ');
      out.print( cliente.getNome() );
      out.write("</option>\n");
      out.write("\n");
      out.write("                                        ");
 }} 
      out.write("\n");
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </p>\n");
      out.write("                                <input type=\"hidden\" name=\"codVenda\" value=\"");
      out.print( codVenda );
      out.write("\">\n");
      out.write("                                <p><input class=\"botaoCadastrar\" type=\"submit\" name=\"opcao\" value=\"cadastrar\"></p>\n");
      out.write("                                </div>\n");
      out.write("                            ");
  }
                                }else{ 
      out.write("\n");
      out.write("                            <p>Faça login para adicionar<br> sua lista de compras</p>\n");
      out.write("                                <a href=\"login.jsp\">Login</a>\n");
      out.write("                            ");
}
      out.write("\n");
      out.write("                        </form>\n");
      out.write("            </div>\n");
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
