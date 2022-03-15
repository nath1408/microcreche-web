-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 15 mars 2022 à 20:34
-- Version du serveur : 5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `microcreche`
--

-- --------------------------------------------------------

--
-- Structure de la table `achats`
--

DROP TABLE IF EXISTS `achats`;
CREATE TABLE IF NOT EXISTS `achats` (
  `id_achat` int(3) NOT NULL AUTO_INCREMENT,
  `id_membre` int(3) DEFAULT NULL,
  `montant` int(3) NOT NULL,
  `date_achat` datetime NOT NULL,
  PRIMARY KEY (`id_achat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `achats`
--

INSERT INTO `achats` (`id_achat`, `id_membre`, `montant`, `date_achat`) VALUES
(1, 10, 0, '2022-02-12 14:18:49'),
(2, 10, 15, '2022-02-12 14:19:30'),
(3, 10, 15, '2022-02-19 12:04:50');

-- --------------------------------------------------------

--
-- Structure de la table `achats_details`
--

DROP TABLE IF EXISTS `achats_details`;
CREATE TABLE IF NOT EXISTS `achats_details` (
  `id_achats_details` int(3) NOT NULL AUTO_INCREMENT,
  `id_achat` int(3) DEFAULT NULL,
  `id_article` int(3) DEFAULT NULL,
  `prix` int(3) NOT NULL,
  `quantite` int(3) NOT NULL,
  PRIMARY KEY (`id_achats_details`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `achats_details`
--

INSERT INTO `achats_details` (`id_achats_details`, `id_achat`, `id_article`, `prix`, `quantite`) VALUES
(1, 2, 50, 15, 1),
(2, 3, 50, 15, 1);

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nomAdmin` varchar(50) NOT NULL,
  `mdpAdmin` varchar(50) NOT NULL,
  `statut` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `nomAdmin`, `mdpAdmin`, `statut`) VALUES
(8, 'Nathalie', 'Puceron05', 1);

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int(3) NOT NULL AUTO_INCREMENT,
  `reference` varchar(20) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `couleur` varchar(20) NOT NULL,
  `taille` varchar(10) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `prix` float NOT NULL,
  `stock` int(3) NOT NULL,
  `categorie` varchar(20) NOT NULL,
  PRIMARY KEY (`id_article`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_article`, `reference`, `titre`, `description`, `couleur`, `taille`, `photo`, `prix`, `stock`, `categorie`) VALUES
(82, '3', 'pull', 'joli', 'rouge', '6 ans', 'jupe.jpg', 5, 1, '1'),
(83, '2', 'pull', 'joli', 'bleu', '5 ans', '', 10, 1, '1'),
(84, '3', 'pull', 'joli', 'rouge', '4 ans', 'jupe.jpg', 5, 1, '1'),
(85, '03', 'jupe', 'joli', 'bleu', 'M', '', 20, 1, '2'),
(86, '05', 'chemise', 'joli', 'rouge', 'M', '', 20, 1, 'femme');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Bébé'),
(2, 'Enfant'),
(3, 'Femme');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id_membre` int(3) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(20) CHARACTER SET utf8 NOT NULL,
  `mdp` varchar(32) CHARACTER SET utf8 NOT NULL,
  `nom` varchar(20) CHARACTER SET utf8 NOT NULL,
  `prenom` varchar(20) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `civilite` enum('m','f') CHARACTER SET utf8 NOT NULL,
  `ville` varchar(20) NOT NULL,
  `code_postal` int(5) UNSIGNED ZEROFILL NOT NULL,
  `adresse` varchar(50) CHARACTER SET utf8 NOT NULL,
  `statut` int(1) DEFAULT '0',
  PRIMARY KEY (`id_membre`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id_membre`, `pseudo`, `mdp`, `nom`, `prenom`, `email`, `civilite`, `ville`, `code_postal`, `adresse`, `statut`) VALUES
(21, 'jiji', 'pipi', 'NATHALIE', 'FORM', '05microcreche@gmail.com', 'f', 'la salle les alpes ', 05240, '3 chemin des pananches', 1),
(22, 'lili', 'pipi', 'NATHALIE', 'FORM', '05microcreche@gmail.com', 'f', 'la salle les alpes ', 05240, '3 chemin des pananches', 1),
(23, 'pupu', 'pipi', 'NATHALIE', 'FORM', '05microcreche@gmail.com', 'f', 'la salle les alpes ', 05240, '3 chemin des pananches', 1),
(24, 'gigi', 'poupou', 'NATHALIE', 'FORM', '05microcreche@gmail.com', 'f', 'la salle les alpes ', 05240, '3 chemin des pananches', 1),
(25, 'gogo', 'pipi', 'NATHALIE', 'FORM', '05microcreche@gmail.com', 'f', 'la salle les alpes ', 05240, '3 chemin des pananches', 1),
(26, 'ga', 'pipi', 'NATHALIE', 'FORM', '05microcreche@gmail.com', 'f', 'la salle les alpes ', 05240, '3 chemin des pananches', 1),
(27, 'geler', 'pipi', 'NATHALIE', 'FORM', '05microcreche@gmail.com', 'f', 'la salle les alpes ', 05240, '3 chemin des pananches', 1),
(28, 'ger', 'pipi', 'NATHALIE', 'FORM', '05microcreche@gmail.com', 'f', 'la salle les alpes ', 05240, '3 chemin des pananches', 1),
(29, 'naty', 'NANA', 'form', 'nathalie', '05microcreche@gmail.com', 'f', 'la salle les alpes ', 05240, '3 chemin des pananches', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
