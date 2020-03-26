/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import database.DBConexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author eandr
 */
public class ControladorLogin extends DBConexion {
    public boolean autenticacion (String usuario, String contraseña){
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String consulta = "select * from usuario where correo = ? and password = ?";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, contraseña);
            rs = pst.executeQuery();
            
            
            if (rs.absolute(1)){
                return true;
            }
            
        } catch (Exception e) {
            System.out.println("Error" + e);
        }finally{
            try {
                if (getConexion() != null) getConexion().close();
                if (pst != null) pst.close();
                if (rs != null) rs.close();
            } catch (Exception e) {
            }
        } 
        return false;
    }
    
    
    
}
