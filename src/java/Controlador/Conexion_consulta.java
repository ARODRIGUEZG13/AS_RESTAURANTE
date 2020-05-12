
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion_consulta {

    private Connection con;
    private String Username = "US_CONSULTA";
    private String Password = "sIRR7gVER8qa8tE";
    private String Puerto   = "1539";
    private String Hostname = "@192.168.56.5";
    private String Clasname = "oracle.jdbc.driver.OracleDriver";
    private String URL = "jdbc:oracle:thin:"+Hostname+":"+Puerto+":XE";
    Statement st = null;
    
    public Conexion_consulta()
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
    
//    public static void main(String[] args) 
//    {
//        System.out.println(new Conexion().conectar());
//    }
        
    
}
       
