/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import Controlador.Conexion_consulta;
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
    
//    public static void main(String[] args) {
//        System.out.println(new Buscar().usuario("admin", "admin").getNOMBRES());
//    }
    
}
