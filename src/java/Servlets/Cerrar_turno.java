/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Consultas.Buscar;
import Consultas.Insert;
import Consultas.Listas;
import Consultas.Update;
import Estructuras.CAJA;
import Estructuras.CAJA_REGISTRO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alex
 */
public class Cerrar_turno extends HttpServlet {

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
        
        double SaldoInicial = Double.parseDouble(request.getParameter("txtSaldoInicial"));
        double SaldoFinal = Double.parseDouble(request.getParameter("txtSaldoFinal"));
        String IdCaja = request.getParameter("txtIdCaja");
        String IdCajero = request.getParameter("txtIdCajero");
        int sig = new Buscar().siguiente_caja_registro();
        String IdRegistro = IdCaja+"-"+sig;
        String respuesta = ""; 
       
        if(new Buscar().cantidad_pedido_por_cobrar()==0){
            if(new Insert().CAJA_REGISTRO(new CAJA_REGISTRO(IdRegistro, IdCaja, IdCajero, SaldoInicial, SaldoFinal))){
                new Update().UsuarioCaja(new CAJA(IdCaja, "MSO-2", SaldoFinal));
                new Update().DesocuparMesa(IdCaja);
                respuesta = "true";
            }else{
                respuesta = "false";
            }
        }else{
            respuesta = "pendientes";
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
            Logger.getLogger(Cerrar_turno.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Cerrar_turno.class.getName()).log(Level.SEVERE, null, ex);
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
