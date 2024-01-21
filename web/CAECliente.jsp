<%-- 
    Document   : CAECliente
    Created on : 25/03/2023, 08:03:34
    Author     : johan
--%>

<%@page import="modelo.Cliente"%>
<%@page import="modelo.DAOCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String codigoCliente = request.getParameter("codigo");
    String tela = request.getParameter("tela");
    String nomeCliente = request.getParameter("nome");
    String sobrenomeCliente = request.getParameter("sobrenome");
    String senhaCliente = request.getParameter("senha");
    String emailCliente = request.getParameter("email");
    String pixCliente = request.getParameter("pix");
    String cpfCliente = request.getParameter("cpf");
    String opcao = request.getParameter("opcao");
    String mensagem="";

    Cliente objCliente= new Cliente();
    
    objCliente.setNome(nomeCliente);
    objCliente.setEmail(emailCliente);
    objCliente.setPix(pixCliente);
    objCliente.setCpf(cpfCliente);
    objCliente.setCodigo(Integer.parseInt(codigoCliente));
    objCliente.setSenha(senhaCliente);
    objCliente.setSobrenome(sobrenomeCliente);
    
    DAOCliente objDAOCliente = new DAOCliente();
    
    if(opcao.equals("cadastrar")){
    mensagem = objDAOCliente.inserir(objCliente);
    }
    else if(opcao.equals("alterar")){
    mensagem = objDAOCliente.alterar(objCliente);
    }
    else if(opcao.equals("excluir")){
    mensagem = objDAOCliente.excluir(objCliente);
    }
    if(tela.equals("login")){
        response.sendRedirect("login.jsp?mensagem="+mensagem);
    }else{
        response.sendRedirect("cadastroCliente.jsp?mensagem="+mensagem);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
