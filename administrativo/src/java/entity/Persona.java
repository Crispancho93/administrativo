/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Crispancho
 */
public interface Persona {
    
    // nombre
    public String getNombre();
    public void setNombre(String nombre);
    
    // fecha de nacimineto
    public String getFechaNacimiento();
    public void setFechaNacimiento(String fechaNacimiento);
    
    // tipo documento
    public String getTipoDocumento();
    public void setTipoDocumento(String tipoDocumento);
    
    // número documento
    public String getNumeroDocumento();
    public void setNumeroDocumento(String numeroDocumento);
    
    // dirección
    public String getDireccion();
    public void setDireccion(String direccion); 
    
    // teléfono
    public String getTelefono();
    public void setTelefono(String telefono);
    
    // correo
    public String getCorreo();
    public void setCorreo(String correo);
    
    
}
