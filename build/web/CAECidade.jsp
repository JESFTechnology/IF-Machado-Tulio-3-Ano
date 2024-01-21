<%@page import="modelo.DAOCidade"%>
<%@page import="modelo.Cidade"%>
<%
String opcao = request.getParameter("opcao");
//String opcao2 =${param.opcao};
String codigo = request.getParameter("codigo");
    
Cidade cidade = new Cidade();
cidade.setCodigo(Integer.parseInt(codigo));
cidade.setCidade(request.getParameter("cidade"));
cidade.setUf(request.getParameter("uf"));

DAOCidade daoCidade = new DAOCidade();

String mensagem="";
if(opcao.equals("cadastrar")){
 mensagem = daoCidade.inserir(cidade);
response.sendRedirect("CadastroCidade.jsp?mensagem="+mensagem);
}
if(opcao.equals("alterar")){
 mensagem = daoCidade.alterar(cidade);
response.sendRedirect("CadastroCidade.jsp?mensagem="+mensagem);
}
if(opcao.equals("excluir")){
 mensagem = daoCidade.remover(cidade);
response.sendRedirect("CadastroCidade.jsp?mensagem="+mensagem);
}
%>

