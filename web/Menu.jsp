

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Estudo de Caso</title>
        <!-- Aqui chamamos o nosso arquivo css externo -->
        <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
        <!--[if lte IE 8]>
     <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
     <![endif]-->   
        
        
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/font-awesome.css">
		<link rel="stylesheet" href="css/fsbanner.css">
		<link rel="stylesheet" href="css/countdown.css">
		<link rel="stylesheet" href="css/animate.css">
		<link rel="stylesheet" href="css/hover.css">
		<link rel="stylesheet" href="css/menu.css">

		<script src="js/jquery.js"></script>
		<script src="js/popper.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/fsbanner.js"></script>
		<script src="js/jquery.downCount.js"></script>
		<script src="js/smooth_navigation.js"></script>
		<script src="js/wow.min.js"></script>
		<script src="js/backtotop.js"></script>
	        <script src="js/validadados.js"></script>
		
                
        
    </head>
    <body>
        <img src="imagens/logo.jpg" width="500" height="115" alt="logo"/>



        <nav>

           
                 <ul class="menu">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">Cadastro</a>
                    <ul>
                        <li><a href="CadastroCidade.jsp">Cidade</a></li>
                        <li><a href="CadastroFuncionario.jsp">Funcionário</a></li>
                    </ul>
                </li>
                <li><a href="#">Relatórios</a> 
                    <ul>
                        <li><a target="blank" href="RelatorioCidade.jsp">Cidade</a></li>
                        <li><a target="blank" href="RelatorioFuncionario.jsp" >Funcionário</a></li>
                    </ul>
                </li>
                <li><a href="Contato.jsp">Contato</a></li>                
                <li><a href="Sobre.jsp">Sobre</a></li> 
                  
                    <% if (session.getAttribute("nome") != null) {%>
                    <li>
                    Bem Vindo, <%= session.getAttribute("nome")%>
                    <a href="logoff.jsp">logoff</a>
                     </li>
                    <% }%>
               
            </ul>
        </nav>

                
                
                
                
    </body>
    <br>
</html>
