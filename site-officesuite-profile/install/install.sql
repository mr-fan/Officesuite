# --- WireDatabaseBackup {"time":"2015-11-29 13:57:49","user":"","dbName":"officesuite","description":"","tables":[],"excludeTables":["pages_drafts","pages_roles","permissions","roles","roles_permissions","users","users_roles","user","role","permission"],"excludeCreateTables":[],"excludeExportTables":["field_roles","field_permissions","field_email","field_pass","caches","session_login_throttle","page_path_history"]}

DROP TABLE IF EXISTS `caches`;
CREATE TABLE `caches` (
  `name` varchar(128) NOT NULL,
  `data` mediumtext NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_buchungart`;
CREATE TABLE `field_buchungart` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_buchungbelegid`;
CREATE TABLE `field_buchungbelegid` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_buchungbuchungstext`;
CREATE TABLE `field_buchungbuchungstext` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_buchungjahr`;
CREATE TABLE `field_buchungjahr` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_buchungkonteninaktiv`;
CREATE TABLE `field_buchungkonteninaktiv` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` tinyint(4) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1190', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1191', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1212', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1202', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1205', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1198', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1203', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1207', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1221', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1211', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1192', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1194', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1200', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1201', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1204', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1223', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1187', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1182', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1188', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1213', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1222', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1210', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1209', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1208', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1206', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1199', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1197', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1196', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1195', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1193', '1');
INSERT INTO `field_buchungkonteninaktiv` (`pages_id`, `data`) VALUES('1189', '1');

DROP TABLE IF EXISTS `field_buchungkontentyp`;
CREATE TABLE `field_buchungkontentyp` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1173', 'Einnahme');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1174', 'Einnahme');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1175', 'Einnahme');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1176', 'Einnahme');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1181', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1182', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1183', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1184', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1185', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1186', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1187', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1188', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1189', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1190', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1191', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1192', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1193', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1194', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1195', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1196', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1197', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1198', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1199', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1200', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1201', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1202', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1203', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1204', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1205', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1206', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1207', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1208', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1209', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1210', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1211', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1212', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1213', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1221', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1222', 'Ausgabe');
INSERT INTO `field_buchungkontentyp` (`pages_id`, `data`) VALUES('1223', 'Ausgabe');

DROP TABLE IF EXISTS `field_buchungkostenart`;
CREATE TABLE `field_buchungkostenart` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_buchungmonat`;
CREATE TABLE `field_buchungmonat` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_buchungsteuersatz`;
CREATE TABLE `field_buchungsteuersatz` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_buchungtag`;
CREATE TABLE `field_buchungtag` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_buchungwert`;
CREATE TABLE `field_buchungwert` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_counterag`;
CREATE TABLE `field_counterag` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_counterag` (`pages_id`, `data`) VALUES('1507', '0');

DROP TABLE IF EXISTS `field_counterrg`;
CREATE TABLE `field_counterrg` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_counterrg` (`pages_id`, `data`) VALUES('1507', '0');

DROP TABLE IF EXISTS `field_countervg`;
CREATE TABLE `field_countervg` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_countervg` (`pages_id`, `data`) VALUES('1507', '0');

DROP TABLE IF EXISTS `field_datum`;
CREATE TABLE `field_datum` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_email`;
CREATE TABLE `field_email` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_fax`;
CREATE TABLE `field_fax` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_headline`;
CREATE TABLE `field_headline` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_headline` (`pages_id`, `data`) VALUES('1111', 'Systemeinstellungen');
INSERT INTO `field_headline` (`pages_id`, `data`) VALUES('1119', 'Monatsansicht');
INSERT INTO `field_headline` (`pages_id`, `data`) VALUES('1053', 'Buchungskonten');
INSERT INTO `field_headline` (`pages_id`, `data`) VALUES('1066', 'Steuersätze');
INSERT INTO `field_headline` (`pages_id`, `data`) VALUES('1365', 'Mitarbeiter');
INSERT INTO `field_headline` (`pages_id`, `data`) VALUES('1274', 'Neuer Mitarbeiter');
INSERT INTO `field_headline` (`pages_id`, `data`) VALUES('1396', 'Posten');
INSERT INTO `field_headline` (`pages_id`, `data`) VALUES('1459', 'Geschlossene Vorgänge');

DROP TABLE IF EXISTS `field_image`;
CREATE TABLE `field_image` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`) VALUES('1111', 'logo.png', '0', '', '2015-11-29 13:22:03', '2015-11-29 13:22:03');
INSERT INTO `field_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`) VALUES('41', 'logo.png', '0', '', '2015-11-29 13:22:03', '2015-11-29 13:22:03');

DROP TABLE IF EXISTS `field_invoiceaddedpostenpage`;
CREATE TABLE `field_invoiceaddedpostenpage` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_invoicebuchungskonto`;
CREATE TABLE `field_invoicebuchungskonto` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_invoiceinaccounting`;
CREATE TABLE `field_invoiceinaccounting` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` tinyint(4) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_invoicekunde`;
CREATE TABLE `field_invoicekunde` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_invoicevorgangsart`;
CREATE TABLE `field_invoicevorgangsart` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_kommentar`;
CREATE TABLE `field_kommentar` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_kundeanrede`;
CREATE TABLE `field_kundeanrede` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_kundenr`;
CREATE TABLE `field_kundenr` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_language`;
CREATE TABLE `field_language` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('40', '1007', '0');
INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('41', '1009', '0');

DROP TABLE IF EXISTS `field_language_files`;
CREATE TABLE `field_language_files` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  FULLTEXT KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processtemplate--processtemplate-module.json', '74', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processrole--processrole-module.json', '73', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processprofile--processprofile-module.json', '72', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpermission--processpermission-module.json', '71', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpageview-module.json', '70', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpagelist--processpagelist-module.json', '65', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpageclone-module.json', '62', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpageeditimageselect--processpageeditimageselect-module.json', '63', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpageeditlink--processpageeditlink-module.json', '64', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpagetype--processpagetype-module.json', '69', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpagetrash-module.json', '68', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpagesort-module.json', '67', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpagesearch--processpagesearch-module.json', '66', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpageedit--processpageedit-module.json', '61', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processmodule--processmodule-module.json', '59', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processpageadd--processpageadd-module.json', '60', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processlogin--processlogin-module.json', '58', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processlist-module.json', '57', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processforgotpassword-module.json', '55', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processhome-module.json', '56', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processfield--processfield-module.json', '54', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--pagerender-module.json', '53', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--markup--markuppagefields-module.json', '52', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--languagesupport--processlanguage-module.json', '51', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--languagesupport--languagesupport-module.json', '50', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--languagesupport--languageparser-php.json', '49', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldurl-module.json', '48', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--jquery--jquerywiretabs--jquerywiretabs-module.json', '47', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldtinymce--inputfieldtinymce-module.json', '46', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldtextarea-module.json', '45', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldtext-module.json', '44', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldsubmit--inputfieldsubmit-module.json', '43', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldselect-module.json', '42', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldselectmultiple-module.json', '41', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldradios--inputfieldradios-module.json', '40', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldpassword-module.json', '39', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldpagetitle--inputfieldpagetitle-module.json', '38', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldpage--inputfieldpage-module.json', '33', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldpagename--inputfieldpagename-module.json', '37', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldpagelistselect--inputfieldpagelistselect-module.json', '36', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldpagelistselect--inputfieldpagelistselectmultiple-module.json', '35', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldpageautocomplete--inputfieldpageautocomplete-module.json', '34', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldname-module.json', '32', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldinteger-module.json', '30', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldmarkup-module.json', '31', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldimage--inputfieldimage-module.json', '29', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldhidden-module.json', '28', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldform-module.json', '27', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldfloat-module.json', '26', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldcheckboxes--inputfieldcheckboxes-module.json', '22', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldemail-module.json', '23', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldfieldset-module.json', '24', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldfile--inputfieldfile-module-1.json', '25', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfielddatetime--inputfielddatetime-module.json', '21', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldasmselect--inputfieldasmselect-module.json', '18', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldbutton-module.json', '19', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldcheckbox-module.json', '20', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--fieldtype--fieldtyperepeater--inputfieldrepeater-module.json', '17', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--fieldtype--fieldtypedatetime-module.json', '14', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--fieldtype--fieldtypecomments--commentlist-php.json', '15', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--fieldtype--fieldtyperepeater--fieldtyperepeater-module.json', '16', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--core--fieldtype-php.json', '9', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--fieldtype--fieldtypecomments--commentform-php.json', '10', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--core--sessioncsrf-php.json', '11', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--fieldtype--fieldtypefloat-module.json', '12', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--core--inputfieldwrapper-php.json', '13', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--core--inputfield-php.json', '8', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'site--templates-admin--default-php.json', '7', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--core--pagefile-php.json', '6', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--templates-admin--default-php.json', '5', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--textformatter--textformatterentities-module.json', '4', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--system--systemupdater--systemupdater-module.json', '3', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--sessionloginthrottle-module.json', '2', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--process--processuser--processuser-module.json', '1', '');
INSERT INTO `field_language_files` (`pages_id`, `data`, `sort`, `description`) VALUES('1009', 'wire--modules--inputfield--inputfieldfile--inputfieldfile-module.json', '0', '');

