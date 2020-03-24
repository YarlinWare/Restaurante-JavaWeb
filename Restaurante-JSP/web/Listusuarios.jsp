<%-- 
    Document   : index.jsp
    Created on : 15-mar-2020, 16.14.30
    Author     : ASUS
--%>
<%@page import="java.util.List"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBContactos"%>
<%@page import="usuario.Usuario"%>
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
        DBContactos dbr = new DBContactos();
        ResultSet usuarios = dbr.getContactos();  
    %>
    <div class="container">
    <table  class="mt-5 table table-responsive-md">
            <tr>
                <thead class="thead-dark">                    
                    <th scope="col">#Usuario</th>
                    <th scope="col">#Perfil</th>
                    <th scope="col">Nombres</th>
                    <th scope="col">Apellidos</th>
                    <th scope="col">Correo</th>
                    <th scope="col">Celular</th>
                    <th scope="col">Acciones</th>
                </thead>
            </tr>
                <% while (usuarios.next()){ %>
                    <tr>
                        <td><%= usuarios.getString("idUsuario") %></td>
                        <td><%= usuarios.getString("idPerfil") %></td>
                        <td><%= usuarios.getString("nombres") %></td>
                        <td><%= usuarios.getString("apellidos") %></td>                        
                        <td><%= usuarios.getString("correo") %></td>
                        <td><%= usuarios.getString("celular") %></td>
                        <td class="links">
                            <a href="CargarUsuarios?opc=edit&idx=<%= usuarios.getString("idUsuario") %>">Editar</a>
                            <a href="CargarUsuarios?opc=delete&idx=<%= usuarios.getString("idUsuario") %>">Borrar</a>
                        </td>
                    </tr>
                <% }%>
                <tr>
                    <!--<td colspan="5" class="links"><a href="insertar_contacto.jsp">Agregar</a></td>-->
            </tr>
            <tr>
                <thead class="thead-dark">                     
                    <th scope="col">#Usuario</th>
                    <th scope="col">#Perfil</th>
                    <th scope="col">Nombres</th>
                    <th scope="col">Apellidos</th>
                    <th scope="col">Correo</th>
                    <th scope="col">Celular</th>
                    <th scope="col">Acciones</th>
                </thead>
            </tr>
        </table>
        <td colspan="5" class="links"><a href="registro.jsp">Agregar</a></td>
        </div>
    </body>
</html>
