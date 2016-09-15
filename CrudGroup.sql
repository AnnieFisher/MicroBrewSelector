-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema beerdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `beerdb` ;

-- -----------------------------------------------------
-- Schema beerdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `beerdb` DEFAULT CHARACTER SET utf8 ;
USE `beerdb` ;

-- -----------------------------------------------------
-- Table `taste`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `taste` ;

CREATE TABLE IF NOT EXISTS `taste` (
  `idtaste` INT NOT NULL AUTO_INCREMENT,
  `taste_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtaste`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `style`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `style` ;

CREATE TABLE IF NOT EXISTS `style` (
  `idstyle` INT NOT NULL AUTO_INCREMENT,
  `style_name` VARCHAR(45) NOT NULL,
  `style_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idstyle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type` ;

CREATE TABLE IF NOT EXISTS `type` (
  `idtype` INT NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(45) NOT NULL,
  `type_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtype`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `brand` ;

CREATE TABLE IF NOT EXISTS `brand` (
  `idbrand` INT NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idbrand`))
ENGINE = InnoDB
PACK_KEYS = Default;


-- -----------------------------------------------------
-- Table `beer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer` ;

CREATE TABLE IF NOT EXISTS `beer` (
  `idbeer` INT NOT NULL AUTO_INCREMENT,
  `beer_name` VARCHAR(45) NOT NULL,
  `rating` INT NOT NULL,
  `taste_idtaste` INT NOT NULL,
  `style_idstyle` INT NOT NULL,
  `type_idtype` INT NOT NULL,
  `brand_idbrand` INT NOT NULL,
  PRIMARY KEY (`idbeer`),
  INDEX `fk_beer_taste_idx` (`taste_idtaste` ASC),
  INDEX `fk_beer_style1_idx` (`style_idstyle` ASC),
  INDEX `fk_beer_type1_idx` (`type_idtype` ASC),
  INDEX `fk_beer_brand1_idx` (`brand_idbrand` ASC),
  CONSTRAINT `fk_beer_taste`
    FOREIGN KEY (`taste_idtaste`)
    REFERENCES `taste` (`idtaste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beer_style1`
    FOREIGN KEY (`style_idstyle`)
    REFERENCES `style` (`idstyle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beer_type1`
    FOREIGN KEY (`type_idtype`)
    REFERENCES `type` (`idtype`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beer_brand1`
    FOREIGN KEY (`brand_idbrand`)
    REFERENCES `brand` (`idbrand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `favorites` VARCHAR(45) NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beer_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer_user` ;

CREATE TABLE IF NOT EXISTS `beer_user` (
  `beer_idbeer` INT NOT NULL,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`beer_idbeer`, `user_iduser`),
  INDEX `fk_beer_has_user_user1_idx` (`user_iduser` ASC),
  INDEX `fk_beer_has_user_beer1_idx` (`beer_idbeer` ASC),
  CONSTRAINT `fk_beer_has_user_beer1`
    FOREIGN KEY (`beer_idbeer`)
    REFERENCES `beer` (`idbeer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beer_has_user_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO beerdbuser;
 DROP USER beerdbuser;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'beerdbuser' IDENTIFIED BY 'beer';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'beerdbuser';
SET SQL_MODE = '';
GRANT USAGE ON *.* TO beerdbuser@localhost;
 DROP USER beerdbuser@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'beerdbuser'@'localhost' IDENTIFIED BY 'beer';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'beerdbuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `taste`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (1, 'Bitter');
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (2, 'Sweet');
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (3, 'Crisp');
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (4, 'Creamy');
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (5, 'Coffee');
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (6, 'Dry');
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (7, 'Cirtus');
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (8, 'Malty');
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (9, 'Nutty');
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (10, 'Spicy');
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (11, 'Hoppy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `style`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (1, 'Amber', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (2, 'Blonde', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (3, 'Brown', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (4, 'Creme', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (5, 'Dark', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (6, 'Golden', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (7, 'Honey', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (8, 'India Pale Ale', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (9, 'Light', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (10, 'Pale', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (11, 'Pilsner', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (12, 'Red', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (13, 'Strong', DEFAULT);
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (14, 'Wheat', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `type`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (1, 'Ale', DEFAULT);
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (2, 'Lager', DEFAULT);
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (3, 'Stout', DEFAULT);
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (4, 'Porter', DEFAULT);
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (5, 'Malt', DEFAULT);
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (6, 'Cider', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `brand`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `brand` (`idbrand`, `brand_name`) VALUES (1, 'Bristol Brewing Company');
INSERT INTO `brand` (`idbrand`, `brand_name`) VALUES (2, 'Avalanche Brewery');
INSERT INTO `brand` (`idbrand`, `brand_name`) VALUES (3, 'Alpine Dog Brewery');
INSERT INTO `brand` (`idbrand`, `brand_name`) VALUES (4, 'Colorado Plus');
INSERT INTO `brand` (`idbrand`, `brand_name`) VALUES (5, 'Flying Dog Brewery');
INSERT INTO `brand` (`idbrand`, `brand_name`) VALUES (6, 'Fort Collins Brewery');
INSERT INTO `brand` (`idbrand`, `brand_name`) VALUES (7, 'Gravity Brewery');
INSERT INTO `brand` (`idbrand`, `brand_name`) VALUES (8, 'Great Divide Brewing Company');
INSERT INTO `brand` (`idbrand`, `brand_name`) VALUES (9, 'Left Hand Brewing Company');
INSERT INTO `brand` (`idbrand`, `brand_name`) VALUES (10, 'Odell Brewing Company');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (1, 'Laughing Lab', 5, 9, 12, 1, 1);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (2, 'Pride Of The West', 4, 1, 5, 4, 2);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (3, 'Blind Sherpa', 4, 5, 5, 3, 3);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (4, 'Honey Pot', 3, 2, 7, 4, 4);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (5, 'Snake Dog', 4, 1, 8, 1, 5);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (6, 'Red Banshee', 5, 10, 12, 1, 6);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (7, 'Flight To Mars', 3, 11, 12, 1, 7);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (8, 'Yeti', 5, 8, 13, 3, 8);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (9, 'Nitro', 4, 4, 5, 3, 9);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (10, '90 Shilling', 4, 11, 1, 1, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `user` (`iduser`, `username`, `password`, `favorites`) VALUES (1, 'testUser@test.com', 'password', NULL);

COMMIT;

