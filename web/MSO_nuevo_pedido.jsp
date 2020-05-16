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
    
    String categoria = (String) request.getParameter("categoria");
    String IdMesa = (String)request.getParameter("IdMesa");
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

                                            <li><a href="MSO_nuevo_pedido.jsp?IdMesa=<%out.print(IdMesa);%>">Todos <span class="float-right badge badge-light round"></span> </a></li>
                                            <li><a href="MSO_nuevo_pedido.jsp?IdMesa=<%out.print(IdMesa);%>&categoria=C">Combos <span class="float-right badge badge-light round"></span> </a></li>
                                            <li><a href="MSO_nuevo_pedido.jsp?IdMesa=<%out.print(IdMesa);%>&categoria=B">Bebidas<span class="float-right badge badge-light round"></span>  </a></li>
                                            <li><a href="MSO_nuevo_pedido.jsp?IdMesa=<%out.print(IdMesa);%>&categoria=P">Postres<span class="float-right badge badge-light round"></span>  </a></li>
                                            <li><a href="MSO_nuevo_pedido.jsp?IdMesa=<%out.print(IdMesa);%>&categoria=CM">Complementos<span class="float-right badge badge-light round"></span>  </a></li>
                                        </ul>  
                                    </div> <!-- card-body.// -->
                                </div> <!-- collapse .// -->
                            </article> <!-- card-group-item.// -->
                        </div> <!-- card.// -->
                    </aside> <!-- col.// -->

                    <!-- CARGAR PRODUCTOS ITEMS -->
                    <main class="col-sm-9">
                        <div class="row">
                           
                            <%if((String) request.getParameter("categoria")==null){
                                out.print(new CodigoHTML().getMenus(IdMesa));
                            }else if("C".equals((String) request.getParameter("categoria"))){
                                out.print(new CodigoHTML().getMenusPorCategoria(IdMesa,"C"));    
                            }else if("B".equals((String) request.getParameter("categoria"))){
                                out.print(new CodigoHTML().getMenusPorCategoria(IdMesa,"B"));
                            }else if("P".equals((String) request.getParameter("categoria"))){  
                                out.print(new CodigoHTML().getMenusPorCategoria(IdMesa,"P"));
                            }else if("CM".equals((String) request.getParameter("categoria"))){  
                                out.print(new CodigoHTML().getMenusPorCategoria(IdMesa,"CM"));
                            }%>
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
