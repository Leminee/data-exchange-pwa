-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 15. Apr 2021 um 02:51
-- Server-Version: 10.3.27-MariaDB-0+deb10u1
-- PHP-Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `pwa`
--
CREATE DATABASE IF NOT EXISTS `pwa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pwa`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `file`
--

CREATE TABLE `file` (
  `id_file` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_folder` int(11) DEFAULT NULL,
  `file_name` varchar(20) NOT NULL,
  `type` enum('pdf','video','Audio','image','zip','png','jpg') NOT NULL,
  `file_size` varchar(10) NOT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `file`
--

INSERT INTO `file` (`id_file`, `id_user`, `id_folder`, `file_name`, `type`, `file_size`, `uploaded_on`) VALUES
(1, 1, 1, 'Mietwagen', 'image', '23 KB', '2021-04-14 23:48:39'),
(2, 1, 1, 'Hotel', 'image', '25 KB', '2021-04-14 23:48:39'),
(3, 1, NULL, 'Rechnung', 'pdf', '13 KB', '2021-04-14 23:49:08');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `file_comment`
--

CREATE TABLE `file_comment` (
  `id_file_comment` int(11) NOT NULL,
  `id_file` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `file_comment`
--

INSERT INTO `file_comment` (`id_file_comment`, `id_file`, `comment`) VALUES
(1, 2, 'Ich war zufrieden ');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `file_keyword`
--

CREATE TABLE `file_keyword` (
  `id_file_keyword` int(11) NOT NULL,
  `id_file` int(11) NOT NULL,
  `keyword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `file_keyword`
--

INSERT INTO `file_keyword` (`id_file_keyword`, `id_file`, `keyword`) VALUES
(1, 1, 'BMW'),
(2, 1, 'SVG'),
(3, 2, 'B&B'),
(4, 2, 'Nähe Hauptbahnhof ');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `folder`
--

CREATE TABLE `folder` (
  `id_folder` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `folder_name` varchar(20) DEFAULT 'Neuer Ordner',
  `number_file` int(11) NOT NULL DEFAULT 0,
  `folder_size` varchar(10) NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `folder`
--

INSERT INTO `folder` (`id_folder`, `id_user`, `folder_name`, `number_file`, `folder_size`, `created_on`) VALUES
(1, 1, 'Urlaub', 2, '0', '2021-04-15 00:27:10'),
(2, 1, 'Neuer Ordner', 0, '0', '2021-04-14 23:47:20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `folder_comment`
--

CREATE TABLE `folder_comment` (
  `id_folder_comment` int(11) NOT NULL,
  `id_folder` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `folder_comment`
--

INSERT INTO `folder_comment` (`id_folder_comment`, `id_folder`, `comment`) VALUES
(1, 1, 'Enthält alle meine Bilder/Videos, die ich während meines Urlaubs in Paris gemacht habe ');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `folder_keyword`
--

CREATE TABLE `folder_keyword` (
  `id_folder_keyword` int(11) NOT NULL,
  `id_folder` int(11) NOT NULL,
  `keyword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `e_mail` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `token` longtext DEFAULT NULL,
  `registered_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id_user`, `e_mail`, `username`, `password_hash`, `token`, `registered_on`) VALUES
(1, 'admin@gmail.com', 'admin', 'admin', '', '2021-04-14 22:30:59');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id_file`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_folder` (`id_folder`);

--
-- Indizes für die Tabelle `file_comment`
--
ALTER TABLE `file_comment`
  ADD PRIMARY KEY (`id_file_comment`),
  ADD KEY `id_file` (`id_file`);

--
-- Indizes für die Tabelle `file_keyword`
--
ALTER TABLE `file_keyword`
  ADD PRIMARY KEY (`id_file_keyword`),
  ADD KEY `id_file` (`id_file`);

--
-- Indizes für die Tabelle `folder`
--
ALTER TABLE `folder`
  ADD PRIMARY KEY (`id_folder`),
  ADD KEY `id_user` (`id_user`);

--
-- Indizes für die Tabelle `folder_comment`
--
ALTER TABLE `folder_comment`
  ADD PRIMARY KEY (`id_folder_comment`),
  ADD KEY `id_folder` (`id_folder`);

--
-- Indizes für die Tabelle `folder_keyword`
--
ALTER TABLE `folder_keyword`
  ADD PRIMARY KEY (`id_folder_keyword`),
  ADD KEY `id_folder` (`id_folder`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `e_mail` (`e_mail`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `file`
--
ALTER TABLE `file`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `file_comment`
--
ALTER TABLE `file_comment`
  MODIFY `id_file_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `file_keyword`
--
ALTER TABLE `file_keyword`
  MODIFY `id_file_keyword` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `folder`
--
ALTER TABLE `folder`
  MODIFY `id_folder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `folder_comment`
--
ALTER TABLE `folder_comment`
  MODIFY `id_folder_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `folder_keyword`
--
ALTER TABLE `folder_keyword`
  MODIFY `id_folder_keyword` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`id_folder`) REFERENCES `folder` (`id_folder`),
  ADD CONSTRAINT `file_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints der Tabelle `file_comment`
--
ALTER TABLE `file_comment`
  ADD CONSTRAINT `file_comment_ibfk_1` FOREIGN KEY (`id_file`) REFERENCES `file` (`id_file`);

--
-- Constraints der Tabelle `file_keyword`
--
ALTER TABLE `file_keyword`
  ADD CONSTRAINT `file_keyword_ibfk_1` FOREIGN KEY (`id_file`) REFERENCES `file` (`id_file`);

--
-- Constraints der Tabelle `folder`
--
ALTER TABLE `folder`
  ADD CONSTRAINT `folder_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints der Tabelle `folder_comment`
--
ALTER TABLE `folder_comment`
  ADD CONSTRAINT `folder_comment_ibfk_1` FOREIGN KEY (`id_folder`) REFERENCES `folder` (`id_folder`);

--
-- Constraints der Tabelle `folder_keyword`
--
ALTER TABLE `folder_keyword`
  ADD CONSTRAINT `folder_keyword_ibfk_1` FOREIGN KEY (`id_folder`) REFERENCES `folder` (`id_folder`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;