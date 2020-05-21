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
public class CAJA_REGISTRO {
    
    private String ID_REGISTRO;
    private String ID_CAJA;
    private String ID_USUARIO;
    private double SALDO_INICIAL;
    private double SALDO_FINAL;
    private String DESCRIPCION;
    private String FECHA_REGISTRO;

    public CAJA_REGISTRO() {
    }

    public CAJA_REGISTRO(String ID_REGISTRO, String ID_CAJA, String ID_USUARIO, double SALDO_INICIAL, double SALDO_FINAL, String DESCRIPCION, String FECHA_REGISTRO) {
        this.ID_REGISTRO = ID_REGISTRO;
        this.ID_CAJA = ID_CAJA;
        this.ID_USUARIO = ID_USUARIO;
        this.SALDO_INICIAL = SALDO_INICIAL;
        this.SALDO_FINAL = SALDO_FINAL;
        this.DESCRIPCION = DESCRIPCION;
        this.FECHA_REGISTRO = FECHA_REGISTRO;
    }

    public CAJA_REGISTRO(String ID_REGISTRO, String ID_CAJA, String ID_USUARIO, double SALDO_INICIAL, double SALDO_FINAL) {
        this.ID_REGISTRO = ID_REGISTRO;
        this.ID_CAJA = ID_CAJA;
        this.ID_USUARIO = ID_USUARIO;
        this.SALDO_INICIAL = SALDO_INICIAL;
        this.SALDO_FINAL = SALDO_FINAL;
    }
    
    

    public String getID_REGISTRO() {
        return ID_REGISTRO;
    }

    public void setID_REGISTRO(String ID_REGISTRO) {
        this.ID_REGISTRO = ID_REGISTRO;
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

    public double getSALDO_INICIAL() {
        return SALDO_INICIAL;
    }

    public void setSALDO_INICIAL(double SALDO_INICIAL) {
        this.SALDO_INICIAL = SALDO_INICIAL;
    }

    public double getSALDO_FINAL() {
        return SALDO_FINAL;
    }

    public void setSALDO_FINAL(double SALDO_FINAL) {
        this.SALDO_FINAL = SALDO_FINAL;
    }

    public String getDESCRIPCION() {
        return DESCRIPCION;
    }

    public void setDESCRIPCION(String DESCRIPCION) {
        this.DESCRIPCION = DESCRIPCION;
    }

    public String getFECHA_REGISTRO() {
        return FECHA_REGISTRO;
    }

    public void setFECHA_REGISTRO(String FECHA_REGISTRO) {
        this.FECHA_REGISTRO = FECHA_REGISTRO;
    }
    
    
    
}
