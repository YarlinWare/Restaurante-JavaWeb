/*
 * DBUsuarios.java
 * 
 * Created on 7/04/2008, 10:26:02 PM
 */
package database;

import java.sql.*;
import usuario.Usuario;

public class DBContactos {

    DBConexion cn;
    
    public DBContactos() {
        cn = new DBConexion();
    }

    public ResultSet getContactoById(int id) throws SQLException {
        PreparedStatement pstm = cn.getConexion().prepareStatement("SELECT idUsuario, "
                + " nombres, "
                + " apellidos, "
                + " celular, "
                + " correo, "
                + " password,"
                + " idPerfil "
                + " FROM usuario "
                + " WHERE idUsuario = ? ");
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
    public ResultSet getContactos() throws SQLException {
        PreparedStatement pstm = cn.getConexion().prepareStatement("SELECT idUsuario, "
                + " nombres, "
                + " apellidos, "
                + " celular, "
                + " correo, "
                + " password,"
                + " idPerfil "
                + " FROM usuario "
                + " ORDER BY nombres, apellidos ");


        ResultSet res = pstm.executeQuery();
        return res;
    }

    public void insertarContacto(Usuario c) {
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
            pstm.setString(1, c.getNombre());
            pstm.setString(2, c.getApellido());
            pstm.setInt(5, c.getCelular());
            pstm.setString(6, c.getCorreo());

            pstm.executeUpdate();


        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void actualizarContacto(Usuario c) {

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
            pstm.setString(1, c.getNombre());
            pstm.setString(2, c.getApellido());
            pstm.setInt(5, c.getCelular());
            pstm.setString(6, c.getCorreo());
            pstm.setInt(9, c.getId());

            pstm.executeUpdate();


        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void borrarContacto(Usuario c) {

        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("delete from contactos "
                    + " where con_id = ?");

            pstm.setInt(1, c.getId());

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }


    }

    public String getMensaje() {
        return cn.getMensaje();
    }
}
