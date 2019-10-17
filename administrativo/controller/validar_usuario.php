<?php
header('Content-Type: text/html; charset=iso-8859-1');
require_once '../entity/Usuario.php';
require_once '../model/UsuarioDao.php';

if (!empty(htmlspecialchars($_POST["loguin"])) &
        !empty(htmlspecialchars($_POST["clave"]))) {
    
    $usuario = new Usuario();
    $usuario->setLoguin(htmlspecialchars($_POST["loguin"]));
    $usuario->setClave(htmlspecialchars($_POST["clave"]));
    
    $userDao = new UsuarioDao();
   
} else {
    header("Location: ../view/index.php");
}

