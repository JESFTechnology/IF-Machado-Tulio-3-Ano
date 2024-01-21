<%-- 
    Document   : cadastroCliente
    Created on : 25/03/2023, 08:12:49
    Author     : johan
--%>

<%@page import="modelo.DAOFuncionario"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.Modelo"%>
<%@page import="modelo.DAOModelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("user")!=null){
    String mensagem = request.getParameter("mensagem");
    String nomeCliente = request.getParameter("nome");
    String senhaCliente = request.getParameter("senha");
    String emailCliente= request.getParameter("email");
    String pixCliente= request.getParameter("pix");
    String codigoCliente = request.getParameter("codigo");
    String cpfCliente = request.getParameter("cpf");
    if(codigoCliente==null)
    {
        codigoCliente ="0";
    }
    String opcao = request.getParameter("opcao");
    if(opcao==null){
        opcao="cadastrar";
    }
    
    DAOModelo objDAOModelo = new DAOModelo();
    List<Modelo> listaModelo = objDAOModelo.listarModelo();
    
    DAOCliente daoCliente = new DAOCliente();
    /*List<Cliente> listaCliente = daoCliente.getLista();*/
    
    String user = "Login";
    String nome = "Login",email = "",cargo="",cpf="",pix="",senha="";
    DAOFuncionario daoFuncionario = new DAOFuncionario();
    List<Funcionario> listaFuncionario = daoFuncionario.listarFuncionario();
    if(session.getAttribute("user")!=null)
    {
    user = session.getAttribute("user").toString();

        for(Funcionario funcionario:listaFuncionario){
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
        <h1 style="text-align: center">CADASTRO DE CLIENTES</h1>
        <form name="cadastro" method="get" action="CAECliente.jsp" class="formCidade">
            <p style="margin-top: 10px"><label>Nome: </label> <input type="text" name="nome" value="<%= (nomeCliente==null)?"":nomeCliente%>" size="30" checked/></p>
            <p><label>Email: </label> <input type="text" name="email" value="<%= (emailCliente==null)?"":emailCliente%>" size="30" checked/></p>
            <p><label>Senha: </label> <input type="password" name="senha" value="<%= (senhaCliente==null)?"":senhaCliente%>" size="30" checked/></p>
            <p><label>Pix: </label> <input type="text" name="pix" value="<%= (pixCliente==null)?"":pixCliente%>" size="30" checked/></p>
            <p><label>Cpf: </label> <input type="text" name="cpf" value="<%= (cpfCliente==null)?"":cpfCliente%>" size="30" checked/></p>
            
            <%if(opcao.equals("cadastrar")){%>
            <input type="submit" value="Cadastrar" name="cadastrar" class="botaoCadastrar"/>
            <%}else if(opcao.equals("alterar")){%>
            <input type="submit" value="Alterar" name="alterar" class="botaoCadastrar"/>
            <%}else if(opcao.equals("excluir")){%>
            <input type="submit" value="Excluir" name="excluir" class="botaoExcluir"/>
            <%}%>
            <input type="hidden" name="opcao" value="<%=opcao%>"/>
            <input type="hidden" name="codigo" value="<%=codigoCliente%>"/>
            <input type="reset" value="Limpar" name="limpar" class="botaoLimpar"/>
            <input type="hidden" value="cliente" name="tela">
        </form>
        <p><%=(mensagem==null)?"":mensagem%></p>
        <p></p>
        <p></p>
        <div style="float: right;">
            <%@include file="listarCliente.jsp"%>
        </div>
        <br>
        
    </body>
</html>
<% } %>