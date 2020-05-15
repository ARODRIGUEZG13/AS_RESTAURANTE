/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function (){
    
    // FUNCION PARA VALIDACION EN LOGIN----------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------------
    $('#btnLogin').click(function(){
        
        var usuario = document.getElementById("txtUsuario").value;
        var password = document.getElementById("txtPass").value;
        if(usuario===""){
            alert("Ingrese su usuario");
            document.getElementById("txtUsuario").focus();
            return false;
        }else if(password===""){
            alert("Ingrese su contraseña");
            document.getElementById("txtPass").focus();
            return false;
        }else{
        $.ajax({
            url: 'Autenticacion',
            type: 'post',
            data: {txtUsuario:usuario,txtPass:password},
            success: function (r) {
                if(r!==""){
                    if(r==="denegado"){
                        swal("Acceso denegado","Nombre de usuario y/o contraseña incorrectos ...","error");
                    }else if(r==="CJO"){
                        location.href = "MP_Cajero.jsp";
                    }else if(r=="MSO"){
                        location.href = "MP_Mesero.jsp";
                    }else if(r==="RPN"){
                        location.href = "MP_Recepcion.jsp";
                    }else if(r==="ADS"){
                        location.href = "MP_Admin.jsp";
                    }
                }
            }
            
        });
      }
    });
    
    // FUNCION PARA VALIDACION EN CREAR USUARIO--------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------------
    $('#btnRegistrar').click(function () {
        
        var nombres = document.getElementById("txtNombres").value;
        var apellidos = document.getElementById("txtApellidos").value;
        var usuario = document.getElementById("txtUsuario").value;
        var pass = document.getElementById("txtPass").value;
        var pass2 = document.getElementById("txtPass2").value;
        var cargo = document.getElementById("txtCargo").value;
        var admin = document.getElementById("txtAdmin").value;
        
        if(nombres===""){
            alert("Ingrese su nombre");
            document.getElementById("txtNombres").focus();
            return false;
        }else if(apellidos===""){
            alert("Ingrese su apellido");
            document.getElementById("txtApellidos").focus();
            return false;
        }else if(usuario===""){
            alert("Ingrese su usuario");
            document.getElementById("txtUsuario").focus();
            return false;
        }else if(pass===""){
            alert("Ingrese su contraseña");
            document.getElementById("txtPass").focus();
            return false;
        }else if(pass2===""){
            alert("Confirme su contraseña");
            document.getElementById("txtPass2").focus();
            return false;
        }else if(cargo===""){
            alert("Seleccione un cargo");
            document.getElementById("txtCargo").focus();
            return false;
        }else if(admin===""){
            alert("Indique si dara privilegios de administrador");
            document.getElementById("txtAdmin").focus();
            return false;
        }else if(pass!==pass2){
            alert("Las contraseñas no coinciden");
            document.getElementById("txtPass").focus();
            return false;
        }else{
            $.ajax({
                url: 'Registrar',
                type: 'POST',
                data: {txtNombres:nombres,txtApellidos:apellidos,txtUsuario:usuario,txtPass:pass,
                       txtCargo:cargo,txtAdmin:admin},
                success: function(r){
                    if(r==="true"){
                        swal("Listo","El usuario se creo correctamente, ya puede iniciar sesion","success");
                    }else if(r==="false"){
                        swal("Error","No se pudo crear el usuario","error");
                    }
                }
            });
        }
    });
    
    // FUNCION PARA VALIDACION EN Rpn_Mesa_detalle.jsp usuarios para mesa------------------------------------
    //-------------------------------------------------------------------------------------------------------
    $('#btnAsignarMesa').click(function(){
        
        var IdMesa = document.getElementById("txtId_Mesa").value;
        var IdMesero = document.getElementById("txtId_Mesero").value;
        var Estado = document.getElementById("txtEstado").value;
        var Capacidad = document.getElementById("txtCapacidad").value;
        var Saldo = document.getElementById("txtSaldo").value;
        var Cliente = document.getElementById("txtCliente").value;
        
        if(IdMesero===""){
            alert("Debe seleccionar un mesero");
            document.getElementById("txtId_Mesero").focus();
            return false;
        }else if(Cliente===""){
            alert("Debe ingresar el nombre del cliente");
            document.getElementById("txtCliente").focus();
            return false;
        }
        //alert(IdMesa+" "+IdMesero+" "+Estado+" "+Capacidad+" "+Saldo+" "+Cliente);
        $.ajax({
            url: 'Asignar_Mesero',
            type: 'POST',
            data: {txtIdMesa:IdMesa,txtIdMesero:IdMesero,txtEstado:Estado,txtCapacidad:Capacidad,txtSaldo:Saldo,txtCliente:Cliente},
            success: function (r){
                if(r==="true"){
                        swal("Listo","El cliente pude pasar a la mesa","success");
                }else if(r==="false"){
                        swal("Error","No se pudo asignar la mesa","error");
                }
            }
        });
    });
    
    // FUNCION PARA VALIDACION EN MSO_detalle_producto.jsp añadiendo prodcuto al pedido----------------------
    //-------------------------------------------------------------------------------------------------------
    $('#btnMin').click(function (){
        var cantidad = document.getElementById("txtCantidad").value;
        var total = document.getElementById("txtTotal").value;
        var precio = document.getElementById("txtPrecio").value;
        if(parseInt(cantidad)>1){
            cantidad = parseInt(cantidad) - 1;
            total = parseFloat(precio)*cantidad;
            document.getElementById("txtCantidad").value=cantidad;
            document.getElementById("txtTotal").value=total;
        }
    });
    
    $('#btnPlus').click(function (){
        var cantidad = document.getElementById("txtCantidad").value;
        var total = document.getElementById("txtTotal").value;
        var precio = document.getElementById("txtPrecio").value;
        cantidad = parseInt(cantidad)+1;
        total = parseFloat(precio)*cantidad;
        document.getElementById("txtCantidad").value=cantidad;
        document.getElementById("txtTotal").value=total;
    });
    
    $('#btnAñadirPedido').click(function () {
        
        var cantidad = document.getElementById("txtCantidad").value;
        var IdMenu = document.getElementById("txtIdMenu").value;
        alert(IdMenu+" "+cantidad);
        
    });
    
});
