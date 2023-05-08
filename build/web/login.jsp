<%@page import="modelo.Modelo"%>
<%@page import="modelo.DAOModelo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String mensagem = request.getParameter("mensagem");
    DAOModelo objDAOModelo = new DAOModelo();
    String user;
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
        
        <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estilo.css">
          
	<!--Javascript-->
	<script src="js/bootstrap.bundle.js"></script>
        <title>JSP Page</title>
    </head>
    <style>
        body{
            background-image: url("img/fundo2.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            align-items: center;
        }
    </style>
    <body>
        <div class="container-fluid">
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
					<li><a href="#"class="dropdown-item text-white">Produtos</a></li>
                                    <li><a href="cadastroVeiculos.jsp"class="dropdown-item text-white">Transporte</a></li>
                                        <li><a href="#"class="dropdown-item text-white">Mais</a></li>
				</ul>
				</li>
				<li class="nav-item dropdown"><a href="#" class="nav-link text-white dropdown-toggle" data-bs-toggle="dropdown">Caminhões</a>
				<ul class="dropdown-menu p-3">
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
        <% if(user=="Login"){ %>        
        <form class="formLogin card" method="post" action="CAELogin.jsp" aling="center" style="width: auto; height: auto;">
            <img src="img/logoIF.png" style="width: 30%">
                <br>
                <label style="width: 50%; height: 50%; size: auto"> Username: </label>
                <input style="width: 50%; height: 50%;" placeholder="Ex: joao.ferreira@jesftechnology.com" type="text" name="email" class="text-login" checked/>
                
                <label  style="width: 50%; height: 50%; size: auto" >Password: </label>
                <input style="width: 50%; height: 50%; size: auto" placeholder="Digite sua senha" type="password" name="senha" class="text-login" checked/>
                <br>
                <p><input type="checkbox" name="lembrar">Relembre meu usuário</p>
                <input style="width: 50%; height: 50%;" type="submit" value="Logar" class="botaoCadastrar botaoLogin">
                <br>
            </form>
        <br>
        <br>
        <% } %>
        </div>
    </body>
</html>
