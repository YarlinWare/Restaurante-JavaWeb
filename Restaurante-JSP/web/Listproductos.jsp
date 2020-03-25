<%-- 
    Document   : Listproductos
    Created on : 23-mar-2020, 20.06.14
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Productos | Restaurante</title>
        
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
      <nav class="navbar navbar-expand-lg navbar-dark row justify-content-between menuAcceso">
        <a href="index.jsp" class="navbar-brand pl-3 ">
          <img src="img/logo.png" width="auto" height="40" alt="">
        </a>

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
              <a class="nav-link text-uppercase text-expanded" href="services.html">Servicios</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="store.html">Visítanos</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="contact.html">Contacto</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="admin.html">Admin</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
        
        
    <%  
        DBProductos dbr = new DBProductos();
        ResultSet productos = dbr.getMenu();  
    %>
    <div class="container">
        
        
       
        
        
        
    <table  class="table table-striped table-dark">
            <tr>
                <thead class="thead-dark">
                    <th scope="col">Nombre</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Valor</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Acciones</th>
                </thead>
            </tr>
                <% while (productos.next()){ %>
                    <tr>
                        <td><%= productos.getString("nombre") %></td>
                        <td><%= productos.getString("descripcion") %></td>                        
                        <td><%= productos.getString("valor") %></td>
                        <td><%= productos.getString("cantidad") %></td>
                        <td class="links">
                            <a href="CargarProducto?opc=edit&idx=<%= productos.getString("idProducto") %>">Editar</a>
                            <a href="CargarProducto?opc=delete&idx=<%= productos.getString("idProducto") %>">Borrar</a>
                        </td>
                    </tr>
                <% }%>
                <tr>
                    <!--<td colspan="5" class="links"><a href="insertar_contacto.jsp">Agregar</a></td>-->
            </tr>
            <tr>
                <thead class="thead-dark">
                    <th scope="col">Nombre</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Valor</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Acciones</th>
                </thead>
            </tr>
        </table>
        
        </div>
    </body>
</html>