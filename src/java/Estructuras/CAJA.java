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
public class CAJA {
    
    private String ID_CAJA;
    private String ID_USUARIO;
    private double SALDO;

    public CAJA() {
    }

    public CAJA(String ID_CAJA, String ID_USUARIO, double SALDO) {
        this.ID_CAJA = ID_CAJA;
        this.ID_USUARIO = ID_USUARIO;
        this.SALDO = SALDO;
    }

    public String getID_CAJA() {
        return ID_CAJA;
    }

    public void setID_CAJA(String ID_CAJA) {
        this.ID_CAJA = ID_CAJA;
    }

    public String getID_USUARIO() {
        return ID_USUARIO;
    }

    public void setID_USUARIO(String ID_USUARIO) {
        this.ID_USUARIO = ID_USUARIO;
    }

    public double getSALDO() {
        return SALDO;
    }

    public void setSALDO(double SALDO) {
        this.SALDO = SALDO;
    }
    
    
    
}