DROP TABLE IF EXISTS `field_name`;
CREATE TABLE `field_name` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_ort`;
CREATE TABLE `field_ort` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_pass`;
CREATE TABLE `field_pass` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

DROP TABLE IF EXISTS `field_permissions`;
CREATE TABLE `field_permissions` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_plz`;
CREATE TABLE `field_plz` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_process`;
CREATE TABLE `field_process` (
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_process` (`pages_id`, `data`) VALUES('6', '17');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('3', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('8', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('9', '14');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('10', '7');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('11', '47');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('16', '48');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('300', '104');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('21', '50');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('29', '66');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('23', '10');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('304', '138');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('31', '136');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('22', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('30', '68');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('303', '129');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('2', '87');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('302', '121');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('301', '109');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('28', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1006', '149');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1008', '150');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1917', '155');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1919', '158');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1920', '159');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1922', '160');

DROP TABLE IF EXISTS `field_roles`;
CREATE TABLE `field_roles` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_settingsangebotskreis`;
CREATE TABLE `field_settingsangebotskreis` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingsbankname`;
CREATE TABLE `field_settingsbankname` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingsberufsbezeichnung`;
CREATE TABLE `field_settingsberufsbezeichnung` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingsblz`;
CREATE TABLE `field_settingsblz` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingsbranding`;
CREATE TABLE `field_settingsbranding` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` tinyint(4) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingscustomrg`;
CREATE TABLE `field_settingscustomrg` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` tinyint(4) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingsfirma`;
CREATE TABLE `field_settingsfirma` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingskleinunternehmer`;
CREATE TABLE `field_settingskleinunternehmer` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` tinyint(4) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingskto`;
CREATE TABLE `field_settingskto` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingskundennr`;
CREATE TABLE `field_settingskundennr` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingsrechnungskreis`;
CREATE TABLE `field_settingsrechnungskreis` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingssteuernummer`;
CREATE TABLE `field_settingssteuernummer` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_settingsstyle`;
CREATE TABLE `field_settingsstyle` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_settingsstyle` (`pages_id`, `data`) VALUES('1111', 'flatstrap');

DROP TABLE IF EXISTS `field_settingstax`;
CREATE TABLE `field_settingstax` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_settingstax` (`pages_id`, `data`, `sort`) VALUES('1111', '1057', '0');

DROP TABLE IF EXISTS `field_strasse`;
CREATE TABLE `field_strasse` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_telefon`;
CREATE TABLE `field_telefon` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_title`;
CREATE TABLE `field_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_title` (`pages_id`, `data`) VALUES('11', 'Templates');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('16', 'Fields');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('22', 'Setup');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('3', 'Pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('6', 'Add Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('8', 'Tree');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('9', 'Save Sort');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('10', 'Edit');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('21', 'Modules');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('29', 'Users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('30', 'Roles');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('2', 'Admin');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('7', 'Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('27', '404 Page Not Found');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('302', 'Insert Link');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('23', 'Login');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('304', 'Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('301', 'Empty Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('300', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('303', 'Insert Image');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('28', 'Access');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('31', 'Permissions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('32', 'Edit pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('34', 'Delete pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('35', 'Move pages (change parent)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('36', 'View pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('50', 'Sort child pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('51', 'Change templates on pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('52', 'Administer users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('53', 'User can update profile/password');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('54', 'Lock or unlock a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1', 'Statistik');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1000', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1096', 'Repeaters');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1006', 'Languages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1007', 'Default');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1008', 'Language Translator');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1009', 'Deutsch');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1011', 'Buchhaltung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1359', 'settings');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1360', 'functions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1363', 'kundeDel');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1397', 'rechnungsposten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1111', 'Verwaltung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1357', 'system');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1274', 'MitarbeiterAdd');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1049', 'system');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1561', 'buchungen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1051', 'settings');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1052', 'functions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1053', 'buchhaltungKostenartAdd');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1055', 'buchhaltungKostenart');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1056', 'buchhaltungSteuersaetze');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1057', '19');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1175', '600 Sachentnahmen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1059', '7');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1060', '0');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1365', 'systemsettingsMitarbeiter');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1174', '510 Einnahmen Kunde');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1066', 'buchhaltungSteuern');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1069', 'Kunden');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1070', 'system');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1396', 'postenAdd');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1072', 'functions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1073', 'adressen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1266', 'Vorgänge');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1176', '610 Nutzungs- und Leistungsentnahmen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1119', 'Monate');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1256', 'JahrPrint');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1173', '500 Allgemeines Einnahmenkonto');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1507', 'vorgaenge');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1157', 'buchungdel');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1181', '100 Allgemeines Ausgabenkonto');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1182', '110 Waren, Rohstoffe und Hilfsstoffe');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1183', '111 Bürobedarf');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1184', '112 Fortbildung, Fachliteratur');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1185', '113 Verbrauchsmaterial');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1186', '114 Rechts- und Steuerberatung, Buchführung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1187', '120 Bezogene Leistungen für unmittelbaren Betriebszweck');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1188', '121 Porto (USt auf 0% setzen)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1189', '122 Telekommunikation');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1190', '123 Energie');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1191', '130 Gehälter, Löhne, Versicherungsbeiträge für Arbeitnehmer');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1192', '140 Aufwendungen für geringwertige Wirtschaftsgüter (GWG)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1193', '150 Miete / Pacht für Geschäftsräume');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1194', '160 Aufwendungen für Grundstücke');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1195', '170 Aufwendungen für ein häusl. Arbeitszimmer');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1196', '180 Verpflegungsmehraufwendungen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1197', '181 Fahrtkosten öffentlich (Bahn, ÖPNV, Taxi)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1198', '182 Hotelkosten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1199', '183 Privat-PKW für betriebliche Fahrten');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1200', '184 Laufende und feste KFZ-Kosten ohne AFA und Zinsen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1201', '185 Miete / Aufwendungen für doppelte Haushaltsführung');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1202', '190 Geschenke - abziehbar');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1203', '195 Geschenke - nicht abziehbar');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1204', '200 Bewirtung - abziehbar');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1205', '205 Bewirtung - nicht abziehbar');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1206', '210 Sonstige abziehbare Betriebsausgaben');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1207', '215 Sonstige nicht abziehbare Betriebsausgaben');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1208', '220 Instandhaltung und Reparaturen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1209', '230 Betriebsausgabenpauschale für bestimmte Berufsgruppen');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1210', '235 Freibetrag nach §3 Nr.26 und 26a EStG');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1211', '240 Schuldzinsen (Finanzierung von Anschaffungs- / Herstellungskosten von Wirtschaftsgütern');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1212', '245 Übrige Schuldzinsen (nicht abziehbar)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1213', '246 Übrige Schuldzinsen (abziehbar)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1221', '497 Gewerbesteuer');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1222', '498 Vorsteuerbeträge');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1223', '499 An das FA gezahlte Umsatzsteuer');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1224', 'buchungKontoHide');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1230', 'MonatePrint');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1384', 'rechnungDel');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1286', 'mitarbeiterDel');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1794', 'Termine');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1731', 'invoicePrint');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1793', 'Kalender');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1459', 'invoiceOld');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1917', 'Import Pages From CSV');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1919', 'Find');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1920', 'Recent');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1921', 'Can see recently edited pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1922', 'Logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1923', 'Can view system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1924', 'Can manage system logs');

DROP TABLE IF EXISTS `field_universalcheck`;
CREATE TABLE `field_universalcheck` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` tinyint(4) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_vorname`;
CREATE TABLE `field_vorname` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_website`;
CREATE TABLE `field_website` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups` (`id`, `name`) VALUES('2', 'admin');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('3', 'user');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('4', 'role');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('5', 'permission');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('1', 'home');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('138', 'kalender');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('83', 'basic-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('80', 'search');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('97', 'language');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('98', 'buchhaltung');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('99', 'buchung');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('100', 'projectconfig');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('101', 'buchhaltungKostenart');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('102', 'buchhaltungSteuersaetze');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('137', 'invoicePrint');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('104', 'buchhaltungKostenartNew');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('105', 'buchhaltungSystem');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('106', 'NameundTitle');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('107', 'buchhaltungSteuersatzAdd');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('108', 'kunden');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('109', 'kundenAdd');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('110', 'kunde');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('120', 'buchhaltungMonatePrint');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('131', 'invoiceDetail');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('113', 'buchhaltungJahr');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('118', 'buchhaltungKostenArtHide');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('117', 'buchhaltungBuchungDel');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('119', 'systemsettings');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('121', 'buchhaltungJahrPrint');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('122', 'systemsettingsMitarbeiter');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('123', 'systemsettingsMitarbeiterAdd');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('136', 'invoiceOld');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('125', 'systemsettingsMitarbeiterDel');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('126', 'invoice');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('127', 'kundeDel');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('134', 'invoicePosten');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('135', 'invoiceAddedPosten');

DROP TABLE IF EXISTS `fieldgroups_fields`;
CREATE TABLE `fieldgroups_fields` (
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fields_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`fieldgroups_id`,`fields_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '2', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '3', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '4', '2', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('4', '5', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('5', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '92', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '154', '9', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '174', '25', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '151', '6', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('80', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '152', '7', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '153', '8', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '78', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '92', '3', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '138', '2', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('138', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '97', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '150', '10', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '78', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '123', '9', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '117', '8', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '106', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '107', '2', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '109', '3', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '108', '4', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '110', '5', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '121', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '173', '24', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '1', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '78', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '78', '2', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('137', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '119', '6', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '135', '10', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '149', '4', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '78', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '78', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '118', '7', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '122', '3', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('113', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '121', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '122', '2', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('134', '78', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('120', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '169', '23', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '168', '22', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '165', '21', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '159', '20', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '160', '19', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '150', '18', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '154', '17', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '153', '16', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '152', '15', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '151', '14', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '92', '13', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '149', '12', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '140', '11', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('121', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '150', '9', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '152', '6', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '153', '7', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '141', '10', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '78', '5', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '78', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('122', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('122', '78', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('123', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('123', '78', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '139', '9', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '151', '5', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '137', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('125', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '157', '11', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '120', '8', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '134', '7', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '133', '6', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '132', '5', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '136', '4', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '130', '3', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '98', '3', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '140', '4', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '149', '5', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '171', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '166', '6', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('127', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '154', '8', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '162', '2', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('134', '108', '2', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('134', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('135', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('135', '163', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('135', '108', '2', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('135', '78', '3', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('136', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('136', '78', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '164', '4', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '161', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '135', '2', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '170', '2', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '172', '3', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '78', '1', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '1', '0', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '164', '26', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '167', '7', '');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('131', '175', '8', '');

DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET ascii NOT NULL,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('1', 'FieldtypePageTitle', 'title', '13', 'Title', '{\"required\":1,\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('2', 'FieldtypeModule', 'process', '25', 'Process', '{\"description\":\"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don\'t change the value of this unless adding your own pages in the admin.\",\"collapsed\":1,\"required\":1,\"moduleTypes\":[\"Process\"],\"permanent\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('3', 'FieldtypePassword', 'pass', '24', 'Set Password', '{\"collapsed\":1,\"size\":50,\"maxlength\":128}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('5', 'FieldtypePage', 'permissions', '24', 'Permissions', '{\"derefAsPage\":0,\"parent_id\":31,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldCheckboxes\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('4', 'FieldtypePage', 'roles', '24', 'Roles', '{\"derefAsPage\":0,\"parent_id\":30,\"labelFieldName\":\"name\",\"inputfield\":\"InputfieldCheckboxes\",\"description\":\"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page\'s template.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('92', 'FieldtypeEmail', 'email', '9', 'E-Mail Address', '{\"size\":70,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('161', 'FieldtypePage', 'invoiceKunde', '0', '', '{\"derefAsPage\":2,\"parent_id\":0,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldSelect\",\"template_id\":56}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('162', 'FieldtypeText', 'invoiceVorgangsart', '0', '', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('163', 'FieldtypePage', 'invoiceAddedPostenPage', '0', '', '{\"derefAsPage\":1,\"parent_id\":1397,\"template_id\":80,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldSelect\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('164', 'FieldtypeCheckbox', 'universalCheck', '0', '', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('165', 'FieldtypeText', 'settingsAngebotskreis', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('166', 'FieldtypePage', 'invoiceBuchungsKonto', '0', '', '{\"derefAsPage\":1,\"parent_id\":1055,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldSelect\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('167', 'FieldtypeCheckbox', 'invoiceInAccounting', '0', '', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('168', 'FieldtypePage', 'settingsTax', '0', '', '{\"derefAsPage\":1,\"parent_id\":1056,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldSelect\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('149', 'FieldtypeText', 'Name', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('150', 'FieldtypeText', 'Vorname', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('151', 'FieldtypeText', 'Ort', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('152', 'FieldtypeInteger', 'Plz', '0', '', '{\"inputType\":\"number\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('153', 'FieldtypeText', 'Strasse', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('154', 'FieldtypeText', 'Telefon', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('160', 'FieldtypeText', 'settingsKundennr', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('157', 'FieldtypeText', 'kommentar', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('159', 'FieldtypeText', 'settingsRechnungskreis', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('78', 'FieldtypeText', 'headline', '0', 'Headline', '{\"description\":\"Use this instead of the Title if a longer headline is needed than what you want to appear in navigation.\",\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":2,\"size\":0,\"maxlength\":1024}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('97', 'FieldtypeFile', 'language_files', '24', 'Language Translation Files', '{\"extensions\":\"json\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"descriptionRows\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('98', 'FieldtypePage', 'language', '24', 'Language', '{\"derefAsPage\":1,\"parent_id\":1006,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldRadios\",\"required\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('170', 'FieldtypeText', 'counterRg', '0', '', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('171', 'FieldtypeText', 'counterAg', '0', '', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('106', 'FieldtypeText', 'buchungBuchungstext', '0', '', '{\"label1009\":\"Buchungstext\",\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('107', 'FieldtypeText', 'buchungKostenart', '0', '', '{\"label1009\":\"Kostenart\",\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('108', 'FieldtypeText', 'buchungWert', '0', '', '{\"label1009\":\"Brutto Wert\",\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('109', 'FieldtypeText', 'buchungSteuersatz', '0', '', '{\"label1009\":\"Steuersatz\",\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('110', 'FieldtypeText', 'buchungArt', '0', '', '{\"label1009\":\"Art der Buchung E oder A\",\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('117', 'FieldtypeInteger', 'buchungTag', '0', '', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('118', 'FieldtypeInteger', 'buchungMonat', '0', '', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('119', 'FieldtypeInteger', 'buchungJahr', '0', '', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('120', 'FieldtypeCheckbox', 'settingsKleinunternehmer', '0', '', '{\"label1009\":\"System als Kleinunternehmer nutzen?\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('121', 'FieldtypeText', 'buchungKontenTyp', '0', '', '{\"label1009\":\"buchungKontenTyp\",\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('122', 'FieldtypeCheckbox', 'buchungKontenInaktiv', '0', '', '{\"label1009\":\"buchungKontenInaktiv\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('123', 'FieldtypeText', 'buchungbelegid', '0', '', '{\"label1009\":\"buchungbelegid\",\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('130', 'FieldtypeText', 'settingsBerufsbezeichnung', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('136', 'FieldtypeText', 'settingsSteuernummer', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('132', 'FieldtypeText', 'settingsBlz', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('133', 'FieldtypeText', 'settingsKto', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('134', 'FieldtypeText', 'settingsBankname', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('135', 'FieldtypeText', 'settingsFirma', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('137', 'FieldtypeText', 'kundeNr', '0', '', '{\"label1009\":\"kundeNr\",\"size\":0,\"maxlength\":2048,\"textformatters\":[\"TextformatterEntities\"]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('138', 'FieldtypeText', 'kundeAnrede', '0', '', '{\"label1009\":\"kundeAnrede\",\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('139', 'FieldtypeText', 'settingsStyle', '0', '', '{\"label1009\":\"settingsStyle\",\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('140', 'FieldtypeImage', 'image', '0', '', '{\"label1009\":\"Bild\",\"extensions\":\"gif jpg jpeg png\",\"maxFiles\":0,\"entityEncode\":1,\"inputfieldClass\":\"InputfieldImage\",\"descriptionRows\":1,\"adminThumbs\":1,\"fileSchema\":2}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('141', 'FieldtypeCheckbox', 'settingsBranding', '0', '', '{\"label1009\":\"settingsBranding\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('169', 'FieldtypeCheckbox', 'settingsCustomRg', '0', '', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('172', 'FieldtypeText', 'counterVg', '0', '', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('173', 'FieldtypeText', 'Fax', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('174', 'FieldtypeText', 'website', '0', '', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":2048}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('175', 'FieldtypeText', 'datum', '0', '', '');

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('1', 'FieldtypeTextarea', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('2', 'FieldtypeNumber', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('3', 'FieldtypeText', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('4', 'FieldtypePage', '3', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('30', 'InputfieldForm', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('6', 'FieldtypeFile', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('7', 'ProcessPageEdit', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('10', 'ProcessLogin', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('12', 'ProcessPageList', '0', '{\"pageLabelField\":\"title\",\"paginationLimit\":25,\"limit\":50}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('121', 'ProcessPageEditLink', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('14', 'ProcessPageSort', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('15', 'InputfieldPageListSelect', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('117', 'JqueryUI', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('17', 'ProcessPageAdd', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('125', 'SessionLoginThrottle', '11', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('122', 'InputfieldPassword', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('25', 'InputfieldAsmSelect', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('116', 'JqueryCore', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('27', 'FieldtypeModule', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('28', 'FieldtypeDatetime', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('29', 'FieldtypeEmail', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('108', 'InputfieldURL', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('32', 'InputfieldSubmit', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('33', 'InputfieldWrapper', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('34', 'InputfieldText', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('35', 'InputfieldTextarea', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('36', 'InputfieldSelect', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('37', 'InputfieldCheckbox', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('38', 'InputfieldCheckboxes', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('39', 'InputfieldRadios', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('40', 'InputfieldHidden', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('41', 'InputfieldName', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('43', 'InputfieldSelectMultiple', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('45', 'JqueryWireTabs', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('46', 'ProcessPage', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('47', 'ProcessTemplate', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('48', 'ProcessField', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('50', 'ProcessModule', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('114', 'PagePermissions', '3', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('97', 'FieldtypeCheckbox', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('115', 'PageRender', '3', '{\"clearCache\":1}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('55', 'InputfieldFile', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('56', 'InputfieldImage', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('57', 'FieldtypeImage', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('60', 'InputfieldPage', '0', '{\"inputfieldClasses\":[\"InputfieldSelect\",\"InputfieldSelectMultiple\",\"InputfieldCheckboxes\",\"InputfieldRadios\",\"InputfieldAsmSelect\",\"InputfieldPageListSelect\",\"InputfieldPageListSelectMultiple\"]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('61', 'TextformatterEntities', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('66', 'ProcessUser', '0', '{\"showFields\":[\"name\",\"email\",\"roles\"]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('67', 'MarkupAdminDataTable', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('68', 'ProcessRole', '0', '{\"showFields\":[\"name\"]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('76', 'ProcessList', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('78', 'InputfieldFieldset', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('79', 'InputfieldMarkup', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('80', 'InputfieldEmail', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('89', 'FieldtypeFloat', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('83', 'ProcessPageView', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('84', 'FieldtypeInteger', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('85', 'InputfieldInteger', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('86', 'InputfieldPageName', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('87', 'ProcessHome', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('90', 'InputfieldFloat', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('94', 'InputfieldDatetime', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('98', 'MarkupPagerNav', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('129', 'ProcessPageEditImageSelect', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('103', 'JqueryTableSorter', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('104', 'ProcessPageSearch', '1', '{\"searchFields\":\"title\",\"displayField\":\"title path\"}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('105', 'FieldtypeFieldsetOpen', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('106', 'FieldtypeFieldsetClose', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('107', 'FieldtypeFieldsetTabOpen', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('109', 'ProcessPageTrash', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('111', 'FieldtypePageTitle', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('112', 'InputfieldPageTitle', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('113', 'MarkupPageArray', '3', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('131', 'InputfieldButton', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('133', 'FieldtypePassword', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('134', 'ProcessPageType', '1', '{\"showFields\":[]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('135', 'FieldtypeURL', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('136', 'ProcessPermission', '1', '{\"showFields\":[\"name\",\"title\"]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('137', 'InputfieldPageListSelectMultiple', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('138', 'ProcessProfile', '1', '{\"profileFields\":[\"pass\",\"email\"]}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('139', 'SystemUpdater', '1', '{\"systemVersion\":13,\"coreVersion\":\"2.7.1\"}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('148', 'LanguageSupport', '3', '{\"languagesPageID\":1006,\"defaultLanguagePageID\":1007,\"otherLanguagePageIDs\":[1009],\"languageTranslatorPageID\":1008}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('149', 'ProcessLanguage', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('150', 'ProcessLanguageTranslator', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('151', 'FieldtypeRepeater', '3', '{\"repeatersRootPageID\":1096}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('152', 'InputfieldRepeater', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('154', 'ProcessForgotPassword', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('155', 'ImportPagesCSV', '1', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('156', 'AdminThemeDefault', '10', '{\"colors\":\"classic\"}', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('157', 'InputfieldSelector', '10', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('158', 'ProcessPageLister', '0', '', '0000-00-00 00:00:00');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('159', 'ProcessRecentPages', '1', '', '2015-11-29 13:22:36');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('160', 'ProcessLogger', '1', '', '2015-11-29 13:22:50');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('161', 'InputfieldIcon', '0', '', '2015-11-29 13:22:50');

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `templates_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET ascii NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `published` datetime DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_parent_id` (`name`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  KEY `templates_id` (`templates_id`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `status` (`status`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=1925 DEFAULT CHARSET=utf8;

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1', '0', '1', 'home', '9', '2012-12-18 14:34:13', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('2', '1', '2', 'processwire', '1035', '2015-11-29 13:22:30', '40', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('3', '2', '2', 'page', '21', '2011-03-29 21:37:06', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('6', '3', '2', 'add', '21', '2015-11-29 13:22:53', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('7', '1', '2', 'trash', '1039', '2011-08-14 22:04:52', '41', '2010-02-07 05:29:39', '2', '2010-02-07 05:29:39', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('8', '3', '2', 'list', '21', '2011-03-29 21:37:06', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('9', '3', '2', 'sort', '1047', '2011-03-29 21:37:06', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('10', '3', '2', 'edit', '21', '2015-11-29 13:22:55', '41', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('11', '22', '2', 'template', '21', '2011-03-29 21:37:06', '41', '2010-02-01 11:04:54', '2', '2010-02-01 11:04:54', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('16', '22', '2', 'field', '21', '2011-03-29 21:37:06', '41', '2010-02-01 12:44:07', '2', '2010-02-01 12:44:07', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('21', '2', '2', 'module', '21', '2011-03-29 21:37:06', '41', '2010-02-02 10:02:24', '2', '2010-02-02 10:02:24', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('22', '2', '2', 'setup', '21', '2011-03-29 21:37:06', '41', '2010-02-09 12:16:59', '2', '2010-02-09 12:16:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('23', '2', '2', 'login', '1035', '2011-05-03 23:38:10', '41', '2010-02-17 09:59:39', '2', '2010-02-17 09:59:39', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('27', '1', '29', 'http404', '1035', '2012-12-12 11:49:56', '41', '2010-06-03 06:53:03', '3', '2010-06-03 06:53:03', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('28', '2', '2', 'access', '13', '2011-05-03 23:38:10', '41', '2011-03-19 19:14:20', '2', '2011-03-19 19:14:20', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('29', '28', '2', 'users', '29', '2011-04-05 00:39:08', '41', '2011-03-19 19:15:29', '2', '2011-03-19 19:15:29', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('30', '28', '2', 'roles', '29', '2011-04-05 00:38:39', '41', '2011-03-19 19:15:45', '2', '2011-03-19 19:15:45', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('31', '28', '2', 'permissions', '29', '2011-04-05 00:53:52', '41', '2011-03-19 19:16:00', '2', '2011-03-19 19:16:00', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('32', '31', '5', 'page-edit', '25', '2011-09-06 15:34:24', '41', '2011-03-19 19:17:03', '2', '2011-03-19 19:17:03', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('34', '31', '5', 'page-delete', '25', '2011-09-06 15:34:33', '41', '2011-03-19 19:17:23', '2', '2011-03-19 19:17:23', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('35', '31', '5', 'page-move', '25', '2011-09-06 15:34:48', '41', '2011-03-19 19:17:41', '2', '2011-03-19 19:17:41', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('36', '31', '5', 'page-view', '25', '2011-09-06 15:34:14', '41', '2011-03-19 19:17:57', '2', '2011-03-19 19:17:57', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('37', '30', '4', 'guest', '25', '2011-04-05 01:37:19', '41', '2011-03-19 19:18:41', '2', '2011-03-19 19:18:41', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('38', '30', '4', 'superuser', '25', '2011-08-17 14:34:39', '41', '2011-03-19 19:18:55', '2', '2011-03-19 19:18:55', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('41', '29', '3', 'admin', '1', '2015-11-29 13:22:30', '40', '2011-03-19 19:41:26', '2', '2011-03-19 19:41:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('40', '29', '3', 'guest', '25', '2011-08-17 14:26:09', '41', '2011-03-20 17:31:59', '2', '2011-03-20 17:31:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('50', '31', '5', 'page-sort', '25', '2011-09-06 15:34:58', '41', '2011-03-26 22:04:50', '41', '2011-03-26 22:04:50', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('51', '31', '5', 'page-template', '25', '2011-09-06 15:35:09', '41', '2011-03-26 22:25:31', '41', '2011-03-26 22:25:31', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('52', '31', '5', 'user-admin', '25', '2011-09-06 15:35:42', '41', '2011-03-30 00:06:47', '41', '2011-03-30 00:06:47', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('53', '31', '5', 'profile-edit', '1', '2011-08-16 22:32:48', '41', '2011-04-26 00:02:22', '41', '2011-04-26 00:02:22', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('54', '31', '5', 'page-lock', '1', '2011-08-15 17:48:12', '41', '2011-08-15 17:45:48', '41', '2011-08-15 17:45:48', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('300', '3', '2', 'search', '1045', '2011-03-29 21:37:06', '41', '2010-08-04 05:23:59', '2', '2010-08-04 05:23:59', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('301', '3', '2', 'trash', '1047', '2011-03-29 21:37:06', '41', '2010-09-28 05:39:30', '2', '2010-09-28 05:39:30', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('302', '3', '2', 'link', '1041', '2011-03-29 21:37:06', '41', '2010-10-01 05:03:56', '2', '2010-10-01 05:03:56', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('303', '3', '2', 'image', '1041', '2011-03-29 21:37:06', '41', '2010-10-13 03:56:48', '2', '2010-10-13 03:56:48', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('304', '2', '2', 'profile', '1025', '2011-05-03 23:38:10', '41', '2011-04-25 23:57:18', '41', '2011-04-25 23:57:18', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1000', '1', '26', 'search', '1025', '2011-08-31 19:17:38', '41', '2010-09-06 05:05:28', '2', '2010-09-06 05:05:28', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1274', '1111', '69', 'mitarbeiteradd', '1025', '2012-12-10 15:08:42', '41', '2012-12-10 15:07:30', '41', '2012-12-10 15:07:30', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1270', '30', '4', 'kundenpflege', '1', '2012-12-06 16:49:37', '41', '2012-12-06 16:49:14', '41', '2012-12-06 16:49:14', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1794', '1793', '29', 'termine', '1029', '2013-01-07 11:04:43', '41', '2012-12-27 10:56:49', '41', '2012-12-27 10:56:49', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1006', '22', '2', 'languages', '16', '2012-11-19 12:13:40', '41', '2012-11-19 12:13:40', '41', '2012-11-19 12:13:40', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1007', '1006', '43', 'default', '16', '2012-11-19 12:13:40', '41', '2012-11-19 12:13:40', '41', '2012-11-19 12:13:40', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1008', '22', '2', 'language-translator', '1040', '2012-11-19 12:13:40', '41', '2012-11-19 12:13:40', '41', '2012-11-19 12:13:40', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1009', '1006', '43', 'deutsch', '1', '2012-11-19 12:16:47', '41', '2012-11-19 12:16:04', '41', '2012-11-19 12:16:04', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1011', '1', '59', 'buchhaltung', '1', '2012-11-29 13:05:12', '41', '2012-11-19 14:27:11', '41', '2012-11-19 14:27:11', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1187', '1055', '47', '120-bezogene-leistungen-fur-unmittelbaren-betriebszweck', '1025', '2012-12-19 12:54:44', '41', '2012-12-04 11:38:36', '41', '2012-12-04 11:38:36', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1181', '1055', '47', '100-allgemeines-ausgabenkonto', '1025', '2012-12-04 11:36:58', '41', '2012-12-04 11:36:58', '41', '2012-12-04 11:36:58', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1096', '2', '2', 'repeaters', '1036', '2012-11-21 17:12:27', '41', '2012-11-21 17:12:27', '41', '2012-11-21 17:12:27', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1111', '1', '65', 'settings', '1', '2013-02-01 16:11:47', '41', '2012-11-23 15:51:16', '41', '2012-11-23 15:51:16', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1176', '1055', '47', '610-nutzungs-und-leistungsentnahmen', '1025', '2012-12-12 08:58:27', '41', '2012-12-04 11:35:39', '41', '2012-12-04 11:35:39', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1256', '1052', '67', 'jahrprint', '1025', '2012-12-06 09:54:04', '41', '2012-12-06 09:49:59', '41', '2012-12-06 09:49:59', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1182', '1055', '47', '110-waren-rohstoffe-und-hilfsstoffe', '1025', '2012-12-19 12:46:26', '41', '2012-12-04 11:37:48', '41', '2012-12-04 11:37:48', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1119', '1052', '44', 'monate', '1025', '2012-11-29 13:03:04', '41', '2012-11-29 13:01:42', '41', '2012-11-29 13:01:42', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1561', '1011', '46', 'buchungen', '1029', '2012-12-19 11:11:32', '41', '2012-12-14 14:13:17', '41', '2012-12-14 14:13:17', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1266', '1', '72', 'rechnungen', '1', '2012-12-17 16:05:03', '41', '2012-12-06 14:30:47', '41', '2012-12-06 14:30:47', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1049', '1011', '46', 'system', '1025', '2012-11-20 13:22:31', '41', '2012-11-20 13:21:47', '41', '2012-11-20 13:21:47', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1051', '1049', '46', 'settings', '1025', '2012-11-21 15:54:17', '41', '2012-11-20 13:23:06', '41', '2012-11-20 13:23:06', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1052', '1049', '46', 'functions', '1025', '2012-11-21 15:53:18', '41', '2012-11-20 13:23:33', '41', '2012-11-20 13:23:33', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1157', '1052', '63', 'buchungdel', '1025', '2012-11-30 18:43:50', '41', '2012-11-30 18:43:41', '41', '2012-11-30 18:43:41', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1184', '1055', '47', '112-fortbildung-fachliteratur', '1025', '2012-12-04 11:38:00', '41', '2012-12-04 11:38:00', '41', '2012-12-04 11:38:00', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1053', '1052', '50', 'buchhaltungkostenartadd', '1025', '2012-12-04 11:21:34', '41', '2012-11-20 13:28:24', '41', '2012-11-20 13:28:24', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1055', '1051', '52', 'buchhaltungkostenart', '1025', '2012-11-21 15:52:18', '41', '2012-11-20 13:29:59', '41', '2012-11-20 13:29:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1186', '1055', '47', '114-rechts-und-steuerberatung-buchfuhrung', '1025', '2012-12-12 08:58:51', '41', '2012-12-04 11:38:24', '41', '2012-12-04 11:38:24', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1056', '1051', '48', 'buchhaltungsteuersaetze', '1025', '2012-11-21 15:52:49', '41', '2012-11-20 13:32:24', '41', '2012-11-20 13:32:24', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1057', '1056', '48', '19', '1025', '2012-12-04 11:05:43', '41', '2012-11-20 13:33:40', '41', '2012-11-20 13:33:40', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1059', '1056', '48', '7', '1025', '2012-12-04 11:05:51', '41', '2012-11-20 13:38:37', '41', '2012-11-20 13:38:37', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1060', '1056', '48', '0', '1025', '2012-12-04 11:05:58', '41', '2012-11-20 13:38:53', '41', '2012-11-20 13:38:53', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1183', '1055', '47', '111-burobedarf', '1025', '2012-12-04 11:37:53', '41', '2012-12-04 11:37:53', '41', '2012-12-04 11:37:53', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1173', '1055', '47', '500-allgemeines-einnahmenkonto', '1025', '2012-12-13 13:19:55', '41', '2012-12-04 11:35:06', '41', '2012-12-04 11:35:06', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1175', '1055', '47', '600-sachentnahmen', '1025', '2012-12-04 14:02:35', '41', '2012-12-04 11:35:27', '41', '2012-12-04 11:35:27', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1066', '1052', '53', 'buchhaltungsteuern', '1025', '2012-11-23 14:06:46', '41', '2012-11-20 14:06:45', '41', '2012-11-20 14:06:45', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1185', '1055', '47', '113-verbrauchsmaterial', '1025', '2012-12-12 08:58:48', '41', '2012-12-04 11:38:15', '41', '2012-12-04 11:38:15', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1069', '1', '54', 'kunden', '1', '2012-11-20 14:33:10', '41', '2012-11-20 14:16:57', '41', '2012-11-20 14:16:57', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1070', '1069', '52', 'system', '1025', '2012-11-21 15:53:27', '41', '2012-11-20 14:33:40', '41', '2012-11-20 14:33:40', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1072', '1070', '52', 'functions', '1025', '2012-11-21 15:53:37', '41', '2012-11-20 14:34:18', '41', '2012-11-20 14:34:18', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1073', '1069', '52', 'adressen', '1029', '2012-12-19 11:13:25', '41', '2012-11-20 14:34:39', '41', '2012-11-20 14:34:39', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1174', '1055', '47', '510-einnahmen-kunde', '1025', '2012-12-04 14:02:05', '41', '2012-12-04 11:35:21', '41', '2012-12-04 11:35:21', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1361', '30', '4', 'buchhaltung', '1', '2012-12-12 11:17:46', '41', '2012-12-12 11:17:43', '41', '2012-12-12 11:17:43', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1362', '30', '4', 'rechnungen', '1', '2012-12-12 11:17:57', '41', '2012-12-12 11:17:54', '41', '2012-12-12 11:17:54', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1360', '1357', '72', 'functions', '1025', '2012-12-12 11:21:22', '41', '2012-12-12 11:17:23', '41', '2012-12-12 11:17:23', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1357', '1266', '72', 'system', '1025', '2012-12-14 15:27:19', '41', '2012-12-12 11:16:34', '41', '2012-12-12 11:16:34', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1731', '1360', '83', 'invoiceprint', '1025', '2012-12-19 15:35:32', '41', '2012-12-19 13:12:38', '41', '2012-12-19 13:12:38', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1359', '1357', '72', 'settings', '1025', '2012-12-12 11:21:29', '41', '2012-12-12 11:17:09', '41', '2012-12-12 11:17:09', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1188', '1055', '47', '121-porto-ust-auf-0-setzen', '1025', '2012-12-19 12:54:37', '41', '2012-12-04 11:38:51', '41', '2012-12-04 11:38:51', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1189', '1055', '47', '122-telekommunikation', '1025', '2012-12-10 09:22:52', '41', '2012-12-04 11:39:03', '41', '2012-12-04 11:39:03', '16');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1190', '1055', '47', '123-energie', '1025', '2012-12-04 14:04:10', '41', '2012-12-04 11:39:06', '41', '2012-12-04 11:39:06', '17');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1191', '1055', '47', '130-gehalter-lohne-versicherungsbeitrage-fur-arbeitnehmer', '1025', '2012-12-04 14:04:32', '41', '2012-12-04 11:39:22', '41', '2012-12-04 11:39:22', '18');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1192', '1055', '47', '140-aufwendungen-fur-geringwertige-wirtschaftsguter-gwg', '1025', '2012-12-04 14:39:19', '41', '2012-12-04 11:39:38', '41', '2012-12-04 11:39:38', '19');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1193', '1055', '47', '150-miete-pacht-fur-geschaftsraume', '1025', '2012-12-10 09:22:49', '41', '2012-12-04 11:39:50', '41', '2012-12-04 11:39:50', '20');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1194', '1055', '47', '160-aufwendungen-fur-grundstucke', '1025', '2012-12-04 14:39:24', '41', '2012-12-04 11:39:59', '41', '2012-12-04 11:39:59', '21');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1195', '1055', '47', '170-aufwendungen-fur-ein-hausl-arbeitszimmer', '1025', '2012-12-10 09:22:46', '41', '2012-12-04 11:40:09', '41', '2012-12-04 11:40:09', '22');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1196', '1055', '47', '180-verpflegungsmehraufwendungen', '1025', '2012-12-10 09:22:43', '41', '2012-12-04 11:40:16', '41', '2012-12-04 11:40:16', '23');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1197', '1055', '47', '181-fahrtkosten-offentlich-bahn-opnv-taxi', '1025', '2012-12-10 09:22:39', '41', '2012-12-04 11:40:35', '41', '2012-12-04 11:40:35', '24');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1198', '1055', '47', '182-hotelkosten', '1025', '2012-12-04 14:04:59', '41', '2012-12-04 11:40:40', '41', '2012-12-04 11:40:40', '25');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1199', '1055', '47', '183-privat-pkw-fur-betriebliche-fahrten', '1025', '2012-12-10 09:22:32', '41', '2012-12-04 11:40:53', '41', '2012-12-04 11:40:53', '26');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1200', '1055', '47', '184-laufende-und-feste-kfz-kosten-ohne-afa-und-zinsen', '1025', '2012-12-04 14:39:39', '41', '2012-12-04 11:41:05', '41', '2012-12-04 11:41:05', '27');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1201', '1055', '47', '185-miete-aufwendungen-fur-doppelte-haushaltsfuhrung', '1025', '2012-12-04 14:39:45', '41', '2012-12-04 11:41:21', '41', '2012-12-04 11:41:21', '28');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1202', '1055', '47', '190-geschenke-abziehbar', '1025', '2012-12-04 14:04:47', '41', '2012-12-04 11:41:28', '41', '2012-12-04 11:41:28', '29');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1203', '1055', '47', '195-geschenke-nicht-abziehbar', '1025', '2012-12-04 14:05:03', '41', '2012-12-04 11:41:37', '41', '2012-12-04 11:41:37', '30');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1204', '1055', '47', '200-bewirtung-abziehbar', '1025', '2012-12-04 14:39:55', '41', '2012-12-04 11:41:46', '41', '2012-12-04 11:41:46', '31');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1205', '1055', '47', '205-bewirtung-nicht-abziehbar', '1025', '2012-12-04 14:04:53', '41', '2012-12-04 11:41:57', '41', '2012-12-04 11:41:57', '32');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1206', '1055', '47', '210-sonstige-abziehbare-betriebsausgaben', '1025', '2012-12-04 14:40:55', '41', '2012-12-04 11:42:16', '41', '2012-12-04 11:42:16', '33');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1207', '1055', '47', '215-sonstige-nicht-abziehbare-betriebsausgaben', '1025', '2012-12-04 14:05:08', '41', '2012-12-04 11:42:38', '41', '2012-12-04 11:42:38', '34');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1208', '1055', '47', '220-instandhaltung-und-reparaturen', '1025', '2012-12-04 14:40:51', '41', '2012-12-04 11:42:48', '41', '2012-12-04 11:42:48', '35');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1209', '1055', '47', '230-betriebsausgabenpauschale-fur-bestimmte-berufsgruppen', '1025', '2012-12-04 14:40:48', '41', '2012-12-04 11:43:00', '41', '2012-12-04 11:43:00', '36');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1210', '1055', '47', '235-freibetrag-nach-3-nr.26-und-26a-estg', '1025', '2012-12-04 14:40:45', '41', '2012-12-04 11:43:25', '41', '2012-12-04 11:43:25', '37');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1211', '1055', '47', '240-schuldzinsen-finanzierung-von-anschaffungs-herstellungskosten-von-wirtschaftsgutern', '1025', '2012-12-10 09:22:26', '41', '2012-12-04 11:44:06', '41', '2012-12-04 11:44:06', '38');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1212', '1055', '47', '245-ubrige-schuldzinsen-nicht-abziehbar', '1025', '2012-12-04 14:04:42', '41', '2012-12-04 11:44:20', '41', '2012-12-04 11:44:20', '39');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1213', '1055', '47', '246-ubrige-schuldzinsen-abziehbar', '1025', '2012-12-04 14:40:39', '41', '2012-12-04 11:44:30', '41', '2012-12-04 11:44:30', '40');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1221', '1055', '47', '497-gewerbesteuer', '1025', '2012-12-04 14:05:13', '41', '2012-12-04 11:46:38', '41', '2012-12-04 11:46:38', '48');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1222', '1055', '47', '498-vorsteuerbetrage', '1025', '2012-12-10 09:22:20', '41', '2012-12-04 11:46:45', '41', '2012-12-04 11:46:45', '49');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1223', '1055', '47', '499-an-das-fa-gezahlte-umsatzsteuer', '1025', '2012-12-04 14:40:05', '41', '2012-12-04 11:46:53', '41', '2012-12-04 11:46:53', '50');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1224', '1052', '64', 'buchungkontohide', '1025', '2012-12-04 11:53:16', '41', '2012-12-04 11:52:50', '41', '2012-12-04 11:52:50', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1230', '1052', '66', 'monateprint', '1025', '2012-12-06 09:40:38', '41', '2012-12-04 17:49:28', '41', '2012-12-04 17:49:28', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1365', '1111', '68', 'systemsettingsmitarbeiter', '1025', '2012-12-12 12:55:07', '41', '2012-12-12 12:54:48', '41', '2012-12-12 12:54:48', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1384', '1360', '72', 'rechnungdel', '1025', '2012-12-12 14:36:01', '41', '2012-12-12 14:33:48', '41', '2012-12-12 14:33:48', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1286', '1111', '71', 'mitarbeiterdel', '1025', '2012-12-10 16:10:33', '41', '2012-12-10 16:10:04', '41', '2012-12-10 16:10:04', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1363', '1072', '73', 'kundedel', '1025', '2012-12-12 11:24:10', '41', '2012-12-12 11:23:08', '41', '2012-12-12 11:23:08', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1396', '1360', '80', 'postenadd', '1025', '2012-12-17 15:44:35', '41', '2012-12-12 16:38:04', '41', '2012-12-12 16:38:04', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1397', '1359', '80', 'rechnungsposten', '1025', '2012-12-12 16:42:07', '41', '2012-12-12 16:41:54', '41', '2012-12-12 16:41:54', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1507', '1266', '72', 'vorgaenge', '1025', '2013-02-01 14:04:59', '41', '2012-12-14 09:41:50', '41', '2012-12-14 09:41:50', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1793', '1', '84', 'kalender', '5', '2013-01-07 11:04:34', '41', '2012-12-27 08:39:50', '41', '2012-12-27 08:39:50', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1459', '1360', '82', 'invoiceold', '1025', '2012-12-13 15:39:44', '41', '2012-12-13 14:49:10', '41', '2012-12-13 14:49:10', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1912', '30', '4', 'kalender', '1', '2013-01-07 15:44:38', '41', '2013-01-07 15:44:34', '41', '2013-01-07 15:44:34', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1917', '22', '2', 'import-pages-csv', '1', '2013-01-08 10:32:13', '41', '2013-01-08 10:32:13', '41', '2013-01-08 10:32:13', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1918', '31', '5', 'page-lister', '1', '2015-11-29 13:22:02', '40', '2015-11-29 13:22:02', '40', '2015-11-29 13:22:02', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1919', '3', '2', 'lister', '1', '2015-11-29 13:22:03', '40', '2015-11-29 13:22:03', '40', '2015-11-29 13:22:03', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1920', '3', '2', 'recent-pages', '1', '2015-11-29 13:22:36', '40', '2015-11-29 13:22:36', '40', '2015-11-29 13:22:36', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1921', '31', '5', 'page-edit-recent', '1', '2015-11-29 13:22:36', '40', '2015-11-29 13:22:36', '40', '2015-11-29 13:22:36', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1922', '22', '2', 'logs', '1', '2015-11-29 13:22:50', '40', '2015-11-29 13:22:50', '40', '2015-11-29 13:22:50', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1923', '31', '5', 'logs-view', '1', '2015-11-29 13:22:50', '40', '2015-11-29 13:22:50', '40', '2015-11-29 13:22:50', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1924', '31', '5', 'logs-edit', '1', '2015-11-29 13:22:50', '40', '2015-11-29 13:22:50', '40', '2015-11-29 13:22:50', '12');

DROP TABLE IF EXISTS `pages_access`;
CREATE TABLE `pages_access` (
  `pages_id` int(11) NOT NULL,
  `templates_id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pages_id`),
  KEY `templates_id` (`templates_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('37', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('38', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('32', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('34', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('35', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('36', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('50', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('51', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('52', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('53', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('54', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1007', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1009', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1270', '2', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1173', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1174', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1175', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1176', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1793', '1', '2012-12-27 08:47:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1181', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1182', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1183', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1184', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1185', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1186', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1187', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1188', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1189', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1190', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1191', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1192', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1193', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1194', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1195', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1196', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1197', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1198', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1199', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1200', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1201', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1202', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1203', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1204', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1205', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1206', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1207', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1208', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1209', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1210', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1211', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1212', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1213', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1221', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1222', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1223', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1057', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1059', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1060', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1055', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1056', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1053', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1066', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1157', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1224', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1230', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1256', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1051', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1052', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1049', '59', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1561', '59', '2012-12-14 14:13:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1072', '54', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1070', '54', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1073', '54', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1365', '65', '2012-12-12 12:54:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1274', '65', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1286', '65', '2012-12-12 10:52:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1361', '2', '2012-12-12 11:17:43');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1362', '2', '2012-12-12 11:17:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1363', '54', '2012-12-12 11:23:08');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1396', '72', '2012-12-12 16:38:04');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1397', '72', '2012-12-12 16:41:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1794', '1', '2012-12-27 10:56:49');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1731', '72', '2012-12-19 13:12:38');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1459', '72', '2012-12-13 14:49:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1912', '2', '2013-01-07 15:44:34');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1918', '2', '2015-11-29 13:22:02');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1921', '2', '2015-11-29 13:22:36');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1923', '2', '2015-11-29 13:22:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1924', '2', '2015-11-29 13:22:50');

DROP TABLE IF EXISTS `pages_parents`;
CREATE TABLE `pages_parents` (
  `pages_id` int(10) unsigned NOT NULL,
  `parents_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('2', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('7', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1006', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1006', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1006', '22');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1011', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1049', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1049', '1011');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1051', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1051', '1011');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1051', '1049');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1052', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1052', '1011');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1052', '1049');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1055', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1055', '1011');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1055', '1049');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1055', '1051');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1056', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1056', '1011');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1056', '1049');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1056', '1051');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1069', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1070', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1070', '1069');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1072', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1072', '1069');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1072', '1070');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1096', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1096', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1111', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1266', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1357', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1357', '1266');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1359', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1359', '1266');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1359', '1357');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1360', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1360', '1266');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1360', '1357');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1561', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1561', '1011');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1793', '1');

DROP TABLE IF EXISTS `pages_sortfields`;
CREATE TABLE `pages_sortfields` (
  `pages_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sortfield` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `process_forgot_password`;
CREATE TABLE `process_forgot_password` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `token` char(32) NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `ts` (`ts`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

INSERT INTO `process_forgot_password` (`id`, `name`, `token`, `ts`, `ip`) VALUES('41', 'admin', '659487608a54f7378e940777f22b8206', '1354805221', '');

DROP TABLE IF EXISTS `session_login_throttle`;
CREATE TABLE `session_login_throttle` (
  `name` varchar(128) NOT NULL,
  `attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `last_attempt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET ascii NOT NULL,
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cache_time` mediumint(9) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fieldgroups_id` (`fieldgroups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('2', 'admin', '2', '8', '0', '{\"useRoles\":1,\"parentTemplates\":[2],\"allowPageNum\":1,\"redirectLogin\":23,\"slashUrls\":1,\"noGlobal\":1,\"modified\":1410495622}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('3', 'user', '3', '8', '0', '{\"useRoles\":1,\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"User\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('4', 'role', '4', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Role\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('5', 'permission', '5', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"guestSearchable\":1,\"pageClass\":\"Permission\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('1', 'home', '1', '0', '0', '{\"useRoles\":1,\"noParents\":1,\"slashUrls\":1,\"modified\":1410495623,\"roles\":[37,1270]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('29', 'basic-page', '83', '0', '0', '{\"slashUrls\":1,\"modified\":1410495622}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('26', 'search', '80', '0', '0', '{\"noChildren\":1,\"noParents\":1,\"allowPageNum\":1,\"slashUrls\":1,\"modified\":1410495623}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('43', 'language', '97', '8', '0', '{\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Language\",\"pageLabelField\":\"name\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noChangeTemplate\":1,\"noUnpublish\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('44', 'buchhaltung', '98', '0', '0', '{\"useRoles\":1,\"slashUrls\":1,\"altFilename\":\"buchhaltungMonate\",\"roles\":[1361,1362]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('45', 'buchung', '99', '0', '0', '{\"slashUrls\":1,\"altFilename\":\"buchhaltungBuchungDetail\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('52', 'NameundTitle', '106', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('46', 'projectconfig', '100', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('47', 'buchhaltungKostenart', '101', '0', '0', '{\"childTemplates\":[47],\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('48', 'buchhaltungSteuersaetze', '102', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('83', 'invoicePrint', '137', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('50', 'buchhaltungKostenartNew', '104', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('51', 'buchhaltungSystem', '105', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('53', 'buchhaltungSteuersatzAdd', '107', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('54', 'kunden', '108', '0', '0', '{\"useRoles\":1,\"slashUrls\":1,\"modified\":1410495623,\"roles\":[1270,1362]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('55', 'kundenAdd', '109', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('56', 'kunde', '110', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('66', 'buchhaltungMonatePrint', '120', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('77', 'invoiceDetail', '131', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('59', 'buchhaltungJahr', '113', '0', '0', '{\"useRoles\":1,\"slashUrls\":1,\"modified\":1410495622,\"roles\":[1361,1362]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('63', 'buchhaltungBuchungDel', '117', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('64', 'buchhaltungKostenArtHide', '118', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('65', 'systemsettings', '119', '0', '0', '{\"useRoles\":1,\"slashUrls\":1,\"modified\":1410495623}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('67', 'buchhaltungJahrPrint', '121', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('84', 'kalender', '138', '0', '0', '{\"slashUrls\":1,\"modified\":1410495623}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('68', 'systemsettingsMitarbeiter', '122', '0', '0', '{\"slashUrls\":1,\"modified\":1410495623}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('69', 'systemsettingsMitarbeiterAdd', '123', '0', '0', '{\"slashUrls\":1,\"modified\":1410495623}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('82', 'invoiceOld', '136', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('71', 'systemsettingsMitarbeiterDel', '125', '0', '0', '{\"slashUrls\":1,\"modified\":1410495623}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('72', 'invoice', '126', '0', '0', '{\"useRoles\":1,\"slashUrls\":1,\"modified\":1410495623,\"roles\":[1362]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('73', 'kundeDel', '127', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('80', 'invoicePosten', '134', '0', '0', '{\"slashUrls\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('81', 'invoiceAddedPosten', '135', '0', '0', '{\"slashUrls\":1}');

UPDATE pages SET created_users_id=41, modified_users_id=41, created=NOW(), modified=NOW();

# --- /WireDatabaseBackup {"numTables":62,"numCreateTables":68,"numInserts":939,"numSeconds":1}