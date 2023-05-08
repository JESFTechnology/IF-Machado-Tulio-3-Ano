<%@page import="modelo.Modelo"%>
<%@page import="modelo.DAOModelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Cidade"%>
<%@page import="modelo.DAOCidade"%>
<%@page import="java.util.Calendar"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String mensagem = request.getParameter("mensagem");
    String nomeFuncionario = request.getParameter("nomeFuncionario");
    String salarioFuncionario = request.getParameter("salarioFuncionario");  
    String codigoFuncionario = request.getParameter("codigoFuncionario");
    String cargoFuncionario = request.getParameter("cargoFuncionario");
    String emailFuncionario = request.getParameter("emailFuncionario");
    String senhaFuncionario = ""; //request.getParameter("senhaFuncionario");
    String nascimentoFuncionario = request.getParameter("nascimentoFuncionario");
    String cidadeFuncionario = request.getParameter("cidadeFuncionario");
    String user;
    if(codigoFuncionario==null)
    {
        codigoFuncionario = "0";
    }
    if(cidadeFuncionario==null)
    {
        cidadeFuncionario = "1";
    }
    String opcao = request.getParameter("opcao");
    if(opcao==null){
        opcao="cadastrar";
    }
    
           DAOModelo objDAOModelo = new DAOModelo();
            List<Modelo> listaModelo = objDAOModelo.listarModelo();
    
    DAOCidade daoCidade = new DAOCidade();
    List<Cidade> listaCidade = daoCidade.listarCidade();
    
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
        
        <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estilo.css">
          
	<!--Javascript-->
	<script src="js/bootstrap.bundle.js"></script>
        
        <title>JSP Funcionario</title>
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
        <h1 style="text-align: center">CADASTROS DE FUNCIONÁRIOS</h1>
        
        <form name="cadastro" method="get" action="CAEFuncionario.jsp" class="formCidade">
            <p><label>Funcionário: </label> <input type="text" name="nomeFuncionario" value="<%= (nomeFuncionario==null)?"":nomeFuncionario%>" size="30" /></p>
            <p><label>Cargo: </label> <input type="text" name="cargoFuncionario" value="<%= (cargoFuncionario==null)?"":cargoFuncionario%>" size="30" /></p>
            <p><label>Email: </label> <input type="text" name="emailFuncionario" value="<%= (emailFuncionario==null)?"":emailFuncionario%>" size="30" /></p>
            <p><label>Salário: </label> <input type="text" name="salarioFuncionario" value="<%= (salarioFuncionario==null)?"":salarioFuncionario%>" size="30" /></p>
            <p><label>Nascimento: </label> <input type="text" name="nascimentoFuncionario" value="<%= (nascimentoFuncionario==null)?"":nascimentoFuncionario%>" size="30" /></p>
            
            <p><label>Cidade: </label>
                <select name="cidadeFuncionario">
                    
                    <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->
                    <% for(Cidade cidade:listaCidade){%> <% if (cidadeFuncionario.equals(String.valueOf(cidade.getCodigo()))) {%>
                    
                        <option selected value="<%=  cidade.getCodigo()%>"><%= cidade.getNomeCidade() %> </option>
                    
                      <%} else {%>
                    
                        <option value="<%= cidade.getCodigo() %>"><%= cidade.getNomeCidade()%> </option>
                      
                    <% }} %>
                    
                </select>
            </p>
            
            <%if(opcao.equals("cadastrar")){%>
            <p><label>Senha: </label> <input type="password" name="senhaFuncionario" value="<%= (senhaFuncionario==null)?"":senhaFuncionario%>" size="30" /></p>
            <input type="submit" value="Cadastrar" name="cadastrar" class="botaoCadastrar"/>
            <%}else if(opcao.equals("alterar")){%>
            <input type="submit" value="Alterar" name="alterar" class="botaoCadastrar"/>
            <%}else if(opcao.equals("excluir")){%>
            <input type="submit" value="Excluir" name="excluir" class="botaoExcluir"/>
            <%}%>
            <input type="hidden" name="opcao" value="<%=opcao%>"/>
            <input type="hidden" name="codigoFuncionario" value="<%=codigoFuncionario%>"/>
            <input type="reset" value="Limpar" name="limpar" class="botaoLimpar"/>
        </form>
        <p><%=(mensagem==null)?"":mensagem%></p>
        <p></p>
        <p></p>
        <div style="float: right;">
            <%@include file="listarFuncionario.jsp"%>
        </div>
        <br>
    </body>
</html>
