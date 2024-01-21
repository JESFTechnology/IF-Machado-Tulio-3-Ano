package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.DAOFuncionario;
import modelo.Funcionario;
import modelo.DAOTransporte;
import modelo.Transporte;
import modelo.ConverteData;
import modelo.DAOItensVenda;
import modelo.ItensVenda;
import modelo.Caixa;
import modelo.DAOCaixa;
import modelo.DAOLogin;
import modelo.Cliente;
import modelo.DAOCliente;
import modelo.Modelo;
import modelo.DAOModelo;
import java.util.List;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=Latin1");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

    String mensagem = request.getParameter("mensagem");
    String mensagemRelatorio = request.getParameter("mensagemRelatorio");
    String opcao = request.getParameter("opcao");
    String alterar = request.getParameter("alterar");
    String codVenda = request.getParameter("codVenda");
    String tabelaRelatorio = request.getParameter("tabelaRelatorio");
    DAOLogin objDAOCliente = new DAOLogin();
    List<Funcionario> listaFuncionario = objDAOCliente.listarCliente();
    
    DAOTransporte objDAOTransporte = new DAOTransporte();
    List<Transporte> listaTransporte = objDAOTransporte.listarTransporte();
    
    DAOModelo objDAOModelo = new DAOModelo();
    String user = "0",tipoUser="Nada";
    
    //User
    String nome = "Login",email = "",cargo="",cpf="",pix="",senha="";
    List<Modelo> listaModelo = objDAOModelo.listarModelo();
    
    if(alterar==null){
        alterar = "false";
    }
    
    if(codVenda==null){
        codVenda = "0";
    }
    
    if(session.getAttribute("user")!=null)
    {
        user = session.getAttribute("user").toString();
        
        for(Funcionario funcionario:listaFuncionario){
            if(user.equals(String.valueOf(funcionario.getCodigo()))){
                nome = funcionario.getNomeFuncionario();
                cargo = funcionario.getCargoFuncionario();
                email = funcionario.getEmailFuncionario();
                senha = funcionario.getSenhaFuncionario();
            }
        }
    }
    else{
        nome = "Login";
    }
    
    //DAOCaixa objVenda = new DAOCaixa();
    //List<Caixa> listaVenda = objVenda.selecionarVendaAuto2(Integer.valueOf(user));
    
    DAOItensVenda objDAOItensVenda = new DAOItensVenda();
    
    ConverteData objConverte = new ConverteData();
    
    if(opcao==null){
        opcao = "user";
    }

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=Latin1\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"img/logoIF.png\" type=\"image/x-icon\">\n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/all.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/estilo.css\">\n");
      out.write("          \n");
      out.write("\t<!--Javascript-->\n");
      out.write("\t<script src=\"js/bootstrap.bundle.js\"></script>\n");
      out.write("        <title>Login</title>\n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        body{\n");
      out.write("            background-image: url(\"img/fundo2.jpg\");\n");
      out.write("            background-repeat: no-repeat;\n");
      out.write("            background-size: cover;\n");
      out.write("            align-items: center;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <header>\n");
      out.write("\t\t<nav class=\"navbar navbar-expand-md px-4 bg-black\">\n");
      out.write("\t\t\t<div class=\"navbar-brand\">\n");
      out.write("                            <a href=\"index.jsp\"><img src=\"img/logo.png\" alt=\"logo png\" class=\"logopngif\"></a>\n");
      out.write("\t\t\t</div >\n");
      out.write("\t\t\t<button class=\"navbar-toggler\" data-bs-toggle=\"collapse\" data-bs-target=\"#menubar\"><span class=\"fa-solid fa-bars\"></span></button>\n");
      out.write("\n");
      out.write("\t\t\t<div class=\"collapse navbar-collapse\" id=\"menubar\">\n");
      out.write("\t\t\t<ul class=\"navbar-nav\">\n");
      out.write("                            <li class=\"nav-item\"><a href=\"index.jsp\" class=\"nav-link text-white\">Home</a></li>\n");
      out.write("\t\t\t\t");
 if(nome!="Login"){
      out.write("\t\n");
      out.write("                                    <li class=\"nav-item dropdown\">\n");
      out.write("                                            <a href=\"#\" class=\"nav-link text-white dropdown-toggle\" data-bs-toggle=\"dropdown\">Modelos</a>\n");
      out.write("                                    <ul class=\"dropdown-menu p-3\">\n");
      out.write("                                        <li><a href=\"cadastroCidade.jsp\"class=\"dropdown-item text-white\">Cidade</a></li>\n");
      out.write("                                        <li><a href=\"cadastroFuncionario.jsp\"class=\"dropdown-item text-white\">Funcionários</a></li>\n");
      out.write("                                        <li><a href=\"cadastroProdutos.jsp\"class=\"dropdown-item text-white\">Produtos</a></li>\n");
      out.write("                                        <li><a href=\"cadastroVeiculos.jsp\"class=\"dropdown-item text-white\">Transporte TESTE</a></li>\n");
      out.write("                                        <li><a href=\"cadastroCliente.jsp\"class=\"dropdown-item text-white\">Clientes</a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                                    </li>\n");
      out.write("                                    <li class=\"nav-item dropdown\"><a href=\"#\" class=\"nav-link text-white dropdown-toggle\" data-bs-toggle=\"dropdown\">Caminhões</a>\n");
      out.write("                                    <ul class=\"dropdown-menu\">\n");
      out.write("                                            ");
 for(Modelo modelo:listaModelo){
      out.write("\n");
      out.write("                                            <li><a href=\"https://www.caminhoesecarretas.com.br/venda/caminhao/");
      out.print( modelo.getModelo() );
      out.write("/marca/");
      out.print( modelo.getCodigo() );
      out.write("\"class=\"dropdown-item text-white\">");
      out.print(modelo.getModelo());
      out.write("</a></li>\n");
      out.write("                                            ");
}
      out.write("\n");
      out.write("                                    </ul>\n");
      out.write("                                    </li>\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("                                <li class=\"nav-item\"><a href=\"loja.jsp\" class=\"nav-link text-white\">Loja</a></li>\n");
      out.write("                                <li class=\"nav-item\"><a href=\"login.jsp\" class=\"nav-link text-white\">");
      out.print( nome );
      out.write("</a></li>\n");
      out.write("                                \n");
      out.write("\t\t\t</ul>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t</nav>\n");
      out.write("\t</header>\n");
      out.write("        ");
 if(user.equals("0")){ 
      out.write("    \n");
      out.write("        <style>\n");
      out.write("            .inputT{\n");
      out.write("                background-color: transparent;\n");
      out.write("                border: none;\n");
      out.write("            }\n");
      out.write("            .inputT:focus{\n");
      out.write("                background-color: transparent;\n");
      out.write("                border: none;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <script>\n");
      out.write("        function mostrarSenha(){\n");
      out.write("            var campoSenha = document.getElementById(\"senha\");\n");
      out.write("            var iconeOlho = document.querySelector(\".mostrar-senha i\");\n");
      out.write("\n");
      out.write("            if (campoSenha.type === \"password\") {\n");
      out.write("                campoSenha.type = \"text\";\n");
      out.write("                iconeOlho.classList.remove(\"fa-eye\");\n");
      out.write("                iconeOlho.classList.add(\"fa-eye-low-vision\");\n");
      out.write("            } else {\n");
      out.write("                campoSenha.type = \"password\";\n");
      out.write("                iconeOlho.classList.remove(\"fa-eye-low-vision\");\n");
      out.write("                iconeOlho.classList.add(\"fa-eye\");\n");
      out.write("            }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <form class=\"formLogin col-sm-5 card m-auto mt-4 border-dark border-2\" method=\"post\" action=\"CAELogin.jsp\">\n");
      out.write("                <img src=\"img/logo.png\" style=\"width: 30%\">\n");
      out.write("                <br>\n");
      out.write("                <h6>Sou o funcionário</h6>\n");
      out.write("                <input style=\"width: 80%; height: 80%; size: auto\" value=\"\" placeholder=\"Ex; johannsacconi@gmail.com\" type=\"email\" name=\"email\" class=\"inputT text-login formLogin\" required/>\n");
      out.write("                <div class=\"border-top border-2 border-dark container mx-2\"></div>\n");
      out.write("                <br>\n");
      out.write("                <label class=\"container col-10\" style=\"position: relative;\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <input id=\"senha\" placeholder=\"Digite sua senha\" type=\"password\" \n");
      out.write("                        name=\"senha\" class=\"col-10 inputT \" required/>\n");
      out.write("\n");
      out.write("                        <span class=\"mostrar-senha col-2\" onclick=\"mostrarSenha()\"><i class=\"col-2 fa-solid fa-eye\"></i></span>\n");
      out.write("                    </div>\n");
      out.write("                </label>\n");
      out.write("                <div class=\"border-top border-2 border-dark container mx-2\"></div>\n");
      out.write("                <br>\n");
      out.write("                <p><input type=\"checkbox\" name=\"lembrar\">Relembre meu usuário</p>\n");
      out.write("                <input type=\"hidden\" value=\"1\" name=\"opcao\">\n");
      out.write("                <input style=\"width: 50%; height: 50%;\" type=\"submit\" value=\"Logar\" class=\"botaoCadastrar botaoLogin\">\n");
      out.write("                \n");
      out.write("                <p>Não tem uma conta? <a href=\"cadastrar.jsp\">Inscreva-se</a></p>\n");
      out.write("                \n");
      out.write("                <p style=\"color: red\">");
      out.print( (mensagem==null)?"":mensagem );
      out.write("</p>\n");
      out.write("                <br>\n");
      out.write("        </form>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        ");
 }else{ 
      out.write("\n");
      out.write("        <div class=\"align-self-center\">\n");
      out.write("            ");
 if(opcao.equals("user")){ 
      out.write("\n");
      out.write("                <div>\n");
      out.write("                    <h2> Bem vindo ");
      out.print( nome );
      out.write(" </h2>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"align-content-center mx-auto\">\n");
      out.write("                    <div class=\"align-content-md-center row align-content-center\">\n");
      out.write("                        <div class=\"col-2 card m-auto\">\n");
      out.write("                            <div class=\"m-auto\">\n");
      out.write("                            <a href=\"login.jsp?opcao=minhaconta\">\n");
      out.write("                            <img class=\"w-50\" src=\"img/juventude.png\">\n");
      out.write("                            <h5>Minha conta</h5>\n");
      out.write("                            <p>Configurações e endereço</p>\n");
      out.write("                            </a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                        <div class=\"col-2 card m-auto\"> \n");
      out.write("                            <div class=\"m-auto\">\n");
      out.write("                            <a href=\"login.jsp?opcao=relatorio\">\n");
      out.write("                            <img class=\"w-50\" src=\"img/chatbot.png\">\n");
      out.write("                            <h5>Relatórios</h5>\n");
      out.write("                            <p>Relatórios inteligentes</p>\n");
      out.write("                            </a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                        <div class=\"col-2 card m-auto\">\n");
      out.write("                            <div class=\"m-auto\">\n");
      out.write("                            <a href=\"\">\n");
      out.write("                            <img class=\"w-50\" src=\"img/em-breve.png\">\n");
      out.write("                            <h5>EM BREVE</h5>\n");
      out.write("                            <p>EM BREVE MESMO</p>\n");
      out.write("                            </a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            ");
 }else if(opcao.equals("minhaconta")){ 
      out.write("\n");
      out.write("            <div class=\"\">\n");
      out.write("                <div>\n");
      out.write("                    <h5 class=\"text-warning\"><a href=\"login.jsp?opcao=user\">Login</a> -> Minha conta</h5>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card bg-dark\"></div>\n");
      out.write("                ");
 if(alterar.equals("false")){
      out.write("\n");
      out.write("                \n");
      out.write("                <div class=\"card align-content-md-center align-content-center col-3 m-auto mt-4\">\n");
      out.write("                    <div class=\"card-body\">\n");
      out.write("                        <div class=\"text-center\">\n");
      out.write("                            <div class=\"\">\n");
      out.write("                                <h6 class=\"fw-bold\">Nome e cargo</h6>\n");
      out.write("                                <p>");
      out.print( nome );
      out.write(' ');
      out.print( cargo );
      out.write("</p>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"border-top\">\n");
      out.write("                                <h6 class=\"fw-bold\">Email</h6>\n");
      out.write("                                <p>");
      out.print( email );
      out.write("</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"card-footer text-center\">\n");
      out.write("                        <a class=\"btn btn-warning\" href=\"login.jsp?alterar=true&opcao=minhaconta\">Alterar</a>\n");
      out.write("                        <a class=\"btn btn-danger\" href=\"logoff.jsp\">Deslogar</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                            \n");
      out.write("                ");
 }else{
      out.write("\n");
      out.write("                <form action=\"CAECliente.jsp\">\n");
      out.write("                <div class=\"card align-content-md-center align-content-center col-3 m-auto mt-4\">\n");
      out.write("                    <div class=\"card-body\">\n");
      out.write("                        <div class=\"text-center\">\n");
      out.write("                            <div class=\"\">\n");
      out.write("                                <h5>Não funciona, é enfeite</h5>\n");
      out.write("                                <h6 class=\"fw-bold\">Nome</h6>\n");
      out.write("                                <input class=\"col-10\" type=\"text\" name=\"nome\" value=\"");
      out.print( nome );
      out.write("\">\n");
      out.write("                                <h6 class=\"fw-bold\">Cargo</h6>\n");
      out.write("                                <input class=\"col-10\" type=\"text\" name=\"cargo\" value=\"");
      out.print( cargo );
      out.write("\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"border-top\">\n");
      out.write("                                <h6 class=\"fw-bold\">Email</h6>\n");
      out.write("                                <input class=\"col-10\" type=\"email\" name=\"email\" value=\"");
      out.print( email );
      out.write("\"> \n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"border-top\">\n");
      out.write("                                <h6 class=\"fw-bold\">Senha</h6>\n");
      out.write("                                <input class=\"col-10\" type=\"password\" name=\"senha\" value=\"");
      out.print( senha );
      out.write("\"> \n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"card-footer\">\n");
      out.write("                        <input type=\"hidden\" value=\"login\" name=\"tela\">\n");
      out.write("                        <input type=\"hidden\" value=\"alterar\" name=\"opcao\">\n");
      out.write("                        <input type=\"hidden\" value=\"");
      out.print( user );
      out.write("\" name=\"codigo\">\n");
      out.write("                        <input type=\"submit\" class=\"btn btn-warning\" value=\"Concluir\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                            </form>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </div>\n");
      out.write("            ");
 }else if(opcao.equals("relatorio")){ 
      out.write("\n");
      out.write("            <div class=\"\">\n");
      out.write("                <div>\n");
      out.write("                    <h5 class=\"text-warning\"><a href=\"login.jsp?opcao=user\">Login</a> -> ChatBot</h5>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card bg-dark\"></div>\n");
      out.write("                <div class=\"card align-content-md-center align-content-center col-3 m-auto mt-4\">\n");
      out.write("                    <div class=\"card-text h-auto\">\n");
      out.write("                        ");
 if(tabelaRelatorio==null){
      out.write("\n");
      out.write("                         <label class=\"col-12 m-3\">\n");
      out.write("                             Olá ");
      out.print( nome );
      out.write("!\n");
      out.write("                             <br>\n");
      out.write("                             Chat Bot para te ajudar!\n");
      out.write("                             <br>\n");
      out.write("                             Está com precisando de qual relatório?\n");
      out.write("                              \n");
      out.write("                         </label>\n");
      out.write("                        ");
}else{
      out.write("\n");
      out.write("                            <label class=\"col-10 mb-3 ms-3\">\n");
      out.write("                             Olá ");
      out.print( nome );
      out.write("!\n");
      out.write("                             <br>\n");
      out.write("                             Chat Bot para te ajudar!\n");
      out.write("                             <br>\n");
      out.write("                             Está com precisando de qual relatório?\n");
      out.write("                              \n");
      out.write("                            </label>\n");
      out.write("                             <label class=\"col-10 mb-3 ms-3 text-end\">\n");
      out.write("                             Quero dados da tabela:\n");
      out.write("                             <br>\n");
      out.write("                             ");
      out.print( tabelaRelatorio );
      out.write("\n");
      out.write("                            </label>\n");
      out.write("                            <label class=\"col-10 mb-3 ms-3\">\n");
      out.write("                             Tabela: ");
      out.print( tabelaRelatorio );
      out.write("\n");
      out.write("                             <br>\n");
      out.write("                             Agora escolha a coluna\n");
      out.write("                            </label>\n");
      out.write("                             <label class=\"col-10 mb-3 ms-3 text-center\">\n");
      out.write("                             ");
if(mensagemRelatorio.equals("ERROR")){
      out.write("\n");
      out.write("                             <div class=\"text-danger\">ERRO</div>\n");
      out.write("                             ");
}else{
      out.write("\n");
      out.write("                             <div class=\"text-success\">");
      out.print( mensagemRelatorio);
      out.write("</div>\n");
      out.write("                             ");
}
      out.write("\n");
      out.write("                            </label>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"card-footer\">\n");
      out.write("                        ");
if(tabelaRelatorio==null){
      out.write("\n");
      out.write("                        <form action=\"login.jsp\" method=\"get\">\n");
      out.write("                            <select name=\"tabelaRelatorio\">\n");
      out.write("                                <option selected value=\"cidade\">Cidade</option>\n");
      out.write("                                <option value=\"cliente\">Cliente</option>\n");
      out.write("                                <option value=\"funcionario\">Funcionário</option>\n");
      out.write("                                <option value=\"itemvenda\">Item venda</option>\n");
      out.write("                                <option value=\"log\">Log</option>\n");
      out.write("                                <option value=\"marca\">Marcas</option>\n");
      out.write("                                <option value=\"modelo\">Modelo dos caminhão</option>\n");
      out.write("                            </select>\n");
      out.write("                            <input type=\"hidden\" name=\"opcao\" value=\"relatorio\">\n");
      out.write("                            <input type=\"submit\">\n");
      out.write("                        </form>\n");
      out.write("                        ");
}else{
      out.write("\n");
      out.write("                        <form action=\"relatorio.jsp\" method=\"post\">\n");
      out.write("                            <label>\n");
      out.write("                            <select name=\"coluna\" class=\"col-md-3\">\n");
      out.write("                                <option selected value=\"codigo\">Codigo</option>\n");
      out.write("                                <option value=\"nome\">Nome</option>\n");
      out.write("                                <option value=\"email\">Email</option>\n");
      out.write("                            </select>\n");
      out.write("                            é\n");
      out.write("                            <select name=\"se\" class=\"col-md-3\">\n");
      out.write("                                <option selected value=\"=\">Igual</option>\n");
      out.write("                                <option value=\">\">Maior</option>\n");
      out.write("                                <option value=\"<\">Menor</option>\n");
      out.write("                            </select>\n");
      out.write("                            a\n");
      out.write("                            </label>\n");
      out.write("                            <input type=\"text\" name=\"comparacaoColuna\" class=\"col-md-4\">\n");
      out.write("                            <input type=\"hidden\" name=\"tabelaRelatorio\" value=\"");
      out.print( tabelaRelatorio );
      out.write("\">\n");
      out.write("                            <input type=\"hidden\" name=\"opcao\" value=\"relatorio\">\n");
      out.write("                            <input type=\"submit\" class=\"col-md-2\">\n");
      out.write("                        </form>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            ");
 }else{ 
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    ");
 List<ItensVenda> listaItens = objDAOItensVenda.getLista(Integer.valueOf(codVenda)); 
      out.write("\n");
      out.write("                    ");
 for(ItensVenda itensVenda:listaItens){ 
      out.write("\n");
      out.write("                    <div class=\"col-2 card text-center\">\n");
      out.write("                    <form action=\"login.jsp\">\n");
      out.write("                            <p class=\"text-center\">Produto</p>\n");
      out.write("                            <img src=\"img/bolsa-de-compras.png\" class=\"col-6\" style=\"margin-top: 10px\">\n");
      out.write("                            <p>Produto comprado ");
      out.print( itensVenda.getProduto().getNome() );
      out.write("</p>\n");
      out.write("                            <p>Modelo: ");
      out.print( itensVenda.getProduto().getObjMarca().getMarca() );
      out.write("</p>\n");
      out.write("                            <p>Quantidade: ");
      out.print( itensVenda.getQuantidade() );
      out.write("</p>\n");
      out.write("                            <p>Valor: ");
      out.print( itensVenda.getValorProduto() );
      out.write("</p>\n");
      out.write("                            <input type=\"hidden\" name=\"codVenda\" value=\"0\">\n");
      out.write("                            <input type=\"hidden\" name=\"opcao\" value=\"minhascompras\">\n");
      out.write("                            <p><input class=\"botaoCadastrar\" type=\"submit\" name=\"click\" value=\"Voltar\"></p>\n");
      out.write("                        \n");
      out.write("                    </form>\n");
      out.write("                    </div>\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                </div>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </div>\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
