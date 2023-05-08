package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.DAOProduto;
import modelo.Produto;
import modelo.Transporte;
import modelo.DAOTransporte;
import modelo.DAOVeiculo;
import modelo.Veiculo;
import modelo.Modelo;
import modelo.DAOModelo;
import java.util.List;

public final class cadastroVeiculos_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"img/logoIF.png\" type=\"image/x-icon\">\n");
      out.write("        <!--CSS-->\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/all.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/estilo.css\">\n");
      out.write("          \n");
      out.write("\t<!--Javascript-->\n");
      out.write("\t<script src=\"js/bootstrap.bundle.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://unpkg.com/leaflet@1.9.3/dist/leaflet.css\"\n");
      out.write("        integrity=\"sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI=\"\n");
      out.write("        crossorigin=\"\"/>\n");
      out.write("        <script src=\"https://unpkg.com/leaflet@1.9.3/dist/leaflet.js\"\n");
      out.write("        integrity=\"sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM=\"\n");
      out.write("        crossorigin=\"\"></script>\n");
      out.write("        ");

        
        DAOModelo objDAOModelo = new DAOModelo();
        List<Modelo> listaModelo = objDAOModelo.listarModelo();
        
        DAOVeiculo objDAOVeiculo = new DAOVeiculo();
        List<Veiculo> listaVeiculo = objDAOVeiculo.listarVeiculo();
        
        DAOTransporte objDAOTransporte = new DAOTransporte();
        List<Transporte> listaTransporte = objDAOTransporte.listarTransporte();
        
        String color = "white";
        
            String mensagem = request.getParameter("mensagem");
            String placaVeiculo = request.getParameter("placa");  
            String codigoVeiculo = request.getParameter("codigo");
            String modeloVeiculo = request.getParameter("modelo");
            String statusVeiculo = request.getParameter("status");
            String anoVeiculo = request.getParameter("ano");
            Double lat,lon;
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");
            String opcao = request.getParameter("opcao");
            
            if(latitude==null&&longitude==null){
            lat = 0.00;
            lon = 0.00;
            }
            else
            {
            lat = Double.parseDouble(latitude);
            lon = Double.parseDouble(longitude);
            }
            if(opcao==null){
                opcao="cadastrar";
            }
            
            if(modeloVeiculo==null)
            {
                modeloVeiculo = "1";
            }
            
        DAOProduto objDAOProduto = new DAOProduto();
        List<Produto> listaProduto = objDAOProduto.listarProduto();
        
        
      out.write("\n");
      out.write("          \n");
      out.write("        <title>JSP Veiculos</title>\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        body{\n");
      out.write("            background-image: url(\"img/fundo2.jpg\");\n");
      out.write("            background-repeat: no-repeat;\n");
      out.write("            background-size: cover;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .botaoLimpar{\n");
      out.write("            background-color: white;\n");
      out.write("            color: black;\n");
      out.write("            transition-duration: 1s;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .botaoLimpar:hover{\n");
      out.write("            background-color: #ba2c2c;\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .buttonC:checked{\n");
      out.write("            \n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .botaoCadastrar{\n");
      out.write("            background-color: white;\n");
      out.write("            color: black;\n");
      out.write("            transition-duration: 1s;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .botaoCadastrar:hover{\n");
      out.write("            background-color: #168934;\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        #map{\n");
      out.write("            width: 60%;\n");
      out.write("            height: 60%;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("\t\t<nav class=\"navbar navbar-expand-md .px-4\">\n");
      out.write("\t\t\t<div class=\"navbar-brand\">\n");
      out.write("                            <a href=\"index.jsp\"><img src=\"img/logoIF.png\" alt=\"logo png\" class=\"logopngif\"></a>\n");
      out.write("\t\t\t</div >\n");
      out.write("\t\t\t<button class=\"navbar-toggler\" data-bs-toggle=\"collapse\" data-bs-target=\"#menubar\"><span class=\"fa-solid fa-bars\"></span></button>\n");
      out.write("\n");
      out.write("\t\t\t<div class=\"collapse navbar-collapse\" id=\"menubar\">\n");
      out.write("\t\t\t<ul class=\"navbar-nav\">\n");
      out.write("                            <li class=\"nav-item\"><a href=\"index.jsp\" class=\"nav-link text-white\">Home</a></li>\n");
      out.write("\t\t\t\t<li class=\"nav-item dropdown\">\n");
      out.write("\t\t\t\t\t<a href=\"#\" class=\"nav-link text-white dropdown-toggle\" data-bs-toggle=\"dropdown\">Modelos</a>\n");
      out.write("\t\t\t\t<ul class=\"dropdown-menu p-3\">\n");
      out.write("                                    <li><a href=\"cadastroCidade.jsp\"class=\"dropdown-item text-white\">Cidade</a></li>\n");
      out.write("                                    <li><a href=\"cadastroFuncionario.jsp\"class=\"dropdown-item text-white\">Funcionários</a></li>\n");
      out.write("                                    <li><a href=\"cadastroProdutos.jsp\"class=\"dropdown-item text-white\">Produtos</a></li>\n");
      out.write("                                    <li><a href=\"cadastroVeiculos.jsp\"class=\"dropdown-item text-white\">Transporte TESTE</a></li>\n");
      out.write("                                    <li><a href=\"cadastroCliente.jsp\"class=\"dropdown-item text-white\">Clientes</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("                                <li class=\"nav-item\">\n");
      out.write("                                    <a href=\"#\" class=\"nav-link text-white\">Loja</a>\n");
      out.write("                                </li>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li class=\"nav-item dropdown\"><a href=\"#\" class=\"nav-link text-white dropdown-toggle\" data-bs-toggle=\"dropdown\">Caminhões</a>\n");
      out.write("\t\t\t\t<ul class=\"dropdown-menu p-3\">\n");
      out.write("                                        ");
 for(Modelo modelo:listaModelo){
      out.write("\n");
      out.write("\t\t\t\t\t<li><a href=\"https://www.caminhoesecarretas.com.br/venda/caminhao/");
      out.print( modelo.getModelo() );
      out.write("/marca/");
      out.print( modelo.getCodigo() );
      out.write("\"class=\"dropdown-item text-white\">");
      out.print(modelo.getModelo());
      out.write("</a></li>\n");
      out.write("                                        ");
}
      out.write("\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("                                <li class=\"nav-item\"><a href=\"login.jsp\" class=\"nav-link text-white\">Login</a></li>\n");
      out.write("\t\t\t</ul>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t</nav>\n");
      out.write("\t</header>\n");
      out.write("                                <style>\n");
      out.write("                                    #map{\n");
      out.write("                                        height: 400px;\n");
      out.write("                                        width: 900px;\n");
      out.write("                                        margin-left: 20px;\n");
      out.write("                                        margin-top: 20px; \n");
      out.write("                                        margin-top: 150px;\n");
      out.write("                                    }\n");
      out.write("                                </style>\n");
      out.write("    \n");
      out.write("                                <div style=\"float: left\">\n");
      out.write("            <form name=\"cadastro\" method=\"get\" action=\"CAEVeiculo.jsp\" class=\"formCidade\">\n");
      out.write("            <p><label>Placa: </label> <input type=\"text\" name=\"placa\" value=\"");
      out.print( (placaVeiculo==null)?"":placaVeiculo);
      out.write("\" size=\"30\" /></p>\n");
      out.write("            <p><label>Ano: </label> <input type=\"text\" name=\"ano\" value=\"");
      out.print( (anoVeiculo==null)?"":anoVeiculo );
      out.write("\" size=\"30\" /></p>    \n");
      out.write("            <p><label>Modelo: </label>   \n");
      out.write("                <select name=\"modelo\">\n");
      out.write("                    \n");
      out.write("                    <!--verifica com o codigoCidade vindo do listarFuncionario.jsp, se for igual fica selecionado-->\n");
      out.write("                    ");
 for(Modelo modelo:listaModelo){ if(modeloVeiculo.equals(String.valueOf(modelo.getCodigo()))){
      out.write("\n");
      out.write("                    \n");
      out.write("                        <option selected value=\"");
      out.print( modelo.getModelo() );
      out.write('"');
      out.write('>');
      out.print( statusVeiculo );
      out.write("</option>\n");
      out.write("                    \n");
      out.write("                      ");
} else {
      out.write("\n");
      out.write("                    \n");
      out.write("                        <option value=\"");
      out.print( modelo.getCodigo() );
      out.write('"');
      out.write('>');
      out.print( modelo.getModelo());
      out.write(" </option>\n");
      out.write("                      \n");
      out.write("                    ");
 }} 
      out.write("\n");
      out.write("                    \n");
      out.write("                </select>\n");
      out.write("            </p>\n");
      out.write("            \n");
      out.write("                ");
