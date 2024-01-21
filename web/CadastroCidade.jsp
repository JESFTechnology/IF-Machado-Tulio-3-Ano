
<%@include file="Menu.jsp" %>

<% if (session.getAttribute("nome") != null){%>




<script>
    function enviar(par) {
        if (par == 'cadastrar') {

            if (document.cadastro.cidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cidade';
            } else if (document.cadastro.uf.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo UF';
            } else {
                document.cadastro.opcao.value = 'cadastrar';
                document.cadastro.action = 'CAECidade.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cadastro';
            document.cadastro.cidade.value = '';
            document.cadastro.uf.value = '';
            document.cadastro.action = 'CadastroCidade.jsp';
            document.cadastro.submit();
            /// }
        } else if (par == 'alterar') {

            if (document.cadastro.cidade.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo Cidade';
            } else if (document.cadastro.uf.value == '') {
                document.cadastro.mensagem.value = 'Preencha o campo UF';
            } else {
                document.cadastro.opcao.value = 'alterar';
                document.cadastro.action = 'CAECidade.jsp';
                document.cadastro.submit();
            }
        } else if (par == 'excluir') {
            document.cadastro.opcao.value = 'excluir';
            document.cadastro.action = 'CAECidade.jsp';
            document.cadastro.submit();
        }
    }
</script>


<%
String mensagem = request.getParameter("mensagem");
String codigo = request.getParameter("codigo");
if(codigo==null)codigo="0";
String nomeCidade = request.getParameter("cidade");
String uf = request.getParameter("uf");

String opcao = request.getParameter("opcao");
if(opcao==null)opcao="cadastro";
%>
<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Cidade</title>
    </head>
    <body>
        <br>
        <h1>Cadastro de Cidade</h1>
        <form name="cadastro" class="col-md-4 pl-5 pt-4" >
           
 <p class="pl-5" style="font-size: 2rem;"> <label>Cidade:</label> <input required class="form-control" type="text" name="cidade" value="<%= (nomeCidade==null?"":nomeCidade) %>" size="50"  placeholder="digite o nome da cidade"/></p>
 <p class="pl-5" style="font-size: 2rem;"> <label>UF:</label> <input required class="form-control" type="text" name="uf" value="<%= (uf==null?"":uf) %>" size="5" /></p>
 <p class="pl-5" style="font-size: 2rem;">
 <% if (opcao.equals("cadastro")){ %>
 <input type="button" onclick="enviar('cadastrar')" value="Cadastrar" name="Cadastrar" />
 <% } %>
 <% if (opcao.equals("alterar")){ %>
 <input type="button" onclick="enviar('alterar')" value="Alterar" name="Alterar" />
  <input type="button" onclick="enviar('cancelar')" value="Cancelar" name="Cancelar" />
 <% } %>
 <% if (opcao.equals("excluir")){ %>
 <input type="button" onclick="enviar('excluir')" value="Excluir" name="Excluir" />
  <input type="button" onclick="enviar('cancelar')" value="Cancelar" name="Cancelar" />
 <% } %>
 </p>
 <p class="pl-5" style="font-size: 2rem;"><textarea name="mensagem" rows="2" cols="85" readonly="readonly">
    <%= (mensagem==null?"":mensagem) %>
     </textarea></p>
     <input type="hidden" name="opcao" value="" />
     <input type="hidden" name="codigo" value="<%= codigo%>" />
        </form>
        
       
        <%@include file="ListarCidade.jsp" %>
     
    </body>
</html>

<% } else {%>
<jsp:forward page="index.jsp">
<jsp:param name="mensagem" value="Acesso negado, efetue seu login!"/>
</jsp:forward>
<% } %>