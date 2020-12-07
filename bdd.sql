SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema proyectoparqueo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectoparqueo` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`TarifaAlquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TarifaAlquiler` (
  `idTarifaAlquiler` INT NOT NULL,
  `Meses` INT NULL,
  `Precio` DOUBLE NULL,
  PRIMARY KEY (`idTarifaAlquiler`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoparqueo`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoparqueo`.`cliente` (
  `CI` INT(11) NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`CI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alquiler` (
  `idAlquiler` INT NOT NULL,
  `Inicio` DATE NULL,
  `Fin` DATE NULL,
  `TarifaAlquiler_idTarifaAlquiler` INT NOT NULL,
  `cliente_CI` INT(11) NOT NULL,
  PRIMARY KEY (`idAlquiler`),
  INDEX `fk_Alquiler_TarifaAlquiler_idx` (`TarifaAlquiler_idTarifaAlquiler` ASC),
  INDEX `fk_Alquiler_cliente1_idx` (`cliente_CI` ASC),
  CONSTRAINT `fk_Alquiler_TarifaAlquiler`
    FOREIGN KEY (`TarifaAlquiler_idTarifaAlquiler`)
    REFERENCES `mydb`.`TarifaAlquiler` (`idTarifaAlquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alquiler_cliente1`
    FOREIGN KEY (`cliente_CI`)
    REFERENCES `proyectoparqueo`.`cliente` (`CI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PlanPagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PlanPagos` (
  `idPlanPagos` INT NOT NULL,
  `MontoCuota` DOUBLE NULL,
  `NumCuotas` INT NULL,
  `CuotasPagadas` INT NULL,
  `Alquiler_idAlquiler` INT NOT NULL,
  PRIMARY KEY (`idPlanPagos`),
  INDEX `fk_PlanPagos_Alquiler1_idx` (`Alquiler_idAlquiler` ASC),
  CONSTRAINT `fk_PlanPagos_Alquiler1`
    FOREIGN KEY (`Alquiler_idAlquiler`)
    REFERENCES `mydb`.`Alquiler` (`idAlquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Incidentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Incidentes` (
  `idIncidentes` INT NOT NULL,
  `Descripcion` VARCHAR(100) NULL,
  PRIMARY KEY (`idIncidentes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoparqueo`.`tipousuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoparqueo`.`tipousuario` (
  `idTipoUsuario` INT(11) NOT NULL,
  `Tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoparqueo`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoparqueo`.`usuario` (
  `CI` INT(11) NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Usuario` VARCHAR(45) NULL DEFAULT NULL,
  `Password` VARCHAR(45) NULL DEFAULT NULL,
  `TipoUsuario_idTipoUsuario` INT(11) NOT NULL,
  `HoraIngreso` TIME NULL DEFAULT NULL,
  `HoraSalida` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`CI`),
  INDEX `fk_Usuario_TipoUsuario_idx` (`TipoUsuario_idTipoUsuario` ASC),
  CONSTRAINT `fk_Usuario_TipoUsuario`
    FOREIGN KEY (`TipoUsuario_idTipoUsuario`)
    REFERENCES `proyectoparqueo`.`tipousuario` (`idTipoUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`RegistroCaja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RegistroCaja` (
  `idRegistroCaja` INT NOT NULL,
  `Fecha` DATETIME NULL,
  `Monto` DOUBLE NULL,
  `Tipo` INT NULL,
  `usuario_CI` INT(11) NOT NULL,
  PRIMARY KEY (`idRegistroCaja`),
  INDEX `fk_RegistroCaja_usuario1_idx` (`usuario_CI` ASC),
  CONSTRAINT `fk_RegistroCaja_usuario1`
    FOREIGN KEY (`usuario_CI`)
    REFERENCES `proyectoparqueo`.`usuario` (`CI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ControlHorario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ControlHorario` (
  `idControlHorario` INT NOT NULL,
  `Fecha` DATE NULL,
  `Ingreso` TIME NULL,
  `Salida` TIME NULL,
  `usuario_CI` INT(11) NOT NULL,
  PRIMARY KEY (`idControlHorario`),
  INDEX `fk_ControlHorario_usuario1_idx` (`usuario_CI` ASC),
  CONSTRAINT `fk_ControlHorario_usuario1`
    FOREIGN KEY (`usuario_CI`)
    REFERENCES `proyectoparqueo`.`usuario` (`CI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoparqueo`.`descuento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoparqueo`.`descuento` (
  `idDescuento` INT(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `Monto` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`idDescuento`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoparqueo`.`tipoespacio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoparqueo`.`tipoespacio` (
  `idTipoEspacio` INT(11) NOT NULL,
  `Tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoEspacio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoparqueo`.`espacio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoparqueo`.`espacio` (
  `idEspacio` INT(11) NOT NULL AUTO_INCREMENT,
  `TipoEspacio_idTipoEspacio` INT(11) NOT NULL,
  `Estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idEspacio`),
  INDEX `fk_Espacio_TipoEspacio1_idx` (`TipoEspacio_idTipoEspacio` ASC),
  CONSTRAINT `fk_Espacio_TipoEspacio1`
    FOREIGN KEY (`TipoEspacio_idTipoEspacio`)
    REFERENCES `proyectoparqueo`.`tipoespacio` (`idTipoEspacio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 96
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoparqueo`.`tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoparqueo`.`tarifa` (
  `idTarifa` INT(11) NOT NULL,
  `Horas` INT NULL DEFAULT NULL,
  `Dias` INT NULL DEFAULT NULL,
  `Precio` DECIMAL NULL,
  PRIMARY KEY (`idTarifa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoparqueo`.`tipovehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoparqueo`.`tipovehiculo` (
  `idTipoVehiculo` INT(11) NOT NULL,
  `Tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoVehiculo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoparqueo`.`vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoparqueo`.`vehiculo` (
  `Placa` VARCHAR(10) NOT NULL,
  `TipoVehiculo_idTipoVehiculo` INT(11) NOT NULL,
  `Cliente_CI` INT(11) NOT NULL,
  PRIMARY KEY (`Placa`),
  INDEX `fk_Vehiculo_TipoVehiculo1_idx` (`TipoVehiculo_idTipoVehiculo` ASC),
  INDEX `fk_Vehiculo_Cliente1_idx` (`Cliente_CI` ASC),
  CONSTRAINT `fk_Vehiculo_Cliente1`
    FOREIGN KEY (`Cliente_CI`)
    REFERENCES `proyectoparqueo`.`cliente` (`CI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehiculo_TipoVehiculo1`
    FOREIGN KEY (`TipoVehiculo_idTipoVehiculo`)
    REFERENCES `proyectoparqueo`.`tipovehiculo` (`idTipoVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoparqueo`.`registroParqueo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoparqueo`.`registroParqueo` (
  `idParqueo` INT(11) NOT NULL AUTO_INCREMENT,
  `Usuario_CI` INT(11) NOT NULL,
  `Vehiculo_Placa` VARCHAR(10) NOT NULL,
  `Espacio_idEspacio` INT(11) NOT NULL,
  `Tarifa_idTarifa` INT(11) NULL DEFAULT NULL,
  `Descuento_idDescuento` INT(11) NULL DEFAULT NULL,
  `Entrada` DATETIME NULL DEFAULT NULL,
  `Salida` DATETIME NULL DEFAULT NULL,
  `Incidentes_idIncidentes` INT NULL,
  PRIMARY KEY (`idParqueo`),
  INDEX `fk_Parqueo_Usuario1_idx` (`Usuario_CI` ASC),
  INDEX `fk_Parqueo_Vehiculo1_idx` (`Vehiculo_Placa` ASC),
  INDEX `fk_Parqueo_Espacio1_idx` (`Espacio_idEspacio` ASC),
  INDEX `fk_Parqueo_Tarifa1_idx` (`Tarifa_idTarifa` ASC),
  INDEX `fk_Parqueo_Descuento1_idx` (`Descuento_idDescuento` ASC),
  INDEX `fk_registroParqueo_Incidentes1_idx` (`Incidentes_idIncidentes` ASC),
  CONSTRAINT `fk_Parqueo_Descuento1`
    FOREIGN KEY (`Descuento_idDescuento`)
    REFERENCES `proyectoparqueo`.`descuento` (`idDescuento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Parqueo_Espacio1`
    FOREIGN KEY (`Espacio_idEspacio`)
    REFERENCES `proyectoparqueo`.`espacio` (`idEspacio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Parqueo_Tarifa1`
    FOREIGN KEY (`Tarifa_idTarifa`)
    REFERENCES `proyectoparqueo`.`tarifa` (`idTarifa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Parqueo_Usuario1`
    FOREIGN KEY (`Usuario_CI`)
    REFERENCES `proyectoparqueo`.`usuario` (`CI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Parqueo_Vehiculo1`
    FOREIGN KEY (`Vehiculo_Placa`)
    REFERENCES `proyectoparqueo`.`vehiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registroParqueo_Incidentes1`
    FOREIGN KEY (`Incidentes_idIncidentes`)
    REFERENCES `mydb`.`Incidentes` (`idIncidentes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `idEmpresa` INT NOT NULL,
  `NIT` INT NULL,
  `Nombre` VARCHAR(45) NULL,
  `RazonSocial` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Contacto` INT NULL,
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Factura` (
  `idFactura` INT NOT NULL,
  `CodigoControl` VARCHAR(45) NULL,
  `Autorizacion` INT NULL,
  `Alquiler_idAlquiler` INT NULL,
  `registroParqueo_idParqueo` INT(11) NULL,
  `Empresa_idEmpresa` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_Factura_Alquiler1_idx` (`Alquiler_idAlquiler` ASC),
  INDEX `fk_Factura_registroParqueo1_idx` (`registroParqueo_idParqueo` ASC),
  INDEX `fk_Factura_Empresa1_idx` (`Empresa_idEmpresa` ASC),
  CONSTRAINT `fk_Factura_Alquiler1`
    FOREIGN KEY (`Alquiler_idAlquiler`)
    REFERENCES `mydb`.`Alquiler` (`idAlquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_registroParqueo1`
    FOREIGN KEY (`registroParqueo_idParqueo`)
    REFERENCES `proyectoparqueo`.`registroParqueo` (`idParqueo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Empresa1`
    FOREIGN KEY (`Empresa_idEmpresa`)
    REFERENCES `mydb`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `proyectoparqueo` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
