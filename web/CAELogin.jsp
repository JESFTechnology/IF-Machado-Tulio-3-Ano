<%-- 
    Document   : CAELogin
    Created on : 21/03/2023, 07:18:41
    Author     : johan
--%>

<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.DAOLogin"%>
<%@page import="modelo.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String lembrar = request.getParameter("lembrar");
    String codigoCliente = request.getParameter("codigo");
    String nomeCliente = request.getParameter("nome");
    String sobrenomeCliente = request.getParameter("sobrenome");
    String senhaCliente = request.getParameter("senha");
    String emailCliente = request.getParameter("email");
    String pixCliente = request.getParameter("pix");
    String cpfCliente = request.getParameter("cpf");
    String opcao = request.getParameter("opcao");
    String mensagem="";
    String exec = "Nada";

    Login objLogin = new Login();
    
    objLogin.setEmail(email);
    objLogin.setSenha(senha);
    
    if(opcao.equals("1"))
    {
        exec = "Logar entrou em ação";
        objLogin.setEmail(email);
        objLogin.setSenha(senha);

        DAOLogin objDAOLogin = new DAOLogin();

        mensagem = objDAOLogin.entrar(objLogin);

        if(mensagem!="ERROR"){
            //if(lembrar.equals("on")){
                session.setAttribute("user", mensagem);
                response.sendRedirect("login.jsp?mensagem="+mensagem);
        }
    
    }
    else
    {
        exec = "Alterar entrou em ação";
        
        Cliente objCliente= new Cliente();
    
        objCliente.setNome(nomeCliente);
        objCliente.setEmail(emailCliente);
        objCliente.setPix(pixCliente);
        objCliente.setCpf(cpfCliente);
        objCliente.setCodigo(Integer.parseInt(codigoCliente));
        objCliente.setSenha(senhaCliente);

        DAOCliente objDAOCliente = new DAOCliente();
        
        mensagem = objDAOCliente.alterar(objCliente);
        response.sendRedirect("login.jsp?opcao=user");
        
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Se está vendo isso, deu merda
        <%= email %>
        <%= senha %>
        <%= opcao %>
        
        <p>O que executou <%= exec %></p>
    </body>
</html>
