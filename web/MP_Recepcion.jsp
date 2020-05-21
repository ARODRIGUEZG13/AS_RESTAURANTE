<%-- 
    Document   : MP_Cajero
    Created on : 8/04/2020, 03:47:50 PM
    Author     : Alex
--%>

<%@page import="Consultas.Buscar"%>
<%@page import="Consultas.CodigoHTML"%>
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
        <title>Inicio</title>  
        <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <!--===============================================================================================-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">      
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
            <nav class="navbar navbar-expand-lg navbar" style="background-color: #ffc107;"> <!color del cuadro fondo>
            <nav class="navbar" style="background-color: #ffc107;"> <!color del cuadro opciones>
         <a class="navbar-brand" href="MP_Recepcion.jsp">
        <img src="images/icons/recepcionista.png" width="45" height="45" alt="">
        </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="MP_Recepcion.jsp" style="color: white"> <%out.print(usuario);%></a>
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
          <a class="dropdown-item" href="#">....</a>
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
          <a class="dropdown-item" href="#">...</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
          MENÚS
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Unidad/newUnidad.jsp">Nueva Unidad de Medida</a>
          <a class="dropdown-item" href="Unidad/upUnidad.jsp">Modificar Unidad de Medida</a>
          <a class="dropdown-item" href="Unidad/clUnidad.jsp">Eliminar Unidad de Medida</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">...</a>
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
        
        <hr style="background: #ffc107"> 
        <h3 style="text-align: center">RECEPCION Y CONTROL DE MESAS</h3>
        <hr style="background: #ffc107">    
        <section class="main container">
            <div class="row">
                <section class="post col-md-12">
                <%CodigoHTML c = new CodigoHTML();
                   if(c.getMesas()!=null){%>
                   <%=new CodigoHTML().getMesas()%>
                   <%}%>
                </section>
            </div>
        </section>
                
                
         <script src="js/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
         <script src="js/popper.min.js" type="text/javascript"></script>

        <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>-->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
</html>
