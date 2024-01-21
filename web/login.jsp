<%@page import="modelo.Relatorio"%>
<%@page import="modelo.DAORelatorio"%>
<%@page import="modelo.DAOFuncionario"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.DAOTransporte"%>
<%@page import="modelo.Transporte"%>
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.DAOItensVenda"%>
<%@page import="modelo.ItensVenda"%>
<%@page import="modelo.Caixa"%>
<%@page import="modelo.DAOCaixa"%>
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
    String mensagemRelatorio = request.getParameter("mensagemRelatorio");
    String opcao = request.getParameter("opcao");
    String alterar = request.getParameter("alterar");
    String codVenda = request.getParameter("codVenda");
    String tabelaRelatorio = request.getParameter("tabelaRelatorio");
    DAOLogin objDAOCliente = new DAOLogin();
    List<Funcionario> listaFuncionario = objDAOCliente.listarCliente();
    
    DAOTransporte objDAOTransporte = new DAOTransporte();
    List<Transporte> listaTransporte = objDAOTransporte.listarTransporte();
    
    DAORelatorio objDAORelatorio = new DAORelatorio();
    //List<Relatorio> objDAORelatorio = objDAOTransporte.listarTransporte();
    
    DAOModelo objDAOModelo = new DAOModelo();
    String user = "0",tipoUser="Nada";
    
    //User
    String nome = "Login",email = "",cargo="",cpf="",pix="",senha="";
    List<Modelo> listaModelo = objDAOModelo.listarModelo();
    
    if(alterar==null){
        alterar = "false";
    }
    
    if(codVenda==null){
        codVenda = "0";
    }
    
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
        nome = "Login";
    }
    
    //DAOCaixa objVenda = new DAOCaixa();
    //List<Caixa> listaVenda = objVenda.selecionarVendaAuto2(Integer.valueOf(user));
    
    DAOItensVenda objDAOItensVenda = new DAOItensVenda();
    
    ConverteData objConverte = new ConverteData();
    
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
				<% if(nome!="Login"){%>	
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
        <% if(user.equals("0")){ %>    
        <style>
            .inputT{
                background-color: transparent;
                border: none;
            }
            .inputT:focus{
                background-color: transparent;
                border: none;
            }
        </style>
        <script>
        function mostrarSenha(){
            var campoSenha = document.getElementById("senha");
            var iconeOlho = document.querySelector(".mostrar-senha i");

            if (campoSenha.type === "password") {
                campoSenha.type = "text";
                iconeOlho.classList.remove("fa-eye");
                iconeOlho.classList.add("fa-eye-low-vision");
            } else {
                campoSenha.type = "password";
                iconeOlho.classList.remove("fa-eye-low-vision");
                iconeOlho.classList.add("fa-eye");
            }
            }
        </script>
        <form class="formLogin col-sm-5 card m-auto mt-4 border-dark border-2" method="post" action="CAELogin.jsp">
                <img src="img/logo.png" style="width: 30%">
                <br>
                <h6>Sou o funcionário</h6>
                <input style="width: 80%; height: 80%; size: auto" value="" placeholder="Ex; johannsacconi@gmail.com" type="email" name="email" class="inputT text-login formLogin" required/>
                <div class="border-top border-2 border-dark container mx-2"></div>
                <br>
                <label class="container col-10" style="position: relative;">
                    <div class="row">
                        <input id="senha" placeholder="Digite sua senha" type="password" 
                        name="senha" class="col-10 inputT " required/>

                        <span class="mostrar-senha col-2" onclick="mostrarSenha()"><i class="col-2 fa-solid fa-eye"></i></span>
                    </div>
                </label>
                <div class="border-top border-2 border-dark container mx-2"></div>
                <br>
                <p><input type="checkbox" name="lembrar">Relembre meu usuário</p>
                <input type="hidden" value="1" name="opcao">
                <input style="width: 50%; height: 50%;" type="submit" value="Logar" class="botaoCadastrar botaoLogin">
                
                <p>Não tem uma conta? <a href="cadastrar.jsp">Inscreva-se</a></p>
                
                <p style="color: red"><%= (mensagem==null)?"":mensagem %></p>
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
                            <img class="w-50" src="img/chatbot.png">
                            <h5>Relatórios</h5>
                            <p>Relatórios inteligentes (EM DESENVOLVIMENTO)</p>
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
                                <h6 class="fw-bold">Nome e cargo</h6>
                                <p><%= nome %> <%= cargo %></p>
                            </div>
                            <div class="border-top">
                                <h6 class="fw-bold">Email</h6>
                                <p><%= email %></p>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-center">
                        <a class="btn btn-warning" href="login.jsp?alterar=true&opcao=minhaconta">Alterar</a>
                        <a class="btn btn-danger" href="logoff.jsp">Deslogar</a>
                    </div>
                </div>
                            
                <% }else{%>
                <form action="CAECliente.jsp">
                <div class="card align-content-md-center align-content-center col-3 m-auto mt-4">
                    <div class="card-body">
                        <div class="text-center">
                            <div class="">
                                <h5>Não funciona, é enfeite</h5>
                                <h6 class="fw-bold">Nome</h6>
                                <input class="col-10" type="text" name="nome" value="<%= nome %>">
                                <h6 class="fw-bold">Cargo</h6>
                                <input class="col-10" type="text" name="cargo" value="<%= cargo %>">
                            </div>
                            <div class="border-top">
                                <h6 class="fw-bold">Email</h6>
                                <input class="col-10" type="email" name="email" value="<%= email %>"> 
                            </div>
                            <div class="border-top">
                                <h6 class="fw-bold">Senha</h6>
                                <input class="col-10" type="password" name="senha" value="<%= senha %>"> 
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <input type="hidden" value="login" name="tela">
                        <input type="hidden" value="alterar" name="opcao">
                        <input type="hidden" value="<%= user %>" name="codigo">
                        <input type="submit" class="btn btn-warning" value="Concluir">
                    </div>
                </div>
                            </form>
                <% } %>
            </div>
            <% }else if(opcao.equals("relatorio")){ %>
            <div class="">
                <div>
                    <h5 class="text-warning"><a href="login.jsp?opcao=user">Login</a> -> ChatBot</h5>
                </div>
                <div class="card bg-dark"></div>
                <div class="card align-content-md-center align-content-center col-3 m-auto mt-4">
                    <div class="card-text h-auto">
                        <% if(tabelaRelatorio==null){%>
                         <label class="col-12 m-3">
                             Olá <%= nome %>!
                             <br>
                             Chat Bot para te ajudar!
                             <br>
                             Está com precisando de qual relatório?
                              
                         </label>
                        <%}else if(tabelaRelatorio!=null && mensagemRelatorio==null){%>
                            <label class="col-10 mb-3 ms-3">
                             Olá <%= nome %>!
                             <br>
                             Chat Bot para te ajudar!
                             <br>
                             Está com precisando de qual relatório?
                              
                            </label>
                             <label class="col-10 mb-3 ms-3 text-end">
                             Quero dados da tabela:
                             <br>
                             <%= tabelaRelatorio %>
                            </label>
                            <label class="col-10 mb-3 ms-3">
                             Tabela: <%= tabelaRelatorio %>
                             <br>
                             Agora escolha a coluna
                            </label>
                             <label class="col-10 mb-3 ms-3 text-center">
                             
                            </label>
                        <% }else{%>
                        
                            <label class="col-10 mb-3 ms-3">
                             Olá <%= nome %>!
                             <br>
                             Chat Bot para te ajudar!
                             <br>
                             Está com precisando de qual relatório?
                              
                            </label>
                             <label class="col-10 mb-3 ms-3 text-end">
                             Quero dados da tabela:
                             <br>
                             <%= tabelaRelatorio %>
                            </label>
                            <label class="col-10 mb-3 ms-3">
                             Tabela: <%= tabelaRelatorio %>
                             <br>
                             Agora escolha a coluna
                            </label>
                             
                            <%if(mensagemRelatorio.equals("ERROR")){%>
                             <label class="col-10 mb-3 ms-3 text-center">
                                <div class="text-danger">ERRO</div>
                             </label>
                             <%}else{%>
                             <label class="col-10 mb-3 ms-3 text-center">
                                <div class="text-success"><%= mensagemRelatorio%></div>
                             </label>
                             
                             <%}%>
                        <% }%>
                    </div>
                    <div class="card-footer">
                        <%if(tabelaRelatorio==null){%>
                        <form action="login.jsp" method="get">
                            <select name="tabelaRelatorio">
                                <option selected value="cidade">Cidade</option>
                                <option value="cliente">Cliente</option>
                                <option value="funcionario">Funcionário</option>
                                <option value="itemvenda">Item venda</option>
                                <option value="log">Log</option>
                                <option value="marca">Marcas</option>
                                <option value="modelo">Modelo dos caminhão</option>
                            </select>
                            <input type="hidden" name="opcao" value="relatorio">
                            <input type="submit">
                        </form>
                        <%}else{%>
                        <%
                            DAORelatorio rel = new DAORelatorio();
                            String sql = "SHOW COLUMNS FROM "+tabelaRelatorio;
                            List<Relatorio> listaRelatorio = rel.listarTabela(sql);
                        %>
                        <form action="relatorio.jsp" method="get">
                            <label>
                                
                            Selecione tudo da tabela <%= tabelaRelatorio %> onde
                            <br>
                            <select name="coluna" class="col-md-5">
                                <% for(Relatorio tabelas:listaRelatorio){%>
                    
                                    <option value="<%= tabelas.getTabelas() %>"><%= tabelas.getTabelas() %> </option>

                                <% } %>
                            </select>
                            é
                            <select name="se" class="col-md-5">
                                <option selected value="=">Igual</option>
                                <option value=">">Maior</option>
                                <option value="<">Menor</option>
                            </select>
                            a
                            </label>
                            <input type="text" name="comparacaoColuna" class="col-md-11">
                            <input type="hidden" name="tabelaRelatorio" value="<%= tabelaRelatorio %>">
                            <input type="hidden" name="opcao" value="relatorio">
                            <input type="submit" class="col-md-2">
                        </form>
                        <%}%>
                    </div>
                </div>
            </div>
            <% }else{ %>
                <div class="row">
                    <% List<ItensVenda> listaItens = objDAOItensVenda.getLista(Integer.valueOf(codVenda)); %>
                    <% for(ItensVenda itensVenda:listaItens){ %>
                    <div class="col-2 card text-center">
                    <form action="login.jsp">
                            <p class="text-center">Produto</p>
                            <img src="img/bolsa-de-compras.png" class="col-6" style="margin-top: 10px">
                            <p>Produto comprado <%= itensVenda.getProduto().getNome() %></p>
                            <p>Modelo: <%= itensVenda.getProduto().getObjMarca().getMarca() %></p>
                            <p>Quantidade: <%= itensVenda.getQuantidade() %></p>
                            <p>Valor: <%= itensVenda.getValorProduto() %></p>
                            <input type="hidden" name="codVenda" value="0">
                            <input type="hidden" name="opcao" value="minhascompras">
                            <p><input class="botaoCadastrar" type="submit" name="click" value="Voltar"></p>
                        
                    </form>
                    </div>
                    <% } %>
                </div>
                <% } %>
            </div>
            <% } %>
            
        </div>
        </div>
    </body>
</html>
