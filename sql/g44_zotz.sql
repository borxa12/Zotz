-- MySQL Script generated by MySQL Workbench
-- 11/17/15 00:22:19
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema G44_ZOTZ
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema G44_ZOTZ
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `G44_ZOTZ` DEFAULT CHARACTER SET utf8 ;
USE `G44_ZOTZ` ;

-- -----------------------------------------------------
-- Table `G44_ZOTZ`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `G44_ZOTZ`.`usuarios` (
  `login` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `tipo` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`login`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `G44_ZOTZ`.`concurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `G44_ZOTZ`.`concurso` (
  `edicion` INT NOT NULL AUTO_INCREMENT,
  `folleto` VARCHAR(100) NOT NULL,
  `gastromapa` VARCHAR(45) NOT NULL,
  `fechac` DATE NOT NULL,
  `fechaf` DATE NOT NULL,
  `usuarios_login` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`edicion`),
  INDEX `fk_concurso_usuarios1_idx` (`usuarios_login` ASC),
  CONSTRAINT `fk_concurso_usuarios1`
    FOREIGN KEY (`usuarios_login`)
    REFERENCES `G44_ZOTZ`.`usuarios` (`login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `G44_ZOTZ`.`establecimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `G44_ZOTZ`.`establecimiento` (
  `usuarios_login` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `web` VARCHAR(45) NOT NULL,
  `horario` VARCHAR(20) NOT NULL,
  `descripcionestablecimento` VARCHAR(100) NOT NULL,
  INDEX `fk_establecimiento_usuarios1_idx` (`usuarios_login` ASC),
  PRIMARY KEY (`usuarios_login`),
  CONSTRAINT `fk_establecimiento_usuarios1`
    FOREIGN KEY (`usuarios_login`)
    REFERENCES `G44_ZOTZ`.`usuarios` (`login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `G44_ZOTZ`.`pincho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `G44_ZOTZ`.`pincho` (
  `idpincho` INT NOT NULL AUTO_INCREMENT,
  `nombrepincho` VARCHAR(15) NOT NULL,
  `fotopincho` VARCHAR(50) NOT NULL,
  `descripcionpincho` VARCHAR(100) NOT NULL,
  `ingredientesp` VARCHAR(50) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `aceptado` TINYINT(1) NULL,
  `concurso_edicion` INT NOT NULL,
  `establecimiento_usuarios_login` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idpincho`),
  INDEX `precio_idx` (`precio` ASC),
  INDEX `fk_pincho_concurso1_idx` (`concurso_edicion` ASC),
  INDEX `fk_pincho_establecimiento1_idx` (`establecimiento_usuarios_login` ASC),
  CONSTRAINT `fk_pincho_concurso1`
    FOREIGN KEY (`concurso_edicion`)
    REFERENCES `G44_ZOTZ`.`concurso` (`edicion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pincho_establecimiento1`
    FOREIGN KEY (`establecimiento_usuarios_login`)
    REFERENCES `G44_ZOTZ`.`establecimiento` (`usuarios_login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `G44_ZOTZ`.`juradoprofesional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `G44_ZOTZ`.`juradoprofesional` (
  `usuarios_login` VARCHAR(20) NOT NULL,
  `fotojuradoprofesional` VARCHAR(50) NOT NULL,
  `nombrejuradoprofesional` VARCHAR(15) NOT NULL,
  `reconocimientos` VARCHAR(1000) NULL,
  INDEX `fk_juradoprofesional_usuarios1_idx` (`usuarios_login` ASC),
  PRIMARY KEY (`usuarios_login`),
  CONSTRAINT `fk_juradoprofesional_usuarios1`
    FOREIGN KEY (`usuarios_login`)
    REFERENCES `G44_ZOTZ`.`usuarios` (`login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `G44_ZOTZ`.`votaprofesional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `G44_ZOTZ`.`votaprofesional` (
  `votoprofesional` INT NULL,
  `pincho_idpincho` INT NOT NULL AUTO_INCREMENT,
  `juradoprofesional_usuarios_login` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`pincho_idpincho`, `juradoprofesional_usuarios_login`),
  INDEX `fk_votaprofesional_pincho1_idx` (`pincho_idpincho` ASC),
  INDEX `fk_votaprofesional_juradoprofesional1_idx` (`juradoprofesional_usuarios_login` ASC),
  CONSTRAINT `fk_votaprofesional_pincho1`
    FOREIGN KEY (`pincho_idpincho`)
    REFERENCES `G44_ZOTZ`.`pincho` (`idpincho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_votaprofesional_juradoprofesional1`
    FOREIGN KEY (`juradoprofesional_usuarios_login`)
    REFERENCES `G44_ZOTZ`.`juradoprofesional` (`usuarios_login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `G44_ZOTZ`.`codigopincho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `G44_ZOTZ`.`codigopincho` (
  `pincho_idpincho` INT NOT NULL,
  `codigopincho` VARCHAR(15) NOT NULL,
  `like` TINYINT(1) NULL,
  `usuarios_login` VARCHAR(20) NULL,
  PRIMARY KEY (`pincho_idpincho`, `codigopincho`),
  INDEX `fk_codigopincho_usuarios1_idx` (`usuarios_login` ASC),
  CONSTRAINT `FK_codigopincho_pincho`
    FOREIGN KEY (`pincho_idpincho`)
    REFERENCES `G44_ZOTZ`.`pincho` (`idpincho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_codigopincho_usuarios1`
    FOREIGN KEY (`usuarios_login`)
    REFERENCES `G44_ZOTZ`.`usuarios` (`login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `G44_ZOTZ` ;

-- -----------------------------------------------------
-- Placeholder table for view `G44_ZOTZ`.`vista_establecimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `G44_ZOTZ`.`vista_establecimiento` (`id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `G44_ZOTZ`.`vista_concurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `G44_ZOTZ`.`vista_concurso` (`id` INT);

-- -----------------------------------------------------
-- View `G44_ZOTZ`.`vista_establecimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `G44_ZOTZ`.`vista_establecimiento`;
USE `G44_ZOTZ`;
CREATE  OR REPLACE VIEW `vista_establecimiento` AS (
select nombre,direccion,telefono from establecimiento order by 1
);

-- -----------------------------------------------------
-- View `G44_ZOTZ`.`vista_concurso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `G44_ZOTZ`.`vista_concurso`;
USE `G44_ZOTZ`;
CREATE  OR REPLACE VIEW `vista_concurso` AS (
select concurso.edicion,nombrepincho,fotopincho,descripcionpincho,ingredientesp,precio from concurso inner join pincho on concurso.edicion=pincho.concurso_edicion order by 1 desc,2 asc
);
CREATE USER 'zotz' IDENTIFIED BY 'zotz';

GRANT SELECT ON TABLE `G44_ZOTZ`.* TO 'zotz';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `G44_ZOTZ`.* TO 'zotz';
GRANT SELECT, INSERT, TRIGGER ON TABLE `G44_ZOTZ`.* TO 'zotz';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
