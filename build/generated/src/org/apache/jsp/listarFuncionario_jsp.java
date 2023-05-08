package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.ConverteData;
import modelo.Funcionario;
import java.util.List;
import modelo.DAOFuncionario;

public final class listarFuncionario_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    
    DAOFuncionario objDAOCidade = new DAOFuncionario();
    List<Funcionario> listaFuncionario = objDAOCidade.listarFuncionario();
    
    ConverteData objConverte = new ConverteData();
    

      out.write("\n");
      out.write("\n");
      out.write("<table border=\"1\">\n");
      out.write("    <thead>\n");
      out.write("        <tr>\n");
      out.write("            <th>Código</th>\n");
      out.write("            <th>NOME</th>\n");
      out.write("            <th>CARGO</th>\n");
      out.write("            <th>EMAIL</th>\n");
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
      out.print( funcionario.getObjCidade().getNomeCidade());
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
      out.print( funcionario.getObjCidade().getNomeCidade());
      out.write("\">Excluir</a></td>\n");
      out.write("        </tr>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>");
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
