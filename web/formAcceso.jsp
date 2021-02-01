<%-- 
    Document   : formAcceso
    Created on : 28-ene-2021, 13:17:28
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>

        <div class="container">
            <div class="row">

                <div class="formularioAcceso">
                    <form action="inicioSesionController" method="post">
                        <table id="tablaAcceso" border="1">
                            <tr>
                                <th colspan="2">LOGIN</th>

                            </tr>
                            <tr>
                                <td>Nombre: </td>
                                <td><input type="text" id="nombre" name="nombre"></td>
                            </tr>
                            <tr>
                                <td>Contrase&ntilde;a: </td>
                                <td><input type="password" id="password" name="password"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><input type="submit" value="Enviar"></td>

                            </tr>

                        </table>
                    </form>
                </div>
            </div>
        </div>


    </body>
</html>
