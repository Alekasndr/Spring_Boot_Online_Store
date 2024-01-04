-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema online_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema online_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_store` DEFAULT CHARACTER SET utf8 ;
USE `online_store` ;

-- -----------------------------------------------------
-- Table `online_store`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(80) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `role` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`basket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`basket` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_basket_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_basket_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `online_store`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`brand` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `brandcol_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`device` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(70) NOT NULL,
  `price` INT NOT NULL,
  `rating` INT NULL DEFAULT 0,
  `img` VARCHAR(100) NULL,
  `type_id` INT NOT NULL,
  `brand_id` INT NOT NULL,
  PRIMARY KEY (`id`, `type_id`, `brand_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_device_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_device_brand1_idx` (`brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_device_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `online_store`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_device_brand1`
    FOREIGN KEY (`brand_id`)
    REFERENCES `online_store`.`brand` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`basket_device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`basket_device` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `basket_id` INT NOT NULL,
  `device_id` INT NOT NULL,
  PRIMARY KEY (`id`, `basket_id`, `device_id`),
  INDEX `fk_basket_device_basket1_idx` (`basket_id` ASC) VISIBLE,
  INDEX `fk_basket_device_device1_idx` (`device_id` ASC) VISIBLE,
  CONSTRAINT `fk_basket_device_basket1`
    FOREIGN KEY (`basket_id`)
    REFERENCES `online_store`.`basket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_basket_device_device1`
    FOREIGN KEY (`device_id`)
    REFERENCES `online_store`.`device` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rate` INT NOT NULL,
  `user_id` INT NOT NULL,
  `device_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `device_id`),
  INDEX `fk_rating_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_rating_device1_idx` (`device_id` ASC) VISIBLE,
  CONSTRAINT `fk_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `online_store`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_device1`
    FOREIGN KEY (`device_id`)
    REFERENCES `online_store`.`device` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`device_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`device_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(60) NOT NULL,
  `description` VARCHAR(140) NOT NULL,
  `device_id` INT NOT NULL,
  PRIMARY KEY (`id`, `device_id`),
  INDEX `fk_device_info_device1_idx` (`device_id` ASC) VISIBLE,
  CONSTRAINT `fk_device_info_device1`
    FOREIGN KEY (`device_id`)
    REFERENCES `online_store`.`device` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_store`.`type_has_brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`type_has_brand` (
  `type_id` INT NOT NULL,
  `brand_id` INT NOT NULL,
  PRIMARY KEY (`type_id`, `brand_id`),
  INDEX `fk_type_has_brand_brand1_idx` (`brand_id` ASC) VISIBLE,
  INDEX `fk_type_has_brand_type1_idx` (`type_id` ASC) VISIBLE,
  CONSTRAINT `fk_type_has_brand_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `online_store`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_has_brand_brand1`
    FOREIGN KEY (`brand_id`)
    REFERENCES `online_store`.`brand` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
