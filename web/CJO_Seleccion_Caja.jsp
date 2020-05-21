<%-- 
    Document   : CJO_Seleccion_Caja
    Created on : 16/05/2020, 08:10:25 PM
    Author     : Alex
--%>

<%@page import="Estructuras.CAJA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consultas.Listas"%>
<%@page import="Consultas.CodigoHTML"%>
<%@page import="Consultas.Buscar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String usuario = "";
    String IdUsuario = (String) sesion.getAttribute("usuario");
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
        <title>Caja</title>  
        
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
        <a class="nav-link" href="MP_Cajero.jsp" style="color: white"> <%out.print(usuario);%>  </a>
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
       <a href="login.jsp?cerrar=true" button type="button" class="btn btn-outline-light">Cerrar Sesion</a>
      </form>
  </div>
</nav>
</nav>
      
        <hr style="background: #20c997">
        <h3 style="text-align: center">CAJAS DISPONIBLES</h3>
        <hr style="background: #20c997">
        <br>
        
        <section class="main container">
            <div class="row">
                <section class="post col-md-3"></section>
                <section class="post col-md-6">
                    <%
                    Listas l = new Listas();
                    ArrayList<CAJA> v = l.ListaCajas();
                    int i = 0;
                    %>
                    <br><br><br>
                    <select class="form-control" id="txtIdCaja">
                        <option selected value="">Seleccionar caja</option>
                        <%for (CAJA c : v){
                        i++;
                        %>
                        <option value="<%=c.getID_CAJA()%>">Caja No.<%=i%></option>
                        <%}%>
                    </select><br>
                    <input type="text" id="txtSaldoCaja" class="form-control" disabled=""><br>
                     <center>
                         <button type="button" id="btnConsultaSaldo" class="btn btn-block btn-outline-success" style="height: 50px">
                         CONSULTAR SALDO
                         </button><br>
                         <input type="text" id="txtIdCajero" value="<%out.print(IdUsuario);%>" hidden>
                         <button type="button" id="btnAbrirTurno" class="btn btn-block btn-outline-primary" style="height: 50px">
                         ABRIR TURNO
                        </button>
                     </center>
                </section>
                <section class="post col-md-3"></section>
            </div>
        </section>
      
    </body>
        
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendor/bootstrap/js/popper.min.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="js/validacion.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
</html>
