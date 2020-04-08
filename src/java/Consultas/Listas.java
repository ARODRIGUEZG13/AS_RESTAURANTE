/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import Controlador.Conexion_consulta;
import Estructuras.CARGO;
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
    
//    public static void main(String[] args) {
//        Listas l = new Listas();
//        System.out.println(l.ListaCargo());
//    }
    
}
