<%@page import="modelo.Cidade"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOCidade"%>
<%
DAOCidade daoCidade = new DAOCidade();

List<Cidade> listaCidade = daoCidade.consultar();

%>


<table  border=1 align="center"  >
    <th>CÓDIGO</th>
    <th>CIDADE</th>
    <th>UF</th>
    <th>ALTERAR</th>
    <th>EXCLUIR</th>
    <% for (Cidade cidade : listaCidade ){ %>
    <tr> 
        <td><%= cidade.getCodigo() %> </td>
        <td><%= cidade.getCidade() %> </td>
        <td><%= cidade.getUf() %> </td>
    <td><a href="CadastroCidade.jsp?opcao=alterar&codigo=<%= cidade.getCodigo()%>&cidade=<%= cidade.getCidade()%>&uf=<%= cidade.getUf()%>">A</a></td>
    <td><a href="CadastroCidade.jsp?opcao=excluir&codigo=<%= cidade.getCodigo()%>&cidade=<%= cidade.getCidade()%>&uf=<%= cidade.getUf()%>">X</a></td>
    
    </tr>    
    <% } %>
    
</table>