/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author johan
 */
public class DAOLogin {
    String mensagem;
    String nome;
    String cargo;
    public String entrar(Login objLogin){
        String sql = "SELECT nome FROM funcionario WHERE email = ? AND senha = ?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objLogin.getEmail());
            pst.setString(2, objLogin.getSenha());
            ResultSet rs = pst.executeQuery();
                if(rs.next()){
                    
                    //Seleciona o nome do funcionário
                     mensagem = rs.getString("nome");
                    
                }else{
                    mensagem = "ERROR";
                }
            }catch(Exception ex){
                
            }
        return mensagem;
    }
}
