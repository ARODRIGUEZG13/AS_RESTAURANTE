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
public class MESA {
    
    private String ID_MESA;
    private String ID_USUARIO;
    private int CAPACIDAD;
    private int ESTADO;
    private double SALDO;

    public MESA() {
    }

    public MESA(String ID_MESA, String ID_USUARIO, int CAPACIDAD, int ESTADO, double SALDO) {
        this.ID_MESA = ID_MESA;
        this.ID_USUARIO = ID_USUARIO;
        this.CAPACIDAD = CAPACIDAD;
        this.ESTADO = ESTADO;
        this.SALDO = SALDO;
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

    public int getCAPACIDAD() {
        return CAPACIDAD;
    }

    public void setCAPACIDAD(int CAPACIDAD) {
        this.CAPACIDAD = CAPACIDAD;
    }

    public int getESTADO() {
        return ESTADO;
    }

    public void setESTADO(int ESTADO) {
        this.ESTADO = ESTADO;
    }

    public double getSALDO() {
        return SALDO;
    }

    public void setSALDO(double SALDO) {
        this.SALDO = SALDO;
    }
    
    
    
}
