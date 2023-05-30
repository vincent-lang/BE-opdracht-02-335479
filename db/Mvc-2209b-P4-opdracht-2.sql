-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 30 mei 2023 om 14:57
-- Serverversie: 5.7.36
-- PHP-versie: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Mvc-2209b-P4-opdracht-2`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Instructeur`
--

DROP TABLE IF EXISTS `Instructeur`;
CREATE TABLE IF NOT EXISTS `Instructeur` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(50) NOT NULL,
  `Tussenvoegsel` varchar(50) NOT NULL,
  `Achternaam` varchar(50) NOT NULL,
  `Mobiel` varchar(50) NOT NULL,
  `DatumInDienst` varchar(50) NOT NULL,
  `AantalSterren` varchar(20) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Instructeur`
--

INSERT INTO `Instructeur` (`Id`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Mobiel`, `DatumInDienst`, `AantalSterren`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 'Li', '', 'Zhan', '06-28493827', '2015-04-17', '***', b'1', NULL, '2023-05-30 16:57:23.331226', '2023-05-30 16:57:23.331236'),
(2, 'Leroy', '', 'Boerhaven', '06-39398734', '25-06-2018', '*', b'1', NULL, '2023-05-30 16:57:23.378502', '2023-05-30 16:57:23.378509'),
(3, 'Yoeri', 'Van', 'Veen', '06-24383291', '12-05-2010', '***', b'1', NULL, '2023-05-30 16:57:23.421369', '2023-05-30 16:57:23.421376'),
(4, 'Bert', 'Van', 'Sali', '06-48293823', '10-01-2023', '****', b'1', NULL, '2023-05-30 16:57:23.463790', '2023-05-30 16:57:23.463797'),
(5, 'Mohammed', 'El', 'Yassidi', '06-34291234', '14-06-2010', '*****', b'1', NULL, '2023-05-30 16:57:23.502571', '2023-05-30 16:57:23.502579');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `TypeVoertuig`
--

DROP TABLE IF EXISTS `TypeVoertuig`;
CREATE TABLE IF NOT EXISTS `TypeVoertuig` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TypeVoertuig` varchar(50) NOT NULL,
  `Rijbewijscategorie` varchar(50) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `TypeVoertuig`
--

INSERT INTO `TypeVoertuig` (`Id`, `TypeVoertuig`, `Rijbewijscategorie`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 'Personenauto', 'B', b'1', NULL, '2023-05-30 16:57:23.539372', '2023-05-30 16:57:23.539378'),
(2, 'Vrachtwagen', 'C', b'1', NULL, '2023-05-30 16:57:23.570434', '2023-05-30 16:57:23.570442'),
(3, 'Bus', 'D', b'1', NULL, '2023-05-30 16:57:23.608460', '2023-05-30 16:57:23.608468'),
(4, 'Bromfiets', 'AM', b'1', NULL, '2023-05-30 16:57:23.649211', '2023-05-30 16:57:23.649219');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Voertuig`
--

