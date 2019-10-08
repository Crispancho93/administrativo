package model;

import entity.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Crispancho
 */
public class Conexion {
    
    private Connection conn = null;

    // conectra db
    public Connection getConnection() {

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/administrativo?user=root&password=Colombia.123");
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "Error Conexión " + e.getMessage());
        }

        return conn;
    }

    // cerrar db
    public void cerrarConexion() {
        try {
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    public static void main(String[] args) {
        
        UsuarioDao dao = new UsuarioDao();
        Usuario user = new Usuario();
        user.setLoguin("crispancho");
        user.setClave("1993");
        System.out.println(dao.validarUsuario(user).isEmpty());
    }
}


