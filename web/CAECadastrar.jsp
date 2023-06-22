<%-- 
    Document   : CAECadastrar
    Created on : 13/06/2023, 08:32:42
    Author     : johan
--%>

<%@page import="modelo.DAOCadastrar"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String codigoCliente = request.getParameter("codigo");
    String nomeCliente = request.getParameter("nome");
    String sobrenomeCliente = request.getParameter("sobrenome");
    String senhaCliente = request.getParameter("senha");
    String emailCliente = request.getParameter("email");
    String pixCliente = request.getParameter("pix");
    String cpfCliente = request.getParameter("cpf");
    String bairroCliente = request.getParameter("bairro");
    String enderecoCliente = request.getParameter("endereco");
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
    objCliente.setEndereco(enderecoCliente);
    objCliente.setBairro(bairroCliente);
    
    DAOCadastrar objDAOCliente = new DAOCadastrar();
    
    if(opcao.equals("cadastrar")){
    mensagem = objDAOCliente.inserir(objCliente);
    session.setAttribute("user", objDAOCliente.getLastId());
    }
    response.sendRedirect("login.jsp?mensagem="+mensagem);

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
