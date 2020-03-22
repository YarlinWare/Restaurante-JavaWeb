<%-- 
    Document   : TipoPago
    Created on : 21-mar-2020, 18.35.57
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form  method="GET"  action="PagoServlet">
            <p>Tipo De Pago</p>
                <select name="TipoPago" id="TipoPago">
			<option value="Tarjeta" selected>Tarjeta</option>
			<option value="Efectivo">Efectivo</option>
                </select>
            <input type="submit" value="Continuar">
        </form>
    </body>
</html>
