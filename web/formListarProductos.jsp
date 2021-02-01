<%-- 
    Document   : formListarProductos
    Created on : 29-ene-2021, 11:13:50
    Author     : migue
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<%                   String driver = "com.mysql.jdbc.Driver";
    String connectionURL = "jdbc:mysql://localhost:3306/";
    String database = "carrito";
    String userId = "root";
    String password = "";
    Connection conn;
    Statement st;
    ResultSet rs;

    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        System.out.println(e.getMessage());
    }
    String nom = request.getParameter("nombre");
    String pass = request.getParameter("password");

    String sql = "SELECT * FROM producto";

    try {
        conn = DriverManager.getConnection(connectionURL + database, userId, password);
        st = conn.createStatement();
        rs = st.executeQuery(sql);
        out.print("<div class='tablaproductos'>");
        out.print("<table id='tblData' border='1'>");
        out.print("<tr><th>ID PRODUCTO</th><th>NOMBRE</th><th>IMAGEN</th><th>DESCRIPCI&Oacute;N</th><th>PRECIO</th><th>STOCK</th><th colspan='2'>ACCIONES</th>");
        while (rs.next()) {
            out.print("<tr><td>" + rs.getInt("idProducto") + "</td><td>" + rs.getString("nombre") + "</td><td>"
                    + "<img style='padding:12px;' width='180' height='80' src='http://localhost:8080/CarritoCompras/imgs/" + rs.getString("foto")
                    + "'></td><td>"
                    + rs.getString("descripcion")
                    + "</td><td>" + rs.getDouble("precioConDescuento") + "</td><td>" + rs.getInt("stock") + "</td><td><a href='formUpdateProducto.jsp?id=" + rs.getInt("idProducto") + "'><i class='fa fa-edit'></i><a></td><td><a style='color:red' href='deleteProductoController?id=" + rs.getInt("idProducto") + "'><i class='fa fa-trash'></i><a></td>");

        }
        out.print("</tr>"
                + "<tr><td colspan='8' align='center'><button><a href='inicioAdmin.jsp'>ACCIONES</a></button></td></tr></table></div>");
        rs.close();
        st.close();
        conn.close();

        
    } catch (SQLException e) {
        out.print("No se ha podido insertar datos. " + e.getMessage());
    }


%>
</body>
</html>
