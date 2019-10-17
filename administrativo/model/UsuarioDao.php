<?php
require_once '../config/Conexion.php';
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Usuario
 *
 * @author Crispancho
 */
class UsuarioDao extends Conexion {

    
    /**
     * 
     * @param type $usuario
     */
    public function validarUsuario(Usuario $usuario) {


        $usuario->getTipoDocumento();

        //$query = Conexion::getConexion()->prepare("SELECT * FROM usuario WHERE loguin = ? AND clave = ?");
        //$query->execute(array($loguin, $clave));

        //while ($row = $query->fetch(PDO::FETCH_OBJ)) {

          //  echo var_dump($row);
        //}
        
        
    }

}
