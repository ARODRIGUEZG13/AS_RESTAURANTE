/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import Controlador.Conexion_Transaccion;
import Estructuras.CAJA;
import Estructuras.MESA;
import Estructuras.PEDIDO;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Alex
 */
public class Update extends Conexion_Transaccion{
    
    private PreparedStatement pst;
    private String sql;
    private Statement st;
    
    public boolean Mesa (MESA m){
        st = null;
        sql = "UPDATE EMPRESA.MESA SET ID_USUARIO='"+m.getID_USUARIO()+"'"+
                ",CAPACIDAD="+m.getCAPACIDAD()+",ESTADO="+m.getESTADO()+
                ",SALDO="+m.getSALDO()+",CLIENTE='"+m.getCLIENTE()+"'"+
                "WHERE ID_MESA='"+m.getID_MESA()+"'";
        try {
            st = conectar().createStatement();
            st.executeUpdate(sql);
            st.close();
            conectar().commit();
            conectar().close();
            return true;
        } catch (SQLException e) {
               return false;
        }
    }
    
    public boolean MesaSaldo(String id, double saldo){
        st = null;
        sql = "UPDATE EMPRESA.MESA SET SALDO="+saldo+" WHERE ID_MESA='"+id+"'";
        try {
            st = conectar().createStatement();
            st.executeUpdate(sql);
            st.close();
            conectar().commit();
            conectar().close();
            return true;
        } catch (SQLException e) {
               return false;
        }
    }
    
    public boolean MesaEstado(String id, int estado){
        st = null;
        sql = "UPDATE EMPRESA.MESA SET ESTADO="+estado+" WHERE ID_MESA='"+id+"'";
        try {
            st = conectar().createStatement();
            st.executeUpdate(sql);
            st.close();
            conectar().commit();
            conectar().close();
            return true;
        } catch (SQLException e) {
               return false;
        }
    }
    
    public boolean MesaDesocupar(String id){
        st = null;
        sql = "UPDATE EMPRESA.MESA SET ID_USUARIO='MSO-2', ESTADO=0, CLIENTE=NULL WHERE ID_MESA='"+id+"'";
        try {
            st = conectar().createStatement();
            st.executeUpdate(sql);
            st.close();
            conectar().commit();
            conectar().close();
            return true;
        } catch (SQLException e) {
               return false;
        }
    }
    
    public boolean DesocuparMesa(String id){
        st = null;
        sql = "UPDATE EMPRESA.MESA SET ID_USUARIO='MSO-2', CLIENTE=NULL, ESTADO=0 WHERE ID_MESA='"+id+"'";
        
        try {
            st = conectar().createStatement();
            st.executeUpdate(sql);
            st.close();
            conectar().commit();
            conectar().close();
            return true;
        } catch (SQLException e) {
               return false;
        }
    }
    
    public boolean EstadoPedido (String id){
        st = null;
        sql = "UPDATE EMPRESA.pedido SET ESTADO=1 WHERE ID_PEDIDO='"+id+"'";
        try {
            st = conectar().createStatement();
            st.executeUpdate(sql);
            st.close();
            conectar().commit();
            conectar().close();
            return true;
        } catch (SQLException e) {
               return false;
        }
    }
    
    public boolean EstadoPedido2 (String id){
        st = null;
        sql = "UPDATE EMPRESA.pedido SET ESTADO=2 WHERE ID_PEDIDO='"+id+"'";
        try {
            st = conectar().createStatement();
            st.executeUpdate(sql);
            st.close();
            conectar().commit();
            conectar().close();
            return true;
        } catch (SQLException e) {
               return false;
        }
    }
    
    public boolean UsuarioCaja (CAJA c){
        st = null;
        sql = "UPDATE EMPRESA.CAJA SET ID_USUARIO='"+c.getID_USUARIO()+"', SALDO="+c.getSALDO()+" WHERE ID_CAJA='"+c.getID_CAJA()+"'";
        try {
            st = conectar().createStatement();
            st.executeUpdate(sql);
            st.close();
            conectar().commit();
            conectar().close();
            return true;
        } catch (SQLException e) {
               return true;
        }
    }
    
//    public static void main(String[] args) {
//        System.out.println(new Update().MesaDesocupar("M-12"));
//    }
}
