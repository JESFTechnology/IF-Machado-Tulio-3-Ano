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
public class DAOFuncionario {
    
    ConverteData objConverte = new ConverteData();
    
    DAOCidade objDAOCidade = new DAOCidade();
    
    String mensagem;
    public String inserir(Funcionario objFuncionario){
        String sql = "INSERT INTO funcionario (nome,salario,cargo,email,senha,nascimento,codCidade) values(?,?,?,?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objFuncionario.getNomeFuncionario());
            pst.setFloat(2, objFuncionario.getSalarioFuncionario());
            pst.setString(3, objFuncionario.getCargoFuncionario());
            pst.setString(4, objFuncionario.getEmailFuncionario());
            pst.setString(5, objFuncionario.getSenhaFuncionario());
            pst.setDate(6, objConverte.converteBanco(objFuncionario.getNascimento()));
            pst.setInt(7, objFuncionario.getObjCidade().getCodigo());
            
            if(pst.executeUpdate()>0)
            {
                mensagem = "Funcionario cadastrada com sucesso!";
            }
            else
            {
                mensagem = "Funcionario não cadastrada";
            }
        }catch(SQLException ex){
            mensagem = "Erro de SQL ao inserir do DAOFuncionario: "+ex.getMessage()+"\nComando sql: "+sql;
        }
        return mensagem;
    }
    
    public List<Funcionario> listarFuncionario(){
        String sql = "SELECT * FROM funcionario";
        List<Funcionario> listaFuncionario = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
                Funcionario objFuncionario = new Funcionario();
                objFuncionario.setCodigo(rs.getInt("codFuncionario"));
                objFuncionario.setNomeFuncionario(rs.getString("nome"));
                objFuncionario.setSalarioFuncionario(rs.getFloat("salario"));
                objFuncionario.setCargoFuncionario(rs.getString("cargo"));
                objFuncionario.setEmailFuncionario(rs.getString("email"));
                objFuncionario.setNascimento(objConverte.converteCalendario(rs.getDate("nascimento")));
                objFuncionario.setObjCidade(objDAOCidade.localizar(rs.getInt("codCidade")));
                
                listaFuncionario.add(objFuncionario);
            }
        }
        catch(SQLException ex)
        {
            System.out.println("Erro no ListarFuncionario do DAOCidade: "+ex);
        }
        return listaFuncionario;
    }
    
    public String alterar(Funcionario objFuncionario){
        String sql = "UPDATE funcionario SET nome = ?, salario = ?, cargo = ?, email=?,codCidade=?,nascimento=? WHERE codFuncionario = ?";
        
        try
            
        {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objFuncionario.getNomeFuncionario());
            pst.setFloat(2, objFuncionario.getSalarioFuncionario());
            pst.setString(3, objFuncionario.getCargoFuncionario());
            pst.setString(4, objFuncionario.getEmailFuncionario());
            pst.setInt(5, objFuncionario.getObjCidade().getCodigo());
            pst.setDate(6, objConverte.converteBanco(objFuncionario.getNascimento()));
            pst.setInt(7, objFuncionario.getCodigo());
            
            if(pst.executeUpdate()>0){
                 mensagem="Funcionario Alterada com sucesso";
                
            }
            else
            {
                mensagem="Funcionario não Alterada com sucesso";
               
            }
        }catch(SQLException ex){
            mensagem ="Erro de SQL"+ex;
            
        }
        return mensagem;
    }
    
    public String excluir(Funcionario objFuncionario){
        String sql = "DELETE FROM funcionario WHERE codFuncionario = ?;";
        
        try
            
        {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objFuncionario.getCodigo());
            
            if(pst.executeUpdate()>0){
                mensagem="Funcionario apagado com sucesso";
                
            }
            else
            {
                mensagem="Funcionario não apagado com sucesso";
                
            }
        }catch(SQLException ex){
            mensagem ="Erro de SQL"+ex;
            
        }
        return mensagem;
    }

}
