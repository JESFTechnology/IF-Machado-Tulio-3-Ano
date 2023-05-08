<%-- 
    Document   : CAECliente
    Created on : 25/03/2023, 08:03:34
    Author     : johan
--%>


<%@page import="modelo.DAOVeiculo"%>
<%@page import="modelo.Veiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String codigoVeiculo = request.getParameter("codigo");
    String modeloVeiculo = request.getParameter("modelo");
    String anoVeiculo = request.getParameter("ano");
    String statusVeiculo = request.getParameter("status");
    String espacoVeiculo = request.getParameter("espaco");
    String placaVeiculo = request.getParameter("placa");
    String opcao = request.getParameter("opcao");
    String mensagem="";

    Veiculo objVeiculo= new Veiculo();
    
    objVeiculo.setPlaca(placaVeiculo);
    objVeiculo.setStatus(statusVeiculo);
    objVeiculo.getObjModelo().setCodigo(Integer.parseInt(modeloVeiculo));
    objVeiculo.setAno(Integer.parseInt(anoVeiculo));
    objVeiculo.setCodigo(Integer.parseInt(codigoVeiculo));
    
    DAOVeiculo objDAOVeiculo = new DAOVeiculo();
    
    if(opcao.equals("cadastrar")){
    mensagem = objDAOVeiculo.inserir(objVeiculo);
    }
    else if(opcao.equals("alterar")){
    mensagem = objDAOVeiculo.alterar(objVeiculo);
    }
    else if(opcao.equals("excluir")){
    mensagem = objDAOVeiculo.excluir(objVeiculo);
    }
    response.sendRedirect("cadastroVeiculos.jsp?mensagem="+mensagem);

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
