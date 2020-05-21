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
public class MENU {
    
    private String ID_MENU;
    private String ID_CATEGORIA;
    private String NOMBRE;
    private String DESCRIPCION;
    private double PRECIO;
    private int STOCK;
    private String URL;

    public MENU() {
    }

    public MENU(String ID_MENU, String ID_CATEGORIA, String NOMBRE, String DESCRIPCION, double PRECIO, int STOCK, String URL) {
        this.ID_MENU = ID_MENU;
        this.ID_CATEGORIA = ID_CATEGORIA;
        this.NOMBRE = NOMBRE;
        this.DESCRIPCION = DESCRIPCION;
        this.PRECIO = PRECIO;
        this.STOCK = STOCK;
        this.URL = URL;
    }

    public String getID_MENU() {
        return ID_MENU;
    }

    public void setID_MENU(String ID_MENU) {
        this.ID_MENU = ID_MENU;
    }

    public String getID_CATEGORIA() {
        return ID_CATEGORIA;
    }

    public void setID_CATEGORIA(String ID_CATEGORIA) {
        this.ID_CATEGORIA = ID_CATEGORIA;
    }

    public String getNOMBRE() {
        return NOMBRE;
    }

    public void setNOMBRE(String NOMBRE) {
        this.NOMBRE = NOMBRE;
    }

    public String getDESCRIPCION() {
        return DESCRIPCION;
    }

    public void setDESCRIPCION(String DESCRIPCION) {
        this.DESCRIPCION = DESCRIPCION;
    }

    public double getPRECIO() {
        return PRECIO;
    }

    public void setPRECIO(double PRECIO) {
        this.PRECIO = PRECIO;
    }

    public int getSTOCK() {
        return STOCK;
    }

    public void setSTOCK(int STOCK) {
        this.STOCK = STOCK;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }
    
    
    
}
