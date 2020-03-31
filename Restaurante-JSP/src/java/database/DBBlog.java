/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import logica.blog.Blog;

/**
 *
 * @author ASUS
 */
public class DBBlog {
    DBConexion cn;
    
    public DBBlog() {
        cn = new DBConexion();
    }

    public ResultSet getBlogById(int id) throws SQLException {
        PreparedStatement pstm = cn.getConexion().prepareStatement("SELECT idBlog, "
                + " titulo, "
                + " imagen, "
                + " contenido "
                + " FROM blog "
                + " WHERE idBlog = ? ");
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
    public ResultSet getBlog() throws SQLException {
        PreparedStatement pstm = cn.getConexion().prepareStatement("SELECT idBlog, "
                + " titulo, "
                + " imagen, "
                + " contenido "
                + " FROM blog "
                + " ORDER BY idBlog ");
        ResultSet res = pstm.executeQuery();
        return res;
    }

    public void insertarBlog(Blog b) {
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
            /*pstm.setInt(1, b.getIdPedido());
            pstm.setString(2, b.getFecha());
            pstm.setDouble(3, b.getNeto());
            pstm.setDouble(4, b.getTotal());
            pstm.setDouble(5, b.getPropina());
            pstm.setBoolean(6, b.isEstado());
            pstm.setBoolean(7, b.isPago());
            pstm.setDouble(8, b.getIVA());*/

            pstm.executeUpdate();


        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void actualizarBlog(Blog b) {

        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("update blog set titulo = ?, "
                    + " contenido = ?,"
                    + " imagen = ? "
                    + " where idBlog = ?");
            pstm.setString(1, b.getTitulo());
            pstm.setString(2, b.getContenido());            
            pstm.setString(3, b.getImagen());
            pstm.setInt(4, b.getIdBlog());
            
            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void borrarBlog(Blog b) {

        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement("delete from blog "
                    + " where idBlog = ?");

            pstm.setInt(1, b.getIdBlog());

            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }


    }

    public String getMensaje() {
        return cn.getMensaje();
    }
}
