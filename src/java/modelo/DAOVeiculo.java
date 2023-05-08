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
public class DAOVeiculo {
    
    DAOModelo objDAOModelo = new DAOModelo();
    
    public List<Veiculo> listarVeiculo(){
        String sql = "SELECT * FROM veiculo";
        List<Veiculo> listaVeiculo = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                Veiculo objVeiculo = new Veiculo();
                objVeiculo.setCodigo(rs.getInt("codVeiculo"));
                objVeiculo.setStatus(rs.getString("status"));
                objVeiculo.setPlaca(rs.getString("placa"));
                objVeiculo.setAno(rs.getInt("ano"));
                objVeiculo.setObjModelo(objDAOModelo.localizar(rs.getInt("codModelo")));
                listaVeiculo.add(objVeiculo);
            }
        }
        catch(SQLException ex)
        {
            System.out.println("Erro no ListarFuncionario do DAOCidade: "+ex);
        }
        return listaVeiculo;
    }
    
     String mensagem;
     
     public Veiculo localizar(Integer id){
        String sql = "SELECT * FROM veiculo WHERE codVeiculo = ?";
        Veiculo objVeiculo = new Veiculo();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objVeiculo.setCodigo(rs.getInt("codModelo"));
                objVeiculo.setAno(rs.getInt("ano"));
                objVeiculo.setPlaca(rs.getString("placa"));
                objVeiculo.setStatus(rs.getString("status"));
                return objVeiculo;
            }
        }
        catch(SQLException e){
            System.out.println("ERRO de SQL Localizar: "+e.getMessage());
        }
        return null;
    }
     
    public String inserir(Veiculo objVeiculo){
        String sql = "INSERT INTO veiculo (codModelo,ano,placa,espaco,status) values(?,?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objVeiculo.getObjModelo().getCodigo());
            pst.setInt(2, objVeiculo.getAno());
            pst.setString(3, objVeiculo.getPlaca());
            pst.setString(5, objVeiculo.getStatus());
            if(pst.executeUpdate()>0)
            {
                mensagem = "Veiculo cadastrado com sucesso!";
            }
            else
            {
                mensagem = "Veiculo não cadastrado";
            }
        }catch(SQLException ex){
            mensagem = "Erro de SQL ao inserir do DAOCidade: "+ex.getMessage()+"\nComando sql: "+sql;
        }
        return mensagem;
    }
    
    public String alterar(Veiculo objVeiculo){
        String sql = "UPDATE veiculo SET placa = ?, status = ?, ano = ?, espaco = ?, codModelo = ? WHERE codVeiculo = ?";
        
        try
            
        {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objVeiculo.getPlaca());
            pst.setString(2, objVeiculo.getStatus());
            pst.setInt(3, objVeiculo.getAno());
            pst.setInt(5, objVeiculo.getObjModelo().getCodigo());
            pst.setInt(6, objVeiculo.getCodigo());
            
            if(pst.executeUpdate()>0){
                 mensagem="Veiculo Alterado com sucesso";
                
            }
            else
            {
                mensagem="Veiculo não Alterado com sucesso";
               
            }
        }catch(SQLException ex){
            System.out.println("Erro de SQL"+ex);
            
        }
        return mensagem;
    }
    
    public String excluir(Veiculo objVeiculo){
        String sql = "DELETE FROM veiculo WHERE codVeiculo = ?;";
        
        try
            
        {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objVeiculo.getCodigo());
            
            if(pst.executeUpdate()>0){
                mensagem="Veiculo apagado com sucesso";
                
            }
            else
            {
                mensagem="Veiculo não apagado com sucesso";
                
            }
        }catch(SQLException ex){
            System.out.println("Erro de SQL"+ex);
            
        }
        return mensagem;
    }
}
