<%-- 
    Document   : carrito
    Created on : 25-ene-2021, 17:39:40
    Author     : migue
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--        <meta http-equiv="refresh" content="0">-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/stayle.css" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">KLHAM</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Controlador?accion=home">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Ofertas del d&iacute;a</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Controlador?accion=home">Volver a la tienda</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Iniciar sesi&oacute;n
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>

                </ul>

            </div>
        </nav>

        <div class="container mt-4">
            <h3>Carrito</h3><br>
            <div class="row" style="margin-right: -97px;">
                <div class="col-sm-8">
                    <table class="table table-hover text-center">
                        <thead style="background-color: #bde4ee;">
                            <tr>
                                <th>ITEM</th>
                                <th>NOMBRE</th>
                                <th>IMAGEN</th>
                                <th>PRECIO</th>
                                <th>CANTIDAD</th>
                                <th>SUBTOTAL</th>
                                <th>ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="car" items="${carrito}">
                                <tr>
                                    <td>${car.getItem()}</td>
                                    <td>${car.getNombre()}</td>
                                    <td><img src="${car.getImagen()}" width="200" height="70"></td>
                                    <td>${car.getPrecioCompra()}</td>
                                    <td>

                               
                                        <form action="Controlador?accion=5" method="post" name="envnumber">  
                                            <input type="number" min="1" id="cantidad" name="cantidad" value="${car.getCantidad()}" class="form-control text-center">
                                      
                                        </form>
                                    
                                    </td>
                                    <td>${car.getSubTotal()}</td>
                                    <td> 
                                        <a title="Eliminar" href="Controlador?accion=4&idproducto=${car.getIdProducto()}"><i style="color:red;" class="fa fa-trash"></i></a>
                                        <a title="Actualizar" href="Controlador?accion=5&idp=${car.getIdProducto()}&cantidad=${car.getCantidad()}" value="${car.getCantidad()}"><i class="fa fa-retweet"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>


                        </tbody>
                    </table>
                </div>
                <div class="col-sm-3" style="float: right">
                    <div class="card">
                        <div class="card-header"> 
                            <h3>Generar compra</h3>
                        </div>

                        <div class="card-body">
                            <label>Subtotal</label>
                            <input type="text" value="${totalPago} &euro;" readonly="" class="form-control">
                            <label>Descuento</label>
                            <input type="text" value="0.0 &euro;"  readonly="" class="form-control">
                            <label>Total a pagar</label>
                            <input type="text" value="${totalPago} &euro;" readonly="" class="form-control">

                        </div>
                        <div class="card-footer">
                            <a class="btn btn-info btn-block" href="">Realizar pago</a>
                            <a class="btn btn-danger btn-block" href="">Ver tus compras</a>                        
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script>
//            $(document).ready(function(){
//   $("tr #elim").click(function(){
//      var idp = $(this).parent().find("#idp").val();
//      eliminar(idp);
//   }); 
//   function eliminar(idp){
//       var url = "Controlador?accion=4";
//       $.ajax()({
//           type: "`POST",
//           url: url,
//           data: "idp=" + idp,
//           success: function(data, textStatus, jqXHR){
//               alert("Registro eliminado!");
//           }
//           
//       });
//   }
//   $("tr #cantidad").click(function(){
//       var idp = $(this).parent().find("#idProd").val();
//       var cantidad = $(this).parent().find("#cantidad").val();
//       var url = "Controlador?accion=5";
//       $.ajax({
//           type: "POST",
//           url: url,
//           data: "idp=" + idp + "&cantidad= " + cantidad,
//           success: function(data, textStatus, jqXHR){
//               
//           }
//       });
//   });
//   
//});
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!--        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->

    </body>
</html>
