<%-- 
    Document   : RptCaja_registros
    Created on : 20/05/2020, 07:44:15 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Consultas.Buscar"%>
<%@page import="java.lang.String"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="Controlador.Conexion_consulta"%>
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
        File reportfile = new File (application.getRealPath("Rpt_Caja_registros.jasper"));
        
        Map<String, Object> parameter = new HashMap<String, Object>();
        
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
