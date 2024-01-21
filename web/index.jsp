
<%@include file="Menu.jsp" %>
<script>
            function enviar(par){
                if (par == 'login'){
                    if (document.cadastro.email.value == ''){
                      alert("Preencha o campo email");
                    }else if (document.cadastro.senha.value == ''){
                        alert("Preencha o campo senha");
                    }else {
                        document.cadastro.action='LoginUsuario.jsp';
                        document.cadastro.submit();
                    }
                } 
            }
        </script>
        <% String mensagem = request.getParameter("mensagem"); %>
        
        

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Latin1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Login</title>
	
 
        
	
</head>
<body>
	
    <!-- Start Interface--><br>
	<div id="interface" class="container-fluid">

		<!-- Start nav-->
                <nav class="row"> 
                   
                    <div class="bg-dark" style="width: 100%;"> 
                        <ul class="text-center position-relative">
                        
                        </ul>
                    </div>
                </nav>
	

         <article class="row pt-3 formLogin">
             
            

                <form  class="col-md-4 pl-5 pt-4" name="cadastro" method="POST">

                    
                   <p class="paragrafo" style="font-size: 2rem;">Login: <input required class="form-control" name="email" maxlength="50" placeholder="digite seu login"></p>  
                   <p class="paragrafo" style="font-size: 2rem;">Senha:<input required  class="form-control" type="password" name="senha" maxlength="50" placeholder="digite sua senha"></p>

                   <div class="text-center">
                   <input class="btn btn-primary" type="reset" value="Limpar" style="font-size: 1.22rem;">
                   <input class="btn btn-success" type="submit" name="image" style="font-size: 1.22rem;" onClick="enviar('login')" value="Entrar">
                   

                   </div>
                   
                   <% if(mensagem != null){%>
                  
                      <p> <%= mensagem %></p>
                 
                   
                   
                   <%}%>
         
 </form>
             
             
                
                 
                 <div  >
                     <p   color: #ddd">*Se você já possui um cadastro, então se identifique
                   usando seu login e senha! <br> *Se 
                   você já estava utilizando o software, sua sessão pode ter 
                   expirado portanto apenas faça o login novamente <br> *Se 
                   você ainda não possui um login e senha, dirija-se ao seu gerente</p>
                     <p   color: #ddd">Em caso de dúvida entre em contato pelo e-mail:  tuliodias@gmail.com</p>
                </div>
 
         </artilce>     
               





    </div>              
</body>
</html>




