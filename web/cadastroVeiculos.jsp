<%-- 
    Document   : caminhaoMercedes
    Created on : 13/03/2023, 14:43:45
    Author     : johan
--%>

<%@page import="modelo.Cliente"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.DAOProduto"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.Transporte"%>
<%@page import="modelo.DAOTransporte"%>
<%@page import="modelo.DAOVeiculo"%>
<%@page import="modelo.Veiculo"%>
<%@page import="modelo.Modelo"%>
<%@page import="modelo.DAOModelo"%>
<%@page import="java.util.List"%>
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
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
        integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI="
        crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
        integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM="
        crossorigin=""></script>
        <%
        
        DAOModelo objDAOModelo = new DAOModelo();
        List<Modelo> listaModelo = objDAOModelo.listarModelo();
        
        DAOVeiculo objDAOVeiculo = new DAOVeiculo();
        List<Veiculo> listaVeiculo = objDAOVeiculo.listarVeiculo();
        
        DAOTransporte objDAOTransporte = new DAOTransporte();
        List<Transporte> listaTransporte = objDAOTransporte.listarTransporte();
        
        String color = "white";
        
            String mensagem = request.getParameter("mensagem");
            String placaVeiculo = request.getParameter("placa");  
            String codigoVeiculo = request.getParameter("codigo");
            String modeloVeiculo = request.getParameter("modelo");
            String statusVeiculo = request.getParameter("status");
            String anoVeiculo = request.getParameter("ano");
            Double lat,lon;
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");
            String opcao = request.getParameter("opcao");
            if(latitude==null&&longitude==null){
            lat = 0.00;
            lon = 0.00;
            }
            else
            {
            lat = Double.parseDouble(latitude);
            lon = Double.parseDouble(longitude);
            }
            if(opcao==null){
                opcao="cadastrar";
            }
            
            if(modeloVeiculo==null)
            {
                modeloVeiculo = "1";
            }
            
        DAOProduto objDAOProduto = new DAOProduto();
        List<Produto> listaProduto = objDAOProduto.listarProduto();
        
        DAOCliente daoCliente = new DAOCliente();
            List<Cliente> listaCliente = daoCliente.getLista();
            String user = "Login";
            String nome = "Login",email = "",sobrenome="",cpf="",pix="",senha="";
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
        
        %>
          
        <title>JSP Veiculos</title>
    </head>
    <style>
        body{
            background-image: url("img/fundo2.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        
        .botaoLimpar{
            background-color: white;
            color: black;
            transition-duration: 1s;
        }
        
        .botaoLimpar:hover{
            background-color: #ba2c2c;
            color: white;
        }
        
        .buttonC:checked{
            
        }
        
        .botaoCadastrar{
            background-color: white;
            color: black;
            transition-duration: 1s;
        }
        
        .botaoCadastrar:hover{
            background-color: #168934;
            color: white;
        }
        
        #map{
            width: 60%;
            height: 60%;
        }
    </style>
    <body>
        <header>
		<nav class="navbar navbar-expand-md px-4 ">
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
                                <style>
                                    #map{
                                        height: 400px;
                                        width: 900px;
                                        margin-left: 20px;
                                        margin-top: 20px; 
                                        margin-top: 150px;
                                    }
                                </style>
    
                                <div style="float: left">
            <form name="cadastro" method="get" action="CAEVeiculo.jsp" class="formCidade">
            <p><label>Placa: </label> <input type="text" name="placa" value="<%= (placaVeiculo==null)?"":placaVeiculo%>" size="30" /></p>
            <p><label>Ano: </label> <input type="text" name="ano" value="<%= (anoVeiculo==null)?"":anoVeiculo %>" size="30" /></p>    
            <p><label>Modelo: </label>   
                <select name="modelo">
                    
                    <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->
                    <% for(Modelo modelo:listaModelo){ if(modeloVeiculo.equals(String.valueOf(modelo.getCodigo()))){%>
                    
                        <option selected value="<%= modelo.getModelo() %>"><%= statusVeiculo %></option>
                    
                      <%} else {%>
                    
                        <option value="<%= modelo.getCodigo() %>"><%= modelo.getModelo()%> </option>
                      
                    <% }} %>
                    
                </select>
            </p>
            
                <%if(opcao.equals("cadastrar")){%>
                    <input type="submit" value="Cadastrar" name="cadastrar" class="botaoCadastrar"/>
                <%}else if(opcao.equals("alterar")){%>
                    <input type="submit" value="Alterar" name="alterar" class="botaoCadastrar"/>
                <%}else if(opcao.equals("excluir")){%>
                    <input type="submit" value="Excluir" name="excluir" class="botaoExcluir"/>
                <%}%>
                <input type="hidden" name="opcao" value="<%=opcao%>"/>
                <input type="hidden" name="codigo" value="<%= codigoVeiculo %>"/>
                <input type="reset" value="Limpar" name="limpar" class="botaoLimpar"/>
            </form>
                <p><%= mensagem %></p>
    </div>
                <section class="carousel slide" data-bs-ride="carousel" style="float: right" id="slideshow">
            
                    <div class="carousel-inner" style="width: 200px; background-color: #ced4da; height: 500px; border-radius: 35px;">
                     <figure class="carousel-item active">                        
                        <img src="img/truckicon.png" style="background-color: <%= color %>; width: 200px; border-radius: 40px">
                        <figcaption class="carousel-caption">
                            <p class="fs-2 text-dark">Caminhões</p>
                            <!--<a href="#" class="btn btn-warning fw-bold">Saiba mais</a>-->
                        </figcaption>
                    </figure>    
            
            <% for(Transporte transporte:listaTransporte){
                if(transporte.getObjVeiculo().getPlaca().equals("Em andamento")){
                    color="#ffcd39";
                }else if(transporte.getObjVeiculo().getPlaca().equals("Parado")){
                    color="#ba2c2c";
                }else if(transporte.getObjVeiculo().getPlaca().equals("Em manutenção")){
                    color="#86b7fe";}
            %>
            
            <figure class="carousel-item">                        
                <img src="img/truckicon.png" style="background-color: <%= color %>; width: 200px; border-radius: 40px">
                
                <figcaption class="text-center">
                    <p class="text-dark">Placa:  <%= transporte.getObjVeiculo().getPlaca() %></p>
                    <p class="text-dark">Código: <%= transporte.getCodigo()%></p>
                    <p class="text-dark">Modelo: <%= transporte.getObjVeiculo().getObjModelo().getModelo() %></p>
                    <p class="text-dark">Ano:    <%= transporte.getObjVeiculo().getAno() %></p>
                    <p class="text-dark">Lat:    <%= transporte.getLat() %></p>
                    <p class="text-dark">Long:    <%= transporte.getLon() %></p>
                    <a href="cadastroVeiculos.jsp?opcao=alterar&placa=<%= transporte.getObjVeiculo().getPlaca() %>&codigo=<%= transporte.getCodigo() %>&modelo=<%= transporte.getObjVeiculo().getObjModelo().getModelo() %>&ano=<%= transporte.getObjVeiculo().getAno() %>&latitude=<%= transporte.getLat() %>&longitude=<%= transporte.getLon() %>" class="btn btn-warning fw-bold">Alterar</a>
                    <a href="cadastroVeiculos.jsp?opcao=excluir&placa=<%= transporte.getObjVeiculo().getPlaca() %>&codigo=<%= transporte.getCodigo() %>&modelo=<%= transporte.getObjVeiculo().getObjModelo().getModelo() %>&ano=<%= transporte.getObjVeiculo().getAno() %>&latitude=<%= transporte.getLat() %>&longitude=<%= transporte.getLon() %>" class="btn btn-danger fw-bold">Excluir</a>
                </figcaption><% } %>
            </figure>           
            
        </div>  
            <a href="#slideshow" class="carousel-control-prev text-decoration-none text-white fw-bold fa-2xl" data-bs-slide="prev"><</a>
            <a href="#slideshow" class="carousel-control-next text-decoration-none text-white fw-bold fa-2xl " data-bs-slide="next">></a>
        </section>
                <% if(!lat.equals(0.00)){ %>
        <div id="map" class="map float-start "></div>
        <script>
            var map = L.map('map').setView([<%= lat %>, <%= lon %>], 13);

                L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                }).addTo(map);

                L.marker([<%= lat %>, <%= lon %>]).addTo(map)
                .bindPopup('Local do caminhão: <%= placaVeiculo %>')
                .openPopup();  
        
        </script>
        <% } %>
    </body>
</html>