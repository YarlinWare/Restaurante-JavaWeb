<%-- 
    Document   : Editarusuarios
    Created on : 23-mar-2020, 20.55.09
    Author     : ASUS
--%>
<%@page import="usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Usuarios | Restaurante</title>

    <!-- Bootstrap -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Fuentes -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

    <!-- Estilos -->
    <link href="css/business-casual.css" rel="stylesheet">

  </head>

  <body>
      <!-- Menu acceso -->
      <nav class="navbar navbar-expand-lg navbar-dark row justify-content-between">
        <a href="index.jsp" class="navbar-brand pl-3 ">
          <img src="img/logo.png" width="auto" height="40" alt="">
        </a>
        <div>
            <a href="cart.jsp"><i class="fa fa-shopping-cart iconosCompra"></i>Cart</a>
        </div>
        <div class="d-flex aling-item-end pr-3 btn-ingreso-registro">
          <a href="login.jsp" class="btn btn-ingreso nav-link text-uppercase text-expanded">Ingresar</a>
          <a href="registro.jsp" class="btn btn-info nav-link text-uppercase text-expanded">Registrar</a>
        </div>
      </nav>
    <!-- Menu acceso -->
    
    <h1 class="site-heading text-center text-white d-none d-lg-block">
      <span class="site-heading-upper text-primary mb-3">Restaurante</span>
      <span class="site-heading-lower">Tus Delicias</span>
    </h1>

    <!-- Navegación -->
    <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
      <div class="container">
        <a class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none" href="index.html">La Caffettiera</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav mx-auto">
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="index.jsp">Inicio</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="menu.jsp">Menu</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="blog.jsp">Blog</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="store.jsp">Visítanos</a>
            </li>
            <!--<li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="contact.html">Contacto</a>
            </li>-->
            <li class="nav-item active px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="admin.jsp">Admin</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Contenido -->
    <div class="container ">
        <div class="pt-5 pb-5 formularioRegistro ">
            <div class="card-header text-center">
                <h2 class="titulo">Información de registro</h2>
            </div>
        <form id="nuevoRegistro" action="ActualizarUsuario" method="POST" enctype="multipart/form-data" target="_blank" class="pt-3 pb-5" >
            <div class="row ">
                <!-- Datos basicos-->			
                <div class="col-sm-12 col-md-6">
                    <div class="form-group">
                        <label for="numero_usuario">#Usuario</label>
                        <input type="text" value="<%= ((Usuario)session.getAttribute("usuario")).getId()%>" class="form-control" id="txtId" name="txtId" placeholder="Nuemro usuario">
                    </div>
                    <div class="form-group">
                        <label for="numero_perfil">#Perfil</label>
                        <input type="text" value="<%= ((Usuario)session.getAttribute("usuario")).getIdPerfil()%>" class="form-control" id="txtId" name="txtPerfil" placeholder="Nuemro Perfil">
                    </div>
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" value="<%= ((Usuario)session.getAttribute("usuario")).getNombre() %>" class="form-control" id="txtNombre" name="txtNombre" placeholder="Nombre" z>
                    </div>
                    <div class="form-group ">
                        <label for="apellido">Apellido</label>
                        <input type="text" value="<%= ((Usuario)session.getAttribute("usuario")).getApellido()%>" class="form-control" id="txtApellido" name="txtApellido" placeholder="Apellido">
                    </div>
                    
                </div>
                <!-- ./Datos basicos-->

                <!-- Información médica-->
                <div class="col-sm-12 col-md-6">
                    <div class="form-group ">
                        <label for="email">Correo</label>
                        <input type="email" value="<%= ((Usuario)session.getAttribute("usuario")).getCorreo()%>" class="form-control"  id="txtCorreo" name="txtCorreo" placeholder="ejemplo@restaurante.com">
                    </div>
                    <div class="form-group ">
                        <label for="celphone">Celular</label>
                        <input type="number" value="<%= ((Usuario)session.getAttribute("usuario")).getCelular()%>" class="form-control" id="txtCelular" name="txtCelular" placeholder="300-987 65 43">
                    </div>
                    <div class="form-group ">
                        <label for="password">Password</label>
                        <input type="password" value="<%= ((Usuario)session.getAttribute("usuario")).getPassword()%>" class="form-control" id="txtPassword" name="txtPassword" placeholder="*******">
                    </div>				
                </div> 
            </div>
            <input type="button" value="Aceptar" class="btn btn-info btn-lg btn-block" onclick="submit();">  
        </form>
        </div>
        <td colspan="5" class="links"><a href="registro.jsp">Agregar</a></td>
        
    </div>
    <!-- ./Contenido -->

    <!-- Pié de página -->
    <footer class="footer text-faded text-center py-5">
      <div class="container">
        <p class="m-0">
	        <a href="#" class="link">
	          <span class="fa-stack fa-lg">
	            <i class="fa fa-circle fa-stack-2x"></i>
	            <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
	          </span>
	        </a>
	        <a href="#" class="link">
	          <span class="fa-stack fa-lg">
	            <i class="fa fa-circle fa-stack-2x"></i>
	            <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
	          </span>
	        </a>
	        <a href="#" class="link">
	          <span class="fa-stack fa-lg">
	            <i class="fa fa-circle fa-stack-2x"></i>
	            <i class="fa fa-instagram fa-stack-1x fa-inverse"></i>
	          </span>
	        </a>
	    </p>
        <p class="m-0 mbt">
        	<a href="sample.html" class="link">Política de privacidad</a> ·
        	<a href="sample.html" class="link">Aviso legal</a> ·
        	<a href="sample.html" class="link">Cookies</a>
		</p>
        <p class="m-0 mbt1">&copy; Las Delicias 2020</p>
      </div>
	</footer>

    <!-- Bootstrap -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
