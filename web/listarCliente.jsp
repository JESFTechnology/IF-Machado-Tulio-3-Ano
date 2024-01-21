<%@page import="modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOCliente"%>
<%
    
    DAOCliente objDAOCliente = new DAOCliente();
    List<Cliente> listaCliente = objDAOCliente.listarCliente();
    
%>

<table border="1">
    <thead>
        <tr>
            <th>Código</th>
            <th>NOME</th>
            <th>SOBRENOME</th>
            <th>EMAIL</th>
            <th>PIX</th>
            <th>CPF</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Cliente cliente:listaCliente){%>
        <tr>
            <td><%= cliente.getCodigo() %></td>
            <td><%= cliente.getNome() %></td>
            <td><%= cliente.getSobrenome() %></td>
            <td><%= cliente.getEmail() %></td>
            <td><%= cliente.getPix()%></td>
            <td><%= cliente.getCpf()%></td>
            <td><a href="cadastroCliente.jsp?opcao=alterar&codigo=<%= cliente.getCodigo() %>&nome=<%= cliente.getNome()%>&email=<%= cliente.getEmail()%>&pix=<%= cliente.getPix()%>&cpf=<%= cliente.getCpf()%>">Alterar</a></td>
            <td><a href="cadastroCliente.jsp?opcao=excluir&codigo=<%= cliente.getCodigo() %>&nome=<%= cliente.getNome() %>&email=<%= cliente.getEmail()%>&pix=<%= cliente.getPix()%>&cpf=<%= cliente.getCpf()%>">Excluir</a></td>
        </tr>
        <%}%>
    </tbody>
</table>