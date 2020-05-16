/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consultas;

import Controlador.Conexion_consulta;
import Estructuras.MENU;
import Estructuras.MESA;
import Estructuras.PEDIDO;

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
"                                <button onclick=\"location.href=\'MSO_nuevo_pedido.jsp?IdMesa="+mesa.getID_MESA()+"\'\" type=\"button\"  id=\"btnNuevoPedido\" type=\"button\" class=\"btn btn-outline-primary\">Nuevo Pedido</button>\n" +
"                            </center>\n" +
"                          </td>\n" +
"                          <td>\n" +
"                            <center>\n" +
"                                <button onclick=\"location.href=\'MSO_cobrar_pedido.jsp?IdMesa="+mesa.getID_MESA()+"\'\" type=\"button\" id=\"btnCobrarPedido\" type=\"button\" class=\"btn btn-outline-light\">Cobrar Pedido</button>\n" +
"                            </center>\n" +
"                          </td>\n" +
"                        </tr>";
            
        }
        return htmlcode;
    }
    
    public String getMenus(String IdMesa){
        String htmlcode = "";
        Listas l = new Listas();
        for(MENU menu : l.ListaMenus()){
            htmlcode += "<article class=\"card card-product\" style=\"width: 100%\">\n" +
"                                    <div class=\"card-body\">\n" +
"                                    <div class=\"row\">\n" +
"                                            <aside class=\"col-sm-3\">\n" +
"                                                <div class=\"img-wrap\"> <img src=\""+menu.getURL()+"\"/> </div>\n" +
"                                            </aside> <!-- col.// -->\n" +
"                                            <article class=\"col-sm-6\">\n" +
"                                                    <h4 class=\"title\"> "+menu.getNOMBRE()+"  </h4>\n" +
"                                                    <p> "+menu.getDESCRIPCION()+"</p><br>\n" +
"                                                    <div class=\"price-wrap h4\">\n" +
"                                                        <span class=\"price\"> Q"+menu.getPRECIO()+"</span>	\n" +
"                                                    </div> <!-- info-price-detail // -->\n" +
"                                            </article> <!-- col.// -->\n" +
"                                            <aside class=\"col-sm-3 border-left\" >  \n" +
"                                                <div class=\"action-wrap\" style=\"align-items: center\">\n" +
"                                                            <br>\n" +
"                                                            <br>\n" +
"                                                            <br>\n" +
"                                                            <button onclick=\"location.href=\'MSO_detalle_producto.jsp?IdMesa="+IdMesa+"&IdMenu="+menu.getID_MENU()+"\'\" type=\"button\" class=\"btn btn-danger\" style=\"width: 100%\">Añadir</button>\n" +
"                                                    </div> <!-- action-wrap.// -->\n" +
"                                            </aside> <!-- col.// -->\n" +
"                                    </div> <!-- row.// -->\n" +
"                                    </div> \n" +
"                            </article>";
        }
        return htmlcode;
    }
    
    public String getMenusPorCategoria(String IdMesa, String categoria){
        String htmlcode = "";
        Listas l = new Listas();
        for(MENU menu : l.ListaMenusCategoria(categoria)){
            htmlcode += "<article class=\"card card-product\" style=\"width: 100%\">\n" +
"                                    <div class=\"card-body\">\n" +
"                                    <div class=\"row\">\n" +
"                                            <aside class=\"col-sm-3\">\n" +
"                                                <div class=\"img-wrap\"> <img src=\""+menu.getURL()+"\"/> </div>\n" +
"                                            </aside> <!-- col.// -->\n" +
"                                            <article class=\"col-sm-6\">\n" +
"                                                    <h4 class=\"title\"> "+menu.getNOMBRE()+"  </h4>\n" +
"                                                    <p> "+menu.getDESCRIPCION()+"</p><br>\n" +
"                                                    <div class=\"price-wrap h4\">\n" +
"                                                        <span class=\"price\"> Q"+menu.getPRECIO()+"</span>	\n" +
"                                                    </div> <!-- info-price-detail // -->\n" +
"                                            </article> <!-- col.// -->\n" +
"                                            <aside class=\"col-sm-3 border-left\" >  \n" +
"                                                <div class=\"action-wrap\" style=\"align-items: center\">\n" +
"                                                            <br>\n" +
"                                                            <br>\n" +
"                                                            <br>\n" +
"                                                            <button onclick=\"location.href=\'MSO_detalle_producto.jsp?IdMesa="+IdMesa+"&IdMenu="+menu.getID_MENU()+"\'\" type=\"button\" class=\"btn btn-danger\" style=\"width: 100%\">Añadir</button>\n" +
"                                                    </div> <!-- action-wrap.// -->\n" +
"                                            </aside> <!-- col.// -->\n" +
"                                    </div> <!-- row.// -->\n" +
"                                    </div> \n" +
"                            </article>";
        }
    
        return htmlcode;
    }
    
     public String getPedidosPorDespachar(){
        String htmlcode = "";
        Listas l = new Listas();
        int i = 0;
        for(PEDIDO p : l.ListaPedidosPorDespachar()){
            i++;
            htmlcode+="<tr>\n" +
"                              <td>"+i+"</td>\n" +
"                              <td>"+p.getID_PEDIDO()+"</td>\n" +
"                              <td>"+p.getID_MESA()+"</td>\n" +
"                              <td>"+new Buscar().usuario(p.getID_USUARIO()).getUSUARIO()+"</td>\n" +
"                              <td>"+p.getHORA_PEDIDO()+"</td>\n" +
"                        \n" +
"                              <td>\n" +
"                                  <button onclick=\"location.href='CNO_Despachar.jsp?IdPedido="+p.getID_PEDIDO()+"'\" type=\"button\" class=\"btn btn-outline-light\" style=\"background: #fd7e14; height: 35px;\">\n" +
"                                      Despachar\n" +
"                                  </button>\n" +
"                              </td>\n" +
"                          </tr>";
            
        }
        return htmlcode;
    }
    
//    public static void main(String[] args) {
//        System.out.println(new CodigoHTML().getMesasAsignadas("MSO-3"));
//        
//    }
}
