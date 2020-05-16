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
public class CATEGORIA_MENU {
    
    private String ID_CATEGORIA;
    private String NOMBRE;
    private String DESCRIPCION;

    public CATEGORIA_MENU() {
    }

    public CATEGORIA_MENU(String ID_CATEGORIA, String NOMBRE, String DESCRIPCION) {
        this.ID_CATEGORIA = ID_CATEGORIA;
        this.NOMBRE = NOMBRE;
        this.DESCRIPCION = DESCRIPCION;
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
    
    
    
}
