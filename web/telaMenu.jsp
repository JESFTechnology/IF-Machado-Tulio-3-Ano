<%-- 
    Document   : telaMenu
    Created on : 26/07/2023, 07:48:40
    Author     : johan
--%>
<%@page import="modelo.DAOFuncionario"%>
<%@page import="modelo.DAOLogin"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.Modelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOModelo"%>
<%
DAOModelo objDAOModelo = new DAOModelo();
List<Modelo> listaModelo = objDAOModelo.listarModelo();
DAOFuncionario daoFuncionario = new DAOFuncionario();
List<Funcionario> listaFuncionario = daoFuncionario.listarFuncionario();
String user = "Login";
String nome = "Login",email = "",cargo="",cpf="",pix="",senha="";
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
else{
    user = "Login";
}
%>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/logoIF.png" type="image/x-icon">
        
        <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estilo.css">
</head>
<header>
		<nav class="navbar navbar-expand-md px-4 bg-black">
			<div class="navbar-brand">
                            <a href="index.jsp"><img src="img/logo.png" alt="logo png" class="logopngif"></a>
			</div >
			<button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#menubar"><span class="fa-solid fa-bars"></span></button>

			<div class="collapse navbar-collapse" id="menubar">
			<ul class="navbar-nav">
                            <li class="nav-item"><a href="index.jsp" class="nav-link text-white">Home</a></li>
				<% if(user!="Login"){%>	
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
                                <%}%>
                                <li class="nav-item"><a href="loja.jsp" class="nav-link text-white">Loja</a></li>
                                <li class="nav-item"><a href="login.jsp" class="nav-link text-white"><%= nome %></a></li>
			</ul>
		</div>
		</nav>
</header>
