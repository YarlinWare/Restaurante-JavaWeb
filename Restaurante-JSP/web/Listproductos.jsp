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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    <%  
        DBProductos dbr = new DBProductos();
        ResultSet productos = dbr.getMenu();  
    %>
    <div class="container">
    <table  class="mt-5 table table-responsive-md">
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
                            <a href="CargarRutina?opc=edit&idx=<%= productos.getString("idProducto") %>">Editar</a>
                            <a href="CargarRutina?opc=delete&idx=<%= productos.getString("idProducto") %>">Borrar</a>
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