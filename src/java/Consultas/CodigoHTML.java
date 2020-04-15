/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import Controlador.Conexion_consulta;
import Estructuras.MESA;

/**
 *
 * @author Alex
 */
public class CodigoHTML  extends Conexion_consulta{
    
    public String getMesas(){
    
        Listas l = new Listas();
        String htmlcode = "";
        String tipoBoton = "";
        String estado = "";
        String disabled = "";
        int i = 0;
        
        for(MESA mesa : l.ListaMesa()){
            if(mesa.getESTADO()==0){
                estado = "Disponible";
                tipoBoton = "info";
            }else if(mesa.getESTADO()==1){
                estado = "Por Desocupar";
                tipoBoton = "dark";
            }else if(mesa.getESTADO()==2){
                estado = "No disponible";
                tipoBoton = "danger";
            }
            
            htmlcode += "<button id=\"btnMesa\" class=\"btn btn-"+tipoBoton+"\">\n" +
"                           <h1>"+mesa.getID_MESA()+"</h1><br>\n" +
"                           <h5>"+estado+"</h5>\n" +
"                        </button>\n&nbsp;";
            i++;
            if (i==6){
                htmlcode+= "\n<br><br>\n";
            }
        }
    return htmlcode;
    }
    
//    public static void main(String[] args) {
//        System.out.println(new CodigoHTML().getMesas());
//        
//    }
}
