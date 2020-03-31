<%-- 
    Document   : EditarProducto
    Created on : 24/03/2020, 05:21:24 PM
    Author     : eandr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.productos.Productos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editor | Restaurante</title>
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
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="index.jsp">Inicio</a>
            </li>
            <li class="nav-item px-lg-4">
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
            <li class="nav-item active px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="admin.jsp">Admin</a>
            </li>
            <li class="nav-item active px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="camarero.jsp">Camarero</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
     
     <div class="container">
     
        <form id="frmActualizarProducto" action="ActualizarProducto" method="POST">
             <input type="hidden" id="txtId" name="txtId" value="<%= ((Productos)session.getAttribute("productos")).getIdProducto()%>">
        <table  class="table table-striped table-dark">
            <tr>
                <td>Nombre</td>
                <td><input type="text" id="txtNombre" name="txtNombre" value="<%= ((Productos)session.getAttribute("productos")).getNombre() %>"></td>
            </tr>
            <tr>
                <td>Descripcion</td>
                <td><input type="text" id="txtDescripcion" name="txtDescripcion" value="<%= ((Productos)session.getAttribute("productos")).getDescripcion()%>"></td>
            </tr>
            <tr>
                <td>Valor</td>
                <td><input type="text" id="txtValor" name="txtValor" value="<%= ((Productos)session.getAttribute("productos")).getValor()%>"></td>
            </tr>
            <tr>
                <td>Categoria</td>
                <td><input type="text" id="txtCategoria" name="txtCategoria" value="<%= ((Productos)session.getAttribute("productos")).getIdCategoria()%>"></td>
            </tr>
            <tr>
                <td>Cantidad</td>
                <td><input type="text" id="txtCantidad" name="txtCantidad" value="<%= ((Productos)session.getAttribute("productos")).getCantidad()%>"></td>
            </tr>
            
         
            <tr>
                <td colspan="2"><input type="button" value="Aceptar" onclick="submit();"></td>
            </tr>
            
        </table>
        </form>
     </div>
    </body>
</html>
