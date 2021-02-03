<%-- 
    Document   : index
    Created on : 25-ene-2021, 17:27:06
    Author     : migue
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <%@include file="header.jsp"%>
 <h1>HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH</h1>
        <div class="container mt.2">
            <div class="row">
                <c:forEach var="p" items="${productos}">
                                    <div class="col-sm-4">
                    <div class="card">

                        <div class="card-header">
                            <h6>${p.getNombre()}</h6>
                        </div>  
                        <div class="card-body">
                            <i>${p.getPrecio()} &euro;</i>
                            <img src="${p.getFoto()}" width="200" height="180">
                        </div>  
                        <div class="card-footer text-center">
                            <label>${p.getDescripcion()}</label>
                            
                            <a class="btn btn-outline-info" href="Controlador?accion=2&id=${p.getId()}">A&ntilde;adir al carrito <i class="fa fa-cart-arrow-down"></i></a>
                            <a class="btn btn-danger" href="Controlador?accion=1&id=${p.getId()}">Comprar</a>
                        </div>  
                    </div>

                </div>
                </c:forEach>


            </div>

        </div>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
