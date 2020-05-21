/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import Controlador.Conexion_consulta;
import Estructuras.CAJA;
import Estructuras.CARGO;
import Estructuras.FACTURA;
import Estructuras.MENU;
import Estructuras.MESA;
import Estructuras.PEDIDO;
import Estructuras.PEDIDO_DETALLE;
import Estructuras.USUARIO;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Alex
 */
public class Listas extends Conexion_consulta{
    
    private Statement st;
    private ResultSet rs;
    
    public ArrayList<CARGO> ListaCargo(){
        
        ArrayList<CARGO> vista = new ArrayList<CARGO>();
        CARGO c = null;
        st = null;
        rs = null;
        
            try {
                st = conectar().createStatement();
                rs = st.executeQuery("SELECT * FROM EMPRESA.CARGO");
                while (rs.next()) {                

                    c = new CARGO(rs.getString("ID_CARGO"), rs.getString("NOMBRE"),
                            rs.getString("DESCRIPCION"));
                    vista.add(c);
                }
                conectar().close();
                st.close();
                rs.close();
                return vista;
            } catch (Exception e) {
                return null;
            }
    }
    
    public ArrayList<MESA> ListaMesa(){
        
        ArrayList<MESA> vista = new ArrayList<MESA>();
        MESA m = null;
        st = null;
        rs = null;
        
            try {
                st = conectar().createStatement();
                rs = st.executeQuery("SELECT * FROM EMPRESA.MESA");
                while (rs.next()) {                

                    m = new MESA(rs.getString("ID_MESA"),
                            rs.getString("ID_USUARIO"),
                            rs.getInt("CAPACIDAD"),
                            rs.getInt("ESTADO"),
                            rs.getDouble("SALDO"),
                            rs.getString("CLIENTE"));
                    vista.add(m);
                }
                conectar().close();
                st.close();
                rs.close();
                return vista;
            } catch (Exception e) {
                return null;
            }
    }
    
        public ArrayList<MESA> ListaMesasAsignadas(String id_usuario){
        
        ArrayList<MESA> vista = new ArrayList<MESA>();
        MESA m = null;
        st = null;
        rs = null;
        
            try {
                st = conectar().createStatement();
                rs = st.executeQuery("SELECT * FROM EMPRESA.MESA where ID_USUARIO='"+id_usuario+"'");
                while (rs.next()) {                

                    m = new MESA(rs.getString("ID_MESA"),
                            rs.getString("ID_USUARIO"),
                            rs.getInt("CAPACIDAD"),
                            rs.getInt("ESTADO"),
                            rs.getDouble("SALDO"),
                            rs.getString("CLIENTE"));
                    vista.add(m);
                }
                conectar().close();
                st.close();
                rs.close();
                return vista;
            } catch (Exception e) {
                return null;
            }
    }
    
     public ArrayList<USUARIO> ListaUsuariosParaMesa(){
        
        ArrayList<USUARIO> vista = new ArrayList<USUARIO>();
        USUARIO u = null;
        st = null;
        rs = null;
        
            try {
                st = conectar().createStatement();
                rs = st.executeQuery("SELECT * from empresa.usuario where empresa.FN_CONTAR_MESAS_USUARIO(id_usuario)<4 "+
                        "AND id_usuario!='MSO-2' AND id_cargo='MSO' order by USUARIO");
                while (rs.next()) {                

                    u = new USUARIO(rs.getString("ID_USUARIO"),
                            rs.getString("ID_CARGO"),
                            rs.getString("NOMBRES"),
                            rs.getString("APELLIDOS"),
                            rs.getString("USUARIO"),"",
                            rs.getInt("ES_ADMIN"));
                    vista.add(u);
                }
                conectar().close();
                st.close();
                rs.close();
                return vista;
            } catch (Exception e) {
                return null;
            }
    }
     
    public ArrayList<MENU> ListaMenus(){
        
        ArrayList<MENU> vista = new ArrayList<MENU>();
        MENU m = null;
        st = null;
        rs = null;
        
            try {
                st = conectar().createStatement();
                rs = st.executeQuery("SELECT * from empresa.MENU");
                while (rs.next()) {                

                    m = new MENU(rs.getString("ID_MENU"),
                            rs.getString("ID_CATEGORIA"),
                            rs.getString("NOMBRE"),
                            rs.getString("DESCRIPCION"),
                            rs.getDouble("PRECIO"),
                            rs.getInt("STOCK"), rs.getString("URL_IMAGEN"));
                    vista.add(m);
                }
                conectar().close();
                st.close();
                rs.close();
                return vista;
            } catch (Exception e) {
                return null;
            }
    }

    public ArrayList<MENU> ListaMenusCategoria(String categoria){
        
        ArrayList<MENU> vista = new ArrayList<MENU>();
        MENU m = null;
        st = null;
        rs = null;
        
            try {
                st = conectar().createStatement();
                rs = st.executeQuery("SELECT * from empresa.MENU where ID_CATEGORIA='"+categoria+"'");
                while (rs.next()) {                

                    m = new MENU(rs.getString("ID_MENU"),
                            rs.getString("ID_CATEGORIA"),
                            rs.getString("NOMBRE"),
                            rs.getString("DESCRIPCION"),
                            rs.getDouble("PRECIO"),
                            rs.getInt("STOCK"), rs.getString("URL_IMAGEN"));
                    vista.add(m);
                }
                conectar().close();
                st.close();
                rs.close();
                return vista;
            } catch (Exception e) {
                return null;
            }
    }
    
