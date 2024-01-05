-- -----------------------------------------------------
-- Schema online_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_store` DEFAULT CHARACTER SET utf8;
USE `online_store`;

-- -----------------------------------------------------
-- Table `online_store`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`user`
(
    `id`       INT         NOT NULL AUTO_INCREMENT,
    `email`    VARCHAR(80) NOT NULL UNIQUE,
    `password` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`)
);

-- Table: roles
CREATE TABLE IF NOT EXISTS `online_store`.`roles`
(
    id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Table for mapping user and roles: user_roles
CREATE TABLE IF NOT EXISTS `online_store`.`user_roles`
(
    user_id INT NOT NULL,
    role_id INT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (role_id) REFERENCES roles (id),

    UNIQUE (user_id, role_id)
);

-- -----------------------------------------------------
-- Table `online_store`.`basket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`basket`
(
    `id`      INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`)
        REFERENCES `online_store`.`user` (`id`)
);

-- -----------------------------------------------------
-- Table `online_store`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`type`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table `online_store`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`brand`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table `online_store`.`device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`device`
(
    `id`       INT          NOT NULL AUTO_INCREMENT,
    `name`     VARCHAR(70)  NOT NULL UNIQUE,
    `price`    INT          NOT NULL,
    `rating`   INT          NULL DEFAULT 0,
    `img`      VARCHAR(100) NULL,
    `type_id`  INT          NOT NULL,
    `brand_id` INT          NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`type_id`)
        REFERENCES `online_store`.`type` (`id`),
    FOREIGN KEY (`brand_id`)
        REFERENCES `online_store`.`brand` (`id`)
);

-- -----------------------------------------------------
-- Table `online_store`.`basket_device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`basket_device`
(
    `id`        INT NOT NULL AUTO_INCREMENT,
    `basket_id` INT NOT NULL,
    `device_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`basket_id`)
        REFERENCES `online_store`.`basket` (`id`),
    FOREIGN KEY (`device_id`)
        REFERENCES `online_store`.`device` (`id`)
);

-- -----------------------------------------------------
-- Table `online_store`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`rating`
(
    `id`        INT NOT NULL AUTO_INCREMENT,
    `rate`      INT NOT NULL,
    `user_id`   INT NOT NULL,
    `device_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`)
        REFERENCES `online_store`.`user` (`id`),
    FOREIGN KEY (`device_id`)
        REFERENCES `online_store`.`device` (`id`)
);

-- -----------------------------------------------------
-- Table `online_store`.`device_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`device_info`
(
    `id`          INT          NOT NULL AUTO_INCREMENT,
    `title`       VARCHAR(60)  NOT NULL,
    `description` VARCHAR(140) NOT NULL,
    `device_id`   INT          NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`device_id`)
        REFERENCES `online_store`.`device` (`id`)
);

-- -----------------------------------------------------
-- Table `online_store`.`type_has_brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store`.`type_has_brand`
(
    `type_id`  INT NOT NULL,
    `brand_id` INT NOT NULL,
    FOREIGN KEY (`type_id`)
        REFERENCES `online_store`.`type` (`id`),
    FOREIGN KEY (`brand_id`)
        REFERENCES `online_store`.`brand` (`id`),
    UNIQUE (`type_id`, `brand_id`)
);

