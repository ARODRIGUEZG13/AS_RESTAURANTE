<%-- 
    Document   : ADS_Facturas
    Created on : 19/05/2020, 07:55:25 PM
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
        <title>Admin</title>  
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
          <nav class="navbar navbar-expand-lg navbar navbar navbar-primary bg-primary">
          <nav class="navbar navbar-dark bg-primary">
                                 <a class="navbar-brand" href="MP_Admin.jsp">
                                <img src="images/avatar-01.png" width="45" height="45" alt="">
                                </a>
                          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
                                  aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                          </button>
                          <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                              <li class="nav-item active">
                                  <a class="nav-link" href="MP_Admin.jsp"><%out.print(usuario);%> </a>
                              </li>
                              <li class="nav-item dropdown">
                                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                                  REPORTES
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                  <a class="dropdown-item" href="Categorias/addCategoria.jsp">EMPLEADOS</a>
                                  <a class="dropdown-item" href="Categorias/upCategoria.jsp">VENTAS</a>
                                  <a class="dropdown-item" href="Categorias/clCategoria.jsp">EXISTENCIAS DE INSUMOS</a>
                                  <div class="dropdown-divider"></div>
                                </div>
                              </li>
                              <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                                  ESTADISTICAS
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                  <a class="dropdown-item" href="Unidad/newUnidad.jsp">VENTAS SEMANALES</a>
                                  <a class="dropdown-item" href="Unidad/upUnidad.jsp">VENTAS MENSUALES</a>
                                  <a class="dropdown-item" href="Unidad/clUnidad.jsp">VENTAS ANUALES</a>
                                  <div class="dropdown-divider"></div>
                                </div>
                              </li>
                              <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                                  PRODUCTOS CON MAS MOVIMIENTO
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                  <a class="dropdown-item" href="Unidad/upUnidad.jsp">MOVIMINETO MENSUAL</a>
                                  <a class="dropdown-item" href="Unidad/clUnidad.jsp">MOVIMINETO ANUAL</a>
                                  <div class="dropdown-divider"></div>
                                </div>
                              </li>
                            </ul>
                              <ul></ul><ul></ul><ul></ul>
                              <ul></ul><ul></ul><ul></ul>
                              <ul></ul><ul></ul><ul></ul>
                            <form class="form-inline my-2 my-lg-0" method="POST">
                                <a href="login.jsp?cerrar=true" button type="button" class="btn btn-outline-light">Cerrar Sesion</a>
                            </form>
                              
                          </div>
          </nav></nav>

           <hr style="background: #0056b3">
            <center>
                <h3>Listado de Facturas</h3>
            </center>
           <hr style="background: #0056b3">
           <section class="main container">
              <div class="row">
                  <section class="post col-md-1"></section>
                  <section class="post col-md-10">
                      
                      <table class="table table-hover table-dark">
                      
                          <thead>
                            <tr>
                              <th scope="col">#</th>
                              <th scope="col">ID FACTURA</th>
                              <th scope="col">CLIENTE</th>
                              <th scope="col">VALOR</th>
                              <th scope="col"></th>
                            </tr>
                          </thead> 

                          <tbody>
                              <%if("".equals(new CodigoHTML().getFacturas())){%>
                              <tr>
                                  <td></td> 
                                  <td></td>
                                  <td>No hay pedidos por despachar</td>
                                  <td></td>
                                  <td>
                                  </td>
                              </tr>
                              <%}else{
                                    out.print(new CodigoHTML().getFacturas());
                               }%>
                          </tbody>

                      </table>
                      
                  </section>
                  <section class="post col-md-1"></section>
              </div>
               <br>
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
