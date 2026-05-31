-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2026 at 08:46 PM
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
(6, 'Geschichte', 'Ge');

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
(7, 3, '2026-05-30', 1, 1, NULL, 1, '2026-05-30 11:27:27');

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
(2, 'Maria', 'Müller', 'mueller@schule.de', 'mmueller', '43f9526d2d6bcb5334683fd65500ffb6093f3ed7dbecaade46f49bc7383d8071', 'Lehrer', '2026-05-30 11:10:35'),
(3, 'Thomas', 'Schmidt', 'schmidt@schule.de', 'tschmidt', '44af6564ceb97f90038955f822f9a3582fd291854839a06b868625e82845297c', 'Lehrer', '2026-05-30 11:10:35');

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
(6, 3, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `nachrichten`
--

CREATE TABLE `nachrichten` (
  `NachrichtID` int(11) NOT NULL,
  `SenderTyp` enum('Lehrer','Schueler') NOT NULL,
  `SenderID` int(11) NOT NULL,
  `EmpfaengerTyp` enum('Lehrer','Schueler','Klasse','Alle') NOT NULL,
  `EmpfaengerID` int(11) DEFAULT NULL,
  `Betreff` varchar(200) NOT NULL,
  `Inhalt` text NOT NULL,
  `Gelesen` tinyint(1) NOT NULL DEFAULT 0,
  `GelesenAm` datetime DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT current_timestamp(),
  `GeloeschtVonSender` tinyint(1) DEFAULT 0,
  `GeloeschtVonEmpf` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nachrichten`
--

INSERT INTO `nachrichten` (`NachrichtID`, `SenderTyp`, `SenderID`, `EmpfaengerTyp`, `EmpfaengerID`, `Betreff`, `Inhalt`, `Gelesen`, `GelesenAm`, `ErstelltAm`, `GeloeschtVonSender`, `GeloeschtVonEmpf`) VALUES
(1, 'Lehrer', 2, 'Klasse', 1, 'Hausaufgaben Kontrolle Freitag', 'Liebe 10A,\n\nbitte bringt am Freitag eure Hausaufgaben (S.47 Nr.3-7) vollständig mit. Es wird eine Stichprobe durchgeführt.\n\nViele Grüße\nFrau Müller', 0, NULL, '2026-05-30 11:10:47', 0, 0),
(2, 'Lehrer', 2, 'Schueler', 2, 'Nachschreibtermin', 'Hallo Ben,\n\ndu hast den letzten Mathe-Test verpasst. Bitte komme am Montag nach der 6. Stunde zu mir ins Lehrerzimmer zum Nachschreiben.\n\nFreundliche Grüße\nFrau Müller', 0, NULL, '2026-05-30 11:10:47', 0, 0),
(3, 'Lehrer', 1, 'Alle', NULL, 'Elternabend 10. Juni', 'Sehr geehrte Lehrerinnen und Lehrer,\n\nbitte merkt den 10. Juni um 19:00 Uhr für den Elternabend vor. Ort: Aula.\n\nAdmin', 1, '2026-05-30 11:30:06', '2026-05-30 11:10:47', 0, 0),
(4, 'Schueler', 1, 'Lehrer', 2, 'Frage zu Hausaufgaben', 'Hallo Frau Müller,\n\nbei Aufgabe 5 auf S.47 bin ich nicht sicher, ob ich den richtigen Ansatz habe. Darf ich morgen kurz vorbeikommen?\n\nViele Grüße\nAnna Fischer', 1, '2026-05-30 11:30:06', '2026-05-30 11:10:47', 0, 0);

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
(9, 7, 2, 2, 2.0, 'Klassenarbeit', 1.00, 'test', '0000-00-00', '2026-05-31 18:21:40');

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
(7, 'test', 'test', '2026-05-31', 1, 'test', '5f70baed5beb653ee38b2f614e11ac1eef6afd7ed6c83cbb923362d1be149998', '2026-05-31 15:40:07');

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
  `KlasseID` int(11) NOT NULL,
  `FachID` int(11) NOT NULL,
  `LehrerID` int(11) NOT NULL,
  `StundeID` int(11) NOT NULL,
  `Wochentag` tinyint(4) NOT NULL CHECK (`Wochentag` between 1 and 5),
  `Raum` varchar(20) DEFAULT NULL,
  `GueltigVon` date NOT NULL DEFAULT curdate(),
  `GueltigBis` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stundenplan`
--

INSERT INTO `stundenplan` (`StundenplanID`, `KlasseID`, `FachID`, `LehrerID`, `StundeID`, `Wochentag`, `Raum`, `GueltigVon`, `GueltigBis`) VALUES
(1, 1, 1, 2, 1, 1, 'A101', '2025-01-01', NULL),
(2, 1, 2, 2, 2, 1, 'A101', '2025-01-01', NULL),
(3, 1, 4, 3, 4, 1, 'B201', '2025-01-01', NULL),
(4, 1, 1, 2, 1, 2, 'A101', '2025-01-01', NULL),
(5, 1, 3, 3, 2, 2, 'A102', '2025-01-01', NULL),
(6, 1, 5, 2, 4, 2, 'A101', '2025-01-01', NULL),
(7, 1, 6, 2, 1, 3, 'A101', '2025-01-01', NULL),
(8, 1, 2, 2, 2, 3, 'A101', '2025-01-01', NULL),
(9, 1, 4, 3, 4, 4, 'B201', '2025-01-01', NULL),
(10, 1, 1, 2, 5, 4, 'A101', '2025-01-01', NULL),
(11, 1, 3, 3, 1, 5, 'A102', '2025-01-01', NULL),
(12, 1, 6, 2, 2, 5, 'A101', '2025-01-01', NULL);

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
  `StundeID` int(11) DEFAULT NULL,
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

INSERT INTO `unterrichtshistorie` (`HistorieID`, `StundenplanID`, `KlasseID`, `FachID`, `LehrerID`, `StundeID`, `Datum`, `Thema`, `Inhalt`, `Hausaufgaben`, `Seite`, `ErstelltAm`) VALUES
(1, NULL, 1, 1, 2, 1, '2025-05-19', 'Quadratische Gleichungen', 'Einführung in die allgemeine Lösungsformel (abc-Formel / Mitternachtsformel). Anwendung an 3 Beispielaufgaben. Schüler lösten Aufgaben in Partnerarbeit.', 'Aufgabenheft S.47, Nr. 3-7', 'Mathe Plus Bd.2 S.45–47', '2026-05-30 11:10:47'),
(2, NULL, 1, 2, 2, 2, '2025-05-19', 'Erörterung: Klimawandel', 'Aufbau einer Erörterung wiederholt. These, Argument, Beispiel, Fazit. Schüler schreiben Gliederung.', 'Gliederung fertigstellen', 'Deutschbuch S.122', '2026-05-30 11:10:47'),
(3, NULL, 1, 4, 3, 4, '2025-05-19', 'Algorithmen und Sortierverfahren', 'BubbleSort und SelectionSort vorgestellt. Live-Coding-Demo in Python. Schüler implementierten BubbleSort selbst.', 'SelectionSort in Python implementieren', 'Informatik Oberstufe S.88', '2026-05-30 11:10:47'),
(4, NULL, 1, 1, 2, 1, '2025-05-20', 'Quadratische Gleichungen – Vertiefung', 'Lösungsdiskussion: keine, eine oder zwei Lösungen (Diskriminante). Gruppenarbeit mit 5 Aufgaben.', 'Aufgabenheft S.49, Nr. 1-4', 'Mathe Plus Bd.2 S.48', '2026-05-30 11:10:47');

-- --------------------------------------------------------

--
-- Table structure for table `vertretungsplan`
--

CREATE TABLE `vertretungsplan` (
  `VertretungID` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `StundenplanID` int(11) DEFAULT NULL,
  `KlasseID` int(11) NOT NULL,
  `FachID` int(11) DEFAULT NULL,
  `OrigLehrerID` int(11) DEFAULT NULL,
  `VertLehrerID` int(11) DEFAULT NULL,
  `StundeID` int(11) NOT NULL,
  `Raum` varchar(20) DEFAULT NULL,
  `Typ` enum('Vertretung','Ausfall','Raumänderung','Sondereinsatz') NOT NULL DEFAULT 'Vertretung',
  `Notiz` varchar(300) DEFAULT NULL,
  `ErstelltVon` int(11) DEFAULT NULL,
  `ErstelltAm` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vertretungsplan`
--

INSERT INTO `vertretungsplan` (`VertretungID`, `Datum`, `StundenplanID`, `KlasseID`, `FachID`, `OrigLehrerID`, `VertLehrerID`, `StundeID`, `Raum`, `Typ`, `Notiz`, `ErstelltVon`, `ErstelltAm`) VALUES
(1, '2025-05-22', NULL, 1, 1, 2, 3, 1, 'A101', 'Vertretung', 'Frau Müller krank – Herr Schmidt übernimmt', 1, '2026-05-30 11:10:47'),
(2, '2025-05-22', NULL, 2, 4, 3, NULL, 4, NULL, 'Ausfall', 'Informatik fällt aus – Herr Schmidt im Fortbildung', 1, '2026-05-30 11:10:47'),
(3, '2025-05-23', NULL, 1, 2, 2, 3, 2, 'B205', 'Raumänderung', 'Raum A101 gesperrt – Ausweichraum B205', 1, '2026-05-30 11:10:47'),
(4, '2026-06-10', 1, 1, 1, 2, 3, 1, NULL, 'Ausfall', 'Teacher is sick Woooohoooo', 1, '2026-05-31 20:42:16');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_fehlzeiten_uebersicht`
-- (See below for the actual view)
--
CREATE TABLE `vw_fehlzeiten_uebersicht` (
`SchuelerID` int(11)
,`Schueler` varchar(101)
,`Klasse` varchar(20)
,`GesamtStunden` decimal(32,0)
,`Entschuldigt` decimal(32,0)
,`Unentschuldigt` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_notendurchschnitt`
-- (See below for the actual view)
--
CREATE TABLE `vw_notendurchschnitt` (
`SchuelerID` int(11)
,`Schueler` varchar(101)
,`Klasse` varchar(20)
,`Fach` varchar(100)
,`Durchschnitt` decimal(30,2)
,`AnzahlNoten` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_fehlzeiten_uebersicht`
--
DROP TABLE IF EXISTS `vw_fehlzeiten_uebersicht`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_fehlzeiten_uebersicht`  AS SELECT `s`.`SchuelerID` AS `SchuelerID`, concat(`s`.`Vorname`,' ',`s`.`Nachname`) AS `Schueler`, `k`.`Name` AS `Klasse`, sum(`fz`.`Stunden`) AS `GesamtStunden`, sum(case when `fz`.`Entschuldigt` = 1 then `fz`.`Stunden` else 0 end) AS `Entschuldigt`, sum(case when `fz`.`Entschuldigt` = 0 then `fz`.`Stunden` else 0 end) AS `Unentschuldigt` FROM ((`fehlzeiten` `fz` join `schueler` `s` on(`fz`.`SchuelerID` = `s`.`SchuelerID`)) join `klassen` `k` on(`s`.`KlasseID` = `k`.`KlasseID`)) GROUP BY `s`.`SchuelerID` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_notendurchschnitt`
--
DROP TABLE IF EXISTS `vw_notendurchschnitt`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_notendurchschnitt`  AS SELECT `s`.`SchuelerID` AS `SchuelerID`, concat(`s`.`Vorname`,' ',`s`.`Nachname`) AS `Schueler`, `k`.`Name` AS `Klasse`, `f`.`Name` AS `Fach`, round(sum(`n`.`Note` * `n`.`Gewichtung`) / sum(`n`.`Gewichtung`),2) AS `Durchschnitt`, count(`n`.`NotenID`) AS `AnzahlNoten` FROM (((`noten` `n` join `schueler` `s` on(`n`.`SchuelerID` = `s`.`SchuelerID`)) join `klassen` `k` on(`s`.`KlasseID` = `k`.`KlasseID`)) join `faecher` `f` on(`n`.`FachID` = `f`.`FachID`)) GROUP BY `s`.`SchuelerID`, `f`.`FachID` ;

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
-- Indexes for table `nachrichten`
--
ALTER TABLE `nachrichten`
  ADD PRIMARY KEY (`NachrichtID`);

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
  ADD UNIQUE KEY `uq_plan` (`KlasseID`,`StundeID`,`Wochentag`,`GueltigVon`),
  ADD KEY `FachID` (`FachID`),
  ADD KEY `LehrerID` (`LehrerID`),
  ADD KEY `StundeID` (`StundeID`);

--
-- Indexes for table `unterrichtshistorie`
--
ALTER TABLE `unterrichtshistorie`
  ADD PRIMARY KEY (`HistorieID`),
  ADD KEY `KlasseID` (`KlasseID`),
  ADD KEY `FachID` (`FachID`),
  ADD KEY `LehrerID` (`LehrerID`),
  ADD KEY `StundeID` (`StundeID`);

--
-- Indexes for table `vertretungsplan`
--
ALTER TABLE `vertretungsplan`
  ADD PRIMARY KEY (`VertretungID`),
  ADD KEY `KlasseID` (`KlasseID`),
  ADD KEY `FachID` (`FachID`),
  ADD KEY `OrigLehrerID` (`OrigLehrerID`),
  ADD KEY `VertLehrerID` (`VertLehrerID`),
  ADD KEY `StundeID` (`StundeID`),
  ADD KEY `ErstelltVon` (`ErstelltVon`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faecher`
--
ALTER TABLE `faecher`
  MODIFY `FachID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fehlzeiten`
--
ALTER TABLE `fehlzeiten`
  MODIFY `FehlzeitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `klassen`
--
ALTER TABLE `klassen`
  MODIFY `KlasseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lehrer`
--
ALTER TABLE `lehrer`
  MODIFY `LehrerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lehrer_fach`
--
ALTER TABLE `lehrer_fach`
  MODIFY `LehrerFachID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nachrichten`
--
ALTER TABLE `nachrichten`
  MODIFY `NachrichtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `noten`
--
ALTER TABLE `noten`
  MODIFY `NotenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `schueler`
--
ALTER TABLE `schueler`
  MODIFY `SchuelerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stunden`
--
ALTER TABLE `stunden`
  MODIFY `StundeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stundenplan`
--
ALTER TABLE `stundenplan`
  MODIFY `StundenplanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `unterrichtshistorie`
--
ALTER TABLE `unterrichtshistorie`
  MODIFY `HistorieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vertretungsplan`
--
ALTER TABLE `vertretungsplan`
  MODIFY `VertretungID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `stundenplan_ibfk_1` FOREIGN KEY (`KlasseID`) REFERENCES `klassen` (`KlasseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stundenplan_ibfk_2` FOREIGN KEY (`FachID`) REFERENCES `faecher` (`FachID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stundenplan_ibfk_3` FOREIGN KEY (`LehrerID`) REFERENCES `lehrer` (`LehrerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stundenplan_ibfk_4` FOREIGN KEY (`StundeID`) REFERENCES `stunden` (`StundeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unterrichtshistorie`
--
ALTER TABLE `unterrichtshistorie`
  ADD CONSTRAINT `unterrichtshistorie_ibfk_1` FOREIGN KEY (`KlasseID`) REFERENCES `klassen` (`KlasseID`) ON DELETE CASCADE,
  ADD CONSTRAINT `unterrichtshistorie_ibfk_2` FOREIGN KEY (`FachID`) REFERENCES `faecher` (`FachID`) ON DELETE CASCADE,
  ADD CONSTRAINT `unterrichtshistorie_ibfk_3` FOREIGN KEY (`LehrerID`) REFERENCES `lehrer` (`LehrerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `unterrichtshistorie_ibfk_4` FOREIGN KEY (`StundeID`) REFERENCES `stunden` (`StundeID`) ON DELETE SET NULL;

--
-- Constraints for table `vertretungsplan`
--
ALTER TABLE `vertretungsplan`
  ADD CONSTRAINT `vertretungsplan_ibfk_1` FOREIGN KEY (`KlasseID`) REFERENCES `klassen` (`KlasseID`) ON DELETE CASCADE,
  ADD CONSTRAINT `vertretungsplan_ibfk_2` FOREIGN KEY (`FachID`) REFERENCES `faecher` (`FachID`) ON DELETE SET NULL,
  ADD CONSTRAINT `vertretungsplan_ibfk_3` FOREIGN KEY (`OrigLehrerID`) REFERENCES `lehrer` (`LehrerID`) ON DELETE SET NULL,
  ADD CONSTRAINT `vertretungsplan_ibfk_4` FOREIGN KEY (`VertLehrerID`) REFERENCES `lehrer` (`LehrerID`) ON DELETE SET NULL,
  ADD CONSTRAINT `vertretungsplan_ibfk_5` FOREIGN KEY (`StundeID`) REFERENCES `stunden` (`StundeID`) ON DELETE CASCADE,
  ADD CONSTRAINT `vertretungsplan_ibfk_6` FOREIGN KEY (`ErstelltVon`) REFERENCES `lehrer` (`LehrerID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
