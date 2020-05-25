/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import Controlador.Conexion_consulta;
import Estructuras.CAJA;
import Estructuras.CATEGORIA_MENU;
import Estructuras.CLIENTE;
import Estructuras.FACTURA;
import Estructuras.MENU;
import Estructuras.MESA;
import Estructuras.PEDIDO;
import Estructuras.USUARIO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Alex
 */
public class Buscar extends Conexion_consulta{
    
    private Statement st;
    private ResultSet rs;
    private String sql;
    
    public USUARIO usuario (String usuario, String pass){
        
        st= null;
        rs = null;
        sql = "SELECT * FROM EMPRESA.USUARIO WHERE USUARIO='"+usuario+"' AND CONTRASEÑA='"+pass+"'";
        USUARIO u = null;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                u = new USUARIO(rs.getString("ID_USUARIO"),
                        rs.getString("ID_CARGO"), 
                        rs.getString("NOMBRES"), 
                        rs.getString("APELLIDOS"),
                        rs.getString("USUARIO"),
                        rs.getString("CONTRASEÑA"), 
                        rs.getInt("ES_ADMIN"));
            }
            conectar().close();
            rs.close();
            st.close();
            return u;
        } catch (Exception e) {
            return null;
        }
    }
    
    public USUARIO usuario (String id){
        
        st= null;
        rs = null;
        sql = "SELECT * FROM EMPRESA.USUARIO WHERE ID_USUARIO='"+id+"'";
        USUARIO u = null;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                u = new USUARIO(rs.getString("ID_USUARIO"),
                        rs.getString("ID_CARGO"), 
                        rs.getString("NOMBRES"), 
                        rs.getString("APELLIDOS"),
                        rs.getString("USUARIO"),
                        rs.getString("CONTRASEÑA"), 
                        rs.getInt("ES_ADMIN"));
            }
            conectar().close();
            rs.close();
            st.close();
            return u;
        } catch (Exception e) {
            return null;
        }
    }
    
    public MESA mesa (String id){
        st = null; rs = null;
        sql = "SELECT * FROM EMPRESA.MESA WHERE ID_MESA='"+id+"'";
        MESA m = null;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                m = new MESA(rs.getString("ID_MESA"),
                            rs.getString("ID_USUARIO"),
                            rs.getInt("CAPACIDAD"),
                            rs.getInt("ESTADO"),
                            rs.getDouble("SALDO"),
                            rs.getString("CLIENTE"));
            }
            conectar().close();
            rs.close();
            st.close();
            return m;
        } catch (Exception e) {
          return null;
        }
    }
    public MENU menu (String id){
        st = null; rs = null;
        sql = "SELECT * FROM EMPRESA.MENU WHERE ID_MENU='"+id+"'";
        MENU m = null;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                m = new MENU(rs.getString("ID_MENU"),
                            rs.getString("ID_CATEGORIA"),
                            rs.getString("NOMBRE_MENU"),
                            rs.getString("DESCRIPCION"),
                            rs.getDouble("PRECIO"),
                            rs.getInt("STOCK"), rs.getString("URL_IMAGEN"));
            }
            conectar().close();
            rs.close();
            st.close();
            return m;
        } catch (Exception e) {
          return null;
        }
    }
    
        public CATEGORIA_MENU categoria (String id){
        st = null; rs = null;
        sql = "SELECT * FROM EMPRESA.CATEGORIA_MENU WHERE ID_CATEGORIA='"+id+"'";
        CATEGORIA_MENU m = null;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                m = new CATEGORIA_MENU(rs.getString("ID_CATEGORIA"),
                        rs.getString("NOMBRE"), rs.getString("DESCRIPCION")
                );
            }
            conectar().close();
            rs.close();
            st.close();
            return m;
        } catch (Exception e) {
          return null;
        }
    }
    
    public int siguiente_pedido (){
        st = null; rs = null;
        sql = "SELECT EMPRESA.SQ_PEDIDO.NEXTVAL FROM DUAL";
        int resp=0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                resp = rs.getInt(1);
            }
            conectar().close();
            rs.close();
            st.close();
            return resp;
        } catch (SQLException e) {
            return resp;
        }
    }
    
    public int siguiente_factura (){
        st = null; rs = null;
        sql = "SELECT EMPRESA.SQ_FACTURACION.NEXTVAL FROM DUAL";
        int resp=0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                resp = rs.getInt(1);
            }
            conectar().close();
            rs.close();
            st.close();
            return resp;
        } catch (SQLException e) {
            return resp;
        }
    }
    
    public int siguiente_caja_registro (){
        st = null; rs = null;
        sql = "SELECT EMPRESA.SQ_CAJA_REGISTRO.NEXTVAL FROM DUAL";
        int resp=0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                resp = rs.getInt(1);
            }
            conectar().close();
            rs.close();
            st.close();
            return resp;
        } catch (SQLException e) {
            return resp;
        }
    }
    
    public int cantidad_pedido_por_cobrar (){
        st = null; rs = null;
        sql = "SELECT COUNT(CASE ESTADO WHEN 1 THEN 1 else null end)RESULTADO from EMPRESA.PEDIDO";
        int resp=0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                resp = rs.getInt(1);
            }
            conectar().close();
            rs.close();
            st.close();
            return resp;
        } catch (SQLException e) {
            return resp;
        }
    }
    
    public double total_pedido(String id){
        
        st = null; rs = null;
        sql = "SELECT * FROM EMPRESA.PEDIDO_DETALLE WHERE ID_PEDIDO='"+id+"'";
        double resp = 0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {                
                resp = resp + (rs.getInt("CANTIDAD")* new Buscar().menu(rs.getString("ID_MENU")).getPRECIO());
            }
            conectar().close();
            rs.close();
            st.close();
            return resp;
        } catch (Exception e) {
            return resp;
        }
    
    }
    
    public CAJA caja (String id){
        st = null; rs = null;
        sql = "SELECT * FROM EMPRESA.CAJA WHERE ID_CAJA='"+id+"'";
        CAJA c = null;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                c = new CAJA(rs.getString("ID_CAJA"), rs.getString("ID_USUARIO"),
                            rs.getDouble("SALDO"));
            }
            conectar().close();
            rs.close();
            st.close();
            return c;
        } catch (Exception e) {
          return null;
        }
    }
    
    public CAJA cajaPorUsuario (String id){
        st = null; rs = null;
        sql = "SELECT * FROM EMPRESA.CAJA WHERE ID_USUARIO='"+id+"'";
        CAJA c = null;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                c = new CAJA(rs.getString("ID_CAJA"), rs.getString("ID_USUARIO"),
                            rs.getDouble("SALDO"));
            }
            conectar().close();
            rs.close();
            st.close();
            return c;
        } catch (Exception e) {
          return null;
        }
    }
    
    public PEDIDO pedido (String id){
        st = null; rs  = null;
        sql = "SELECT * FROM EMPRESA.PEDIDO WHERE ID_PEDIDO='"+id+"'";
        PEDIDO p = null;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {                
                p = new PEDIDO(
                            rs.getString("ID_PEDIDO"),
                            rs.getString("ID_MESA"),
                            rs.getString("ID_USUARIO"),
                            rs.getInt("ESTADO"),
                            rs.getString("HORA_PEDIDO"));
            }
            conectar().close();
            rs.close();
            st.close();
            return p;
        } catch (SQLException e) {
            return null;
        } 
    }
    
    public CLIENTE cliente (String nit){
        st = null; rs = null;
        sql = "SELECT * FROM EMPRESA.CLIENTE WHERE NIT='"+nit+"'";
        CLIENTE c = null;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {                
                c = new CLIENTE(rs.getString("NIT"), rs.getString("NOMBRE"),
                        rs.getString("DIRECCION"));
            }
            conectar().close();
            rs.close();
            st.close();
            return c;
        } catch (SQLException e) {
            return null;
        }
    }
    
    public FACTURA factura (String id){
        st = null; rs = null;
        sql = "SELECT * FROM EMPRESA.FACTURACION WHERE ID_FACTURA='"+id+"'";
        FACTURA f = null;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
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
            conectar().close();
            rs.close();
            st.close();
            return f;
        } catch (SQLException e) {
            return null;
        }
    }

    public FACTURA FacturaPorIdPedido (String id){
        st = null; rs = null;
        sql = "SELECT * FROM EMPRESA.FACTURACION WHERE ID_PEDIDO='"+id+"'";
        FACTURA f = null;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
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
            conectar().close();
            rs.close();
            st.close();
            return f;
        } catch (SQLException e) {
            return null;
        }
    }
    
//    public static void main(String[] args) {
//        System.out.println(new Buscar().cantidad_pedido_por_cobrar());
//    }
    
    
}
