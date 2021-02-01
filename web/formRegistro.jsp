<%-- 
    Document   : formRegistro
    Created on : 13-ene-2021, 11:55:52
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <div class="formularioAcceso">
        <center>
            <form action="formRegistroController" enctype="multipart/form-data" method="GET">
                <table border="1" id="tablaAcceso">
                    <tr><th colspan="2">REGISTRO DE CLIENTE</th></tr>
                    <tr><td>Nombre: </td><td><input type="text" name="nombre"></td></tr>               
                    <tr><td>Apellidos: </td><td><input type="text" name="apellidos"></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password"></td></tr>
                    <tr><td>Email: </td><td><input type="text" name="email"></td></tr>
                    <tr><td>Tel&eacute;fono: </td><td><input type="text" name="telefono"></td></tr>
                    <tr><td><input type="hidden" value="B"  name="rol"></td></tr>
                    <tr><td colspan="2" align="center"><input type="submit" value="Insertar"></td></tr>
                </table> 
            </form>
        </center>
    </div>
</body>
</html>
