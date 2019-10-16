-- MySQL Script generated by MySQL Workbench
-- Mon Oct  7 18:31:46 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema administrativo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `administrativo` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `administrativo` ;

-- -----------------------------------------------------
-- Table `administrativo`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `administrativo`.`categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(45) NULL NULL,
  `observacion` VARCHAR(100) NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `administrativo`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `administrativo`.`pago` (
	`idpago` INT NOT NULL AUTO_INCREMENT,
	`llave` VARCHAR(100) NOT NULL,	
	PRIMARY KEY (`idpago`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `llave_UNIQUE` ON pago (`llave` ASC) ;

-- -----------------------------------------------------
-- Table `administrativo`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `administrativo`.`persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `rol_persona` VARCHAR(20) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `tipo_persona` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `tipo_documento` VARCHAR(20) NULL,
  `num_documento` VARCHAR(20) NULL,
  `direccion` VARCHAR(70) NULL,
  `telefono` VARCHAR(20) NULL,
  `correo` VARCHAR(50) NULL,
  `nombre_contacto` VARCHAR(45) NULL,
  `numero_contacto` VARCHAR(45) NULL,
  `observacion` VARCHAR(256) NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE INDEX `num_documento_UNIQUE` (`num_documento` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `administrativo`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `administrativo`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `tipo_documento` VARCHAR(20) NOT NULL,
  `num_documento` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(70) NULL,
  `telefono` VARCHAR(20) NULL,
  `correo` VARCHAR(50) NULL,
  `loguin` VARCHAR(20) NOT NULL,
  `clave` VARCHAR(64) NOT NULL,
  `tipo_usuario` VARCHAR(20) NOT NULL,
  `observacion` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `loguin_UNIQUE` (`loguin` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `administrativo`.`rango_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `administrativo`.`rango_factura` (
	`idrango_factura` INT NOT NULL AUTO_INCREMENT,
    `inicio` INT NOT NULL,
    `fin` INT NOT NULL,
    `fecha` DATETIME NULL,
    `observacion` VARCHAR(256) NULL,
    PRIMARY KEY(`idrango_factura`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `administrativo`.`articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `administrativo`.`articulo` (
  `idarticulo` INT NOT NULL AUTO_INCREMENT,
  `categoria` INT NOT NULL,
  `codigo` VARCHAR(50) NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `stock` DECIMAL(11,2) NOT NULL DEFAULT 0,
  `descripcion` VARCHAR(256) NULL,
  `imagen` VARCHAR(50) NULL,
  `observacion` VARCHAR(256) NULL,
  PRIMARY KEY (`idarticulo`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) ,
  INDEX `fk_articulo_categoria_idx` (`categoria` ASC) ,
  CONSTRAINT `fk_articulo_categoria`
    FOREIGN KEY (`categoria`)
    REFERENCES `administrativo`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `administrativo`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `administrativo`.`venta` (
  `idventa` INT NOT NULL AUTO_INCREMENT,
  `idpersona` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `idarticulo` INT NOT NULL,
  `consecutivo` INT NOT NULL DEFAULT 0,
  `tipo_comprobante` VARCHAR(20) NOT NULL,
  `num_comprobante` VARCHAR(45) NULL,
  `fecha_expedicion` DATETIME NULL,
  `fecha_vencimineto` DATETIME NULL,
  `cantidad` DECIMAL(11,2) NOT NULL DEFAULT 0,
  `valor_unitario` DECIMAL(11,2) NOT NULL DEFAULT 0,
  `subtotal` DECIMAL(11,2) NOT NULL DEFAULT 0,
  `descuento` DECIMAL(11,2) NULL DEFAULT 0,
  `subtotal_descuento` DECIMAL(11,2) NULL DEFAULT 0,
  `iva` DECIMAL(11,2) NULL DEFAULT 0,
  `total` DECIMAL(11,2) NULL DEFAULT 0,
  `rte_fuente` DECIMAL(11,2) NULL DEFAULT 0,
  `rte_iva` DECIMAL(11,2) NULL DEFAULT 0,
  `rte_ica` DECIMAL(11,2) NULL DEFAULT 0,
  `neto` DECIMAL(11,2) NULL DEFAULT 0,
  `observacion` VARCHAR(256) NULL,
  PRIMARY KEY (`idventa`),
  INDEX `fk_ingreso_persona_idx` (`idpersona` ASC) ,
  INDEX `fk_ingreso_usuario_idx` (`idusuario` ASC) ,
  INDEX `fk_ingreso_articulo_idx` (`idarticulo` ASC) ,
  CONSTRAINT `fk_venta_persona`
    FOREIGN KEY (`idpersona`)
    REFERENCES `administrativo`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `administrativo`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_articulo`
    FOREIGN KEY (`idarticulo`)
    REFERENCES `administrativo`.`articulo` (`idarticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `administrativo`.`ingreso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `administrativo`.`ingreso` (
  `idingreso` INT NOT NULL AUTO_INCREMENT,
  `idpersona` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `idarticulo` INT NOT NULL,
  `tipo_comprobante` VARCHAR(20) NOT NULL,
  `num_comprobante` VARCHAR(45) NULL,
  `fecha_expedicion` DATETIME NULL,
  `fecha_vencimineto` DATETIME NULL,
  `valor_venta` DECIMAL(11,2) NULL default 0,
  `cantidad` DECIMAL(11,2) NOT NULL DEFAULT 0,
  `valor_unitario` DECIMAL(11,2) NOT NULL DEFAULT 0,
  `subtotal` DECIMAL(11,2) NOT NULL DEFAULT 0,
  `descuento` DECIMAL(11,2) NULL DEFAULT 0,
  `subtotal_descuento` DECIMAL(11,2) NULL DEFAULT 0,
  `iva` DECIMAL(11,2) NULL DEFAULT 0,
  `total` DECIMAL(11,2) NULL DEFAULT 0,
  `rte_fuente` DECIMAL(11,2) NULL DEFAULT 0,
  `rte_iva` DECIMAL(11,2) NULL DEFAULT 0,
  `rte_ica` DECIMAL(11,2) NULL DEFAULT 0,
  `neto` DECIMAL(11,2) NULL DEFAULT 0,
  `estado` VARCHAR(45) NULL,
  `observacion` VARCHAR(256) NULL,
  PRIMARY KEY (`idingreso`),
  INDEX `fk_ingreso_persona_idx` (`idpersona` ASC) ,
  INDEX `fk_ingreso_usuario_idx` (`idusuario` ASC) ,
  INDEX `fk_ingreso_articulo_idx` (`idarticulo` ASC) ,
  CONSTRAINT `fk_ingreso_persona`
    FOREIGN KEY (`idpersona`)
    REFERENCES `administrativo`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `administrativo`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_articulo`
    FOREIGN KEY (`idarticulo`)
    REFERENCES `administrativo`.`articulo` (`idarticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
