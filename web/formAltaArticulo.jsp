<%@include file="header.jsp" %>
        <div class="formularioLogin">
            <form action="altaArticulosController" method="get" enctype="multipart/form-data">
                <table border="1" class="tablaacceso">
                <tr><th colspan="2">Nuevo art&iacute;culo</th></tr>
                <tr><td>Nombre: </td><td><input type="text" name="nombre"></td></tr>
                
                <tr><td>Descripci&oacute;n: </td><td><textarea cols="23" rows="6" name="descripcion"></textarea></td></tr>
                <tr><td>Precio: </td><td><input type="text" name="precio"></td></tr>
                <tr><td>Foto: </td><td><input type="file" name="archivo" /></td></tr>
                
                <tr><td>Cantidad: </td><td><input type="text" name="cantidad"></td></tr>
                <tr><td><button><a href="inicioAdmin.jsp">Acciones</a></button></td><td align="center"><input type="submit" value="Insertar"></td></tr>
            </table> 
        </form>
            </div>
         
    </body>
</html>
