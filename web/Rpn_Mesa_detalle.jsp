<%-- 
    Document   : Rpn_Mesa_detalle
    Created on : 11/05/2020, 06:58:31 PM
    Author     : Alex
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Estructuras.USUARIO"%>
<%@page import="Consultas.Listas"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Consultas.Buscar"%>
<%@page import="Consultas.CodigoHTML"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    DecimalFormat convertir = new DecimalFormat("###,###,###.00");
    String usuario = "";
    if (sesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }else{
        usuario = new Buscar().usuario((String)sesion.getAttribute("usuario")).getUSUARIO();
    }
    String Id_Mesa = (String) request.getParameter("id");
    String Id_Mesero = "",cliente="", status=""; int capacidad=0,estado=0; double saldo=0;
    if(Id_Mesa != null){
        Id_Mesero = new Buscar().mesa(Id_Mesa).getID_USUARIO();
        cliente = new Buscar().mesa(Id_Mesa).getCLIENTE();
        capacidad = new Buscar().mesa(Id_Mesa).getCAPACIDAD();
        estado = new Buscar().mesa(Id_Mesa).getESTADO();
        if(estado==0){status="Disponible";}else if(estado==1){
        status="Por desocupar";}else{status="No disponible";}
        saldo = new Buscar().mesa(Id_Mesa).getSALDO();
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
        <h3 style="text-align: center">DETALLES DE MESA</h3>
        <hr style="background: #ffc107">
        <br>
        <section class="main container">
            <div class="row">
                <section class="post col-md-2"></section>
                <section class="post col-md-8">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button type="button" class="btn btn-secondary" style="width: 180px; text-align: left">Mesa: </button>
                        </div>
                        <input type="text" class="form-control" id="txtId_Mesa" disabled
                               value="<%out.print(Id_Mesa);%>"> 
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button type="button" class="btn btn-secondary" style="width: 180px; text-align: left">Mesero: </button>
                        </div>
                        <%
                        Listas lista = new Listas();
                        ArrayList<USUARIO> vu = lista.ListaUsuariosParaMesa();
                        if(Id_Mesero.equals("MSO-2")){%>
                        <select class="form-control" id="txtId_Mesero">
                            <option selected value="">Seleccionar mesero</option>
                            <%for (USUARIO u : vu){%>
                             <option value="<%=u.getID_USUARIO()%>"><%out.print(u.getUSUARIO()+" "+u.getNOMBRES()+" "+u.getAPELLIDOS());%></option>
                            <%}%>
                        </select>
                        <%}else{%>
                            <input type="text" class="form-control" id="txtId_Mesero" disabled
                               value="<%out.print(new Buscar().usuario(Id_Mesero).getUSUARIO());%>">
                        <%}%>
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button type="button" class="btn btn-secondary" style="width: 180px; text-align: left">Estado: </button>
                        </div>
                        <input type="text" class="form-control" disabled id="txtEstado"
                               value="<%out.print(status);%>"> 
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button type="button" class="btn btn-secondary" style="width: 180px; text-align: left">Capacidad: </button>
                        </div>
                        <input type="text" class="form-control" disabled
                               value="<%out.print(capacidad);%> personas">
                        <input type="text" id="txtCapacidad" hidden="" value="<%out.print(capacidad);%>">
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button type="button" class="btn btn-secondary" style="width: 180px; text-align: left">Saldo: </button>
                        </div>
                        <input type="text" class="form-control" disabled id="txtSaldo"
                               value="<%out.print(convertir.format(saldo));%>"> 
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button type="button" class="btn btn-secondary" style="width: 180px; text-align: left">Cliente: </button>
                        </div>
                        <%if(cliente!=null){%>
                        <input type="text" class="form-control" disabled id="txtCliente"
                               value="<%out.print(cliente);%>">
                        <%}else{%>
                        <input type="text" class="form-control" id="txtCliente" placeholder="Ingrese el nombre del cliente">
                        <%}%>
                    </div>
                    <br>
                    <center>
                        <%if(Id_Mesero.equals("MSO-2")){%>
                        <button id="btnAsignarMesa" type="button" class="btn btn-outline-dark" style="width: 200px; height: 40px;">
                            Asignar
                        </button>
                        <%}else{%>
                        <button disabled="" type="button" class="btn btn-outline-dark" style="width: 200px; height: 40px;">
                            Asignar
                        </button>
                        <%}%>
                    </center>
                </section>
                <section class="post col-md-2"></section>
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
