/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  esic
 * Created: 9 oct. 2019
 * Ammended by TLeMet 09 oct. 2019 15:58
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
  `idcons` INT NOT NULL,
  PRIMARY KEY (`idclient`),
  CONSTRAINT `fk_Client_Conseiller`
    FOREIGN KEY (`idcons`)
    REFERENCES `WakandaBank`.`Conseiller` (`idcons`))
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
  `idcompte` BIGINT NOT NULL,
  `idcarte` BIGINT NOT NULL,
  `statutcarte` TINYINT NOT NULL DEFAULT 0,
  `decouvertcompte` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `soldecompte` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `idclient` INT NOT NULL,
  PRIMARY KEY (`idcompte`),
  CONSTRAINT `fk_Compte_Client`
    FOREIGN KEY (`idclient`)
    REFERENCES `WakandaBank`.`Client` (`idclient`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Test values
-- -----------------------------------------------------

INSERT INTO `wakandabank`.`administrateur` (`idadmin`, `nomadmin`, `prenomadmin`, `passwordadmin`, `mailadmin`) VALUES ('1', 'Admin', 'Test', 'admin', 'test@admin');

INSERT INTO `wakandabank`.`conseiller` (`idcons`, `nomcons`, `prenomcons`, `mailcons`, `passwordcons`) VALUES ('1', 'Cons1', 'Test1', 'cons1@test', 'test1');
INSERT INTO `wakandabank`.`conseiller` (`idcons`, `nomcons`, `prenomcons`, `mailcons`, `passwordcons`) VALUES ('2', 'Cons2', 'Test2', 'cons2@test', 'test2');

INSERT INTO `wakandabank`.`client` (`idclient`, `nomclient`, `prenomclient`, `mailclient`, `passwordclient`, `idcons`) VALUES ('1', 'Client1', 'Test1', 'client1@test', 'test1', '1');
INSERT INTO `wakandabank`.`client` (`idclient`, `nomclient`, `prenomclient`, `mailclient`, `passwordclient`, `idcons`) VALUES ('2', 'Client2', 'Test2', 'client2@test', 'test2', '1');
INSERT INTO `wakandabank`.`client` (`idclient`, `nomclient`, `prenomclient`, `mailclient`, `passwordclient`, `idcons`) VALUES ('3', 'Client3', 'Test3', 'client3@test', 'test3', '2');

INSERT INTO `wakandabank`.`compte` (`idcompte`, `idcarte`, `statutcarte`, `decouvertcompte`, `soldecompte`, `idclient`) VALUES ('111111111111', '1111111111111111', '1', '0', '420.69', '1');
INSERT INTO `wakandabank`.`compte` (`idcompte`, `idcarte`, `statutcarte`, `decouvertcompte`, `soldecompte`, `idclient`) VALUES ('222222222222', '2222222222222222', '1', '0', '0', '2');
INSERT INTO `wakandabank`.`compte` (`idcompte`, `idcarte`, `statutcarte`, `decouvertcompte`, `soldecompte`, `idclient`) VALUES ('333333333333', '3333333333333333', '0', '500', '0', '1');
