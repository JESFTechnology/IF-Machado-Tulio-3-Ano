<%@page import="modelo.ConverteData"%>
<%@page import="modelo.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOFuncionario"%>
<%
    
    DAOFuncionario objDAOCidade = new DAOFuncionario();
    List<Funcionario> listaFuncionario = objDAOCidade.listarFuncionario();
    
    ConverteData objConverte = new ConverteData();
    
%>

<table border="1">
    <thead>
        <tr>
            <th>Código</th>
            <th>NOME</th>
            <th>CARGO</th>
            <th>EMAIL</th>
            <th>SALÁRIO</th>
            <th>NASCIMENTO</th>
            <th>CIDADE</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <% for(Funcionario funcionario:listaFuncionario){%>
        <tr>
            <td><%= funcionario.getCodigo() %></td>
            <td><%= funcionario.getNomeFuncionario() %></td>
            <td><%= funcionario.getCargoFuncionario()%></td>
            <td><%= funcionario.getEmailFuncionario()%></td>
            <td><%= funcionario.getSalarioFuncionario()%></td>
            <td><%= objConverte.converteTela(funcionario.getNascimento()) %></td>
            <td><%= funcionario.getObjCidade().getNomeCidade() %></td>
            <td><a href="cadastroFuncionario.jsp?opcao=alterar&codigoFuncionario=<%= funcionario.getCodigo() %>&nomeFuncionario=<%= funcionario.getNomeFuncionario() %>&salarioFuncionario=<%= funcionario.getSalarioFuncionario()%>&cargoFuncionario=<%= funcionario.getCargoFuncionario() %>&emailFuncionario=<%= funcionario.getEmailFuncionario()%>&nascimentoFuncionario=<%= objConverte.converteTela(funcionario.getNascimento())%>&cidadeFuncionario=<%= funcionario.getObjCidade().getCodigo() %>">Alterar</a></td>
            <td><a href="cadastroFuncionario.jsp?opcao=excluir&codigoFuncionario=<%= funcionario.getCodigo() %>&nomeFuncionario=<%= funcionario.getNomeFuncionario() %>&salarioFuncionario=<%= funcionario.getSalarioFuncionario()%>&cargoFuncionario=<%= funcionario.getCargoFuncionario() %>&emailFuncionario=<%= funcionario.getEmailFuncionario()%>&nascimentoFuncionario=<%= objConverte.converteTela(funcionario.getNascimento())%>&cidadeFuncionario=<%= funcionario.getObjCidade().getCodigo() %>">Excluir</a></td>
        </tr>
        <%}%>
    </tbody>
</table>