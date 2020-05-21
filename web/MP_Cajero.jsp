<%-- 
    Document   : MP_Cajero
    Created on : 8/04/2020, 03:47:50 PM
    Author     : Alex
--%>

<%@page import="Consultas.CodigoHTML"%>
<%@page import="Consultas.Buscar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String usuario = "";
    String efectivo = "";
    double  saldoFinal=0;
    String IdUsuario = (String) sesion.getAttribute("usuario");
    String IdCaja = (String)request.getParameter("IdCaja");
    if (sesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }else{
        usuario = new Buscar().usuario((String)sesion.getAttribute("usuario")).getUSUARIO();
    }
    if(sesion.getAttribute("efectivo")!=null){
        efectivo = (String)sesion.getAttribute("efectivo");
        saldoFinal = new Buscar().caja(IdCaja).getSALDO()+ Double.parseDouble(efectivo);
    }else{
        efectivo = "vacio";
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
       <a href="login.jsp?cerrar=true" button type="button" class="btn btn-outline-light">Cerrar Sesion</a>
      </form>
  </div>
</nav>
</nav>
     
        <hr style="background: #20c997">
        <section class="main container">
            <div class="row">
                <section class="post col-md-2"></section>
                <section class="post col-md-2">
                    <b>Saldo inicial</b>
                    <input type="text" id="txtSaldoInicial" value="<%out.print(new Buscar().caja(IdCaja).getSALDO());%>" hidden>
                    <input type="text" class="form-control" value="Q.<%out.print(new Buscar().caja(IdCaja).getSALDO());%>" disabled>
                </section>
                <section class="post col-md-2">
                    <b>Efectivo del dia</b>
                    <input type="text" id="txtSaldoDia"  value="<%out.print(efectivo);%>" hidden>
                    <input type="text" class="form-control" value="Q.<%out.print(efectivo);%>" disabled>
                </section>
                <section class="post col-md-2">
                    <b>Saldo Final</b>
                    <input type="text" id="txtSaldoFinal"  value="<%out.print(saldoFinal);%>" hidden>
                    <input type="text" class="form-control" value="Q.<%out.print(saldoFinal);%>" disabled>
                </section>
                <section class="post col-md-2">
                    <br>
                    <button id="btnCerrarTurno" type="button" class="btn btn-outline-success">
                        Finalizar turno
                    </button>
                    <input type="text" id="txtIdCaja" hidden value="<%out.print(IdCaja);%>">
                    <input type="text" id="txtIdCajero" hidden value="<%out.print(IdUsuario);%>">
                </section>
                <section class="post col-md-1"></section>
            </div>
        </section>
        <hr style="background: #20c997">
        
        
        <div class="row">
            <section class="post col-md-4"></section>
            <section class="post col-md-4">
                 <h3 style="text-align: center">Lista de pedidos por cobrar:</h3>
            </section>
        </div>
        
        <section class="main container">
            <div class="row">
                <section class="post col-md-1"></section>
                <section class="post col-md-10">
                    <table class="table table-hover table-dark">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">PEDIDO</th>
                          <th scope="col">MESA</th>
                          <th scope="col">MESERO</th>
                          <th scope="col">CLIENTE</th>
                          <th scope="col">TOTAL</th>
                          <th scope="col"></th>
                        </tr>
                      </thead>
                      <tbody> 
                          <%
                            if(!new CodigoHTML().getCobrarPedidos().equals("")){  
                            out.print(new CodigoHTML().getCobrarPedidos());
                            }else{%>
                            <tr>
                                <td></td>
                                <td><h3>No hay pedidos por cobrar ...</h3></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                           <%}%>
                      
                      </tbody>
                    </table>
                </section>
                <section class="post col-md-1"></section>
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
        
        <%if((String)request.getParameter("tc")!=null){%>
        <script type="text/javascript">
            swal("Listo","Se abrio el turno correctamente ...","success");
        </script>
        <%}%>
</html>
