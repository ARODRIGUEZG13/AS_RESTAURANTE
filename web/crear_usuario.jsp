<%-- 
    Document   : index
    Created on : 4/03/2020, 06:34:38 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Inicio de Sesion</title>
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
			<div class="wrap-login100 p-t-10 p-b-230" style="width: 60%;">
				<form class="login100-form validate-form">
					
					<span class="login100-form-title p-t-20 p-b-45">
						REGISTRAR EMPLEADO
					</span>

                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="button" class="btn btn-secondary" style="width: 180px; text-align: left">Nombre completo</button>
                                            </div>
                                            <input type="text" class="form-control" placeholder="Nombres" required>
                                            <input type="text" class="form-control" placeholder="Apellidos" required>
					</div>
                                        <span>&nbsp;</span>
                                        
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="button" class="btn btn-secondary" style="width: 180px;text-align: left">Usuario</button>
                                            </div>
                                            <input type="text" class="form-control" placeholder="Nombre de inicio de sesion" required>
                                        </div>
                                        <span>&nbsp;</span>
                                        
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="button" class="btn btn-secondary" style="width: 180px;text-align: left">Contraseña</button>
                                            </div>
                                            <input type="password" class="form-control" placeholder="Ingrese su contraseña" required>
                                        </div>
                                        <span>&nbsp;</span>
                                        
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="button" class="btn btn-secondary" style="width: 180px;text-align: left">Confirmar </button>
                                            </div>
                                            <input type="password" class="form-control" placeholder="Confirme su contraseña" required>
                                        </div>
                                        <span>&nbsp;</span>
                                        
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                 <button type="button" class="btn btn-secondary" style="width: 180px;text-align: left">Cargo</button>
                                            </div>
                                            <select class="form-control">
                                                <option>hola</option>
                                                <option>hola</option>
                                            </select>
                                        </div>
                                        <span>&nbsp;</span>
                                        
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="button" class="btn btn-secondary" style="width: 180px;text-align: left">Es admin?</button>
                                            </div>
                                            <select class="form-control">
                                                <option>No</option>
                                                <option>Si</option>
                                            </select>
                                        </div>
                                        <span>&nbsp;</span>
                                        
					<div class="container-login100-form-btn p-t-10">
						<button class="login100-form-btn">
							Login
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
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
