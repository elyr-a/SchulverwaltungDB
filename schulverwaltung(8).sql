-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2026 at 11:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schulverwaltung`
--
CREATE DATABASE IF NOT EXISTS `schulverwaltung` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `schulverwaltung`;

-- --------------------------------------------------------

--
-- Table structure for table `faecher`
--

CREATE TABLE `faecher` (
  `FachID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Kuerzel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faecher`
--

INSERT INTO `faecher` (`FachID`, `Name`, `Kuerzel`) VALUES
(1, 'Mathematik', 'Ma'),
(2, 'Deutsch', 'De'),
(3, 'Englisch', 'En'),
(4, 'Informatik', 'If'),
(5, 'Physik', 'Ph'),
(6, 'Geschichte', 'Ge'),
(7, 'Ethik', 'ET'),
(8, 'Bio', 'BI'),
(9, 'Spanisch', 'SPA'),
(10, 'Chinesisch', 'CH');

-- --------------------------------------------------------

--
-- Table structure for table `fehlzeiten`
--

CREATE TABLE `fehlzeiten` (
  `FehlzeitID` int(11) NOT NULL,
  `SchuelerID` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Stunden` int(11) NOT NULL DEFAULT 1 CHECK (`Stunden` > 0),
  `Entschuldigt` tinyint(1) NOT NULL DEFAULT 0,
  `Grund` varchar(200) DEFAULT NULL,
  `ErfasstVon` int(11) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fehlzeiten`
--

INSERT INTO `fehlzeiten` (`FehlzeitID`, `SchuelerID`, `Datum`, `Stunden`, `Entschuldigt`, `Grund`, `ErfasstVon`, `ErstelltAm`) VALUES
(3, 3, '2025-02-03', 3, 1, 'Krankheit', 3, '2026-05-30 11:10:35'),
(4, 4, '2025-02-07', 2, 0, NULL, 3, '2026-05-30 11:10:35'),
(7, 7, '2026-05-30', 1, 1, NULL, 1, '2026-05-30 11:27:27'),
(9, 5, '2025-02-07', 4, 1, 'asdsad', 1, '2026-06-07 20:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `klassen`
--

CREATE TABLE `klassen` (
  `KlasseID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Stufe` int(11) NOT NULL,
  `Schuljahr` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `klassen`
--

INSERT INTO `klassen` (`KlasseID`, `Name`, `Stufe`, `Schuljahr`) VALUES
(1, '10A', 10, '2024/25'),
(2, '10B', 13, '2024/25'),
(3, '11A', 11, '2024/25');

-- --------------------------------------------------------

--
-- Table structure for table `lehrer`
--

CREATE TABLE `lehrer` (
  `LehrerID` int(11) NOT NULL,
  `Vorname` varchar(50) NOT NULL,
  `Nachname` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Benutzername` varchar(50) NOT NULL,
  `PasswortHash` varchar(256) NOT NULL,
  `Rolle` enum('Lehrer','Admin') DEFAULT 'Lehrer',
  `ErstelltAm` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lehrer`
--

INSERT INTO `lehrer` (`LehrerID`, `Vorname`, `Nachname`, `Email`, `Benutzername`, `PasswortHash`, `Rolle`, `ErstelltAm`) VALUES
(1, 'Admin', 'System', 'admin@schule.de', 'admin', '155780ff1017466245c2c05bea90da45f4fa2b8c3b956b120d237db4fd0af0dc', 'Admin', '2026-05-30 11:10:35'),
(2, 'Maria', 'Müller', 'mueller@schule.de', 'mmueller', 'asd123', 'Lehrer', '2026-05-30 11:10:35'),
(3, 'Thomas', 'Schmidt', 'schmidt@schule.de', 'tschmidt', '44af6564ceb97f90038955f822f9a3582fd291854839a06b868625e82845297c', 'Lehrer', '2026-05-30 11:10:35'),
(4, 'xadsad', 'sadsadsa', '21321@schule.de', '21321', '091dc85ef3be1a259f148d75402df1cb799735f0973f697853c36ffe9dae38e2', 'Lehrer', '2026-06-04 22:33:53'),
(5, 'test', 'test', 'test@schule.de', '31', '5f70baed5beb653ee38b2f614e11ac1eef6afd7ed6c83cbb923362d1be149998', 'Lehrer', '2026-06-04 22:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `lehrer_fach`
--

CREATE TABLE `lehrer_fach` (
  `LehrerFachID` int(11) NOT NULL,
  `LehrerID` int(11) NOT NULL,
  `FachID` int(11) NOT NULL,
  `KlasseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lehrer_fach`
--

INSERT INTO `lehrer_fach` (`LehrerFachID`, `LehrerID`, `FachID`, `KlasseID`) VALUES
(1, 2, 1, 1),
(2, 2, 1, 2),
(3, 2, 2, 1),
(5, 3, 3, 3),
(4, 3, 4, 2),
(6, 3, 4, 3),
(8, 5, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `noten`
--

CREATE TABLE `noten` (
  `NotenID` int(11) NOT NULL,
  `SchuelerID` int(11) NOT NULL,
  `FachID` int(11) NOT NULL,
  `LehrerID` int(11) NOT NULL,
  `Note` decimal(3,1) NOT NULL CHECK (`Note` between 1.0 and 6.0),
  `Typ` enum('Klassenarbeit','Hausaufgabe','Muendlich','Test','Sonstige') NOT NULL DEFAULT 'Sonstige',
  `Gewichtung` decimal(3,2) NOT NULL DEFAULT 1.00,
  `Beschreibung` varchar(200) DEFAULT NULL,
  `Datum` date NOT NULL,
  `ErstelltAm` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `noten`
--

INSERT INTO `noten` (`NotenID`, `SchuelerID`, `FachID`, `LehrerID`, `Note`, `Typ`, `Gewichtung`, `Beschreibung`, `Datum`, `ErstelltAm`) VALUES
(4, 2, 1, 2, 4.0, 'Klassenarbeit', 2.00, 'Algebra Test', '2025-01-15', '2026-05-30 11:10:35'),
(5, 2, 1, 2, 3.5, 'Test', 1.00, 'Kurzer Test', '2025-02-12', '2026-05-30 11:10:35'),
(6, 3, 4, 3, 1.0, 'Klassenarbeit', 2.00, 'Programmierung', '2025-01-18', '2026-05-30 11:10:35'),
(7, 4, 4, 3, 2.5, 'Test', 1.00, 'Algorithmen', '2025-02-05', '2026-05-30 11:10:35'),
(8, 5, 3, 3, 2.0, 'Klassenarbeit', 2.00, 'Grammar Test', '2025-01-25', '2026-05-30 11:10:35'),
(9, 7, 2, 2, 2.0, 'Klassenarbeit', 1.00, 'test', '0000-00-00', '2026-05-31 18:21:40'),
(11, 5, 3, 1, 2.3, 'Muendlich', 0.30, 'xd', '2026-06-04', '2026-06-04 19:21:32'),
(13, 5, 3, 1, 5.0, 'Muendlich', 0.30, 'xd', '2026-06-04', '2026-06-04 19:21:48'),
(14, 5, 4, 1, 1.0, 'Sonstige', 1.00, 'adsf', '2026-06-04', '2026-06-04 19:23:48'),
(15, 5, 4, 1, 1.0, 'Hausaufgabe', 0.50, '', '2026-06-04', '2026-06-04 19:23:53'),
(16, 5, 4, 1, 3.3, 'Hausaufgabe', 0.50, '', '2026-06-04', '2026-06-04 19:23:58'),
(17, 5, 4, 1, 2.3, 'Hausaufgabe', 0.50, 'asdqwe', '2026-06-04', '2026-06-04 19:24:12'),
(18, 3, 1, 1, 2.0, 'Sonstige', 0.30, 'eafe', '2026-06-07', '2026-06-07 21:07:23'),
(19, 3, 1, 1, 1.0, 'Hausaufgabe', 1.00, 'dfg', '2026-06-07', '2026-06-07 21:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `schueler`
--

CREATE TABLE `schueler` (
  `SchuelerID` int(11) NOT NULL,
  `Vorname` varchar(50) NOT NULL,
  `Nachname` varchar(50) NOT NULL,
  `Geburtsdatum` date NOT NULL,
  `KlasseID` int(11) NOT NULL,
  `Benutzername` varchar(50) DEFAULT NULL,
  `PasswortHash` varchar(256) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schueler`
