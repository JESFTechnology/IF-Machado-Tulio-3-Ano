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
public class DAOItemVenda {
    
    DAOProduto objDaoProduto = new DAOProduto();
    DAOVenda objDaoVenda = new DAOVenda();
    
    public List<ItemVenda> listarItemVenda(){
        String sql = "SELECT * FROM itemvenda";
        List<ItemVenda> listaVenda = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                ItemVenda objItemVenda = new ItemVenda();
                objItemVenda.setCodigo(rs.getInt("codItemVenda"));
                objItemVenda.setQuantVenda(rs.getInt("quantVenda"));
                objItemVenda.setValor(rs.getDouble("valor"));
                objItemVenda.setObjProduto(objDaoProduto.localizar(rs.getInt("codProduto")));
                objItemVenda.setObjVenda(objDaoVenda.localizar(rs.getInt("codVenda")));
                listaVenda.add(objItemVenda);
            }
        }
        catch(SQLException ex)
        {
            System.out.println("Erro no ListarCidade do DAOCidade: "+ex);
        }
        return listaVenda;
    }
}
