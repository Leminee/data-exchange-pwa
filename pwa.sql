-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 28. Jun 2021 um 21:02
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
  `password_hash_admin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `admin`
--

INSERT INTO `admin` (`id_admin`, `e_mail_admin`, `username_admin`, `password_hash_admin`) VALUES
(1, 'admin@gmail.com', 'admin', '36177436');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `file`
--

CREATE TABLE `file` (
  `id_file` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_folder` int(11) DEFAULT NULL,
  `format` varchar(50) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `comment` text,
  `file_size` double NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `file`
--

INSERT INTO `file` (`id_file`, `id_user`, `id_folder`, `format`, `file_name`, `comment`, `file_size`, `file_path`, `uploaded_on`) VALUES
(6, 1, NULL, '4', 'Rechnung', NULL, 3, '', '2021-06-06 22:20:08'),
(9, 1, 3, '1', 'hbnb', NULL, 67, '', '2021-06-15 22:19:47'),
(15, 1, 4, '5', 'testztgb', NULL, 33, 'dsdsggdgdsdg', '2021-06-28 04:36:31'),
(16, 144, 4, 'png', 'Bildschirmfoto 2021-06-27 um 23.36.32.png', NULL, 278553, '5', '2021-06-28 04:56:02'),
(17, 144, NULL, 'png', 'Bildschirmfoto 2021-06-28 um 04.30.03.png', NULL, 125809, '5', '2021-06-28 05:02:17'),
(18, 152, NULL, 'png', 'Bildschirmfoto 2021-06-28 um 01.21.51.png', NULL, 37583, 'null', '2021-06-28 05:22:54'),
(20, 154, NULL, 'png', 'jh.png', NULL, 263056, 'null', '2021-06-28 05:25:44'),
(21, 154, NULL, 'ation/pdf', 'FlipCoin-ID SW-Entwurf.pdf', NULL, 512474, 'null', '2021-06-28 05:28:01'),
(22, 155, NULL, 'peg', 'My unnamed Clip.mp3', NULL, 16196, 'null', '2021-06-28 05:32:23'),
(23, 155, NULL, 'pdf', 'BT_-_flip_coin_Eventstorming.pdf', NULL, 153407, 'null', '2021-06-28 05:33:00'),
(24, 157, NULL, 'eet', 'Daten_Zusammenhangshypothese.xlsx', NULL, 9006, 'null', '2021-06-28 05:38:54'),
(25, 167, NULL, '', 'sdgsgddsgg', 'sgdssgd', 453446, 'dsggdgdgsd', '2021-06-28 06:41:19'),
(26, 168, NULL, 'eet', 'Daten_Zusammenhangshypothese.xlsx', NULL, 9006, 'null', '2021-06-28 06:44:21'),
(27, 169, NULL, 'eet', 'Daten_Zusammenhangshypothese.xlsx', NULL, 9006, 'null', '2021-06-28 06:46:04'),
(28, 170, NULL, 'eet', 'Daten_Zusammenhangshypothese.xlsx', NULL, 9006, 'null', '2021-06-28 06:47:51'),
(29, 171, NULL, 'pdf', 'FlipCoin-ID SW-Entwurf.pdf', NULL, 512474, 'null', '2021-06-28 06:49:21'),
(30, 172, 3, 'gff', 'fwwege', 'eweewg', 45543, 'fs', '2021-06-28 06:50:43'),
(31, 172, NULL, 'peg', 'My unnamed Clip.mp3', NULL, 16196, 'null', '2021-06-28 06:50:53'),
(32, 173, NULL, 'eet', 'Daten_Zusammenhangshypothese.xlsx', NULL, 9006, 'null', '2021-06-28 06:51:53'),
(33, 172, NULL, 'pdf', 'FlipCoin-ID SW-Entwurf.pdf', NULL, 512474, 'null', '2021-06-28 06:53:11'),
(34, 179, NULL, 'pdf', 'FlipCoin-ID SW-Entwurf.pdf', NULL, 512474, 'null', '2021-06-28 07:35:59'),
(35, 179, NULL, 'pdf', 'FlipCoin-ID SW-Entwurf.pdf', NULL, 512474, 'null', '2021-06-28 07:38:02'),
(36, 183, NULL, 'eet', 'Daten_Unterschiedshypothese.xlsx', NULL, 9417, 'null', '2021-06-28 07:44:25'),
(37, 183, NULL, 'pdf', 'pwa.pdf', NULL, 133308, 'null', '2021-06-28 07:45:23'),
(38, 183, NULL, 'peg', 'My unnamed Clip.mp3', NULL, 16196, 'null', '2021-06-28 07:46:02'),
(39, 184, NULL, 'eet', 'Daten_Zusammenhangshypothese.xlsx', NULL, 9006, 'null', '2021-06-28 07:46:48'),
(41, 186, NULL, 'eet', 'Daten_Zusammenhangshypothese.xlsx', NULL, 9006, 'null', '2021-06-28 07:52:42'),
(42, 187, NULL, 'eet', 'Daten_Zusammenhangshypothese.xlsx', NULL, 9006, 'null', '2021-06-28 07:53:53'),
(43, 187, NULL, 'pdf', 'FlipCoin-ID SW-Entwurf.pdf', NULL, 512474, 'null', '2021-06-28 07:56:37'),
(44, 187, NULL, 'pdf', 'BT_-_flip_coin_Eventstorming.pdf', NULL, 153407, 'null', '2021-06-28 07:56:59'),
(45, 187, NULL, 'eet', 'Daten_Zusammenhangshypothese.xlsx', NULL, 9006, 'null', '2021-06-28 07:57:07'),
(46, 187, NULL, 'png', 'Bildschirmfoto 2021-06-27 um 23.36.32.png', NULL, 278553, 'null', '2021-06-28 07:57:17'),
(47, 187, NULL, 'png', 'Bildschirmfoto 2021-06-28 um 04.30.03.png', NULL, 125809, 'null', '2021-06-28 07:57:25'),
(48, 187, NULL, 'png', 'Bildschirmfoto 2021-06-26 um 02.56.35.png', 'hbjbjhnm', 357139, 'null', '2021-06-28 08:30:37'),
(49, 187, NULL, 'png', 'Bildschirmfoto 2021-06-26 um 02.56.35.png', 'hbjbjhnm', 357139, 'null', '2021-06-28 08:30:37'),
(50, 189, NULL, 'png', 'Bildschirmfoto 2021-06-26 um 02.56.35.png', 'hbjbjhnm', 357139, 'null', '2021-06-28 08:30:37'),
(51, 190, NULL, 'png', 'Bildschirmfoto 2021-06-28 um 01.21.51.png', NULL, 37583, 'null', '2021-06-28 08:23:54'),
(52, 191, NULL, 'png', 'Bildschirmfoto 2021-06-26 um 02.56.35.png', 'hbjbjhnm', 357139, 'null', '2021-06-28 08:30:37'),
(53, 193, NULL, 'png', 'Bildschirmfoto 2021-06-26 um 02.56.35.png', NULL, 357139, 'null', '2021-06-28 17:45:30'),
(54, 194, NULL, 'png', 'Bildschirmfoto 2021-06-27 um 23.36.32.png', NULL, 278553, 'null', '2021-06-28 18:01:08'),
(55, 194, NULL, 'png', 'Bildschirmfoto 2021-06-27 um 20.22.48.png', NULL, 113107, 'null', '2021-06-28 18:05:21'),
(56, 195, NULL, 'png', 'Bildschirmfoto 2021-06-27 um 20.22.48.png', NULL, 113107, 'null', '2021-06-28 18:15:26'),
(57, 196, NULL, 'png', 'Bildschirmfoto 2021-06-26 um 02.56.35.png', NULL, 0, 'null', '2021-06-28 18:16:41'),
(58, 196, NULL, 'png', 'Bildschirmfoto 2021-06-27 um 23.36.32.png', NULL, 0, 'null', '2021-06-28 18:17:29'),
(59, 196, NULL, 'png', 'Bildschirmfoto 2021-06-28 um 11.05.27.png', NULL, 0, 'null', '2021-06-28 18:20:16'),
(60, 197, NULL, 'png', 'Bildschirmfoto 2021-06-27 um 20.22.48.png', NULL, 0, 'null', '2021-06-28 18:23:52'),
(61, 197, NULL, 'png', 'Bildschirmfoto 2021-06-27 um 23.36.32.png', NULL, 0.26564884185791016, 'null', '2021-06-28 18:25:13'),
(62, 198, NULL, 'png', 'Bildschirmfoto 2021-06-27 um 23.36.32.png', NULL, 0.26564884185791016, 'null', '2021-06-28 18:31:20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `file_comment`
--

CREATE TABLE `file_comment` (
  `id_file_comment` int(11) NOT NULL,
  `id_file` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `file_keyword`
--

CREATE TABLE `file_keyword` (
  `id_file_keyword` int(11) NOT NULL,
  `id_file` int(11) NOT NULL,
  `keyword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `upload_limit` int(11) DEFAULT '50',
  `registered_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id_user`, `e_mail`, `username`, `password_hash`, `profil_pic_path`, `token`, `upload_limit`, `registered_on`) VALUES
(1, 'admin@gmail.com', 'admin', '', NULL, NULL, 50, '2021-06-28 20:47:58'),
(105, 'gg@gmail.comewfwfe', 'efwfweefwef', '$2b$10$ca89l.BZpV.d6.5FVC1ATuUINbTq1P8adQIjA9gAAjvgdxdbp261e', NULL, NULL, 50, '2021-06-28 20:47:58'),
(106, 'gg@gmail.com333', '§§§§', '$2b$10$xpru4Vko58Q.IrcOQM9W9.O5ACYESyzMP3QaoWnL6W8Jyc4Pafobe', NULL, NULL, 50, '2021-06-28 20:47:58'),
(107, 'gg@gmail.com', 'ferrger', '$2b$10$bmuIEHHbD/pL9TPgvVxQruEnxxQiZKwFakK8DgdCDaU9h7lw09Oxe', NULL, NULL, 50, '2021-06-28 20:47:58'),
(108, 'gg@gmail.comjgh', 'hvhjjh', '$2b$10$qo7bux.I1QN95igGNbCA8.JI5STvM4NvpX0EaLPH0NcfVANPfObYq', NULL, NULL, 50, '2021-06-28 20:47:58'),
(109, 'gg@gmail.comerwrew', 'tewwtete', '$2b$10$580FNbON7PSVYbApJBDVGuE4H9kWCB6hGu6PbdnsZPrf1e/AEf1C6', NULL, NULL, 50, '2021-06-28 20:47:58'),
(110, 'gg@gmail.comee', 'eeeeee', '$2b$10$nJ9D27V.QHe7DT042dDsr.S1U1AFYbYk7i9LJ92c3IOvOwYSuYv3u', NULL, NULL, 50, '2021-06-28 20:47:58'),
(111, 'gg@gmail.comerwrwr', 'rewwrrrr', '$2b$10$rzDkQuH5f.FQJjHbGzROduwRat0AHxNti5ofvsSgQ.EBIdFBpozfm', NULL, NULL, 50, '2021-06-28 20:47:58'),
(112, 'gg@gmail.comeeee', 'eeeeee', '$2b$10$LLuKtKNU6dvm/7Jikum/BuEScEmJa4eNnNnHh1YW9E8ZEpRboLDO6', NULL, NULL, 50, '2021-06-28 20:47:58'),
(113, 'gg@gmail.comwww', 'wwww', '$2b$10$2CYNptr7erCXgqZN8naxVuQcVg8Z4azNUW0xrVT6Zo58xR.2X9K4m', NULL, NULL, 50, '2021-06-28 20:47:58'),
(114, 'gg@gmail.comeee', 'eeeeee', '$2b$10$CoFi74viy1UZFrmGFmzEG.0wadHdhNO0nuOAP2IonMsKxB42vo19e', NULL, NULL, 50, '2021-06-28 20:47:58'),
(115, 'gg@gmail.comwfeeffwe', 'efwfwefewfe', '$2b$10$R464XAtIETZnZfZ5Y3qSNuUtP9rABMOoIqYT.p.3G8DqNDp9qyLGi', NULL, NULL, 50, '2021-06-28 20:47:58'),
(116, 'fd@gmail.comsfsd', 'dgsgsdsdgdg', '$2b$10$JzkteuWnmGt0OGZsO3OSy.DVhg1CYInZFS0L1B.qVeCUDBHgo3Jw.', NULL, NULL, 50, '2021-06-28 20:47:58'),
(117, 'gg@gmail.comewwe', 'efewfwefw', '$2b$10$4p0GV0p8a7wamXFgwnekOu5.26rGyfZHMsUppzcQJUr89BP4zXAzu', NULL, NULL, 50, '2021-06-28 20:47:58'),
(118, 'gg@gmail.comfwfwf', 'fewfefwef', '$2b$10$togok/q/02CxNaPJHCK0bOeaPFZnxJ4HH3/vkp7Jo92NInXEyMaUa', NULL, NULL, 50, '2021-06-28 20:47:58'),
(119, 'gg@gmail.comewrwerrew', 'rewwrrer', '$2b$10$tubBJTux3AyiLdVh25qgx.YeD3lg2/WFt8drdsNch4GOch4f6wdNO', NULL, NULL, 50, '2021-06-28 20:47:58'),
(120, 'gg@gmail.comewfef', 'efwwfef', '$2b$10$EwpgHPA3ZAI7BwX.1UyvOOx9jom6WT0d/K84jm/axTwuycScTDvGu', NULL, NULL, 50, '2021-06-28 20:47:58'),
(121, 'lemlem@gmail.comrwerer', 'rweewr', '$2b$10$VOPDQNsGIBRXHzryShfaYOBks.2LCRSDN072klddGAgaaQz5tpyJi', NULL, NULL, 50, '2021-06-28 20:47:58'),
(122, 'gg@gmail.comt233t2', '23tt32t233t', '$2b$10$LvENqT4DBuPPDg/BhK1Veu5dI5t/afbMzPS8WhJsBWWnhXxexosii', NULL, NULL, 50, '2021-06-28 20:47:58'),
(123, 'gg@gmail.comewtetwtew', 'tewwtttwe', '$2b$10$zVlXusqUzaiWsOE6LV.bguyDRBKdlWU72kNtCpDfSyE5XdKLImiwq', NULL, NULL, 50, '2021-06-28 20:47:58'),
(124, 'gg@gmail.comwew', 'rewwrerew', '$2b$10$WmKlpEc2ykyuIkT82/dO4efCjsE3Ar/g9iRDO5hX64o1wOPTQORyS', NULL, NULL, 50, '2021-06-28 20:47:58'),
(125, 'gg@gmail.comrr32r23', 'r32r3r23r3', '$2b$10$o7HZrsCKRqf8WuvCQpUg/enKk9E59uk8fU0JjQxFiMQ1.Ebjb2k7.', NULL, NULL, 50, '2021-06-28 20:47:58'),
(126, 'gg@gmail.comtert', 'rteertr', '$2b$10$6fFIQDhiYQ789HeUgeC6hOeGlkIC9EHzGH820eujmsDjG5HE2ktB2', NULL, NULL, 50, '2021-06-28 20:47:58'),
(127, 'gg@gmail.comsds', 'dgssdgds', '$2b$10$V7AwdZJjwsCq.bnEpZCzh.xLwUwj1ZeprLq9qOBTXhx0EgYa8Ico.', NULL, NULL, 50, '2021-06-28 20:47:58'),
(128, 'gg@gmail.comewerw', 'ewrrewwer', '$2b$10$XqcVFangIj8pu5Cee9JCVuE8KKPfxKyb0K2GTS3ZxoGfWpbCCj7M.', NULL, NULL, 50, '2021-06-28 20:47:58'),
(129, 'lemlem@gmail.comefwewf', 'fewfewewffew', '$2b$10$CIZLrvBqMF5Z3fgWtyAq4uJJFxba/93R2EU94yhTUl3SpsIx4B076', NULL, NULL, 50, '2021-06-28 20:47:58'),
(130, 'lemlem@gmail.comewtw', 'etwette', '$2b$10$AZ5i1wOxjNy/YIy3GMDMyuE/4mOUATcEeQlPsoNE/3vWZksxtUVRa', NULL, NULL, 50, '2021-06-28 20:47:58'),
(131, 'gg@gmail.comrewwerrwe', 'rrwrwrrwrwe', '$2b$10$.Sd6gJAa7vdm.sqQ7gLnY.woPKmMQgTTFFxxsfS.RtBbQeRGuZ296', NULL, NULL, 50, '2021-06-28 20:47:58'),
(132, 'gg@gmail.comerrew', 'rerewerer', '$2b$10$DHOv8w1Qb21vAD.s7enAOOWfiHgEYmOXSCpGM02POo5IFfzKhmAW.', NULL, NULL, 50, '2021-06-28 20:47:58'),
(133, 'gg@gmail.comrewwre', 'rwerwere', '$2b$10$DcLjt8gXbGUg4IgkSRo6PeZauELUYQHkuLhUMz9GWu/3RR/8Prey6', NULL, NULL, 50, '2021-06-28 20:47:58'),
(134, 'gg@gmail.comqeweqw', 'eqwqeweewe', '$2b$10$bxyL3RIkdAnaXcFKnVPg9.Lgtfi6JwZE4O7nA6CIewqcYdc0uV0qm', NULL, NULL, 50, '2021-06-28 20:47:58'),
(135, 'gg@gmail.comwrrwewr', 'rewrewwrr', '$2b$10$Qg809YCOqtvf0QAK/jm/k.YTqMFuVHrZJpAcXFSv3N/u1WxHbIERa', NULL, NULL, 50, '2021-06-28 20:47:58'),
(136, 'gg@gmail.comr322r3', 'r3r232rr', '$2b$10$kiy1fuG284eq5.WSwegq9.PKRfZQm/g3B53jbEuKXjEfQo.hAXwMS', NULL, NULL, 50, '2021-06-28 20:47:58'),
(137, 'lemlem@gmail.comqwrrq', 'qwrqrrwrw', '$2b$10$CL9nbntB/U/6I2yj.TM92OCbYnqXIOPdSSkFsZGz2AA7tEzBRSRnq', NULL, NULL, 50, '2021-06-28 20:47:58'),
(138, 'lemlem@gmail.comfsfsa', 'fsaaff', '$2b$10$FKaHWGU245LTg7cTrzqrU.p5MZL1R6qdN1kaXJZJW1fXa.q4Nj5N2', NULL, NULL, 50, '2021-06-28 20:47:58'),
(139, 'gg@gmail.comerddsg', 'gdsgsgsd', '$2b$10$9ATsW/U0HtWQeRuHtxpO1u90pdXbGYajyp2IkTC/nuBKcnvUZRsZi', NULL, NULL, 50, '2021-06-28 20:47:58'),
(140, 'lemlem@gmail.comrwr', 'rewrrwewr', '$2b$10$tQFVXKTJRdGSN28iL5wIJ.cydjdc.u.SKUdKJLXiqC9d34D/ULcwe', NULL, NULL, 50, '2021-06-28 20:47:58'),
(141, 'lemlem@gmail.comsdggsdgdgs', 'gsdgsdgss', '$2b$10$cgbegzdY8w4sTxtG43LLb.r0vxr9YnNuYsBWpCKDOnu2q4bGLRiye', NULL, NULL, 50, '2021-06-28 20:47:58'),
(142, 'lemlem@gmail.comrerew', 'rewwrerqe', '$2b$10$syFXLXWJlfpRbv1WZ8IiBO1bTV.g3gpQks0TeCP4jeimDSZWqQNFi', NULL, NULL, 50, '2021-06-28 20:47:58'),
(143, 'lemlem@gmail.comwef', 'fewfwewfe', '$2b$10$1J5/IuYvocyT8HobZQAzU.88jNRojQnxxHeMyp.fXyZQJcOMkz/l2', NULL, NULL, 50, '2021-06-28 20:47:58'),
(144, 'lemlem@gmail.comrewerw', 'rewwerreer', '$2b$10$1e950p8DZIGKfQO6O1ZwQu7sFY7PdbciiloUl0Xhdv3U.MNVKUBGS', NULL, NULL, 50, '2021-06-28 20:47:58'),
(145, 'gg@gmail.comgewwge', 'egwgwgwe', '$2b$10$sHyc418Y6cq6Alv9ENVgYewnedig8q0Mb2Sr8Bcq2AsJt0LpNJs6C', NULL, NULL, 50, '2021-06-28 20:47:58'),
(146, 'lemlem@gmail.comegwgew', 'wegwegweg', '$2b$10$kal.SseIIjWyT4X8sPNbJ.KNoqAWCNjwybE7td4DAxaT2gdZ0bbge', NULL, NULL, 50, '2021-06-28 20:47:58'),
(147, 'gg@gmail.comewrerrwe', 'rwerwerwewre', '$2b$10$8Jyb8oweu7N7YNAeFyUqQ.w2qFdIyCuzesLBYNOj5TeL7LhNSf9gy', NULL, NULL, 50, '2021-06-28 20:47:58'),
(148, 'lemlem@gmail.comfgdgfd', 'fdggfd', '$2b$10$IjFzxgC6/zZ1yctV7FXCMO2Q74bmEhmQGsll.HQY2/Hzg9eTI90Z6', NULL, NULL, 50, '2021-06-28 20:47:58'),
(149, 'lemlem@gmail.comret', 'rteetretr', '$2b$10$dqOSLdOt0vDmRhFSnC6IKew5OiM4mYDsX1Wnqg98TOV6s4qBymzcm', NULL, NULL, 50, '2021-06-28 20:47:58'),
(150, 'lemlem@gmail.comrehreheh', 'erehrreerh', '$2b$10$NL4AQSxUDx1XpRCXhhcHL.2EJjzx8qfIr1k93vxtAJOIyQojfer2.', NULL, NULL, 50, '2021-06-28 20:47:58'),
(151, 'lemlem@gmail.comwerrwerwe', 'rewerrewer', '$2b$10$mtU/musoS/qugs33SGvVhuXBYH6vYxjMNHzktZkr7blOEzqj8p.Pi', NULL, NULL, 50, '2021-06-28 20:47:58'),
(152, 'lemlem@gmail.comefwefw', 'fewefe', '$2b$10$nC9tqg2P1tSPs2lNdQ998ujEkjhnBoTwJKFkAW7oeAb6NENMG73k2', NULL, NULL, 50, '2021-06-28 20:47:58'),
(153, 'lemlem@gmail.comdf', 'dsfsdsdf', '$2b$10$lBcD7xYPXRvRattJVcjGR.JirgAXGekO0J4NEVhsuB6CfoScwtZ9y', NULL, NULL, 50, '2021-06-28 20:47:58'),
(154, 'lemlem@gmail.comdsgdgs', 'dgsdsgdgsdg', '$2b$10$5DZkUa7YMrecmquf8joH6u.BQeve.VE2nwRBWRJQkedfaJfky9S/K', NULL, NULL, 50, '2021-06-28 20:47:58'),
(155, 'gg@gmail.comedggsd', 'dsgdggg', '$2b$10$urHDH4nSn4ooE/Ben9GcFuXywKiy2RLXB8Krw3srbeIJb31fWCZJi', NULL, NULL, 50, '2021-06-28 20:47:58'),
(156, 'gg@gmail.comefwfwefw', 'efwfwfw', '$2b$10$1D7x06XTFxNy1xBiLYmzNu3G3qw1hRxKKVHLXEWZegUROvVqNfEhS', NULL, NULL, 50, '2021-06-28 20:47:58'),
(157, 'gg@gmail.comfwqfqw', 'fwqfwqqf', '$2b$10$soyr1g1v.sgxqvn.gq5bLe8NjqK0jn8tXcMWqeHPTJlPOiI.mM3hi', NULL, NULL, 50, '2021-06-28 20:47:58'),
(158, 'gg@gmail.comeffewwf', 'efwfewfwe', '$2b$10$M6NoKYNIMTvVMOGK6LRXd.TZiOs4Gf4DlWnQHcreJcG8O26MsdWYG', NULL, NULL, 50, '2021-06-28 20:47:58'),
(159, 'lemlem@gmail.comrrwewfsd', 'asffasaf', '$2b$10$gRK2apvW8QGmk4nonCrViOpitB8jyQitjHztRlN0X8m3WwhUQoiy6', NULL, NULL, 50, '2021-06-28 20:47:58'),
(160, 'gg@gmail.comgdga', 'gdsgsdsga', '$2b$10$tHj8ZQF09mIKAr3.8DV.xePJnzLVyaUJRCBTE1vysJNC1qohD1yNy', NULL, NULL, 50, '2021-06-28 20:47:58'),
(161, 'gg@gmail.comrewr', 'wrwrrweer', '$2b$10$JL4pof/HO6I/VO9owYphOOV3EvgM1BcOlMBDGgx459GUAl58MpSqy', NULL, NULL, 50, '2021-06-28 20:47:58'),
(162, 'lemlem@gmail.comreww', 'rwerwere', '$2b$10$WllVRUil/vY1sjJQgqkL6uU/STDTqxq7/8zNUKDrdUZVY8JjubknS', NULL, NULL, 50, '2021-06-28 20:47:58'),
(163, 'gg@gmail.comffsa', 'affaaf', '$2b$10$f1OSSQ5ND7sMq6yMYcozYOUtrYERWQNFrDUKiqKlW3FqzCD6VpP3G', NULL, NULL, 50, '2021-06-28 20:47:58'),
(164, 'lemlem@gmail.comfqwfqw', 'fqfwqqfwfq', '$2b$10$Mu8vJvqAB.icFFXe8bxgOeT1/HFQxSeLrQg0Va9/syykXKVSk/gQO', NULL, NULL, 50, '2021-06-28 20:47:58'),
(165, 'lemlem@gmail.comsddgs', 'gdssdg', '$2b$10$zetggOdT1EMdVL9tu1BhyuqNRTY5fqw/4A1nGrxdF143LAFyu5gsC', NULL, NULL, 50, '2021-06-28 20:47:58'),
(166, 'lemlem@gmail.comafssfasf', 'fafasassf', '$2b$10$6f5ZRIPCnpRVAn9JX8CKJOfgW/FQuDGaPDZ7tROUwak05ZUT0JytC', NULL, NULL, 50, '2021-06-28 20:47:58'),
(167, 'gg@gmail.comqwffqw', 'qqfwfwq', '$2b$10$tz7teCDNUkBS47NcRd3Na.FV.0pn/WenuPL0O/xnPs9HKDyjmN6mS', NULL, NULL, 50, '2021-06-28 20:47:58'),
(168, 'gg@gmail.comgegwe', 'gwgweg', '$2b$10$mglIkgcAi8eutb6d8EnzveXCk.50P32Hn/jhmnhHLX7T1GEvzkzRu', NULL, NULL, 50, '2021-06-28 20:47:58'),
(169, 'lemlem@gmail.comfwewfe', 'fwewfefeew', '$2b$10$xfCBEZCgQp4lgwg.KZI26ean7pndtM1GsKcCS0SYNAE6.jURZAXSK', NULL, NULL, 50, '2021-06-28 20:47:58'),
(170, 'lemlem@gmail.comfdssdffd', 'fsdsfddfs', '$2b$10$huz6KPLFPnf9a4gE8VgB8O1D9fhP4/rMzp4kZVcv6lGxQgtGkIGu.', NULL, NULL, 50, '2021-06-28 20:47:58'),
(171, 'lemlem@gmail.comfewwfe', 'fwefwewfe', '$2b$10$O3tF9PY8TFFAWBUxr1I9X.pdrj6hNo0vm/qcM9f1wa2Ta7FSKDwOi', NULL, NULL, 50, '2021-06-28 20:47:58'),
(172, 'shipp@gmail.com', 'gdsdgsgsd', '$2b$10$mDq9pEYNSalqMumaeQGz2.znZKOfAqObnVzDZb0JF8891tlqmJlSy', NULL, NULL, 50, '2021-06-28 20:47:58'),
(173, 'gg@gmail.comfsaaf', 'afsafsfaf', '$2b$10$0YJDiNm.K8b0ohkEHuBdSeMerLeJUNvxJNvAnKbgeZ8piGiN.MGBe', NULL, NULL, 50, '2021-06-28 20:47:58'),
(174, 'lemlem@gmail.comefwfeefw', 'efwewffewewf', '$2b$10$Zw/sEEJe8qPPd3uSt8GrguCw0SqWihj.SHwm2ZhKzprfpnFvRvZFG', NULL, NULL, 50, '2021-06-28 20:47:58'),
(175, 'gg@gmail.comfewfew', 'fewfef', '$2b$10$PLYBqcnh8VvazdOEelcKd.DwrVhpAUTfKIuzL4Uxyn.5Is.kx.zLa', NULL, NULL, 50, '2021-06-28 20:47:58'),
(176, 'gg@gmail.comewrer', 'wrewreewer', '$2b$10$eA7XE3eRT2Lg0ho2mLCN8OUViyIL3l5TCUgCZ0CJARFoOQs/iPgBu', NULL, NULL, 50, '2021-06-28 20:47:58'),
(177, 'gg@gmail.comfweweef', 'feweffew', '$2b$10$pOA8McU8TRp/x17XRuX2geZ5s/NYjRG50lVagff7ijVb2UbNYmyVO', NULL, NULL, 50, '2021-06-28 20:47:58'),
(178, 'gg@gmail.comefewf', 'fwewfeef', '$2b$10$mIuwKzIyjyqfFwVQj6oApeas/woN6GXxYHa/mypSIv8HaFoppoF0m', NULL, NULL, 50, '2021-06-28 20:47:58'),
(179, 'lemlem@gmail.comfewwf', 'fwefwf', '$2b$10$ESRfLEoiDfJW4JcCCdwoSumxBdInayG1qkckSnfYo2YSdVzRjFK96', NULL, NULL, 50, '2021-06-28 20:47:58'),
(180, 'lemlem@gmail.com', 'ssssgewge', '$2b$10$Vb.6C1bHK2upIw0uQ4SIY.XyG6jbAt8IzjQAAq7tzlfSZ/kjnOS5e', NULL, NULL, 50, '2021-06-28 20:47:58'),
(181, 'gg@gmail.comegegw', 'wgewegg', '$2b$10$NKQ6iMMqKl5jPWg8fHW38OcfYgYN7Lewx3VNnOzDLkWM//wY3Y4Cm', NULL, NULL, 50, '2021-06-28 20:47:58'),
(182, 'gg@gmail.comafa', 'afssfasf', '$2b$10$p4S6DFuggbMLt/LqEkxRMu268e.n28lRh.gsTdV1j3ZpIAEXKFmsG', NULL, NULL, 50, '2021-06-28 20:47:58'),
(183, 'lemlem@gmail.comfsafs', 'afsafsf', '$2b$10$a9dGBD6eqteg5Kg7.yEyFe3pTt0yxwDi.6J31JZd0801HmPNWu5qa', NULL, NULL, 50, '2021-06-28 20:47:58'),
(184, 'lemlem@gmail.comwffff', 'affsafs', '$2b$10$rU.93PnOBPLq.0hxHsE/buRj0O.Pu7pQ6XO7wcmG6IjLouyLzma.y', NULL, NULL, 50, '2021-06-28 20:47:58'),
(185, 'gg@gmail.comfdsfdsfsd', 'dfsdsfdfds', '$2b$10$E.zhyNm0k6EhZAmB18OBG.k97z3ue7QWcmRfbs7/dk9S2a9Q66rL2', NULL, NULL, 50, '2021-06-28 20:47:58'),
(186, 'gg@gmail.comeffwe', 'fefwewfe', '$2b$10$EIquqlsCDwJM4EEcoJnSKeAUSorOx/AlFaImrC1VJoDiSmvuVwnZa', NULL, NULL, 50, '2021-06-28 20:47:58'),
(187, 'lemlem@gmail.comdfsdfs', 'dfsdfsdfs', '$2b$10$rjaROj8mmoIugLn8kgrH7.QiBYI/ozsuIa2KSLTlcf9LbxD.W7rr2', NULL, NULL, 50, '2021-06-28 20:47:58'),
(188, 'lemlemdsdsa@gmail.com', 'saasffsa', '$2b$10$hu7mj8Te.jERI8yjuEDoTeotR9gSH7Lxf.LH1c3KWrdQphnaLAYnG', NULL, NULL, 50, '2021-06-28 20:47:58'),
(189, 'lemlem@gmail.comfas', 'fassf', '$2b$10$wyVPbOlYFazWbrnkxOp/ruTk2sHJwOWmi.fKZ3MIbnzTjiL5MckUG', NULL, NULL, 50, '2021-06-28 20:47:58'),
(190, 'gg@gmail.comfwewfe', 'ferrgerfwewfe', '$2b$10$rfz3y4qRg1KuL6xDfCXnWeRl9TdCDUtzkNMZqQJR5pzHvM0S/imVO', NULL, NULL, 50, '2021-06-28 20:47:58'),
(191, 'gg@gmail.comgdssgd', 'ferrgergdsgd', '$2b$10$p7rUIvMa3eFKvNwEvpHn..VFPYmbtYLieuvcHh2vR2JQIB8icbF5W', NULL, NULL, 50, '2021-06-28 20:47:58'),
(192, 'lololo@gmail.com', 'lolo', '$2b$10$jeE2sM0dctmaCOvWCYaxxOEZa8osIevcBzdneFIpCaWUFYAQG7htO', NULL, NULL, 50, '2021-06-28 20:47:58'),
(193, 'lemmfeeg@gmail.com', 'dsgdgsdgs', '$2b$10$6wJD/uhocVgH8d2sB6tHteeUO9CMs/D6cyNknUnrs2jt4hq9fdfgS', NULL, NULL, 50, '2021-06-28 20:47:58'),
(194, 'gg@gmail.comfdgfg', 'dffdgfgdgf', '$2b$10$fqsltPN0gYQRbtQbug5syeo2hE4pPl1eF55UwUgVY3c7amRmvnls6', NULL, NULL, 50, '2021-06-28 20:47:58'),
(195, 'gg@gmail.comdsgsd', 'gdsgdsgsddg', '$2b$10$FLwHwY9HEjYC/CzOidPGHe6z2KNMz0W2soTU8FArxTcoqe5vx/Dmi', NULL, NULL, 50, '2021-06-28 20:47:58'),
(196, 'gg@gmail.comsdggsd', 'dsggdssgddg', '$2b$10$Npz9sUXQywkx/y8mU2OzX.ZBGQKkSu0fmq80Z9Ho6z9bcnLW7chnW', NULL, NULL, 50, '2021-06-28 20:47:58'),
(197, 'gg@gmail.comdsvvsd', 'gdsdggd', '$2b$10$BFHG6ndU6Yd3KREvqbqH8un3yS.ICaVNB0/2GYC/88sPo1SgJsJWS', NULL, NULL, 50, '2021-06-28 20:47:58'),
(198, 'lemlem@gmail.comdsggds', 'dsgsdggds', '$2b$10$5/N5voBoFIwxqFWaaJhIS.dSaIC9sJeTW7whuDQ2S9ilQEWC5wt7m', NULL, NULL, 50, '2021-06-28 20:47:58'),
(199, 'gg@gmail.comgfdfgfd', 'gfddfgdgf', '$2b$10$jSmzmDlsme3ZfnuxbZv6fu76MUG/TnkJRv2ErzXbnL9eo9VWJimGG', NULL, NULL, 50, '2021-06-28 20:47:58'),
(200, 'french@gmail.com', 'greegr', '$2b$10$cD.7lqwONddpaHYab3nb9uKOu9QI1V6xcArVVVyfk9nR2Ra0kFq96', NULL, NULL, 50, '2021-06-28 20:47:58');

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
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_folder` (`id_folder`),
  ADD KEY `id_file_format` (`format`);

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
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT für Tabelle `file_comment`
--
ALTER TABLE `file_comment`
  MODIFY `id_file_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`id_folder`) REFERENCES `folder` (`id_folder`) ON DELETE CASCADE,
  ADD CONSTRAINT `file_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `file_comment`
--
ALTER TABLE `file_comment`
  ADD CONSTRAINT `file_comment_ibfk_1` FOREIGN KEY (`id_file`) REFERENCES `file` (`id_file`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `file_keyword`
--
ALTER TABLE `file_keyword`
  ADD CONSTRAINT `file_keyword_ibfk_1` FOREIGN KEY (`id_file`) REFERENCES `file` (`id_file`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `folder`
--
ALTER TABLE `folder`
  ADD CONSTRAINT `folder_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

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
