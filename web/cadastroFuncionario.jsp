<%@page import="modelo.DAOLogin"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.Modelo"%>
<%@page import="modelo.DAOModelo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Cidade"%>
<%@page import="modelo.DAOCidade"%>
<%@page import="java.util.Calendar"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("user")!=null){
DAOModelo objDAOModelo = new DAOModelo();
List<Modelo> listaModelo = objDAOModelo.listarModelo();
DAOLogin daoLogin = new DAOLogin();
List<Funcionario> listaFuncionario2 = daoLogin.listarCliente();
String user = "Login";
String nome = "Login",email = "",cargo="",cpf="",pix="",senha="";
if(session.getAttribute("user")!=null)
    {
        user = session.getAttribute("user").toString();
        for(Funcionario funcionario:listaFuncionario2){
            if(user.equals(String.valueOf(funcionario.getCodigo()))){
                nome = funcionario.getNomeFuncionario();
                cargo = funcionario.getCargoFuncionario();
                email = funcionario.getEmailFuncionario();
                senha = funcionario.getSenhaFuncionario();
            }
        }
    }
%>

<%
    String mensagem = request.getParameter("mensagem");
    String nomeFuncionario = request.getParameter("nomeFuncionario");
    String salarioFuncionario = request.getParameter("salarioFuncionario");  
    String codigoFuncionario = request.getParameter("codigoFuncionario");
    String cargoFuncionario = request.getParameter("cargoFuncionario");
    String emailFuncionario = request.getParameter("emailFuncionario");
    String senhaFuncionario = ""; //request.getParameter("senhaFuncionario");
    String nascimentoFuncionario = request.getParameter("nascimentoFuncionario");
    String cidadeFuncionario = request.getParameter("cidadeFuncionario");
    String bairroFuncionario = request.getParameter("bairroFuncionario");
    String enderecoFuncionario = request.getParameter("enderecoFuncionario");
    if(codigoFuncionario==null)
    {
        codigoFuncionario = "0";
    }
    if(cidadeFuncionario==null)
    {
        cidadeFuncionario = "1";
    }
    String opcao = request.getParameter("opcao");
    if(opcao==null){
        opcao="cadastrar";
    }
    
    DAOCidade daoCidade = new DAOCidade();
    List<Cidade> listaCidade = daoCidade.listarCidade();
    
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
        
        <title>JSP Funcionario</title>
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
        <h1 style="text-align: center">CADASTROS DE FUNCIONÁRIOS</h1>
        
        <form name="cadastro" method="get" action="CAEFuncionario.jsp" class="formCidade" style="float: left">
            <p><label>Funcionário: </label> <input type="text" name="nomeFuncionario" value="<%= (nomeFuncionario==null)?"":nomeFuncionario%>" size="30" placeholder="Ex: Johann"/></p>
            <p><label>Cargo: </label> <input type="text" name="cargoFuncionario" value="<%= (cargoFuncionario==null)?"":cargoFuncionario%>" size="30" placeholder="Ex: Designer"/></p>
            <p><label>Email: </label> <input type="text" name="emailFuncionario" value="<%= (emailFuncionario==null)?"":emailFuncionario%>" size="30" placeholder="Ex: johannsacconi@jesftech.com"/></p>
            <p><label>Salário: </label> <input type="text" name="salarioFuncionario" value="<%= (salarioFuncionario==null)?"":salarioFuncionario%>" size="30" placeholder="Ex: 1000.0"/></p>
            <p><label>Nascimento: </label> <input type="text" name="nascimentoFuncionario" value="<%= (nascimentoFuncionario==null)?"":nascimentoFuncionario%>" size="30" placeholder="Ex: 01/01/2001"/></p>
            
            <p><label>Cidade: </label>
                <select name="cidadeFuncionario">
                    
                    <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->
                    <% for(Cidade cidade:listaCidade){%> <% if (cidadeFuncionario.equals(String.valueOf(cidade.getCodigo()))) {%>
                    
                        <option selected value="<%=  cidade.getCodigo()%>"><%= cidade.getNomeCidade() %> </option>
                    
                      <%} else {%>
                    
                        <option value="<%= cidade.getCodigo() %>"><%= cidade.getNomeCidade()%> </option>
                      
                    <% }} %>
                    
                </select>
            </p>
            <p><label>Endereço: </label> <input type="text" name="enderecoFuncionario" value="<%= (enderecoFuncionario==null)?"":enderecoFuncionario%>" size="30" placeholder="Ex: Sabará 000"/></p>
            <p><label>Bairro: </label> <input type="text" name="bairroFuncionario" value="<%= (bairroFuncionario==null)?"":bairroFuncionario%>" size="30" placeholder="Ex: Residencial Oliveira"/></p>
            
            <%if(opcao.equals("cadastrar")){%>
            <p><label>Senha: </label> <input type="password" name="senhaFuncionario" value="<%= (senhaFuncionario==null)?"":senhaFuncionario%>" size="30" /></p>
            <input type="submit" value="Cadastrar" name="cadastrar" class="botaoCadastrar"/>
            <%}else if(opcao.equals("alterar")){%>
            <input type="submit" value="Alterar" name="alterar" class="botaoCadastrar"/>
            <%}else if(opcao.equals("excluir")){%>
            <input type="submit" value="Excluir" name="excluir" class="botaoExcluir"/>
            <%}%>
            <input type="hidden" name="opcao" value="<%=opcao%>"/>
            <input type="hidden" name="codigoFuncionario" value="<%=codigoFuncionario%>"/>
            <input type="reset" value="Limpar" name="limpar" class="botaoLimpar"/>
        </form>
        <p><%=(mensagem==null)?"":mensagem%></p>
        <p></p>
        <p></p>
        <div style="float: right;">
            <%@include file="listarFuncionario.jsp"%>
        </div>
        <br>
    </body>
</html>
<% } %>