package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.ConverteData;
import java.sql.Date;
import java.text.SimpleDateFormat;
import modelo.ItensVenda;
import modelo.DAOItensVenda;
import modelo.DAOProduto;
import modelo.Produto;
import java.util.List;
import modelo.Cliente;
import modelo.DAOCliente;

public final class CadastroCaixa_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<script>\n");
      out.write("    function enviar(par) {\n");
      out.write("        if (par == 'cadastrar') {\n");
      out.write("\n");
      out.write("            if (document.cadastro.dataVenda.value == '') {\n");
      out.write("                document.cadastro.mensagem.value = 'Preencha o campo Data da Venda';\n");
      out.write("            } else {\n");
      out.write("                document.cadastro.opcao.value = 'cadastrar';\n");
      out.write("                document.cadastro.action = 'CRUDCaixa.jsp';\n");
      out.write("                document.cadastro.submit();\n");
      out.write("            }\n");
      out.write("        } else if (par == 'vender') {\n");
      out.write("            if (document.cadastro.idProduto.value == '') {\n");
      out.write("                document.cadastro.mensagem.value = 'Selecione um produto para venda';\n");
      out.write("            } else {\n");
      out.write("            document.cadastro.opcao.value = 'vender';\n");
      out.write("            document.cadastro.action = 'CRUDCaixa.jsp';\n");
      out.write("            document.cadastro.submit();\n");
      out.write("        }\n");
      out.write("    }else if (par == 'remover') {\n");
      out.write("            if (document.cadastro.idProdAdquirido.value == '') {\n");
      out.write("                document.cadastro.mensagem.value = 'Selecione um produto para remover';\n");
      out.write("            } else {\n");
      out.write("            document.cadastro.opcao.value = 'remover';\n");
      out.write("            document.cadastro.action = 'CRUDCaixa.jsp';\n");
      out.write("            document.cadastro.submit();\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("            /// }\n");
      out.write("         else if (par == 'finalizar') {\n");
      out.write("            document.cadastro.opcao.value = 'finalizar';\n");
      out.write("            document.cadastro.action = 'CRUDCaixa.jsp';\n");
      out.write("            document.cadastro.submit();\n");
      out.write("        } else if (par == 'cancelar') {\n");
      out.write("            document.cadastro.opcao.value = 'cancelar';\n");
      out.write("            document.cadastro.action = 'CRUDCaixa.jsp';\n");
      out.write("            document.cadastro.submit();\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("\n");

   ConverteData data = new ConverteData();
   String dataAtual = data.dataAtual();
    
    DAOCliente daoCliente = new DAOCliente();
    List<Cliente> listaCliente = daoCliente.getLista();

    DAOProduto daoProduto = new DAOProduto();
    List<Produto> listaProduto = daoProduto.listarProduto();

    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    String codigoCaixa = request.getParameter("codigoCaixa");
    String codigoCliente = request.getParameter("codigoCliente");
    String dataVenda = request.getParameter("dataVenda");

    if (dataVenda == null) {
       dataVenda = dataAtual;
    }
    if (codigoCaixa == null) {
        codigoCaixa = "0";
        
    }
    if (codigoCliente == null) {
        codigoCliente = "0";
    }
    if (opcao == null) {
        opcao = "nulo";
    }

    DAOItensVenda daoItens = new DAOItensVenda();
    List<ItensVenda> listaItens = daoItens.getLista(Integer.parseInt(codigoCaixa));

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>CAIXA</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>CAIXA Nº VENDA: ");
      out.print( codigoCaixa);
      out.write(" - ");
      out.print( codigoCliente);
      out.write("</h1>\n");
      out.write("        <form name=\"cadastro\">\n");
      out.write("\n");
      out.write("            <p>  <label> Cliente:</label> \n");
      out.write("                <select name=\"idCliente\">\n");
      out.write("                    ");
 for (Cliente lista : listaCliente) { 
      out.write("\n");
      out.write("                    ");
 if (codigoCliente.equals(String.valueOf(lista.getCodigo()))) {
      out.write("\n");
      out.write("                    <option selected value=\"");
      out.print( lista.getCodigo() );
      out.write('"');
      out.write('>');
      out.print( lista.getNome() );
      out.write("</option>\n");
      out.write("                    ");
} else {
      out.write("\n");
      out.write("                    <option  value=\"");
      out.print( lista.getCodigo() );
      out.write('"');
      out.write('>');
      out.print( lista.getNome() );
      out.write("</option>\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("                </select></p>\n");
      out.write("\n");
      out.write("            <p>  <label> Data:</label>   <input type=\"text\" name=\"dataVenda\" value=\"");
      out.print( (dataVenda == null) ? "" : dataVenda);
      out.write("\" size=\"10\" /></p>\n");
      out.write("            \n");
      out.write("                ");
 if (!codigoCaixa.equals("0")) { 
      out.write("\n");
      out.write("            <table border=\"0\" cellspacing=\"3\" cellpadding=\"3\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        <p>  <label> Lista de Produtos:</label> <br>\n");
      out.write("                            <select name=\"idProduto\" size=\"10\">\n");
      out.write("                                ");
 for (Produto lista : listaProduto) {
      out.write("\n");
      out.write("                                <option  value=\"");
      out.print( lista.getCodigo() );
      out.write('"');
      out.write('>');
      out.print( lista.getNome() );
      out.write(" R$: ");
      out.print( lista.getPreco() );
      out.write("</option>\n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                            </select></p>\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        Quant.<br>\n");
      out.write("                        <input type=\"text\" name=\"quantidade\" value=\"1\"  size=\"2\" /><br><br>\n");
      out.write("                        \n");
      out.write("                        <input type=\"button\" value=\"Vender\" name=\"vender\" onclick=\"enviar('vender')\" />\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <p>  <label> Produtos Vendidos:</label> <br>\n");
      out.write("                            <select name=\"idProdAdquirido\" size=\"10\">\n");
      out.write("                                ");
 for (ItensVenda lista : listaItens) {
      out.write("\n");
      out.write("                                <option  value=\"");
      out.print( lista.getIdItens() );
      out.write('"');
      out.write('>');
      out.print( lista.getProduto().getNome() );
      out.write(" Qde: ");
      out.print( lista.getQuantidade());
      out.write(" R$: ");
      out.print( lista.getValorProduto());
      out.write("</option>\n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                            </select>\n");
      out.write("                        <input type=\"button\" value=\"Remover\" name=\"remover\" onclick=\"enviar('remover')\" />\n");
      out.write("                        </p>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("            ");
 if (codigoCaixa.equals("0")) { 
      out.write("\n");
      out.write("            <input type=\"button\" value=\"Cadastrar\" name=\"cadastrar\" onclick=\"enviar('cadastrar')\" />\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("            ");
 if (!codigoCaixa.equals("0")) { 
      out.write("\n");
      out.write("            <input type=\"button\" value=\"Finalizar\" name=\"finalizar\" onclick=\"enviar('finalizar')\"/>\n");
      out.write("            <input type=\"button\" value=\"Cancelar\" name=\"cancelar\" onclick=\"enviar('cancelar')\"/>\n");
      out.write("            ");
 }
      out.write("\n");
      out.write("\n");
      out.write("        </p>\n");
      out.write("        <p><textarea name=\"mensagem\" rows=\"2\" cols=\"60\">\n");
      out.write("                ");
      out.print( (mensagem == null) ? "" : mensagem);
      out.write("</textarea></p>\n");
      out.write("\n");
      out.write("        <input type=\"hidden\" name=\"opcao\" />\n");
      out.write("        <input type=\"hidden\" name=\"codigoCaixa\" value=\"");
      out.print( codigoCaixa);
      out.write("\"/>\n");
      out.write("      </form> \n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
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
