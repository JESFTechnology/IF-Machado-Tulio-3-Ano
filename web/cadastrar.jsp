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
    DAOLogin objDAOCliente = new DAOLogin();
    List<Cliente> listaCliente = objDAOCliente.listarCliente();
    
    DAOModelo objDAOModelo = new DAOModelo();
    String user = "Login";
    
    //User
    String nome = "Login",email = "",sobrenome="",cpf="",pix="",senha="";
    List<Modelo> listaModelo = objDAOModelo.listarModelo();
    
    if(alterar==null){
        alterar = "false";
    }
    
    if(session.getAttribute("user")!=null)
    {
        user = session.getAttribute("user").toString();
        
        for(Cliente cliente:listaCliente){
            if(user.equals(String.valueOf(cliente.getCodigo()))){
                nome = cliente.getNome();
                email = cliente.getEmail();
                sobrenome = cliente.getSobrenome();
                cpf = cliente.getCpf();
                pix = cliente.getPix();
                senha = cliente.getSenha();
            }
        }
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
                                <li class="nav-item"><a href="login.jsp" class="nav-link text-white"><%= nome %></a></li>
                                
			</ul>
		</div>
		</nav>
	</header>
        
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
