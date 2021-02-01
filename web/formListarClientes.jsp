<%-- 
    Document   : formListarClientes
    Created on : 29-ene-2021, 11:33:55
    Author     : migue
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
               <%

            String driver = "com.mysql.jdbc.Driver";
            String connectionURL = "jdbc:mysql://localhost:3306/";
            String database = "carrito";
            String userId = "root";
            String password = "";
            Connection connection = null;
            Statement st = null;
            ResultSet rs = null;

            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e) {
                System.out.println(e.getMessage());
            }
            String nom = request.getParameter("nombre");
            String pass = request.getParameter("password");

            String sql = "SELECT * FROM usuarios WHERE rol='B'";

            try {
                connection = DriverManager.getConnection(connectionURL + database, userId, password);
                st = connection.createStatement();
                rs = st.executeQuery(sql);
                out.print("<div class='tablausuarios'>");
                out.print("<table id='tblData' border='1'>");
                out.print("<tr><th>ID CLIENTE</th><th>NOMBRE</th><th>APELLIDOS</th><th>PASSWORD</th><th>EMAIL</th><th>TEL&Eacute;FONO</th><th>FECHA ACCESO</td>");
                        while (rs.next()) {
                            out.print("<tr><td>" + rs.getInt("id") + "</td><td>" + rs.getString("nombre") + "</td><td>" + rs.getString("apellidos") + "</td><td>" + rs.getString("password")
                            + "</td><td>" + rs.getString("email") + "</td><td>" + rs.getString("telefono") + "</td><td>" + rs.getString("fechaAcceso") + "</td>");

                }
                out.print("</tr>"
                        + "<tr><td colspan='7' align='center'><button><a href='inicioAdmin.jsp'>ACCIONES</a></button></td></tr></table></div>");
                rs.close();
                st.close();
                connection.close();

                // response.sendRedirect("accionesAdministrador.jsp");
            } catch (SQLException e) {
                out.print("No se ha podido insertar datos. " + e.getMessage());
            }
            

        %>
    </body>
</html>
