<%-- 
    Document   : loja
    Created on : 02/05/2023, 08:50:11
    Author     : johan
--%>

<%@page import="modelo.DAOItemVenda"%>
<%@page import="modelo.ItemVenda"%>
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
       String mensagem = request.getParameter("mensagem");
       String selecao = request.getParameter("selecao");
       String user;
       if(selecao == null){
           selecao = "2";
       }
       
       DAOMarca objDAOMarca = new DAOMarca();
       List<Marca> listaMarca = objDAOMarca.listarMarca();
       
       DAOModelo objDAOModelo = new DAOModelo();
       List<Modelo> listaModelo = objDAOModelo.listarModelo();
       
       DAOProduto objDAOProduto = new DAOProduto();
       List<Produto> listaProduto = objDAOProduto.listarProduto();
       
       DAOItemVenda objDAOItemVenda = new DAOItemVenda();
       List<ItemVenda> listaItemVenda = objDAOItemVenda.listarItemVenda();
       
    if(session.getAttribute("user")==null)
    {
        user = "Login";
    }
    else
    {
        user = session.getAttribute("user").toString();
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
            width: 285px;
            height: 290px;
            margin-bottom: 10px;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 10px;
            border-radius: 20px;
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
        <h1 style="text-align: center">LOJA</h1>
        <div style="float: right; height: auto; width: 20%; border-radius: 20px;">
                    <h4>Lista de compras não completas: </h4>
                    
                    <% for(ItemVenda itemVenda:listaItemVenda){if(user.equals(itemVenda.getObjVenda().getObjCliente().getNome())){%>
                    
                        <p>Compra: </p>
                        <p>Produto: <%= itemVenda.getObjProduto().getNome() %></p>
                        <p>Quantidade: <%= itemVenda.getQuantVenda() %></p>
                        <p>Cliente: <%= itemVenda.getObjVenda().getObjCliente().getNome() %></p>
                        <p>Valor: <%= itemVenda.getValor() %></p>
                        <p>Transporte: <%= itemVenda.getObjVenda().getObjTransporte().getObjVeiculo().getPlaca() %></p>
                        
                    <% }} %>
        </div>
        
        
        <div style="float: left">
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
                <div class="row" style="width: 75%; align-items: center; float: left">  
                    <% for(Produto produto:listaProduto){if(selecao.equals(String.valueOf(produto.getObjMarca().getCodigo()))){ %>
                    <div class="caixaProduto">
                        <img src="img/arduino uno.jpg" style="width: 100px; margin-top: 10px">
                        <p>Nome: <%= produto.getNome() %></p>
                        <p>R$<%= produto.getPreco() %></p>
                        <form>
                            <p>Quantidade: <input type="number" name="quantidade" style="background-color:transparent;" checked=""></p>
                            <p><input type="submit" value="Comprar"></p>
                        </form>
                    </div>
                <% }} %>
                </div>
        </div>
    </body>
</html>
