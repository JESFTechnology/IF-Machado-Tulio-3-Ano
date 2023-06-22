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
public class DAOTransporte {
    
    DAOFuncionario objDAOFuncionario = new DAOFuncionario();
    
    DAOVeiculo objDAOVeiculo = new DAOVeiculo();
    
    public List<Transporte> listarTransporte(){
        String sql = "SELECT * FROM transporte";
        List<Transporte> listaTransporte = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                Transporte objTransporte = new Transporte();
                objTransporte.setCodigo(rs.getInt("codTransporte"));
                objTransporte.setLat(rs.getDouble("lat"));
                objTransporte.setLon(rs.getDouble("long"));
                objTransporte.setObjFuncionario(objDAOFuncionario.localizar(rs.getInt("codMotorista")));
                objTransporte.setObjVeiculo(objDAOVeiculo.localizar(rs.getInt("codVeiculo")));
                listaTransporte.add(objTransporte);
            }
        }
        catch(SQLException ex)
        {
            System.out.println("Erro no ListarCidade do DAOCidade: "+ex);
        }
        return listaTransporte;
    }
    
    public Transporte localizar(Integer id){
        String sql = "SELECT * FROM transporte WHERE codTransporte = ?";
        Transporte objTransporte = new Transporte();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objTransporte.setCodigo(rs.getInt("codTransporte"));
                objTransporte.setLat(rs.getDouble("lat"));
                objTransporte.setLon(rs.getDouble("long"));
                objTransporte.setObjFuncionario(objDAOFuncionario.localizar(rs.getInt("codMotorista")));
                objTransporte.setObjVeiculo(objDAOVeiculo.localizar(rs.getInt("codVeiculo")));
                return objTransporte;
            }
        }
        catch(SQLException e){
            System.out.println("ERRO de SQL Localizar: "+e.getMessage());
        }
        return null;
    }
}
