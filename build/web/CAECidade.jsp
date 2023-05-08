<%-- 
    Document   : CAECidade
    Created on : 14/02/2023, 09:35:00
    Author     : johan
--%>

<%@page import="modelo.DAOCidade"%>
<%@page import="modelo.Cidade" %>

<%

    String nomeCidade = request.getParameter("nomeCidade");
    String ufCidade = request.getParameter("ufCidade");
    String codigoCidade = request.getParameter("codigoCidade");
    String opcao = request.getParameter("opcao");
    String mensagem="";
    String usuario;
    
    Cidade objCidade= new Cidade();
    
    objCidade.setNomeCidade(nomeCidade);
    objCidade.setUfCidade(ufCidade);
    objCidade.setCodigo(Integer.parseInt(codigoCidade));
    
    DAOCidade objDAOCidade = new DAOCidade();
    
    if(opcao.equals("cadastrar")){
    mensagem = objDAOCidade.inserir(objCidade);
    }
    else if(opcao.equals("alterar")){
    mensagem = objDAOCidade.alterar(objCidade);
    }
    else if(opcao.equals("excluir")){
    mensagem = objDAOCidade.excluir(objCidade);
    }
    response.sendRedirect("cadastroCidade.jsp?mensagem="+mensagem);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cidade: <%= nomeCidade%></h1>
        <h1>UF: <%= ufCidade%></h1>
        
        <a href="cadastroCidade.jsp?mensagem= Cadastrado com sucesso!!&nomeCidade=<%=nomeCidade%>&ufCidade=<%=ufCidade%>">Voltar para Cadastro</a>
                
    </body>
    
    
</html>
