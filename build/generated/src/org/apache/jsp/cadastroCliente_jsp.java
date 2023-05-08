package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.DAOVeiculo;
import modelo.Veiculo;
import modelo.Cliente;
import java.util.List;
import modelo.DAOCliente;

public final class cadastroCliente_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/listarCliente.jsp");
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
      out.write("<!DOCTYPE html>\n");

    String mensagem = request.getParameter("mensagem");
    String nomeCliente = request.getParameter("nome");
    String senhaCliente = request.getParameter("senha");
    String emailCliente= request.getParameter("email");
    String pixCliente= request.getParameter("pix");
    String codigoCliente = request.getParameter("codigo");
    String cpfCliente = request.getParameter("cpf");
    if(codigoCliente==null)
    {
        codigoCliente ="0";
    }
    String opcao = request.getParameter("opcao");
    if(opcao==null){
        opcao="cadastrar";
    }
    
    DAOVeiculo objDAOVeiculo = new DAOVeiculo();
    List<Veiculo> listaVeiculo = objDAOVeiculo.listarVeiculo();
    

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
 for(Veiculo veiculo:listaVeiculo){
      out.write("\n");
      out.write("\t\t\t\t\t<li><a href=\"#\"class=\"dropdown-item text-white\">");
      out.print(veiculo.getVeiculo());
      out.write("</a></li>\n");
      out.write("                                        ");
}
      out.write("\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("                                <li class=\"nav-item\"><a href=\"login.jsp\" class=\"nav-link text-white\">Login</a></li>\n");
      out.write("\t\t\t</ul>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t</nav>\n");
      out.write("\t</header>\n");
      out.write("        <h1 style=\"text-align: center\">CADASTRO DE CLIENTES</h1>\n");
      out.write("        <form name=\"cadastro\" method=\"get\" action=\"CAECliente.jsp\" class=\"formCidade\">\n");
      out.write("            <p style=\"margin-top: 10px\"><label>Nome: </label> <input type=\"text\" name=\"nome\" value=\"");
      out.print( (nomeCliente==null)?"":nomeCliente);
      out.write("\" size=\"30\" checked/></p>\n");
      out.write("            <p><label>Email: </label> <input type=\"text\" name=\"email\" value=\"");
      out.print( (emailCliente==null)?"":emailCliente);
      out.write("\" size=\"30\" checked/></p>\n");
      out.write("            <p><label>Senha: </label> <input type=\"password\" name=\"senha\" value=\"");
      out.print( (senhaCliente==null)?"":senhaCliente);
      out.write("\" size=\"30\" checked/></p>\n");
      out.write("            <p><label>Pix: </label> <input type=\"text\" name=\"pix\" value=\"");
      out.print( (pixCliente==null)?"":pixCliente);
      out.write("\" size=\"30\" checked/></p>\n");
      out.write("            <p><label>Cpf: </label> <input type=\"text\" name=\"cpf\" value=\"");
      out.print( (cpfCliente==null)?"":cpfCliente);
      out.write("\" size=\"30\" checked/></p>\n");
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
      out.write("            <input type=\"hidden\" name=\"codigo\" value=\"");
      out.print(codigoCliente);
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

    
    DAOCliente objDAOCliente = new DAOCliente();
    List<Cliente> listaCliente = objDAOCliente.listarCliente();
    

      out.write("\n");
      out.write("\n");
      out.write("<table border=\"1\">\n");
      out.write("    <thead>\n");
      out.write("        <tr>\n");
      out.write("            <th>Código</th>\n");
      out.write("            <th>NOME</th>\n");
      out.write("            <th>EMAIL</th>\n");
      out.write("            <th>PIX</th>\n");
      out.write("            <th>CPF</th>\n");
      out.write("            <th>ALTERAR</th>\n");
      out.write("            <th>EXCLUIR</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");
 for(Cliente cliente:listaCliente){
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print( cliente.getCodigo() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( cliente.getNome() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( cliente.getEmail() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( cliente.getPix());
      out.write("</td>\n");
      out.write("            <td>");
      out.print( cliente.getCpf());
      out.write("</td>\n");
      out.write("            <td><a href=\"cadastroCliente.jsp?opcao=alterar&codigo=");
      out.print( cliente.getCodigo() );
      out.write("&nome=");
      out.print( cliente.getNome());
      out.write("&email=");
      out.print( cliente.getEmail());
      out.write("&pix=");
      out.print( cliente.getPix());
      out.write("&cpf=");
      out.print( cliente.getCpf());
      out.write("\">Alterar</a></td>\n");
      out.write("            <td><a href=\"cadastroCliente.jsp?opcao=excluir&codigo=");
      out.print( cliente.getCodigo() );
      out.write("&nome=");
      out.print( cliente.getNome() );
      out.write("&email=");
      out.print( cliente.getEmail());
      out.write("&pix=");
      out.print( cliente.getPix());
      out.write("&cpf=");
      out.print( cliente.getCpf());
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
