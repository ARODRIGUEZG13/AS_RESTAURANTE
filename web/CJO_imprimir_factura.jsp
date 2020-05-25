<%-- 
    Document   : CJO_imprimir_factura
    Created on : 18/05/2020, 07:59:03 PM
    Author     : Alex
--%>

<%@page import="Consultas.CodigoHTML"%>
<%@page import="Consultas.Buscar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String usuario = "";
    
    String IdUsuario = (String)sesion.getAttribute("usuario");
    String IdPedido = (String)request.getParameter("IdPedido");
    if (sesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }else{
        usuario = new Buscar().usuario((String)sesion.getAttribute("usuario")).getUSUARIO();
    }
%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cajero</title>  
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
                    <nav class="navbar navbar-expand-lg navbar" style="background-color: #20c997;"> <!color del cuadro fondo>
          <nav class="navbar" style="background-color: #20c997;"> <!color del cuadro opciones>
         <a class="navbar-brand" href="#">
        <img src="images/icons/cajero.png" width="45" height="45" alt="">
        </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="MP_Cajero.jsp?IdCaja=<%out.print(new Buscar().cajaPorUsuario((IdUsuario)).getID_CAJA());%>" style="color: white"> <%out.print(usuario);%>  </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
          MESAS
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Articulo/newArticulo.jsp">Nuevo Articulo</a>
          <a class="dropdown-item" href="Articulo/upArticulo.jsp">Modificar Articulo</a>
          <a class="dropdown-item" href="Articulo/clArticulo.jsp">Eliminar Articulo</a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
          PAGO
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Categorias/addCategoria.jsp">EFECTIVO</a>
          <a class="dropdown-item" href="Categorias/upCategoria.jsp">TARJETA DEBITO/CREDITO</a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
          CUADRE
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Unidad/newUnidad.jsp">Nueva Unidad de Medida</a>
          <a class="dropdown-item" href="Unidad/upUnidad.jsp">Modificar Unidad de Medida</a>
          <a class="dropdown-item" href="Unidad/clUnidad.jsp">Eliminar Unidad de Medida</a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
    </ul>
      <ul></ul><ul></ul><ul></ul>
      <ul></ul><ul></ul><ul></ul>
      <ul></ul><ul></ul><ul></ul>
      <ul></ul><ul></ul><ul></ul>
      <ul></ul><ul></ul><ul></ul>
      <ul></ul><ul></ul>
      <form class="form-inline my-2 my-lg-0" method="POST">
          <button disabled href="login.jsp?cerrar=true" button type="button" class="btn btn-outline-light">Cerrar Sesion</button>
      </form>
  </div>
</nav>
</nav>
        <hr style="background: #20c997">         
        <h3 style="text-align: center">FINALIZACION DE PEDIDO</h3>
        <hr style="background: #20c997">
        <br> 
        
        <section class="main container">
            <div class="row">
                <section class="post col-md-4"></section> 
                <section class="post col-md-4">
                    <br><br><br><br>
                    <a href="ADS_Imprimir.jsp?IdPedido=<%out.print(IdPedido);%>" target="_blank" class="btn btn-block btn-outline-primary" style="height: 75px;">
                        <br><h3>IMPRIMIR FACTURA</h3>
                    </a>
                    <br><br>
                    <button type="button" onclick="location.href='MP_Cajero.jsp?IdCaja=<%out.print((String)request.getParameter("IdCaja"));%>'" class="btn btn-block btn-outline-primary" style="height: 75px;">
                        <h3>MENU PRINCIPAL</h3>
                    </button> 
                    <br><br><br><br><br><br>
                </section>
                <section class="post col-md-4"></section>
            </div>
        </section>
         <hr style="background: #20c997">
                      <br><br>              
      
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendor/bootstrap/js/popper.min.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="js/validacion.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <%if((String)request.getParameter("fc")!=null){%>
        <script type="text/javascript">
            swal("Listo","Factura creada correctamente","success");
        </script>
        <%}%>
</html>
