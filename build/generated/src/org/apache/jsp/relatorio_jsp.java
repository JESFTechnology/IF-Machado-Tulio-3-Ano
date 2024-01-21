package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.URL;
import modelo.DAORelatorio;
import java.io.InputStream;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.util.*;
import net.sf.jasperreports.view.JasperViewer;

public final class relatorio_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.o\n");
      out.write("   \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

  String tabelaRelatorio = request.getParameter("tabelaRelatorio");
  String mensagem = request.getParameter("mensagem");
  String comparacaoColuna = request.getParameter("comparacaoColuna");
  DAORelatorio rel = new DAORelatorio();
    

 
/*ResultSet rs = rel.relatorioFuncionario();

if (rs.next()) {
rs.beforeFirst();


String caminho = "C:/Users/johan/OneDrive/ifmachado23/desenvolvimento web/NetBeansProjects/EstudoCasoJohann/web/relatorios/"+tabelaRelatorio;



		//URL arquivo = getClass().getResource("/relatorio/relatorioFuncionario.jasper");  
                //String caminho2 = arquivo.toString();		
		//JasperReport jr;
		//jr = (JasperReport) JRLoader.loadObject( arquivo );		
		//System.out.println("Caminho: "+jr);		

Map parameters = new HashMap();
//parameters.put( "teste", "Texto enviado 4" );
JRResultSetDataSource jrRS = new JRResultSetDataSource(rs);

JasperPrint impressao = JasperFillManager.fillReport(caminho, parameters,jrRS);

//gravar relatorio com problema não atualiza
//JasperExportManager.exportReportToPdfFile(impressao,caminho + "RelTeste.pdf");
//response.sendRedirect("relatorios/RelTeste.pdf"); //mostra o resultado na tela

//sem gravar o relatório
byte[] bytes = JasperExportManager.exportReportToPdf(impressao);
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream ouputStream = response.getOutputStream();
ouputStream.write(bytes, 0, bytes.length);
ouputStream.flush();
ouputStream.close();

}
  else{*/
    
      out.write('\n');
      out.write('\n');
      if (true) {
        _jspx_page_context.forward("Mensagem.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("mensagem", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("Não há funcionário cadastrado, para cadastrar um funcionário clique no menu CADASTRO > Funcionário.", request.getCharacterEncoding()));
        return;
      }
      out.write("\n");
      out.write("\n");
      out.write("\n");

    //}

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
