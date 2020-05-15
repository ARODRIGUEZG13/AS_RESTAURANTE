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
            
            htmlcode += "<button onclick=\"location.href=\'Rpn_Mesa_detalle.jsp?id="+mesa.getID_MESA()+"\'\" id=\"btnMesa\" class=\"btn btn-"+tipoBoton+"\">\n" +                          
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
    
    public String getMesasAsignadas(String id_usuario){
        String htmlcode="";
        Listas l = new Listas();
        int i = 0;
        
        for(MESA mesa : l.ListaMesasAsignadas(id_usuario)){
            i++;
            htmlcode += "<tr>\n" +
"                          <th scope=\"row\">"+i+"</th>\n" +
"                          <td>"+mesa.getID_MESA()+"</td>\n" +
"                          <td>"+mesa.getCLIENTE()+"</td>\n" +
"                          <td>\n" +
"                            <center>\n" +
"                                <button onclick=\"location.href=\'MSO_nuevo_pedido.jsp?id="+mesa.getID_MESA()+"\'\" type=\"button\"  id=\"btnNuevoPedido\" type=\"button\" class=\"btn btn-outline-primary\">Nuevo Pedido</button>\n" +
"                            </center>\n" +
"                          </td>\n" +
"                          <td>\n" +
"                            <center>\n" +
"                                <button onclick=\"location.href=\'MSO_cobrar_pedido.jsp?id="+mesa.getID_MESA()+"\'\" type=\"button\" id=\"btnCobrarPedido\" type=\"button\" class=\"btn btn-outline-light\">Cobrar Pedido</button>\n" +
"                            </center>\n" +
"                          </td>\n" +
"                        </tr>";
            
        }
        return htmlcode;
    }
    
//    public static void main(String[] args) {
//        System.out.println(new CodigoHTML().getMesasAsignadas("MSO-5"));
//        
//    }
}
