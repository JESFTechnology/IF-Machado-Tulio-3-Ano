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
    String mensagem = request.getParameter("mensagem");
    String nomeCidade = request.getParameter("nomeCidade");
    String ufCidade = request.getParameter("ufCidade");
    String codigoCidade = request.getParameter("codigoCidade");
    String user;
    if(codigoCidade==null)
    {
        codigoCidade ="0";
    }
    String opcao = request.getParameter("opcao");
    if(opcao==null){
        opcao="cadastrar";
    }
    

    DAOModelo objDAOModelo = new DAOModelo();
    List<Modelo> listaModelo = objDAOModelo.listarModelo();
    
    if(session.getAttribute("user")==null)
    {
        user = "Login";
    }
    else
    {
        user = session.getAttribute("user").toString();
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
        <div class="container-fluid">
         <header class="fixed-top">
		<nav class="navbar navbar-expand-md .px-4">
			<div class="navbar-brand">
                            <a href="index.jsp"><img src="img/logoIF.png" alt="logo png" class="logopngif"></a>
			</div >
			<button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#menubar"><span class="fa-solid fa-bars"></span></button>

			<div class="collapse navbar-collapse" id="menubar">
			<ul class="navbar-nav">
                            <li class="nav-item"><a href="index.jsp" class="nav-link text-white">Home</a></li>
				<li class="nav-item dropdown">
					<a href="#" class="nav-link text-white dropdown-toggle" data-bs-toggle="dropdown">Modelos</a>
				<ul class="dropdown-menu p-3">
                                    <li><a href="cadastroCidade.jsp"class="dropdown-item text-white">Cidade</a></li>
                                    <li><a href="cadastroFuncionario.jsp"class="dropdown-item text-white">Funcionários</a></li>
                                    <li><a href="cadastroProdutos.jsp"class="dropdown-item text-white">Produtos</a></li>
                                    <li><a href="cadastroVeiculos.jsp"class="dropdown-item text-white">Transporte TESTE</a></li>
                                    <li><a href="cadastroCliente.jsp"class="dropdown-item text-white">Clientes</a></li>
				</ul>
				</li>
				<li class="nav-item dropdown"><a href="#" class="nav-link text-white dropdown-toggle" data-bs-toggle="dropdown">Caminhões</a>
				<ul class="dropdown-menu">
                                        <% for(Modelo modelo:listaModelo){%>
					<li><a href="https://www.caminhoesecarretas.com.br/venda/caminhao/<%= modelo.getModelo() %>/marca/<%= modelo.getCodigo() %>"class="dropdown-item text-white"><%=modelo.getModelo()%></a></li>
                                        <%}%>
				</ul>
				</li>
                                <li class="nav-item"><a href="loja.jsp" class="nav-link text-white">Loja</a></li>
                                <li class="nav-item"><a href="login.jsp" class="nav-link text-white"><%= user %></a></li>
                                
			</ul>
		</div>
		</nav>
	</header>
        <h1 style="text-align: center">CADASTRO DE CIDADES</h1>
        <form name="cadastro" method="get" action="CAECidade.jsp" class="formCidade">
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
        <div>
            <%@include file="listarCidade.jsp"%>
        </div>
        <br>
        </div>
    </body>
</html>