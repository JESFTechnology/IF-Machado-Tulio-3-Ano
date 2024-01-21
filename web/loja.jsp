<%-- 
    Document   : loja
    Created on : 02/05/2023, 08:50:11
    Author     : johan
--%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.DAOTransporte"%>
<%@page import="modelo.Transporte"%>
<%@page import="modelo.DAOItensVenda"%>
<%@page import="modelo.ItensVenda"%>
<%@page import="modelo.DAOCaixa"%>
<%@page import="modelo.Caixa"%>
<%@page import="modelo.DAOLogin"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.DAOProduto"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.Modelo"%>
<%@page import="modelo.DAOModelo"%>
<%@page import="modelo.Marca"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOMarca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        
        <title>JSP Loja</title>
    </head>
    <%
       String dados = "N";
       String mensagem = request.getParameter("mensagem");
       String selecao = request.getParameter("selecao");
       String user;
       String nome = "Login",email = "",cargo="",cpf="",pix="",senha="",codVenda="0",transporteVenda = "0",codCliente="";
       if(selecao == null){
           selecao = "2";
       }
       
       DAOMarca objDAOMarca = new DAOMarca();
       List<Marca> listaMarca = objDAOMarca.listarMarca();
       
       DAOLogin objDAOCliente = new DAOLogin();
       List<Funcionario> listaFuncionario = objDAOCliente.listarCliente();
       
       DAOModelo objDAOModelo = new DAOModelo();
       List<Modelo> listaModelo = objDAOModelo.listarModelo();
       
       DAOProduto objDAOProduto = new DAOProduto();
       List<Produto> listaProduto = objDAOProduto.listarProduto();
       
       DAOCaixa objVenda = new DAOCaixa();
       DAOItensVenda objDAOItensVenda = new DAOItensVenda();
       
       DAOTransporte objDAOTransporte = new DAOTransporte();
       List<Transporte> listaTransporte = objDAOTransporte.listarTransporte();
       
       DAOCliente objDAOCliente1 = new DAOCliente();
       List<Cliente> listaCliente = objDAOCliente1.listarCliente();
       
    if(session.getAttribute("user")==null)
    {
        user = "Login";
    }
    else
    {
        user = String.valueOf(session.getAttribute("user"));
        List<Caixa> listaVenda = objVenda.selecionarVendaAuto();
        
        for(Funcionario funcionario:listaFuncionario){
            if(user.equals(String.valueOf(funcionario.getCodigo()))){
                nome = funcionario.getNomeFuncionario();
                cargo = funcionario.getCargoFuncionario();
                email = funcionario.getEmailFuncionario();
                senha = funcionario.getSenhaFuncionario();
            }
        }
        
        for(Caixa venda:listaVenda){
            
            codVenda = String.valueOf(venda.getIdCaixa());
            codCliente = String.valueOf(venda.getCliente().getCodigo());
            transporteVenda = String.valueOf(venda.getTransporte().getCodigo());
        }
        
        if(codVenda.equals("0")){
            dados = "N";
        }
        else
        {
            dados = "S";
        }
        
        if(transporteVenda.equals("0") || transporteVenda==null){
            transporteVenda = "0";
        }
        
    }
    %>
    <style>
        body{
            background-image: url("img/fundo2.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        
        .caixaProduto{
            background-color: #bebebf;
            margin-bottom: 10px;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 10px;
            border-radius: 20px;
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
        <h1 style="text-align: center">LOJA</h1>
        <div class="row">
            <div class="col-9">
            <form action="loja.jsp">
                <p><label>Selecione aqui a marca do seu produto: </label>
                    <select name="selecao">
                            <option value="1">Nada</option>

                        <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->
                        <% for(Marca marca:listaMarca){%>

                            <option value="<%= marca.getCodigo() %>"><%= marca.getMarca()%> </option>

                        <% } %>

                    </select>
                </p>
                <input type="submit">
            </form>
                    <div class="row">  
                        <% for(Produto produto:listaProduto){if(selecao.equals(String.valueOf(produto.getObjMarca().getCodigo()))){ %>
                        <div class="col-3 caixaProduto">
                            <% if(produto.getObjMarca().getMarca().equals("Arduino")){ %>
                                <img src="img/arduino-logo.png" style="width: 100px; margin-top: 10px">
                            <% }else if(produto.getObjMarca().getMarca().equals("WIFI")){ %>
                                <img src="img/net-logo.png" style="width: 100px; margin-top: 10px">
                            <% }else if(produto.getObjMarca().getMarca().equals("Módulo")){ %>
                                <img src="img/extencao-logo.png" style="width: 100px; margin-top: 10px">
                            <% }else if(produto.getObjMarca().getMarca().equals("Motores")){ %>
                                <img src="img/motor-logo.png" style="width: 100px; margin-top: 10px">
                            <% }else if(produto.getObjMarca().getMarca().equals("Sensor")){ %>
                                <img src="img/sensor-logo.png" style="width: 100px; margin-top: 10px">
                            <% } %>
                            <p>Nome: <%= produto.getNome() %></p>
                            <p>R$<%= produto.getPreco() %></p>
                            <form action="CAEloja.jsp">
                                <p>Quantidade: <input value="1" type="number" name="quantidade" style="background-color:transparent;" checked=""></p>
                                <input type="hidden" name="codProduto" value="<%= produto.getCodigo() %>">
                                <input type="hidden" name="codVenda" value="<%= codVenda %>">
                                <input type="hidden" name="codCliente" value="<%= user %>">
                                <input type="hidden" name="valor" value="<%= produto.getPreco() %>">
                                <input type="hidden" name="nomeP" value="<%= produto.getNome() %>">
                                <input type="hidden" value="comprar" name="opcao">
                                <p><input type="submit" name="opcao" value="Comprar"></p>
                            </form>
                        </div>
                    <% }} %>
                    </div>
            </div>
            <div class="col-3">
                        <h4>Lista de compras não completas:</h4>
                        <h6>Bem vindo <%= nome%> </h6>
                        <p><%= (mensagem==null)?"":mensagem %></p>
                        <% List<ItensVenda> listaItens = objDAOItensVenda.getLista(Integer.valueOf(codVenda)); %>
                            <% for(ItensVenda itensVenda:listaItens){ %>
                            <form action="CAEloja.jsp" class="card border-dark mt-2">
                                <p class="text-center">Compra</p>
                                <p>Produto: <%= itensVenda.getProduto().getNome() %> R$<%= itensVenda.getProduto().getPreco() %></p>
                                <p>Modelo: <%= itensVenda.getProduto().getObjMarca().getMarca() %></p>
                                <p>Quantidade: <%= itensVenda.getQuantidade() %></p>
                                <p>Valor: <%= itensVenda.getValorProduto() %></p>
                                <input type="hidden" name="codCliente" value="<%= user %>">
                                <input type="hidden" name="codItemVenda" value="<%= itensVenda.getIdItens() %>">
                                <p><input class="botaoExcluir" type="submit" name="opcao" value="remover"></p>
                            </form>
                            <% } %>
                        <form action="CAEloja.jsp">
                            <% if(!user.equals("Login")){ %>
                            <% if(dados.equals("S")){%>
                                <p>Deseja concluir seu carrinho de compras?</p>
                                <div class="row">
                                    <div class="row">
                                    <p><input class="botaoCadastrar" type="submit" name="opcao" value="concluir"></p>
                                    <!--<p><input class="botaoCadastrar" type="submit" name="opcao" value="salvar"></p>-->
                                    <p><input class="botaoExcluir" type="submit" name="opcao" value="cancelar"></p>
                                    </div>
                                <p><label>Transportadora <%= transporteVenda %>: </label>
                                    <select name="codTransporte">

                                        <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->
                                        <% for(Transporte transporte:listaTransporte){%> 
                                        
                                           <% if (transporteVenda.equals(String.valueOf(transporte.getCodigo()))) {%>

                                            <option selected value="<%=  transporte.getCodigo()%>"><%= transporte.getTransportadora() %> </option>

                                          <%} else {%>

                                            <option value="<%= transporte.getCodigo() %>"><%= transporte.getTransportadora()%> </option>

                                        <% }} %>

                                    </select>
                                </p>
                                <input type="hidden" name="codCliente" value="<%= user %>">
                                <input type="hidden" name="codVenda" value="<%= codVenda %>">
                                </div>
                                
                            <% }else{%> 
                                <p>Deseja iniciar a compra com qual cliente?</p>
                                <div class="row">
                                <p><label>Clientes</label>
                                    <select name="codCliente">

                                        <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->
                                        <% for(Cliente cliente:listaCliente){%> 
                                        <% if (listaCliente.equals(String.valueOf(codCliente))) {%>

                                            <option class="formLogin" selected value="<%=  cliente.getCodigo()%>"><%=  cliente.getCodigo()%> <%= cliente.getNome() %></option>

                                          <%} else {%>

                                            <option class="formLogin" value="<%= cliente.getCodigo() %>"><%=  cliente.getCodigo()%> <%= cliente.getNome() %></option>

                                        <% }} %>

                                    </select>
                                </p>
                                <input type="hidden" name="codVenda" value="<%= codVenda %>">
                                <p><input class="botaoCadastrar" type="submit" name="opcao" value="cadastrar"></p>
                                </div>
                            <%  }
                                }else{ %>
                            <p>Faça login para adicionar<br> sua lista de compras</p>
                                <a href="login.jsp">Login</a>
                            <%}%>
                        </form>
            </div>
        </div>
    </body>
</html>
