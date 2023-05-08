<%-- 
    Document   : CAELogin
    Created on : 21/03/2023, 07:18:41
    Author     : johan
--%>

<%@page import="modelo.DAOLogin"%>
<%@page import="modelo.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String lembrar = request.getParameter("lembrar");
    String mensagem="";

    Login objLogin = new Login();
    
    objLogin.setEmail(email);
    objLogin.setSenha(senha);
    
    DAOLogin objDAOLogin = new DAOLogin();
    
    mensagem = objDAOLogin.entrar(objLogin);
    
    if(mensagem!="ERROR"){
        if(lembrar.equals("on")){
            session.setAttribute("user", mensagem);
        }
    }
    response.sendRedirect("login.jsp?mensagem="+mensagem);

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
</html>
