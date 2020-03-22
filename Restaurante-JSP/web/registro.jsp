<%-- 
    Document   : registro
    Created on : 22/03/2020, 01:36:18 PM
    Author     : eandr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Registro</title>
    </head>
    <body>
        <form id="nuevoRegistro" action="insertarRegistro" method="POST">
            <table>
            <tr>
                <td>id</td>
                <td><input type="text" id="txtId" name="txtId"></td>
            </tr>
            <tr>
                <td>Nombre</td>
                <td><input type="text" id="txtNombre" name="txtNombre"></td>
            </tr>
            <tr>
                <td>Apellido</td>
                <td><input type="text" id="txtApellido" name="txtApellido"></td>
            </tr>
            <tr>
                <td>Correo</td>
                <td><input type="text" id="txtCorreo" name="txtCorreo"></td>
            </tr>
            <tr>
                <td>Celular</td>
                <td><input type="text" id="txtCelular" name="txtCelular"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="text" id="txtPassword" name="txtPassword"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="button" value="Aceptar" onclick="submit();"></td>
            </tr>
            
        </table>
        </form>
    </body>
</html>
