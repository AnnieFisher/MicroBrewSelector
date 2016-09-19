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
  `style_desc` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idstyle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type` ;

CREATE TABLE IF NOT EXISTS `type` (
  `idtype` INT NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(45) NOT NULL,
  `type_desc` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idtype`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `brand` ;

CREATE TABLE IF NOT EXISTS `brand` (
  `idbrand` INT NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(45) NOT NULL,
  `brand_image` VARCHAR(256) NULL,
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
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
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
INSERT INTO `taste` (`idtaste`, `taste_name`) VALUES (7, 'Citrus');
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
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (1, 'Amber', 'Full bodied malt aromas with hints of caramel. These beers could be either lager or ale.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (2, 'Blonde', 'Very pale in color and tend to be clear, crisp, and dry, with low-to-medium bitterness and aroma from hops and some sweetness from malt.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (3, 'Brown', 'Dark amber or brown in color. Have evidence of caramel and chocolate flavors and may have a slight citrus accent or be strong, malty or nutty.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (4, 'Cream', 'A very mild, sweetish, golden style of ale.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (5, 'Dark', 'British type beer, combining hops, yeast and a blend of malts. It is a medium chestnut brown color, with a delicate fruity smell and robust, malty character.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (6, 'Fruit', 'Most fruit beers are ales however, they typically do not carry an ale character. In order to allow for the fruit flavor to come through, the malt’s flavor is not dominant and there is a low bitterness level to the beer.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (7, 'Golden', 'First developed in the UK, Golden ales are straw colored with a slight hint of citrus and vanilla. The beer can sometimes contain spicier flavors.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (8, 'Honey', 'A full-bodied beer with a creamy texture and copper color. Honey beers are slightly sweet with hints of caramel.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (9, 'I.P.A.', 'A hoppier version of pale ale. Originally brewed in England with extra hops to survive the journey to British troops stationed in India.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (10, 'Light', 'Extremely light in color and mild in flavor. Light beer has fewer calories and/or lower alcohol content.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (11, 'Pale', 'Pale ale has a fruity, copper-colored style. It originated from England. Pale ales are robust beers that can be enjoyed with strongly spiced foods.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (12, 'Pilsner', 'Made with neutral and hard water. Tend to be golden in color with a dry, crisp, and somewhat bitter flavor. Pilsner stands out from other lagers due to its more distinctive hop taste.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (13, 'Red', 'Red ales can either be red or light brown in color. They are moderate to heavy in flavor and contain hints of caramel that is offset by the predominant hop characteristic of the beer.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (14, 'Strong', 'This is a broad grouping that can describe any beer over 7% ABV. Strong beers are typically dark in color, some are almost black. Different styles can include old ales, double IPAs, and barley wines.');
INSERT INTO `style` (`idstyle`, `style_name`, `style_desc`) VALUES (15, 'Wheat', 'Light and easy to drink with very little aftertaste. Wheat provides a soft character to beer and is sometimes hazy or cloudy with a touch of spice notes.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `type`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (1, 'Ale', 'Fuller-bodied, with nuances of fruit or spice and a hoppy finish.');
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (2, 'Lager', 'Crisp and refreshing with a smooth finish from longer aging.');
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (3, 'Stout', 'Rich creamy head and flavored and colored by barley.');
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (4, 'Porter', 'Dark, almost black, fruity-dry fermenting style. Brewed with a combination of roasted malt to impart flavor, color, and aroma.');
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (5, 'Malt', 'Dark and sweet in flavor. Contain hints of caramel, toffee, and nuts. Light to full bodied.');
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (6, 'Cider', 'High juice content and sharp taste.');
INSERT INTO `type` (`idtype`, `type_name`, `type_desc`) VALUES (DEFAULT, '', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `brand`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (1, 'Bristol Brewing Company', 'http://media.publicbroadcasting.net/kuvo/newsroom/images/3688510.jpg');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (2, 'Avalanche Brewery', 'http://bottlemakesthree.com/wp-content/uploads/2015/09/Avalanche-Brewing-Logo.png');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (3, 'Alpine Dog Brewery', 'https://pbs.twimg.com/profile_images/501924192091000832/jtGEj8KB.jpeg');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (4, 'Colorado Plus', 'http://3.bp.blogspot.com/-kiRj5hkj0J4/UZD_1WJKDqI/AAAAAAAAT70/7lETal-fcyQ/s320/colo-plus.png');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (5, 'Flying Dog Brewery', 'http://www.dcbeer.com/sites/default/files/news/flying%20dog%20logo.jpeg');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (6, 'Fort Collins Brewery', 'http://fortcollinsbrewery.com/wp-content/uploads/2015/02/FCBandTavernLogo1.png');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (7, 'Gravity Brewery', 'https://pbs.twimg.com/profile_images/2312612654/s4mv345qdaeh4mw2gahh_400x400.png');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (8, 'Great Divide Brewing Company', 'http://greatdivide.com/wp-content/uploads/2016/05/Great-Divide-Main-Logo-rectangle-HR-copy.png');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (9, 'Left Hand Brewing Company', 'http://fuhrerwholesale.com/wp-content/uploads/Left_Hand_Logo.png');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (10, 'Odell Brewing Company', 'https://upload.wikimedia.org/wikipedia/en/3/33/Odell_Brewing_Company_logo.png');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (11, 'Avery Brewing Company', 'https://upload.wikimedia.org/wikipedia/en/8/8b/Avery_Brewing_Company_logo.jpg');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (12, 'Oskar Blue\'s Brewery', 'https://www.oskarblues.com/assets/ob.og.image.png');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (13, 'Dry Dock', 'http://co.foodmarketmaker.com/uploads/d6c4e988a73c9cca963525363f0c7996.jpg');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (14, 'Station 26 Brewing', 'https://taplister-logos.s3.amazonaws.com/7305cab9-4dbc-4a7a-8e89-3bf0cf3005c3.jpg');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (15, 'Colorado Golden Cider Company', 'http://www.coloradocider.com/colorado-cider.jpg');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (16, 'Golden City Brewery', 'https://untappd.akamaized.net/photo/2015_11_03/8ca26887823fa1be5a8fecbde46a03eb_320x320.jpg');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (17, 'Aspen', 'http://beerpulse.com/wp-content/uploads/2011/12/aspen-logo.jpg');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (18, 'New Belgium Brewery', 'http://www.stealingshare.com/wp-content/uploads/2014/07/new-belgium-art-gkeo5hpo-1new-belgium-brewing.jpg');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (19, 'Breckenridge Brewery', 'http://www.breckbrew.com/_stay_out/images/logo.png');
INSERT INTO `brand` (`idbrand`, `brand_name`, `brand_image`) VALUES (20, 'Crazy Mountain Brewery', 'http://neo.worldclassbeer.com/wp-content/beer_spy/images/prodimages/CrazyMountain/lCrazyMountainLogo.png');

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
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (11, 'Joe\'s Premium American Pilsner', 5, 11, 12, 2, 11);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (12, 'White Rascall', 1, 3, 15, 1, 11);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (13, 'Dales Pale Ale', 2, 11, 11, 1, 12);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (14, 'Apricot Blonde', 2, 3, 2, 1, 13);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (15, 'Vanilla Porter', 3, 2, 3, 4, 13);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (16, 'Pinner', 3, 7, 9, 5, 12);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (17, 'Priscilla American Wit', 2, 7, 15, 1, 12);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (18, 'Tangerine Cream', 4, 4, 4, 3, 14);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (19, 'Pale Ale', 4, 6, 9, 1, 14);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (20, 'Radl\'Ah', 2, 7, 6, 6, 15);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (21, 'Glider Cider', 3, 6, 6, 6, 15);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (22, 'Clear Creek Gold Pale Ale', 2, 6, 7, 1, 16);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (23, 'Belgian Blonde Ale', 1, 11, 2, 1, 17);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (24, 'Independence Pass Ipa', 2, 11, 9, 1, 17);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (25, 'Samaels Oak Aged Ale', 1, 2, 14, 1, 11);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (26, 'El Gose', 4, 7, 6, 1, 11);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (27, 'Ellies Brown Ale', 5, 9, 3, 1, 11);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (28, 'Ipa', 1, 7, 9, 1, 11);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (51, 'Karma Pale Ale', 2, 6, 11, 1, 11);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (29, 'Liliko\'i Kepolo', 3, 10, 6, 1, 11);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (30, 'Mephistopheles Stout', 3, 1, 5, 3, 11);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (31, 'Old Perseverance', 2, 2, 3, 3, 11);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (32, 'Out Of Mind', 3, 5, 5, 3, 11);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (33, 'Fat Tire', 1, 10, 1, 1, 18);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (34, 'Ranger', 2, 11, 9, 1, 18);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (35, 'Snapshot', 3, 7, 15, 1, 18);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (36, 'Trippel', 1, 10, 7, 1, 18);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (37, 'Sunshine Wheat', 1, 7, 15, 1, 18);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (38, 'Blue Paddle', 3, 3, 12, 2, 18);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (39, '1020 Pale', 3, 7, 6, 1, 6);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (40, 'Black Sheep', 4, 11, 9, 1, 6);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (41, 'Far Away', 2, 7, 9, 1, 6);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (42, 'Major Tom\'s Co Pomegranate Wheat', 4, 7, 9, 1, 6);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (43, 'Shot Down', 2, 4, 4, 3, 6);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (44, '471 Co Double Ipa', 2, 11, 14, 1, 19);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (45, 'Agave Wheat', 3, 7, 15, 1, 19);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (46, 'Kings Dish', 4, 8, 5, 1, 19);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (47, 'Lucky U Ipa', 2, 11, 11, 1, 19);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (48, 'Mango Mosaic', 1, 8, 6, 1, 19);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (49, 'World Peace Death Ray Imp Ipa', 2, 1, 1, 1, 1);
INSERT INTO `beer` (`idbeer`, `beer_name`, `rating`, `taste_idtaste`, `style_idstyle`, `type_idtype`, `brand_idbrand`) VALUES (50, 'Hookiebobb Ipa', 4, 11, 9, 1, 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `user` (`iduser`, `username`, `password`, `first_name`, `last_name`, `city`, `state`) VALUES (1, 'testUser@test.com', 'password', 'Jane', 'Doe', 'Denver', 'CO');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerdb`;
INSERT INTO `beer_user` (`beer_idbeer`, `user_iduser`) VALUES (2, 1);
INSERT INTO `beer_user` (`beer_idbeer`, `user_iduser`) VALUES (3, 1);
INSERT INTO `beer_user` (`beer_idbeer`, `user_iduser`) VALUES (1, 1);

COMMIT;

