<%-- 
    Document   : CAELogin
    Created on : 21/03/2023, 07:18:41
    Author     : johan
--%>

<%@page import="modelo.DAOFuncionario"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.DAOAvisos"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.DAOLogin"%>
<%@page import="modelo.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    //String lembrar = request.getParameter("lembrar");
    String selecao = request.getParameter("selecao");
    String codigoCliente = request.getParameter("codigo");
    String nomeCliente = request.getParameter("nome");
    String cargoCliente = request.getParameter("cargoCliente");
    String senhaFuncionario = request.getParameter("senhaFuncionario");
    String sobrenomeCliente = request.getParameter("sobrenome");
    String senhaCliente = request.getParameter("senha");
    String emailCliente = request.getParameter("email");
    String pixCliente = request.getParameter("pix");
    String cpfCliente = request.getParameter("cpf");
    String opcao = request.getParameter("opcao");
    String mensagem="";
    String exec = "Nada";

    Login objLogin = new Login();
    
    objLogin.setEmail(email);
    objLogin.setSenha(senha);
    
    if(opcao.equals("1"))
    {
        exec = "Logar entrou em ação";
        objLogin.setEmail(email);
        objLogin.setSenha(senha);

        DAOLogin objDAOLogin = new DAOLogin();

        mensagem = objDAOLogin.entrar(objLogin,selecao);

        if(mensagem!="Usuário não encontrado"){
            //if(lembrar.equals("on")){
            session.setAttribute("user", mensagem);
        }
        response.sendRedirect("login.jsp?mensagem="+"ONLINE");
    }
    else
    {
        exec = "Alterar entrou em ação";
        
        Funcionario objFuncionario= new Funcionario();
    
        objFuncionario.setNomeFuncionario(nomeCliente);
        objFuncionario.setEmailFuncionario(emailCliente);
        objFuncionario.setCargoFuncionario(cargoCliente);
        objFuncionario.setCodigo(Integer.parseInt(codigoCliente));
        objFuncionario.setSenhaFuncionario(senhaCliente);

        DAOFuncionario objDAOFuncionario = new DAOFuncionario();
        
        mensagem = objDAOFuncionario.alterarFuncionario(objFuncionario);
        response.sendRedirect("login.jsp?opcao=user&mensagem="+mensagem);
        
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Se está vendo isso, deu merda
        <%= email %>
        <%= senha %>
        <%= opcao %>
        
        <p>O que executou <%= exec %></p>
        <br>
        <%= mensagem %>
        <br>
        <br>
        <br>
        <br>
        <form class="formLogin col-sm-5 card m-auto mt-4" method="post" action="CAELogin.jsp">
                <br>
                <label style="width: 50%; height: 50%; size: auto"> Username: </label>
                <input style="width: 80%; height: 80%;" placeholder="Ex: joao.ferreira@jesftechnology.com" type="text" name="email" class="text-login" required/>
                
                <label  style="width: 50%; height: 50%; size: auto" >Password: </label>
                <input style="width: 80%; height: 80%; size: auto" placeholder="Digite sua senha" type="password" name="senha" class="text-login" required/>
                <br>
                <h6>Sou um:</h6>
                <label>
                <input type="radio" name="selecao" value="cliente">
                Cliente
                </label>
                <label>
                <input type="radio" name="selecao" value="funcionario">
                Funcionário
                </label><br>
                <br>
                <p><input type="checkbox" name="lembrar">Relembre meu usuário</p>
                <input type="hidden" value="1" name="opcao">
                <input style="width: 50%; height: 50%;" type="submit" value="Logar" class="botaoCadastrar botaoLogin">
                
                <p>Não tem uma conta? <a href="cadastrar.jsp">Inscreva-se</a></p>
                
                <p style="color: red"><%= mensagem %></p>
                <br>
        </form>
    </body>
</html>
