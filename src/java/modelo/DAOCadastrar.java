/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author johan
 */
public class DAOCadastrar {
    String mensagem;
    
    private int lastId;

    public int getLastId() {
        return lastId;
    }
    
    public String inserir(Cliente objCliente){
        String sql = "INSERT INTO cliente (nome,email,pix,cpf,senha) values(?,?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objCliente.getNome());
            pst.setString(2, objCliente.getEmail());
            pst.setString(3, objCliente.getPix());
            pst.setString(4, objCliente.getCpf());
            pst.setString(5, objCliente.getSenha());
            if(pst.executeUpdate()>0)
            {
                ResultSet rs = pst.getGeneratedKeys();// retorna o último idCaixa cadastrado
                if (rs.next()) {
                    lastId = rs.getInt(1); //armazena o último idCaixa cadastrado
                }
                mensagem = "Cliente cadastrada com sucesso!";
            }
            else
            {
                mensagem = "Cliente não cadastrada";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL ao inserir do DAOCliente: "+ex.getMessage()+"\nComando sql: "+sql;
        }
        return mensagem;
    }
}