--

INSERT INTO `schueler` (`SchuelerID`, `Vorname`, `Nachname`, `Geburtsdatum`, `KlasseID`, `Benutzername`, `PasswortHash`, `ErstelltAm`) VALUES
(2, 'Ben', 'Wagner', '2008-07-22', 1, 'bwagner', 'f25aa8938cb22f6b588293e1d020e98d03e1aa6a8cb4b0fbc33e65f80b345d55', '2026-05-30 11:10:35'),
(3, 'Clara', 'Becker', '2007-11-05', 2, 'cbecker', 'ce304ba1b91a3318da344e4608d26ea62b15c7cfe75b312fc9e6d9394bd3b289', '2026-05-30 11:10:35'),
(4, 'David', 'Hoffmann', '2007-04-18', 2, 'dhoffmann', 'b872836758ccac6d6f00d1b0d0bde82c183327f2a92c9b513c866001f3d4f0bf', '2026-05-30 11:10:35'),
(5, 'Eva', 'Koch', '2006-09-30', 3, 'ekoch', 'fb530742d334a475679c736a295f384ac621e127c621ee5e6c7c0a250547b079', '2026-05-30 11:10:35'),
(7, 'test', 'test', '2026-05-31', 1, 'test', '5f70baed5beb653ee38b2f614e11ac1eef6afd7ed6c83cbb923362d1be149998', '2026-05-31 15:40:07'),
(8, 'test31', 'test31', '2026-06-04', 1, 'yeah', '292b54a1c4ddd02670dfa343cf881f6489ba2fc43528a1f63b1553d0daca0ebb', '2026-06-04 22:33:14');

