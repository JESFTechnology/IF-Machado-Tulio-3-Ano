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
public class DAOMarca {
    public List<Marca> listarMarca(){
        String sql = "SELECT * FROM marca";
        List<Marca> listaMarca = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                Marca objMarca = new Marca();
                objMarca.setCodigo(rs.getInt("codMarca"));
                objMarca.setMarca(rs.getString("marca"));
                listaMarca.add(objMarca);
            }
        }
        catch(SQLException ex)
        {
            System.out.println("Erro no ListarMarca do DAOMarca: "+ex);
        }
        return listaMarca;
    }
    
    public Marca localizar(Integer id){
        String sql = "SELECT * FROM marca WHERE codMarca = ?";
        Marca objMarca = new Marca();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objMarca.setCodigo(rs.getInt("codMarca"));
                objMarca.setMarca(rs.getString("marca"));
                return objMarca;
            }
        }
        catch(SQLException e){
            System.out.println("ERRO de SQL Localizar: "+e.getMessage());
        }
        return null;
    }
}
