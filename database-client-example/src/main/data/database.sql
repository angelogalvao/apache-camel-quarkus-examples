-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exampledb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exampledb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exampledb` DEFAULT CHARACTER SET utf8 ;
USE `exampledb` ;

-- -----------------------------------------------------
-- Table `exampledb`.`example_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exampledb`.`example_table` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value_01` VARCHAR(45) NOT NULL,
  `value_02` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;