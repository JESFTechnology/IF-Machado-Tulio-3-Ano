<%@page import="modelo.DAOFuncionario"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Modelo"%>
<%@page import="modelo.DAOModelo"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%
DAOModelo objDAOModelo = new DAOModelo();
List<Modelo> listaModelo = objDAOModelo.listarModelo();
DAOFuncionario daoCliente = new DAOFuncionario();
List<Funcionario> listaFuncionario = daoCliente.listarFuncionario();
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
%>
<html>
    <head>
        <title>Hello World</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/logoIF.png" type="image/x-icon"> 
        <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/estilo.css">
          
	<!--Javascript-->
	<script src="js/bootstrap.bundle.js"></script>
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
                        <section class="carousel slide no-margin" data-bs-ride="carousel" id="slideshow">
		<ul class="carousel-indicators">
			<li data-bs-target="#slideshow" data-bs-slide-to="0" class="active"></li>
			<li data-bs-target="#slideshow" data-bs-slide-to="1"></li>
			<li data-bs-target="#slideshow" data-bs-slide-to="2"></li>
			<!--<li data-bs-target="#slideshow" data-bs-slide-to="3"></li>
			<li data-bs-target="#slideshow" data-bs-slide-to="4"></li>-->
		</ul>
		<div class="carousel-inner">
		<figure class="carousel-item active">
			<img src="img/SlideShow-1.png" class="img-fluid col-12">
		</figure>
		<figure class="carousel-item">
			<img src="img/SlideShow-2.png" class="img-fluid col-12">
			<figcaption class="carousel-caption">
				<!--<p class="fs-2">TEXT</p>-->
				<a href="#" class="btn btn-warning fw-bold"><i class="fa-solid fa-circle-exclamation"></i> FUTURAMENTE <i class="fa-solid fa-circle-exclamation"></i></a>
			</figcaption>
		</figure>
		<figure class="carousel-item">
			<img src="img/SlideShow-3.png" class="img-fluid col-12">
		</figure>
	</div>

	<a href="#slideshow" class="carousel-control-prev text-decoration-none" data-bs-slide="prev"><span class="fa-solid-chevron-circle-icon"></span></a>
	<a href="#slideshow" class="carousel-control-next text-decoration-none" data-bs-slide="next"><span class="fa-solid-chevron-circle-icon"></span></a>
