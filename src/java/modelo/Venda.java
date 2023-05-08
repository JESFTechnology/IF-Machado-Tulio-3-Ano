/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Calendar;

/**
 *
 * @author johan
 */
public class Venda {
    private Integer codigo;
    private String status;
    private Calendar dataVenda;
    private Cliente objCliente = new Cliente();
    private Transporte objTransporte = new Transporte();

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Calendar getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(Calendar dataVenda) {
        this.dataVenda = dataVenda;
    }

    public Cliente getObjCliente() {
        return objCliente;
    }

    public void setObjCliente(Cliente objCliente) {
        this.objCliente = objCliente;
    }

    public Transporte getObjTransporte() {
        return objTransporte;
    }

    public void setObjTransporte(Transporte objTransporte) {
        this.objTransporte = objTransporte;
    }
    
    
}
