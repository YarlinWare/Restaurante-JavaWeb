<%-- 
    Document   : index.jsp
    Created on : 15-mar-2020, 16.14.30
    Author     : ASUS
--%>
<%@page import="java.util.List"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBProductos"%>
<%@page import="logica.productos.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Menu | Restaurante</title>

    <!-- Bootstrap -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Fuentes -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

    <!-- Estilos -->
    <link href="css/business-casual.css" rel="stylesheet">
    <link href="css/menu.css" rel="stylesheet">
   

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
            <li class="nav-item  px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="index.jsp">Inicio</a>
            </li>
            <li class="nav-item active px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="menu.jsp">Menu</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="services.jsp">Servicios</a>
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
          </ul>
        </div>
      </div>
    </nav>
        
    <div class="container">
        <%  
            DBProductos dbr = new DBProductos();
            ResultSet menu = dbr.getMenu(); 
        %>
        
         <div class="row"> 
             <form  method="post"  action="PagoServlet">
                <!-- Cartas actividades -->
		<div class="row pt-5 pb-5 pl-2 d-flex justify-content-center ">                    
                    
                    <% while (menu.next()){ %>
                    <div class="col-12 col-sm-6 col-md-4 mb-3 d-flex justify-content-center ">
                        <div class="card" style="width: 18rem;">
                          <img
                               src="<%= menu.getString("url_img") %>"
                               class="card-img-top" alt="...">
                          <div class="card-body" style="font-family: 'Abel', sans-serif;">
                              <h4 ><%= menu.getString("nombre") %></h4>
                            <p class="card-text" ><%= menu.getString("descripcion") %></p>
                            <p><strong>Valor: </strong><%= menu.getString("valor") %></p>
                            <p><strong>Cantidad: </strong><%= menu.getString("cantidad") %></p>                                
                            <div class="carrito_compras ">
                                <!--<a href="CargarRutina?opc=edit&idx=<%= menu.getString("idProducto") %>">Editar</a>
                                <a href="CargarRutina?opc=delete&idx=<%= menu.getString("idProducto") %>">Borrar</a>-->
                                <a href="product-details.jsp?id=<%=menu.getString("idProducto")%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Ver Detalles</a> 
                            </div>
                          </div>
                        </div>
                    </div>
                    <!--<div>
                        <p>Tipo De Pago</p>
                        <select name="TipoPago" id="TipoPago">
                                <option value="Tarjeta" selected>Tarjeta</option>
                                <option value="Efectivo">Efectivo</option>
                        </select>
                        <input type="submit" value="Continuar">
                    </div>-->
                   
                <% }%> 
	    </div>  
            
         </form>
        </div>         
    </div>
    <br> 
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
