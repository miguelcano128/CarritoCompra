<%-- 
    Document   : formUpdateProducto
    Created on : 29-ene-2021, 11:59:27
    Author     : migue
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
        <%
            Connection conn;
            Conexion cn = new Conexion();
            Statement st;
            ResultSet rs;
            String url = "jdbc:mysql://localhost:3306/carrito";
            String user = "root";
            String pass = "";
            String id = request.getParameter("id");
            String sql = "SELECT * FROM producto WHERE idProducto=" + id;
            //out.print("ID= " + id);
            try {
                conn = cn.getConection();
                conn = DriverManager.getConnection(url, user, pass);
                st = conn.createStatement();
                rs = st.executeQuery(sql);
                out.print("<div class='tablaupdate'>");
                while (rs.next()) {
                    out.print("<table border='1' style='margin:auto;padding:15px;'>");
                    out.print("<form action='editarProductoController?id='"+id+"'>");
                    out.print("<tr><td>ID</td><td><input type='text' readonly value='" + rs.getString("idProducto") + "' name='id'></td></tr>");
                    out.print("<tr><td>NOMBRE</td><td><input type='text' value='" + rs.getString("nombre") + "' name='nombre'></td></tr>");
                    
                    out.print("<tr><td>IMAGEN</td><td><input type='text'"
                            + "value='" +rs.getString("foto")+"' name='foto'></td></tr>");
                    
                    out.print("<tr><td>DESCRIPCION</td><td><input type='text' value='" + rs.getString("descripcion") + "' name='descripcion'></td></tr>");
                    out.print("<tr><td>PRECIO</td><td><input type='text' value='" + rs.getDouble("precio") + "' name='precio'></td></tr>");
                    out.print("<tr><td>STOCK</td><td><input type='text' value='" + rs.getInt("stock") + "' name='stock'></td></tr>");
                    out.print("<tr><td>DESCUENTO</td><td><input type='text' value='" + rs.getDouble("descuento") + "' name='descuento'></td></tr>");
                    out.print("<tr><td align='center' colspan='2'><input type='submit' value='Enviar'></td></tr>");
                    out.print("</form>");
                    out.print("</table>");
                }
                out.print("</div>");
                rs.close();
                st.close();
                conn.close();
            } catch (Exception e) {
            }
        %>
    </body>
</html>
