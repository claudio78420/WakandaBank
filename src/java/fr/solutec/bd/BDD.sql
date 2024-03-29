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
DELIMITER $$
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
  `statutcons` BOOLEAN NOT NULL DEFAULT 0,
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
-- Table `WakandaBank`.`Communication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WakandaBank`.`Communication` ;

CREATE TABLE IF NOT EXISTS `WakandaBank`.`Communication` (
  `idcomm` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` TEXT,
  `cli2co` BOOLEAN NOT NULL,
  `read` BOOLEAN NOT NULL DEFAULT 0,
  `idclient` INT NOT NULL,
  `idcons` INT NOT NULL,
  PRIMARY KEY (`idcomm`),
  CONSTRAINT `fk_Communication_Client`
    FOREIGN KEY (`idclient`)
    REFERENCES `WakandaBank`.`Client` (`idclient`))
  -- CONSTRAINT `fk_Communication_Conseiller`
-- 	FOREIGN KEY (`idcons`)
-- 	REFERENCES `WakandaBank`.`Conseiller` (`idcons`))
ENGINE = InnoDB;

ALTER TABLE Communication
ADD FOREIGN KEY (`idcons`) REFERENCES `WakandaBank`.`Conseiller` (`idcons`);
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


-- -----------------------------------------------------
-- Table `WakandaBank`.`Types_modif`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WakandaBank`.`Types_modif` ;

CREATE TABLE IF NOT EXISTS `WakandaBank`.`Types_modif` (
  `idmodif` INT NOT NULL AUTO_INCREMENT,
  `libelle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmodif`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `WakandaBank`.`Historique_chiffres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WakandaBank`.`Historique_chiffres` ;

CREATE TABLE IF NOT EXISTS `WakandaBank`.`Historique_chiffres` (
  `idchiffres` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ancien` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `nouveau` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `idmodif` INT NOT NULL,
  `idcompte` BIGINT NOT NULL,
  PRIMARY KEY (`idchiffres`),
  CONSTRAINT `fk_HistoriqueChiffres_Type`
    FOREIGN KEY (`idmodif`)
    REFERENCES `WakandaBank`.`Types_modif` (`idmodif`),
  CONSTRAINT `fk_HistoriqueChiffres_Compte`
	FOREIGN KEY (`idcompte`)
	REFERENCES `WakandaBank`.`Compte` (`idcompte`))
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `WakandaBank`.`Historique_profils`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WakandaBank`.`Historique_profils` ;

CREATE TABLE IF NOT EXISTS `WakandaBank`.`Historique_profils` (
  `idprofils` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ancien` VARCHAR(45) NOT NULL DEFAULT 0,
  `nouveau` VARCHAR(45) NOT NULL DEFAULT 0,
  `idmodif` INT NOT NULL,
  `idclient` INT NOT NULL,
  PRIMARY KEY (`idprofils`),
  CONSTRAINT `fk_HistoriqueProfil_Type`
    FOREIGN KEY (`idmodif`)
    REFERENCES `WakandaBank`.`Types_modif` (`idmodif`),
  CONSTRAINT `fk_HistoriqueProfil_Client`
    FOREIGN KEY (`idclient`)
    REFERENCES `WakandaBank`.`Client` (`idclient`))
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Test values
-- -----------------------------------------------------



DROP PROCEDURE IF EXISTS gothomas$$
CREATE PROCEDURE gothomas()
BEGIN
 -- Déclarer l'exception
 DECLARE violation_contrainte CONDITION FOR SQLSTATE '23000';
 -- Puis son interception
 DECLARE EXIT HANDLER FOR violation_contrainte
 BEGIN
 -- Annuler la transaction
ROLLBACK;
 SELECT 'Opération annullée';
 END;
 START TRANSACTION;
 INSERT INTO `wakandabank`.`Types_modif` (`idmodif`, `libelle`) VALUES ('1', 'Solde'), ('2', 'Plafond de Découvert'), ('3', 'Statut Carte'), ('4', 'Nom'), ('5', 'Mot de passe');
INSERT INTO `wakandabank`.`administrateur` (`idadmin`, `nomadmin`, `prenomadmin`, `passwordadmin`, `mailadmin`) VALUES ('1', 'Admin', 'Test', 'admin', 'test@admin');

INSERT INTO `wakandabank`.`conseiller` (`idcons`, `nomcons`, `prenomcons`, `mailcons`, `passwordcons`) VALUES ('1', 'Cons1', 'Test1', 'cons1@test', 'test1');
INSERT INTO `wakandabank`.`conseiller` (`idcons`, `nomcons`, `prenomcons`, `mailcons`, `passwordcons`) VALUES ('2', 'Cons2', 'Test2', 'cons2@test', 'test2');
INSERT INTO `wakandabank`.`conseiller` (`idcons`, `nomcons`, `prenomcons`, `mailcons`, `passwordcons`, `statutcons`) VALUES ('3', 'Cons3', 'Test3', 'cons3@test', 'test3', '0');

INSERT INTO `wakandabank`.`client` (`idclient`, `nomclient`, `prenomclient`, `mailclient`, `passwordclient`, `idcons`) VALUES ('1', 'Client1', 'Test1', 'client1@test', 'test1', '1');
INSERT INTO `wakandabank`.`client` (`idclient`, `nomclient`, `prenomclient`, `mailclient`, `passwordclient`, `idcons`) VALUES ('2', 'Client2', 'Test2', 'client2@test', 'test2', '1');
INSERT INTO `wakandabank`.`client` (`idclient`, `nomclient`, `prenomclient`, `mailclient`, `passwordclient`, `idcons`) VALUES ('3', 'Client3', 'Test3', 'client3@test', 'test3', '2');

INSERT INTO `wakandabank`.`compte` (`idcompte`, `idcarte`, `statutcarte`, `decouvertcompte`, `soldecompte`, `idclient`) VALUES ('111111111111', '1111111111111111', '1', '0', '420.69', '1');
INSERT INTO `wakandabank`.`compte` (`idcompte`, `idcarte`, `statutcarte`, `decouvertcompte`, `soldecompte`, `idclient`) VALUES ('222222222222', '2222222222222222', '1', '0', '0', '2');
INSERT INTO `wakandabank`.`compte` (`idcompte`, `idcarte`, `statutcarte`, `decouvertcompte`, `soldecompte`, `idclient`) VALUES ('333333333333', '3333333333333333', '0', '500', '0', '1');

 COMMIT;
END$$

DROP TRIGGER IF EXISTS update_log_chiffres $$
CREATE TRIGGER update_log_chiffres
AFTER UPDATE
ON `WakandaBank`.`Compte`
FOR EACH ROW
BEGIN
	IF NEW.soldecompte <> OLD.soldecompte THEN
    INSERT INTO `wakandabank`.`Historique_chiffres` (`date`, `ancien`, `nouveau`, `idmodif`, `idcompte`) 
    VALUES (NOW(), old.soldecompte, new.soldecompte, 1, OLD.idcompte);
    END IF;
    
    IF NEW.decouvertcompte <> OLD.decouvertcompte THEN
    INSERT INTO `wakandabank`.`Historique_chiffres` (`date`, `ancien`, `nouveau`, `idmodif`, `idcompte`) 
    VALUES (NOW(), old.decouvertcompte, new.decouvertcompte, 2, OLD.idcompte);
    END IF;
    
    IF NEW.statutcarte <> OLD.statutcarte THEN
    INSERT INTO `wakandabank`.`Historique_chiffres` (`date`, `ancien`, `nouveau`, `idmodif`, `idcompte`) 
    VALUES (NOW(), old.statutcarte, new.statutcarte, 3, OLD.idcompte);
    END IF;
END $$

DROP TRIGGER IF EXISTS update_log_profils $$

CREATE TRIGGER update_log_profils
AFTER UPDATE
ON `WakandaBank`.`Client`
FOR EACH ROW
BEGIN
	IF NEW.nomclient <> OLD.nomclient THEN
    INSERT INTO `wakandabank`.`Historique_profils` (`date`, `ancien`, `nouveau`, `idmodif`, `idclient`) 
    VALUES (NOW(), old.nomclient, new.nomclient, 4, OLD.idclient);
    END IF;
    
    IF NEW.passwordclient <> OLD.passwordclient THEN
    INSERT INTO `wakandabank`.`Historique_profils` (`date`, `ancien`, `nouveau`, `idmodif`, `idclient`) 
    VALUES (NOW(), old.passwordclient, new.passwordclient, 5, OLD.idclient);
    END IF;
END $$

call gothomas()