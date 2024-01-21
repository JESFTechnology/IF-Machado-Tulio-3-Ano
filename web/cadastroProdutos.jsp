<%-- 
    Document   : cadastroProdutos
    Created on : 27/03/2023, 12:04:21
    Author     : johan
--%>

<%@page import="modelo.DAOLogin"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.DAOModelo"%>
<%@page import="modelo.Modelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("user")!=null){
    String mensagem = request.getParameter("mensagem");
    String nomeProduto = request.getParameter("nome");
    String quantidadeProduto = request.getParameter("quantidade");  
    String codigoProduto = request.getParameter("codigo");
    String estoqueProduto = request.getParameter("estoque");
    String precoProduto = request.getParameter("preco");
    if(codigoProduto==null)
    {
        codigoProduto = "0";
    }
    String opcao = request.getParameter("opcao");
    if(opcao==null){
        opcao="cadastrar";
    }
    
       DAOModelo objDAOModelo = new DAOModelo();
       List<Modelo> listaModelo = objDAOModelo.listarModelo();
       
    DAOLogin daoLogin = new DAOLogin();
    List<Funcionario> listaFuncionario2 = daoLogin.listarCliente();
    String user = "Login";
    String nome = "Login",email = "",cargo="",cpf="",pix="",senha="";
    if(session.getAttribute("user")!=null)
    {
        user = session.getAttribute("user").toString();
        for(Funcionario funcionario:listaFuncionario2){
            if(user.equals(String.valueOf(funcionario.getCodigo()))){
                nome = funcionario.getNomeFuncionario();
                cargo = funcionario.getCargoFuncionario();
                email = funcionario.getEmailFuncionario();
                senha = funcionario.getSenhaFuncionario();
            }
        }
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
        
        <title>JSP Produtos</title>
    </head>
    <style>
        body{
            background-image: url("img/fundo2.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
    <body>
        <header>
		<nav class="navbar navbar-expand-md px-4 bg-black">
			<div class="navbar-brand">
                            <a href="index.jsp"><img src="img/logo.png" alt="logo png" class="logopngif"></a>
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
                                <li class="nav-item"><a href="login.jsp" class="nav-link text-white"><%= nome %></a></li>
                                
			</ul>
		</div>
		</nav>
	</header>
                                
        <h1 style="text-align: center">CADASTROS DE PRODUTOS</h1>
        <form name="cadastro" method="get" action="CAEProduto.jsp" class="formCidade">
            <p><label>Nome: </label> <input type="text" name="nome" value="<%= (nomeProduto==null)?"":nomeProduto%>" size="30" /></p>
            <p><label>Quantidade: </label> <input type="text" name="quantidade" value="<%= (quantidadeProduto==null)?"":quantidadeProduto%>" size="30" /></p>
            <p><label>Estoque: </label> <input type="text" name="estoque" value="<%= (estoqueProduto==null)?"":estoqueProduto%>" size="30" /></p>
            <p><label>Preço: </label> <input type="text" name="preco" value="<%= (precoProduto==null)?"":precoProduto%>" size="30" /></p>
            
            <%if(opcao.equals("cadastrar")){%>
            <input type="submit" value="Cadastrar" name="cadastrar" class="botaoCadastrar"/>
            <input type="reset" value="Limpar" name="limpar" class="botaoLimpar"/>
            <%}else if(opcao.equals("alterar")){%>
            <input type="submit" value="Alterar" name="alterar" class="botaoCadastrar"/>
            <input type="reset" value="Limpar" name="limpar" class="botaoLimpar"/>
            <%}else if(opcao.equals("excluir")){%>
            <input type="submit" value="Excluir" name="excluir" class="botaoExcluir"/>
            <input type="reset" value="Limpar" name="limpar" class="botaoLimpar"/>
            <%}%>
            <input type="hidden" name="opcao" value="<%=opcao%>"/>
            <input type="hidden" name="codigo" value="<%=codigoProduto%>"/>
        </form>
        <p><%=(mensagem==null)?"":mensagem%></p>
        <p></p>
        <p></p>
        <div style="float: right;">
            <%@include file="listarProdutos.jsp"%>
        </div>
    </body>
</html>
<% }else{response.sendRedirect("login.jsp");} %>