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
public class USUARIO {
    
    private String ID_USUARIO;
    private String ID_CARGO;
    private String NOMBRES;
    private String APELLIDOS;
    private String USUARIO;
    private String CONTRASEÑA;
    private int ES_ADMIN;

    public USUARIO() {
    }

    public USUARIO(String ID_USUARIO, String ID_CARGO, String NOMBRES, String APELLIDOS, String USUARIO, String CONTRASEÑA, int ES_ADMIN) {
        this.ID_USUARIO = ID_USUARIO;
        this.ID_CARGO = ID_CARGO;
        this.NOMBRES = NOMBRES;
        this.APELLIDOS = APELLIDOS;
        this.USUARIO = USUARIO;
        this.CONTRASEÑA = CONTRASEÑA;
        this.ES_ADMIN = ES_ADMIN;
    }

    public String getID_USUARIO() {
        return ID_USUARIO;
    }

    public void setID_USUARIO(String ID_USUARIO) {
        this.ID_USUARIO = ID_USUARIO;
    }

    public String getID_CARGO() {
        return ID_CARGO;
    }

    public void setID_CARGO(String ID_CARGO) {
        this.ID_CARGO = ID_CARGO;
    }

    public String getNOMBRES() {
        return NOMBRES;
    }

    public void setNOMBRES(String NOMBRES) {
        this.NOMBRES = NOMBRES;
    }

    public String getAPELLIDOS() {
        return APELLIDOS;
    }

    public void setAPELLIDOS(String APELLIDOS) {
        this.APELLIDOS = APELLIDOS;
    }

    public String getUSUARIO() {
        return USUARIO;
    }

    public void setUSUARIO(String USUARIO) {
        this.USUARIO = USUARIO;
    }

    public String getCONTRASEÑA() {
        return CONTRASEÑA;
    }

    public void setCONTRASEÑA(String CONTRASEÑA) {
        this.CONTRASEÑA = CONTRASEÑA;
    }

    public int getES_ADMIN() {
        return ES_ADMIN;
    }

    public void setES_ADMIN(int ES_ADMIN) {
        this.ES_ADMIN = ES_ADMIN;
    }
    
    
    
}
