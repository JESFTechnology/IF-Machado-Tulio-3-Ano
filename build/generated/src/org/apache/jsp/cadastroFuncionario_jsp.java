package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Cliente;
import modelo.DAOCliente;
import modelo.Modelo;
import modelo.DAOModelo;
import java.util.List;
import modelo.Cidade;
import modelo.DAOCidade;
import java.util.Calendar;
import modelo.Cliente;
import modelo.DAOCliente;
import modelo.Modelo;
import java.util.List;
import modelo.DAOModelo;
import modelo.ConverteData;
import modelo.Funcionario;
import java.util.List;
import modelo.DAOFuncionario;

public final class cadastroFuncionario_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/telaMenu.jsp");
    _jspx_dependants.add("/listarFuncionario.jsp");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

    String mensagem = request.getParameter("mensagem");
    String nomeFuncionario = request.getParameter("nomeFuncionario");
    String salarioFuncionario = request.getParameter("salarioFuncionario");  
    String codigoFuncionario = request.getParameter("codigoFuncionario");
    String cargoFuncionario = request.getParameter("cargoFuncionario");
    String emailFuncionario = request.getParameter("emailFuncionario");
    String senhaFuncionario = ""; //request.getParameter("senhaFuncionario");
    String nascimentoFuncionario = request.getParameter("nascimentoFuncionario");
    String cidadeFuncionario = request.getParameter("cidadeFuncionario");
    String bairroFuncionario = request.getParameter("bairroFuncionario");
    String enderecoFuncionario = request.getParameter("enderecoFuncionario");
    if(codigoFuncionario==null)
    {
        codigoFuncionario = "0";
    }
    if(cidadeFuncionario==null)
    {
        cidadeFuncionario = "1";
    }
    String opcao = request.getParameter("opcao");
    if(opcao==null){
        opcao="cadastrar";
    }
    
           DAOModelo objDAOModelo = new DAOModelo();
            List<Modelo> listaModelo = objDAOModelo.listarModelo();
    
    DAOCidade daoCidade = new DAOCidade();
    List<Cidade> listaCidade = daoCidade.listarCidade();
    
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
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"img/logoIF.png\" type=\"image/x-icon\">\n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/all.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/estilo.css\">\n");
      out.write("          \n");
      out.write("\t<!--Javascript-->\n");
      out.write("\t<script src=\"js/bootstrap.bundle.js\"></script>\n");
      out.write("        \n");
      out.write("        <title>JSP Funcionario</title>\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        body{\n");
      out.write("            background-image: url(\"img/fundo2.jpg\");\n");
      out.write("            background-repeat: no-repeat;\n");
      out.write("            background-size: cover;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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
      out.write("<head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"img/logoIF.png\" type=\"image/x-icon\">\n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/all.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/estilo.css\">\n");
      out.write("</head>\n");
      out.write("<header>\n");
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
      out.write("</header>\n");
      out.write("\n");
      out.write("        <h1 style=\"text-align: center\">CADASTROS DE FUNCIONÁRIOS</h1>\n");
      out.write("        \n");
      out.write("        <form name=\"cadastro\" method=\"get\" action=\"CAEFuncionario.jsp\" class=\"formCidade\" style=\"float: left\">\n");
      out.write("            <p><label>Funcionário: </label> <input type=\"text\" name=\"nomeFuncionario\" value=\"");
      out.print( (nomeFuncionario==null)?"":nomeFuncionario);
      out.write("\" size=\"30\" placeholder=\"Ex: Johann\"/></p>\n");
      out.write("            <p><label>Cargo: </label> <input type=\"text\" name=\"cargoFuncionario\" value=\"");
      out.print( (cargoFuncionario==null)?"":cargoFuncionario);
      out.write("\" size=\"30\" placeholder=\"Ex: Designer\"/></p>\n");
      out.write("            <p><label>Email: </label> <input type=\"text\" name=\"emailFuncionario\" value=\"");
      out.print( (emailFuncionario==null)?"":emailFuncionario);
      out.write("\" size=\"30\" placeholder=\"Ex: johannsacconi@jesftech.com\"/></p>\n");
      out.write("            <p><label>Salário: </label> <input type=\"text\" name=\"salarioFuncionario\" value=\"");
      out.print( (salarioFuncionario==null)?"":salarioFuncionario);
      out.write("\" size=\"30\" placeholder=\"Ex: 1000.0\"/></p>\n");
      out.write("            <p><label>Nascimento: </label> <input type=\"text\" name=\"nascimentoFuncionario\" value=\"");
      out.print( (nascimentoFuncionario==null)?"":nascimentoFuncionario);
      out.write("\" size=\"30\" placeholder=\"Ex: 01/01/2001\"/></p>\n");
      out.write("            \n");
      out.write("            <p><label>Cidade: </label>\n");
      out.write("                <select name=\"cidadeFuncionario\">\n");
      out.write("                    \n");
      out.write("                    <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->\n");
      out.write("                    ");
 for(Cidade cidade:listaCidade){
      out.write(' ');
 if (cidadeFuncionario.equals(String.valueOf(cidade.getCodigo()))) {
      out.write("\n");
      out.write("                    \n");
      out.write("                        <option selected value=\"");
      out.print(  cidade.getCodigo());
      out.write('"');
      out.write('>');
      out.print( cidade.getNomeCidade() );
      out.write(" </option>\n");
      out.write("                    \n");
      out.write("                      ");
} else {
      out.write("\n");
      out.write("                    \n");
      out.write("                        <option value=\"");
      out.print( cidade.getCodigo() );
      out.write('"');
      out.write('>');
      out.print( cidade.getNomeCidade());
      out.write(" </option>\n");
      out.write("                      \n");
      out.write("                    ");
 }} 
      out.write("\n");
      out.write("                    \n");
      out.write("                </select>\n");
      out.write("            </p>\n");
      out.write("            <p><label>Endereço: </label> <input type=\"text\" name=\"enderecoFuncionario\" value=\"");
      out.print( (enderecoFuncionario==null)?"":enderecoFuncionario);
      out.write("\" size=\"30\" placeholder=\"Ex: Sabará 000\"/></p>\n");
      out.write("            <p><label>Bairro: </label> <input type=\"text\" name=\"bairroFuncionario\" value=\"");
      out.print( (bairroFuncionario==null)?"":bairroFuncionario);
      out.write("\" size=\"30\" placeholder=\"Ex: Residencial Oliveira\"/></p>\n");
      out.write("            \n");
      out.write("            ");
if(opcao.equals("cadastrar")){
      out.write("\n");
      out.write("            <p><label>Senha: </label> <input type=\"password\" name=\"senhaFuncionario\" value=\"");
      out.print( (senhaFuncionario==null)?"":senhaFuncionario);
      out.write("\" size=\"30\" /></p>\n");
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
      out.write("            <input type=\"hidden\" name=\"codigoFuncionario\" value=\"");
      out.print(codigoFuncionario);
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
      out.write("\n");

    
    DAOFuncionario objDAOCidade = new DAOFuncionario();
    List<Funcionario> listaFuncionario = objDAOCidade.listarFuncionario();
    
    ConverteData objConverte = new ConverteData();
    

      out.write("\n");
      out.write("\n");
      out.write("<table border=\"1\" style=\"float: right\">\n");
      out.write("    <thead>\n");
      out.write("        <tr>\n");
      out.write("            <th>Código</th>\n");
      out.write("            <th>NOME</th>\n");
      out.write("            <th>CARGO</th>\n");
      out.write("            <th>EMAIL</th>\n");
      out.write("            <th>SALÁRIO</th>\n");
      out.write("            <th>NASCIMENTO</th>\n");
      out.write("            <th>CIDADE</th>\n");
      out.write("            <th>ENDEREÇO</th>\n");
      out.write("            <th>BAIRRO</th>\n");
      out.write("            <th>ALTERAR</th>\n");
      out.write("            <th>EXCLUIR</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");
 for(Funcionario funcionario:listaFuncionario){
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print( funcionario.getCodigo() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( funcionario.getNomeFuncionario() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( funcionario.getCargoFuncionario());
      out.write("</td>\n");
      out.write("            <td>");
      out.print( funcionario.getEmailFuncionario());
      out.write("</td>\n");
      out.write("            <td>");
      out.print( funcionario.getSalarioFuncionario());
      out.write("</td>\n");
      out.write("            <td>");
      out.print( objConverte.converteTela(funcionario.getNascimento()) );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( funcionario.getObjCidade().getNomeCidade() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( funcionario.getEnderecoFuncionario() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( funcionario.getBairroFuncionario() );
      out.write("</td>\n");
      out.write("            <td><a href=\"cadastroFuncionario.jsp?opcao=alterar&codigoFuncionario=");
      out.print( funcionario.getCodigo() );
      out.write("&nomeFuncionario=");
      out.print( funcionario.getNomeFuncionario() );
      out.write("&salarioFuncionario=");
      out.print( funcionario.getSalarioFuncionario());
      out.write("&cargoFuncionario=");
      out.print( funcionario.getCargoFuncionario() );
      out.write("&emailFuncionario=");
      out.print( funcionario.getEmailFuncionario());
      out.write("&nascimentoFuncionario=");
      out.print( objConverte.converteTela(funcionario.getNascimento()));
      out.write("&cidadeFuncionario=");
      out.print( funcionario.getObjCidade().getCodigo() );
      out.write("&bairroFuncionario=");
      out.print( funcionario.getBairroFuncionario() );
      out.write("&enderecoFuncionario=");
      out.print( funcionario.getEnderecoFuncionario());
      out.write("\">Alterar</a></td>\n");
      out.write("            <td><a href=\"cadastroFuncionario.jsp?opcao=excluir&codigoFuncionario=");
      out.print( funcionario.getCodigo() );
      out.write("&nomeFuncionario=");
      out.print( funcionario.getNomeFuncionario() );
      out.write("&salarioFuncionario=");
      out.print( funcionario.getSalarioFuncionario());
      out.write("&cargoFuncionario=");
      out.print( funcionario.getCargoFuncionario() );
      out.write("&emailFuncionario=");
      out.print( funcionario.getEmailFuncionario());
      out.write("&nascimentoFuncionario=");
      out.print( objConverte.converteTela(funcionario.getNascimento()));
      out.write("&cidadeFuncionario=");
      out.print( funcionario.getObjCidade().getCodigo() );
      out.write("&bairroFuncionario=");
      out.print( funcionario.getBairroFuncionario() );
      out.write("&enderecoFuncionario=");
      out.print( funcionario.getEnderecoFuncionario());
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
