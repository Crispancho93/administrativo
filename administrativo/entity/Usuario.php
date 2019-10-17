<?php

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
class Usuario {

    private $idusuario;
    private $nombre;
    private $tipoDocumento;
    private $numDocumento;
    private $direccion; 
    private $telefono ;
    private $correo; 
    private $loguin;
    private $clave; 
    private $tipoUsuario; 
    private $observacion;
    
    function __construct() {
        
    }

    function getIdusuario() {
        return $this->idusuario;
    }

    function getNombre() {
        return $this->nombre;
    }

    function getTipoDocumento() {
        return $this->tipoDocumento;
    }

    function getNumDocumento() {
        return $this->numDocumento;
    }

    function getDireccion() {
        return $this->direccion;
    }

    function getTelefono() {
        return $this->telefono;
    }

    function getCorreo() {
        return $this->correo;
    }

    function getLoguin() {
        return $this->loguin;
    }

    function getClave() {
        return $this->clave;
    }

    function getTipoUsuario() {
        return $this->tipoUsuario;
    }

    function getObservacion() {
        return $this->observacion;
    }

    function setIdusuario($idusuario) {
        $this->idusuario = $idusuario;
    }

    function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    function setTipoDocumento($tipoDocumento) {
        $this->tipoDocumento = $tipoDocumento;
    }

    function setNumDocumento($numDocumento) {
        $this->numDocumento = $numDocumento;
    }

    function setDireccion($direccion) {
        $this->direccion = $direccion;
    }

    function setTelefono($telefono) {
        $this->telefono = $telefono;
    }

    function setCorreo($correo) {
        $this->correo = $correo;
    }

    function setLoguin($loguin) {
        $this->loguin = $loguin;
    }

    function setClave($clave) {
        $this->clave = $clave;
    }

    function setTipoUsuario($tipoUsuario) {
        $this->tipoUsuario = $tipoUsuario;
    }

    function setObservacion($observacion) {
        $this->observacion = $observacion;
    }

    
}
