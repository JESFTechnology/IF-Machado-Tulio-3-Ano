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
public class DAOCliente {
    String mensagem="";
    public List<Cliente> listarCliente (){
        String sql = "SELECT * FROM cliente";
        List<Cliente> listaCliente = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Cliente objCliente = new Cliente();
                objCliente.setCodigo(rs.getInt("codCliente"));
                objCliente.setNome(rs.getString("nome"));
                objCliente.setEmail(rs.getString("email"));
                objCliente.setPix(rs.getString("pix"));
                objCliente.setCpf(rs.getString("cpf"));
                listaCliente.add(objCliente);
            }
        }catch(SQLException ex){
            System.out.println("Erro no listarCliente do DAOCliente: "+ex);
        }
        return listaCliente;
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
    
    public String alterar(Cliente objCliente){
        String sql = "UPDATE cliente SET nome = ?, email = ?,  pix = ?, cpf = ? WHERE codCliente = ?";
        
        try
            
        {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objCliente.getNome());
            pst.setString(2, objCliente.getEmail());
            pst.setString(3, objCliente.getPix());
            pst.setString(4, objCliente.getCpf());
            pst.setInt(5, objCliente.getCodigo());
            
            if(pst.executeUpdate()>0){
                 mensagem="Cliente Alterada com sucesso";
                
            }
            else
            {
                mensagem="Cliente não Alterada com sucesso";
               
            }
        }catch(SQLException ex){
            System.out.println("Erro de SQL"+ex);
            
        }
        return mensagem;
    }
    
    public String excluir(Cliente objCliente){
        String sql = "DELETE FROM cliente WHERE codCliente = ?;";
        
        try
            
        {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objCliente.getCodigo());
            
            if(pst.executeUpdate()>0){
                mensagem="Cliente apagada com sucesso";
                
            }
            else
            {
                mensagem="Cliente não apagada com sucesso";
                
            }
        }catch(SQLException ex){
            System.out.println("Erro de SQL"+ex);
            
        }
        return mensagem;
    }
    
     public Cliente localizar(Integer id){
        String sql = "SELECT * FROM cliente WHERE codCliente = ?";
        Cliente objCliente = new Cliente();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objCliente.setCodigo(rs.getInt("codCliente"));
                objCliente.setNome(rs.getString("nome"));
                objCliente.setEmail(rs.getString("email"));
                objCliente.setPix(rs.getString("pix"));
                objCliente.setCpf(rs.getString("cpf"));
                return objCliente;
            }
        }
        catch(SQLException e){
            System.out.println("ERRO de SQL Localizar: "+e.getMessage());
        }
        return null;
    }
}
