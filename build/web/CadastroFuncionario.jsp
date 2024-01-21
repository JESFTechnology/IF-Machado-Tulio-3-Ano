
<%@page import="java.util.ArrayList"%>
<%@include file="Menu.jsp" %>
<% if (session.getAttribute("nome") != null){%>

<%@page import="modelo.Cidade"%>
<%@page import="modelo.DAOCidade"%>


<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.nomeFuncionario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nome';
            } else if (document.cadastro.salario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Salario';
            } else if (document.cadastro.nascimento.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nascimento';
            }else if (TestaCPF(document.cadastro.cpf.value) == false) {
                document.cadastro.mensagem.value = 'CPF incorreto';
            }
            else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAEFuncionario.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'nulo';
            document.cadastro.nomeFuncionario.value = '';
            document.cadastro.salario.value = '';
            document.cadastro.nascimento.value = '';
            document.cadastro.action = 'CadastroFuncionario.jsp';
            document.cadastro.submit();
            /// }
        } else if (par == 'alterar') {

            if (document.cadastro.nomeFuncionario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nome';
            } else if (document.cadastro.salario.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Salário';
            }else if (document.cadastro.nascimento.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Nascimento';
            } else {
                document.cadastro.opcao.value = 'alterar';
                document.cadastro.action = 'CAEFuncionario.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'excluir') {
            document.cadastro.opcao.value = 'excluir';
            document.cadastro.action = 'CAEFuncionario.jsp';
            document.cadastro.submit();
        }
    }
   
    
  
 
</script>

<%
    DAOCidade daoCidade = new DAOCidade();
    List<Cidade> listaCidades = daoCidade.consultar();
    
    List <String>listaPagamento = new ArrayList();
    listaPagamento.add("Crédito");
    listaPagamento.add("Débito");
    listaPagamento.add("Boleto");
   
    String mensagem = request.getParameter("mensagem");
      // mensagem = new String(mensagem.getBytes(), "ISO-8859-1");

       System.out.println("Mensagem="+mensagem);
    String codigo = request.getParameter("codigo");
    String nomeFuncionario = request.getParameter("nomeFuncionario");
    String salario = request.getParameter("salario");
    String cpf = request.getParameter("cpf");
    String nascimento = request.getParameter("nascimento");
    
    String codigoCidade = request.getParameter("codigoCidade");
    String opcao = request.getParameter("opcao");
    String pagamentoListar = request.getParameter("pagamento");
   
    if (opcao == null) {
        opcao = "nulo";
    }
    if (codigo == null) { // código do funcionário
        codigo = "0";
    }
    if (codigoCidade == null) {
        codigoCidade = "0";
    }
    if (pagamentoListar == null) {
        pagamentoListar = "nulo";
    }

%>
<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <br>
        <h1>Cadastro Funcionário</h1>
        <form name="cadastro" >
            <p><label>Nome: </label> <input type="text" name="nomeFuncionario" value="<%= (nomeFuncionario == null) ? "" : nomeFuncionario%>" size="50" /></p>
            <p><label>Salário: </label><input type="number" name="salario" value="<%= (salario == null) ? "" : salario%>" size="5" /></p>
            <p><label>CPF: </label><input type="number" name="cpf" value="<%= (cpf == null) ? "" : cpf%>" size="5" placeholder="Digite somente números" /></p>
            <p><label>Nascimento: </label><input type="date" name="nascimento" value="<%= (nascimento == null) ? "" : nascimento %>" size="5" /></p>
         
            <p><label>Cidade: </label>
                <select name="cidade"> 
                    <% for(Cidade cidades:listaCidades){ %>
                    <% if(codigoCidade.equals(String.valueOf(cidades.getCodigo()))) { %>
                    <option selected value="<%= cidades.getCodigo() %>"> <%= cidades.getCidade() %></option>
                    <%}else{%>
                    <option value="<%= cidades.getCodigo() %>"> <%= cidades.getCidade() %></option>
                    <%}%>
                    <% } %>
                  
                </select>
            </p>
            <p><label>Pagamento </label>
                <select name="pagamento"> 
                    <% for(String pagamento: listaPagamento){ %>
                    <% if(pagamentoListar.equals(pagamento)) { %>
                    <option selected value="<%= pagamentoListar %>"> <%= pagamentoListar %></option>
                    <%}else{%>
                    <option value="<%= pagamento %>"> <%= pagamento %></option>
                    <%}%>
                    <% } %>
                  
                </select>
            </p>
            <p>
                <% if (opcao.equals("nulo")) { %>
                <input type="button" value="Cadastrar" name="Cadastrar" onclick="enviar('cadastrar')" />
                <%}%>

                <% if (opcao.equals("alterar")) { %>
                <input type="button" value="Alterar" name="Alterar" onclick="enviar('alterar')" />
                <% } %>
                <% if (opcao.equals("excluir")) { %>
                <input type="button" value="Excluir" name="Excluir" onclick="enviar('excluir')" />
                <%}%>
                <% if (!(opcao.equals("nulo"))) { %>
                
                <input type="button" value="Cancelar" name="Cancelar" onclick="enviar('cancelar')" />
                <% } %>
            </p>
            <p><textarea name="mensagem" rows="2" cols="100" readonly="readonly" disabled="disabled" > <%= (mensagem == null) ? "" : mensagem%> </textarea></p>
            <input type="hidden" name="opcao"  />
            <input type="hidden" name="codigo" value="<%= codigo%>" />

        </form>
        <%@include file="ListarFuncionario.jsp" %>
    </body>
</html>

<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>