-- --------------------------------------------------------

--
-- Table structure for table `stunden`
--

CREATE TABLE `stunden` (
  `StundeID` int(11) NOT NULL,
  `Bezeichnung` varchar(20) NOT NULL,
  `Beginn` time NOT NULL,
  `Ende` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stunden`
--

INSERT INTO `stunden` (`StundeID`, `Bezeichnung`, `Beginn`, `Ende`) VALUES
(1, '1. Stunde', '07:45:00', '08:30:00'),
(2, '2. Stunde', '08:30:00', '09:15:00'),
(3, 'Pause', '09:15:00', '09:30:00'),
(4, '3. Stunde', '09:30:00', '10:15:00'),
(5, '4. Stunde', '10:15:00', '11:00:00'),
(6, 'Pause', '11:00:00', '11:15:00'),
(7, '5. Stunde', '11:15:00', '12:00:00'),
(8, '6. Stunde', '12:00:00', '12:45:00'),
(9, 'Mittagspause', '12:45:00', '13:15:00'),
(10, '7. Stunde', '13:15:00', '14:00:00'),
(11, '8. Stunde', '14:00:00', '14:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `stundenplan`
--

CREATE TABLE `stundenplan` (
  `StundenplanID` int(11) NOT NULL,
  `LehrerFachID` int(11) NOT NULL,
  `StundeID` int(11) NOT NULL,
  `Wochentag` tinyint(4) NOT NULL CHECK (`Wochentag` between 1 and 5),
  `Raum` varchar(20) DEFAULT NULL,
  `GueltigVon` date NOT NULL DEFAULT curdate(),
  `GueltigBis` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stundenplan`
--

INSERT INTO `stundenplan` (`StundenplanID`, `LehrerFachID`, `StundeID`, `Wochentag`, `Raum`, `GueltigVon`, `GueltigBis`) VALUES
(7, 3, 2, 1, NULL, '2026-06-05', NULL),
(10, 5, 1, 3, NULL, '2026-06-05', NULL),
(11, 3, 1, 3, 'xycxy', '2026-06-05', NULL),
(12, 4, 1, 1, NULL, '2026-06-05', NULL),
(13, 2, 2, 1, NULL, '2026-06-05', NULL),
(14, 6, 2, 3, NULL, '2026-06-05', NULL),
(18, 8, 1, 2, 'asd', '2026-06-07', NULL),
(19, 3, 2, 4, NULL, '2026-06-07', NULL),
(20, 8, 1, 5, NULL, '2026-06-07', NULL),
(21, 3, 4, 1, NULL, '2026-06-07', NULL),
(22, 3, 1, 1, NULL, '2026-06-07', NULL),
(23, 3, 5, 1, '21321dsaf', '2026-06-07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unterrichtshistorie`
--

CREATE TABLE `unterrichtshistorie` (
  `HistorieID` int(11) NOT NULL,
  `StundenplanID` int(11) DEFAULT NULL,
  `KlasseID` int(11) NOT NULL,
  `FachID` int(11) NOT NULL,
  `LehrerID` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Thema` varchar(200) NOT NULL,
  `Inhalt` text DEFAULT NULL,
  `Hausaufgaben` varchar(300) DEFAULT NULL,
  `Seite` varchar(100) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unterrichtshistorie`
--

INSERT INTO `unterrichtshistorie` (`HistorieID`, `StundenplanID`, `KlasseID`, `FachID`, `LehrerID`, `Datum`, `Thema`, `Inhalt`, `Hausaufgaben`, `Seite`, `ErstelltAm`) VALUES
(3, NULL, 1, 4, 3, '2025-05-19', 'Algorithmen und Sortierverfahren', 'BubbleSort und SelectionSort vorgestellt. Live-Coding-Demo in Python. Schüler implementierten BubbleSort selbst.', 'SelectionSort in Python implementieren', 'Informatik Oberstufe S.88', '2026-05-30 11:10:47'),
(6, NULL, 1, 1, 1, '2026-06-07', 'sadsad', 'asdsa', 'asd', 'asdsad', '2026-06-07 21:15:28'),
(7, NULL, 1, 1, 1, '2026-06-07', 'test', 'test', 'test', 'test', '2026-06-07 21:15:34'),
(8, NULL, 3, 4, 1, '2026-06-07', 'test', '', '', '', '2026-06-07 21:15:37'),
(9, NULL, 3, 3, 1, '2026-06-07', 'sadsad', '', '', '', '2026-06-07 21:15:41'),
(10, NULL, 1, 1, 1, '2026-06-07', 'mathe', '', '', '', '2026-06-07 21:16:11'),
(11, NULL, 3, 4, 1, '2026-06-07', 'c#', '', '', '', '2026-06-07 21:16:15'),
(12, NULL, 3, 3, 1, '2026-06-07', 'eardfsasfas science and techonlogy', '', '', '', '2026-06-07 21:16:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faecher`
--
ALTER TABLE `faecher`
  ADD PRIMARY KEY (`FachID`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD UNIQUE KEY `Kuerzel` (`Kuerzel`);

--
-- Indexes for table `fehlzeiten`
--
ALTER TABLE `fehlzeiten`
  ADD PRIMARY KEY (`FehlzeitID`),
  ADD KEY `SchuelerID` (`SchuelerID`),
  ADD KEY `ErfasstVon` (`ErfasstVon`);

--
-- Indexes for table `klassen`
--
ALTER TABLE `klassen`
  ADD PRIMARY KEY (`KlasseID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `lehrer`
--
ALTER TABLE `lehrer`
  ADD PRIMARY KEY (`LehrerID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Benutzername` (`Benutzername`);

--
-- Indexes for table `lehrer_fach`
--
ALTER TABLE `lehrer_fach`
  ADD PRIMARY KEY (`LehrerFachID`),
  ADD UNIQUE KEY `uq_lehrer_fach_klasse` (`LehrerID`,`FachID`,`KlasseID`),
  ADD KEY `FachID` (`FachID`),
  ADD KEY `KlasseID` (`KlasseID`);

--
-- Indexes for table `noten`
--
ALTER TABLE `noten`
  ADD PRIMARY KEY (`NotenID`),
  ADD KEY `SchuelerID` (`SchuelerID`),
  ADD KEY `FachID` (`FachID`),
  ADD KEY `LehrerID` (`LehrerID`);

--
-- Indexes for table `schueler`
--
ALTER TABLE `schueler`
  ADD PRIMARY KEY (`SchuelerID`),
  ADD UNIQUE KEY `Benutzername` (`Benutzername`),
  ADD KEY `KlasseID` (`KlasseID`);

--
-- Indexes for table `stunden`
--
ALTER TABLE `stunden`
  ADD PRIMARY KEY (`StundeID`);

--
-- Indexes for table `stundenplan`
--
ALTER TABLE `stundenplan`
  ADD PRIMARY KEY (`StundenplanID`),
  ADD UNIQUE KEY `idx_class_slot` (`StundeID`,`Wochentag`,`LehrerFachID`),
  ADD KEY `fk_stundenplan_lehrer_faecher_new` (`LehrerFachID`);

--
-- Indexes for table `unterrichtshistorie`
--
ALTER TABLE `unterrichtshistorie`
  ADD PRIMARY KEY (`HistorieID`),
  ADD KEY `KlasseID` (`KlasseID`),
  ADD KEY `FachID` (`FachID`),
  ADD KEY `LehrerID` (`LehrerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faecher`
--
ALTER TABLE `faecher`
  MODIFY `FachID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fehlzeiten`
--
ALTER TABLE `fehlzeiten`
  MODIFY `FehlzeitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `klassen`
--
ALTER TABLE `klassen`
  MODIFY `KlasseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lehrer`
--
ALTER TABLE `lehrer`
  MODIFY `LehrerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lehrer_fach`
--
ALTER TABLE `lehrer_fach`
  MODIFY `LehrerFachID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `noten`
--
ALTER TABLE `noten`
  MODIFY `NotenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `schueler`
--
ALTER TABLE `schueler`
  MODIFY `SchuelerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stunden`
--
ALTER TABLE `stunden`
  MODIFY `StundeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stundenplan`
--
ALTER TABLE `stundenplan`
  MODIFY `StundenplanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `unterrichtshistorie`
--
ALTER TABLE `unterrichtshistorie`
  MODIFY `HistorieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fehlzeiten`
--
ALTER TABLE `fehlzeiten`
  ADD CONSTRAINT `fehlzeiten_ibfk_1` FOREIGN KEY (`SchuelerID`) REFERENCES `schueler` (`SchuelerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fehlzeiten_ibfk_2` FOREIGN KEY (`ErfasstVon`) REFERENCES `lehrer` (`LehrerID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `lehrer_fach`
--
ALTER TABLE `lehrer_fach`
  ADD CONSTRAINT `lehrer_fach_ibfk_1` FOREIGN KEY (`LehrerID`) REFERENCES `lehrer` (`LehrerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lehrer_fach_ibfk_2` FOREIGN KEY (`FachID`) REFERENCES `faecher` (`FachID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lehrer_fach_ibfk_3` FOREIGN KEY (`KlasseID`) REFERENCES `klassen` (`KlasseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `noten`
--
ALTER TABLE `noten`
  ADD CONSTRAINT `noten_ibfk_1` FOREIGN KEY (`SchuelerID`) REFERENCES `schueler` (`SchuelerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `noten_ibfk_2` FOREIGN KEY (`FachID`) REFERENCES `faecher` (`FachID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `noten_ibfk_3` FOREIGN KEY (`LehrerID`) REFERENCES `lehrer` (`LehrerID`) ON UPDATE CASCADE;

--
-- Constraints for table `schueler`
--
ALTER TABLE `schueler`
  ADD CONSTRAINT `schueler_ibfk_1` FOREIGN KEY (`KlasseID`) REFERENCES `klassen` (`KlasseID`) ON UPDATE CASCADE;

--
-- Constraints for table `stundenplan`
--
ALTER TABLE `stundenplan`
  ADD CONSTRAINT `fk_stundenplan_lehrer_faecher_new` FOREIGN KEY (`LehrerFachID`) REFERENCES `lehrer_fach` (`LehrerFachID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unterrichtshistorie`
--
ALTER TABLE `unterrichtshistorie`
  ADD CONSTRAINT `unterrichtshistorie_ibfk_1` FOREIGN KEY (`KlasseID`) REFERENCES `klassen` (`KlasseID`) ON DELETE CASCADE,
  ADD CONSTRAINT `unterrichtshistorie_ibfk_2` FOREIGN KEY (`FachID`) REFERENCES `faecher` (`FachID`) ON DELETE CASCADE,
  ADD CONSTRAINT `unterrichtshistorie_ibfk_3` FOREIGN KEY (`LehrerID`) REFERENCES `lehrer` (`LehrerID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