</section>
        <h1 class="text-center">HOME</h1>
    <div class="m-5">
	<div> <!--Notícias-->
		<h3 class="text-center">Notícias sobre a impressão 3D no mundo</h3>
		<div class="row">
			<div class="col-md-6 pb-3">
				<div class="card border-dark h-100">
					<img src="img/ImpressaoCasa-1.png" alt="" class="card-img-top">
					<div class="text-white bg-primary card-header border-dark bg-gradiente">
						<h5>Casas 3D</h5>
					</div>
					<div class="card-body mb-5">
						<p>Revolução na Construção: Empresa Alemã Ergue o Maior Prédio da Europa Usando Tecnologia de Impressão 3D</p>
					</div>		
					<div class="card-footer text-center border-dark">
						<a href="https://www.industria40.ind.br/noticias/23840-empresa-alema-esta-construindo-maior-predio-impresso-3d-europa" class="card-link btn btn-outline-secondary">Saiba mais...</a>
					</div>
				</div>
			</div>

			<div class="col-md-6 pb-3">
				<div class="card border-dark h-100">
					<img src="img/ImpressaoOrgao-1.png" alt="" class="card-img-top">
					<div class="text-white bg-primary card-header border-dark bg-gradiente">
						<h5>Medicina 3D</h5>
					</div>
					<div class="card-body mb-5">
						<p>Transformando a Medicina: Revolucionários Impactos da Impressora 3D na Criação de Órgãos Vivos, Potencialmente Salvando Inúmeras Vidas!</p>
					</div>		
					<div class="card-footer text-center border-dark">
						<a href="https://olhardigital.com.br/2021/06/10/colunistas/os-impactos-da-impressora-3d-na-medicina/" class="card-link btn btn-outline-secondary">Saiba mais...</a>
					</div>
				</div>
			</div>

			<div class="col-md-6 pb-3">
				<div class="card border-dark h-100">
					<img src="img/ImpressaoSolado-1.png" alt="" class="card-img-top">
					<div class="text-white bg-primary card-header border-dark bg-gradiente">
						<h5>Calçados 3D</h5>
					</div>
					<div class="card-body mb-5">
						<p>Adidas apresenta tênis com sola produzida por impressão 3D</p>
					</div>		
					<div class="card-footer text-center border-dark">
						<a href="https://www.hypeness.com.br/2022/03/adidas-apresenta-tenis-com-sola-produzida-por-impressao-3d/" class="card-link btn btn-outline-secondary">Saiba mais...</a>
					</div>
				</div>
			</div>

			<div class="col-md-6 pb-3">
				<div class="card border-dark h-100">
					<img src="img/ImpressaoProtese-1.png" alt="" class="card-img-top">
					<div class="text-white bg-primary card-header border-dark bg-gradiente">
						<h5>Próteses 3D</h5>
					</div>
					<div class="card-body mb-5">
						<p>Impressora 3D promete revolucionar mercado de próteses de mão</p>
					</div>		
					<div class="card-footer text-center border-dark">
						<a href="https://www.unifesp.br/reitoria/dci/edicoes-anteriores-entreteses/item/2004-impressora-3d-promete-revolucionar-mercado-de-proteses-de-mao" class="card-link btn btn-outline-secondary">Saiba mais...</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-5 text-center">

		<h1>Galeria</h1>
		
		<div class="row">
			<a href="#galeria" class="col-md-3"><img class="col-12 p-3 galeria" src="img/Reciclagem-1.png" alt="galeria"></a>
			<a href="#galeria" class="col-md-3"><img class="col-12 p-3 galeria" src="img/Reciclagem-2.png" alt="galeria"></a>
			<a href="#galeria" class="col-md-3"><img class="col-12 p-3 galeria" src="img/Reciclagem-3.png" alt="galeria"></a>
			<a href="#galeria" class="col-md-3"><img class="col-12 p-3 galeria" src="img/Reciclagem-4.png" alt="galeria"></a>

			<a href="#galeria" class="col-md-3"><img class="col-12 p-3 galeria" src="img/WZFotoMelhor.jpg" alt="galeria"></a>
			<a href="#galeria" class="col-md-3"><img class="col-12 p-3 galeria" src="img/WZFotoComPaisagem.jpg" alt="galeria"></a>
			<a href="#galeria" class="col-md-3"><img class="col-12 p-3 galeria" src="img/WZImpressora.jpg" alt="galeria"></a>
			<a href="#galeria" class="col-md-3"><img class="col-12 p-3 galeria" src="" alt=""></a>
			
		</div>
	</div>
    </div>
	<div class="my-5 pb-5"></div>

    <footer class="no-margin text-white" style="background-color: rgb(14, 27, 177);"><!-- Final do site -->
		<div class="row">
			<div class="col-8">
				<a class="m-2" style="color: white; text-decoration: none;" href="https://www.instagram.com/jesf.tech/"><i class="fa-brands fa-instagram"></i>  @jesf.tech</a>
				<br>
				<a class="m-2" style="color: white; text-decoration: none;" href="mailto:jesftech@gmail.com"><i class="fa-solid fa-envelope"></i>  jesftech@gmail.com</a>
				<br>
				<a class="m-2"  style="color: white; text-decoration: none;" href="https://www.youtube.com/@jesftechnology"><i class="fa-brands fa-youtube"></i>  jesftechnology</a>
				<br>
				<a class="m-2"  style="color: white; text-decoration: none;" href="https://github.com/JESFTechnology"><i class="fa-brands fa-github"></i>  JESFTechnology</a>
			</div>
			
		</div>
	</footer>
    </body>
</html>
