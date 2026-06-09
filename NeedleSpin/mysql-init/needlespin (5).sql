-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2026 at 03:55 PM
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
-- Database: `needlespin`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `album_id` bigint(20) NOT NULL,
  `nazev` varchar(150) DEFAULT NULL,
  `rok_vydani` year(4) DEFAULT NULL,
  `zanr` varchar(100) DEFAULT NULL,
  `cover_url` varchar(255) DEFAULT NULL,
  `zdroj_url` varchar(255) DEFAULT NULL,
  `Artists_Artist_id` int(11) NOT NULL,
  `streams` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`album_id`, `nazev`, `rok_vydani`, `zanr`, `cover_url`, `zdroj_url`, `Artists_Artist_id`, `streams`) VALUES
(530, 'Three Of A Perfect Pair', NULL, NULL, 'https://i.discogs.com/mQvBzoFgzReeggLWHR80S021WlEbityn5joXP_fb1N8/rs:fit/g:sm/q:90/h:597/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI1Mjc2/OS0xNDk3NDM3MTYy/LTE2NDIuanBlZw.jpeg', NULL, 128, 0),
(1929, 'The Man Who Sold The World', NULL, NULL, 'https://i.discogs.com/C7QPQD5K5FAtUviPOatP4nkp_jgXsFKYyrm-iTFQdS8/rs:fit/g:sm/q:90/h:599/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTcxMDQ2/OC0xNDc1MDI5ODg2/LTg1MTMuanBlZw.jpeg', NULL, 105, 0),
(3354, 'A Rush Of Blood To The Head', NULL, NULL, 'https://i.discogs.com/ourI3ScU0PVLM-1hJ_3IBvZoCfytFR95zfesJyM4OmI/rs:fit/g:sm/q:90/h:600/w:599/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTUwMjI1/NTUtMTM4MjM3OTUx/Ni02NDU5LmpwZWc.jpeg', NULL, 142, 0),
(3878, 'Blood On The Tracks', NULL, NULL, 'https://i.discogs.com/Aq5gLIL8zUSEBQpOiutdVfApi41taYrIU5DYAcUmMZI/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIzMDY5/NDEtMTMzNzQzMzg5/MS01MTc2LmpwZWc.jpeg', NULL, 91, 0),
(4126, 'Led Zeppelin', NULL, NULL, 'https://i.discogs.com/jm1RiHhKTQJzLdhL__mO_LXWBIXkGDr_AU0_JPcPqsE/rs:fit/g:sm/q:90/h:595/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEyMTgy/MTctMTIwMTQ4ODE4/Ni5qcGVn.jpeg', NULL, 145, 0),
(4170, 'Unknown Album', NULL, NULL, '', NULL, 2, 0),
(4410, 'Tomb Of The Mutilated', NULL, NULL, 'https://i.discogs.com/VjsonPOwxz7s1_0uAb7b5pJu1BxAFcfFkRpxDFjWbd8/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM5NDMw/NS0xMzQwNDYzNDYy/LTM2NzQuanBlZw.jpeg', NULL, 125, 0),
(4785, 'Sabotage', NULL, NULL, 'https://i.discogs.com/CQzM8FeTvWPXAzbyWzmAmgcz-7T7RMTKMr_pKZO-xvk/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExOTcw/MzEtMTU2OTI2MDE3/Ni04NDEwLmpwZWc.jpeg', NULL, 140, 0),
(4869, 'Nadja (5) - Radiance Of Shadows', NULL, NULL, 'https://i.discogs.com/wSNbMP3weE4fKbc0XQeVFnEEl1SM9r97-SFmndYf7jA/rs:fit/g:sm/q:90/h:549/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwODkx/MDgtMTIyNjc2NDkw/NC5qcGVn.jpeg', NULL, 71, 0),
(5948, 'Loveless', NULL, NULL, 'https://i.discogs.com/BX3VaGJBENv-zgHEdez23DDFIVQlaSWGgdr_8hG6dWA/rs:fit/g:sm/q:90/h:280/w:280/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEyNzYy/Mi0xMjUwMjA4Njc5/LmpwZWc.jpeg', NULL, 139, 0),
(6335, 'Little Brother (3) - The Listening', NULL, NULL, 'https://i.discogs.com/S6FFYB5XiGROBpkM0PZcGLK7LQYDWuWvG5fuEbKOcxI/rs:fit/g:sm/q:90/h:591/w:591/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ5MjYx/Ny0xMTMzOTMzOTMy/LmpwZWc.jpeg', NULL, 78, 0),
(7877, 'Renegades', NULL, NULL, 'https://i.discogs.com/o5Ymn4OmYJfWDE1SqexEgFh-gNE7f2lEQ-4mL0OPUTI/rs:fit/g:sm/q:90/h:595/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM2ODE4/Mi0xMzY3NzAxMjI2/LTc1ODcuanBlZw.jpeg', NULL, 104, 0),
(8470, 'Operation: Doomsday', NULL, NULL, 'https://i.discogs.com/VYVQnAurT9FJwF9gJ-htpGhqpfZt-TxiU4zMDsHeCzw/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIxMzE5/My0xNTIxMzc3NTQ0/LTg0MzcuanBlZw.jpeg', NULL, 154, 0),
(8883, 'Thriller', NULL, NULL, 'https://i.discogs.com/OQRwID3TvI5bMrPxrDgtFRftYhjZlkQ1FPE81xPOY5I/rs:fit/g:sm/q:90/h:602/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI5MTEy/OTMtMTU5NDI0NTgx/Mi03OTMxLmpwZWc.jpeg', NULL, 152, 0),
(10362, 'Unknown Album', NULL, NULL, '', NULL, 2, 0),
(11329, 'Unknown Album', NULL, NULL, '', NULL, 2, 0),
(11703, 'Unknown Album', NULL, NULL, '', NULL, 2, 0),
(12854, 'Paid In Full', NULL, NULL, 'https://i.discogs.com/roGxPfLQaEZqOBwWNUktR8bwhbvyG89EFcpJHaHLsd8/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwNjYx/Ny0xNzI4OTM3MDkw/LTk2MDQuanBlZw.jpeg', NULL, 133, 0),
(13773, 'Bleach', NULL, NULL, 'https://i.discogs.com/WTTg74ExM5Aq0hkwV_6CWO6LCOh-2mepiT6UOVUh238/rs:fit/g:sm/q:90/h:592/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI3OTU1/NTQtMTMwMTM3OTg3/Mi5qcGVn.jpeg', NULL, 126, 0),
(19831, 'Living Legends - Legendary Music Vol. 1', NULL, NULL, 'https://i.discogs.com/eNlshEEkRKJFYOh4R1TZo16dyPriN7kdpx-Le-ifFG0/rs:fit/g:sm/q:90/h:300/w:300/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTgwODg4/OC0xMjYwMjQ2NTM2/LmpwZWc.jpeg', NULL, 26, 0),
(19910, 'Wrath Of The Math', NULL, NULL, 'https://i.discogs.com/0sbOBGmw0zv2Y2GLgSrx47J_QEHil6d5wgsYZ_EoI68/rs:fit/g:sm/q:90/h:605/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI1Nzc1/OS0xNzMxNTI3NDI0/LTk4MzcuanBlZw.jpeg', NULL, 150, 0),
(20145, 'Check Your Head', NULL, NULL, 'https://i.discogs.com/Riovcn3DrWelEWldQCHy-FSY3ODhbdU3-aRXd0oPTzI/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE2NzU0/OC0xNTIyNzg2NjY1/LTkwODQuanBlZw.jpeg', NULL, 120, 0),
(22420, 'Station To Station', NULL, NULL, 'https://i.discogs.com/P9GlAOWcpU7_8C7B2GD6x6Rvna8R0tMaCjEPt-nQASc/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ0MjU1/NDAtMTM3NDQzMTU4/My00OTgyLmpwZWc.jpeg', NULL, 105, 0),
(23731, 'Communiqué', NULL, NULL, 'https://i.discogs.com/AigSbxxGRc7LEGyq_so8WrxGSySI2Zr_ze9rJbYGOJk/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ5MTY5/MzMtMTM3OTQwMzIw/MC00ODI2LmpwZWc.jpeg', NULL, 94, 0),
(23934, 'Unknown Album', NULL, NULL, '', NULL, 2, 0),
(25688, 'Remain In Light', NULL, NULL, 'https://i.discogs.com/rHJU3UXR0FAkeUkU4vZpdpF3XwsLoJeitBnQVCxjRQQ/rs:fit/g:sm/q:90/h:597/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNjQ5/MS0xNTQxOTQ1NDcy/LTQ3OTUuanBlZw.jpeg', NULL, 127, 0),
(30569, 'Captain Fantastic And The Brown Dirt Cowboy', NULL, NULL, 'https://i.discogs.com/e4P4RKVfYcg4ACVhuTZzRiRJxx78n91ZKVL_VJ-b23g/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTgxMTAx/MC0xMTYxMzY2Mzk1/LmpwZWc.jpeg', NULL, 151, 0),
(32320, 'Blazing Arrow', NULL, NULL, 'https://i.discogs.com/secFL7WWdtn6ij_Y0m9oN1qz9Fx-eGQt8HCu_aOFak8/rs:fit/g:sm/q:90/h:598/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU2NTg4/LTE1NzM0NDE3ODMt/MTMxMS5qcGVn.jpeg', NULL, 148, 0),
(32461, 'Be', NULL, NULL, 'https://i.discogs.com/awAiH8Ot5Nx56EVTNKm1PiZrj7WH_QL6inFBkLz1ycA/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ1MzQ3/MS0xNjA0MjU3MTQ3/LTI2NTMuanBlZw.jpeg', NULL, 115, 0),
(33117, 'Various - Protect The Innocent - 30 Metal Monsters', NULL, NULL, 'https://i.discogs.com/HvSOg-2rvUjV1EpBix3oOTcxXJfGSWGNzKe1P5Jo51w/rs:fit/g:sm/q:90/h:596/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIyNzY2/ODMtMTI3NjIxNjIx/Ni5qcGVn.jpeg', NULL, 33, 0),
(34167, 'The Hunger For More', NULL, NULL, 'https://i.discogs.com/5sFd0_xmZovnn6FN_NsvdrYdOZcLf0Mx63DXxfT6tcU/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNTI2/NjMtMTQzMTc5NDQ1/MC00MTQ3LmpwZWc.jpeg', NULL, 103, 0),
(36252, 'The Teardrop Explodes - You Disappear From View', NULL, NULL, 'https://i.discogs.com/9V_scWUAtcBFHCbzRhHPm8gQLj8j_gL2aIfD_MMI4g8/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU4NDc3/Mi0xNTIwMTUzMDg5/LTE3NzAuanBlZw.jpeg', NULL, 48, 0),
(38485, 'Do You Want More?!!!??!', NULL, NULL, 'https://i.discogs.com/sk1Ov_e5MpN9tyQUOzgG3fC48tmCVJfFTBgg2Edw8GI/rs:fit/g:sm/q:90/h:594/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MTgz/Mi0xNzI5MjY5Njgy/LTcxMDkuanBlZw.jpeg', NULL, 153, 0),
(38722, 'Unknown Album', NULL, NULL, '', NULL, 2, 0),
(41722, 'Destroyer', NULL, NULL, 'https://i.discogs.com/kwRNWlN_OVS_Px96aXlu8B1DqnjfE18fJmpUyV07J_4/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTcwMjUw/NC0xMTQ5NTc0MDE0/LmpwZWc.jpeg', NULL, 96, 0),
(41779, 'Pelican (2) & Playing Enemy - Split 7\"', NULL, NULL, 'https://i.discogs.com/VAoqM3TY0DcrRvr6V9ZvCur85oZG_4XQ2fNQ4L1H84w/rs:fit/g:sm/q:90/h:599/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTcwNzg0/MC0xNzMxNjgzODUx/LTc5MDUuanBlZw.jpeg', NULL, 67, 0),
(42877, 'Whodini - Six', NULL, NULL, 'https://i.discogs.com/FBazMMKaLj_tTmUJHJ2UUEEpvXPHrZ-1gihtgPkwJOM/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTgwODI1/OC0xMjcxMjY0MDMy/LmpwZWc.jpeg', NULL, 80, 0),
(43063, 'Songs From The Big Chair', NULL, NULL, 'https://i.discogs.com/wbveeAFdX4QYUdMQ-SXYrWme1i0c_LPmqWZlZ9H7DCc/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEyNDE4/Ny0xMzQ5MDA0MzE1/LTU5NDguanBlZw.jpeg', NULL, 110, 0),
(43964, 'Still Crazy After All These Years', NULL, NULL, 'https://i.discogs.com/x3lcxK8zqEyrX8vwvNFoorhZei_hxg9vA4SQIWSy1Es/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTkyNjg3/Ny0xNjgxNjQ2ODgw/LTc5MjUuanBlZw.jpeg', NULL, 141, 0),
(44148, 'Out Of Time', NULL, NULL, 'https://i.discogs.com/xcn-4T6a26FID9usmJG6QQHN1mTJjG2zocrX5Ihly1E/rs:fit/g:sm/q:90/h:599/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIwMjQ1/MjQtMTM1Mzc4Njgz/OC05MzE2LmpwZWc.jpeg', NULL, 107, 0),
(45284, 'Revolver', NULL, NULL, 'https://i.discogs.com/hHyc-UxILlfLM31ocujnICK2mrU5aIw8pAZ4h3xYxpo/rs:fit/g:sm/q:90/h:599/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIzMTgw/NDUtMTI3NjU5Mjg2/MS5qcGVn.jpeg', NULL, 98, 0),
(45302, 'Rob de Nijs - Pur Sang', NULL, NULL, 'https://i.discogs.com/jUtGMdTtnrGArn4T86j_4tgQTvexAR8r0CGKFNqMpcY/rs:fit/g:sm/q:90/h:557/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEyNjU2/NjgtMTYyOTgwMjc1/NC02NzI5LmpwZWc.jpeg', NULL, 84, 0),
(46381, 'The Infamous', NULL, NULL, 'https://i.discogs.com/81UcPBl4uRZVYmyT0zVQutnerPLYgV3KYiEEOu_1dqA/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIyMzEy/Ny0xNjUwNTQ0MDc0/LTcwMTEuanBlZw.jpeg', NULL, 122, 0),
(46470, 'Murda Muzik', NULL, NULL, 'https://i.discogs.com/4EYjJU77dQ_MpZPo1IwDpVKCg_w4jG5iR5MaLBq2xfg/rs:fit/g:sm/q:90/h:604/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ5MjA2/Mi0xNTQ5MDYxMDE2/LTY0OTEuanBlZw.jpeg', NULL, 122, 0),
(47622, 'Jazzmatazz (Volume 1)', NULL, NULL, 'https://i.discogs.com/F_LyQntEUImVekOqcDsqVJ5zLshlxg-nqe6pWuTNA5U/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTMzODI5/MS0xNjc2NjU4ODYy/LTgxNDEuanBlZw.jpeg', NULL, 135, 0),
(48681, 'Siamese Dream', NULL, NULL, 'https://i.discogs.com/No3fwl1zEI4A0bktAkKvAUk_JTbHst62P479gMT4cKA/rs:fit/g:sm/q:90/h:599/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTcwODY1/MDEtMTQzMzQwNTc3/Mi0yNjgyLmpwZWc.jpeg', NULL, 138, 0),
(49182, 'Tonight', NULL, NULL, 'https://i.discogs.com/OZFaJPHGkWwhdVcmczwF0tIWQBH1UlxFk1FAgXkY0Dc/rs:fit/g:sm/q:90/h:600/w:576/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ3MDE3/My0xMzQ1NDU4NTIy/LTE2NDMuanBlZw.jpeg', NULL, 105, 0),
(50954, 'Stieber Twins Mit Samy Deluxe ; Max FK* ; Busy ; Tropf - Malaria', NULL, NULL, 'https://i.discogs.com/LZXRRNpy9Rh3Ax82e-By9ThWmdX9GTfqyyjChe3Ywl0/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTkwNzAy/Mi0xMjk0OTQ4OTY2/LmpwZWc.jpeg', NULL, 46, 0),
(50985, 'Yo!  Bum Rush The Show', NULL, NULL, 'https://i.discogs.com/xDY4J1clarH7AH4TVRvkJNN5Fvj1xKb_JKTFNGP3BfI/rs:fit/g:sm/q:90/h:588/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTg2NjM0/LTEzMzM0NTE0MDMu/anBlZw.jpeg', NULL, 118, 0),
(52028, 'D-Flame - Basstard', NULL, NULL, 'https://i.discogs.com/O63MByXQdKlZt4aIoxEH8tjedAGD8O7wO6TpZcqNNiw/rs:fit/g:sm/q:90/h:579/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEyNTIx/Mi0xNTkwMTU5NDMy/LTUwMTQuanBlZw.jpeg', NULL, 53, 0),
(52668, 'Duty Now For The Future', NULL, NULL, 'https://i.discogs.com/Rp-5Co_6JekZ7JXznArQaMo_4VJO8XR8okY_Ka0q3jM/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTY3NzAy/NDYtMTU1Nzk1Mzg2/Ny0yMzEwLmpwZWc.jpeg', NULL, 143, 0),
(52708, 'Batman Forever (Original Music From The Motion Picture)', NULL, NULL, 'https://i.discogs.com/NBYt20U-hfFRecfhKmchryUoO9tgWiwchflwekCmRDY/rs:fit/g:sm/q:90/h:588/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ0Mzgx/OC0xNjg0Njk2Nzc5/LTk5MDguanBlZw.jpeg', NULL, 33, 0),
(56985, 'Enta Da Stage', NULL, NULL, 'https://i.discogs.com/N-Q7j67BLsrRyGw1vI3WDI1m-NrAz82CCSuzRxgvK6w/rs:fit/g:sm/q:90/h:585/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEyNjEw/NjUtMTM0NTc1MjAy/MC0zNDAxLmpwZWc.jpeg', NULL, 100, 0),
(63247, 'Mr. Hood', NULL, NULL, 'https://i.discogs.com/JLsNwTG6Q9utFESDI5jqsy1C8XMjBQz6DJbNSuhfMus/rs:fit/g:sm/q:90/h:606/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI0MDc0/My0xNjAyNzA0MDU0/LTU1OTUuanBlZw.jpeg', NULL, 121, 0),
(66987, 'Various - D&D Project II', NULL, NULL, 'https://i.discogs.com/vMDXqYiAPG9Ty0gTetG4UczqYwmjL2-ab62_wzh41_o/rs:fit/g:sm/q:90/h:400/w:400/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNzEx/MTktMTQ2MDI1OTI5/Ni01NzE3LmpwZWc.jpeg', NULL, 33, 0),
(71368, 'Time', NULL, NULL, 'https://i.discogs.com/AytcAOgfLVwmQi_yTihtzD5Hg1x51Kc-i3BGlHurQQA/rs:fit/g:sm/q:90/h:602/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwMTIx/MzU1LTE0OTE5OTM5/ODItODg3Mi5qcGVn.jpeg', NULL, 95, 0),
(73947, 'Everything Is Borrowed', NULL, NULL, 'https://i.discogs.com/v6qFZOlCBERoS5-a6lFvyaxQEHtWrDar23vJ1hJ1gbM/rs:fit/g:sm/q:90/h:601/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0NjQ5/NDctMTIyMTc2NjE3/MS5qcGVn.jpeg', NULL, 123, 0),
(74519, 'Hybrid Theory', NULL, NULL, 'https://i.discogs.com/pU2rfxJKyHRPQofpc2vFX3dzZ7i_kje9HdRQb6g3psM/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM2OTQw/OC0xMjQ1MzgwNTQw/LmpwZWc.jpeg', NULL, 102, 0),
(76957, 'Mood - Karma', NULL, NULL, 'https://i.discogs.com/P-AsLcI7z_yH-4QOa7E1r5cgsFX5zGzp5GOrrZ1EVJ8/rs:fit/g:sm/q:90/h:594/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTgyNjY3/MzktMTYyMjk3MDcz/Ny05MTE4LmpwZWc.jpeg', NULL, 81, 0),
(77579, 'Bachman-Turner Overdrive II', NULL, NULL, 'https://i.discogs.com/rlBSMFaYK2oYYcjk9emNmmXFwHUBKTag8yBTv54MV0A/rs:fit/g:sm/q:90/h:601/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI4MDA4/NzMtMTQzMzk1NjAy/OC0yOTU1LmpwZWc.jpeg', NULL, 144, 0),
(79174, 'Kante - Zombi', NULL, NULL, 'https://i.discogs.com/imaqxisMWtlkEtfPjoG4IQFX7KZz-4FnAlO6cWn8fwk/rs:fit/g:sm/q:90/h:300/w:300/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTUxODI3/MS0xMTI4NjE2MDk4/LmpwZWc.jpeg', NULL, 66, 0),
(81753, 'Portable Patrol - Cop Bop', NULL, NULL, 'https://i.discogs.com/kkFnFspkifkIx8bm3G8z1nnCfQZWqZwzKdyZb5CZHxQ/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU5MDcx/OS0xMjk1MTgwMTU2/LmpwZWc.jpeg', NULL, 60, 0),
(84954, 'MSG', NULL, NULL, 'https://i.discogs.com/fEv0_sJsU-ACpLBtOPmgwhrSquPkzXQFdfxaeqKlRaw/rs:fit/g:sm/q:90/h:589/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwNzU2/NzkyLTE2MzIwMTMz/NDQtNjMxMi5qcGVn.jpeg', NULL, 129, 0),
(87474, 'In Square Circle', NULL, NULL, 'https://i.discogs.com/u2rUQCmfcaFkTkBGMD5To-TfKfvdZFVb5IaoUOfIn0s/rs:fit/g:sm/q:90/h:594/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTY3NzA2/NTItMTQyNjI3MzY5/NS01MDQ2LmpwZWc.jpeg', NULL, 116, 0),
(87611, 'Notorious', NULL, NULL, 'https://i.discogs.com/T_XDEYGY23AQcy8tNJw5Cx-oT2pQkMUGiKr9cckTkpU/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEzNjc0/OTYtMTU0NzMwNzA1/Ni0yMzE2LmpwZWc.jpeg', NULL, 124, 0),
(101755, 'Jackie Brown (Music From The Miramax Motion Picture)', NULL, NULL, 'https://i.discogs.com/PHXyWSVC2DQiwLjSAekTVReEW2KYSO9y5E5N7NVA4Os/rs:fit/g:sm/q:90/h:598/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTcyNTI0/MTAtMTQzNzIyMTEw/OC00MDA1LmpwZWc.jpeg', NULL, 33, 0),
(105946, 'Doctor Feelgood* - See You Later Alligator', NULL, NULL, 'https://i.discogs.com/AIofDeuqASb8imbDdGytH6YDLoq-9fysRpd7r0q-Lp4/rs:fit/g:sm/q:90/h:588/w:598/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE1OTI3/ODMtMTM5MzUzNzE2/OC04ODc1LmpwZWc.jpeg', NULL, 54, 0),
(109443, 'Positive K - The Skills Dat Pay Da Bills', NULL, NULL, 'https://i.discogs.com/840x5uy27Lo5adWWgi4jX2RaAOoPPco8LnLmJtBbAaI/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEyMDM4/MDctMTIwMDg0ODEx/OC5qcGVn.jpeg', NULL, 32, 0),
(122350, 'E. 1999 Eternal', NULL, NULL, 'https://i.discogs.com/E9fCLTa9FEbxvWgt86OxZzerwa4otAFe_WPFnl4WLuc/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM5Mzk1/NS0xNjU0MTc1NjQz/LTM1ODMuanBlZw.jpeg', NULL, 137, 0),
(130371, 'All Or Nothing - The U.S. Remix Album', NULL, NULL, 'https://i.discogs.com/VaVKhTnhZPlnIaMOPFDZ-fAuJwc1N-7ueTSk1bVN-dg/rs:fit/g:sm/q:90/h:595/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ2MDg0/MS0xNDU0NjYxODEw/LTY1NzAuanBlZw.jpeg', NULL, 92, 0),
(141637, 'Out There', NULL, NULL, 'https://i.discogs.com/K-A0qO4zPHG-TNVastsG3-jHfWYm8AoiioRVVQNkRNM/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwODQy/MzktMTI5MTc2NDI2/NC5qcGVn.jpeg', NULL, 131, 0),
(145852, 'Whitey Ford Sings The Blues', NULL, NULL, 'https://i.discogs.com/Jx_E-msZSyHofsaU3sEcHGOUTFlwOdvroxNl-DFdd3Q/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIzMzQ1/OC0xMjk4NjA5ODU1/LmpwZWc.jpeg', NULL, 132, 0),
(150723, 'Poison', NULL, NULL, 'https://i.discogs.com/qgzcu0SlxgeouZqubpHaJV_5Zx14hi7XGAb-0hl3HKw/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExOTMz/NjQtMTQ5MzE2NjYw/OS0zMzU2LmpwZWc.jpeg', NULL, 149, 0),
(153405, 'Regular Fries - Supersonic Waves', NULL, NULL, 'https://i.discogs.com/9oGDG45wek0YIbK5ymgqHUkmmrv69Plvhj-dZdVtssc/rs:fit/g:sm/q:90/h:606/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM1MzU4/MC0xMzYzNzY0NTEw/LTc4NTMuanBlZw.jpeg', NULL, 76, 0),
(158274, 'Master P Presents West Coast Bad Boyz - High Fo Xmas', NULL, NULL, 'https://i.discogs.com/S0MdgJtGZyRnVVYg3G98kOglUc4K23XQp7HH1dRNjlk/rs:fit/g:sm/q:90/h:601/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ4MDI2/Mi0xNjQyMTcxODgw/LTkxNzYuanBlZw.jpeg', NULL, 21, 0),
(175190, 'Canibus - Mic-Nificent / Phuk U', NULL, NULL, 'https://i.discogs.com/JGvQFl8Z-YNoH6bXBkZaMzmhQsF9AP_d6MLbaeR_yJo/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTY1MDU5/NS0xNjQ2MDcwNzA0/LTQ0OTEuanBlZw.jpeg', NULL, 40, 0),
(178268, 'Damon & Naomi - The Wondrous World Of Damon & Naomi', NULL, NULL, 'https://i.discogs.com/4uU6EHChEe9AcXJQXfQh28d9V44Fx40l3EnJNI8y_pc/rs:fit/g:sm/q:90/h:568/w:582/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0ODY5/MzEtMTI1MjYxMDQ3/OS5qcGVn.jpeg', NULL, 13, 0),
(179601, 'Pearl Jam - State College, PA - May 3rd 2003', NULL, NULL, 'https://i.discogs.com/3oC3GSHfKGEcUuiGsMiseTEu53ZBs9hmAnfvF4Ls82o/rs:fit/g:sm/q:90/h:511/w:512/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExMzAx/MjAtMTE5NTE5NjAz/MS5qcGVn.jpeg', NULL, 82, 0),
(184941, 'Le Orme - Verità Nascoste', NULL, NULL, 'https://i.discogs.com/RRBOR5m3wIs06iu16s26FJj8liQQPUZ2bSBqXJZYzps/rs:fit/g:sm/q:90/h:589/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE5MzQz/NTEtMTQ2NTA4Mjkz/My05MjA3LmpwZWc.jpeg', NULL, 65, 0),
(184952, 'Man - Twice', NULL, NULL, 'https://i.discogs.com/EqW6Wl0EgpB0pLEnXF2Ake-8b6WGmForFLqxwpKrzHU/rs:fit/g:sm/q:90/h:585/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEyNDc5/ODUtMTYwNDY0Njg0/Mi0yNDA2LmpwZWc.jpeg', NULL, 45, 0),
(185084, 'Twinz (2) - Eastside LB', NULL, NULL, 'https://i.discogs.com/ue9HQ3---MjSaAksEXgpVuW0q_fFtu_SEJ_GUK_TQek/rs:fit/g:sm/q:90/h:589/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTUwMjA2/Ny0xMzY2NDY1MTMy/LTk5NzMuanBlZw.jpeg', NULL, 23, 0),
(202877, 'Antitainment - Nach Der Kippe Pogo!?', NULL, NULL, 'https://i.discogs.com/JnR44_U6ueKmKY2XYuAKP_UUhN6E8dtIWxIZHm3jf0c/rs:fit/g:sm/q:90/h:494/w:494/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwOTcw/ODktMTE5MTc4NjE5/Ny5qcGVn.jpeg', NULL, 57, 0),
(257803, 'Various - Yalta Hi-Life', NULL, NULL, 'https://i.discogs.com/At6pUytxYI2nNAcqqU-C409aV5pyQdyOPsMDyIDydiQ/rs:fit/g:sm/q:90/h:609/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTkwNzg5/Ny0xMjI1MTAwMzEz/LmpwZWc.jpeg', NULL, 33, 0),
(264119, 'Recovery', NULL, NULL, 'https://i.discogs.com/oQoJduMWJ4U8ANR81_y4GG3_2d3PIigYW9Rb5gUsLeo/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM0Nzkw/MTYtMTY0MDAyMTc3/Ni01NzUzLmpwZWc.jpeg', NULL, 136, 0),
(266008, 'The Lambrettas - Poison Ivy', NULL, NULL, 'https://i.discogs.com/J9HIAVqKmcp8f3rCd8DqbedP9Kt91QcpPwE3m4U55ug/rs:fit/g:sm/q:90/h:500/w:500/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIzODc1/NDItMTI4MTA5MDIx/NC5qcGVn.jpeg', NULL, 16, 0),
(281991, 'Skids - Charade', NULL, NULL, 'https://i.discogs.com/sxYXUzm5vRuF_GXfdsGt5df3lc246mCFid9le_19C0o/rs:fit/g:sm/q:90/h:590/w:590/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM1MjM4/OC0xMzgwNDY2NTc0/LTU1OTQuanBlZw.jpeg', NULL, 74, 0),
(291306, 'Constant Deviants - Concrete Utopia', NULL, NULL, 'https://i.discogs.com/RxbUa_jzSSPv3J-ub0d-PAvi-Q9Fx6fEaAS-xDrnobY/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI1MzYx/NzEtMTI5MzU2MjI1/My5qcGVn.jpeg', NULL, 27, 0),
(293609, 'Man On The Moon II: The Legend Of Mr. Rager', NULL, NULL, 'https://i.discogs.com/Vx4e9g-E6SX5sUFPau16drb6rc6jVj3JDdRBT97PEkc/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM0MzYw/ODgyLTE3NTA3OTMw/ODQtNzk4Ni5wbmc.jpeg', NULL, 119, 0),
(295002, 'Pink Friday', NULL, NULL, 'https://i.discogs.com/bDk2g22ZNGDJEsVoXbvtHR7kmIZXFPEFzG8w7utNT2w/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI1NjA5/NzYtMTQ1OTA2MDA5/Ny05NDc5LmpwZWc.jpeg', NULL, 93, 0),
(302390, 'Winds Of Plague - Decimate The Weak', NULL, NULL, 'https://i.discogs.com/irEyRFNYuzqyHvaIZebNS8Pz3gG2_107PPKu8BpkwpM/rs:fit/g:sm/q:90/h:300/w:300/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE3NDEz/MjMtMTI0MDM4NDA0/NC5qcGVn.jpeg', NULL, 56, 0),
(332452, 'Tankard - Beast Of Bourbon', NULL, NULL, 'https://i.discogs.com/KJZaI8F_5xlBdwemJMV_3xiIC8ag-FjbzxEqtnA2IM4/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI4NTc1/NzItMTMwNDI1MjA1/NS5qcGVn.jpeg', NULL, 18, 0),
(349631, 'Moses Pelham - Mein Glück', NULL, NULL, 'https://i.discogs.com/czx6ZsG-iLiD2OG4wlRylApdAKCEjGSIRZmpCPIF2j8/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE2MjY2/NDUwLTE2MDYyNTM4/MTctMzE5NC5qcGVn.jpeg', NULL, 24, 0),
(355441, 'Crime In Stereo - I Was Trying To Describe You To Someone', NULL, NULL, 'https://i.discogs.com/ajS4nWH3C68xEaSKGoS_jrw2kVeLdVx7aTl5icSCS8s/rs:fit/g:sm/q:90/h:549/w:549/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI1OTM2/MDktMTI5MjE4MzA4/NS5qcGVn.jpeg', NULL, 44, 0),
(370140, 'Duncan James - Future Past', NULL, NULL, 'https://i.discogs.com/neVx5lbEEwk2UEJspQDUQTDGRjm73_ZWR0sJrylhVyw/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTMyODY0/MTctMTY5ODg2MDY0/NC0xMzczLmpwZWc.jpeg', NULL, 11, 0),
(390739, 'El Camino', NULL, NULL, 'https://i.discogs.com/mcKBbodlC_A2WfUOSzrqT5_KlmATamFHf9wiFbXz_9A/rs:fit/g:sm/q:90/h:599/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTMyNjk4/MDktMTU2MTUzNzAx/Ny0zMzgyLmpwZWc.jpeg', NULL, 147, 0),
(430132, 'Limbeck - Limbeck', NULL, NULL, 'https://i.discogs.com/C4HGqAvBLoXc9GHS52HyxSnmK7OYTplLofTgaVQ9wRc/rs:fit/g:sm/q:90/h:486/w:554/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE3NjM1/ODEtMTI0MjM4MTAx/NS5qcGVn.jpeg', NULL, 42, 0),
(434691, 'Down (3) - Stone The Crow', NULL, NULL, 'https://i.discogs.com/Ghnqm_9Q0J4WuHfHDmo4xvLsHZm6dj9aUxSi5mNBNwk/rs:fit/g:sm/q:90/h:466/w:469/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM0Nzc4/MjAtMTM2NzgwMDM0/NC02ODMyLmpwZWc.jpeg', NULL, 58, 0),
(459684, 'MA_DOOM: Son Of Yvonne', NULL, NULL, 'https://i.discogs.com/fIm1A7u3vfdo8-Sc4Nj24lPqJFPRm1ZlOsGcHo8R54Q/rs:fit/g:sm/q:90/h:598/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM3NzM3/MzAtMTc1NjAwOTA5/My00MDEyLmpwZWc.jpeg', NULL, 130, 0),
(467955, 'Earl Slick - In Your Face', NULL, NULL, 'https://i.discogs.com/ObGmYBRyhyDqI2u-4lk_kvlzZMdYfLYCmDvhx9LlFec/rs:fit/g:sm/q:90/h:580/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM3MjI1/ODYtMTUwNDYxNDc3/NS05OTA4LnBuZw.jpeg', NULL, 10, 0),
(487769, 'Slums Attack - Slums Attack', NULL, NULL, 'https://i.discogs.com/39ZKvKWaL6YWq1vRgracL4yVsbh2ipAFgv5S6vAXlRY/rs:fit/g:sm/q:90/h:434/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQwMDA2/NzAtMTUxMDMxMzcz/NC0xMzYxLmpwZWc.jpeg', NULL, 73, 0),
(509138, 'Nude Beach (2) - II', NULL, NULL, 'https://i.discogs.com/fqWEH06TGCF-rWUfyFwC053bkXZR4jUyT9BKSoACsA0/rs:fit/g:sm/q:90/h:579/w:580/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM1MjE3/OTQtMTMzMzc0Nzcz/NC5qcGVn.jpeg', NULL, 59, 0),
(530778, 'Rocé - Gunz N\' Rocé', NULL, NULL, 'https://i.discogs.com/a5PwKntpTL9pTrPegwFh1bJNdn_mhsgowQdhVE9vELg/rs:fit/g:sm/q:90/h:590/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQzMzcz/NjktMTQ5Njg1NDgx/OC0xMzgwLmpwZWc.jpeg', NULL, 68, 0),
(574568, 'Spazz / Floor (2) - All Urban Outfield / Chelsea / Pigs', NULL, NULL, 'https://i.discogs.com/6pBXSaJSY0sfTknQjEilAQUqoEwrD36f5ZjHqtduzh8/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEyNDk3/NTItMTM2MjQyNjQy/My03ODk4LmpwZWc.jpeg', NULL, 63, 0),
(576800, 'Virus 7 - Sick In The Head', NULL, NULL, 'https://i.discogs.com/DrRgTgrPucYo2XWXDEQDua6R6b3tmEfdKAI3QvLeB9o/rs:fit/g:sm/q:90/h:601/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ3Mjkw/MjctMTU0NTI3OTQz/Ny05MDA1LmpwZWc.jpeg', NULL, 85, 0),
(604768, 'E.S.G. (2) & Slim Thug - Boss Hogg Outlaws', NULL, NULL, 'https://i.discogs.com/HgNiZbkhqJK1Ch7xEIDE2rl4s0VQl-M99DQE5EI1Ors/rs:fit/g:sm/q:90/h:606/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTUwNzM1/ODMtMTY3NzI1MjA4/NC0xNDU3LmpwZWc.jpeg', NULL, 35, 0),
(612228, 'Black Label Society - Unblackened', NULL, NULL, 'https://i.discogs.com/EBmKDYqXFmUe9lcdseprGPy9ujLr1tqDlpNk7cVPUpY/rs:fit/g:sm/q:90/h:593/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTUwMzky/MTMtMTU5ODU1ODEz/OC02NDUyLmpwZWc.jpeg', NULL, 83, 0),
(645124, 'Schoolboy Q - Habits & Contradictions', NULL, NULL, 'https://i.discogs.com/qH5_0M7yo-FR2KlX6eGhnzjpfxMnEk9ZU2qXwSed4IU/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM2MzAy/NTgtMTM4MTc3NjA2/NC01MDYwLmpwZWc.jpeg', NULL, 34, 0),
(672390, 'The A-Team (5) - A Is For Asshole', NULL, NULL, 'https://i.discogs.com/qdkvJ9V5un67M-95ZqYJp83u3tYvFjdCyPerlC-SLWU/rs:fit/g:sm/q:90/h:148/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU5MDQ1/MjEtMTQwNTkyNjcx/Ny00ODc1LmpwZWc.jpeg', NULL, 38, 0),
(695651, 'Masked Intruder - M.I.', NULL, NULL, 'https://i.discogs.com/_74x8-xJvjrWdAPb5ZwXy0CRtXVEZbfXpdYC5sIE2eQ/rs:fit/g:sm/q:90/h:409/w:425/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU3NTgx/MDEtMTQwMTgzMzAy/NC00NjUwLmpwZWc.jpeg', NULL, 61, 0),
(698199, 'Reality Testing', NULL, NULL, 'https://i.discogs.com/Gmsg9CH7b_hfJUkvxV9pd7WNHpUm-2cm7c3bBIE5Bzg/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU3OTA4/NDYtMTQwMjc2MDE4/NC03MTA0LmpwZWc.jpeg', NULL, 113, 0),
(699137, 'Raxe - Raxe', NULL, NULL, 'https://i.discogs.com/-i8h-Hu1Fkb8Lc6LoQZTZy-78hu9WLOnt6ctmUTRNSU/rs:fit/g:sm/q:90/h:320/w:315/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU4MDAz/NjgtMTQwMzAxODY2/NC0zNDUxLmpwZWc.jpeg', NULL, 36, 0),
(705511, 'Roy Orbison - 20 Golden Greats', NULL, NULL, 'https://i.discogs.com/ePGuiMKs8KnhiyTzI36FG5JqUQk56PR3YGMXKdYsssw/rs:fit/g:sm/q:90/h:586/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM2NjM2/NDgtMTMzOTQwNjE3/MC00OTUyLmpwZWc.jpeg', NULL, 43, 0),
(722411, 'The Wytches - Annabel Dream Reader', NULL, NULL, 'https://i.discogs.com/cOIUxeKcl3fJs4PafcktbOlLexQefJPCZumhpO-kzt8/rs:fit/g:sm/q:90/h:599/w:593/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU3Nzk5/NDUtMTQwMjQzMjUw/Ny0zNzI4LmpwZWc.jpeg', NULL, 41, 0),
(737640, 'Flying Colors - Second Nature', NULL, NULL, 'https://i.discogs.com/rQoyxDKz7sWW8POGeaS524HNf-aplbmINvety7C2fJE/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwOTMx/MzA2LTE1MDY4MjI0/MDEtNzA5Ny5qcGVn.jpeg', NULL, 47, 0),
(740609, 'You\'re Dead!', NULL, NULL, 'https://i.discogs.com/XrfekJEejBwdWz_Ebatws3hOrVV-4qLhXuc1IGlkxX4/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTYwODk0/NTUtMTQxMzYyNzU5/OS0xMDA3LmpwZWc.jpeg', NULL, 109, 0),
(794896, 'Trophy Eyes - Mend, Move On', NULL, NULL, 'https://i.discogs.com/i958gs8OpPanbMjf2kljUrfJZX_597ECx5nP2Fkamxk/rs:fit/g:sm/q:90/h:479/w:480/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTY2Mjkw/ODEtMTQyMzQyMDg1/OC04ODAwLmpwZWc.jpeg', NULL, 72, 0),
(799983, 'Keep Of Kalessin - Epistemology', NULL, NULL, 'https://i.discogs.com/RCGb5pZ8AKubn5hC5NTI2-hRxvE9WxXYtiPwLjIbg4Q/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTY3MjQ1/ODYtMTQ1OTQwMzMy/My0yMTE2LmpwZWc.jpeg', NULL, 70, 0),
(858980, 'Bosse-De-Nage - All Fours', NULL, NULL, 'https://i.discogs.com/2Asj8bYoLtavZi1oGGF43gX8kevLZx_EgPvBJsdqFIE/rs:fit/g:sm/q:90/h:592/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTY4ODIx/MzYtMTQyODY3NDY3/MS01Mzc2LmpwZWc.jpeg', NULL, 51, 0),
(861083, 'Currents', NULL, NULL, 'https://i.discogs.com/0m9adSJO-pWPRlWpwczRCUJfTokcREPbsmZMprEs1-o/rs:fit/g:sm/q:90/h:592/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTcyNTIx/MTEtMTY5NzM4MTkw/MS0yMjg3LmpwZWc.jpeg', NULL, 108, 0),
(884682, 'Honeymoon', NULL, NULL, 'https://i.discogs.com/t3ZXzGGqCpWgKXZbOt5iyR66zgcqJnVli6ddoxhan4s/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTc0OTAy/MjgtMTQ0Mjc1NjQx/OS02NDQ4LmpwZWc.jpeg', NULL, 99, 0),
(901995, 'Neil Young & Crazy Horse - Change Your Mind', NULL, NULL, 'https://i.discogs.com/15JIV076-qvTi4vPXLmv4KHqeRrh6cgVVFiGNwVKS00/rs:fit/g:sm/q:90/h:600/w:598/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTc1MzY3/NTEtMTQ0MzY0NDc4/OS03MjU1LmpwZWc.jpeg', NULL, 64, 0),
(1013735, 'Clean Your Clock', NULL, NULL, 'https://i.discogs.com/rGSH8_0qE36RKXMi4yibM-bpU_PaQWH0UJ8uunObfL0/rs:fit/g:sm/q:90/h:594/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTg2MzQ5/MDktMTYyMjEzMTQ3/NS0zMzY1LmpwZWc.jpeg', NULL, 117, 0),
(1055881, 'Vendetta (33) - Tyranny Of Minority', NULL, NULL, 'https://i.discogs.com/-5OdNRbPetfkhp3XZalHd3r_YaF6NrgkIXI6Jmvyj5g/rs:fit/g:sm/q:90/h:613/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTkwMjM4/MjUtMTQ3MzQ1MjI4/My04ODIyLmpwZWc.jpeg', NULL, 17, 0),
(1060525, 'Eskimeaux - Year Of The Rabbit', NULL, NULL, 'https://i.discogs.com/DOkF18hGcXbi7OuGmjTjy4yHoCFK0nFxlMcVu54x9Qk/rs:fit/g:sm/q:90/h:601/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTg4Nzk1/MTctMTcwOTQ2ODQw/OC01OTUwLmpwZWc.jpeg', NULL, 14, 0),
(1080955, 'Domkraft - The End Of Electricity', NULL, NULL, 'https://i.discogs.com/zWyMfb30CMMDibkwLIyII-dtdMeojuoQOAi003okh18/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTkyNTM2/NjQtMTQ4MTA1NTcw/NC0yODY0LmpwZWc.jpeg', NULL, 52, 0),
(1100039, 'Karel Gott - Die Goldene Stimme Aus Prag (Höhepunkte Aus Der Gleichnamigen ZDF-Show)', NULL, NULL, 'https://i.discogs.com/YNXhM9XhAG3az1UzXH0WCS0ddLUNPVeakTbCyWtLt-E/rs:fit/g:sm/q:90/h:590/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTkzOTEw/MTEtMTQ3OTczMzQ2/NC04NTM0LmpwZWc.jpeg', NULL, 12, 0),
(1119033, 'Płomień 81 - Historie Z Sąsiedztwa', NULL, NULL, 'https://i.discogs.com/89gi6YZxGBillmhfK3iGJGQo2xcP0d3k_fsTabFK7w0/rs:fit/g:sm/q:90/h:597/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE2NzU2/NjEtMTU3NTEyMzY2/My05NTQyLmpwZWc.jpeg', NULL, 25, 0),
(1135296, 'Be A Man', NULL, NULL, 'https://i.discogs.com/bQC3BhkkUDL2e4S0KQplf0k5hSnjtncJj-6LMdKQY4E/rs:fit/g:sm/q:90/h:591/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIzNDI1/MjMtMTY2MTYzODky/Mi0xNDQyLmpwZWc.jpeg', NULL, 134, 0),
(1138539, 'Cold Crush Brothers / Super 3 - Fresh Wild Fly And Bold / Philosophy Rappin\' Spree', NULL, NULL, 'https://i.discogs.com/9D5LlVMhwB6Sl09q9wqNWppu78TVrjmib-GBu-zIV6A/rs:fit/g:sm/q:90/h:596/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ5MDc1/NTgtMTM5NDI5NDA4/MS0zMTkwLmpwZWc.jpeg', NULL, 29, 0),
(1184947, 'After Laughter', NULL, NULL, 'https://i.discogs.com/TCwyaOcyBCtr9jHwi9IUUP6srDork3pb3MzNxtJJpiY/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI4MjQ2/Njc4LTE2OTQ1Njc4/NTMtNDQ1NS5qcGVn.jpeg', NULL, 97, 0),
(1208104, 'Quazarz: Born On A Gangster Star', NULL, NULL, 'https://i.discogs.com/qINTjaJhB8OKw_xrBda3AhBoJgWcw63zKOZw4ijmFmg/rs:fit/g:sm/q:90/h:599/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwNTUx/Mjc3LTE0OTk3MzM1/NDEtMjc3OS5qcGVn.jpeg', NULL, 111, 0),
(1212427, 'Lust For Life', NULL, NULL, 'https://i.discogs.com/apISjHy-oeNKhr7RTqlnaxy5fnZVhH1ReOqPxbHBwFY/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwNTk3/MTg1LTE1MDA2NTE3/ODMtNDUyMS5qcGVn.jpeg', NULL, 99, 0),
(1213025, 'Rue The Day - The Machine', NULL, NULL, 'https://i.discogs.com/ekFIjxyEG2TsyFNwc0sb7sNLwmaHWeXp8pmpd-BidtY/rs:fit/g:sm/q:90/h:296/w:290/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM0OTc3/ODQtMTQxOTAxNjk1/MS04MDgyLmpwZWc.jpeg', NULL, 22, 0),
(1250553, 'Masseduction', NULL, NULL, 'https://i.discogs.com/Bnq22ooJztlpVC20SRW3OrQchZ3cWub0jjYsR9XBlOw/rs:fit/g:sm/q:90/h:594/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwOTg0/NTUxLTE1ODQwNDcx/NDgtODgxMy5qcGVn.jpeg', NULL, 146, 0),
(1266527, 'Guè Pequeno - Il Ragazzo D\'Oro', NULL, NULL, 'https://i.discogs.com/IeQ_Od844lcv9yEfCOx0uxpwSVJEikjh1c06ui1Nx2A/rs:fit/g:sm/q:90/h:610/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU1Njgx/MjgtMTQyMzEyNzg5/Ny00OTMwLmpwZWc.jpeg', NULL, 79, 0),
(1331815, 'Moose Blood - Honey', NULL, NULL, 'https://i.discogs.com/ypdO-QhtDrG66egc54KUyt12UWFer0UbMJF2COjKR5w/rs:fit/g:sm/q:90/h:603/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTg4NTgy/MjItMTU2NzI0Mjgy/OS00MDkyLmpwZWc.jpeg', NULL, 69, 0),
(1337234, 'Iron Maiden - The Beast And The Glory', NULL, NULL, 'https://i.discogs.com/197shkpOGgvAIzdehjWZeUK36RRaBugAtXtWkuV1Cv4/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTgzNDU1/NzAtMTQ1OTc5NDg5/MC0zOTE5LmpwZWc.jpeg', NULL, 19, 0),
(1420400, 'Intrepid Stylez - Junior Criminalz EP', NULL, NULL, 'https://i.discogs.com/3BVxeCmZkn4JfJurqZh-HdEjszi46G4nnr-_uz4BOxk/rs:fit/g:sm/q:90/h:625/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEyNTAw/NDA2LTE3MDYwMzI4/NTMtMTYzNC5qcGVn.jpeg', NULL, 31, 0),
(1471269, 'Gore Elohim* - Electric Lucifer', NULL, NULL, 'https://i.discogs.com/TRpdR-8PlIn7o7WjIrNXe9P3NcHIm23mPAL2pyK8idI/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTUwMTQ0/NDEtMTQzNTQ5MDIw/OC00OTMzLmpwZWc.jpeg', NULL, 75, 0),
(1567083, 'Billie Eilish - Bad Guy', NULL, NULL, 'https://i.discogs.com/tByeWeyjXh_5PwrRLImddi6k2vzjW_ZikONMSD9hrTM/rs:fit/g:sm/q:90/h:594/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MzYx/ODExLTE1NzMwMDIw/NjQtOTUyMS5qcGVn.jpeg', NULL, 50, 0),
(1571782, 'Bandana', NULL, NULL, 'https://i.discogs.com/nm8XXcyexC64T7_8yEBypVzMZpJJS0cqDlxP9UL_8N0/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEzODE2/NTI2LTE2NTkxMjAz/NTYtMzUyNy5qcGVn.jpeg', NULL, 106, 0),
(1605218, 'NF - The Search', NULL, NULL, 'https://i.discogs.com/Njb-ZZ0_uMT4EsCl3tdJIp4FncBV2h2w0cv3lRTu7GI/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIyMDI0/MDg0LTE2NDM5OTYw/MTktMjU3OC5qcGVn.jpeg', NULL, 55, 0),
(1610867, 'Kohti Tuhoa - Ihmisen Kasvot', NULL, NULL, 'https://i.discogs.com/Vab8-5oI6XwjNmgabNzaDajfBJK6GVjDKL8_1qYEyFA/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MTY4/MjMyLTE1NjkxMzAz/NjItNjgxMS5qcGVn.jpeg', NULL, 49, 0),
(1703263, 'Afterbirth (6) - Four Dimensional Flesh', NULL, NULL, 'https://i.discogs.com/U3c4UZBn_Vt17h5mtnWt-AiKewV1WLTQVPn4MqKY8_M/rs:fit/g:sm/q:90/h:523/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0OTMy/MzQzLTE1OTA2NzU3/NTItMzUwNC5qcGVn.jpeg', NULL, 20, 0),
(1709173, 'Eevil Stöö - 6Lack Album', NULL, NULL, 'https://i.discogs.com/-GnvYZhLSO5kUfTDXc3HVWJrYrz1DsILs7RyDUEQ9oU/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0OTky/NDg3LTE1ODUyMjcz/MTEtOTM0NS5qcGVn.jpeg', NULL, 30, 0),
(1847072, 'Big K.R.I.T. - TDT', NULL, NULL, 'https://i.discogs.com/lOLSr8SYYG_AZ1kDpVTyw898y1DFpqKk4kyS47qF0ng/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEzODky/NjMzLTE1NjM0NjQ0/NjMtNTI5My5wbmc.jpeg', NULL, 77, 0),
(2081599, 'Bewitcher - Cursed Be Thy Kingdom', NULL, NULL, 'https://i.discogs.com/mcWFVsOGQdl00gv__z-zybyA49tT2UPomhjbPDeYpEw/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE4MzI1/MjU1LTE2MjcxMTc4/NDgtOTA3OC5qcGVn.jpeg', NULL, 39, 0),
(2125414, 'Super What?', NULL, NULL, 'https://i.discogs.com/Ha17c5bUYYE-9VC2QRPPooakwsa0SzBTs4sTT94750w/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIxMzcz/NzIzLTE2Mzk2NzM3/ODAtNjI5NS5qcGVn.jpeg', NULL, 114, 0),
(2455447, 'José James - Merry Christmas From Jose James', NULL, NULL, 'https://i.discogs.com/a7w1HXa5BHEQkBTdEFWlWzMYLUIIeeWRYpuQon372Cg/rs:fit/g:sm/q:90/h:449/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIxNTEx/ODEwLTE2NDA3MDgw/MzAtODA3Mi5qcGVn.jpeg', NULL, 15, 0),
(2709590, 'Titanic (7) - ON', NULL, NULL, 'https://i.discogs.com/oTbVBjjcAH-o_55mw8lScrt0xQitWTcu5r9HegKMJAs/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIwMTk0/MDYwLTE2MzEzNjMy/NjQtMTYzMi5qcGVn.jpeg', NULL, 37, 0),
(2807150, 'As Above So Below', NULL, NULL, 'https://i.discogs.com/VedjCPn1bqazMj__J9_7acKeF2Obs50QXo-JEpiqaSs/rs:fit/g:sm/q:90/h:599/w:585/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI0Njk1/MDU3LTE2NjQ3MDI5/NjctNzEzNS5wbmc.jpeg', NULL, 112, 0),
(2947144, 'Iron Steel (2) - Kingdom Of Chains', NULL, NULL, 'https://i.discogs.com/aQaKzTYpb-TPZITcJFHtagOSQE2VekPbAq4qb5fZSQU/rs:fit/g:sm/q:90/h:618/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE1Mjcy/MzI2LTE1ODkwMDUz/OTUtMjE2My5qcGVn.jpeg', NULL, 62, 0),
(3029807, 'Scaring The Hoes', NULL, NULL, 'https://i.discogs.com/J0K9v9FrUrttES6haXSnui70np3mJvKM9Yevnd9Hiho/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI2NTI5/ODAwLTE2Nzk2NzQw/MTYtODA0MC5qcGVn.jpeg', NULL, 101, 0),
(3196791, 'Iron Maiden - Purgatory', NULL, NULL, 'https://i.discogs.com/SAoH8aMJtSLBMCv0U21IBDvJ5MffjgKgCKodwW0emhw/rs:fit/g:sm/q:90/h:580/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI3OTEx/NjgyLTE2OTE0ODE0/MjYtNDIyNS5qcGVn.jpeg', NULL, 19, 0),
(3433181, 'Fates Prophecy - Into The Mind', NULL, NULL, 'https://i.discogs.com/UUkqctFhG5BULFiAojKKSSEP1ifLTRE9droMoaIbnFw/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTcyODAy/NjYtMTQzNzkwNzY1/NS0yOTMxLmpwZWc.jpeg', NULL, 86, 0),
(3463250, 'Blockhead - Luminous Rubble', NULL, NULL, 'https://i.discogs.com/W-RS4ip_hSSnM7kVQUokQjiuDqvmL2mPcFu-nVmNG2g/rs:fit/g:sm/q:90/h:450/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTMwNDQ2/MTExLTE3MTM1NjA2/OTMtOTIwOC5qcGVn.jpeg', NULL, 28, 0),
(3672621, 'Madvillainy Demos', NULL, NULL, 'https://i.discogs.com/V0BK4ig_vTzAqrJL4A7dE5z5zewFdOcfFxfqOkev5b4/rs:fit/g:sm/q:90/h:602/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTMyNDQy/ODEzLTE3MzkwOTgy/MTMtODA3MC5qcGVn.jpeg', NULL, 155, 0);

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `Artist_id` int(11) NOT NULL,
  `jmeno` varchar(150) DEFAULT NULL,
  `popis` text DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `resource_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`Artist_id`, `jmeno`, `popis`, `thumb_url`, `resource_url`) VALUES
(2, 'Unknown Artist', NULL, NULL, NULL),
(10, 'Earl Slick', NULL, NULL, NULL),
(11, 'Duncan James', NULL, NULL, NULL),
(12, 'Karel Gott', NULL, NULL, NULL),
(13, 'Damon & Naomi', NULL, NULL, NULL),
(14, 'Eskimeaux', NULL, NULL, NULL),
(15, 'José James', NULL, NULL, NULL),
(16, 'The Lambrettas', NULL, NULL, NULL),
(17, 'Vendetta (33)', NULL, NULL, NULL),
(18, 'Tankard', NULL, NULL, NULL),
(19, 'Iron Maiden', NULL, NULL, NULL),
(20, 'Afterbirth (6)', NULL, NULL, NULL),
(21, 'Master P Presents West Coast Bad Boyz', NULL, NULL, NULL),
(22, 'Rue The Day', NULL, NULL, NULL),
(23, 'Twinz (2)', NULL, NULL, NULL),
(24, 'Moses Pelham', NULL, NULL, NULL),
(25, 'Płomień 81', NULL, NULL, NULL),
(26, 'Living Legends', NULL, NULL, NULL),
(27, 'Constant Deviants', NULL, NULL, NULL),
(28, 'Blockhead', NULL, NULL, NULL),
(29, 'Cold Crush Brothers / Super 3', NULL, NULL, NULL),
(30, 'Eevil Stöö', NULL, NULL, NULL),
(31, 'Intrepid Stylez', NULL, NULL, NULL),
(32, 'Positive K', NULL, NULL, NULL),
(33, 'Various', NULL, NULL, NULL),
(34, 'Schoolboy Q', NULL, NULL, NULL),
(35, 'E.S.G. (2) & Slim Thug', NULL, NULL, NULL),
(36, 'Raxe', NULL, NULL, NULL),
(37, 'Titanic (7)', NULL, NULL, NULL),
(38, 'The A-Team (5)', NULL, NULL, NULL),
(39, 'Bewitcher', NULL, NULL, NULL),
(40, 'Canibus', NULL, NULL, NULL),
(41, 'The Wytches', NULL, NULL, NULL),
(42, 'Limbeck', NULL, NULL, NULL),
(43, 'Roy Orbison', NULL, NULL, NULL),
(44, 'Crime In Stereo', NULL, NULL, NULL),
(45, 'Man', NULL, NULL, NULL),
(46, 'Stieber Twins Mit Samy Deluxe ; Max FK* ; Busy ; Tropf', NULL, NULL, NULL),
(47, 'Flying Colors', NULL, NULL, NULL),
(48, 'The Teardrop Explodes', NULL, NULL, NULL),
(49, 'Kohti Tuhoa', NULL, NULL, NULL),
(50, 'Billie Eilish', NULL, NULL, NULL),
(51, 'Bosse-De-Nage', NULL, NULL, NULL),
(52, 'Domkraft', NULL, NULL, NULL),
(53, 'D-Flame', NULL, NULL, NULL),
(54, 'Doctor Feelgood*', NULL, NULL, NULL),
(55, 'NF', NULL, NULL, NULL),
(56, 'Winds Of Plague', NULL, NULL, NULL),
(57, 'Antitainment', NULL, NULL, NULL),
(58, 'Down (3)', NULL, NULL, NULL),
(59, 'Nude Beach (2)', NULL, NULL, NULL),
(60, 'Portable Patrol', NULL, NULL, NULL),
(61, 'Masked Intruder', NULL, NULL, NULL),
(62, 'Iron Steel (2)', NULL, NULL, NULL),
(63, 'Spazz / Floor (2)', NULL, NULL, NULL),
(64, 'Neil Young & Crazy Horse', NULL, NULL, NULL),
(65, 'Le Orme', NULL, NULL, NULL),
(66, 'Kante', NULL, NULL, NULL),
(67, 'Pelican (2) & Playing Enemy', NULL, NULL, NULL),
(68, 'Rocé', NULL, NULL, NULL),
(69, 'Moose Blood', NULL, NULL, NULL),
(70, 'Keep Of Kalessin', NULL, NULL, NULL),
(71, 'Nadja (5)', NULL, NULL, NULL),
(72, 'Trophy Eyes', NULL, NULL, NULL),
(73, 'Slums Attack', NULL, NULL, NULL),
(74, 'Skids', NULL, NULL, NULL),
(75, 'Gore Elohim*', NULL, NULL, NULL),
(76, 'Regular Fries', NULL, NULL, NULL),
(77, 'Big K.R.I.T.', NULL, NULL, NULL),
(78, 'Little Brother (3)', NULL, NULL, NULL),
(79, 'Guè Pequeno', NULL, NULL, NULL),
(80, 'Whodini', NULL, NULL, NULL),
(81, 'Mood', NULL, NULL, NULL),
(82, 'Pearl Jam', NULL, NULL, NULL),
(83, 'Black Label Society', NULL, NULL, NULL),
(84, 'Rob de Nijs', NULL, NULL, NULL),
(85, 'Virus 7', NULL, NULL, NULL),
(86, 'Fates Prophecy', NULL, NULL, NULL),
(91, 'Bob Dylan', NULL, NULL, NULL),
(92, 'Milli Vanilli', NULL, NULL, NULL),
(93, 'Nicki Minaj', NULL, NULL, NULL),
(94, 'Dire Straits', NULL, NULL, NULL),
(95, 'ELO*', NULL, NULL, NULL),
(96, 'Kiss', NULL, NULL, NULL),
(97, 'Paramore', NULL, NULL, NULL),
(98, 'The Beatles', NULL, NULL, NULL),
(99, 'Lana Del Rey', NULL, NULL, NULL),
(100, 'Black Moon', NULL, NULL, NULL),
(101, 'JPEGMAFIA & Danny Brown (2)', NULL, NULL, NULL),
(102, 'Linkin Park', NULL, NULL, NULL),
(103, 'Lloyd Banks', NULL, NULL, NULL),
(104, 'Rage Against The Machine', NULL, NULL, NULL),
(105, 'David Bowie', NULL, NULL, NULL),
(106, 'Freddie Gibbs & Madlib', NULL, NULL, NULL),
(107, 'R.E.M.', NULL, NULL, NULL),
(108, 'Tame Impala', NULL, NULL, NULL),
(109, 'Flying Lotus', NULL, NULL, NULL),
(110, 'Tears For Fears', NULL, NULL, NULL),
(111, 'Shabazz Palaces', NULL, NULL, NULL),
(112, 'Sampa The Great', NULL, NULL, NULL),
(113, 'Lone (2)', NULL, NULL, NULL),
(114, 'Czarface & MF Doom', NULL, NULL, NULL),
(115, 'Common', NULL, NULL, NULL),
(116, 'Stevie Wonder', NULL, NULL, NULL),
(117, 'Motörhead', NULL, NULL, NULL),
(118, 'Public Enemy', NULL, NULL, NULL),
(119, 'Kid Cudi', NULL, NULL, NULL),
(120, 'Beastie Boys', NULL, NULL, NULL),
(121, 'KMD', NULL, NULL, NULL),
(122, 'Mobb Deep', NULL, NULL, NULL),
(123, 'The Streets', NULL, NULL, NULL),
(124, 'Duran Duran', NULL, NULL, NULL),
(125, 'Cannibal Corpse', NULL, NULL, NULL),
(126, 'Nirvana', NULL, NULL, NULL),
(127, 'Talking Heads', NULL, NULL, NULL),
(128, 'King Crimson', NULL, NULL, NULL),
(129, 'The Michael Schenker Group', NULL, NULL, NULL),
(130, 'Masta Ace', NULL, NULL, NULL),
(131, 'The Heliocentrics', NULL, NULL, NULL),
(132, 'Everlast', NULL, NULL, NULL),
(133, 'Eric B. & Rakim', NULL, NULL, NULL),
(134, 'Macho Man Randy Savage', NULL, NULL, NULL),
(135, 'Guru', NULL, NULL, NULL),
(136, 'Eminem', NULL, NULL, NULL),
(137, 'Bone Thugs-N-Harmony', NULL, NULL, NULL),
(138, 'Smashing Pumpkins*', NULL, NULL, NULL),
(139, 'My Bloody Valentine', NULL, NULL, NULL),
(140, 'Black Sabbath', NULL, NULL, NULL),
(141, 'Paul Simon', NULL, NULL, NULL),
(142, 'Coldplay', NULL, NULL, NULL),
(143, 'Devo', NULL, NULL, NULL),
(144, 'Bachman-Turner Overdrive', NULL, NULL, NULL),
(145, 'Led Zeppelin', NULL, NULL, NULL),
(146, 'St. Vincent', NULL, NULL, NULL),
(147, 'The Black Keys', NULL, NULL, NULL),
(148, 'Blackalicious', NULL, NULL, NULL),
(149, 'Bell Biv Devoe', NULL, NULL, NULL),
(150, 'Jeru The Damaja', NULL, NULL, NULL),
(151, 'Elton John', NULL, NULL, NULL),
(152, 'Michael Jackson', NULL, NULL, NULL),
(153, 'The Roots', NULL, NULL, NULL),
(154, 'MF Doom', NULL, NULL, NULL),
(155, 'Madvillain', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `follower_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`follower_id`, `following_id`) VALUES
(9, 1),
(9, 5),
(9, 8),
(10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `status` enum('pending','accepted') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `user_id`, `friend_id`, `status`, `created_at`) VALUES
(1, 9, 6, 'pending', '2026-05-28 06:29:56'),
(2, 10, 9, 'accepted', '2026-05-28 06:32:19'),
(3, 9, 1, 'pending', '2026-06-01 19:24:44'),
(4, 9, 5, 'pending', '2026-06-03 07:09:21'),
(5, 9, 8, 'pending', '2026-06-03 07:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `game_history`
--

CREATE TABLE `game_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_name` varchar(50) NOT NULL,
  `bet` int(11) DEFAULT 0,
  `payout` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game_history`
--

INSERT INTO `game_history` (`id`, `user_id`, `game_name`, `bet`, `payout`, `created_at`) VALUES
(1, 6, 'mines', 10, 0, '2026-03-26 18:11:13'),
(2, 6, 'free_spin', 0, 10, '2026-03-26 18:12:27'),
(3, 6, 'mines', 10000, 0, '2026-03-26 18:14:57'),
(4, 6, 'mines', 10000, 43406, '2026-03-26 18:15:07'),
(5, 6, 'shells', 0, 0, '2026-03-26 20:51:08'),
(6, 6, 'mines', 10, 0, '2026-03-26 21:14:35'),
(7, 6, 'mines', 10, 0, '2026-03-26 21:14:41'),
(8, 6, 'mines', 10, 0, '2026-03-26 21:14:44'),
(9, 6, 'mines', 10, 0, '2026-03-26 21:14:54'),
(10, 6, 'mines', 10, 0, '2026-03-26 21:15:00'),
(11, 6, 'mines', 10, 0, '2026-03-26 21:15:03'),
(12, 6, 'mines', 10, 14, '2026-03-26 21:15:10'),
(13, 6, 'mines', 10, 0, '2026-03-26 21:15:23'),
(14, 6, 'mines', 10, 88, '2026-03-26 21:15:34'),
(15, 6, 'mines', 10, 0, '2026-03-26 21:36:08'),
(16, 6, 'shells', 0, 0, '2026-03-26 21:39:52'),
(17, 6, 'shells', 0, 0, '2026-03-26 21:39:59'),
(18, 6, 'shells', 0, 0, '2026-03-26 21:40:06'),
(19, 6, 'shells', 0, 0, '2026-03-26 21:40:12'),
(20, 6, 'shells', 0, 0, '2026-03-26 21:40:19'),
(21, 6, 'shells', 0, 0, '2026-03-26 21:40:25'),
(22, 6, 'shells', 0, 0, '2026-03-26 21:40:32'),
(23, 6, 'shells', 0, 0, '2026-03-26 21:40:38'),
(24, 6, 'shells', 0, 0, '2026-03-26 21:40:44'),
(25, 6, 'shells', 0, 0, '2026-03-26 21:40:51'),
(26, 6, 'shells', 0, 15, '2026-03-26 21:40:57'),
(27, 6, 'mines', 10, 0, '2026-03-27 07:28:13'),
(28, 6, 'shells', 0, 15, '2026-03-27 07:28:22'),
(29, 6, 'shells', 0, 0, '2026-03-27 07:28:29'),
(30, 6, 'mines', 10, 0, '2026-03-27 07:30:58'),
(31, 6, 'mines', 10, 118, '2026-03-27 07:31:05'),
(32, 6, 'mines', 10, 0, '2026-03-27 07:52:11'),
(33, 6, 'mines', 10, 32, '2026-03-27 07:52:45'),
(34, 6, 'mines', 1000, 0, '2026-03-27 08:00:10'),
(35, 6, 'mines', 1000, 0, '2026-03-27 08:00:12'),
(36, 6, 'mines', 1000, 0, '2026-03-27 08:00:14'),
(37, 6, 'mines', 1000, 0, '2026-03-27 08:00:16'),
(38, 6, 'mines', 1000, 0, '2026-03-27 08:00:17'),
(39, 6, 'mines', 1000, 0, '2026-03-27 08:00:18'),
(40, 6, 'mines', 1000, 0, '2026-03-27 08:00:19'),
(41, 6, 'mines', 1000, 0, '2026-03-27 08:00:21'),
(42, 6, 'mines', 1000, 0, '2026-03-27 08:00:23'),
(43, 6, 'mines', 1000, 0, '2026-03-27 08:00:25'),
(44, 6, 'mines', 1000, 0, '2026-03-27 08:00:27'),
(45, 6, 'mines', 1000, 0, '2026-03-27 08:00:30'),
(46, 6, 'mines', 1000, 0, '2026-03-27 08:00:33'),
(47, 6, 'mines', 1000, 0, '2026-03-27 08:00:35'),
(48, 6, 'mines', 1000, 0, '2026-03-27 08:00:38'),
(49, 6, 'mines', 1000, 0, '2026-03-27 08:00:43'),
(50, 6, 'mines', 1000, 0, '2026-03-27 08:00:46'),
(51, 6, 'mines', 1000, 0, '2026-03-27 08:00:48'),
(52, 6, 'mines', 1000, 0, '2026-03-27 08:00:49'),
(53, 6, 'mines', 1000, 0, '2026-03-27 08:00:51'),
(54, 6, 'mines', 1000, 23750, '2026-03-27 08:00:55'),
(55, 6, 'mines', 100, 0, '2026-03-27 08:06:16'),
(56, 6, 'shells', 0, 0, '2026-03-27 08:06:37'),
(57, 6, 'shells', 0, 15, '2026-03-27 08:06:43'),
(58, 9, 'mines', 10, 0, '2026-06-01 18:36:43'),
(59, 9, 'shells', 0, 0, '2026-06-01 18:36:55'),
(60, 9, 'mines', 10, 0, '2026-06-01 18:42:30'),
(61, 9, 'mines', 10, 0, '2026-06-01 18:42:33'),
(62, 9, 'mines', 10, 0, '2026-06-01 18:42:37'),
(63, 9, 'mines', 10, 0, '2026-06-01 18:42:42'),
(64, 9, 'mines', 80, 0, '2026-06-01 18:43:00'),
(65, 10, 'mines', 10, 0, '2026-06-03 19:03:50'),
(66, 10, 'mines', 10, 10, '2026-06-03 19:03:54'),
(67, 10, 'mines', 10, 0, '2026-06-03 20:47:49'),
(68, 10, 'mines', 10, 0, '2026-06-03 20:48:59'),
(69, 10, 'shells', 0, 0, '2026-06-03 20:49:04'),
(70, 9, 'mines', 10, 32, '2026-06-04 08:08:22'),
(71, 9, 'mines', 10, 0, '2026-06-04 08:08:33'),
(72, 9, 'mines', 10, 99, '2026-06-04 08:08:53'),
(73, 9, 'shells', 0, 15, '2026-06-06 22:59:10'),
(74, 9, 'shells', 0, 0, '2026-06-06 22:59:18'),
(75, 9, 'shells', 0, 0, '2026-06-06 22:59:23'),
(76, 9, 'shells', 0, 0, '2026-06-06 22:59:28'),
(77, 9, 'shells', 0, 0, '2026-06-06 22:59:35'),
(78, 9, 'mines', 1000, 0, '2026-06-07 16:38:43'),
(79, 9, 'mines', 36, 0, '2026-06-07 16:38:53'),
(80, 9, 'shells', 0, 0, '2026-06-07 16:39:00'),
(81, 9, 'shells', 0, 0, '2026-06-07 16:39:26'),
(82, 9, 'shells', 0, 0, '2026-06-07 16:39:30');

-- --------------------------------------------------------

--
-- Table structure for table `market_listings`
--

CREATE TABLE `market_listings` (
  `id` int(11) NOT NULL,
  `user_album_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `type` enum('sell','trade') NOT NULL,
  `price` int(11) DEFAULT 0,
  `status` enum('active','completed','cancelled') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `market_listings`
--

INSERT INTO `market_listings` (`id`, `user_album_id`, `seller_id`, `type`, `price`, `status`, `created_at`) VALUES
(1, 121, 6, 'trade', 0, 'completed', '2026-02-23 14:09:18'),
(2, 123, 6, 'trade', 0, 'completed', '2026-02-23 14:33:43'),
(3, 126, 6, 'trade', 0, 'completed', '2026-02-25 07:47:22'),
(4, 127, 6, 'trade', 0, 'completed', '2026-02-25 09:40:29'),
(5, 155, 8, 'trade', 0, 'completed', '2026-04-26 11:47:52'),
(6, 124, 6, 'trade', 0, 'active', '2026-04-27 11:01:48'),
(7, 157, 9, 'trade', 0, 'active', '2026-06-01 18:57:55');

-- --------------------------------------------------------

--
-- Table structure for table `music_packs`
--

CREATE TABLE `music_packs` (
  `Pack_id` int(11) NOT NULL,
  `jmeno` varchar(45) DEFAULT NULL,
  `cena` varchar(45) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `music_packs`
--

INSERT INTO `music_packs` (`Pack_id`, `jmeno`, `cena`, `Genre`) VALUES
(1, 'Rap Pack', '100', 'Hip Hop'),
(2, 'Pop Pack', '100', 'Pop'),
(3, 'Rock Pack', '100', 'Rock'),
(4, 'Metal Pack', '100', 'Heavy Metal'),
(5, 'Jazz Pack', '100', 'Jazz');

-- --------------------------------------------------------

--
-- Table structure for table `music_packs_has_albums`
--

CREATE TABLE `music_packs_has_albums` (
  `Music_packs_Pack_id` int(11) NOT NULL,
  `Albums_album_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quests`
--

CREATE TABLE `quests` (
  `id` int(11) NOT NULL,
  `nazev` varchar(255) NOT NULL,
  `odmena` int(11) NOT NULL,
  `cil_pocet` int(11) NOT NULL,
  `typ_akce` varchar(50) NOT NULL,
  `typ_trvani` enum('denni','tydenni','mesicni') NOT NULL DEFAULT 'denni'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quests`
--

INSERT INTO `quests` (`id`, `nazev`, `odmena`, `cil_pocet`, `typ_akce`, `typ_trvani`) VALUES
(1, 'Zahraj si 3 minihry', 50, 3, 'play_minigame', 'denni'),
(2, 'Vydělej 100 bodů v minihrách', 100, 100, 'win_points', 'denni'),
(3, 'Zahraj si 20 miniher', 500, 20, 'play_minigame', 'tydenni'),
(4, 'Vydělej 1 000 bodů v minihrách', 1000, 1000, 'win_points', 'tydenni'),
(5, 'Zahraj si 100 miniher', 3000, 100, 'play_minigame', 'mesicni'),
(6, 'Vydělej 5 000 bodů v minihrách', 5000, 5000, 'win_points', 'mesicni');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `hodnoceni` decimal(3,1) DEFAULT NULL,
  `komentar` text DEFAULT NULL,
  `hodnoceni_Datum` datetime DEFAULT NULL,
  `Users_user_id` int(11) NOT NULL,
  `Albums_album_id` bigint(20) NOT NULL,
  `Songs_song_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`rating_id`, `hodnoceni`, `komentar`, `hodnoceni_Datum`, `Users_user_id`, `Albums_album_id`, `Songs_song_id`) VALUES
(3, 3.0, '', '2025-12-16 22:57:19', 4, 10362, 1),
(4, 2.0, '', '2025-12-16 22:57:24', 4, 10362, 2),
(5, 5.0, '', '2025-12-16 22:57:29', 4, 10362, 3),
(6, 4.0, '', '2025-12-16 22:57:30', 4, 10362, 4),
(7, 5.0, '', '2025-12-16 22:57:31', 4, 10362, 5),
(8, 4.0, '', '2025-12-16 22:57:32', 4, 10362, 6),
(9, 3.0, '', '2025-12-16 22:57:34', 4, 10362, 7),
(10, 4.0, '', '2025-12-16 22:57:37', 4, 10362, 8),
(11, 5.0, '', '2025-12-16 22:57:38', 4, 10362, 9),
(12, 4.0, '', '2025-12-16 22:57:39', 4, 10362, 10),
(13, 4.0, 'Peak', '2025-12-16 22:57:44', 4, 10362, NULL),
(14, 4.0, 'delo', '2025-12-17 09:02:48', 4, 23934, NULL),
(15, 3.0, '', '2026-01-16 09:21:10', 5, 10362, 3),
(16, 1.0, '', '2026-01-16 09:21:12', 5, 10362, 5),
(17, 4.0, '', '2026-01-16 09:21:13', 5, 10362, 4),
(18, 3.0, '¨wygyhwh', '2026-01-16 09:21:15', 5, 10362, NULL),
(19, 1.0, '', '2026-04-26 13:24:09', 6, 87611, NULL),
(20, 1.0, '', '2026-04-26 13:24:10', 6, 87611, NULL),
(21, 1.0, 'as', '2026-04-26 13:24:12', 6, 87611, NULL),
(22, 5.0, 'a', '2026-04-26 13:24:30', 6, 73947, NULL),
(23, 5.0, '67', '2026-04-26 13:47:38', 8, 8883, NULL),
(24, 4.0, 'A', '2026-04-26 13:50:17', 6, 8883, NULL),
(25, 3.0, 'a', '2026-04-27 00:41:00', 6, 4170, NULL),
(26, 5.0, '', '2026-04-27 00:41:14', 6, 10362, NULL),
(27, 5.0, 's', '2026-04-27 00:41:16', 6, 10362, NULL),
(28, 3.0, 'as', '2026-05-28 08:51:31', 9, 10362, NULL),
(29, 4.0, '', '2026-05-28 08:54:23', 9, 11703, NULL),
(30, 4.0, 'we', '2026-05-28 08:54:26', 9, 11703, NULL),
(31, 3.0, 'da', '2026-05-28 09:01:57', 9, 23934, NULL),
(32, 5.0, '', '2026-05-28 09:13:46', 9, 10362, NULL),
(33, 5.0, 'as', '2026-05-28 09:13:47', 9, 10362, NULL),
(34, 1.0, 'awqef', '2026-05-28 09:46:50', 9, 11329, NULL),
(35, 1.0, '', '2026-05-31 19:37:56', 10, 23934, NULL),
(36, 1.0, 'as', '2026-05-31 19:37:59', 10, 23934, NULL),
(37, 5.0, 'peak', '2026-05-31 20:47:19', 9, 10362, NULL),
(38, 4.0, 'ea', '2026-05-31 21:02:11', 9, 38722, NULL),
(39, 2.0, 'das', '2026-06-03 09:11:32', 9, 4126, NULL),
(40, 4.0, 'wasfsdaasv sadv da', '2026-06-03 22:49:44', 10, 11329, NULL),
(41, 4.0, 'dsaop', '2026-06-07 18:36:27', 9, 38722, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `top_scores`
--

CREATE TABLE `top_scores` (
  `skore` int(11) DEFAULT NULL,
  `vyplata` int(11) DEFAULT NULL,
  `Users_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `Track_id` int(11) NOT NULL,
  `nazev` varchar(45) DEFAULT NULL,
  `delka` decimal(6,2) DEFAULT NULL,
  `poradi` int(11) DEFAULT NULL,
  `Albums_album_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--
-- Error reading structure for table needlespin.trades: #1932 - Table &#039;needlespin.trades&#039; doesn&#039;t exist in engine
-- Error reading data for table needlespin.trades: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `needlespin`.`trades`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `trade_offers`
--

CREATE TABLE `trade_offers` (
  `offer_id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `offered_user_album_id` int(11) NOT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trade_offers`
--

INSERT INTO `trade_offers` (`offer_id`, `listing_id`, `buyer_id`, `offered_user_album_id`, `status`, `created_at`) VALUES
(1, 1, 7, 123, 'accepted', '2026-02-23 14:12:02'),
(2, 1, 7, 123, 'rejected', '2026-02-23 14:12:18'),
(3, 2, 7, 121, 'accepted', '2026-02-23 14:34:21'),
(4, 3, 7, 123, 'accepted', '2026-02-25 07:49:34'),
(5, 4, 7, 126, 'accepted', '2026-02-25 09:41:26'),
(6, 5, 6, 60, 'rejected', '2026-04-26 11:49:17'),
(7, 5, 6, 128, 'accepted', '2026-04-26 11:49:29'),
(8, 6, 8, 154, 'pending', '2026-04-27 11:02:36'),
(9, 6, 9, 157, 'pending', '2026-06-01 18:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `uzivatelskeJmeno` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `Heslo_hash` varchar(255) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `ucet_vytvoren` datetime DEFAULT NULL,
  `hide_stats` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `uzivatelskeJmeno`, `email`, `Heslo_hash`, `body`, `ucet_vytvoren`, `hide_stats`) VALUES
(1, 'Nitro', 'simonnieves33@gmail.com', '$2y$10$uYaiHxrLs/EYO13VhD3XEOpYekvq0QZvDWLlJvRAqdcUPz0UOeQl2', 238, NULL, 0),
(2, 'proc1', 'SkibidiSigma@gmail.com', '$2y$10$rn2xEbHOPS7g1oFd/I0Z4OjREbgipihQVGZ1eXaWVCxRVeN4Ah9g6', 238, '2025-11-25 17:52:22', 0),
(3, 'wqew', 'pluh@gmail.com', '$2y$10$/7rjq8K7AkR5.a9MDDwgAeiMgpi3j8KoTOx6Dd41vqZC8VuV.Djgi', 0, '2025-12-03 09:31:25', 0),
(4, 'Roblox', 'Roblox@123.cz', '$2y$10$ZqOQp3vmqbXaE7eu0HukKusCdsXgetcoDpBago5pnKevNAOOjqjN6', 120, '2025-12-16 22:47:45', 0),
(5, 'Troska', 'fqa@gmail.com', '$2y$10$Zv3Df1TrCeUBjoUDpg8Ygew2F46zpNPw4yoQJOPJp2Vp.xTM5XLQK', 40, '2026-01-16 08:41:15', 0),
(6, 'PL', 'yo@g.cz', '$2y$10$owdCbr0FOpynyN5F8poByO0rl299YRxjRNbDB9J0SGqqZVBnPnllW', 10028113, '2026-02-07 09:52:00', 0),
(7, 'dadsa', 'fs@gmail.com', '$2y$10$bn/IJjy.2Ici7qgN3usfje6Yjry82co0r4f2J9XD3drntZ7JOK.x6', 900, '2026-02-23 15:10:09', 0),
(8, 'Nitro2', 'as@ga', '$2y$10$RrzgF0/okZAJHPy1l5s9gelXZCr4LYwM5vDo1FgaDIPwus8MIUwg.', 7210, '2026-04-26 13:39:34', 0),
(9, 'skibid', 'kda@gmail.com', '$2y$10$s8Mmgn8lnf6nImWK8U1vSuQofkvvknAOygLnFAuQ.d5wab/8ETWQm', 500, '2026-05-28 08:25:53', 1),
(10, 'pluhy', 'pluh1@gmail.com', '$2y$10$t/CEIW1m1h22W1lSh1yxtu/jFiT4nev5eQYv7LBkRC56FrZ3oUqM.', 99999900, '2026-05-28 08:31:39', 0),
(11, 'proc2', 'lfpa@afs.com', '$2y$10$0Ljh8RAj1R2TQGZ/o94EOeUZeLuz3VBvdQ7p9sPlcLpDRWWf/t/bG', 0, '2026-06-02 20:43:06', 0),
(12, 'skibid2', 'ascyx@af.csm', '$2y$10$mgs6a8PJrDZ/s0TAPj9E9.DWK3G9piQS5MNCaiv0kuYMQ6R44ZQ7S', 0, '2026-06-02 20:50:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_albums`
--

CREATE TABLE `user_albums` (
  `user_album_id` int(11) NOT NULL,
  `ziskano` varchar(45) DEFAULT NULL,
  `album_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_pack_id` int(11) NOT NULL,
  `sell_price` int(11) NOT NULL DEFAULT 25
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_albums`
--

INSERT INTO `user_albums` (`user_album_id`, `ziskano`, `album_id`, `user_id`, `from_pack_id`, `sell_price`) VALUES
(3, NULL, 467955, 6, 3, 25),
(5, NULL, 1100039, 6, 2, 25),
(6, NULL, 178268, 6, 3, 25),
(7, NULL, 1060525, 6, 3, 25),
(8, NULL, 2455447, 6, 5, 25),
(9, NULL, 266008, 6, 3, 25),
(10, NULL, 1055881, 6, 4, 25),
(11, NULL, 332452, 6, 3, 25),
(12, NULL, 3196791, 6, 4, 25),
(13, NULL, 1703263, 6, 3, 25),
(14, NULL, 1337234, 6, 4, 25),
(15, NULL, 158274, 6, 1, 25),
(16, NULL, 1213025, 6, 4, 25),
(17, NULL, 185084, 6, 1, 25),
(18, NULL, 349631, 6, 1, 25),
(19, NULL, 1119033, 6, 1, 25),
(20, NULL, 19831, 6, 1, 25),
(21, NULL, 291306, 6, 1, 25),
(22, NULL, 3463250, 6, 1, 25),
(23, NULL, 1138539, 6, 1, 25),
(24, NULL, 1709173, 6, 1, 25),
(25, NULL, 1420400, 6, 1, 25),
(26, NULL, 109443, 6, 1, 25),
(27, NULL, 66987, 6, 1, 25),
(28, NULL, 645124, 6, 1, 25),
(29, NULL, 604768, 6, 1, 25),
(30, NULL, 699137, 6, 4, 25),
(31, NULL, 2709590, 6, 4, 25),
(32, NULL, 672390, 6, 3, 25),
(33, NULL, 2081599, 6, 3, 25),
(34, NULL, 175190, 6, 1, 25),
(35, NULL, 722411, 6, 3, 25),
(36, NULL, 430132, 6, 3, 25),
(37, NULL, 705511, 6, 3, 25),
(38, NULL, 355441, 6, 3, 25),
(39, NULL, 184952, 6, 3, 25),
(40, NULL, 50954, 6, 1, 25),
(41, NULL, 737640, 6, 3, 25),
(42, NULL, 36252, 6, 3, 25),
(43, NULL, 1610867, 6, 3, 25),
(44, NULL, 1567083, 6, 2, 25),
(45, NULL, 858980, 6, 3, 25),
(46, NULL, 1080955, 6, 3, 25),
(47, NULL, 52028, 6, 1, 25),
(48, NULL, 105946, 6, 3, 25),
(49, NULL, 1605218, 6, 1, 25),
(50, NULL, 302390, 6, 3, 25),
(51, NULL, 202877, 6, 3, 25),
(52, NULL, 434691, 6, 4, 25),
(53, NULL, 509138, 6, 3, 25),
(54, NULL, 81753, 6, 1, 25),
(55, NULL, 695651, 6, 3, 25),
(56, NULL, 2947144, 6, 4, 25),
(57, NULL, 574568, 6, 3, 25),
(58, NULL, 901995, 6, 3, 25),
(59, NULL, 184941, 6, 3, 25),
(60, NULL, 79174, 6, 3, 25),
(61, NULL, 41779, 6, 3, 25),
(62, NULL, 530778, 6, 1, 25),
(63, NULL, 1331815, 6, 3, 25),
(64, NULL, 799983, 6, 3, 25),
(65, NULL, 4869, 6, 3, 25),
(66, NULL, 794896, 6, 3, 25),
(67, NULL, 257803, 6, 3, 25),
(68, NULL, 487769, 6, 1, 25),
(69, NULL, 281991, 6, 3, 25),
(70, NULL, 1471269, 6, 1, 25),
(71, NULL, 153405, 6, 1, 25),
(72, NULL, 1847072, 6, 1, 25),
(73, NULL, 6335, 6, 1, 25),
(74, NULL, 1266527, 6, 1, 25),
(75, NULL, 42877, 6, 1, 25),
(76, NULL, 76957, 6, 1, 25),
(77, NULL, 179601, 6, 3, 25),
(78, NULL, 612228, 6, 3, 25),
(79, NULL, 45302, 6, 2, 25),
(80, NULL, 33117, 6, 3, 25),
(81, NULL, 576800, 6, 4, 25),
(82, NULL, 3433181, 6, 4, 25),
(88, NULL, 3878, 6, 3, 25),
(89, NULL, 130371, 6, 1, 25),
(90, NULL, 295002, 6, 1, 25),
(91, NULL, 23731, 6, 3, 25),
(92, NULL, 71368, 6, 2, 25),
(93, NULL, 41722, 6, 3, 25),
(94, NULL, 1184947, 6, 2, 25),
(95, NULL, 23731, 6, 3, 25),
(96, NULL, 45284, 6, 3, 25),
(97, NULL, 884682, 6, 2, 25),
(98, NULL, 56985, 6, 1, 25),
(99, NULL, 3029807, 6, 1, 25),
(100, NULL, 74519, 6, 3, 25),
(101, NULL, 34167, 6, 1, 25),
(102, NULL, 7877, 6, 1, 25),
(103, NULL, 49182, 6, 2, 25),
(104, NULL, 1571782, 6, 1, 25),
(105, NULL, 44148, 6, 3, 25),
(106, NULL, 861083, 6, 3, 25),
(107, NULL, 740609, 6, 1, 25),
(108, NULL, 43063, 6, 3, 25),
(109, NULL, 1208104, 6, 1, 25),
(110, NULL, 2807150, 6, 1, 25),
(111, NULL, 698199, 6, 1, 25),
(112, NULL, 2125414, 6, 1, 25),
(113, NULL, 32461, 6, 1, 25),
(114, NULL, 87474, 6, 2, 25),
(115, NULL, 1013735, 6, 4, 25),
(116, NULL, 50985, 6, 1, 25),
(117, NULL, 293609, 6, 1, 25),
(118, NULL, 20145, 6, 1, 25),
(119, NULL, 63247, 6, 1, 25),
(120, NULL, 46381, 6, 1, 25),
(121, NULL, 73947, 6, 1, 25),
(122, NULL, 87611, 6, 2, 25),
(123, NULL, 4410, 6, 3, 25),
(124, NULL, 13773, 6, 3, 25),
(126, NULL, 22420, 6, 3, 25),
(127, NULL, 530, 7, 3, 50),
(128, NULL, 84954, 8, 4, 25),
(129, NULL, 46470, 8, 1, 25),
(130, NULL, 459684, 8, 1, 50),
(131, NULL, 141637, 8, 1, 50),
(132, NULL, 145852, 8, 1, 25),
(133, NULL, 12854, 8, 1, 25),
(134, NULL, 101755, 8, 1, 25),
(135, NULL, 1135296, 8, 1, 50),
(136, NULL, 47622, 8, 1, 25),
(137, NULL, 264119, 8, 1, 25),
(138, NULL, 122350, 8, 1, 25),
(139, NULL, 48681, 8, 3, 25),
(140, NULL, 5948, 8, 3, 25),
(141, NULL, 1929, 8, 3, 25),
(142, NULL, 4785, 8, 3, 25),
(143, NULL, 43964, 8, 3, 25),
(144, NULL, 3354, 8, 3, 25),
(145, NULL, 52668, 8, 3, 50),
(146, NULL, 77579, 8, 3, 50),
(147, NULL, 4126, 8, 3, 25),
(148, NULL, 1250553, 8, 3, 50),
(149, NULL, 390739, 8, 3, 25),
(150, NULL, 32320, 8, 1, 25),
(151, NULL, 150723, 8, 1, 25),
(152, NULL, 2125414, 8, 1, 25),
(153, NULL, 19910, 8, 1, 25),
(154, NULL, 30569, 8, 2, 25),
(155, NULL, 8883, 6, 2, 25),
(156, NULL, 1212427, 8, 2, 25),
(157, NULL, 38485, 9, 1, 25),
(158, NULL, 8470, 10, 1, 25),
(159, NULL, 52708, 9, 1, 25),
(160, NULL, 3672621, 9, 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `user_quests`
--

CREATE TABLE `user_quests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `progres` int(11) DEFAULT 0,
  `dokonceno` tinyint(1) DEFAULT 0,
  `prideleno_dne` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_quests`
--

INSERT INTO `user_quests` (`id`, `user_id`, `quest_id`, `progres`, `dokonceno`, `prideleno_dne`) VALUES
(1, 6, 1, 3, 1, '2026-03-26'),
(2, 6, 2, 100, 1, '2026-03-26'),
(3, 6, 3, 20, 1, '2026-03-26'),
(4, 6, 4, 1000, 1, '2026-03-26'),
(5, 6, 5, 31, 0, '2026-03-26'),
(6, 6, 6, 5000, 1, '2026-03-26'),
(7, 6, 1, 3, 1, '2026-03-27'),
(8, 6, 2, 100, 1, '2026-03-27'),
(9, 6, 1, 0, 0, '2026-04-26'),
(10, 6, 2, 0, 0, '2026-04-26'),
(11, 6, 3, 0, 0, '2026-04-26'),
(12, 6, 4, 0, 0, '2026-04-26'),
(13, 6, 5, 0, 0, '2026-04-26'),
(14, 6, 6, 0, 0, '2026-04-26'),
(15, 6, 1, 0, 0, '2026-04-27'),
(16, 6, 2, 0, 0, '2026-04-27'),
(17, 6, 3, 0, 0, '2026-04-27'),
(18, 6, 4, 0, 0, '2026-04-27'),
(19, 9, 1, 3, 1, '2026-06-01'),
(20, 9, 2, 0, 0, '2026-06-01'),
(21, 9, 3, 20, 1, '2026-06-01'),
(22, 9, 4, 146, 0, '2026-06-01'),
(23, 9, 5, 21, 0, '2026-06-01'),
(24, 9, 6, 146, 0, '2026-06-01'),
(25, 9, 1, 0, 0, '2026-06-02'),
(26, 9, 2, 0, 0, '2026-06-02'),
(27, 10, 1, 3, 1, '2026-06-03'),
(28, 10, 2, 10, 0, '2026-06-03'),
(29, 10, 3, 6, 0, '2026-06-03'),
(30, 10, 4, 10, 0, '2026-06-03'),
(31, 10, 5, 6, 0, '2026-06-03'),
(32, 10, 6, 10, 0, '2026-06-03'),
(33, 10, 1, 0, 0, '2026-06-04'),
(34, 10, 2, 0, 0, '2026-06-04'),
(35, 9, 1, 3, 1, '2026-06-04'),
(36, 9, 2, 100, 1, '2026-06-04'),
(37, 9, 1, 0, 0, '2026-06-05'),
(38, 9, 2, 0, 0, '2026-06-05'),
(39, 9, 1, 0, 0, '2026-06-06'),
(40, 9, 2, 0, 0, '2026-06-06'),
(41, 9, 1, 3, 1, '2026-06-07'),
(42, 9, 2, 15, 0, '2026-06-07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `Artists_Artist_id` (`Artists_Artist_id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`Artist_id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`follower_id`,`following_id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_friendship` (`user_id`,`friend_id`),
  ADD KEY `fk_friend` (`friend_id`);

--
-- Indexes for table `game_history`
--
ALTER TABLE `game_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `market_listings`
--
ALTER TABLE `market_listings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `user_album_id` (`user_album_id`);

--
-- Indexes for table `music_packs`
--
ALTER TABLE `music_packs`
  ADD PRIMARY KEY (`Pack_id`);

--
-- Indexes for table `music_packs_has_albums`
--
ALTER TABLE `music_packs_has_albums`
  ADD PRIMARY KEY (`Music_packs_Pack_id`,`Albums_album_id`),
  ADD KEY `Albums_album_id` (`Albums_album_id`);

--
-- Indexes for table `quests`
--
ALTER TABLE `quests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `Users_user_id` (`Users_user_id`),
  ADD KEY `Albums_album_id` (`Albums_album_id`);

--
-- Indexes for table `top_scores`
--
ALTER TABLE `top_scores`
  ADD PRIMARY KEY (`Users_user_id`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`Track_id`),
  ADD KEY `Albums_album_id` (`Albums_album_id`);

--
-- Indexes for table `trade_offers`
--
ALTER TABLE `trade_offers`
  ADD PRIMARY KEY (`offer_id`),
  ADD KEY `listing_id` (`listing_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `offered_user_album_id` (`offered_user_album_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_albums`
--
ALTER TABLE `user_albums`
  ADD PRIMARY KEY (`user_album_id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `from_pack_id` (`from_pack_id`);

--
-- Indexes for table `user_quests`
--
ALTER TABLE `user_quests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `quest_id` (`quest_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `album_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3672622;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `Artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `game_history`
--
ALTER TABLE `game_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `market_listings`
--
ALTER TABLE `market_listings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `music_packs`
--
ALTER TABLE `music_packs`
  MODIFY `Pack_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quests`
--
ALTER TABLE `quests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tracks`
--
ALTER TABLE `tracks`
  MODIFY `Track_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trade_offers`
--
ALTER TABLE `trade_offers`
  MODIFY `offer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_albums`
--
ALTER TABLE `user_albums`
  MODIFY `user_album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `user_quests`
--
ALTER TABLE `user_quests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`Artists_Artist_id`) REFERENCES `artists` (`Artist_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `fk_friend` FOREIGN KEY (`friend_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `game_history`
--
ALTER TABLE `game_history`
  ADD CONSTRAINT `game_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `market_listings`
--
ALTER TABLE `market_listings`
  ADD CONSTRAINT `market_listings_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `market_listings_ibfk_2` FOREIGN KEY (`user_album_id`) REFERENCES `user_albums` (`user_album_id`) ON DELETE CASCADE;

--
-- Constraints for table `music_packs_has_albums`
--
ALTER TABLE `music_packs_has_albums`
  ADD CONSTRAINT `music_packs_has_albums_ibfk_1` FOREIGN KEY (`Music_packs_Pack_id`) REFERENCES `music_packs` (`Pack_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `music_packs_has_albums_ibfk_2` FOREIGN KEY (`Albums_album_id`) REFERENCES `albums` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`Users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`Albums_album_id`) REFERENCES `albums` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `top_scores`
--
ALTER TABLE `top_scores`
  ADD CONSTRAINT `top_scores_ibfk_1` FOREIGN KEY (`Users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `tracks_ibfk_1` FOREIGN KEY (`Albums_album_id`) REFERENCES `albums` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trade_offers`
--
ALTER TABLE `trade_offers`
  ADD CONSTRAINT `trade_offers_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `market_listings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trade_offers_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trade_offers_ibfk_3` FOREIGN KEY (`offered_user_album_id`) REFERENCES `user_albums` (`user_album_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_albums`
--
ALTER TABLE `user_albums`
  ADD CONSTRAINT `user_albums_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_albums_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_albums_ibfk_3` FOREIGN KEY (`from_pack_id`) REFERENCES `music_packs` (`Pack_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_quests`
--
ALTER TABLE `user_quests`
  ADD CONSTRAINT `user_quests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_quests_ibfk_2` FOREIGN KEY (`quest_id`) REFERENCES `quests` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
