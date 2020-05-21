/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Estructuras;

/**
 *
 * @author Alex
 */
public class PEDIDO {
    
    private String ID_PEDIDO;
    private String ID_MESA;
    private String ID_USUARIO;
    private int ESTADO;
    private String HORA_PEDIDO;

    public PEDIDO() {
    }

    public PEDIDO(String ID_PEDIDO, String ID_MESA, String ID_USUARIO, int ESTADO) {
        this.ID_PEDIDO = ID_PEDIDO;
        this.ID_MESA = ID_MESA;
        this.ID_USUARIO = ID_USUARIO;
        this.ESTADO = ESTADO;
    }

    public PEDIDO(String ID_PEDIDO, String ID_MESA, String ID_USUARIO, int ESTADO, String HORA_PEDIDO) {
        this.ID_PEDIDO = ID_PEDIDO;
        this.ID_MESA = ID_MESA;
        this.ID_USUARIO = ID_USUARIO;
        this.ESTADO = ESTADO;
        this.HORA_PEDIDO = HORA_PEDIDO;
    }

    public String getID_PEDIDO() {
        return ID_PEDIDO;
    }

    public void setID_PEDIDO(String ID_PEDIDO) {
        this.ID_PEDIDO = ID_PEDIDO;
    }

    public String getID_MESA() {
        return ID_MESA;
    }

    public void setID_MESA(String ID_MESA) {
        this.ID_MESA = ID_MESA;
    }

    public String getID_USUARIO() {
        return ID_USUARIO;
    }

    public void setID_USUARIO(String ID_USUARIO) {
        this.ID_USUARIO = ID_USUARIO;
    }

    public int getESTADO() {
        return ESTADO;
    }

    public void setESTADO(int ESTADO) {
        this.ESTADO = ESTADO;
    }

    public String getHORA_PEDIDO() {
        return HORA_PEDIDO;
    }

    public void setHORA_PEDIDO(String HORA_PEDIDO) {
        this.HORA_PEDIDO = HORA_PEDIDO;
    }
    
    
}
