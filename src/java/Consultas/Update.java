/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import Controlador.Conexion_Transaccion;
import Estructuras.MESA;
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
}
