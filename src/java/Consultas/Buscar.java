/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import Controlador.Conexion_consulta;
import Estructuras.MENU;
import Estructuras.MESA;
import Estructuras.USUARIO;
import java.sql.ResultSet;
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
                            rs.getString("NOMBRE"),
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
    
//    public static void main(String[] args) {
//        System.out.println(new Buscar().menu("B-1").getNOMBRE());
//    }
    
}
