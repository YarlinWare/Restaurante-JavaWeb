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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editor | Restaurante</title>
    </head>
    <body>
        <form id="frmActualizarProducto" action="ActualizarProducto" method="POST">
             <input type="hidden" id="txtId" name="txtId" value="<%= ((Productos)session.getAttribute("productos")).getIdProducto()%>">
        <table>
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
    </body>
</html>
