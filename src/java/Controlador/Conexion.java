
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion {
    
    private Connection con;
    private String Username = "EGOMEZ";
    private String Password = "123";
    private String Puerto   = "1521";
    private String Hostname = "@db-restaurante.cst6mnzu82my.us-east-2.rds.amazonaws.com";
    private String Clasname = "oracle.jdbc.driver.OracleDriver";
    private String URL = "jdbc:oracle:thin:"+Hostname+":"+Puerto+":ORCL";
    Statement st = null;
    
    public Conexion()
    {
        try {
            Class.forName(Clasname);
                con = DriverManager.getConnection(URL,Username,Password);
                st = con.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error: "+e);
        }
    }
    
    public Connection conectar()
    {
        return con;
    }
    
    public static void main(String[] args) 
    {
        System.out.println(new Conexion().conectar());
    }
        
    
}
       
