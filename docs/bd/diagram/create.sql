-- MySQL Script generated by MySQL Workbench
-- Thu Apr 18 19:44:20 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USER` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cpf_cnpj` VARCHAR(14) NOT NULL,
  `kind_person` ENUM('PHYSICS', 'LEGAL') NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TELEPHONE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TELEPHONE` (
  `id` INT NOT NULL,
  `number` VARCHAR(13) NOT NULL,
  `main_number` BIT(1) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_telephone_USER_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_telephone_USER`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`USER` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROPERTY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROPERTY` (
  `id` INT NOT NULL,
  `rooms` INT NULL,
  `bathrooms` INT NULL,
  `private_parking_space` INT NULL,
  `taxes` DOUBLE NULL,
  `fee` DOUBLE NULL,
  `area` DOUBLE NOT NULL,
  `type` ENUM('HOUSE‎', 'APARTMENT‎') NOT NULL,
  `description` VARCHAR(250) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ADVERTISEMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ADVERTISEMENT` (
  `id` INT NOT NULL,
  `user_id` INT NULL,
  `property_id` INT NOT NULL,
  `post_date` DATETIME NOT NULL,
  `value` DECIMAL(15,2) NOT NULL,
  `status` ENUM('SOLD', 'PENDING‎', 'RENTED') NOT NULL,
  `sold_in` DATETIME NULL,
  `deleted` BIT(1) NULL,
  PRIMARY KEY (`id`, `user_id`, `property_id`),
  INDEX `fk_ADVERTISEMENT_USER1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_ADVERTISEMENT_PROPERTY1_idx` (`property_id` ASC) VISIBLE,
  CONSTRAINT `fk_ADVERTISEMENT_USER1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`USER` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ADVERTISEMENT_PROPERTY1`
    FOREIGN KEY (`property_id`)
    REFERENCES `mydb`.`PROPERTY` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ADDRESS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ADDRESS` (
  `id` INT NOT NULL,
  `property_id` INT NOT NULL,
  `street` VARCHAR(150) NOT NULL,
  `state` VARCHAR(20) NOT NULL,
  `zip_code` VARCHAR(8) NOT NULL,
  `neighborhood` VARCHAR(80) NOT NULL,
  `city` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`, `property_id`),
  INDEX `fk_address_PROPERTY1_idx` (`property_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_PROPERTY1`
    FOREIGN KEY (`property_id`)
    REFERENCES `mydb`.`PROPERTY` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FAVORITE_ADS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FAVORITE_ADS` (
  `user_id` INT NOT NULL,
  `advertisement_id` INT NOT NULL,
  INDEX `fk_USER_has_ADVERTISEMENT_ADVERTISEMENT1_idx` (`advertisement_id` ASC) VISIBLE,
  INDEX `fk_USER_has_ADVERTISEMENT_USER1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_USER_has_ADVERTISEMENT_USER1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`USER` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_USER_has_ADVERTISEMENT_ADVERTISEMENT1`
    FOREIGN KEY (`advertisement_id`)
    REFERENCES `mydb`.`ADVERTISEMENT` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
