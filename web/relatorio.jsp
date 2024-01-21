

<%@page import="java.net.URL"%>
<%@page import="modelo.DAORelatorio"%>
<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.o
   
<%@page import="java.sql.*,java.util.HashMap,java.util.Map,net.sf.jasperreports.engine.*, net.sf.jasperreports.engine.util.*,net.sf.jasperreports.view.JasperViewer" %>




<%
  
  String tabelaRelatorio = request.getParameter("tabelaRelatorio");
  
  String coluna = request.getParameter("coluna");
  
  String selecao = request.getParameter("se");
  
  String inputText = request.getParameter("comparacaoColuna");
  
  DAORelatorio rel = new DAORelatorio();
  ResultSet rs = null;
  
  if(tabelaRelatorio==null||coluna==null||selecao==null||inputText==null){
    response.sendRedirect("login.jsp?mensagemRelatorio=SELECT * FROM "+tabelaRelatorio+" WHERE "+coluna+selecao+"'"+inputText+"'"+"&opcao=relatorio&tabelaRelatorio="+tabelaRelatorio);
  }
  
  
  // Puxar os dados através da coluna, seleção e texto de input
    rs = rel.relatorio(tabelaRelatorio, coluna, selecao, inputText);
    //response.sendRedirect("login.jsp?opcao=relatorio&tabelaRelatorio="+tabelaRelatorio+"&mensagemRelatorio="+"Relatório Executado");
    if (rs==null){
        response.sendRedirect("login.jsp?mensagemRelatorio=ERROR&opcao=relatorio&tabelaRelatorio="+tabelaRelatorio);
    }
    if (rs.next()) {
        rs.beforeFirst();
        String caminho = "C:/Users/johan/OneDrive/ifmachado23/desenvolvimento web/NetBeansProjects/EstudoCasoJohann/web/relatorios/"+tabelaRelatorio+".jasper";

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

        }else{
          response.sendRedirect("login.jsp?opcao=relatorio&tabelaRelatorio="+tabelaRelatorio+"&mensagemRelatorio="+"ERROR No relatório");
        }
%>