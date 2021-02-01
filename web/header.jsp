<%@page session="true"%>
<%
    HttpSession sesion = request.getSession();
    String nombre1 = (String) sesion.getAttribute("nombre");
    sesion.setAttribute("nombreUser", nombre1);
    String nombreEmp = (String) sesion.getAttribute("nombreUser");

%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/stayle.css" type="text/css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        function altaArticulo() {
            document.getElementById("nArticulo");
            window.location = "formAltaArticulo.jsp";
        }
        function listarVentas() {
            document.getElementById("lVentas");
            window.location = "formListarProductos.jsp";
        }
        function listarClientes() {
            document.getElementById("lUsuarios");
            window.location = "formListarClientes.jsp";
        }
        function actualizarProducto() {
            document.getElementById("lUsuarios");
            window.location = "formListarProductos.jsp";
        }

        function salida() {
            document.getElementById("salir");
            window.location = "index.jsp";
        }
    </script> 
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
                    <a class="nav-link" href="Controlador?accion=home">Tienda<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Ofertas del d&iacute;a</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="Controlador?accion=3"><i class="fa fa-cart-plus"></i> (<label style="color: orange;"> ${contador}</label>) Carrito</a>
                </li>
            </ul>
            <form class="form-inline">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
    <%        if (nombre1 == null) {
        %>
                    <a id="formacc" href="formAcceso.jsp">Iniciar sesi&oacute;n</a><span id="formaccsp"> | </span><a id="formregistro" href="formRegistro.jsp">Registrarse</a>
                    <%        } else {
                    %>
                    <a id="formacc" href="formAcceso.jsp">Bienvenido <%= nombreEmp%></a><span id="formaccsp"> | </span><a style="color: #FFF" href="outController">Salir</a>
                    <%   }%> 

                </li>

            </ul>

        </div>
    </nav>