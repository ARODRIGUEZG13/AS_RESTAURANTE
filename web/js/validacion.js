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
                        location.href = "CJO_Seleccion_Caja.jsp";
                    }else if(r=="MSO"){
                        location.href = "MP_Mesero.jsp";
                    }else if(r==="RPN"){
                        location.href = "MP_Recepcion.jsp";
                    }else if(r==="ADS"){
                        location.href = "MP_Admin.jsp";
                    }else if(r==="CNO"){
                        location.href = "MP_Cocinero.jsp";
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
        var IdMesa = document.getElementById("txtIdMesa").value;
        var cantidad = document.getElementById("txtCantidad").value;
        var IdMenu = document.getElementById("txtIdMenu").value;
        if(cantidad===""){
            alert("no hay cantidad");
            return false;
        }else if(IdMenu===""){
            alert("no hay menu");
            return false;
        }
        
        $.ajax({
            url: 'Add',
            type: 'POST',
            data: {txtIdMenu:IdMenu,txtCantidad:cantidad},
            success: function (r) {
                location.href = "MSO_Pedido.jsp?IdMesa="+IdMesa;
            }
        });  
    });
    
    // FUNCION PARA VALIDACION EN MSO_pedido.jsp crear el pedido---------------------------------------------
    //-------------------------------------------------------------------------------------------------------
    $('#btnTerminarPedido').click(function(){
        
        var IdMesa = document.getElementById("txtIdMesa").value;
        var IdMesero = document.getElementById("txtIdMesero").value;
        
        swal({
              title: "Esta seguro de terminar el pedido?",
              text: "Al finalizar el pedido no podra modificarlo ...",
              icon: "warning",
              buttons: true,
              dangerMode: true
            })
            .then((willDelete) => {
              if (willDelete) {
                $.ajax({
                    url: 'Crear_pedido',
                    type: 'POST',
                    data: {txtIdMesa:IdMesa,txtIdMesero:IdMesero},
                    success: function (r) {
                        if(r!==null){
                        if(r==="true"){
                            swal("Su pedido fue enviado a cocina", {
                            icon: "success"
                            });
                        }else if(r==="false"){
                            swal("No fue posible crear el pedido", {
                            icon: "error"
                            });
                            }
                        }else{
                            swal("devolvio null", {
                            icon: "error"
                            });
                            }
                        }
                });  
              } else {
                swal("Puedes seguir modificando el pedido ...");
              }
            });
    });
    
    // FUNCION PARA VALIDACION EN CNO_Despachar.jsp Despachando pedidos -------------------------------------
    //-------------------------------------------------------------------------------------------------------
    
    $('#btnDespacharPedido').click(function (){
        
        var IdPedido = document.getElementById("txtIdPedido").value;
        $.ajax({
            url: 'Despachar_pedido',
            type: 'POST',
            data: {txtIdPedido:IdPedido},
            success: function (r) {
                if(r==="true"){
                    location.href="MP_Cocinero.jsp?action=true";
                }else if(r==="false"){
                    swal("Error","No se pudo despachar ...","error");
                }
            }
        });
    });
    
    // FUNCION PARA VALIDACION EN CJO_Seleccion_Caja.jsp Despachando pedidos -------------------------------------
    //-------------------------------------------------------------------------------------------------------
    $('#btnConsultaSaldo').click(function(){
        
        var IdCaja = document.getElementById("txtIdCaja").value;
        if(IdCaja===""){
            alert("Debe seleccionar una caja");
            return false;
        }else{
            
            $.ajax({
                url: 'Saldo_Caja',
                type: 'POST',
                data: {txtIdCaja:IdCaja},
                success: function (r) {
                    if(r!==""){
                        document.getElementById("txtSaldoCaja").value=r;
                    }
                }
            });
            
        }
        
        
    });
    
    $('#btnAbrirTurno').click(function (){
        
        var IdCaja = document.getElementById("txtIdCaja").value;
        var IdCajero = document.getElementById("txtIdCajero").value;
        //alert(IdCaja+" "+IdCajero);
        if(IdCaja===""){
            alert("Debe seleccionar una caja");
            return false;
        }else{
            
            $.ajax({
                url: 'actulizar_us_caja',
                type: 'POST',
                data: {txtIdCaja:IdCaja,txtIdCajero:IdCajero},
                success: function (r) {
                    if(r==="true"){
                        location.href = "MP_Cajero.jsp?IdCaja="+IdCaja+"&tc=vco";
                    }else if (r==="false"){
                        swal("Error","No se pudo abrir el turno ...","error");
                    }
                }
            });
            
        }
        
    });
    
    // FUNCION PARA VALIDACION EN MP_Cajero.jsp Cerrando turno  ---------------------------------------------
    //-------------------------------------------------------------------------------------------------------
    $('#btnCerrarTurno').click(function (){
        
        var SaldoInicial = document.getElementById("txtSaldoInicial").value;
        var SaldoDia = document.getElementById("txtSaldoDia").value;
        var SaldoFinal = document.getElementById("txtSaldoFinal").value;
        var IdCaja = document.getElementById("txtIdCaja").value;
        var IdCajero = document.getElementById("txtIdCajero").value;
        
        swal({
              title: "Esta seguro de cerrar el turno?",
              text: "El saldo final es: Q."+SaldoFinal+" \nAl cerrar turno, tambien se cerrara la sesion.",
              icon: "warning",
              buttons: true,
              dangerMode: true
            })
            .then((willDelete) => {
              if (willDelete) {
                $.ajax({
                    url: 'Cerrar_turno',
                    type: 'POST',
                    data: {txtIdCaja:IdCaja,txtIdCajero:IdCajero,txtSaldoInicial:SaldoInicial,txtSaldoFinal:SaldoFinal},
                    success: function (r) {
                        
                        if(r==="true"){
                            location.href = "login.jsp?cerrar=true"
                        }else if(r==="pendientes"){
                            swal("Error","Aun hay pedidos pendientes de cobro","error");
                        }else if(r==="false"){
                            swal("Error","Algo salio mal","error");
                        }

                    }
                }); 
              } else {
                swal("Puedes seguir cobrando ...");
              }
            });
        
    });

    // FUNCION PARA VALIDACION EN CJO_Cobrar_pedido.jsp Formas de pago  -------------------------------------
    //-------------------------------------------------------------------------------------------------------
    
    $('#btnEfectivo').click(function(){
        
        document.getElementById("btnEfectivo").checked = true;
        document.getElementById("btnTarjeta").checked = false;
        
    });
    
    $('#btnTarjeta').click(function(){
        
        document.getElementById("btnEfectivo").checked = false;
        document.getElementById("btnTarjeta").checked = true;
        
    });
    
    $('#btnCrearFactura').click(function(){
        
        var IdCaja = document.getElementById("txtIdCaja").value;
        var IdCajero = document.getElementById("txtIdCajero").value;
        var IdMesero = document.getElementById("txtIdMesero").value;
        var IdPedido = document.getElementById("txtIdPedido").value;
        var Fpago = "";
        var total = document.getElementById("txtTotal").value; 
        var NIT = document.getElementById("txtNIT").value;
        var cliente = document.getElementById("txtCliente").value;
        var direccion = document.getElementById("txtDireccion").value;
        
        if(document.getElementById("btnEfectivo").checked){
            Fpago = "EF";
        }else if(document.getElementById("btnTarjeta").checked){
            Fpago = "TC";
        }else if(!document.getElementById("btnEfectivo").checked&&!document.getElementById("btnTarjeta").checked){
            alert("Debe seleccionar una forma de pago ..");
            return false;
        }
        if(NIT===""||direccion===""||cliente===""){
            alert("Complete los datos para la facturacion.");
            return false;
        }

        $.ajax({
            url: 'Nueva_Factura',
            type: 'POST',
            data: {txtIdCaja:IdCaja,txtIdCajero:IdCajero,txtIdMesero:IdMesero,
                   txtIdPedido:IdPedido,txtForma:Fpago,txtNIT:NIT,
                   txtCliente:cliente,txtDireccion:direccion,txtTotal:total},
            success: function (r) {
                if(r==="true"){
                    location.href="CJO_imprimir_factura.jsp?IdCaja="+IdCaja+"&IdPedido="+IdPedido+"&fc=ys";
                }else{
                    swal("Error","No se ha podido crear la factura","error");
                }
                  //alert(r);
            }
        });
        
    });
    
    $('#btnBuscarCliente').click(function(){
        
        var NIT = document.getElementById("txtNIT").value;
        if(NIT===""){
            alert("Ingrese NIT");
            return false;
        }else{
            $.ajax({
                url: 'buscar_cliente',
                type: 'POST',
                data: {txtNIT:NIT},
                success: function (r) {
                    
                    if(r.length>0){
                        //alert(r);
                        var dato = r.split("|");
                        var nombre = dato[0];
                        var direccion = dato[1];
                        $("#txtCliente").val(nombre);
                        $("#txtDireccion").val(direccion);                   
                    }else{
                        $("#txtCliente").val("");
                        $("#txtDireccion").val("");
                        swal("No se encontro ...","El NIT aun no esta en la base de datos","warning");
                    }   
                }
            });
        }
    });
    
    // FUNCION PARA DESOCUPAR MESA EN RPN_Mesa_detalle.jsp   ------------------------------------------------
    //-------------------------------------------------------------------------------------------------------
    
    $('#btnDesocuparMesa').click(function (){
        
        var IdMesa = document.getElementById("txtId_Mesa").value;
        $.ajax({
            url: 'Desocupar_Mesa',
            type: 'POST',
            data: {txtIdMesa:IdMesa},
            success: function (r) {
                if(r==="true"){
                    location.href = "Rpn_Mesa_detalle.jsp?id="+IdMesa;
                }else if(r==="false"){
                    swal("Error","Nose pudo desocupar la mesa","error");
                }
            }
        });
        
    });
    
    //--------------------------------------------------------------------------------------------------
    // BOTONOES QUE ACTIVAN REPORTES
    //--------------------------------------------------------------------------------------------------
    $('#btnRptUsuarios').click(function (){
         window.open('RptUsuarios.jsp','_blank');
    });
    
    $('#btnRptCaja').click(function (){
         window.open('RptCaja_registros.jsp','_blank');
    });
    
    $('#btnGrafo1').click(function (){
         window.open('ADS_G_Combos.jsp','_blank');
    });
    
    $('#btnGrafo2').click(function (){
         window.open('ADS_G_Bebidas.jsp','_blank');
    });
    
    $('#btnGrafo3').click(function (){
         window.open('ADS_G_Postres.jsp','_blank');
    });
    
});
