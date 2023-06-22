/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author tulio
 */
public class ItensVenda {
    private Produto produto = new Produto();
    private Integer idCaixa, idItens;
    private Integer quantidade;
    private Double valorProduto; 

    public Integer getIdItens() {
        return idItens;
    }

    public void setIdItens(Integer idItens) {
        this.idItens = idItens;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto idProduto) {
        this.produto = idProduto;
    }

    public Integer getIdCaixa() {
        return idCaixa;
    }

    public void setIdCaixa(Integer idCaixa) {
        this.idCaixa = idCaixa;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public Double getValorProduto() {
        return valorProduto;
    }

    public void setValorProduto(Double valorProduto) {
        this.valorProduto = valorProduto;
    }
    
    
    
}