if(opcao.equals("cadastrar")){
      out.write("\n");
      out.write("                    <input type=\"submit\" value=\"Cadastrar\" name=\"cadastrar\" class=\"botaoCadastrar\"/>\n");
      out.write("                ");
}else if(opcao.equals("alterar")){
      out.write("\n");
      out.write("                    <input type=\"submit\" value=\"Alterar\" name=\"alterar\" class=\"botaoCadastrar\"/>\n");
      out.write("                ");
}else if(opcao.equals("excluir")){
      out.write("\n");
      out.write("                    <input type=\"submit\" value=\"Excluir\" name=\"excluir\" class=\"botaoExcluir\"/>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("                <input type=\"hidden\" name=\"opcao\" value=\"");
      out.print(opcao);
      out.write("\"/>\n");
      out.write("                <input type=\"hidden\" name=\"codigo\" value=\"");
      out.print( codigoVeiculo );
      out.write("\"/>\n");
      out.write("                <input type=\"reset\" value=\"Limpar\" name=\"limpar\" class=\"botaoLimpar\"/>\n");
      out.write("            </form>\n");
      out.write("                <p>");
      out.print( mensagem );
      out.write("</p>\n");
      out.write("    </div>\n");
      out.write("                <section class=\"carousel slide\" data-bs-ride=\"carousel\" style=\"float: right\" id=\"slideshow\">\n");
      out.write("            \n");
      out.write("                    <div class=\"carousel-inner\" style=\"width: 200px; background-color: #ced4da; height: 500px; border-radius: 35px;\">\n");
      out.write("                     <figure class=\"carousel-item active\">                        \n");
      out.write("                        <img src=\"img/truckicon.png\" style=\"background-color: ");
      out.print( color );
      out.write("; width: 200px; border-radius: 40px\">\n");
      out.write("                        <figcaption class=\"carousel-caption\">\n");
      out.write("                            <p class=\"fs-2 text-dark\">Caminhões</p>\n");
      out.write("                            <!--<a href=\"#\" class=\"btn btn-warning fw-bold\">Saiba mais</a>-->\n");
      out.write("                        </figcaption>\n");
      out.write("                    </figure>    \n");
      out.write("            \n");
      out.write("            ");
 for(Transporte transporte:listaTransporte){
                if(transporte.getObjVeiculo().getPlaca().equals("Em andamento")){
                    color="#ffcd39";
                }else if(transporte.getObjVeiculo().getPlaca().equals("Parado")){
                    color="#ba2c2c";
                }else if(transporte.getObjVeiculo().getPlaca().equals("Em manutenção")){
                    color="#86b7fe";}
            
      out.write("\n");
      out.write("            \n");
      out.write("            <figure class=\"carousel-item\">                        \n");
      out.write("                <img src=\"img/truckicon.png\" style=\"background-color: ");
      out.print( color );
      out.write("; width: 200px; border-radius: 40px\">\n");
      out.write("                \n");
      out.write("                <figcaption class=\"text-center\">\n");
      out.write("                    <p class=\"text-dark\">Placa:  ");
      out.print( transporte.getObjVeiculo().getPlaca() );
      out.write("</p>\n");
      out.write("                    <p class=\"text-dark\">Código: ");
      out.print( transporte.getCodigo());
      out.write("</p>\n");
      out.write("                    <p class=\"text-dark\">Modelo: ");
      out.print( transporte.getObjVeiculo().getObjModelo().getModelo() );
      out.write("</p>\n");
      out.write("                    <p class=\"text-dark\">Ano:    ");
      out.print( transporte.getObjVeiculo().getAno() );
      out.write("</p>\n");
      out.write("                    <p class=\"text-dark\">Lat:    ");
      out.print( transporte.getLat() );
      out.write("</p>\n");
      out.write("                    <p class=\"text-dark\">Long:    ");
      out.print( transporte.getLon() );
      out.write("</p>\n");
      out.write("                    <a href=\"cadastroVeiculos.jsp?opcao=alterar&placa=");
      out.print( transporte.getObjVeiculo().getPlaca() );
      out.write("&codigo=");
      out.print( transporte.getCodigo() );
      out.write("&modelo=");
      out.print( transporte.getObjVeiculo().getObjModelo().getModelo() );
      out.write("&ano=");
      out.print( transporte.getObjVeiculo().getAno() );
      out.write("&latitude=");
      out.print( transporte.getLat() );
      out.write("&longitude=");
      out.print( transporte.getLon() );
      out.write("\" class=\"btn btn-warning fw-bold\">Alterar</a>\n");
      out.write("                    <a href=\"cadastroVeiculos.jsp?opcao=excluir&placa=");
      out.print( transporte.getObjVeiculo().getPlaca() );
      out.write("&codigo=");
      out.print( transporte.getCodigo() );
      out.write("&modelo=");
      out.print( transporte.getObjVeiculo().getObjModelo().getModelo() );
      out.write("&ano=");
      out.print( transporte.getObjVeiculo().getAno() );
      out.write("&latitude=");
      out.print( transporte.getLat() );
      out.write("&longitude=");
      out.print( transporte.getLon() );
      out.write("\" class=\"btn btn-danger fw-bold\">Excluir</a>\n");
      out.write("                </figcaption>");
 } 
      out.write("\n");
      out.write("            </figure>           \n");
      out.write("            \n");
      out.write("        </div>  \n");
      out.write("            <a href=\"#slideshow\" class=\"carousel-control-prev text-decoration-none text-white fw-bold fa-2xl\" data-bs-slide=\"prev\"><</a>\n");
      out.write("            <a href=\"#slideshow\" class=\"carousel-control-next text-decoration-none text-white fw-bold fa-2xl \" data-bs-slide=\"next\">></a>\n");
      out.write("        </section>\n");
      out.write("                ");
 if(!lat.equals(0.00)){ 
      out.write("\n");
      out.write("        <div id=\"map\" class=\"map float-start \"></div>\n");
      out.write("        <script>\n");
      out.write("            var map = L.map('map').setView([");
      out.print( lat );
      out.write(',');
      out.write(' ');
      out.print( lon );
      out.write("], 13);\n");
      out.write("\n");
      out.write("                L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {\n");
      out.write("                attribution: '&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap</a> contributors'\n");
      out.write("                }).addTo(map);\n");
      out.write("\n");
      out.write("                L.marker([");
      out.print( lat );
      out.write(',');
      out.write(' ');
      out.print( lon );
      out.write("]).addTo(map)\n");
      out.write("                .bindPopup('Local do caminhão: ");
      out.print( placaVeiculo );
      out.write("')\n");
      out.write("                .openPopup();  \n");
      out.write("        \n");
      out.write("        </script>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
