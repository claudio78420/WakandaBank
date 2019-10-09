/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  esic
 * Created: 9 oct. 2019
 */

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema WakandaBank
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema WakandaBank
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `WakandaBank` DEFAULT CHARACTER SET utf8 ;
USE `WakandaBank` ;

-- -----------------------------------------------------
-- Table `WakandaBank`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WakandaBank`.`Client` ;

CREATE TABLE IF NOT EXISTS `WakandaBank`.`Client` (
  `idclient` INT NOT NULL AUTO_INCREMENT,
  `nomclient` VARCHAR(45) NOT NULL,
  `prenomclient` VARCHAR(45) NOT NULL,
  `mailclient` VARCHAR(45) NOT NULL,
  `passwordclient` VARCHAR(45) NOT NULL,
  `photoclient` BLOB,
  PRIMARY KEY (`idclient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WakandaBank`.`Conseiller`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WakandaBank`.`Conseiller` ;

CREATE TABLE IF NOT EXISTS `WakandaBank`.`Conseiller` (
  `idcons` INT NOT NULL AUTO_INCREMENT,
  `nomcons` VARCHAR(45) NOT NULL,
  `prenomcons` VARCHAR(45) NOT NULL,
  `mailcons` VARCHAR(45) NOT NULL,
  `passwordcons` VARCHAR(45) NOT NULL,
  `photocons` BLOB,
  PRIMARY KEY (`idcons`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WakandaBank`.`Administrateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WakandaBank`.`Administrateur` ;

CREATE TABLE IF NOT EXISTS `WakandaBank`.`Administrateur` (
  `idadmin` INT NOT NULL AUTO_INCREMENT,
  `nomadmin` VARCHAR(45) NOT NULL,
  `prenomadmin` VARCHAR(45) NOT NULL,
  `passwordadmin` VARCHAR(45) NOT NULL,
  `mailadmin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idadmin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WakandaBank`.`Compte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WakandaBank`.`Compte` ;

CREATE TABLE IF NOT EXISTS `WakandaBank`.`Compte` (
  `idcompte` VARCHAR(45) NOT NULL,
  `idcarte` VARCHAR(45) NOT NULL,
  `statutcarte` TINYINT NULL,
  `decouvertcompte` FLOAT NULL,
  `soldecompte` FLOAT NULL,
  `idclient` INT NOT NULL,
  PRIMARY KEY (`idcompte`),
  CONSTRAINT `fk_Compte_Client`
    FOREIGN KEY (`idclient`)
    REFERENCES `WakandaBank`.`Client` (`idclient`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
