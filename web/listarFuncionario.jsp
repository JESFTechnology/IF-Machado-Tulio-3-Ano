<%@page import="modelo.ConverteData"%>
<%@page import="modelo.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOFuncionario"%>
<%
    
    DAOFuncionario objDAOCidade = new DAOFuncionario();
    List<Funcionario> listaFuncionario = objDAOCidade.listarFuncionario();
    
    ConverteData objConverte = new ConverteData();
    
%>

<table border="1" style="float: right">
    <thead>
        <tr>
            <th>C�digo</th>
            <th>NOME</th>
            <th>CARGO</th>
            <th>EMAIL</th>
            <th>SAL�RIO</th>
            <th>NASCIMENTO</th>
            <th>CIDADE</th>
            <th>ENDERE�O</th>
            <th>BAIRRO</th>
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
            <td><%= funcionario.getEnderecoFuncionario() %></td>
            <td><%= funcionario.getBairroFuncionario() %></td>
            <td><a href="cadastroFuncionario.jsp?opcao=alterar&codigoFuncionario=<%= funcionario.getCodigo() %>&nomeFuncionario=<%= funcionario.getNomeFuncionario() %>&salarioFuncionario=<%= funcionario.getSalarioFuncionario()%>&cargoFuncionario=<%= funcionario.getCargoFuncionario() %>&emailFuncionario=<%= funcionario.getEmailFuncionario()%>&nascimentoFuncionario=<%= objConverte.converteTela(funcionario.getNascimento())%>&cidadeFuncionario=<%= funcionario.getObjCidade().getCodigo() %>&bairroFuncionario=<%= funcionario.getBairroFuncionario() %>&enderecoFuncionario=<%= funcionario.getEnderecoFuncionario()%>">Alterar</a></td>
            <td><a href="cadastroFuncionario.jsp?opcao=excluir&codigoFuncionario=<%= funcionario.getCodigo() %>&nomeFuncionario=<%= funcionario.getNomeFuncionario() %>&salarioFuncionario=<%= funcionario.getSalarioFuncionario()%>&cargoFuncionario=<%= funcionario.getCargoFuncionario() %>&emailFuncionario=<%= funcionario.getEmailFuncionario()%>&nascimentoFuncionario=<%= objConverte.converteTela(funcionario.getNascimento())%>&cidadeFuncionario=<%= funcionario.getObjCidade().getCodigo() %>&bairroFuncionario=<%= funcionario.getBairroFuncionario() %>&enderecoFuncionario=<%= funcionario.getEnderecoFuncionario()%>">Excluir</a></td>
        </tr>
        <%}%>
    </tbody>
</table>