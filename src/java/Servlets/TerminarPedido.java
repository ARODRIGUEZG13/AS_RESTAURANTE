/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Consultas.Buscar;
import Consultas.Insert;
import Estructuras.PEDIDO;
import Estructuras.PEDIDO_DETALLE;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alex         URL. Crear_pedido
 */
public class TerminarPedido extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        int nPedido = new Buscar().siguiente_pedido();
        String IdPedido = "PDO-"+nPedido;
        String IdMesa = request.getParameter("txtIdMesa");
        String IdMesero = request.getParameter("txtIdMesero");
        String respuesta = "";
        int estado = 0;
        int linea = 0;
        
        HttpSession sesion = request.getSession(true);
        ArrayList<PEDIDO_DETALLE> items = sesion.getAttribute("items") == null ? new ArrayList<>() : (ArrayList)sesion.getAttribute("items");
        
        if(new Insert().PEDIDO(new PEDIDO(IdPedido, IdMesa, IdMesero, estado))){
            
            if(items.size()>0){
            for(PEDIDO_DETALLE p : items){
                    linea ++;   
                    if(new Insert().PEDIDO_DETALLE(new PEDIDO_DETALLE(IdPedido, "I-"+linea, p.getID_MENU(), p.getCANTIDAD()))){  
                        respuesta="true";
                    }
                }
            }
        }else{
            respuesta = "false";
        }
        
        if (respuesta == "true"){
            sesion.setAttribute("items", null);
        }
        
        response.getWriter().print(respuesta);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(TerminarPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(TerminarPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
