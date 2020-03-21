/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import logica.productos.Productos;

/**
 *
 * @author ASUS
 */
public class DBProductos {
    
    DBConexion cn;
    
    public DBProductos() {
        cn = new DBConexion();
    }

    public ResultSet getMenuById(int id) throws SQLException {
        PreparedStatement pstm = cn.getConexion().prepareStatement("SELECT idProducto, "
                + " nombre, "
                + " descripcion, "
                + " valor, "
                + " idCategoria, "
                + " url_img, "
                + " cantidad "
                + " FROM productos "
                + " WHERE idProducto = ? ");
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
    public ResultSet getMenu() throws SQLException {
        PreparedStatement pstm = cn.getConexion().prepareStatement("SELECT idProducto, "
                + " nombre, "
                + " descripcion, "
                + " valor, "
                + " idCategoria, "
                + " url_img, "
                + " cantidad "
                + " FROM productos "
                + " ORDER BY nombre, valor ");


        ResultSet res = pstm.executeQuery();
        return res;
    }

    public void insertarMenu(Productos m) {
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

    public void actualizarMenu(Productos m) {

        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("update contactos set con_nombre = ?, "
                    + " con_apellido = ?,"
                    + " con_tipo_usuario = ?, "
                    + " con_telefono_domicilio = ?,"
                    + " con_telefono_oficina = ?,"
                    + " con_celular = ?,"
                    + " con_correo = ?,"
                    + " con_direccion_residencia = ?,"
                    + " con_direccion_trabajo = ? "
                    + " where con_id = ?");
            pstm.setString(1, m.getNombre());            
            pstm.setString(2, m.getDescripcion());
            pstm.setInt(3, m.getIdProducto());
            pstm.setInt(4, m.getValor());

            pstm.executeUpdate();


        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void borrarMenu(Productos m) {

        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("delete from contactos "
                    + " where con_id = ?");

            pstm.setInt(1, m.getIdProducto());

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }


    }

    public String getMensaje() {
        return cn.getMensaje();
    }
}

