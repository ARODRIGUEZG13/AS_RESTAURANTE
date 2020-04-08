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
public class CARGO {
    
    private String ID_CARGO;
    private String NOMBRE;
    private String DESCRIPCION;
    
    public CARGO (){
    
    }
    
    public CARGO (String ID_CARGO, String NOMBRE, String DESCRIPCION){
        this.ID_CARGO = ID_CARGO;
        this.NOMBRE = NOMBRE;
        this.DESCRIPCION = DESCRIPCION;
    }

    public String getID_CARGO() {
        return ID_CARGO;
    }

    public void setID_CARGO(String ID_CARGO) {
        this.ID_CARGO = ID_CARGO;
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
