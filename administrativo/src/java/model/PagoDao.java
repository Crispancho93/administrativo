/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Crispancho
 */
public class PagoDao extends Conexion{
    
    private PreparedStatement declaracionPreparada;
    private ResultSet resultado;
    
    /**
     * 
     * @return 
     * retorna llave 
     */
    public String consultaLlave(){
        
        String llave = "";
        
        try {
            declaracionPreparada = getConnection().prepareStatement("SELECT * FROM pago");
            resultado = declaracionPreparada.executeQuery();
            
            while (resultado.next()) {                
                llave = resultado.getString(2);
            }
            
            cerrarConexion();
            resultado.close();
            declaracionPreparada.close();
            
        } catch (SQLException e) {
        }
        return llave;
    }
    
    /**
     * 
     */
    
}
