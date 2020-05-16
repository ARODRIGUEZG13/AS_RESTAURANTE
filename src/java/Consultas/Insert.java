/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import Controlador.Conexion_Transaccion;
import Estructuras.PEDIDO;
import Estructuras.PEDIDO_DETALLE;
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
    
    public boolean PEDIDO (PEDIDO p) throws SQLException{
        sql = "INSERT INTO EMPRESA.PEDIDO VALUES ('"+p.getID_PEDIDO()+"','"+p.getID_MESA()+
                "','"+p.getID_USUARIO()+"',"+p.getESTADO()+",to_char(current_timestamp,'dd/mm/yyyy hh:mi:ss'))";
        st = null;
        try {
            st = conectar().prepareCall(sql);
            if(st.executeUpdate(sql)==1){
                conectar().commit();
                return true;
            }
        } catch (Exception e) {
            return false;
        }finally{
            st.close();
            conectar().close();
        }
         return false;
    }
    
    public boolean PEDIDO_DETALLE (PEDIDO_DETALLE p) throws SQLException{
        sql = "INSERT INTO EMPRESA.PEDIDO_DETALLE VALUES ('"+p.getID_PEDIDO()+"','"+p.getID_DETALLE()+
                "','"+p.getID_MENU()+"',"+p.getCANTIDAD()+")";
        st = null;
        try {
            st = conectar().prepareCall(sql);
            if(st.executeUpdate(sql)==1){
                conectar().commit();
                return true;
            }
        } catch (Exception e) {
            return false;
        }finally{
            st.close();
            conectar().close();
        }
         return false;
    }
    
//    public static void main(String[] args) throws SQLException {
//        System.out.println(new Insert().PEDIDO(new PEDIDO("PDO-1", "M-01", "MSO-3", 0)));
//    }
    
}
