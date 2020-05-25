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
public class AUX_MENU {
    
    private String ID_MENU;
    private String NOMBRE_MENU;
    private int CANT_VENTA;

    public AUX_MENU(String ID_MENU, String NOMBRE_MENU, int CANT_VENTA) {
        this.ID_MENU = ID_MENU;
        this.NOMBRE_MENU = NOMBRE_MENU;
        this.CANT_VENTA = CANT_VENTA;
    }

    public String getID_MENU() {
        return ID_MENU;
    }

    public void setID_MENU(String ID_MENU) {
        this.ID_MENU = ID_MENU;
    }

    public String getNOMBRE_MENU() {
        return NOMBRE_MENU;
    }

    public void setNOMBRE_MENU(String NOMBRE_MENU) {
        this.NOMBRE_MENU = NOMBRE_MENU;
    }

    public int getCANT_VENTA() {
        return CANT_VENTA;
    }

    public void setCANT_VENTA(int CANT_VENTA) {
        this.CANT_VENTA = CANT_VENTA;
    }
    
    
    
}
