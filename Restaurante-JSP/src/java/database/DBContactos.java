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

    public void insertarContacto(Usuario user) {
        try {
            
            PreparedStatement pstm = cn.getConexion().prepareStatement("insert into usuario (idPerfil,"
                    + " nombres,"
                    + " apellidos,"
                    + " correo,"
                    + " celular,"
                    + " password)"        
                    + " values(?,?,?,?,?,?)");
            pstm.setInt(1, user.getIdPerfil());
            pstm.setString(2, user.getNombre());
            pstm.setString(3, user.getApellido());
            pstm.setString(4, user.getCorreo());
            pstm.setString(5, user.getCelular());
            pstm.setString(6, user.getPassword());

            pstm.executeUpdate();


        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void actualizarContacto(Usuario c) {
        
        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("update usuario set nombres = ?, "
                    + " apellidos = ?,"
                    + " correo = ?,"
                    + " celular = ?,"
                    + " password = ?,"   
                    + " idPerfil = ?"
                    + " where idUsuario = ?");
            pstm.setString(1, c.getNombre());
            pstm.setString(2, c.getApellido());
            pstm.setString(3, c.getCorreo());
            pstm.setString(4, c.getCelular());
            pstm.setString(5, c.getPassword());
            pstm.setInt(6, c.getIdPerfil());
            pstm.setInt(7, c.getId());

            pstm.executeUpdate();


        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void borrarContacto(Usuario c) {

        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("delete from usuario "
                    + " where idUsuario = ?");

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
