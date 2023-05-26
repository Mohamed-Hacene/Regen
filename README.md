# Regen server development base 🚀

## Installation 🪄

* Avec git:
```bash
git clone git@github.com:Mohamed-Hacene/Regen.git
```
* En ZIP: cliquez [ici](https://github.com/Mohamed-Hacene/Regen/archive/refs/heads/main.zip) pour lancer le téléchargement, ou allez directement dans l'onglet "Code" au-dessus.

> IMPORTANT: En téléchargeant le ZIP, une fois décompressé on récupère le dossier sous le nom "Regen-main", il faut le renommer en "Regen" pour éviter des soucis.

## Base de données 💾

* Téléchargez [XAMPP](https://www.apachefriends.org/fr/index.html) pour pouvoir démarrer simplement les serveurs APACHE et MySQL.
* Pour faire plus simple, il est préférable de nommer votre base de données "regen" pour éviter de devoir modifier les différents fichiers, scripts. Libre à vous d'en choisir un autre mais il ne faudra pas oublier de mettre à jour le nom de base de données utilisé dans le code.
* Une fois sur votre [localhost/phpmyadmin](http://localhost/phpmyadmin/index.php?route=/), cliquez sur votre base de données et rendez-vous dans l'onglet [SQL](http://localhost/phpmyadmin/index.php?route=/server/sql).
* Entrez dans l'espace texte qui apparaît le script ci-dessous et cliquez sur le bouton "Exécuter":
> Merci de copier-coller toutes les lignes de ce script
```sql
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for essentialmode
CREATE DATABASE IF NOT EXISTS `regen` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `regen`;

-- Dumping structure for table essentialmode.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

ALTER TABLE `users`
	ADD COLUMN `name` VARCHAR(255) NULL DEFAULT '' AFTER `money`,
	ADD COLUMN `skin` LONGTEXT NULL AFTER `name`,
	ADD COLUMN `job` varchar(255) NULL DEFAULT 'chomâge' AFTER `skin`,
	ADD COLUMN `job_grade` INT NULL DEFAULT 0 AFTER `job`,
	ADD COLUMN `loadout` LONGTEXT NULL AFTER `job_grade`,
	ADD COLUMN `position` VARCHAR(255) NULL AFTER `loadout`
;

CREATE TABLE `items` (
	`name` varchar(50) NOT NULL,
	`label` varchar(255) NOT NULL,
	`limit` int(11) NOT NULL DEFAULT '-1',
	`rare` int(11) NOT NULL DEFAULT '0',
	`can_remove` int(11) NOT NULL DEFAULT '1',

	PRIMARY KEY (`name`)
);

CREATE TABLE `job_grades` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`job_name` varchar(255) DEFAULT NULL,
	`grade` int(11) NOT NULL,
	`name` varchar(255) NOT NULL,
	`label` varchar(255) NOT NULL,
	`salary` int(11) NOT NULL,
	`skin_male` longtext NOT NULL,
	`skin_female` longtext NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `job_grades` VALUES (1,'chomâge',0,'rsa','rsa',200,'{}','{}');

CREATE TABLE `jobs` (
	`name` varchar(50) NOT NULL,
	`label` varchar(255) DEFAULT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `jobs` VALUES ('chomâge','chomâge');

CREATE TABLE `user_accounts` (

	`id` int(11) NOT NULL AUTO_INCREMENT,
	`identifier` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`money` double NOT NULL DEFAULT '0',

	PRIMARY KEY (`id`)
);

CREATE TABLE `user_inventory` (

	`id` int(11) NOT NULL AUTO_INCREMENT,
	`identifier` varchar(255) NOT NULL,
	`item` varchar(255) NOT NULL,
	`count` int(11) NOT NULL,

	PRIMARY KEY (`id`)
);
```

Maintenant votre base de données est prête à enregistrer les utilisateurs qui se connecteront.

## Fichiers de configuration 🛠️

* server.cfg

Copiez collez le fichier ci-dessous à la racine de votre dossier en n'oubliant pas de spécifier votre [**clé de license FiveM**](https://keymaster.fivem.net) et votre [**steam api key**](https://steamcommunity.com/dev/apikey) à la fin de celui-ci:
```cfg
# Only change the IP if you're using a server with multiple network interfaces, otherwise change the port only.
endpoint_add_tcp "0.0.0.0:30120"
endpoint_add_udp "0.0.0.0:30120"

# DATABASE
set mysql_connection_string "server=localhost;uid=root;database=regen;charset=utf8mb4_danish_ci;sslmode=none;connectTimeout=40000;acquireTimeout=40000;waitForConnections=true;keepAlive=40;charset=utf8mb4"

##### DESACTIVER COUCHEDB POUR ESSENTIALMODE #####
set es_enableCustomData 1

# These resources will start by default.
ensure mapmanager
ensure chat
ensure spawnmanager
ensure sessionmanager
ensure fivem
ensure hardcap


# ESSENTIALS
start mysql-async
start fxmigrant
start essentialmode
start esplugin_mysql
start es_ui
start es_extended
start esx_menu_default
start esx_menu_list
start esx_menu_dialog
start es_admin2

# This allows players to use scripthook-based plugins such as the legacy Lambda Menu.
# Set this to 1 to allow scripthook. Do note that this does _not_ guarantee players won't be able to use external plugins.
sv_scriptHookAllowed 0

# Uncomment this and set a password to enable RCON. Make sure to change the password - it should look like rcon_password "YOURPASSWORD"
#rcon_password ""

# A comma-separated list of tags for your server.
# For example:
# - sets tags "drifting, cars, racing"
# Or:
# - sets tags "roleplay, military, tanks"
sets tags "default"

# A valid locale identifier for your server's primary language.
# For example "en-US", "fr-CA", "nl-NL", "de-DE", "en-GB", "pt-BR"
sets locale "fr-FR" 
# please DO replace root-AQ on the line ABOVE with a real language! :)

# Set an optional server info and connecting banner image url.
# Size doesn't matter, any banner sized image will be fine.
#sets banner_detail "https://url.to/image.png"
#sets banner_connecting "https://url.to/image.png"

# Set your server's hostname. This is not usually shown anywhere in listings.
sv_hostname "Regen"

# Set your server's Project Name
sets sv_projectName "Regen"

# Set your server's Project Description
sets sv_projectDesc "Regen dev"

# Nested configs!
#exec server_internal.cfg

# Loading a server icon (96x96 PNG file)
#load_server_icon myLogo.png

# convars which can be used in scripts
set temp_convar "hey world!"

# Remove the `#` from the below line if you want your server to be listed as 'private' in the server browser.
# Do not edit it if you *do not* want your server listed as 'private'.
# Check the following url for more detailed information about this:
# https://docs.fivem.net/docs/server-manual/server-commands/#sv_master1-newvalue
#sv_master1 ""

# Add system admins
add_ace group.admin command allow # allow all commands
add_ace group.admin command.quit deny # but don't allow quit
add_ace resource.essentialmode command.sets allow
add_ace resource.essentialmode command.add_ace allow
add_ace resource.essentialmode command.add_principal allow
add_principal identifier.fivem:1 group.admin # add the admin to the group
add_ace group.superadmin command.mute allow

# enable OneSync (required for server-side state awareness)
set onesync on

# Server player slot limit (see https://fivem.net/server-hosting for limits)
sv_maxclients 48

# Steam Web API key, if you want to use Steam authentication (https://steamcommunity.com/dev/apikey)
# -> replace "" with the key
set steam_webApiKey "steam_api_key"

# License key for your server (https://keymaster.fivem.net)
sv_licenseKey license_key_fivem
```

* runserveur.bat

Voici un exemple de code pour lancer le serveur:
```bat
@echo OFF
RMDIR /s /q "votre_chemin_vers\Regen\cache\files"
cd /d votre_chemin_vers\Regen
votre_chemin_vers\Regen\FXServer.exe +exec server.cfg
```
> IMPORTANT: n'oubliez pas de remplacer les chemins d'accès au dossier du serveur par le votre. Si vous avez renommé votre dossier autrement que Regen, il faut le spécifier dans le chemin d'accès.