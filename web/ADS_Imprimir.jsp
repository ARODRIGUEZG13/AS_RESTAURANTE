<%-- 
    Document   : ADS_Imprimir
    Created on : 19/05/2020, 08:45:56 PM
    Author     : Alex
--%>

<%@page import="Consultas.Buscar"%>
<%@page import="java.lang.String"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="Controlador.Conexion_consulta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Factura</title>  
        <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <!--===============================================================================================-->
        <link href="css/responsive.css" rel="stylesheet" type="text/css"/>
        <!--===============================================================================================-->
        <link href="css/ui.css" rel="stylesheet" type="text/css"/>
        <!--===============================================================================================-->
        
        <!--===============================================================================================-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">   
        <!--===============================================================================================-->
    </head>
    <body>
        
        <%
        Conexion_consulta c = new Conexion_consulta();
        File reportfile = new File (application.getRealPath("Factura.jasper"));
        
        Map<String, Object> parameter = new HashMap<String, Object>();
        
        String IdFactura = "";
        
        if(request.getParameter("IdFactura")!=null){
            IdFactura = request.getParameter("IdFactura");
        }else if(request.getParameter("IdPedido")!=null){
            IdFactura = new Buscar().FacturaPorIdPedido(request.getParameter("IdPedido")).getID_FACTURA();
        }
        parameter.put("IdFactura", new String(IdFactura));
        
        byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter,c.conectar());
        
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        
        outputstream.flush();
        outputstream.close();
        c.conectar().close();
        %>
        
    </body>
</html>