DROP TABLE IF EXISTS `Voertuig`;
CREATE TABLE IF NOT EXISTS `Voertuig` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(20) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `Bouwjaar` varchar(50) NOT NULL,
  `Brandstof` varchar(20) NOT NULL,
  `TypeVoertuigId` tinyint(3) UNSIGNED NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `TypeVoertuigId` (`TypeVoertuigId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Voertuig`
--

INSERT INTO `Voertuig` (`Id`, `Kenteken`, `Type`, `Bouwjaar`, `Brandstof`, `TypeVoertuigId`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 'AU-67-IO', 'Golf', '12-06-2017', 'Diesel', 1, b'1', NULL, '2023-05-30 16:57:23.692738', '2023-05-30 16:57:23.692744'),
(2, 'TR-24-OP', 'DAF', '23-05-2019', 'Diesel', 2, b'1', NULL, '2023-05-30 16:57:23.726033', '2023-05-30 16:57:23.726041'),
(3, 'TH-78-KL', 'Mercedes', '01-01-2023', 'Benzine', 1, b'1', NULL, '2023-05-30 16:57:23.763365', '2023-05-30 16:57:23.763372'),
(4, '90-KL-TR', 'Fiat 500', '12-09-2021', 'Benzine', 1, b'1', NULL, '2023-05-30 16:57:23.798288', '2023-05-30 16:57:23.798295'),
(5, '34-TK-LP', 'Scania', '13-03-2015', 'Diesel', 2, b'1', NULL, '2023-05-30 16:57:23.835711', '2023-05-30 16:57:23.835719'),
(6, 'YY-OP-78', 'BMW M5', '13-05-2022', 'Diesel', 1, b'1', NULL, '2023-05-30 16:57:23.870111', '2023-05-30 16:57:23.870119'),
(7, 'UU-HH-JK', 'M.A.N', '03-12-2017', 'Diesel', 2, b'1', NULL, '2023-05-30 16:57:23.906547', '2023-05-30 16:57:23.906553'),
(8, 'ST-FZ-28', 'Citroën', '20-01-2018', 'Elektrisch', 1, b'1', NULL, '2023-05-30 16:57:23.969873', '2023-05-30 16:57:23.969883'),
(9, '123-FR-T', 'Piaggio ZIP', '01-02-2021', 'Benzine', 4, b'1', NULL, '2023-05-30 16:57:24.006384', '2023-05-30 16:57:24.006391'),
(10, 'DRS-52-P', 'Vespa', '21-03-2022', 'Benzine', 4, b'1', NULL, '2023-05-30 16:57:24.041595', '2023-05-30 16:57:24.041602'),
(11, 'STP-12-U', 'Kymco', '02-07-2022', 'Benzine', 4, b'1', NULL, '2023-05-30 16:57:24.078606', '2023-05-30 16:57:24.078614'),
(12, '45-SD-23', 'Renault', '01-01-2023', 'Diesel', 3, b'1', NULL, '2023-05-30 16:57:24.115391', '2023-05-30 16:57:24.115398');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `VoertuigInstructeur`
--

DROP TABLE IF EXISTS `VoertuigInstructeur`;
CREATE TABLE IF NOT EXISTS `VoertuigInstructeur` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `VoertuigId` tinyint(3) UNSIGNED NOT NULL,
  `InstructeurId` tinyint(3) UNSIGNED NOT NULL,
  `DatumToekenning` date NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `VoertuigId` (`VoertuigId`),
  KEY `InstructeurId` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `VoertuigInstructeur`
--

INSERT INTO `VoertuigInstructeur` (`Id`, `VoertuigId`, `InstructeurId`, `DatumToekenning`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 5, '2017-06-18', b'1', NULL, '2023-05-30 16:57:24.152496', '2023-05-30 16:57:24.152500'),
(2, 3, 1, '2021-09-26', b'1', NULL, '2023-05-30 16:57:24.185181', '2023-05-30 16:57:24.185187'),
(3, 9, 1, '2021-09-27', b'1', NULL, '2023-05-30 16:57:24.220997', '2023-05-30 16:57:24.221003'),
(4, 3, 4, '2022-08-01', b'1', NULL, '2023-05-30 16:57:24.258982', '2023-05-30 16:57:24.258987'),
(5, 5, 1, '2019-08-30', b'1', NULL, '2023-05-30 16:57:24.302184', '2023-05-30 16:57:24.302191'),
(6, 10, 5, '2020-02-02', b'1', NULL, '2023-05-30 16:57:24.347363', '2023-05-30 16:57:24.347369');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `Voertuig`
--
ALTER TABLE `Voertuig`
  ADD CONSTRAINT `voertuig_ibfk_1` FOREIGN KEY (`TypeVoertuigId`) REFERENCES `TypeVoertuig` (`Id`);

--
-- Beperkingen voor tabel `VoertuigInstructeur`
--
ALTER TABLE `VoertuigInstructeur`
  ADD CONSTRAINT `voertuiginstructeur_ibfk_1` FOREIGN KEY (`VoertuigId`) REFERENCES `Voertuig` (`Id`),
  ADD CONSTRAINT `voertuiginstructeur_ibfk_2` FOREIGN KEY (`InstructeurId`) REFERENCES `Instructeur` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
