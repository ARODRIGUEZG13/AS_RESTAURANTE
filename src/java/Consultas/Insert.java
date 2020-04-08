/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import Controlador.Conexion_Transaccion;
import Estructuras.USUARIO;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Alex
 */
public class Insert extends Conexion_Transaccion{
    
    private PreparedStatement pst;
    private Statement st;
    private String sql;
    
    public boolean USUARIO(USUARIO us) throws SQLException {
        sql = "INSERT INTO EMPRESA.USUARIO VALUES (CONCAT('"+us.getID_CARGO()+"-',EMPRESA.SQ_USUARIO.NEXTVAL),"
                + "'"+us.getID_CARGO()+"',"+"'"+us.getNOMBRES()+"',"+"'"+us.getAPELLIDOS()+"',"+"'"+us.getUSUARIO()+"',"
                + "'"+us.getCONTRASEÑA()+"',"+us.getES_ADMIN()+")";
        
        st = null;
        try {
           st = conectar().prepareCall(sql);
            if(st.executeUpdate(sql)==1){
                conectar().commit();
                return true;
            }
        } catch (SQLException e) {
            return false;
        }finally{
            st.close();
            conectar().close();
        }
         return false;
    }
    
//    public static void main(String[] args) throws SQLException {
//        System.out.println(new Insert().USUARIO(new USUARIO("", "RPN", "Katherine Elizabeth",
//                "Garcia Lopez", "Kgarcia", "123", 0)));
//    }
    
}
