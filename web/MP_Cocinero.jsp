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
        <title>Cocina</title>  
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/cocinero.png"/>
        <!--===============================================================================================-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">      
    </head>
    <body>
            <nav class="navbar navbar-expand-lg navbar" style="background-color: #fd7e14;"> <!color del cuadro fondo>
            <nav class="navbar" style="background-color: #fd7e14;"> <!color del cuadro opciones>
         <a class="navbar-brand" href="MP_Cocinero.jsp">
        <img src="images/icons/cocinero.png" width="45" height="45" alt="">
        </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active" >
        <a class="nav-link" href="MP_Cocinero.jsp" style="color: white">   <%out.print(usuario);%>   </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
          MESAS
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Articulo/upArticulo.jsp">Modificar Articulo</a>
          <a class="dropdown-item" href="Articulo/clArticulo.jsp">Eliminar Articulo</a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
          PEDIDOS
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Categorias/addCategoria.jsp">PREPARACION</a>
          <a class="dropdown-item" href="Categorias/upCategoria.jsp">DESPACHADO</a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
          MENÚS
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Unidad/newUnidad.jsp">COMBOS</a>
          <a class="dropdown-item" href="Unidad/upUnidad.jsp">UNITARIO</a>
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
      
      <hr style="background: #fd7e14">
      <h3 style="text-align: center">COLA DE PEDIDOS POR DESPACHAR</h3>
      <hr style="background: #fd7e14">
      <br>
      <section class="main container">
          <div class="row">
              <section class="post col-md-1"></section>
              <section class="post col-md-10">
                  <table class="table table-hover table-dark">
                      
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">ID PEDIDO</th>
                          <th scope="col">MESA</th>
                          <th scope="col">MESERO</th>
                          <th scope="col">HORA PEDIDO</th>
                          <th scope="col"></th>
                        </tr>
                      </thead>
                      
                      <tbody>
                          <%if("".equals(new CodigoHTML().getPedidosPorDespachar())){%>
                          <tr>
                              <td></td>
                              <td></td>
                              <td>No hay pedidos por despachar</td>
                              <td></td>
                              <td></td>
                              <td></td>
                          </tr>
                          <%}else{
                                out.print(new CodigoHTML().getPedidosPorDespachar());
                           }%>
                      </tbody>
                      
                  </table>
              </section>
              <section class="post col-md-1"></section>
          </div>
      </section>
      <br><br><br>
    </body>
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendor/bootstrap/js/popper.min.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="js/validacion.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <%if((String)request.getParameter("action")!=null){%>
        <script type="text/javascript">
            swal("Listo","El pedido se despacho correctamente","success");
        </script>
        <%}%>
            
</html>
