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
public class DAOCidade {
    
    String mensagem;
    public String inserir(Cidade objCidade){
        String sql = "INSERT INTO cidade (cid,uf) values(?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objCidade.getNomeCidade());
            pst.setString(2, objCidade.getUfCidade());
            if(pst.executeUpdate()>0)
            {
                mensagem = "Cidade cadastrada com sucesso!";
            }
            else
            {
                mensagem = "Cidade não cadastrada";
            }
            pst.close();
        }catch(SQLException ex){
            mensagem = "Erro de SQL ao inserir do DAOCidade: "+ex.getMessage()+"\nComando sql: "+sql;
        }
        return mensagem;
    }
    
    public List<Cidade> listarCidade(){
        String sql = "SELECT * FROM cidade";
        List<Cidade> listaCidade = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                Cidade objCidade = new Cidade();
                objCidade.setCodigo(rs.getInt("codCidade"));
                objCidade.setNomeCidade(rs.getString("cid"));
                objCidade.setUfCidade(rs.getString("uf"));
                listaCidade.add(objCidade);
            }
        }
        catch(SQLException ex)
        {
            System.out.println("Erro no ListarCidade do DAOCidade: "+ex);
        }
        return listaCidade;
    }

public String alterar(Cidade objCidade){
        String sql = "UPDATE cidade SET cid = ?, uf = ? WHERE codCidade = ?";
        
        try
            
        {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objCidade.getNomeCidade());
            pst.setString(2, objCidade.getUfCidade());
            pst.setInt(3, objCidade.getCodigo());
            
            if(pst.executeUpdate()>0){
                 mensagem="Cidade Alterada com sucesso";
                
            }
            else
            {
                mensagem="Cidade não Alterada com sucesso";
               
            }
        }catch(SQLException ex){
            System.out.println("Erro de SQL"+ex);
            
        }
        return mensagem;
    }
    public String excluir(Cidade objCidade){
        String sql = "DELETE FROM cidade WHERE codCidade = ?;";
        
        try
            
        {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objCidade.getCodigo());
            
            if(pst.executeUpdate()>0){
                mensagem="Cidade apagada com sucesso";
                
            }
            else
            {
                mensagem="Cidade não apagada com sucesso";
                
            }
        }catch(SQLException ex){
            System.out.println("Erro de SQL"+ex);
            
        }
        return mensagem;
    }
    
    public Cidade localizar(Integer id){
        String sql = "SELECT * FROM cidade WHERE codCidade = ?";
        Cidade objCidade = new Cidade();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objCidade.setCodigo(rs.getInt("codCidade"));
                objCidade.setNomeCidade(rs.getString("cid"));
                objCidade.setUfCidade(rs.getString("uf"));
                return objCidade;
            }
        }
        catch(SQLException e){
            System.out.println("ERRO de SQL Localizar: "+e.getMessage());
        }
        return null;
    }
    
    public Cidade localizarNome(String nome){
        String sql = "SELECT * FROM cidade WHERE cid = ?";
        Cidade objCidade = new Cidade();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, nome);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objCidade.setCodigo(rs.getInt("codCidade"));
                objCidade.setNomeCidade(rs.getString("cid"));
                objCidade.setUfCidade(rs.getString("uf"));
                return objCidade;
            }
        }
        catch(SQLException e){
            System.out.println("ERRO de SQL Localizar: "+e.getMessage());
        }
        return null;
    }
}
