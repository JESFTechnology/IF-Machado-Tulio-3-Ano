<%@page import="modelo.Cidade"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOCidade"%>
<%
    
    DAOCidade objDAOCidade = new DAOCidade();
    List<Cidade> listaCidade = objDAOCidade.listarCidade();
    
%>

<table border="1">
    <thead>
        <tr>
            <th>Código</th>
            <th>Cidade</th>
            <th>UF</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Cidade cidade:listaCidade){%>
        <tr>
            <td><%= cidade.getCodigo() %></td>
            <td><%= cidade.getNomeCidade() %></td>
            <td><%= cidade.getUfCidade() %></td>
            <td><a href="cadastroCidade.jsp?opcao=alterar&codigoCidade=<%= cidade.getCodigo() %>&nomeCidade=<%= cidade.getNomeCidade() %>&ufCidade=<%= cidade.getUfCidade() %>">Alterar</a></td>
            <td><a href="cadastroCidade.jsp?opcao=excluir&codigoCidade=<%= cidade.getCodigo() %>&nomeCidade=<%= cidade.getNomeCidade() %>&ufCidade=<%= cidade.getUfCidade() %>">Excluir</a></td>
        </tr>
        <%}%>
    </tbody>
</table>