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
public class DAOProduto {
    String mensagem;
    public String inserir(Produto objProduto){
        String sql = "INSERT INTO produtos (nome,quantidade,estoque,preco) values(?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objProduto.getNome());
            pst.setFloat(2, objProduto.getQuantidade());
            pst.setFloat(3, objProduto.getEstoque());
            pst.setFloat(4, objProduto.getPreco());
            if(pst.executeUpdate()>0)
            {
                mensagem = "Produto cadastrado com sucesso!";
            }
            else
            {
                mensagem = "Produto não cadastrado";
            }
        }catch(SQLException ex){
            mensagem = "Erro de SQL ao inserir do DAOCidade: "+ex.getMessage()+"\nComando sql: "+sql;
        }
        return mensagem;
    }
    DAOMarca objDAOMarca = new DAOMarca();
    public List<Produto> listarProduto(){
        String sql = "SELECT * FROM produtos";
        List<Produto> listaProduto = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                Produto objProduto = new Produto();
                objProduto.setCodigo(rs.getInt("codProduto"));
                objProduto.setNome(rs.getString("nome"));
                objProduto.setQuantidade(rs.getFloat("quantidade"));
                objProduto.setEstoque(rs.getFloat("estoque"));
                objProduto.setPreco(rs.getFloat("preco"));
                objProduto.setObjMarca(objDAOMarca.localizar(rs.getInt("codMarca")));
                listaProduto.add(objProduto);
            }
        }
        catch(SQLException ex)
        {
            System.out.println("Erro no ListarProduto do DAOCidade: "+ex);
        }
        return listaProduto;
    }
    
    public String alterar(Produto objProduto){
        String sql = "UPDATE produtos SET nome = ?, quantidade = ?,  estoque = ?, preco = ? WHERE codProduto = ?";
        
        try
            
        {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objProduto.getNome());
            pst.setFloat(2, objProduto.getQuantidade());
            pst.setFloat(3, objProduto.getEstoque());
            pst.setFloat(4, objProduto.getPreco());
            pst.setInt(5, objProduto.getCodigo());
            
            if(pst.executeUpdate()>0){
                 mensagem="Produto Alterado com sucesso";
                
            }
            else
            {
                mensagem="Produto não Alterado com sucesso";
               
            }
        }catch(SQLException ex){
            mensagem ="Erro de SQL"+ex;
            
        }
        return mensagem;
    }
    
    public String excluir(Produto objProduto){
        String sql = "DELETE FROM produtos WHERE codProduto = ?;";
        
        try
            
        {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objProduto.getCodigo());
            
            if(pst.executeUpdate()>0){
                mensagem="Produto apagado com sucesso";
                
            }
            else
            {
                mensagem="Produto não apagado com sucesso";
                
            }
        }catch(SQLException ex){
            mensagem ="Erro de SQL"+ex;
            
        }
        return mensagem;
    }
    
    public Produto localizar(Integer id){
        String sql = "SELECT * FROM produtos WHERE codProduto = ?";
        Produto objProduto = new Produto();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objProduto.setCodigo(rs.getInt("codProduto"));
                objProduto.setNome(rs.getString("nome"));
                objProduto.setQuantidade(rs.getFloat("quantidade"));
                objProduto.setEstoque(rs.getFloat("estoque"));
                objProduto.setPreco(rs.getFloat("preco"));
                objProduto.setObjMarca(objDAOMarca.localizar(rs.getInt("codMarca")));
                return objProduto;
            }
        }
        catch(SQLException e){
            System.out.println("ERRO de SQL Localizar: "+e.getMessage());
        }
        return null;
    }
}
