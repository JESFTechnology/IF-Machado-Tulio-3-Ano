<%-- 
    Document   : cadastrar
    Created on : 06/06/2023, 15:51:09
    Author     : johan
--%>

<%@page import="modelo.Cliente"%>
<%@page import="modelo.DAOModelo"%>
<%@page import="modelo.Modelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String mensagem = request.getParameter("mensagem");
    String opcao = request.getParameter("opcao");
    String alterar = request.getParameter("alterar");
    
    if(alterar==null){
        alterar = "false";
    }
    
    if(opcao==null){
        opcao = "user";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <link rel="shortcut icon" href="img/logoIF.png" type="image/x-icon">
        
        <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estilo.css">
          
	<!--Javascript-->
	<script src="js/bootstrap.bundle.js"></script>
        <title>Cadastrar</title>
    </head>
    <body>
        <div class="container-fluid">
        <%@include file="telaMenu.jsp"%>
        
        <form class="formLogin col-sm-5 card m-auto mt-4" method="post" action="CAECadastrar.jsp">
                <img src="img/logo.png" style="width: 30%">
                <br>
                <label  style="width: 50%; height: 50%; size: auto" >Name: </label>
                <input style="width: 80%; height: 80%; size: auto" placeholder="Ex: José" type="text" name="nome" class="text-login" required/>
                
                <label  style="width: 50%; height: 50%; size: auto" >Sobrenome: </label>
                <input style="width: 80%; height: 80%; size: auto" placeholder="Ex: Sacconi" type="text" name="nome" class="text-login" required/>
                
                <label style="width: 50%; height: 50%; size: auto"> Email: </label>
                <input style="width: 80%; height: 80%;" placeholder="Ex: josé.sacconi@jesftechnology.com" type="text" name="email" class="text-login" required/>
                
                <label  style="width: 50%; height: 50%; size: auto" >Password: </label>
                <input style="width: 80%; height: 80%; size: auto" placeholder="Digite sua senha" type="password" name="senha" class="text-login" required/>
                
                <label  style="width: 50%; height: 50%; size: auto" >Cpf: </label>
                <input style="width: 80%; height: 80%; size: auto" placeholder="Ex: 123.456.789-01" type="text" name="cpf" class="text-login" required/>
                
                <label  style="width: 50%; height: 50%; size: auto" >Endereço: </label>
                <input style="width: 80%; height: 80%; size: auto" placeholder="Ex: Rua Sabará 111" type="text" name="endereco" class="text-login" required/>
                
                <label  style="width: 50%; height: 50%; size: auto" >Bairro: </label>
                <input style="width: 80%; height: 80%; size: auto" placeholder="Ex: Residencial Oliveira" type="text" name="bairro" class="text-login" required/>
                
                <br>
                <input type="hidden" value="1" name="opcao">
                <input style="width: 50%; height: 50%;" type="submit" value="Inscrever-se" class="botaoCadastrar botaoLogin">
                <br>
        </form>
        </div>
    </body>
</html>
