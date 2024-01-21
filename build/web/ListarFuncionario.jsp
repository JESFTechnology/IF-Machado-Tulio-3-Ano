
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.DAOFuncionario"%>
<%@page import="java.util.List"%>

<%
DAOFuncionario daoFuncionario = new DAOFuncionario();
List<Funcionario> listaFuncionario = daoFuncionario.consultar();
ConverteData converte = new ConverteData();

%>

<table border="1"  >
    <thead>
        <tr>
            <th>C�DIGO</th>
            <th>NOME</th>
            <th>SAL�RIO</th>
            <th>NASCIMENTO</th>
            <th>CIDADE</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Funcionario funcionario:listaFuncionario){ %>
        <tr>
            <td><%= funcionario.getCodigo() %> </td>
            <td><%= funcionario.getNome() %> </td>
            <td><%= funcionario.getSalario() %> </td>
            <td><%= converte.converteTela(funcionario.getNascimento()) %> </td>
            <td><%= funcionario.getCidade().getCidade() %> </td>
            <td>D�bito </td>
            <td><a href="CadastroFuncionario.jsp?opcao=alterar&pagamento=D�bito&codigo=<%= funcionario.getCodigo()%>&nomeFuncionario=<%= funcionario.getNome()%>&salario=<%= funcionario.getSalario()%>&nascimento=<%= converte.converteTela(funcionario.getNascimento()) %>&codigoCidade=<%= funcionario.getCidade().getCodigo() %>&mensagem=Altere os dados e clique no bot�o alterar">A</a></td>
            <td><a href="CadastroFuncionario.jsp?opcao=excluir&pagamento=D�bito&codigo=<%= funcionario.getCodigo()%>&nomeFuncionario=<%= funcionario.getNome()%>&salario=<%= funcionario.getSalario()%>&nascimento=<%= converte.converteTela(funcionario.getNascimento()) %>&codigoCidade=<%= funcionario.getCidade().getCodigo() %>&mensagem=Clique no bot�o excluir para confirmar">X</a></td>
            
            
        </tr>
        <% } %>
    </tbody>
</table>
