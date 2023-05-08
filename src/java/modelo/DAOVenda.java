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
public class DAOVenda {
    
    DAOCliente objCliente = new DAOCliente();
    
    DAOTransporte objTransporte = new DAOTransporte();
    
    public Venda localizar(Integer id){
        String sql = "SELECT * FROM venda WHERE codVenda = ?";
        Venda objVenda = new Venda();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objVenda.setCodigo(rs.getInt("codVenda"));
                objVenda.setStatus(rs.getString("statusDaVenda"));
                objVenda.setObjCliente(objCliente.localizar(rs.getInt("codCliente")));
                objVenda.setObjTransporte(objTransporte.localizar(rs.getInt("codTransporte")));
                return objVenda;
            }
        }
        catch(SQLException e){
            System.out.println("ERRO de SQL Localizar: "+e.getMessage());
        }
        return null;
    }
}
