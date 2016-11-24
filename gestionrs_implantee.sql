-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 24 Novembre 2016 à 16:22
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gestionrs`
--

-- --------------------------------------------------------

--
-- Structure de la table `ajouter`
--

CREATE TABLE IF NOT EXISTS `ajouter` (
  `IDRESERVATION` int(2) NOT NULL,
  `IDMATERIEL` int(2) NOT NULL,
  PRIMARY KEY (`IDRESERVATION`,`IDMATERIEL`),
  KEY `I_FK_AJOUTER_RESERVATION` (`IDRESERVATION`),
  KEY `I_FK_AJOUTER_MATERIEL` (`IDMATERIEL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `IDCATEGORIE` int(2) NOT NULL AUTO_INCREMENT,
  `NOMCATEGORIE` char(32) DEFAULT NULL,
  `NBPLACES` int(2) DEFAULT NULL,
  PRIMARY KEY (`IDCATEGORIE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`IDCATEGORIE`, `NOMCATEGORIE`, `NBPLACES`) VALUES
(1, 'Réunion', 40),
(2, 'Travail', 20),
(3, 'salle modulable (mode reunion)', 60),
(4, 'salle modulable (mode travail)', 40),
(5, 'multimédia', 20);

-- --------------------------------------------------------

--
-- Structure de la table `categr`
--

CREATE TABLE IF NOT EXISTS `categr` (
  `NUMCAT` int(2) NOT NULL AUTO_INCREMENT,
  `NOMCATR` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`NUMCAT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `categr`
--

INSERT INTO `categr` (`NUMCAT`, `NOMCATR`) VALUES
(1, 'CD Resident'),
(2, 'CD non Resident'),
(3, 'formation CD resident');

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE IF NOT EXISTS `contenir` (
  `IDMATERIEL` int(2) NOT NULL,
  `IDSALLE` int(2) NOT NULL,
  PRIMARY KEY (`IDMATERIEL`,`IDSALLE`),
  KEY `I_FK_CONTENIR_MATERIEL` (`IDMATERIEL`),
  KEY `I_FK_CONTENIR_SALLE` (`IDSALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `demandeur`
--

CREATE TABLE IF NOT EXISTS `demandeur` (
  `IDD` int(2) NOT NULL AUTO_INCREMENT,
  `IDORG` int(2) NOT NULL,
  `NOMU` varchar(128) DEFAULT NULL,
  `ADRESSEMAIL` varchar(128) DEFAULT NULL,
  `MDP` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDD`),
  KEY `I_FK_DEMANDEUR_ORGANISME` (`IDORG`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `demandeur`
--

INSERT INTO `demandeur` (`IDD`, `IDORG`, `NOMU`, `ADRESSEMAIL`, `MDP`) VALUES
(1, 1, 'jeanD', 'jean@gym.fr', 'jeje21'),
(2, 1, 'jeanne', 'jeanne@gym.fr', 'jeajea26');

-- --------------------------------------------------------

--
-- Structure de la table `duree`
--

CREATE TABLE IF NOT EXISTS `duree` (
  `IDDUREE` int(2) NOT NULL AUTO_INCREMENT,
  `DUREE` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDDUREE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `duree`
--

INSERT INTO `duree` (`IDDUREE`, `DUREE`) VALUES
(1, '1/2 journée'),
(2, 'journée'),
(3, 'soirée');

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE IF NOT EXISTS `materiel` (
  `IDMATERIEL` int(2) NOT NULL AUTO_INCREMENT,
  `NOM` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDMATERIEL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `organisme`
--

CREATE TABLE IF NOT EXISTS `organisme` (
  `IDORG` int(2) NOT NULL AUTO_INCREMENT,
  `NUMCAT` int(2) NOT NULL,
  `NOMORG` char(32) DEFAULT NULL,
  `ADRESSE` char(255) DEFAULT NULL,
  `CP` int(2) DEFAULT NULL,
  `VILLE` char(32) DEFAULT NULL,
  `MAIL` char(255) DEFAULT NULL,
  `TEL` int(2) DEFAULT NULL,
  PRIMARY KEY (`IDORG`),
  KEY `I_FK_ORGANISME_CATEGR` (`NUMCAT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `organisme`
--

INSERT INTO `organisme` (`IDORG`, `NUMCAT`, `NOMORG`, `ADRESSE`, `CP`, `VILLE`, `MAIL`, `TEL`) VALUES
(1, 1, 'gym Club', 'rue de la moine', 49300, 'Cholet', 'gym.club@villecholet.com', 245873976);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `IDRESERVATION` int(2) NOT NULL AUTO_INCREMENT,
  `IDDUREE` int(2) NOT NULL,
  `IDSALLE` int(2) NOT NULL,
  `IDORG` int(2) NOT NULL,
  `VALIDER` tinyint(1) DEFAULT NULL,
  `OBJET` char(255) DEFAULT NULL,
  `NBPERS` int(2) DEFAULT NULL,
  `NBPERSHAND` int(2) DEFAULT NULL,
  `MESSAGE` char(255) DEFAULT NULL,
  `DATERESERV` date DEFAULT NULL,
  PRIMARY KEY (`IDRESERVATION`),
  KEY `I_FK_RESERVATION_DUREE` (`IDDUREE`),
  KEY `I_FK_RESERVATION_SALLE` (`IDSALLE`),
  KEY `I_FK_RESERVATION_ORGANISME` (`IDORG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `IDSALLE` int(2) NOT NULL AUTO_INCREMENT,
  `IDCATEGORIE` int(2) NOT NULL,
  `NOMSALLE` char(32) DEFAULT NULL,
  `DISPONIBLE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`IDSALLE`),
  KEY `I_FK_SALLE_CATEGORIE` (`IDCATEGORIE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`IDSALLE`, `IDCATEGORIE`, `NOMSALLE`, `DISPONIBLE`) VALUES
(1, 1, 'Erine', NULL),
(2, 1, 'Grémil', NULL),
(3, 1, 'Molène', NULL),
(4, 1, 'Nigelle', NULL),
(5, 2, 'Alysson', NULL),
(6, 2, 'Brunelle', NULL),
(7, 3, 'Cardère', NULL),
(8, 4, 'Dryade', NULL),
(9, 5, 'Multimédia', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tarifer`
--

CREATE TABLE IF NOT EXISTS `tarifer` (
  `NUMCAT` int(2) NOT NULL,
  `IDCATEGORIE` int(2) NOT NULL,
  `IDDUREE` int(2) NOT NULL,
  `PRIX` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`NUMCAT`,`IDCATEGORIE`,`IDDUREE`),
  KEY `I_FK_TARIFER_CATEGR` (`NUMCAT`),
  KEY `I_FK_TARIFER_CATEGORIE` (`IDCATEGORIE`),
  KEY `I_FK_TARIFER_DUREE` (`IDDUREE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tarifer`
--

INSERT INTO `tarifer` (`NUMCAT`, `IDCATEGORIE`, `IDDUREE`, `PRIX`) VALUES
(1, 1, 1, '0.00'),
(1, 1, 2, '0.00'),
(1, 1, 3, '0.00'),
(1, 2, 1, '0.00'),
(1, 2, 2, '0.00'),
(1, 2, 3, '0.00'),
(2, 1, 1, '28.00'),
(2, 1, 2, '42.00'),
(2, 1, 3, '28.00'),
(2, 2, 1, '14.00'),
(2, 2, 2, '21.00'),
(2, 2, 3, '14.00'),
(3, 1, 1, '19.00'),
(3, 1, 2, '29.00'),
(3, 1, 3, '19.00'),
(3, 2, 1, '9.00'),
(3, 2, 2, '14.00'),
(3, 2, 3, '9.00');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ajouter`
--
ALTER TABLE `ajouter`
  ADD CONSTRAINT `ajouter_ibfk_2` FOREIGN KEY (`IDMATERIEL`) REFERENCES `materiel` (`IDMATERIEL`),
  ADD CONSTRAINT `ajouter_ibfk_1` FOREIGN KEY (`IDRESERVATION`) REFERENCES `reservation` (`IDRESERVATION`);

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`IDSALLE`) REFERENCES `salle` (`IDSALLE`),
  ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`IDMATERIEL`) REFERENCES `materiel` (`IDMATERIEL`);

--
-- Contraintes pour la table `demandeur`
--
ALTER TABLE `demandeur`
  ADD CONSTRAINT `demandeur_ibfk_1` FOREIGN KEY (`IDORG`) REFERENCES `organisme` (`IDORG`);

--
-- Contraintes pour la table `organisme`
--
ALTER TABLE `organisme`
  ADD CONSTRAINT `organisme_ibfk_1` FOREIGN KEY (`NUMCAT`) REFERENCES `categr` (`NUMCAT`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`IDORG`) REFERENCES `organisme` (`IDORG`),
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`IDDUREE`) REFERENCES `duree` (`IDDUREE`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`IDSALLE`) REFERENCES `salle` (`IDSALLE`);

--
-- Contraintes pour la table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `salle_ibfk_1` FOREIGN KEY (`IDCATEGORIE`) REFERENCES `categorie` (`IDCATEGORIE`);

--
-- Contraintes pour la table `tarifer`
--
ALTER TABLE `tarifer`
  ADD CONSTRAINT `tarifer_ibfk_3` FOREIGN KEY (`IDDUREE`) REFERENCES `duree` (`IDDUREE`),
  ADD CONSTRAINT `tarifer_ibfk_1` FOREIGN KEY (`NUMCAT`) REFERENCES `categr` (`NUMCAT`),
  ADD CONSTRAINT `tarifer_ibfk_2` FOREIGN KEY (`IDCATEGORIE`) REFERENCES `categorie` (`IDCATEGORIE`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