    public ArrayList<PEDIDO> ListaPedidosPorDespachar(){
        
        ArrayList<PEDIDO> vista = new ArrayList<PEDIDO>();
        PEDIDO p = null;
        st = null;
        rs = null;
        
            try {
                st = conectar().createStatement();
                rs = st.executeQuery("select ID_PEDIDO,ID_MESA,ID_USUARIO,ESTADO,TO_CHAR(HORA_PEDIDO,'HH24:MI:SS')HORA FROM  EMPRESA.PEDIDO WHERE ESTADO=0 ORDER BY HORA");
                while (rs.next()) {                
                    
                    p = new PEDIDO(
                            rs.getString("ID_PEDIDO"),
                            rs.getString("ID_MESA"),
                            rs.getString("ID_USUARIO"),
                            rs.getInt("ESTADO"),
                            rs.getString("HORA"));
                    vista.add(p);
                }
                conectar().close();
                st.close();
                rs.close();
                return vista;
            } catch (Exception e) {
                return null;
            }
    }
    
        public ArrayList<PEDIDO_DETALLE> ListaPedidoDetalle(String id){
        
        ArrayList<PEDIDO_DETALLE> vista = new ArrayList<PEDIDO_DETALLE>();
        PEDIDO_DETALLE p = null;
        st = null;
        rs = null;
        
            try {
                st = conectar().createStatement();
                rs = st.executeQuery("select * from EMPRESA.PEDIDO_DETALLE WHERE ID_PEDIDO='"+id+"' ORDER BY ID_DETALLE");
                while (rs.next()) {                
                    
                    p = new PEDIDO_DETALLE(rs.getString("ID_PEDIDO"), rs.getString("ID_DETALLE"),
                            rs.getString("ID_MENU"), rs.getInt("CANTIDAD"));
                    vista.add(p);
                }
                conectar().close();
                st.close();
                rs.close();
                return vista;
            } catch (Exception e) {
                return null;
            }
    }
        
        public ArrayList<PEDIDO> ListaCobrarPedido(){
        
        ArrayList<PEDIDO> vista = new ArrayList<PEDIDO>();
        PEDIDO p = null;
        st = null;
        rs = null;
        
            try {
                st = conectar().createStatement();
                rs = st.executeQuery("SELECT * FROM EMPRESA.PEDIDO WHERE ESTADO=1 ORDER BY ID_PEDIDO");
                while (rs.next()) {                
                    
                    p = new PEDIDO(
                            rs.getString("ID_PEDIDO"),
                            rs.getString("ID_MESA"),
                            rs.getString("ID_USUARIO"),
                            rs.getInt("ESTADO"),
                            rs.getString("HORA_PEDIDO"));
                    vista.add(p);
                }
                conectar().close();
                st.close();
                rs.close();
                return vista;
            } catch (Exception e) {
                return null;
            }
    }
        
    public ArrayList<CAJA> ListaCajas(){
        
        ArrayList<CAJA> vista = new ArrayList<CAJA>();
        CAJA c = null;
        st = null;
        rs = null;
        
            try {
                st = conectar().createStatement();
                rs = st.executeQuery("SELECT * FROM EMPRESA.CAJA");
                while (rs.next()) {                
                    
                    c = new CAJA(rs.getString("ID_CAJA"), rs.getString("ID_USUARIO"),
                            rs.getDouble("SALDO"));
                    vista.add(c);
                }
                conectar().close();
                st.close();
                rs.close();
                return vista;
            } catch (Exception e) {
                return null;
            }
    }
    
    public ArrayList<FACTURA> ListaFacturas(){
        ArrayList<FACTURA> vista = new ArrayList<FACTURA>();
        FACTURA f = null;
        st = null; rs = null;
        
        try {
            st = conectar().createStatement();
            rs = st.executeQuery("SELECT ID_FACTURA, ID_CAJA, ID_CAJERO, ID_MESERO, ID_PEDIDO,ID_FORMA_PAGO, NIT, VALOR, CANCELADA," +
                                 "ANULADA, TO_CHAR(FECHA,'HH24:MI:SS') FROM EMPRESA.facturacion ORDER BY ID_FACTURA;");
            while (rs.next()) {                
                f = new FACTURA(rs.getString("ID_FACTURA"),
                        rs.getString("ID_CAJA"),
                        rs.getString("ID_CAJERO"), 
                        rs.getString("ID_MESERO"),
                        rs.getString("ID_PEDIDO"),
                        rs.getString("ID_FORMA_PAGO"),
                        rs.getString("NIT"),
                        rs.getDouble("VALOR"),
                        rs.getInt("CANCELADA"),
                        rs.getInt("ANULADA"),
                        rs.getString("FECHA"));
            }
        } catch (Exception e) {
        }
        
        return null;
    }
//    public static void main(String[] args) {
//        Listas l = new Listas();
//        System.out.println(l.ListaCobrarPedido());
//    }
    
}
