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
        
    });
    
});
