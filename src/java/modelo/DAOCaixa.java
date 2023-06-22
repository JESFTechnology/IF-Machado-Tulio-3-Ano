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
 * @author tulio
 */
public class DAOCaixa { // data acess object

    ConverteData converte = new ConverteData();
    private int lastId;

    public int getLastId() {
        return lastId;
    }
    
    public List<Caixa> selecionarVendaAuto(Integer cod){
        String sql = "SELECT * FROM venda WHERE codCliente = ? AND statusDaVenda = 'Em andamento'";
        List<Caixa> listaCaixa = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, cod);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                Caixa objCaixa = new Caixa();
                objCaixa.setIdCaixa(rs.getInt("codVenda"));
                listaCaixa.add(objCaixa);
            }
        }
        catch(SQLException ex)
        {
            System.out.println("Erro no ListarCidade do DAOCidade: "+ex);
        }
        return listaCaixa;
    }

    public String incluir(Integer cliente) {
        String mensagem;
        String sql = "INSERT INTO venda (codCliente,dataVenda) VALUES (?,NOW());";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, cliente);

            if (pst.executeUpdate() > 0) {
                 ResultSet rs = pst.getGeneratedKeys();// retorna o último idCaixa cadastrado
                if (rs.next()) {
                    lastId = rs.getInt(1); //armazena o último idCaixa cadastrado
                }
                mensagem = "Venda cadastrada com sucesso";
            } else {
                mensagem = "Venda não cadastrado!";
            }
            pst.close();
        } catch (SQLException e) {
            mensagem = e.getMessage();
        }
        return mensagem;
    }

    public String remove(Caixa caixa) {
        String mensagem;
        String sql = "delete from venda where codVenda=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setInt(1, caixa.getIdCaixa());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Venda cancelada";
            } else {
                mensagem = "Venda não cancelada";
            }
            stmt.close();
        } catch (SQLException e) {
            mensagem = e.getMessage() + "\nComando SQL = " + sql;

        }
        return mensagem;
    }
    
    public String finalizar(Caixa caixa) {
        String mensagem;
        String sql = "UPDATE venda SET statusDaVenda = 'Concluída' WHERE codVenda = ?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setInt(1, caixa.getIdCaixa());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Venda finalizada";
            } else {
                mensagem = "Venda não cancelada";
            }
            stmt.close();
        } catch (SQLException e) {
            mensagem = e.getMessage() + "\nComando SQL = " + sql;

        }
        return mensagem;
    }
}
