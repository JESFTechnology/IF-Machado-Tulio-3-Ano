/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author tulio
 */
public class DAOItensVenda { // data acess object
    
    DAOProduto daoProduto = new DAOProduto();
    
    
   
    
    public List<ItensVenda> getLista(Integer id){
        String sql = "select * from itemvenda where codVenda=?";
        List<ItensVenda> lista = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                ItensVenda obj = new ItensVenda();
                obj.setIdCaixa(rs.getInt("codVenda"));
                obj.setIdItens(rs.getInt("codItemVenda"));
                obj.setProduto(daoProduto.localizar(rs.getInt("codProduto")));
                obj.setQuantidade(rs.getInt("quantVenda"));
                obj.setValorProduto(rs.getDouble("valor"));
                lista.add(obj);
            }
            rs.close();
            pst.close();
        }catch(SQLException e){
            System.out.println("Erro de SQL DAO Itens getLista(): "+e.getMessage());
        }
        return lista;
    }
    
     public String incluir(ItensVenda obj) {
        String mensagem;
        String sql = "insert into itemvenda (codProduto,codVenda,quantVenda,valor) values (?,?,?,?)";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, obj.getProduto().getCodigo());
            pst.setInt(2, obj.getIdCaixa());
            pst.setInt(3, obj.getQuantidade());
            pst.setDouble(4, obj.getValorProduto());
            
            if (pst.executeUpdate() > 0) {
                 
                mensagem = " foi inserido no carrinho!";
            } else {
                mensagem = " não foi inserido no carrinho!";
            }
            pst.close();
        } catch (SQLException e) {
            mensagem = e.getMessage();
        }
        return mensagem;
    }
     
     public String remover(ItensVenda obj){
        String sql = "delete from itemvenda where codItemVenda=?";
        String mensagem;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, obj.getIdItens()); 
            if (pst.executeUpdate() > 0) {
                mensagem = " removido com sucesso!";
            } else {
                mensagem = " não excluído";
            }
            pst.close();
        } catch (SQLException e) {
            mensagem = e.getMessage();
        }
        return mensagem;
    }
    
 

  
    
    
}
