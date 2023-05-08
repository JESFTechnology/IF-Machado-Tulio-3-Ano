<%-- 
    Document   : listarVeiculos
    Created on : 13/04/2023, 09:58:45
    Author     : johan
--%>

<%@page import="modelo.Veiculo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOVeiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    DAOVeiculo objDAOVeiculo = new DAOVeiculo();
    List<Veiculo> listaVeiculo = objDAOVeiculo.listarVeiculo();
    
    String color = "white";

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section class="carousel slide" data-bs-ride="carousel">
            
        <div class="carousel-inner">
            
            <% for(Veiculo veiculo:listaVeiculo){
                if(veiculo.getStatus().equals("Em andamento")){
                    color="#ffcd39";
                }else if(veiculo.getStatus().equals("Parado")){
                    color="#ba2c2c";
                }else if(veiculo.getStatus().equals("Em manutenção")){
                    color="#86b7fe";
            }%>
            
            <figure class="carousel-item">                               
                <img src="img/truckicon.png" style="background-color: <%= color %>; width: 100px; border-radius: 21px">
            </figure>                           
            
            <% } 
            
            %>
        </div>  
        </section>
    </body>
</html>
