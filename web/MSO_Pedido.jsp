<%-- 
    Document   : MSO_Pedido
    Created on : 15/05/2020, 10:01:24 PM
    Author     : Alex
--%>

<%@page import="Estructuras.PEDIDO_DETALLE"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
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
    
    ArrayList<PEDIDO_DETALLE> items = sesion.getAttribute("items") == null ? null : (ArrayList)sesion.getAttribute("items");
    DecimalFormat convertir = new DecimalFormat("###,###,##0.00");
%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mesero</title>  
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
        <h3 style="text-align: center">Detalles del Pedido</h3>
        <hr style="background: #c82333">
        <br>
        
        <section class="main container">
            <div class="row">
                <section class="post col-md-1"></section>
                <section class="post col-md-10">
                    <table class="table table-hover">
                      
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Menu</th>
                          <th scope="col">Cantidad</th>
                          <th scope="col">Precio</th>
                          <th scope="col"></th>
                        </tr>
                      </thead>
                      
                      <tbody>
                          <%double total = 0; int aux=0;
                          if(items!= null){    
                          for(PEDIDO_DETALLE i : items){
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
                                  <button id="btnMin" class="btn btn-outline-danger" style="height: 35px; width: 35px"> - </button>
                                  <input disabled id="txtCantidad" class="cart_quantity_input" type="text" value="<%out.print(i.getCANTIDAD());%>" style="height: 35px; width: 40px; text-align: center">                                            
                                  <button id="btnPlus" class="btn btn-outline-danger" style="height: 35px; width: 35px"> + </button>
                              </div>
                          </td>
                          <td>
                              <div class="price-wrap">
                                  <var class="price">Importe: <%out.print(new Buscar().menu(i.getID_MENU()).getPRECIO()*i.getCANTIDAD());%> </var><br>
                                  <small class="text-muted">Precio: <%out.print(new Buscar().menu(i.getID_MENU()).getPRECIO());%></small>
                              </div>
                          </td>
                          <td class="text-right">  
                              <span id="IdItem" style="display: none;">IdMenu</span>
                              <button class="btn btn-outline-danger" id="deleteitem">x Quitar</button>
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
                    <hr style="background: #c82333">
                    <div class="input-group">
                        <button type="button" class="btn btn-instagram" style="width: 250px;">
                        TOTAL
                        </button>
                        <input type="text" class="form-control" disabled value="Q.<%out.print(total);%>" style="text-align: right">
                    </div>
                    <hr style="background: #c82333">
                </section>
                <section class="post col-md-1"></section>
            </div>
            
            <div class="row">
                <section class="post col-md-1"></section>
                <section class="post col-md-5">
                    <center>
                        <button onclick="location.href='MSO_nuevo_pedido.jsp?IdMesa=<%out.print((String)request.getParameter("IdMesa"));%>'" type="button" class="btn btn-outline-dark" style="width: 250px">
                            AGREGAR OTRO MENU
                        </button>
                    </center>
                </section>
                <section class="post col-md-5">
                    <center>
                        <input type="text" value="<%out.print((String)request.getParameter("IdMesa"));%>" id="txtIdMesa" hidden>
                        <input type="text" value="<%out.print((String)sesion.getAttribute("usuario"));%>" id="txtIdMesero" hidden>
                        <button id="btnTerminarPedido" type="button" class="btn btn-outline-primary" style="width: 250px"
                        <%
                        if(items==null){
                            out.print("disabled");
                        }
                        %>
                        >
                            TERMINAR PEDIDO
                        </button>
                    </center>
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
</html>
