<%-- 
    Document   : CAEProduto
    Created on : 27/03/2023, 13:03:11
    Author     : johan
--%>

<%@page import="modelo.Produto"%>
<%@page import="modelo.DAOProduto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    String nomeProduto = request.getParameter("nome");
    String quantidadeProduto = request.getParameter("quantidade");
    String estoqueProduto = request.getParameter("estoque");
    String precoProduto = request.getParameter("preco");
    String codigoProduto = request.getParameter("codigo");
    String opcao = request.getParameter("opcao");
    String mensagem="";
    String usuario;
    
    Produto objProduto= new Produto();
    
    objProduto.setNome(nomeProduto);
    objProduto.setQuantidade(Float.parseFloat(quantidadeProduto));
    objProduto.setEstoque(Float.parseFloat(estoqueProduto));
    objProduto.setPreco(Float.parseFloat(precoProduto));
    objProduto.setCodigo(Integer.parseInt(codigoProduto));
    
    
    
    DAOProduto objDAOproduto = new DAOProduto();
    
    if(opcao.equals("cadastrar")){
    mensagem = objDAOproduto.inserir(objProduto);
    }
    else if(opcao.equals("alterar")){
    mensagem = objDAOproduto.alterar(objProduto);
    }
    else if(opcao.equals("excluir")){
    mensagem = objDAOproduto.excluir(objProduto);
    }
    response.sendRedirect("cadastroProdutos.jsp?mensagem="+mensagem);

%>
<html>
    
</html>
