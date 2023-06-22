<%-- 
    Document   : CAECidade
    Created on : 14/02/2023, 09:35:00
    Author     : johan
--%>
<%@page import="modelo.DAOCidade"%>
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.DAOFuncionario"%>
<%@page import="modelo.Funcionario" %>

<%

    String nomeFuncionario = request.getParameter("nomeFuncionario");
    String salarioFuncionario = request.getParameter("salarioFuncionario");
    String codigoFuncionario = request.getParameter("codigoFuncionario");
    String cargoFuncionario = request.getParameter("cargoFuncionario");
    String emailFuncionario = request.getParameter("emailFuncionario");
    String senhaFuncionario = request.getParameter("senhaFuncionario");
    String nascimentoFuncionario = request.getParameter("nascimentoFuncionario");
    String cidadeFuncionario = request.getParameter("cidadeFuncionario");
    String opcao = request.getParameter("opcao");
    String bairroFuncionario = request.getParameter("bairroFuncionario");
    String enderecoFuncionario = request.getParameter("enderecoFuncionario");
    String mensagem="";
    String usuario;
    
    ConverteData objConverteData = new ConverteData();
    
    DAOCidade objDaoCidade = new DAOCidade();

    Funcionario objFuncionario= new Funcionario();
    
    objFuncionario.setNomeFuncionario(nomeFuncionario);
    objFuncionario.setSalarioFuncionario(Float.parseFloat(salarioFuncionario));
    objFuncionario.setCodigo(Integer.parseInt(codigoFuncionario));
    objFuncionario.setCargoFuncionario(cargoFuncionario);
    objFuncionario.setEmailFuncionario(emailFuncionario);
    objFuncionario.setSenhaFuncionario(senhaFuncionario);
    objFuncionario.setNascimento(objConverteData.converteCalendario(nascimentoFuncionario));
    objFuncionario.getObjCidade().setCodigo(Integer.parseInt(cidadeFuncionario));
    objFuncionario.setBairroFuncionario(bairroFuncionario);
    objFuncionario.setEnderecoFuncionario(enderecoFuncionario);
    
    DAOFuncionario objDAOFuncionario = new DAOFuncionario();
    
    if(opcao.equals("cadastrar")){
    mensagem = objDAOFuncionario.inserir(objFuncionario);
    }
    else if(opcao.equals("alterar")){
    mensagem = objDAOFuncionario.alterar(objFuncionario);
    }
    else if(opcao.equals("excluir")){
    mensagem = objDAOFuncionario.excluir(objFuncionario);
    }
    response.sendRedirect("cadastroFuncionario.jsp?mensagem="+mensagem);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <a href="cadastroCidade.jsp?mensagem= Cadastrado com sucesso!!&nomeFuncionario=<%=nomeFuncionario%>&salarioFuncionario=<%=salarioFuncionario%>">Voltar para Cadastro</a>
                
    </body>
    
    
</html>
