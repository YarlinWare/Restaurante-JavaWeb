/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica.productos;

import database.DBConexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class ModeloProducto extends DBConexion{
     
    public ArrayList<Productos> getAllProductos(){
        ArrayList<Productos> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "select * from productos";//"call selectProductos()";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                productos.add(new Productos(rs.getInt("idProducto"), rs.getString("nombre"), rs.getString("url_img"), rs.getInt("idCategoria"), rs.getInt("valor"), rs.getInt("cantidad")));
            }
        } catch (Exception e) {
            
        } finally{
            try {
                if(rs != null) rs.close();
                if(pst != null) pst.close();
                if(getConexion() != null) getConexion().close();
            } catch (Exception e) {
            }
        }       
        return productos;        
    }
    
    public Productos getProducto(int id){
        Productos producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM productos WHERE idProducto = ?";//"call selectProductos(?)";
            pst = getConexion().prepareCall(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while(rs.next()){
                producto = new Productos(rs.getInt("idProducto"), rs.getString("nombre"), rs.getString("url_img"), rs.getInt("idCategoria"), rs.getInt("valor"), rs.getInt("cantidad"));
            }
        } catch (Exception e) {
            
        } finally{
            try {
                if(rs != null) rs.close();
                if(pst != null) pst.close();
                if(getConexion() != null) getConexion().close();
            } catch (Exception e) {
            }
        }       
        return producto;
        
    }    
    
   
}
