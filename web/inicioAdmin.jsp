<%@include file="header.jsp" %>
        <div class="formularioLogin">
            <form name="accionesAdmin" method="post">
                <table class="tablacceso" border="1">
                    <tr><th colspan="6" style="text-align:center">Administrador (Acciones)</th></tr>
                    <tr>
                        <td><input type="button" value="Nuevo art&iacute;culo" onclick="altaArticulo();" name="nArticulo" id="nArticulo"></td>
                        <td><input type="button" value="Listar productos" onclick="listarVentas();" name="lVentas"  id="lVentas"></td>
                        <td><input type="button" value="Listar clientes" onclick="listarClientes();" name="lUsuarios"  id="lUsuarios"></td>
                        <td><input type="button" value="Actualizar art&iacute;culo" onclick="actualizarProducto();" name="salir" id="salir"></td>
                        <td><input type="button" value="Salir" onclick="salida();" name="salir" id="salir"></td>
                    </tr>
                </table>
            </form>
        </div>
    
</body>
</html>