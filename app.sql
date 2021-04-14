-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 13. Apr 2021 um 23:10
-- Server-Version: 5.7.30
-- PHP-Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Datenbank: `app`
--
CREATE DATABASE IF NOT EXISTS `app` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `app`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `file`
--

CREATE TABLE `file` (
  `id_file` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_folder` int(11) DEFAULT NULL,
  `file_name` varchar(50) NOT NULL,
  `type` enum('PDF','Video','Audio','Image') NOT NULL,
  `volum` varchar(20) NOT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `file`
--

INSERT INTO `file` (`id_file`, `id_user`, `id_folder`, `file_name`, `type`, `volum`, `uploaded_on`) VALUES
(2, 1, 2, 'Mietwagen', 'Image', '23 KB', '2021-04-13 22:31:21'),
(3, 1, 2, 'Museum ', 'Video', '23.5 MB', '2021-04-13 22:30:24'),
(4, 1, 2, 'Hotel', 'Video', '23 MB', '2021-04-13 22:30:27'),
(5, 1, NULL, 'Rechnung', 'PDF', '12 KB', '2021-04-13 22:32:06'),
(6, 1, 2, 'Konzert ', 'Audio', '13 MG', '2021-04-13 22:55:42');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `file_kw_com`
--

CREATE TABLE `file_kw_com` (
  `id_file_kw_com` int(11) NOT NULL,
  `id_file` int(11) NOT NULL,
  `keyword` varchar(20) DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `file_kw_com`
--

INSERT INTO `file_kw_com` (`id_file_kw_com`, `id_file`, `keyword`, `comment`) VALUES
(1, 2, 'Stadt ', 'Am ersten Tag des Urlaubs habe wir die Stadt Nice besucht '),
(2, 2, 'Paris ', 'Eifelturm ist schöner als ich dachte ');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `folder`
--

CREATE TABLE `folder` (
  `id_folder` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `folder_name` varchar(50) NOT NULL DEFAULT 'Neuer Ordner',
  `number_file` int(11) NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `folder`
--

INSERT INTO `folder` (`id_folder`, `id_user`, `folder_name`, `number_file`, `created_on`) VALUES
(2, 1, 'Urlaub', 0, '2021-04-13 22:31:02');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `folder_kw_com`
--

CREATE TABLE `folder_kw_com` (
  `id_folder_kw_com` int(11) NOT NULL,
  `id_folder` int(11) NOT NULL,
  `keyword` varchar(20) DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `e_mail` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_pic_url` varchar(500) DEFAULT NULL,
  `token` varchar(500) DEFAULT NULL,
  `registered_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id_user`, `e_mail`, `username`, `password`, `profile_pic_url`, `token`, `registered_on`) VALUES
(1, 'admin@hshl.de', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', NULL, NULL, '2021-04-05 00:16:49');

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
-- Indizes für die Tabelle `file_kw_com`
--
ALTER TABLE `file_kw_com`
  ADD PRIMARY KEY (`id_file_kw_com`),
  ADD KEY `id_file` (`id_file`);

--
-- Indizes für die Tabelle `folder`
--
ALTER TABLE `folder`
  ADD PRIMARY KEY (`id_folder`),
  ADD KEY `id_user` (`id_user`);

--
-- Indizes für die Tabelle `folder_kw_com`
--
ALTER TABLE `folder_kw_com`
  ADD PRIMARY KEY (`id_folder_kw_com`),
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
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `file_kw_com`
--
ALTER TABLE `file_kw_com`
  MODIFY `id_file_kw_com` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `folder`
--
ALTER TABLE `folder`
  MODIFY `id_folder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `folder_kw_com`
--
ALTER TABLE `folder_kw_com`
  MODIFY `id_folder_kw_com` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `file_ibfk_2` FOREIGN KEY (`id_folder`) REFERENCES `folder` (`id_folder`);

--
-- Constraints der Tabelle `file_kw_com`
--
ALTER TABLE `file_kw_com`
  ADD CONSTRAINT `file_kw_com_ibfk_1` FOREIGN KEY (`id_file`) REFERENCES `file` (`id_file`);

--
-- Constraints der Tabelle `folder`
--
ALTER TABLE `folder`
  ADD CONSTRAINT `folder_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints der Tabelle `folder_kw_com`
--
ALTER TABLE `folder_kw_com`
  ADD CONSTRAINT `folder_kw_com_ibfk_1` FOREIGN KEY (`id_folder`) REFERENCES `folder` (`id_folder`);