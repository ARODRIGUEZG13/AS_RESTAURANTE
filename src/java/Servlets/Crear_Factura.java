/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Consultas.Buscar;
import Consultas.Insert;
import Consultas.Update;
import Estructuras.CLIENTE;
import Estructuras.FACTURA;
import Estructuras.MESA;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alex         URL. Nueva_Factura
 */
public class Crear_Factura extends HttpServlet {

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
        
        String IdCaja = request.getParameter("txtIdCaja");
        String IdCajero = request.getParameter("txtIdCajero");
        String IdMesero = request.getParameter("txtIdMesero");
        String IdPedido = request.getParameter("txtIdPedido");
        String Fpago = request.getParameter("txtForma");
        double total = Double.parseDouble(request.getParameter("txtTotal")); 
        String NIT = request.getParameter("txtNIT");
        String cliente = request.getParameter("txtCliente");
        String direccion = request.getParameter("txtDireccion");
        String respuesta = "";
        int sigFac = new Buscar().siguiente_factura();
        String IdFactura = "FC-"+sigFac;
        
        
        HttpSession sesion = request.getSession();
        double SaldoCaja = 0;
        
        if(sesion.getAttribute("efectivo")!=null){
            SaldoCaja = Double.parseDouble((String)sesion.getAttribute("efectivo"));
        }
        
        if (new Buscar().cliente(NIT)==null){
            new Insert().CLIENTE(new CLIENTE(NIT, cliente, direccion));
        }
        
        if(new Insert().FACTURA(new FACTURA(IdFactura, IdCaja, IdCajero, IdMesero, IdPedido, Fpago, NIT, total, 1, 0))){
            
            SaldoCaja = SaldoCaja + total;
            sesion.setAttribute("efectivo", String.valueOf(SaldoCaja));
            new Update().EstadoPedido2(IdPedido);
            
            respuesta = "true";
            
        }else{
            respuesta = "false";
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
            Logger.getLogger(Crear_Factura.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Crear_Factura.class.getName()).log(Level.SEVERE, null, ex);
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
