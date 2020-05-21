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
public class FACTURA {
    
    private String ID_FACTURA;
    private String ID_CAJA;
    private String ID_CAJERO;
    private String ID_MESERO;
    private String ID_PEDIDO;
    private String ID_FORMA_PAGO;
    private String NIT;
    private double VALOR;
    private int CANCELADA;
    private int ANULADA;
    private String FECHA;

    public FACTURA() {
    }

    public FACTURA(String ID_FACTURA, String ID_CAJA, String ID_CAJERO, String ID_MESERO, String ID_PEDIDO, String ID_FORMA_PAGO, String NIT, double VALOR, int CANCELADA, int ANULADA) {
        this.ID_FACTURA = ID_FACTURA;
        this.ID_CAJA = ID_CAJA;
        this.ID_CAJERO = ID_CAJERO;
        this.ID_MESERO = ID_MESERO;
        this.ID_PEDIDO = ID_PEDIDO;
        this.ID_FORMA_PAGO = ID_FORMA_PAGO;
        this.NIT = NIT;
        this.VALOR = VALOR;
        this.CANCELADA = CANCELADA;
        this.ANULADA = ANULADA;
    }

    public FACTURA(String ID_FACTURA, String ID_CAJA, String ID_CAJERO, String ID_MESERO, String ID_PEDIDO, String ID_FORMA_PAGO, String NIT, double VALOR, int CANCELADA, int ANULADA, String FECHA) {
        this.ID_FACTURA = ID_FACTURA;
        this.ID_CAJA = ID_CAJA;
        this.ID_CAJERO = ID_CAJERO;
        this.ID_MESERO = ID_MESERO;
        this.ID_PEDIDO = ID_PEDIDO;
        this.ID_FORMA_PAGO = ID_FORMA_PAGO;
        this.NIT = NIT;
        this.VALOR = VALOR;
        this.CANCELADA = CANCELADA;
        this.ANULADA = ANULADA;
        this.FECHA = FECHA;
    }

    public String getFECHA() {
        return FECHA;
    }

    public void setFECHA(String FECHA) {
        this.FECHA = FECHA;
    }

    public String getID_FACTURA() {
        return ID_FACTURA;
    }

    public void setID_FACTURA(String ID_FACTURA) {
        this.ID_FACTURA = ID_FACTURA;
    }

    public String getID_CAJA() {
        return ID_CAJA;
    }

    public void setID_CAJA(String ID_CAJA) {
        this.ID_CAJA = ID_CAJA;
    }

    public String getID_CAJERO() {
        return ID_CAJERO;
    }

    public void setID_CAJERO(String ID_CAJERO) {
        this.ID_CAJERO = ID_CAJERO;
    }

    public String getID_MESERO() {
        return ID_MESERO;
    }

    public void setID_MESERO(String ID_MESERO) {
        this.ID_MESERO = ID_MESERO;
    }

    public String getID_PEDIDO() {
        return ID_PEDIDO;
    }

    public void setID_PEDIDO(String ID_PEDIDO) {
        this.ID_PEDIDO = ID_PEDIDO;
    }

    public String getID_FORMA_PAGO() {
        return ID_FORMA_PAGO;
    }

    public void setID_FORMA_PAGO(String ID_FORMA_PAGO) {
        this.ID_FORMA_PAGO = ID_FORMA_PAGO;
    }

    public String getNIT() {
        return NIT;
    }

    public void setNIT(String NIT) {
        this.NIT = NIT;
    }

    public double getVALOR() {
        return VALOR;
    }

    public void setVALOR(double VALOR) {
        this.VALOR = VALOR;
    }

    public int getCANCELADA() {
        return CANCELADA;
    }

    public void setCANCELADA(int CANCELADA) {
        this.CANCELADA = CANCELADA;
    }

    public int getANULADA() {
        return ANULADA;
    }

    public void setANULADA(int ANULADA) {
        this.ANULADA = ANULADA;
    }
    
    
    
}
