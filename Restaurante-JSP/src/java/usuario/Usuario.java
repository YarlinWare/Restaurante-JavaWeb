/*
 * Usuario.java
 * 
 * Created on 7/04/2008, 10:40:35 PM
 * 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package usuario;

import java.io.Serializable;

/**
 *
 * @author alejo
 */
public class Usuario{
    int id;
    String nombre;
    String apellido;
    String correo;
    String celular;
    String password;
    int idPerfil;
    

    public Usuario() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }



    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    

}
