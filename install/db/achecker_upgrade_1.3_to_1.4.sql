###############################################################
# Database upgrade SQL from AChecker 1.3 to AChecker 1.4
###############################################################

# ---------------------------------------------------------------------
# Created the new table `web_service_api_keys` to store all web service API keys
# More details at http://atutor.ca/atutor/mantis/view.php?id=5763
# since 1.4

CREATE TABLE `web_service_api_keys` (
  `web_service_api_key_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL,
  `key` varchar(40) NOT NULL,
  `revoked` tinyint(4) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `last_update` datetime,
  PRIMARY KEY (`web_service_api_key_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

# ---------------------------------------------------------------------
# Migrated all existing web service API keys to the new table `web_service_api_keys`
# since 1.4

INSERT INTO `web_service_api_keys` (`user_id`, `key`, `revoked`, `create_date`, `last_update`)
SELECT `user_id`, `web_service_id`, 0, `create_date`, `create_date`
FROM `users`;
