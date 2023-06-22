<%@page import="modelo.DAOLogin"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.Modelo"%>
<%@page import="modelo.DAOModelo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="Latin1" %>
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
        <title>Login</title>
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
        <% if(user.equals("Login")){ %>        
        <form class="formLogin col-sm-5 card m-auto mt-4" method="post" action="CAELogin.jsp">
                <img src="img/logo.png" style="width: 30%">
                <br>
                <label style="width: 50%; height: 50%; size: auto"> Username: </label>
                <input style="width: 80%; height: 80%;" placeholder="Ex: joao.ferreira@jesftechnology.com" type="text" name="email" class="text-login" required/>
                
                <label  style="width: 50%; height: 50%; size: auto" >Password: </label>
                <input style="width: 80%; height: 80%; size: auto" placeholder="Digite sua senha" type="password" name="senha" class="text-login" required/>
                <br>
                <p><input type="checkbox" name="lembrar">Relembre meu usuário</p>
                <input type="hidden" value="1" name="opcao">
                <input style="width: 50%; height: 50%;" type="submit" value="Logar" class="botaoCadastrar botaoLogin">
                
                <p>Não tem uma conta? <a href="cadastrar.jsp">Inscreva-se</a></p>
                <br>
        </form>
        <br>
        <br>
        <% }else{ %>
        <div class="align-self-center">
            <% if(opcao.equals("user")){ %>
                <div>
                    <h2> Bem vindo <%= nome %> </h2>
                </div>
                <div class="align-content-center mx-auto">
                    <div class="align-content-md-center row align-content-center">
                        <div class="col-2 card m-auto">
                            <div class="m-auto">
                            <a href="login.jsp?opcao=minhaconta">
                            <img class="w-50" src="img/juventude.png">
                            <h5>Minha conta</h5>
                            <p>Configurações e endereço</p>
                            </a>
                            </div>
                        </div>

                        <div class="col-2 card m-auto"> 
                            <div class="m-auto">
                            <a href="">
                            <img class="w-50" src="img/sacolas-de-compras.png">
                            <h5>Minhas compras</h5>
                            <p>Rastrear e monitorar</p>
                            </a>
                            </div>
                        </div>
                        
                        <div class="col-2 card m-auto"> 
                            <div class="m-auto">
                            <a href="login.jsp?opcao=chatbot">
                            <img class="w-50" src="img/chatbot.png">
                            <h5>Chat bot</h5>
                            <p>Soluções autonomas</p>
                            </a>
                            </div>
                        </div>
                        
                        <div class="col-2 card m-auto">
                            <div class="m-auto">
                            <a href="">
                            <img class="w-50" src="img/em-breve.png">
                            <h5>EM BREVE</h5>
                            <p>EM BREVE MESMO</p>
                            </a>
                            </div>
                        </div>
                    </div>
                </div>
            <% }else if(opcao.equals("minhaconta")){ %>
            <div class="">
                <div>
                    <h5 class="text-warning"><a href="login.jsp?opcao=user">Login</a> -> Minha conta</h5>
                </div>
                <div class="card bg-dark"></div>
                <% if(alterar.equals("false")){%>
                
                <div class="card align-content-md-center align-content-center col-3 m-auto mt-4">
                    <div class="card-body">
                        <div class="text-center">
                            <div class="">
                                <h6 class="fw-bold">Nome</h6>
                                <p><%= nome %> <%= sobrenome %></p>
                            </div>
                            <div class="border-top">
                                <h6 class="fw-bold">Email</h6>
                                <p><%= email %></p>
                            </div>
                            <div class="border-top">
                                <h6 class="fw-bold">CPF</h6>
                                <p><%= cpf %></p>
                            </div>
                            <div class="border-top">
                                <h6 class="fw-bold">Pix</h6>
                                <p><%= pix %></p>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a class="btn btn-warning" href="login.jsp?alterar=true&opcao=minhaconta">Alterar</a>
                    </div>
                </div>
                            
                <% }else{%>
                <form action="CAECliente.jsp">
                <div class="card align-content-md-center align-content-center col-3 m-auto mt-4">
                    <div class="card-body">
                        <div class="text-center">
                            <div class="">
                                <h6 class="fw-bold">Nome</h6>
                                <input class="col-10" type="text" name="nome" value="<%= nome %>">
                                <h6 class="fw-bold">Sobrenome</h6>
                                <input class="col-10" type="text" name="sobrenome" value="<%= sobrenome %>">
                            </div>
                            <div class="border-top">
                                <h6 class="fw-bold">Email</h6>
                                <input class="col-10" type="email" name="email" value="<%= email %>"> 
                            </div>
                            <div class="border-top">
                                <h6 class="fw-bold">Senha</h6>
                                <input class="col-10" type="password" name="senha" value="<%= senha %>"> 
                            </div>
                            <div class="border-top">
                                <h6 class="fw-bold">CPF</h6>
                                <input class="col-10" type="text" name="cpf" value="<%= cpf %>"> 
                            </div>
                            <div class="border-top">
                                <h6 class="fw-bold">Pix</h6>
                                <input class="col-10" type="text" name="pix" value="<%= pix %>"> 
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <input type="hidden" value="alterar" name="opcao">
                        <input type="hidden" value="<%= user %>" name="codigo">
                        <input type="submit" class="btn btn-warning" value="Concluir">
                    </div>
                </div>
                            </form>
                <% } %>
            </div>
            <% }else if(opcao.equals("chatbot")){ %>
            <div class="">
                <div>
                    <h5 class="text-warning"><a href="login.jsp?opcao=user">Login</a> -> ChatBot</h5>
                </div>
                <div class="card bg-dark"></div>
                <div class="card align-content-md-center align-content-center col-3 m-auto mt-4">
                    <div class="card-text h-auto">
                         <label class="col-5">Olá <%= nome %>! Chat Bot para te ajudar! Está com algum problema?</label>
                    </div>
                    <div class="card-footer">
                        <form action="IA.py" method="post"><input type="text"><input type="submit"></form>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <% } %>
        </div>
    </body>
</html>
