/**
 * @author Michael Wiesendanger <michael.wiesendanger@gmail.com>
 * @copyright Copyright (c) 2017
 *
 */

/************ BUILD TABLES ************/
CREATE TABLE IF NOT EXISTS  `expansion` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `expansion` VARCHAR(30) NOT NULL,
  `expansion_short` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `class` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `class_name` VARCHAR(25) NOT NULL, -- classname
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tree` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `class_id` BIGINT(20) NOT NULL,
  `tree_name` VARCHAR(20) NOT NULL, -- name of the tree
  `tree_pos` INT(1) NOT NULL, -- position of the tree 1-3
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `fk_tree_class_id_class_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `talent` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `tree_id` BIGINT(20) NOT NULL,
  `talent_name` VARCHAR(80) NOT NULL,
  `icon` VARCHAR(60) NOT NULL, -- icon
  `tier_pos` INT(2) NOT NULL, -- tier 0-10
  `talent_pos` INT(2) NOT NULL, -- position 1-4
  `max_points` INT(2) NOT NULL, -- max points that can get spent into this talent
  `dependency` INT(10) NULL, -- id of the spell that acts as a dependency on the current talent
  PRIMARY KEY(`id`),
  KEY `tree_id` (`tree_id`),
  CONSTRAINT `fk_talent_tree_id_tree_id` FOREIGN KEY (`tree_id`) REFERENCES `tree` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tooltip` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `talent_id` BIGINT(20) NOT NULL,
  `locale` VARCHAR(3) NOT NULL,
  `rank_1` VARCHAR(1000) NULL,
  `rank_2` VARCHAR(1000) NULL,
  `rank_3` VARCHAR(1000) NULL,
  `rank_4` VARCHAR(1000) NULL,
  `rank_5` VARCHAR(1000) NULL,
  PRIMARY KEY(`id`),
  KEY `talent_id` (`talent_id`),
  CONSTRAINT `fk_tooltip_talent_id_talent_id` FOREIGN KEY (`talent_id`) REFERENCES `talent` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dependency` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `tree_id` BIGINT(20) NOT NULL, -- tree id
  `tier_pos` INT(2) NOT NULL, -- tier 0-10
  `talent_pos` INT(2) NOT NULL, -- position 1-4
  `alignment` VARCHAR(30) NOT NULL, -- horizontal or vertical
  -- horizontal dependency arrow pointing to left or right
  -- vertical dependency justify one position to right or left
  `justify` VARCHAR(20) NULL,
  `combined` TINYINT(1) NOT NULL, -- used for vertical arrows that are combined with a plain one
  `range` INT(1) NOT NULL, -- dependency range of an arrow over the tiers
  `dependency` INT(4) NOT NULL, -- reference to the talentid where this arrow leads to
  PRIMARY KEY(`id`),
  KEY `tree_id` (`tree_id`),
  CONSTRAINT `fk_dependency_tree_id_tree_id` FOREIGN KEY (`tree_id`) REFERENCES `tree` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
