<%-- 
    Document   : CAEloja
    Created on : 05/06/2023, 19:28:08
    Author     : johan
--%>

<%@page import="modelo.ItensVenda"%>
<%@page import="modelo.DAOItensVenda"%>
<%@page import="modelo.Caixa"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOCaixa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String op = request.getParameter("opcao");
    String codCliente = request.getParameter("codCliente");
    String codTransporte = request.getParameter("codTransporte");
    String codVenda = request.getParameter("codVenda");
    String codItemVenda = request.getParameter("codItemVenda");
    String codProduto = request.getParameter("codProduto");
    String valor = request.getParameter("valor");
    String quantidade = request.getParameter("quantidade");
    String mensagem="";
    double valT=0;
    
    DAOCaixa objVenda = new DAOCaixa();
    Caixa venda = new Caixa();
    
    DAOItensVenda objItensVenda = new DAOItensVenda();
    ItensVenda itensVenda = new ItensVenda();
   
    
    if(codCliente.equals("Login")){
        response.sendRedirect("login.jsp");
    }else{
    if(op.equals("cadastrar")){
        mensagem = objVenda.incluir(Integer.valueOf(codCliente));
    }
    
    else if(op.equals("concluir")){
        venda.setIdCaixa(Integer.valueOf(codVenda));
        venda.getTransporte().setCodigo(Integer.valueOf(codTransporte));
        mensagem = objVenda.finalizar(venda);
    }
    else if(op.equals("salvar")){
        venda.setIdCaixa(Integer.valueOf(codVenda));
        venda.getTransporte().setCodigo(Integer.valueOf(codTransporte));
        mensagem = objVenda.salvar(venda);
    }
    
    else if(op.equals("cancelar")){
        venda.setIdCaixa(Integer.valueOf(codVenda));
        mensagem = objVenda.remove(venda);
    }
    
    else if(op.equals("comprar")){
            itensVenda.setIdCaixa(Integer.valueOf(codVenda));
            itensVenda.setQuantidade(Integer.valueOf(quantidade));
            itensVenda.getProduto().setCodigo(Integer.valueOf(codProduto));
            double valor1 = Double.valueOf(valor);
            int quant = Integer.valueOf(quantidade);
            valT = valor1*quant;
            itensVenda.setValorProduto(valT);
            mensagem = objItensVenda.incluir(itensVenda);
        
    }
    
    else if(op.equals("remover")){
        itensVenda.setIdItens(Integer.valueOf(codItemVenda));
        mensagem = objItensVenda.remover(itensVenda);
    }
    
    response.sendRedirect("loja.jsp?mensagem="+mensagem);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        Opção: <%= op %> |
        Cliente: <%= codCliente %> |
        Caixa: <%= codVenda %> |
        Quantidade: <%= quantidade %> |
        Valor: <%= valor %> |
        Produto: <%= codProduto %> |
        Valor total: <%= valT %> |
        <br>
        <br>
        Ação: <%= mensagem %>
    </body>
</html>
