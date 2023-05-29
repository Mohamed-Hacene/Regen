-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 31 déc. 2022 à 00:57
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zlegacy`
--

-- --------------------------------------------------------

--
-- Structure de la table `vetement`
--

CREATE TABLE `vetement` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `identifier` varchar(40) DEFAULT NULL,
  `nom` longtext DEFAULT NULL,
  `clothe` longtext DEFAULT NULL,
  `vie` int(11) NOT NULL DEFAULT 100,
  `onPickup` tinyint(1) NOT NULL DEFAULT 0,
  `vehchest` varchar(255) DEFAULT NULL,
  `propchest` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `vetement`
--
ALTER TABLE `vetement`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `vetement`
--
ALTER TABLE `vetement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('12_ammo', 'Munitions Calibre 12', 10, 0, 1),
('45acp_ammo', '45acp', 10, 0, 1),
('762mm_ammo', '7.62mm', 10, 0, 1),
('9mm_ammo', '9mm', 10, 0, 1),
('WEAPON_ADVANCEDRIFLE', 'Fusil avancé', 5000, 0, 1),
('WEAPON_APPISTOL', 'Pistolet Perforant', 3000, 0, 1),
('WEAPON_ASSAULTRIFLE', 'AK-47 MK2', 5000, 0, 1),
('WEAPON_ASSAULTSHOTGUN', 'UTAS UTS-15', 5000, 0, 1),
('WEAPON_ASSAULTSMG', 'SMG', 5000, 0, 1),
('WEAPON_AUTOSHOTGUN', 'AA-12', 5000, 0, 1),
('WEAPON_BALL', 'Ball', 100, 0, 1),
('WEAPON_BAT', 'Batte de Baseball', 1000, 0, 1),
('WEAPON_BATTLEAXE', 'Hache de combat', 1000, 0, 1),
('WEAPON_BOTTLE', 'Bouteille cassé', 1000, 0, 1),
('WEAPON_BRIEFCASE', 'Malette', 1000, 0, 1),
('WEAPON_BRIEFCASE_02', 'Malette', 1000, 0, 1),
('WEAPON_BULLPUPRIFLE', 'Fusil Bullpup MK2', 5000, 0, 1),
('WEAPON_BULLPUPSHOTGUN', 'Kel-Tec KSG', 5000, 0, 1),
('WEAPON_BZGAS', 'BZ Gas', 500, 0, 1),
('WEAPON_CARBINERIFLE', 'Carabine', 5000, 0, 1),
('WEAPON_CERAMICPISTOL', 'Ceramic Pistol', 1, 0, 1),
('WEAPON_COMBATMG', 'Mitrailleuse de Combat', 7000, 0, 1),
('WEAPON_COMBATPDW', 'Combat PDW', 5000, 0, 1),
('WEAPON_COMBATPISTOL', 'Glock', 2000, 0, 1),
('WEAPON_COMBATSHOTGUN', 'SPAS 12', 5000, 0, 1),
('WEAPON_COMPACTLAUNCHER', 'Compact Launcher', 5000, 0, 1),
('WEAPON_COMPACTRIFLE', 'Fusil compact\r\n', 5000, 0, 1),
('WEAPON_CROWBAR', 'Pied de biche', 1000, 0, 1),
('WEAPON_DAGGER', 'Dague', 1000, 0, 1),
('WEAPON_DBSHOTGUN', 'Fusil a double Canon', 5000, 0, 1),
('WEAPON_DIGISCANNER', 'Digiscanner', 1000, 0, 1),
('WEAPON_DOUBLEACTION', 'Double-Action Revolver', 3000, 0, 1),
('WEAPON_FIREEXTINGUISHER', 'Extincteur', 3000, 0, 1),
('WEAPON_FIREWORK', 'Firework Launcher', 500, 0, 1),
('WEAPON_FLARE', 'Fumigène', 500, 0, 1),
('WEAPON_FLAREGUN', 'Pistolet Fumigène', 1000, 0, 1),
('WEAPON_FLASHLIGHT', 'Lampe torche', 1000, 0, 1),
('WEAPON_GADGETPISTOL', ' Perico Pistol', 1, 0, 1),
('WEAPON_GARBAGEBAG', 'Garbage Bag', 1000, 0, 1),
('WEAPON_GOLFCLUB', 'Club de Golf', 1000, 0, 1),
('WEAPON_GRENADE', 'Grenade', 500, 0, 1),
('WEAPON_GRENADELAUNCHER', 'Gernade Launcher', 5000, 0, 1),
('WEAPON_GUSENBERG', 'Mitrailleuse Gusenberg', 7000, 0, 1),
('WEAPON_HAMMER', 'Marteau', 1000, 0, 1),
('WEAPON_HANDCUFFS', 'Handcuffs', 200, 0, 1),
('WEAPON_HATCHET', 'Hachette', 1000, 0, 1),
('WEAPON_HEAVYPISTOL', 'Pistolet Lourd', 2000, 0, 1),
('WEAPON_HEAVYRIFLE', 'Assault rifle', 1, 0, 1),
('WEAPON_HEAVYSHOTGUN', 'Saiga-12K', 5000, 0, 1),
('WEAPON_HEAVYSNIPER', 'Heavy Sniper', 10000, 0, 1),
('WEAPON_HOMINGLAUNCHER', 'Homing Launcher', 10000, 0, 1),
('WEAPON_KNIFE', 'Couteau', 1000, 0, 1),
('WEAPON_KNUCKLE', 'Poing américain', 1000, 0, 1),
('WEAPON_MACHETE', 'Machete', 1000, 0, 1),
('WEAPON_MACHINEPISTOL', 'TEC-9', 3000, 0, 1),
('WEAPON_MARKSMANPISTOL', 'Pistolet Marksman', 3000, 0, 1),
('WEAPON_MARKSMANRIFLE', 'M39 EMR', 10000, 0, 1),
('WEAPON_MG', 'Mitrailleuse', 7000, 0, 1),
('WEAPON_MICROSMG', 'Micro SMG', 5000, 0, 1),
('WEAPON_MILITARYRIFLE', 'Assault rifle', 5000, 0, 1),
('WEAPON_MINIGUN', 'Minigun', 15000, 0, 1),
('WEAPON_MINISMG', 'Skorpion Vz. 61', 3000, 0, 1),
('WEAPON_MOLOTOV', 'Cocktail Molotov', 1000, 0, 1),
('WEAPON_MUSKET', 'Musket', 10000, 0, 1),
('WEAPON_NAVYREVOLVER', 'Navy Revolver', 1, 0, 1),
('WEAPON_NIGHTSTICK', 'Matraque', 1000, 0, 1),
('WEAPON_PELLE', 'Pelle', 1000, 0, 1),
('WEAPON_PETROLCAN', 'Jerycan', 5000, 0, 1),
('WEAPON_PIPEBOMB', 'Pipe Bomb', 500, 0, 1),
('WEAPON_PISTOL', 'Beretta', 2000, 0, 1),
('WEAPON_PISTOL50', 'Pistolet Calibre 50', 3000, 0, 1),
('WEAPON_POOLCUE', 'Queue de billard', 1000, 0, 1),
('WEAPON_PROXMINE', 'Proximity Mine', 500, 0, 1),
('WEAPON_PUMPSHOTGUN', 'Fusil à pompe', 5000, 0, 1),
('WEAPON_RAILGUN', 'Rail Gun', 7000, 0, 1),
('WEAPON_REVOLVER', 'Revolver', 3000, 0, 1),
('WEAPON_RPG', 'RPG', 15000, 0, 1),
('WEAPON_SAWNOFFSHOTGUN', 'Mossberg 500', 5000, 0, 1),
('WEAPON_SMG', 'SMG', 5000, 0, 1),
('WEAPON_SMOKEGRENADE', 'Grenade lacrymogène', 500, 0, 1),
('WEAPON_SNIPERRIFLE', 'Sniper Rifle', 10000, 0, 1),
('WEAPON_SNOWBALL', 'Boule de neige', 500, 0, 1),
('WEAPON_SNSPISTOL', 'Pétoire', 2000, 0, 1),
('WEAPON_SPECIALCARBINE', 'H&K G36C', 5000, 0, 1),
('WEAPON_STICKYBOMB', 'Sticky Bombs', 500, 0, 1),
('WEAPON_STINGER', 'Stinger', 5000, 0, 1),
('WEAPON_STUNGUN', 'X26 Taser', 2000, 0, 1),
('WEAPON_SWITCHBLADE', 'Couteau à cran arrêt', 1000, 0, 1),
('WEAPON_VINTAGEPISTOL', 'Pistolet Vintage', 2000, 0, 1),
('WEAPON_WRENCH', 'Clés a molette', 100, 0, 1);