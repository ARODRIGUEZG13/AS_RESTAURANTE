<%-- 
    Document   : CNO_Despachar
    Created on : 16/05/2020, 03:11:13 PM
    Author     : Alex
--%>

<%@page import="Consultas.Listas"%>
<%@page import="Estructuras.PEDIDO_DETALLE"%>
<%@page import="Consultas.CodigoHTML"%>
<%@page import="Consultas.Buscar"%>
<%
    HttpSession sesion = request.getSession();
    String usuario = "";
    if (sesion.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }else{
        usuario = new Buscar().usuario((String)sesion.getAttribute("usuario")).getUSUARIO();
    }
    String IdPedido = (String)request.getParameter("IdPedido");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Despacho de pedidos</title>  
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/cocinero.png"/>
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
      <h3 style="text-align: center">DETALLES DEL PEDIDO</h3>
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
                          <th scope="col">PEDIDO:<%out.print(IdPedido);%></th>
                          <th scope="col">CANTIDAD</th>
                          <th scope="col"></th>
                        </tr>
                      </thead>
                      
                      <tbody>
                          <%double total = 0; int aux=0;
                          Listas l = new Listas();
                          if(l.ListaPedidoDetalle(IdPedido)!= null){    
                          for(PEDIDO_DETALLE i : new Listas().ListaPedidoDetalle(IdPedido)){
                          aux ++;
                          total = total + (new Buscar().menu(i.getID_MENU()).getPRECIO()*i.getCANTIDAD());
                          %>
                          <tr>
                          <th scope="row"><%out.print(aux);%></th>
                          <td>
                              <figure class="media">
                                  <div class="img-wrap">
                                      <img src="<%out.print(new Buscar().menu(i.getID_MENU()).getURL());%>" class="img-thumbnail img-sm">
                                  </div>
                                  <figcaption class="media-body">
                                      <h6 class="title text-truncate"><%out.print(new Buscar().menu(i.getID_MENU()).getNOMBRE());%></h6>
                                      <dl class="dlist-inline small">
                                          <dt>Id Menu: </dt>
                                          <dd><%out.print(i.getID_MENU());%></dd>
                                      </dl>
                                      <dl class="dlist-inline small">
                                          <dt>Categoria: </dt>
                                          <dd><%out.print(new Buscar().categoria(new Buscar().menu(i.getID_MENU()).getID_CATEGORIA()).getNOMBRE());%></dd>
                                      </dl>
                                  </figcaption>
                              </figure>
                          </td>
                          <td>
                              <div class="input-group">
                                  <span id="IdItem" style="display: none;"><%out.print(i.getID_MENU());%></span>
                                  <input disabled id="txtCantidad" class="cart_quantity_input" type="text" value="<%out.print(i.getCANTIDAD());%>" style="height: 35px; width: 40px; text-align: center">                                            
                              </div>
                          </td>
                          <td class="text-right">  
                              <span id="IdItem" style="display: none;">IdMenu</span>
                              <input type="checkbox" class="form-check" style="width: 40px; height: 40px;">
                          </td>
                        </tr>
                        <%}}else{%>
                        <tr>
                            <td></td>
                            <td><h3>El pedido aun no tiene items ...</h3></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <%}%>
                      </tbody>
                      
                  </table>
                      <center>
                          <input type="text" id="txtIdPedido" value="<%out.print(IdPedido);%>" hidden>
                      <button id="btnDespacharPedido" type="button" class="btn btn-block btn-outline-danger" style="height: 50px;">
                          DESPACHAR PEDIDO
                      </button>
                      </center>
              </section>
              <section class="post col-md-1"></section>
          </div>
      </section>
      <hr style="background: #fd7e14">
      <br>
    </body>
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendor/bootstrap/js/popper.min.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="js/validacion.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
            
</html>
