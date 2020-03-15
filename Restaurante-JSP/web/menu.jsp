<%-- 
    Document   : index.jsp
    Created on : 15-mar-2020, 16.14.30
    Author     : ASUS
--%>
<%@page import="java.util.List"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBMenu"%>
<%@page import="logica.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<meta charset="UTF-8">
	<title>Menu</title>
	<!-- css Bootstrap-->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Fuentes -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Abel|Anton&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <!-- css estilos-->
	<link rel="stylesheet" href="css/estilos.css">
    </head>
    <body>
        <h1>Menu</h1>
        
    <div class="container">
        <%  DBMenu dbr = new DBMenu();
        ResultSet menu = dbr.getMenu(); 
        %>
        
         <div class="row"> 
                <!-- Cartas actividades -->
		<div class="row pt-5 pb-5 pl-4 d-flex justify-content-center ">                    
                    
                    <% while (menu.next()){ %>
                    <div class="col-12 col-sm-12 col-md-4 mb-3 d-flex justify-content-center ">
                        <div class="card" style="width: 18rem;">
                          <img
                               src="img/prueba.jpg"
                               class="card-img-top" alt="...">
                          <div class="card-body" style="font-family: 'Abel', sans-serif;">
                              <h4 ><%= menu.getString("nombre") %></h4>
                            <p class="card-text" ><%= menu.getString("descripcion") %></p>
                            <p><strong>Valor</strong><%= menu.getString("valor") %></p>                            
                            <div>
                                <a href="CargarRutina?opc=edit&idx=<%= menu.getString("idProducto") %>">Editar</a>
                                <a href="CargarRutina?opc=delete&idx=<%= menu.getString("idProducto") %>">Borrar</a>
                            </div>
                          </div>
                        </div>
                    </div>
                <% }%> 
	    </div>                           
        </div>         
    </div>
            
    <!-- Pié de página -->
    <footer class="footer text-faded text-center py-5 navbar-dark bg-dark" style="color:#fff">
        <div class="container">
            <p class="m-0">
                <a href="#" class="link ">
                  <span class="fa-stack fa-lg" style="color:#17a2b8">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
                <a href="#" class="link">
                  <span class="fa-stack fa-lg"  style="color:#17a2b8">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
                <a href="#" class="link">
                  <span class="fa-stack fa-lg"  style="color:#17a2b8">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-instagram fa-stack-1x fa-inverse"></i>
                  </span>
                </a>
            </p>
            <p class="m-0 mbt">
                <a href="#" class="link">Política de privacidad</a> ·
                <a href="#" class="link">Aviso legal</a> ·
                <a href="#" class="link">Cookies</a>
            </p>
            <p class="m-0 mbt1 ">&copy; Restaurante 2020</p>
        </div>
    </footer>
    <!-- ./Pié de página -->

    <!-- Scripts Bootstrap-->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap.bundle.js"></script>
    <script src="js/jquery-3.3.1.slim.min.js" ></script>
    <script src="js/popper.min.js" ></script>
    <script src="js/vue.js" ></script>
    <!-- ./Scripts Bootstrap-->	
    </body>
</html>
