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

    public void insertarFacturas(Facturas f) {
        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("insert into contactos (idPedido, "
                    + " fecha,"
                    + " valorNeto, "
                    + " valorTotal,"
                    + " propina,"
                    + " estado,"
                    + " pago,"
                    + " iva,"
                    + " values(?,?,?,?,?,?,?,?)");
            pstm.setInt(1, f.getIdPedido());
            pstm.setString(2, f.getFecha());
            pstm.setDouble(3, f.getNeto());
            pstm.setDouble(4, f.getTotal());
            pstm.setDouble(5, f.getPropina());
            pstm.setBoolean(6, f.isEstado());
            pstm.setBoolean(7, f.isPago());
            pstm.setDouble(8, f.getIVA());

            pstm.executeUpdate();


        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void actualizarFacturas(Facturas f) {

        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("update factura set pago = ?, "
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
