<%-- 
    Document   : MSO_nuevo_pedido
    Created on : 14/05/2020, 07:17:28 PM
    Author     : Alex
--%>

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
        <title>Nuevo Pedido</title>  
        <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/bootstrap.bundle.min_1.js" type="text/javascript"></script>
         <!--===============================================================================================-->
        <link href="css/responsive.css" rel="stylesheet" type="text/css"/>
        <!--===============================================================================================-->
        <link href="css/ui.css" rel="stylesheet" type="text/css"/>
        <!--===============================================================================================-->
        <script src="plugins/fancybox/fancybox.min.js" type="text/javascript"></script>
        <link href="plugins/fancybox/fancybox.min.css" type="text/css" rel="stylesheet">
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
        
      
        <section class="section-content bg padding-y">
            <div class="container">
                <div class="row">
                    <aside class="col-sm-3">
                        <div class="card card-filter">
                            <article class="card-group-item">
                                <header class="card-header">
                                    <a class="" aria-expanded="true" href="#" data-toggle="collapse" data-target="#collapse22">
                                        <i class="icon-action fa fa-chevron-down"></i>
                                        <h6 class="title">Categorias</h6>
                                    </a>
                                </header>
                                <div style="" class="filter-content collapse show" id="collapse22">
                                    <div class="card-body">
                                        <form class="pb-3">
                                            <div class="input-group">
                                                <input class="form-control" placeholder="Buscar" type="text">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>
                                                </div>
                                            </div>
                                        </form>

                                        <ul class="list-unstyled list-lg">

                                            <li><a href="Catalogo.jsp">Todos <span class="float-right badge badge-light round"></span> </a></li>
                                            <li><a href="Catalogo.jsp?categoria=001">Combos <span class="float-right badge badge-light round"></span> </a></li>
                                            <li><a href="Catalogo.jsp?categoria=002">Bebidas<span class="float-right badge badge-light round"></span>  </a></li>
                                            <li><a href="Catalogo.jsp?categoria=003">Postres<span class="float-right badge badge-light round"></span>  </a></li>
                                            <li><a href="Catalogo.jsp?categoria=004">Complementos<span class="float-right badge badge-light round"></span>  </a></li>
                                        </ul>  
                                    </div> <!-- card-body.// -->
                                </div> <!-- collapse .// -->
                            </article> <!-- card-group-item.// -->
                        </div> <!-- card.// -->
                    </aside> <!-- col.// -->

                    <!-- CARGAR PRODUCTOS ITEMS -->
                    <main class="col-sm-9">
                        <div class="row">
                            <article class="card card-product" style="width: 100%">
                                    <h2>&emsp;Aun no tenemos disponible ningun producto</h2>
                            </article>
                            
                            <article class="card card-product" style="width: 100%">
                                    <div class="card-body">
                                    <div class="row">
                                            <aside class="col-sm-3">
                                                <div class="img-wrap"> <img src="images/avatar-01.png"/> </div>
                                            </aside> <!-- col.// -->
                                            <article class="col-sm-6">
                                                            <h4 class="title"> CAFE  </h4>
                                                            <div class="rating-wrap  mb-2">
                                                                    <div class="label-rating">132 reviews</div>
                                                                    <div class="label-rating">154 orders </div>
                                                            </div> <!-- rating-wrap.// -->
                                                            <p> Lorem ipsum dolor sit amet, consectetuer adipiscing elit, Lorem ipsum dolor sit amet, consectetuer adipiscing elit, Ut wisi enim ad minim veniam </p>
                                                            <dl class="dlist-align">
                                                              <dt>Color</dt>
                                                              <dd>Black and white</dd>
                                                            </dl>  <!-- item-property-hor .// -->
                                                            <dl class="dlist-align">
                                                              <dt>Material</dt>
                                                              <dd>Syntetic, wooden</dd>
                                                            </dl>  <!-- item-property-hor .// -->
                                                            <dl class="dlist-align">
                                                              <dt>Delivery</dt>
                                                              <dd>Russia, USA, and Europe</dd>
                                                            </dl>  <!-- item-property-hor .// -->

                                            </article> <!-- col.// -->
                                            <aside class="col-sm-3 border-left">
                                                    <div class="action-wrap">
                                                            <div class="price-wrap h4">
                                                                    <span class="price"> $56 </span>	
                                                                    <del class="price-old"> $98</del>
                                                            </div> <!-- info-price-detail // -->
                                                            <p class="text-success">Free shipping</p>
                                                            <br>
                                                            <p>
                                                                    <a href="#" class="btn btn-primary"> Buy now </a>
                                                                    <a href="#" class="btn btn-secondary"> Details  </a>
                                                            </p>
                                                            <a href="#"><i class="fa fa-heart"></i> Add to wishlist</a>
                                                    </div> <!-- action-wrap.// -->
                                            </aside> <!-- col.// -->
                                    </div> <!-- row.// -->
                                    </div> <!-- card-body .// -->
                            </article> <!-- card product .// -->
                            
                            
                            
                        </div>
                    </main>
                    <!--  FIN DE CARGAR PRODUCTOS ITEMS -->



                </div>

            </div> <!-- container .//  -->
        </section>
      
      
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendor/bootstrap/js/popper.min.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="js/validacion.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
</html>
