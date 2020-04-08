/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function (){
    
    $('#btnLogin').click(function(){
        
        var usuario = document.getElementById("txtUsuario").value;
        var password = document.getElementById("txtPass").value;
        $.ajax({
            
            url: 'Autenticacion',
            type: 'post',
            data: {txtUsuario:usuario,txtPass:password},
            success: function (r) {
                if(r!==""){
                    if(r==="denegado"){
                        swal("Acceso denegado","Nombre de usuario y/o contraseña incorrectos ...","error");
                    }else{
                        swal("Acceso correcto","Bienvenido "+r,"success");
                    }
                }
            }
            
        });
        
    });
    
});
