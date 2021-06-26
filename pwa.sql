-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 26. Jun 2021 um 06:35
-- Server-Version: 10.1.38-MariaDB
-- PHP-Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
  `password_admin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `admin`
--

INSERT INTO `admin` (`id_admin`, `e_mail_admin`, `username_admin`, `password_admin`) VALUES
(1, 'admin@admin.de', 'admin', 'admin');

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
  `file_size` int(10) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `file`
--

INSERT INTO `file` (`id_file`, `id_user`, `id_folder`, `id_format`, `file_name`, `file_size`, `file_path`, `comment`, `uploaded_on`) VALUES
(4, 1, 3, 1, 'Mietwagen', 23, '', NULL, '2021-06-06 22:20:01'),
(5, 1, 3, 1, 'Hotel', 26, '', NULL, '2021-06-06 22:20:05'),
(6, 1, NULL, 4, 'Rechnung', 3, '', NULL, '2021-06-06 22:20:08'),
(7, 2, NULL, 3, 'undefined', 0, 'undefined', 'qwdqwdqwdqdqwd', '2021-06-26 04:07:16'),
(8, 40, NULL, 5, 'wefgwe.zip', 22, 'D:\\Projekt\\data-exchange-pwa\\server\\zip\\OUAIQGHEAUOGHAEUGHAEGUEHGe.txt', NULL, '2021-06-19 19:30:41'),
(9, 40, NULL, 6, 'testPNG.png', 1, 'D:\\Projekt\\data-exchange-pwa\\server\\zip\\OUAIQGHEAUOGHAEUGHAEGUEHGe.txt', 'Ist gar keine png lol', '2021-06-26 04:09:26'),
(10, 40, NULL, 5, 'Secret.zip', 3, 'D:\\Projekt\\data-exchange-pwa\\server\\3\\zip\\Secret.zip', 'tukutk', '2021-06-26 04:08:28');

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
(1, 'admin@gmail.com', 'admin', 'banana', NULL, NULL, '100', '2021-06-26 04:24:38'),
(2, 'test', 'testUsername', '', NULL, NULL, '100', '2021-06-26 04:24:38'),
(3, 'tzk@wrg.de', 'qwe', '', NULL, NULL, '100', '2021-06-26 04:24:38'),
(4, 'halloLemine@moin.de', 'OKAY', '$2b$10$w4PbwHgGx8Z/botBi3gCHuoIqvQnqcBULqfxNVQgbtDYLeNGMWRpW', NULL, NULL, '100', '2021-06-26 04:24:38'),
(5, '111', '111', '', NULL, NULL, '100', '2021-06-26 04:24:38'),
(6, '121', '121', '', NULL, NULL, '100', '2021-06-26 04:24:38'),
(7, 'manuel', 'ist', '', NULL, NULL, '100', '2021-06-26 04:24:38'),
(8, 'bitte@klapp.de', 'meee', '$2b$10$2SRhhWE3VvXCLDaAe3axo.O5u/MFSDp7QF5X8ngiPKmJywAyifbjK', NULL, NULL, '100', '2021-06-26 04:24:38'),
(9, 'test12@bitte.com', 'test12', '$2b$10$B2rK4zv3Mvi/X4XnDZ1XveAWpkov2UoSEBLlQDsZu4P.mlEg7Fdmi', NULL, NULL, '100', '2021-06-26 04:24:38'),
(10, 'test32@test.com', 'bitte', '$2b$10$ihrLiBgto4l.fM9I6OFcl.WZMS0QcSzu6OYWxzqOgCGG4XWNdS1yq', NULL, NULL, '100', '2021-06-26 04:24:38'),
(11, 'test50@bitte.com', 'goose', '$2b$10$plKKIPzNzTERk1PQBWYDgezdigHf3PZotyE3vw9.B7Q9xFU7b/UjG', NULL, NULL, '100', '2021-06-26 04:24:38'),
(12, 'test134@gmail.com', 'billy', '$2b$10$aXTm4LwFgMMk5zufm.ufU.Qq5wDrbSQnJARlVSxI29TFp7OPkzxPa', NULL, NULL, '100', '2021-06-26 04:24:38'),
(13, 'billy@gmail.com', 'billy2', '$2b$10$/4FdFD/CV9MS3fIWyqwIH.g0NZmeElchMM9NrwGSL7/1JD8QJ4q/y', NULL, NULL, '100', '2021-06-26 04:24:38'),
(14, 'billy12@gmail.com', 'billy3', '$2b$10$9BQW9Jrv5uj.7ocwiwvKdeI/XKc8ZhWitD3JSfXoWWjXg5ODdGej.', NULL, NULL, '100', '2021-06-26 04:24:38'),
(15, 'billy5@gmail.com', 'billy5', '$2b$10$iiIoVQUKDvqkUdHAah/9pusp988g168l/CDdsRA5cLGXygMK.r76W', NULL, NULL, '100', '2021-06-26 04:24:38'),
(16, 'billy6@gmail.com', 'billy6', '$2b$10$936bAs14sT9Ft6HQMko/Le.rYc.jTKCoFWj.4aJYGQIRpV6xbEJRK', NULL, NULL, '100', '2021-06-26 04:24:38'),
(17, 'billy7@gmail.com', 'billy7', '$2b$10$U31BaPO4j7/chTPJm8HfSecIvGdkg1d56iT7OAZgXKLDsn85naZKO', NULL, NULL, '100', '2021-06-26 04:24:38'),
(18, 'billy8@gmail.com', 'billy8', '123', NULL, NULL, '100', '2021-06-26 04:24:38'),
(19, 'billy10@gmail.com', 'billy10', '111', NULL, NULL, '100', '2021-06-26 04:24:38'),
(20, 'billy69@gmail.com', 'billy69', '$2b$10$RVPI/VZUbOMVpu15qDRth.6C9HRT8/p.OVcxm7RkAB87Gw.mrRDlS', NULL, NULL, '100', '2021-06-26 04:24:38'),
(21, 'billy50@gmail.com', 'billy50', '$2b$10$.clcYmg53iyKL0RdraC16eVW3qnNB6PK9xA81lA.RtIzFnB.Kb0BO', NULL, NULL, '100', '2021-06-26 04:24:38'),
(22, 'billy51@gmail.com', 'billy51', '$2b$10$4RzQh2/NJ2mI5L6CLf1pWe/aEzMTmgH0z6T3YvqM0bHVnqMty4Sz.', NULL, NULL, '100', '2021-06-26 04:24:38'),
(23, 'billy52@gmail.com', 'billy52', '$2b$10$hO0bgIK90XaTo99DC5zi.ebfg6z8TSOza5FvlpBq3j92VULQXojDi', NULL, NULL, '100', '2021-06-26 04:24:38'),
(24, 'billy53@gmail.com', 'billy53', '$2b$10$wXbZkpi2IbkG22sbp29Z2exMipbImbO.jRjV4e1PYOXKXe2x13pZy', NULL, NULL, '100', '2021-06-26 04:24:38'),
(26, 'billy22@gmail.com', 'billy22', '$2b$10$dX24Sg/n3ZE2D3x3W1hIT.LW26/JBquVp/JW0XqvOtxwDB3UhUKYW', NULL, NULL, '100', '2021-06-26 04:24:38'),
(27, 'billy24@gmail.com', 'billy24', '$2b$10$YkYWE8EYGx037mrN/G1G4OLFoRdvQQdNEH2ZuFt7.Lximph.sGfjS', NULL, NULL, '100', '2021-06-26 04:24:38'),
(28, 'billy25@gmail.com', 'billy25', '$2b$10$1H77Fi8C5kqpGJ2JL7DmN.5YnbkRo5NG2PCYEcEh1xyK8BQ7pmHDe', NULL, NULL, '100', '2021-06-26 04:24:38'),
(30, 'gr@f', 'weg', '$2b$10$l5/jjGqn5BfWfHvh6zjVquVIqpw1Twvgua5ImX0kp76opPA66fm3G', NULL, NULL, '100', '2021-06-26 04:24:38'),
(31, 'Andre@gmail.com', 'Andre', '$2b$10$ktWC1stnLoMmm5.OGvVcG.OWXw85ukBFXckLO2fwLeeEPtajlIJre', NULL, NULL, '100', '2021-06-26 04:24:38'),
(32, 'Lemine@bla.com', 'Lemineeeee', '$2b$10$zJmH/MT5UFosZ0uT0H6mB.GRo6R9lGnNM49QKWXtQ0uLdbqUiX8Fy', NULL, NULL, '100', '2021-06-26 04:24:38'),
(33, 'ergh@trzj', 'erg', '$2b$10$DkWCHOBwU2bTuJ714RPFAuTnVnAY8rAzTFQ283re.2crQbP2i1nKq', NULL, NULL, '100', '2021-06-26 04:24:38'),
(34, 'billy99@gmail', 'billy99', '$2b$10$d7HTJIP9G77cPeWQpq6aR.Eo7hNRF8vkBd1c5AFIoLFxforfZkxE2', NULL, NULL, '100', '2021-06-26 04:24:38'),
(35, 'undefined', 'undefined', '$2b$10$bWM1yh7SDKkUP1nm8DdbV.WXnL4zkAawhLE.y7/Dlc/loM9oTabnG', NULL, NULL, '100', '2021-06-26 04:24:38'),
(36, '46h64h', '345zg35z5u ', '$2b$10$S8ezr0iOa8bsNiATllX4weyE8QNZ4jr5fw6j6eBkRHGYGhRFaQ0Ri', NULL, NULL, '100', '2021-06-26 04:24:38'),
(37, 'ertr@gmail.com', 'rth', '$2b$10$mcbE7TO4RfwIAXVmTgG07uBELPSv0t1M0nN8jI7MLxZgxcTqfrRWq', NULL, NULL, '100', '2021-06-26 04:24:38'),
(38, 'wrg@rtjh', 'eth', '$2b$10$bQN/uvy01yLbdy6a62M3meqBUUqNU/8xJvbHD1DARBukWd/MCEVUu', NULL, NULL, '100', '2021-06-26 04:24:38'),
(39, 'a@a.de', 'a', '$2b$10$tOXW6UMKnVfIgEoV359E3OudZQZUgBn3ZqjiDQEnIfiDruxyC.uSC', NULL, NULL, '100', '2021-06-26 04:24:38'),
(40, 'q@q.de', 'q', '$2b$10$4hZLFKnvZrFS8Aze1eGacu2i7x9TXGaXqC4tE0IQEj6ypV4gG262i', NULL, NULL, '100', '2021-06-26 04:24:38'),
(41, 'fwb83625@eoopy.com', 'forgot', '$2b$10$Hjwg7hlobMU7wvPCTOtNLuiNcIibph6X.fgk9v7mOOKXayDOCO65S', NULL, NULL, '100', '2021-06-26 04:24:38'),
(42, 'eae52711@cuoly.com', '3523t', '$2b$10$/xKQdUhaBd4YZEWMbIBDH.KRAvH2UsN493lbNLtPQWKi8kOkVxE6C', NULL, NULL, '100', '2021-06-26 04:24:38'),
(43, 'vir66398@eoopy.com', '1121112', '$2b$10$8gymyKS4he/NGA5DfgwJ2ujnvxnY5w06eKpVG5NNIQx0XHCO4hGxa', NULL, NULL, '100', '2021-06-26 04:24:38'),
(44, 'enb91289@cuoly.com', 'Cey', '$2b$10$OYyYCtlHz4tAcVgL3tE4te7uRAQE/asCNahPH6SEQgSoUok5vTbp.', NULL, NULL, '100', '2021-06-26 04:24:38');

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
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `file`
--
ALTER TABLE `file`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
