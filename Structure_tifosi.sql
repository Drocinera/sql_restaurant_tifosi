-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 27 juin 2024 à 16:54
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tifosi`
--

-- --------------------------------------------------------

--
-- Structure de la table `achete`
--

CREATE TABLE `achete` (
  `id_achete` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_focaccia` int(11) DEFAULT NULL,
  `jour` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `id_appartient` int(11) NOT NULL,
  `id_boisson` int(11) DEFAULT NULL,
  `id_marque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

CREATE TABLE `boisson` (
  `id_boisson` int(11) NOT NULL,
  `nom_boisson` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `cp_client` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `comprend`
--

CREATE TABLE `comprend` (
  `id_comprend` int(11) NOT NULL,
  `id_focaccia` int(11) DEFAULT NULL,
  `id_ingredient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contient`
--

CREATE TABLE `contient` (
  `id_contient` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `id_boisson` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `est_constituer`
--

CREATE TABLE `est_constituer` (
  `id_est_constituer` int(11) NOT NULL,
  `id_focaccia` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `focaccia`
--

CREATE TABLE `focaccia` (
  `id_focaccia` int(11) NOT NULL,
  `nom_focaccia` varchar(45) DEFAULT NULL,
  `prix_focaccia` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id_ingredient` int(11) NOT NULL,
  `nom_ingredient` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `id_marque` int(11) NOT NULL,
  `nom_marque` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nom_menu` varchar(45) DEFAULT NULL,
  `prix_menu` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paye`
--

CREATE TABLE `paye` (
  `id_paye` int(11) NOT NULL,
  `jour` date DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achete`
--
ALTER TABLE `achete`
  ADD PRIMARY KEY (`id_achete`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_focaccia` (`id_focaccia`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`id_appartient`),
  ADD UNIQUE KEY `id_boisson` (`id_boisson`),
  ADD KEY `id_marque` (`id_marque`);

--
-- Index pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD PRIMARY KEY (`id_boisson`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `comprend`
--
ALTER TABLE `comprend`
  ADD PRIMARY KEY (`id_comprend`),
  ADD KEY `id_focaccia` (`id_focaccia`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Index pour la table `contient`
--
ALTER TABLE `contient`
  ADD PRIMARY KEY (`id_contient`),
  ADD KEY `fk_menu` (`id_menu`),
  ADD KEY `fk_boisson` (`id_boisson`);

--
-- Index pour la table `est_constituer`
--
ALTER TABLE `est_constituer`
  ADD PRIMARY KEY (`id_est_constituer`),
  ADD UNIQUE KEY `id_menu` (`id_menu`),
  ADD KEY `id_focaccia` (`id_focaccia`);

--
-- Index pour la table `focaccia`
--
ALTER TABLE `focaccia`
  ADD PRIMARY KEY (`id_focaccia`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id_ingredient`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id_marque`);

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Index pour la table `paye`
--
ALTER TABLE `paye`
  ADD PRIMARY KEY (`id_paye`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `fk_paye_menu` (`id_menu`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `achete`
--
ALTER TABLE `achete`
  MODIFY `id_achete` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `appartient`
--
ALTER TABLE `appartient`
  MODIFY `id_appartient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `boisson`
--
ALTER TABLE `boisson`
  MODIFY `id_boisson` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comprend`
--
ALTER TABLE `comprend`
  MODIFY `id_comprend` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contient`
--
ALTER TABLE `contient`
  MODIFY `id_contient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `est_constituer`
--
ALTER TABLE `est_constituer`
  MODIFY `id_est_constituer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `focaccia`
--
ALTER TABLE `focaccia`
  MODIFY `id_focaccia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id_ingredient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `id_marque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paye`
--
ALTER TABLE `paye`
  MODIFY `id_paye` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achete`
--
ALTER TABLE `achete`
  ADD CONSTRAINT `achete_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `achete_ibfk_2` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`);

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`),
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`);

--
-- Contraintes pour la table `comprend`
--
ALTER TABLE `comprend`
  ADD CONSTRAINT `comprend_ibfk_1` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  ADD CONSTRAINT `comprend_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);

--
-- Contraintes pour la table `contient`
--
ALTER TABLE `contient`
  ADD CONSTRAINT `fk_boisson` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`),
  ADD CONSTRAINT `fk_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Contraintes pour la table `est_constituer`
--
ALTER TABLE `est_constituer`
  ADD CONSTRAINT `est_constituer_ibfk_1` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  ADD CONSTRAINT `est_constituer_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Contraintes pour la table `paye`
--
ALTER TABLE `paye`
  ADD CONSTRAINT `fk_paye_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`),
  ADD CONSTRAINT `paye_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
