<%@page import="modelo.Produto"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOProduto"%>
<%
    
    DAOProduto objDAOProduto = new DAOProduto();
    List<Produto> listaProduto = objDAOProduto.listarProduto();
    
%>

<table border="1">
    <thead>
        <tr>
            <th>CÓDIGO</th>
            <th>NOME</th>
            <th>QUANTIDADE</th>
            <th>ESTOQUE</th>
            <th>PRECO</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Produto produto:listaProduto){%>
        <tr>
            <td><%= produto.getCodigo() %></td>
            <td><%= produto.getNome() %></td>
            <td><%= produto.getQuantidade() %></td>
            <td><%= produto.getEstoque()%></td>
            <td><%= produto.getPreco()%></td>
            <td><a href="cadastroProdutos.jsp?opcao=alterar&codigo=<%= produto.getCodigo() %>&nome=<%= produto.getNome() %>&quantidade=<%= produto.getQuantidade()%>&estoque=<%= produto.getEstoque()%>&preco=<%=produto.getPreco()%>">Alterar</a></td>
            <td><a href="cadastroProdutos.jsp?opcao=excluir&codigo=<%= produto.getCodigo() %>&nome=<%= produto.getNome() %>&quantidade=<%= produto.getQuantidade()%>&estoque=<%= produto.getEstoque()%>&preco=<%=produto.getPreco()%>">Excluir</a></td>
        </tr>
        <%}%>
    </tbody>
</table>