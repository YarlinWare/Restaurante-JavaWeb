/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import logica.facturas.Facturas;
import logica.productos.Productos;

/**
 *
 * @author ASUS
 */
public class DBFacturas {
    DBConexion cn;
    
    public DBFacturas() {
        cn = new DBConexion();
    }

    public ResultSet getFacturasById(int id) throws SQLException {
        PreparedStatement pstm = cn.getConexion().prepareStatement("SELECT idProducto, "
                + " nombre, "
                + " descripcion, "
                + " valor, "
                + " idCategoria, "
                + " url_img, "
                + " cantidad "
                + " FROM productos "
                + " WHERE idFactura = ? ");
        pstm.setInt(1, id);

        ResultSet res = pstm.executeQuery();
        /*
         res.close();	
         */

        return res;
    }

    /**
     * trae todos los registros de la tabla contactos
     */
    public ResultSet getFacturas() throws SQLException {
        PreparedStatement pstm = cn.getConexion().prepareStatement("SELECT idFactura, "
                + " idPedido, "
                + " fecha, "
                + " valorNeto, "
                + " valorTotal, "
                + " propina, "                
                + " estado, "
                + " pago, "
                + " iva "
                + " FROM factura "
                + " ORDER BY idFactura, fecha ");


        ResultSet res = pstm.executeQuery();
        return res;
    }

    public void insertarFacturas(Productos m) {
        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("insert into contactos (con_nombre, "
                    + " con_apellido,"
                    + " con_tipo_usuario, "
                    + " con_telefono_domicilio,"
                    + " con_telefono_oficina,"
                    + " con_celular,"
                    + " con_correo,"
                    + " con_direccion_residencia,"
                    + " con_direccion_trabajo) "
                    + " values(?,?,?,?,?,?,?,?)");
            pstm.setString(1, m.getNombre());
            pstm.setString(2, m.getDescripcion());
            pstm.setInt(3, m.getIdProducto());
            pstm.setInt(4, m.getValor());;

            pstm.executeUpdate();


        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void actualizarFacturas(Facturas f) {

        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("update productos set idProducto = ?, "
                    + " nombre = ?,"
                    + " descripcion = ?, "
                    + " valor = ?,"
                    + " idCategoria = ?,"
                    + " cantidad = ? "
                    + " where idFactura = ?");
            /*pstm.setInt(1, f.getIdProducto());
            pstm.setString(2, f.getNombre());            
            pstm.setString(3, f.getDescripcion());
            pstm.setInt(4, f.getValor());
            pstm.setInt(5, f.getIdCategoria());
            pstm.setInt(6, f.getCantidad());*/
            
            

            pstm.executeUpdate();


        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void borrarFacturas(Facturas f) {

        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("delete from factura "
                    + " where idFactura = ?");

            pstm.setInt(1, f.getIdFactura());

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }


    }

    public String getMensaje() {
        return cn.getMensaje();
    }
}
