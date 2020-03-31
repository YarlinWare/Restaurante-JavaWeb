<%@page import="controladores.ControladorProducto"%>
<%@page import="logica.productos.Productos"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Productos producto = new ControladorProducto().getProducto(id);
%>
<!DOCTYPE html>
<html lang="es">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Inicio | Restaurante</title>

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
            <li class="nav-item active px-lg-4">
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
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="admin.jsp">Admin</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    
    <div class="container">
         <div class="card mb-3 mt-4" >
                <div class="row ">
                  <div class="col-md-6 col-xs-12 cardImg">
                    <img src="<%= producto.getUrl_img()%>" alt="" width="300px"/>
                  </div>
                  <div class="col-md-6 col-xs-12">
                      <div class="tarjeta-Descripcion">
                          <div class="card-body">
                            <h5 class="card-title"><%= producto.getNombre()%></h5>
                            <p>Web ID: <%= producto.getIdProducto()%></p>
                            <form action="agregarproducto" method="post">
                            <label>Cantidad</label>
                              <input type="hidden" value="<%= producto.getIdProducto()%>" name="idProducto">
                              <input type="text" value="1" id="txt-cantidad" name="cantidad"/>
                            <p class="card-text"><%= producto.getDescripcion()%></p>
                            <p><b>Disponibilidad:</b>
                                    <span <%if (producto.getCantidad()>=10) %> > En Stock </span> 
                                    <span <%if (producto.getCantidad()<10 && producto.getCantidad()>0) %> > Bajo Stock</span>
                                    <span <%if (producto.getCantidad()<=0) %> > Sin Stock</span>
                            </p>
                            <p class="card-text"><small class="text-muted">(<%= producto.getCantidad() %> unidades disponibles)</small></p>
                            <p><b>Precio:</b>
                                <span>$<%=(producto.getValor()) %> </span>                                    
                            </p>
                            <br>
                              <button type="submit" class="btn btn-fefault cart">
                                      <i class="fa fa-shopping-cart"></i>
                                      Add to cart
                              </button>
                            </form>
                          </div> 
                      </div>
                   
                  </div>
                </div>
              </div>
                        
    </div>
           
    <section>           
            
            
		<div class="container">
			<div class="row">
                            <div class="col-sm-7">
                                    <div class="product-information"><!--/product-information-->
                                            <!--<img src="images/product-details/new.jpg" class="newarrival" alt="" />
                                            <h2><%= producto.getNombre()%></h2>
                                            <p>Web ID: <%= producto.getIdProducto()%></p>
                                            <img src="images/product-details/rating.png" alt="" />
                                            <form action="agregarproducto" method="post">
                                            <span>
                                                    <span>US $<%= producto.getValor()%></span>
                                                    <label>Quantity:</label>
                                                    <input type="hidden" value="<%= producto.getIdProducto()%>" name="idproducto">
                                                    <input type="text" value="1" id="txt-cantidad" name="cantidad"/>
                                                    <button type="submit" class="btn btn-fefault cart">
                                                            <i class="fa fa-shopping-cart"></i>
                                                            Add to cart
                                                    </button>
                                            </span>
                                            </form>
                                            <p><b>Availability:</b> In Stock</p>
                                            <p><b>Condition:</b> New</p>
                                            <p><b>Brand:</b> E-SHOPPER</p>
                                            <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>-->
                                    </div><!--/product-information-->
                            </div>
                    </div><!--/product-details-->
                </div>
            </div>
        </div>
    </section>
                                        

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
