<%-- 
    Document   : MSO_cobrar_pedido
    Created on : 14/05/2020, 07:17:40 PM
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
       <a href="login.jsp?cerrar=true" button type="button" class="btn btn-outline-light">Cerrar Sesion</a>
      </form>
  </div>
</nav>
</nav>
        <hr style="background: #20c997">         
        <h3 style="text-align: center">Detalles del pedido a facturar</h3>
        <hr style="background: #20c997">
        <br>
        
        <section class="main container">
            <div class="row">
                <section class="post col-md-1"></section>
                <section class="post col-md-10">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">MENU</th>
                          <th scope="col">PRECIO</th>
                          <th scope="col">CANTIDAD</th>
                          <th scope="col">IMPORTE</th>
                        </tr>
                      </thead>
                      <tbody>
                          <%
                            if(!"".equals((String)request.getParameter("IdPedido"))){
                                out.print(new CodigoHTML().getDetallePedido((String)request.getParameter("IdPedido")));
                          %>
                          <tr>
                          <th scope="col"></th>
                          <th scope="col">TOTAL</th>
                          <th scope="col"></th>
                          <th scope="col"></th>
                          <th scope="col">Q.<%out.print(new Buscar().total_pedido(IdPedido));%></th>
                          </tr>
                            <%}else{%>
                            <tr>
                                <td></td>
                                <td><h3>El pedido ya fue cancelado ...</h3></td>
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
            
            <div class="row">
                <section class="post col-md-1"></section>
                <section class="post col-md-6">
                        
                            <h5 class="alert alert-success"><center>FORMAS DE PAGO:</center></h5>
                            <figure class="itemside mb-4" style="">

                                <aside class="col-md-3">
                                    <img src="images/icons/pay-visa.png">
                                </aside>

                                <aside class="col-md-7">    
                                    <h5>Tarjeta de Credito / Debito</h5>
                                </aside>   
                                <aside class="col-md-1">   
                                    <input id="btnTarjeta" class="form-check-input" type="radio" name="Tarjeta" value="">
                                </aside>    
                            </figure>

                            <figure class="itemside mb-4">
                                <aside class="col-md-3">
                                    <img src="images/icons/pay-bank.png"> 
                                </aside>
                                <aside class="col-md-7">
                                    <h5>Efectivo</h5> 
                                </aside>
                                <aside class="col-md-1">   
                                    <input id="btnEfectivo" class="form-check-input" type="radio" value="">
                                </aside>
                            </figure>
                       
                </section>

                <section class="post col-md-4">
                    <input id="txtIdCaja" type="text" hidden value="<%out.print(new Buscar().cajaPorUsuario((IdUsuario)).getID_CAJA());%>">
                    <input id="txtIdCajero" type="text" hidden value="<%out.print(IdUsuario);%>">
                    <input id="txtIdMesero" type="text" hidden value="<%out.print(new Buscar().pedido(IdPedido).getID_USUARIO());%>">
                    <input id="txtIdPedido" type="text" hidden value="<%out.print(IdPedido);%>">
                    <input id="txtTotal" type="text" hidden value="<%out.print(new Buscar().total_pedido(IdPedido));%>">
                    <div class="input-group">
                        <input id="txtNIT" type="text" maxlength="20" class="form-control" placeholder="Ingrese el NIT">&emsp;
                        <button id="btnBuscarCliente" type="button" class="btn btn-outline-dark">
                            VERIFICAR
                        </button>
                    </div><br>
                    <input id="txtCliente" type="text" maxlength="20" class="form-control" placeholder="Ingrese nombre"><br>
                    <input id="txtDireccion" type="text" maxlength="20" class="form-control" placeholder="Ingrese direccion"><br>
                    <button type="button" class="btn btn-block btn-outline-success" id="btnCrearFactura" style="height: 45px;">
                        COBRAR Y EMITIR FACTURA
                    </button>
                </section>
                <section class="post col-md-1"></section>
                <hr style="background: #20c997">
            </div>
        </section>
                      <br><br>              
      
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendor/bootstrap/js/popper.min.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="js/validacion.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
</html>
