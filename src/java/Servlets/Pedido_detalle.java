/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Estructuras.PEDIDO_DETALLE;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alex             URL: Add
 */
public class Pedido_detalle extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String IdMenu = request.getParameter("txtIdMenu");
        int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
        String respuesta="";
        
        HttpSession sesion = request.getSession(true);
        ArrayList<PEDIDO_DETALLE> items = sesion.getAttribute("items") == null ? new ArrayList<>() : (ArrayList)sesion.getAttribute("items");
        
        boolean encontrado = false;
        
        if(items.size()>0){
            for(PEDIDO_DETALLE p : items){
                if(IdMenu.equals(p.getID_MENU())){
                    p.setCANTIDAD(cantidad+p.getCANTIDAD());
                    encontrado = true;
                    break;
                }
            }
            respuesta="true";
        }
        
        if(!encontrado){
            items.add(new PEDIDO_DETALLE(IdMenu, cantidad));
            respuesta="true";
        }
        
        sesion.setAttribute("items", items);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
