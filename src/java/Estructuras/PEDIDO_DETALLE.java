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
public class PEDIDO_DETALLE {
    
    private String ID_PEDIDO;
    private String ID_DETALLE;
    private String ID_MENU;
    private int CANTIDAD;

    public PEDIDO_DETALLE() {
    }

    public PEDIDO_DETALLE(String ID_MENU, int CANTIDAD) {
        this.ID_MENU = ID_MENU;
        this.CANTIDAD = CANTIDAD;
    }

    public PEDIDO_DETALLE(String ID_PEDIDO, String ID_DETALLE, String ID_MENU, int CANTIDAD) {
        this.ID_PEDIDO = ID_PEDIDO;
        this.ID_DETALLE = ID_DETALLE;
        this.ID_MENU = ID_MENU;
        this.CANTIDAD = CANTIDAD;
    }

    public String getID_PEDIDO() {
        return ID_PEDIDO;
    }

    public void setID_PEDIDO(String ID_PEDIDO) {
        this.ID_PEDIDO = ID_PEDIDO;
    }

    public String getID_DETALLE() {
        return ID_DETALLE;
    }

    public void setID_DETALLE(String ID_DETALLE) {
        this.ID_DETALLE = ID_DETALLE;
    }

    public String getID_MENU() {
        return ID_MENU;
    }

    public void setID_MENU(String ID_MENU) {
        this.ID_MENU = ID_MENU;
    }

    public int getCANTIDAD() {
        return CANTIDAD;
    }

    public void setCANTIDAD(int CANTIDAD) {
        this.CANTIDAD = CANTIDAD;
    }
    
    
    
}
