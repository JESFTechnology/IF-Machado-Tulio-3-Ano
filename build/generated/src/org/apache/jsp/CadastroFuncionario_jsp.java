package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import modelo.Cidade;
import modelo.DAOCidade;
import modelo.ConverteData;
import modelo.Funcionario;
import modelo.DAOFuncionario;
import java.util.List;

public final class CadastroFuncionario_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/Menu.jsp");
    _jspx_dependants.add("/ListarFuncionario.jsp");
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
      response.setContentType("text/html;charset=Latin1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
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
      out.write('\n');
 if (session.getAttribute("nome") != null){
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    function enviar(par) {\n");
      out.write("        if (par == 'cadastrar') {\n");
      out.write("\n");
      out.write("            if (document.cadastro.nomeFuncionario.value == '') {\n");
      out.write("                document.cadastro.mensagem.value = 'Preencha o campo Nome';\n");
      out.write("            } else if (document.cadastro.salario.value == '') {\n");
      out.write("                document.cadastro.mensagem.value = 'Preencha o campo Salario';\n");
      out.write("            } else if (document.cadastro.nascimento.value == '') {\n");
      out.write("                document.cadastro.mensagem.value = 'Preencha o campo Nascimento';\n");
      out.write("            }else if (TestaCPF(document.cadastro.cpf.value) == false) {\n");
      out.write("                document.cadastro.mensagem.value = 'CPF incorreto';\n");
      out.write("            }\n");
      out.write("            else {\n");
      out.write("                document.cadastro.opcao.value = 'cadastrar';\n");
      out.write("                document.cadastro.action = 'CAEFuncionario.jsp';\n");
      out.write("                document.cadastro.submit();\n");
      out.write("            }\n");
      out.write("        } else if (par == 'cancelar') {\n");
      out.write("            document.cadastro.opcao.value = 'nulo';\n");
      out.write("            document.cadastro.nomeFuncionario.value = '';\n");
      out.write("            document.cadastro.salario.value = '';\n");
      out.write("            document.cadastro.nascimento.value = '';\n");
      out.write("            document.cadastro.action = 'CadastroFuncionario.jsp';\n");
      out.write("            document.cadastro.submit();\n");
      out.write("            /// }\n");
      out.write("        } else if (par == 'alterar') {\n");
      out.write("\n");
      out.write("            if (document.cadastro.nomeFuncionario.value == '') {\n");
      out.write("                document.cadastro.mensagem.value = 'Preencha o campo Nome';\n");
      out.write("            } else if (document.cadastro.salario.value == '') {\n");
      out.write("                document.cadastro.mensagem.value = 'Preencha o campo Salário';\n");
      out.write("            }else if (document.cadastro.nascimento.value == '') {\n");
      out.write("                document.cadastro.mensagem.value = 'Preencha o campo Nascimento';\n");
      out.write("            } else {\n");
      out.write("                document.cadastro.opcao.value = 'alterar';\n");
      out.write("                document.cadastro.action = 'CAEFuncionario.jsp';\n");
      out.write("                document.cadastro.submit();\n");
      out.write("            }\n");
      out.write("        } else if (par == 'excluir') {\n");
      out.write("            document.cadastro.opcao.value = 'excluir';\n");
      out.write("            document.cadastro.action = 'CAEFuncionario.jsp';\n");
      out.write("            document.cadastro.submit();\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("   \n");
      out.write("    \n");
      out.write("  \n");
      out.write(" \n");
      out.write("</script>\n");
      out.write("\n");

    DAOCidade daoCidade = new DAOCidade();
    List<Cidade> listaCidades = daoCidade.consultar();
    
    List <String>listaPagamento = new ArrayList();
    listaPagamento.add("Crédito");
    listaPagamento.add("Débito");
    listaPagamento.add("Boleto");
   
    String mensagem = request.getParameter("mensagem");
      // mensagem = new String(mensagem.getBytes(), "ISO-8859-1");
       System.out.println("Mensagem="+mensagem);
    String codigo = request.getParameter("codigo");
    String nomeFuncionario = request.getParameter("nomeFuncionario");
    String salario = request.getParameter("salario");
    String cpf = request.getParameter("cpf");
    String nascimento = request.getParameter("nascimento");
    
    String codigoCidade = request.getParameter("codigoCidade");
    String opcao = request.getParameter("opcao");
    String pagamentoListar = request.getParameter("pagamento");
   
    if (opcao == null) {
        opcao = "nulo";
    }
    if (codigo == null) { // código do funcionário
        codigo = "0";
    }
    if (codigoCidade == null) {
        codigoCidade = "0";
    }
    if (pagamentoListar == null) {
        pagamentoListar = "nulo";
    }


      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=Latin1\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        <h1>Cadastro Funcionário</h1>\n");
      out.write("        <form name=\"cadastro\" >\n");
      out.write("            <p><label>Nome: </label> <input type=\"text\" name=\"nomeFuncionario\" value=\"");
      out.print( (nomeFuncionario == null) ? "" : nomeFuncionario);
      out.write("\" size=\"50\" /></p>\n");
      out.write("            <p><label>Salário: </label><input type=\"number\" name=\"salario\" value=\"");
      out.print( (salario == null) ? "" : salario);
      out.write("\" size=\"5\" /></p>\n");
      out.write("            <p><label>CPF: </label><input type=\"number\" name=\"cpf\" value=\"");
      out.print( (cpf == null) ? "" : cpf);
      out.write("\" size=\"5\" placeholder=\"Digite somente números\" /></p>\n");
      out.write("            <p><label>Nascimento: </label><input type=\"date\" name=\"nascimento\" value=\"");
      out.print( (nascimento == null) ? "" : nascimento );
      out.write("\" size=\"5\" /></p>\n");
      out.write("         \n");
      out.write("            <p><label>Cidade: </label>\n");
      out.write("                <select name=\"cidade\"> \n");
      out.write("                    ");
 for(Cidade cidades:listaCidades){ 
      out.write("\n");
      out.write("                    ");
 if(codigoCidade.equals(String.valueOf(cidades.getCodigo()))) { 
      out.write("\n");
      out.write("                    <option selected value=\"");
      out.print( cidades.getCodigo() );
      out.write("\"> ");
      out.print( cidades.getCidade() );
      out.write("</option>\n");
      out.write("                    ");
}else{
      out.write("\n");
      out.write("                    <option value=\"");
      out.print( cidades.getCodigo() );
      out.write("\"> ");
      out.print( cidades.getCidade() );
      out.write("</option>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                  \n");
      out.write("                </select>\n");
      out.write("            </p>\n");
      out.write("            <p><label>Pagamento </label>\n");
      out.write("                <select name=\"pagamento\"> \n");
      out.write("                    ");
 for(String pagamento: listaPagamento){ 
      out.write("\n");
      out.write("                    ");
 if(pagamentoListar.equals(pagamento)) { 
      out.write("\n");
      out.write("                    <option selected value=\"");
      out.print( pagamentoListar );
      out.write("\"> ");
      out.print( pagamentoListar );
      out.write("</option>\n");
      out.write("                    ");
}else{
      out.write("\n");
      out.write("                    <option value=\"");
      out.print( pagamento );
      out.write("\"> ");
      out.print( pagamento );
      out.write("</option>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                  \n");
      out.write("                </select>\n");
      out.write("            </p>\n");
      out.write("            <p>\n");
      out.write("                ");
 if (opcao.equals("nulo")) { 
      out.write("\n");
      out.write("                <input type=\"button\" value=\"Cadastrar\" name=\"Cadastrar\" onclick=\"enviar('cadastrar')\" />\n");
      out.write("                ");
}
      out.write("\n");
      out.write("\n");
      out.write("                ");
 if (opcao.equals("alterar")) { 
      out.write("\n");
      out.write("                <input type=\"button\" value=\"Alterar\" name=\"Alterar\" onclick=\"enviar('alterar')\" />\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("                ");
 if (opcao.equals("excluir")) { 
      out.write("\n");
      out.write("                <input type=\"button\" value=\"Excluir\" name=\"Excluir\" onclick=\"enviar('excluir')\" />\n");
      out.write("                ");
}
      out.write("\n");
      out.write("                ");
 if (!(opcao.equals("nulo"))) { 
      out.write("\n");
      out.write("                \n");
      out.write("                <input type=\"button\" value=\"Cancelar\" name=\"Cancelar\" onclick=\"enviar('cancelar')\" />\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </p>\n");
      out.write("            <p><textarea name=\"mensagem\" rows=\"2\" cols=\"100\" readonly=\"readonly\" disabled=\"disabled\" > ");
      out.print( (mensagem == null) ? "" : mensagem);
      out.write(" </textarea></p>\n");
      out.write("            <input type=\"hidden\" name=\"opcao\"  />\n");
      out.write("            <input type=\"hidden\" name=\"codigo\" value=\"");
      out.print( codigo);
      out.write("\" />\n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

DAOFuncionario daoFuncionario = new DAOFuncionario();
List<Funcionario> listaFuncionario = daoFuncionario.consultar();
ConverteData converte = new ConverteData();


      out.write("\n");
      out.write("\n");
      out.write("<table border=\"1\"  >\n");
      out.write("    <thead>\n");
      out.write("        <tr>\n");
      out.write("            <th>CÓDIGO</th>\n");
      out.write("            <th>NOME</th>\n");
      out.write("            <th>SALÁRIO</th>\n");
      out.write("            <th>NASCIMENTO</th>\n");
      out.write("            <th>CIDADE</th>\n");
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
      out.write(" </td>\n");
      out.write("            <td>");
      out.print( funcionario.getNome() );
      out.write(" </td>\n");
      out.write("            <td>");
      out.print( funcionario.getSalario() );
      out.write(" </td>\n");
      out.write("            <td>");
      out.print( converte.converteTela(funcionario.getNascimento()) );
      out.write(" </td>\n");
      out.write("            <td>");
      out.print( funcionario.getCidade().getCidade() );
      out.write(" </td>\n");
      out.write("            <td>Débito </td>\n");
      out.write("            <td><a href=\"CadastroFuncionario.jsp?opcao=alterar&pagamento=Débito&codigo=");
      out.print( funcionario.getCodigo());
      out.write("&nomeFuncionario=");
      out.print( funcionario.getNome());
      out.write("&salario=");
      out.print( funcionario.getSalario());
      out.write("&nascimento=");
      out.print( converte.converteTela(funcionario.getNascimento()) );
      out.write("&codigoCidade=");
      out.print( funcionario.getCidade().getCodigo() );
      out.write("&mensagem=Altere os dados e clique no botão alterar\">A</a></td>\n");
      out.write("            <td><a href=\"CadastroFuncionario.jsp?opcao=excluir&pagamento=Débito&codigo=");
      out.print( funcionario.getCodigo());
      out.write("&nomeFuncionario=");
      out.print( funcionario.getNome());
      out.write("&salario=");
      out.print( funcionario.getSalario());
      out.write("&nascimento=");
      out.print( converte.converteTela(funcionario.getNascimento()) );
      out.write("&codigoCidade=");
      out.print( funcionario.getCidade().getCodigo() );
      out.write("&mensagem=Clique no botão excluir para confirmar\">X</a></td>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("        </tr>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
 } else {
      out.write('\n');
      if (true) {
        _jspx_page_context.forward("index.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("mensagem", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("Acesso negado, efetue seu login!", request.getCharacterEncoding()));
        return;
      }
      out.write('\n');
 } 
      out.write('\n');
      out.write('\n');
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
