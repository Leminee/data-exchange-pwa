-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 27. Jun 2021 um 20:49
-- Server-Version: 5.7.30
-- PHP-Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `pwa`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `e_mail_admin` varchar(50) NOT NULL,
  `username_admin` varchar(20) NOT NULL,
  `password_hash_admin` varchar(100) NOT NULL,
  `profil_pic_url_admin` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `file`
--

CREATE TABLE `file` (
  `id_file` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_folder` int(11) DEFAULT NULL,
  `id_format` int(11) NOT NULL,
  `file_name` varchar(20) NOT NULL,
  `comment` text,
  `file_size` int(10) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `file`
--

INSERT INTO `file` (`id_file`, `id_user`, `id_folder`, `id_format`, `file_name`, `comment`, `file_size`, `file_path`, `uploaded_on`) VALUES
(4, 1, 3, 1, 'Mietwagen', NULL, 23, '', '2021-06-06 22:20:01'),
(5, 1, 3, 1, 'Hotel', NULL, 26, '', '2021-06-06 22:20:05'),
(6, 1, NULL, 4, 'Rechnung', NULL, 3, '', '2021-06-06 22:20:08'),
(8, 1, 4, 3, 'test', NULL, 98, '', '2021-06-15 21:09:59'),
(9, 1, 3, 1, 'hbnb', NULL, 67, '', '2021-06-15 22:19:47');

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
(2, 4, 'Schönes Auto');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `file_format`
--

CREATE TABLE `file_format` (
  `id_format` int(11) NOT NULL,
  `format` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `file_format`
--

INSERT INTO `file_format` (`id_format`, `format`) VALUES
(1, 'image'),
(2, 'video'),
(3, 'audio'),
(4, 'pdf'),
(5, 'zip'),
(6, 'png'),
(7, 'jpg');

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
(5, 4, 'BMW'),
(6, 4, 'Auto'),
(7, 5, 'B&B'),
(8, 5, 'Nähe Hauptbahnhof');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `folder`
--

CREATE TABLE `folder` (
  `id_folder` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `folder_name` varchar(20) DEFAULT 'Neuer Ordner',
  `number_file` int(11) NOT NULL DEFAULT '0',
  `folder_size` int(11) NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `folder`
--

INSERT INTO `folder` (`id_folder`, `id_user`, `folder_name`, `number_file`, `folder_size`, `created_on`) VALUES
(3, 1, 'Urlaub', 2, 49, '2021-06-06 22:20:14'),
(4, 1, 'Neuer Ordner', 0, 0, '2021-04-15 04:33:06');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `folder_comment`
--

CREATE TABLE `folder_comment` (
  `id_folder_comment` int(11) NOT NULL,
  `id_folder` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `profil_pic_path` varchar(100) DEFAULT NULL,
  `token` longtext,
  `upload_limit` varchar(10) DEFAULT NULL,
  `registered_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id_user`, `e_mail`, `username`, `password_hash`, `profil_pic_path`, `token`, `upload_limit`, `registered_on`) VALUES
(1, 'admin@gmail.com', 'admin', '', NULL, NULL, '20', '2021-06-13 00:13:02');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indizes für die Tabelle `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id_file`),
  ADD UNIQUE KEY `file_name` (`file_name`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_folder` (`id_folder`),
  ADD KEY `id_file_format` (`id_format`);

--
-- Indizes für die Tabelle `file_comment`
--
ALTER TABLE `file_comment`
  ADD PRIMARY KEY (`id_file_comment`),
  ADD KEY `id_file` (`id_file`);

--
-- Indizes für die Tabelle `file_format`
--
ALTER TABLE `file_format`
  ADD PRIMARY KEY (`id_format`);

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
  ADD UNIQUE KEY `folder_name` (`folder_name`),
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
-- AUTO_INCREMENT für Tabelle `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `file`
--
ALTER TABLE `file`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `file_comment`
--
ALTER TABLE `file_comment`
  MODIFY `id_file_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `file_format`
--
ALTER TABLE `file_format`
  MODIFY `id_format` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `file_keyword`
--
ALTER TABLE `file_keyword`
  MODIFY `id_file_keyword` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `folder`
--
ALTER TABLE `folder`
  MODIFY `id_folder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `folder_comment`
--
ALTER TABLE `folder_comment`
  MODIFY `id_folder_comment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `folder_keyword`
--
ALTER TABLE `folder_keyword`
  MODIFY `id_folder_keyword` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`id_folder`) REFERENCES `folder` (`id_folder`),
  ADD CONSTRAINT `file_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `file_ibfk_3` FOREIGN KEY (`id_format`) REFERENCES `file_format` (`id_format`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
