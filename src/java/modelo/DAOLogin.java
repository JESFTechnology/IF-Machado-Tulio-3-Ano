/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author johan
 */
public class DAOLogin {
    String mensagem;
    String nome;
    String cargo;
    public String entrar(Login objLogin){
        String sql = "SELECT * FROM cliente WHERE email = ? AND senha = ?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objLogin.getEmail());
            pst.setString(2, objLogin.getSenha());
            ResultSet rs = pst.executeQuery();
                if(rs.next()){
                    
                    //Seleciona o nome do funcionário
                      mensagem = String.valueOf(rs.getInt("codCliente"));
                    
                }else{
                    mensagem = "ERROR";
                }
            }catch(Exception ex){
                
            }
        return mensagem;
    }
    public List<Cliente> listarCliente(){
        String sql = "SELECT * FROM cliente";
        List<Cliente> listaCliente = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                Cliente objCliente = new Cliente();
                objCliente.setCodigo(rs.getInt("codCliente"));
                objCliente.setNome(rs.getString("nome"));
                objCliente.setSobrenome(rs.getString("sobrenome"));
                objCliente.setEmail(rs.getString("email"));
                objCliente.setPix(rs.getString("pix"));
                objCliente.setCpf(rs.getString("cpf"));
                listaCliente.add(objCliente);
            }
        }
        catch(SQLException ex)
        {
            System.out.println("Erro no ListarCidade do DAOCidade: "+ex);
        }
        return listaCliente;
    }
}
