package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Produto;
import java.util.List;
import modelo.DAOProduto;

public final class cadastroProdutos_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/listarProdutos.jsp");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("        <div style=\"float: right;\">\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    
    DAOProduto objDAOProduto = new DAOProduto();
    List<Produto> listaProduto = objDAOProduto.listarProduto();
    

      out.write("\n");
      out.write("\n");
      out.write("<table border=\"1\">\n");
      out.write("    <thead>\n");
      out.write("        <tr>\n");
      out.write("            <th>CÓDIGO</th>\n");
      out.write("            <th>NOME</th>\n");
      out.write("            <th>QUANTIDADE</th>\n");
      out.write("            <th>ESTOQUE</th>\n");
      out.write("            <th>PRECO</th>\n");
      out.write("            <th>ALTERAR</th>\n");
      out.write("            <th>EXCLUIR</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");
 for(Produto produto:listaProduto){
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print( produto.getCodigo() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( produto.getNome() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( produto.getQuantidade() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( produto.getEstoque());
      out.write("</td>\n");
      out.write("            <td>");
      out.print( produto.getPreco());
      out.write("</td>\n");
      out.write("            <td><a href=\"cadastroProduto.jsp?opcao=alterar&codigo=");
      out.print( produto.getCodigo() );
      out.write("&nome=");
      out.print( produto.getNome() );
      out.write("&quantidade=");
      out.print( produto.getQuantidade());
      out.write("&estoque=");
      out.print( produto.getEstoque());
      out.write("&preco=");
      out.print(produto.getPreco());
      out.write("\">Alterar</a></td>\n");
      out.write("            <td><a href=\"cadastroProduto.jsp?opcao=excluir&codigo=");
      out.print( produto.getCodigo() );
      out.write("&nome=");
      out.print( produto.getNome() );
      out.write("&quantidade=");
      out.print( produto.getQuantidade());
      out.write("&estoque=");
      out.print( produto.getEstoque());
      out.write("&preco=");
      out.print(produto.getPreco());
      out.write("\">Excluir</a></td>\n");
      out.write("        </tr>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>");
      out.write("\n");
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
