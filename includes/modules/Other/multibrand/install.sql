CREATE TABLE IF NOT EXISTS `hb_brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `url` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`brand_id`),
  UNIQUE INDEX `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
##########
CREATE TABLE IF NOT EXISTS `hb_brand_config` (
  `brand_id` int(11) NOT NULL,
  `setting` varchar(128) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`brand_id`,`setting`),
  INDEX `brand_id` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;