<%-- 
    Document   : index
    Created on : 4/03/2020, 06:34:38 PM
    Author     : Alex
--%>

<%@page import="Estructuras.CARGO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consultas.Listas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Registrar usuario</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-20 p-b-30" style="width: 60%;">
				<form class="login100-form validate-form">
					
					<span class="login100-form-title p-t-20 p-b-45">
						REGISTRAR USUARIO
					</span>

                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="button" class="btn btn-secondary" style="width: 180px; text-align: left">Nombre completo</button>
                                            </div>
                                            <input type="text" class="form-control" placeholder="Nombres" required id="txtNombres">
                                            <input type="text" class="form-control" placeholder="Apellidos" required id="txtApellidos">
					</div>
                                        <span>&nbsp;</span>
                                        
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="button" class="btn btn-secondary" style="width: 180px;text-align: left">Usuario</button>
                                            </div>
                                            <input type="text" class="form-control" placeholder="Nombre de inicio de sesion" required id="txtUsuario">
                                        </div>
                                        <span>&nbsp;</span>
                                        
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="button" class="btn btn-secondary" style="width: 180px;text-align: left">Contraseña</button>
                                            </div>
                                            <input type="password" class="form-control" placeholder="Ingrese su contraseña" required id="txtPass">
                                        </div>
                                        <span>&nbsp;</span>
                                        
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="button" class="btn btn-secondary" style="width: 180px;text-align: left">Confirmar </button>
                                            </div>
                                            <input type="password" class="form-control" placeholder="Confirme su contraseña" required id="txtPass2">
                                        </div>
                                        <span>&nbsp;</span>
                                        
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                 <button type="button" class="btn btn-secondary" style="width: 180px;text-align: left">Cargo</button>
                                            </div>
                                           <%
                                            Listas lista = new Listas();
                                            ArrayList<CARGO> vc = lista.ListaCargo();
                                            %>
                                            <select class="form-control" id="txtCargo">
                                                <option selected value="">Seleccione el cargo a desempeñar</option>
                                                <%for (CARGO c : vc){%>
                                                <option value="<%=c.getID_CARGO()%>"><%=c.getNOMBRE()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <span>&nbsp;</span>
                                        
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="button" class="btn btn-secondary" style="width: 180px;text-align: left">Privilegios</button>
                                            </div>
                                            <select class="form-control" id="txtAdmin">
                                                <option selected value="">Conceda privilegios de administrador</option>
                                                <option value="1">Si</option>
                                                <option value="0">No</option>
                                            </select>
                                        </div>
                                        <span>&nbsp;</span>
                                        
					<div class="container-login100-form-btn p-t-10">
                                            <button  type="button" class="login100-form-btn" style="width: 30%" id="btnRegistrar">
							Registrar
                                            </button>
					</div>

					<div class="text-center w-full p-t-25 p-b-230">
                                            <a href="login.jsp" class="txt1">
							Ir a inicio
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendor/bootstrap/js/popper.min.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="js/validacion.js" type="text/javascript"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
