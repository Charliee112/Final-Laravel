-- MySQL Script generated by MySQL Workbench
-- Fri Jul 17 01:48:28 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NULL DEFAULT NULL,
  `isbn` VARCHAR(30) NULL DEFAULT NULL,
  `autor` VARCHAR(100) NULL DEFAULT NULL,
  `cantidad` TINYINT NULL DEFAULT NULL,
  `editorial` VARCHAR(50) NULL DEFAULT NULL,
  `foto` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(100) NULL DEFAULT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`libro_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libro_prestamo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NULL DEFAULT NULL,
  `libro_id` INT NULL DEFAULT NULL,
  `fecha_prestamo` DATE NULL DEFAULT NULL,
  `prestado_a` VARCHAR(100) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT NULL,
  `fecha_devolucion` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `libros_prestamos_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `libro_idx` (`libro_id` ASC) VISIBLE,
  CONSTRAINT `libro`
    FOREIGN KEY (`libro_id`)
    REFERENCES `biblioteca`.`libro` (`id`),
  CONSTRAINT `libros_prestamos`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `biblioteca`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`permiso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `slug` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`permiso_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`permiso_rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rol_id` INT NULL DEFAULT NULL,
  `permiso_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `roles_permiso_idx` (`permiso_id` ASC) VISIBLE,
  INDEX `rol_idx` (`rol_id` ASC) VISIBLE,
  CONSTRAINT `rol`
    FOREIGN KEY (`rol_id`)
    REFERENCES `biblioteca`.`rol` (`id`),
  CONSTRAINT `roles_permiso`
    FOREIGN KEY (`permiso_id`)
    REFERENCES `biblioteca`.`permiso` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `biblioteca`.`usuario_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`usuario_rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rol_id` INT NULL DEFAULT NULL,
  `usuario_id` INT NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `rol_idUsuario_idx` (`rol_id` ASC) VISIBLE,
  INDEX `usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `rol_idUsuario`
    FOREIGN KEY (`rol_id`)
    REFERENCES `biblioteca`.`rol` (`id`),
  CONSTRAINT `usuario_id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `biblioteca`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
