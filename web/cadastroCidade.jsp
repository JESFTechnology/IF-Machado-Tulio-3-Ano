<%@page import="modelo.Cliente"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Modelo"%>
<%@page import="modelo.DAOModelo"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : cadastroCidade
    Created on : 14/02/2023, 09:07:34
    Author     : johan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("user")!=null){
    String mensagem = request.getParameter("mensagem");
    String nomeCidade = request.getParameter("nomeCidade");
    String ufCidade = request.getParameter("ufCidade");
    String codigoCidade = request.getParameter("codigoCidade");
    if(codigoCidade==null)
    {
        codigoCidade ="0";
    }
    String opcao = request.getParameter("opcao");
    if(opcao==null){
        opcao="cadastrar";
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/logoIF.png" type="image/x-icon">
        <!--CSS-->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estilo.css">
          
	<!--Javascript-->
	<script src="js/bootstrap.bundle.js"></script>
        
          
        <title>JSP Cidade</title>
    </head>
    <style>
        body{
            background-image: url("img/fundo2.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
    <body>
        <%@include file="telaMenu.jsp"%>
        <h1 style="text-align: center">CADASTRO DE CIDADES</h1>
        
        <form name="cadastro" method="get" action="CAECidade.jsp" class="formCidade ms-2" style="float: left">
            <p style="margin-top: 10px"><label>Cidade: </label> <input type="text" name="nomeCidade" value="<%= (nomeCidade==null)?"":nomeCidade%>" size="30" /></p>
            <p><label>UF: </label> <input type="text" name="ufCidade" value="<%= (ufCidade==null)?"":ufCidade%>" size="30" /></p>
            
            <%if(opcao.equals("cadastrar")){%>
            <input type="submit" value="Cadastrar" name="cadastrar" class="botaoCadastrar"/>
            <%}else if(opcao.equals("alterar")){%>
            <input type="submit" value="Alterar" name="alterar" class="botaoCadastrar"/>
            <%}else if(opcao.equals("excluir")){%>
            <input type="submit" value="Excluir" name="excluir" class="botaoExcluir"/>
            <%}%>
            <input type="hidden" name="opcao" value="<%=opcao%>"/>
            <input type="hidden" name="codigoCidade" value="<%=codigoCidade%>"/>
            <input type="reset" value="Limpar" name="limpar" class="botaoLimpar"/>
        </form>
        <p><%=(mensagem==null)?"":mensagem%></p>
        <p></p>
        <p></p>
        <div style="float: right">
            <%@include file="listarCidade.jsp"%>
        </div>
        <br>
        </div>
    </body>
</html>
<% } %>