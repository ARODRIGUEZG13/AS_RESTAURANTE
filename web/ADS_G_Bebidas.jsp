<%-- 
    Document   : ADS_G_Bebidas
    Created on : 20/05/2020, 11:56:49 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>  
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">      
        <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <!--===============================================================================================-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
    </head>  
    <body style="background: darkgray">
        <canvas id="grafo1"></canvas>
    </body>
    
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="vendor/bootstrap/js/popper.min.js" type="text/javascript"></script>
    <script src="vendor/bootstrap/js/sweetalert.min.js" type="text/javascript"></script>
    <script src="js/validacion.js" type="text/javascript"></script>
    <script src="vendor/bootstrap/js/popper.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    
    <script> 
        var categoria = "B";
        $.ajax({
            url: 'Menu_Estadistica',
            type: 'POST',
            data: {txtCategoria:categoria},
            success: function (r) {
                if(r.length>0){
                    
                    var dato = r.split("|");
                    var ctx = document.getElementById("grafo1");
                    var ctx = document.getElementById("grafo1").getContext("2d");
                    var grafo1 = new Chart(ctx,{
                        type: "polarArea", //doughnut
                        data:{
                            labels:['CAFE NEGRO','GASEOSAS','JUGO DE NARANJA','LIMONADA'],
                            datasets: [{
                                    label: 'DATOS',
                                    data:[dato[0],dato[1],dato[2],dato[3]],
                                    backgroundColor:[
                                        'rgb(153, 204, 255,0.8)',
                                        'rgb(255, 255, 102,0.8)', 
                                        'rgb(255, 153, 153,0.8)',
                                        'rgb(102, 255, 204,0.8)'
                                    ]
                            }]
                        },
                        options:{
                            scales: {
                                yAxes: [{
                                        ticks:{
                                            beginAtZaero:true
                                        }
                                }]
                            }
                        }
                    });
            
            
            
                }else{
                        
                    }   
            }
        });
    </script>
    
</html>
