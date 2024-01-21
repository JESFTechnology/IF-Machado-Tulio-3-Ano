<%@page import="modelo.DAOFuncionario"%>
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.Funcionario"%>
<%
ConverteData converte = new ConverteData(); 
Funcionario funcionario = new Funcionario();
funcionario.setCodigo(Integer.parseInt(request.getParameter("codigo")));
funcionario.setNome(request.getParameter("nomeFuncionario"));
funcionario.setSalario(Double.parseDouble(request.getParameter("salario")));
funcionario.setNascimento(converte.converteCalendario(request.getParameter("nascimento")));
funcionario.getCidade().setCodigo(Integer.parseInt(request.getParameter("cidade")));

String opcao = request.getParameter("opcao");
DAOFuncionario daoFuncionario = new DAOFuncionario();

if(opcao.equals("cadastrar")){
response.sendRedirect("CadastroFuncionario.jsp?mensagem="+daoFuncionario.inserir(funcionario));
}
if(opcao.equals("alterar")){
response.sendRedirect("CadastroFuncionario.jsp?mensagem="+daoFuncionario.alterar(funcionario));
}
if(opcao.equals("excluir")){
response.sendRedirect("CadastroFuncionario.jsp?mensagem="+daoFuncionario.remover(funcionario));
}
%>