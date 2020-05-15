<%-- 
    Document   : MSO_detalle_producto
    Created on : 14/05/2020, 11:47:03 PM
    Author     : Alex
--%>

<%@page import="Consultas.CodigoHTML"%>
<%@page import="Consultas.Buscar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String usuario = "";
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
        <title>Agregando al pedido</title>  
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
            <nav class="navbar navbar-expand-lg navbar" style="background-color: #c82333;"> <!color del cuadro fondo>
          <nav class="navbar" style="background-color: #c82333;"> <!color del cuadro opciones>
         <a class="navbar-brand" href="MP_Mesero.jsp">
        <img src="images/icons/favicon.png" width="45" height="45" alt="">
        </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="MP_Mesero.jsp" style="color: white">   <%out.print(usuario);%>   </a>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
          MENÚS
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Unidad/newUnidad.jsp">UNITARIOS</a>
          <a class="dropdown-item" href="Unidad/upUnidad.jsp">COMBOS</a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
          MESAS
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Articulo/newArticulo.jsp">LIBRES</a>
          <a class="dropdown-item" href="Articulo/upArticulo.jsp">POR DESOCUPAR</a>
          <a class="dropdown-item" href="Articulo/clArticulo.jsp">OCUPADAS</a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
          CATEGORIAS
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Categorias/addCategoria.jsp">Nuevo Categoria</a>
          <a class="dropdown-item" href="Categorias/upCategoria.jsp">Modificar Categoria</a>
          <a class="dropdown-item" href="Categorias/clCategoria.jsp">Eliminar Categoria</a>
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
</nav></nav>
        <hr style="background: #c82333">         
        <h3 style="text-align: center"><%out.print("Producto: "+(String)request.getParameter("id"));%></h3>
        <hr style="background: #c82333">
        <br>
        
        <section class="main container">
            <div class="row">
                <section class="post col-md-6">
                    <center><br><br>
                    <img src="<%out.print(new Buscar().menu((String)request.getParameter("id")).getURL());%>" style="width: 75%">
                    </center>
                </section>
                    <section class="post col-md-6">
                        <br>
                        <div class="input-group">
                            <button type="button" id="btnMin" class="btn btn-danger">-</button>
                            <input type="text" id="txtCantidad" disabled value="1" style="width: 50px; text-align: center">
                            <button type="button" id="btnPlus" class="btn btn-danger">+</button>
                        </div>
                         <br>
                        <b>Precio por unidad:</b>
                        <br>
                        <input type="text" class="form-control" id="txtPrecio" value="<%out.print(new Buscar().menu((String)request.getParameter("id")).getPRECIO());%>" disabled>
                        <br>
                        <b>Producto:</b>
                        <br>
                        <input class="form-control" type="text" disabled value="<%out.print(new Buscar().menu((String)request.getParameter("id")).getNOMBRE());%>"
                        <br><br>
                        <b>Total:</b>
                        <input class="form-control" type="text" disabled id="txtTotal" value="<%out.print(new Buscar().menu((String)request.getParameter("id")).getPRECIO());%>">
                        <br><br>
                        <input hidden type="text" id="txtIdMenu" value="<%out.print((String)request.getParameter("id"));%>"
                        <center>
                        <button id="btnAñadirPedido" type="button" class="btn btn-outline-danger" style="width: 400px; height: 50px;">
                            Añadir al Pedido
                        </button>
                        </center>
                    </section>
            </div>
        </section>
      
      
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendor/bootstrap/js/popper.min.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="js/validacion.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
</html>
