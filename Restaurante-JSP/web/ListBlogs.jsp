<%-- 
    Document   : ListBlogs
    Created on : 1-apr-2020, 21.25.15
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBBlog"%>
<%@page import="logica.blog.Blog"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Blog | Restaurante</title>

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
            <li class="nav-item active px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="blog.jsp">Blog</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="store.jsp">Visítanos</a>
            </li>
            <!--<li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="contact.html">Contacto</a>
            </li>-->
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="admin.jsp">Admin</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="camarero.jsp">Camarero</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>


    <div class="container">
        <%  
            DBBlog dbr = new DBBlog();
            ResultSet blog = dbr.getBlog(); 
        %>
        
        <section  class="row"> 
            <form  method="post"  action="BlogServlet">
            <% while (blog.next()){ %>
            <div class="page-section cta">
                <div class="container">
                  <div class="row">
                    <div class="col-xl-9 mx-auto">
                      <div class="cta-innerv text-center rounded">
                        <h2 class="section-heading mb-5">
                          <span class="section-heading-upper" id="fecha" name="fecha"></span>
                          <span class="section-heading-lower" id="titulo" name="titulo"><%= blog.getString("titulo") %></span>
                        </h2>
                        <p class="mb-0">
                          <img class="mx-auto d-flex rounded img-fluid mb-3 mb-lg-0" id="imagen" name="imagen" src="<%= blog.getString("imagen") %>" alt="">
                        </p>
                        <p class="mb-0 mbt text-left"  id="contenido" name="contenido"><%= blog.getString("contenido") %></p>
                        <p class="mb-0 mbt">
                          <span class="section-heading-under">Publicado por <em><b>Admin</b></em> en <em><a href="#" class="link">General</a></em></span>
                        </p>
                        <br>
                        
                        <div class="acciones-blog ">
                            <a class="btn btn-success" href="InsertarBlog.jsp">Nuevo</a>
                            <a class="btn btn-info" href="CargarBlogs?opc=edit&idx=<%= blog.getString("idBlog") %>">Editar</a>
                            <a class="btn btn-danger" href="CargarBlogs?opc=delete&idx=<%= blog.getString("idBlog") %>">Borrar</a>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
            </div>     
                <% }%>             
            </form>
        </section >
    </div>
    
    
    
    
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
