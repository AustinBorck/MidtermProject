-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzadb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pizzadb` ;

-- -----------------------------------------------------
-- Schema pizzadb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzadb` DEFAULT CHARACTER SET utf8 ;
USE `pizzadb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(200) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address_id` INT NULL,
  `enabled` TINYINT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `password_UNIQUE` (`password` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_joint`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizza_joint` ;

CREATE TABLE IF NOT EXISTS `pizza_joint` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(5000) NULL,
  `name` VARCHAR(45) NOT NULL,
  `website_url` VARCHAR(5000) NULL,
  `description` TEXT NULL,
  `date_added` DATETIME NOT NULL,
  `approved` TINYINT NOT NULL,
  `address_id` INT NOT NULL,
  `added_by_user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pizza_joint_address1_idx` (`address_id` ASC),
  INDEX `fk_pizza_joint_user1_idx` (`added_by_user_id` ASC),
  CONSTRAINT `fk_pizza_joint_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizza_joint_user1`
    FOREIGN KEY (`added_by_user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review` ;

CREATE TABLE IF NOT EXISTS `review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NOT NULL,
  `comments` VARCHAR(5000) NULL,
  `review_date` DATETIME NOT NULL,
  `active` TINYINT NOT NULL,
  `pizza_joint_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reviews_pizza_joint_idx` (`pizza_joint_id` ASC),
  INDEX `fk_review_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_reviews_pizza_joint`
    FOREIGN KEY (`pizza_joint_id`)
    REFERENCES `pizza_joint` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review_image` ;

CREATE TABLE IF NOT EXISTS `review_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(5000) NULL,
  `review_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_image_review1_idx` (`review_id` ASC),
  CONSTRAINT `fk_review_image_review1`
    FOREIGN KEY (`review_id`)
    REFERENCES `review` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `attribute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `attribute` ;

CREATE TABLE IF NOT EXISTS `attribute` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_option_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_option_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_joint_attribute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizza_joint_attribute` ;

CREATE TABLE IF NOT EXISTS `pizza_joint_attribute` (
  `pizza_joint_id` INT NOT NULL,
  `option_id` INT NOT NULL,
  PRIMARY KEY (`pizza_joint_id`, `option_id`),
  INDEX `fk_pizza_joint_has_option_option1_idx` (`option_id` ASC),
  INDEX `fk_pizza_joint_has_option_pizza_joint1_idx` (`pizza_joint_id` ASC),
  CONSTRAINT `fk_pizza_joint_has_option_pizza_joint1`
    FOREIGN KEY (`pizza_joint_id`)
    REFERENCES `pizza_joint` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizza_joint_has_option_option1`
    FOREIGN KEY (`option_id`)
    REFERENCES `attribute` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_pizza_joint`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_pizza_joint` ;

CREATE TABLE IF NOT EXISTS `favorite_pizza_joint` (
  `pizza_joint_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`pizza_joint_id`, `user_id`),
  INDEX `fk_pizza_joint_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_pizza_joint_has_user_pizza_joint1_idx` (`pizza_joint_id` ASC),
  CONSTRAINT `fk_pizza_joint_has_user_pizza_joint1`
    FOREIGN KEY (`pizza_joint_id`)
    REFERENCES `pizza_joint` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizza_joint_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_build`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizza_build` ;

CREATE TABLE IF NOT EXISTS `pizza_build` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `build_image` VARCHAR(5000) NULL,
  `build_name` VARCHAR(45) NULL,
  `description` TEXT NOT NULL,
  `pizza_joint_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pizza_build_pizza_joint1_idx` (`pizza_joint_id` ASC),
  INDEX `fk_pizza_build_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_pizza_build_pizza_joint1`
    FOREIGN KEY (`pizza_joint_id`)
    REFERENCES `pizza_joint` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizza_build_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `build_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `build_comment` ;

CREATE TABLE IF NOT EXISTS `build_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NOT NULL,
  `user_id` INT NOT NULL,
  `pizza_build_id` INT NOT NULL,
  `comment_date` DATETIME NOT NULL,
  `build_comment_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_build_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_build_comment_pizza_build1_idx` (`pizza_build_id` ASC),
  INDEX `fk_build_comment_build_comment1_idx` (`build_comment_id` ASC),
  CONSTRAINT `fk_build_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_build_comment_pizza_build1`
    FOREIGN KEY (`pizza_build_id`)
    REFERENCES `pizza_build` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_build_comment_build_comment1`
    FOREIGN KEY (`build_comment_id`)
    REFERENCES `build_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS pizzauser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'pizzauser'@'localhost' IDENTIFIED BY 'pizzauser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'pizzauser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzadb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`, `phone_number`) VALUES (1, '163 W Mountain Ave', 'Fort Collins', 'CO', '80524', '9702219000');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`, `phone_number`) VALUES (2, '205 North College Ave', 'Fort Collins', 'CO', '80524', '9704988898');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`, `phone_number`) VALUES (3, '1215 Main Street Unit I', 'Windsor', 'CO', '80550', '9706869967');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzadb`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `address_id`, `enabled`, `role`) VALUES (1, 'tiarrablandin', 'admin1', 'Tiarra', 'Blandin', null, 1, 'admin');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `address_id`, `enabled`, `role`) VALUES (2, 'austinborck', 'admin2', 'Austin', 'Borck', null, 1, 'admin');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `address_id`, `enabled`, `role`) VALUES (3, 'diegoescutia', 'admin3', 'Diego', 'Escutia', null, 1, 'admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `pizza_joint`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzadb`;
INSERT INTO `pizza_joint` (`id`, `image_url`, `name`, `website_url`, `description`, `date_added`, `approved`, `address_id`, `added_by_user_id`) VALUES (1, 'https://slycepizzaco.com/wp-content/uploads/2021/04/IMG_0254-1-1-1-400x511.jpg', 'Slyce Pizza Co.', 'https://slycepizzaco.com/', 'Pizza Creations With The Highest Quality Ingredients', '2022-08-19', 1, 1, 1);
INSERT INTO `pizza_joint` (`id`, `image_url`, `name`, `website_url`, `description`, `date_added`, `approved`, `address_id`, `added_by_user_id`) VALUES (2, 'https://scontent.fapa1-1.fna.fbcdn.net/v/t31.18172-8/23551028_10156984807817818_3481223647572248205_o.jpg?_nc_cat=106&ccb=1-7&_nc_sid=cdbe9c&_nc_ohc=6kNLa5st-30AX8eUI89&_nc_ht=scontent.fapa1-1.fna&oh=00_AT-75tYofjmOh2siqHA1f20JE0NImlQnjX6Y0ZrXwo47ew&oe=63237F7E', 'BeauJo\'s', 'https://www.beaujos.com/locations/fort-collins/', 'The flavors (and “afterglow”—i.e. how we feel) are insanely good. Why? En lieu of sugar, we use honey in the dough and pizza sauce. And the dough—available in wheat or white—sticks with 100-percent pure olive oil. Did we mention we make the dough fresh every 3-4 hours, every single day? Our dough, then crust, is what Chip, our owner, refers to as “the Containment System” – the roll of the crust actually helps contain all your mountain high, mountain pie ingredients!', '2022-08-19', 1, 2, 1);
INSERT INTO `pizza_joint` (`id`, `image_url`, `name`, `website_url`, `description`, `date_added`, `approved`, `address_id`, `added_by_user_id`) VALUES (3, 'https://scontent.fapa1-1.fna.fbcdn.net/v/t39.30808-6/277529442_7160938983976846_3071662410654817087_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=4VzFCLI7a0QAX-qBGbN&_nc_ht=scontent.fapa1-1.fna&oh=00_AT-VLCI6UR3hm3ojC0AKY5FeQ8d8IWcsUAwHCmOMaZLdaw&oe=63040B6C', 'Windsor Brick Oven Pizza & Subs', 'https://www.windsorbrickovenpizza.com/', 'Windsor Brick Oven Pizza & Subs in Windsor, Colorado is a locally owned and operated pizzeria, proudly serving the greater Windsor, Colorado area. We take pride in only serving the freshest ingredients! Our vegetables are sliced and diced daily, our dough is made fresh everyday, and our cheeses are grated daily to ensure the best taste!', '2022-08-19', 1, 3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzadb`;
INSERT INTO `review` (`id`, `rating`, `comments`, `review_date`, `active`, `pizza_joint_id`, `user_id`) VALUES (1, 5, 'Great pizza and even better garlic breadsticks.', '2022-08-19', 1, 1, 1);
INSERT INTO `review` (`id`, `rating`, `comments`, `review_date`, `active`, `pizza_joint_id`, `user_id`) VALUES (2, 5, 'LOVE LOVE LOVE the crust with honey! Ad their wings are good too!', '2022-08-19', 1, 2, 1);
INSERT INTO `review` (`id`, `rating`, `comments`, `review_date`, `active`, `pizza_joint_id`, `user_id`) VALUES (3, 4, 'Good pizza! Lots of cheese!', '2022-08-19', 1, 3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzadb`;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1, 'Pizza Type', NULL);
INSERT INTO `category` (`id`, `name`, `description`) VALUES (2, 'Dietary', NULL);
INSERT INTO `category` (`id`, `name`, `description`) VALUES (3, 'Dining', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `attribute`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzadb`;
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (1, 'Delivery', NULL, 3);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (2, 'Dine-in', NULL, 3);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (3, 'Carry-out', NULL, 3);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (4, 'New York style', NULL, 1);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (5, 'Brooklyn style', NULL, 1);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (6, 'Chicago style', NULL, 1);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (7, 'California style', NULL, 1);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (8, 'Wood-fired', NULL, 1);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (9, 'Deep-dish', NULL, 1);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (10, 'Sicilian style', NULL, 1);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (11, 'Thin-crust', NULL, 1);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (12, 'Detriot style', NULL, 1);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (13, 'Neapolitan style', NULL, 1);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (14, 'Vegan options', NULL, 2);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (15, 'Gluten-free options', NULL, 2);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (16, 'Kosher options', NULL, 2);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (17, 'Keto options', NULL, 2);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (18, 'Take & bake', NULL, 3);
INSERT INTO `attribute` (`id`, `name`, `description`, `category_id`) VALUES (19, 'Colorado style', NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pizza_joint_attribute`
-- -----------------------------------------------------
START TRANSACTION;
USE `pizzadb`;
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (1, 1);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (1, 2);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (1, 3);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (1, 14);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (1, 4);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (2, 1);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (2, 2);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (2, 3);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (2, 18);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (2, 19);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (2, 15);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (2, 14);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (3, 1);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (3, 2);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (3, 3);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (3, 4);
INSERT INTO `pizza_joint_attribute` (`pizza_joint_id`, `option_id`) VALUES (3, 15);

COMMIT;

