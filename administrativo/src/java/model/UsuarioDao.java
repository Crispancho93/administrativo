/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Crispancho
 */
public class UsuarioDao extends Conexion {

    private PreparedStatement declaracionPreparada;
    private ResultSet resultado;
    private String consultaUsuario;

    /**
     * 
     * @param usuario
     * @return 
     * busca un usuario por el loguin, devuelve un objeto usuario con id, loguin y clave
     */
    public ArrayList<Usuario> validarUsuario(Usuario usuario) {

        ArrayList<Usuario> listaUsuario = new ArrayList<>();
        consultaUsuario = "";
        consultaUsuario = "SELECT * FROM USUARIO WHERE loguin=? AND clave=?";

        try {
            declaracionPreparada = getConnection().prepareStatement(consultaUsuario);
            declaracionPreparada.setString(1, usuario.getLoguin());
            declaracionPreparada.setString(2, usuario.getClave());
            resultado = declaracionPreparada.executeQuery();

            while (resultado.next()) {
                Usuario miUsuario = new Usuario();
                miUsuario.setIdUsuario(resultado.getInt(1));
                miUsuario.setLoguin(resultado.getString(8));
                miUsuario.setClave(resultado.getString(9));
                miUsuario.setTipoUsuario(resultado.getString(10));
              
                listaUsuario.add(miUsuario);
            }

            resultado.close();
            declaracionPreparada.close();
            cerrarConexion();
            return listaUsuario;
            
        } catch (SQLException e) {
        }
        
        return listaUsuario;
    }
}
