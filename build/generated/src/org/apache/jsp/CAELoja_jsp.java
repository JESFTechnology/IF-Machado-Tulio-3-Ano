package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.DAOProduto;
import modelo.Produto;
import modelo.ConverteData;
import modelo.DAOItemVenda;
import modelo.ItemVenda;
import modelo.DAOVenda;
import modelo.Venda;

public final class CAELoja_jsp extends org.apache.jasper.runtime.HttpJspBase
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


    String mensagem;
    String codigoCliente = request.getParameter("codCliente");
    String codigoProduto = request.getParameter("codProduto");
    String codigoVenda = request.getParameter("codVenda");
    String quantidade = request.getParameter("quantidade");
    String valor = request.getParameter("valor");
    String opcao = request.getParameter("opcao");
    
    DAOVenda daoCaixa = new DAOVenda();
    Venda objVenda = new Venda();
    ItemVenda itensVenda = new ItemVenda();
    DAOItemVenda daoItens = new DAOItemVenda();
    
    objVenda.getObjCliente().setCodigo(Integer.valueOf(codigoCliente));
    
    itensVenda.getObjProduto().setCodigo(Integer.valueOf(codigoProduto));
    itensVenda.setValor(Double.valueOf(valor));
    itensVenda.setQuantVenda(Integer.valueOf(quantidade));
    itensVenda.getObjVenda().setCodigo(Integer.valueOf(codigoVenda));
    

    if (opcao.equals("cadastrar")) {
        mensagem = daoCaixa.incluir(objVenda);
    }
    if (opcao.equals("comprar")) {
        mensagem = daoItens.incluir(itensVenda);
    }
    /*
    if (opcao.equals("vender")){
        Produto produto = new Produto();
        DAOProduto daoProduto = new DAOProduto();
        produto = daoProduto.localizar(Integer.parseInt(request.getParameter("idProduto")));
        double valorProduto = produto.getPreco()*Integer.parseInt(request.getParameter("quantidade"));
        itensVenda.setCodigo(Integer.parseInt(codigoCaixa));
        itensVenda.getObjProduto().setCodigo(Integer.parseInt(request.getParameter("idProduto")));
        itensVenda.setQuantVenda(Integer.parseInt(request.getParameter("quantidade")));
        itensVenda.setValor(valorProduto);
        response.sendRedirect("loja.jsp?mensagem=" + daoItens.incluir(itensVenda)+"&codigoCaixa="+codigoCaixa+"&codigoCliente="+caixa.getObjCliente().getCodigo()+"&dataVenda="+dataVenda);
    }
      if (opcao.equals("remover")){
        itensVenda.setCodigo(Integer.parseInt(idprodAdquirido));
        response.sendRedirect("loja.jsp?mensagem=" + daoItens.remover(itensVenda)+"&codigoCaixa="+codigoCaixa+"&codigoCliente="+caixa.getObjCliente().getCodigo()+"&dataVenda="+dataVenda);
    }
    if (opcao.equals("finalizar")){
        response.sendRedirect("loja.jsp?mensagem=Venda Finalizada&codigoCaixa=0");
    }
     if (opcao.equals("cancelar")){
        response.sendRedirect("loja.jsp?mensagem=" + daoCaixa.remove(caixa)+"&codigoCaixa=0");
    }*/


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
