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

public class DAOModelo {
    
    public List<Modelo> listarModelo(){
        String sql = "SELECT * FROM modelo";
        List<Modelo> listaModelo = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                Modelo objModelo = new Modelo();
                objModelo.setCodigo(rs.getInt("codModelo"));
                objModelo.setModelo(rs.getString("modelo"));
                listaModelo.add(objModelo);
            }
        }
        catch(SQLException ex)
        {
            System.out.println("Erro no ListarFuncionario do DAOCidade: "+ex);
        }
        return listaModelo;
    }
    
    public Modelo localizar(Integer id){
        String sql = "SELECT * FROM modelo WHERE codModelo = ?";
        Modelo objModelo = new Modelo();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objModelo.setCodigo(rs.getInt("codModelo"));
                objModelo.setModelo(rs.getString("modelo"));
                return objModelo;
            }
        }
        catch(SQLException e){
            System.out.println("ERRO de SQL Localizar: "+e.getMessage());
        }
        return null;
    }
}
