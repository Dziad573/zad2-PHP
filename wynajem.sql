-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Sty 2023, 17:36
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `auta`
--
CREATE DATABASE IF NOT EXISTS `auta` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `auta`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasa`
--

CREATE TABLE `klasa` (
  `id` int(11) NOT NULL,
  `klasa` varchar(1) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `klasa`
--

INSERT INTO `klasa` (`id`, `klasa`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `nazwisko` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `imie` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `pesel` varchar(11) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id`, `nazwisko`, `imie`, `pesel`) VALUES
(1, 'Kowalski', 'Jan', ''),
(2, 'Nowak', 'Antoni', ''),
(3, 'Lipska', 'Ewa', ''),
(4, 'Ludwikowski', 'Tadeusz', ''),
(5, 'Marcinek', 'Adam', ''),
(6, 'Szymanek', 'Anna', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochody`
--

CREATE TABLE `samochody` (
  `id` int(11) NOT NULL,
  `klasa_id` int(11) NOT NULL,
  `marka` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `model` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `rocznik` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `samochody`
--

INSERT INTO `samochody` (`id`, `klasa_id`, `marka`, `model`, `rocznik`) VALUES
(1, 1, 'ford', 'ka', 2017),
(2, 2, 'seat', 'toledo', 2016),
(3, 3, 'opel', 'zafira', 2018),
(4, 2, 'fiat', '500X', 2018),
(5, 3, 'opel', 'insignia', 2017);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenia`
--

CREATE TABLE `wypozyczenia` (
  `id` int(11) NOT NULL,
  `klienci_id` int(11) NOT NULL,
  `samochody_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `ilosc_dni` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `wypozyczenia`
--

INSERT INTO `wypozyczenia` (`id`, `klienci_id`, `samochody_id`, `data`, `ilosc_dni`) VALUES
(1, 6, 4, '2020-05-22', 2),
(2, 1, 5, '2020-06-18', 3),
(3, 2, 4, '2020-05-15', 2),
(4, 1, 3, '2020-06-30', 3),
(5, 3, 4, '2020-09-07', 1),
(6, 4, 3, '2020-09-02', 5),
(7, 5, 2, '2020-09-20', 3);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klasa`
--
ALTER TABLE `klasa`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klasa_id_fk` (`klasa_id`);

--
-- Indeksy dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `samochody_id_fk` (`samochody_id`),
  ADD KEY `klienci_id_fk` (`klienci_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `klasa`
--
ALTER TABLE `klasa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `samochody`
--
ALTER TABLE `samochody`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD CONSTRAINT `klasa_id_fk` FOREIGN KEY (`klasa_id`) REFERENCES `klasa` (`id`);

--
-- Ograniczenia dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD CONSTRAINT `klienci_id_fk` FOREIGN KEY (`klienci_id`) REFERENCES `klienci` (`id`),
  ADD CONSTRAINT `samochody_id_fk` FOREIGN KEY (`samochody_id`) REFERENCES `samochody` (`id`);
--
-- Baza danych: `baza`
--
CREATE DATABASE IF NOT EXISTS `baza` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `baza`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hobby`
--

CREATE TABLE `hobby` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `hobby`
--

INSERT INTO `hobby` (`id`, `nazwa`) VALUES
(1, 'muzyka'),
(2, 'film'),
(3, 'biegi'),
(4, 'gimnastyka'),
(5, 'taniec'),
(6, 'komputery'),
(7, 'krymina?y'),
(8, 'nauka'),
(9, 'majsterkowanie'),
(10, 'samochody'),
(11, 'turystyka'),
(12, 'biologia'),
(13, 'sudoku'),
(14, 'numizmatyka'),
(15, 'znaczki pocztowe'),
(16, 'modelarstwo');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoby`
--

CREATE TABLE `osoby` (
  `id` int(10) UNSIGNED NOT NULL,
  `Hobby_id` int(10) UNSIGNED NOT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `rok_urodzenia` year(4) DEFAULT NULL,
  `opis` text DEFAULT NULL,
  `zdjecie` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `osoby`
--

INSERT INTO `osoby` (`id`, `Hobby_id`, `imie`, `nazwisko`, `rok_urodzenia`, `opis`, `zdjecie`) VALUES
(2, 1, 'Monika', 'Kowalska', 1976, 'Z checia Ciebie poznam', 'osoba1.jpg'),
(3, 3, 'Jan', 'Kowalski', 2002, 'Lubie sport', 'osoba5.jpg'),
(4, 5, 'Monika', 'Nowak', 1993, 'ello', 'osoba2.jpg'),
(5, 11, 'Anna', 'Kowalska', 2002, 'Rzym jest cudny!', 'osoba3.jpg'),
(6, 6, 'Grzegorz', 'Konieczny', 1983, 'Polecam nowy procesor XS756FFT', 'osoba6.jpg'),
(7, 3, 'Monika', 'Kopacz', 2009, 'dzi? rano 5 km', 'osoba1.jpg'),
(8, 3, 'Rysiek', 'Kowalski', 1993, 'Pobiegamy razem?', 'osoba7.jpg'),
(9, 12, 'Ewa', 'Krzak', 2008, 'pozdrawiam wszystkich', 'osoba1.jpg'),
(10, 3, 'Roksana', 'Rybnik', 1995, 'pozdrawiam', 'osoba3.jpg'),
(11, 15, 'Grzegorz', 'Roh', 1983, 'Poszukuje znaczkow z 1967 roku', 'osoba6.jpg'),
(12, 11, 'Monika', 'Kowalewska', 1976, 'Z checi? Ciebie poznam', 'osoba1.jpg'),
(13, 16, 'Jan', 'Trzeciak', 2006, 'moje nowe dzielo', 'osoba5.jpg'),
(14, 5, 'Joanna', 'Rysik', 1993, 'hej1', 'osoba2.jpg'),
(15, 10, 'Anna', 'Kownacka', 2003, 'Szukam przyjaciol', 'osoba3.jpg'),
(16, 6, 'Grzegorz', 'Konieczny', 1983, 'Polecam nowy procesor XS756FFT', 'osoba6.jpg'),
(17, 1, 'Monika', 'Lewandowska', 1967, 'slucham Rocka', 'osoba4.jpg'),
(18, 3, 'Ernest', 'Lubomirski', 2004, 'Pobiegamy razem?', 'osoba8.jpg'),
(19, 6, 'Monika', 'Nowak', 1993, 'ello', 'osoba2.jpg'),
(20, 6, 'Anna', 'Kowalska', 2002, 'Rzym jest cudny!', 'osoba3.jpg'),
(21, 6, 'Grzegorz', 'Konieczny', 1983, 'Polecam nowy procesor XS756FFT', 'osoba6.jpg'),
(22, 2, 'Monika', 'Kowalska', 1976, 'Z checia Ciebie poznam', 'osoba1.jpg'),
(23, 3, 'Jan', 'Kowalski', 2002, 'Lubie sport', 'osoba5.jpg'),
(24, 3, 'Monika', 'Nowak', 1993, 'ello', 'osoba2.jpg'),
(25, 4, 'Anna', 'Kowalska', 2002, 'nowy opis', 'osoba3.jpg'),
(26, 5, 'Grzegorz', 'Konieczny', 1983, 'Polecam nowy procesor XS756FFT', 'osoba6.jpg'),
(27, 6, 'Monika', 'Kopacz', 2009, 'dzi? rano 5 km', 'osoba1.jpg'),
(28, 7, 'Rysiek', 'Kowalski', 1993, 'Pobiegamy razem?', 'osoba7.jpg'),
(29, 7, 'Ewa', 'Krzak', 2008, 'pozdrawiam wszystkich', 'osoba1.jpg'),
(30, 8, 'Roksana', 'Rybnik', 1995, 'pozdrawiam', 'osoba3.jpg'),
(31, 8, 'Grzegorz', 'Roh', 1983, 'Poszukuje znaczkow z 1967 roku', 'osoba6.jpg'),
(32, 9, 'Monika', 'Kowalewska', 1976, 'Z checi? Ciebie poznam', 'osoba1.jpg'),
(33, 12, 'Jan', 'Trzeciak', 2006, 'moje nowe dzielo', 'osoba5.jpg'),
(34, 13, 'Joanna', 'Rysik', 1993, 'hej1', 'osoba2.jpg'),
(35, 14, 'Anna', 'Kownacka', 2003, 'Szukam przyjaciol', 'osoba3.jpg'),
(36, 15, 'Grzegorz', 'Konieczny', 1983, 'Polecam nowy procesor XS756FFT', 'osoba6.jpg'),
(37, 1, 'Monika', 'Lewandowska', 1967, 'slucham Rocka', 'osoba4.jpg'),
(38, 3, 'Ernest', 'Lubomirski', 2004, 'Pobiegamy razem?', 'osoba8.jpg'),
(39, 6, 'Monika', 'Nowak', 1993, 'ello', 'osoba2.jpg'),
(40, 6, 'Anna', 'Kowalska', 2002, 'Rzym jest cudny!', 'osoba3.jpg'),
(41, 6, 'Grzegorz', 'Konieczny', 1983, 'Polecam nowy procesor XS756FFT', 'osoba6.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producenci`
--

CREATE TABLE `producenci` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` varchar(100) DEFAULT NULL,
  `adres` varchar(100) DEFAULT NULL,
  `miasto` varchar(20) DEFAULT NULL,
  `rokWspolpraca` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `producenci`
--

INSERT INTO `producenci` (`id`, `nazwa`, `adres`, `miasto`, `rokWspolpraca`) VALUES
(4, 'warzywa-rolnik', '12', 'Jany', 1990),
(5, 'Owoce-rolnik', '23', 'Kosatka', 2010),
(6, 'Owoce4You', '2', 'Jany', 1990),
(7, 'Warzywa4You', '65', 'Krasznice', 2015),
(8, 'FruitFarm', '1', 'Jany', 2001),
(9, 'VideoFun', 'Cybernetyki 3', 'Warszawa', 2000),
(10, 'Video', 'Harcerska 3', 'Tychy', 2010),
(11, 'NaszeFilmy', '23 Kwietnia 44', 'Szczecin', 1990);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `id` int(10) UNSIGNED NOT NULL,
  `Rodzaje_id` int(10) UNSIGNED NOT NULL,
  `Producenci_id` int(10) UNSIGNED NOT NULL,
  `nazwa` varchar(100) DEFAULT NULL,
  `ilosc` double DEFAULT NULL,
  `opis` text DEFAULT NULL,
  `cena` double DEFAULT NULL,
  `zdjecie` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `produkty`
--

INSERT INTO `produkty` (`id`, `Rodzaje_id`, `Producenci_id`, `nazwa`, `ilosc`, `opis`, `cena`, `zdjecie`) VALUES
(1, 1, 8, 'gruszka', 20, 'Klaps', 2.56, 'gruszka.jpg'),
(2, 1, 6, 'morela', 30, '', 5.78, 'morela.jpg'),
(3, 1, 8, 'arbuz', 2, 'czerwony', 2.56, 'arbuz.jpg'),
(4, 1, 5, 'papaja', 5, '', 6.99, 'papaja.jpg'),
(5, 2, 4, 'marchew', 100, '', 1.56, 'marchew.jpg'),
(6, 2, 7, 'ziemniak', 120, 'irys', 3.33, 'ziemniak.jpg'),
(7, 2, 7, 'koper', 2, 'natka', 1.56, 'koper.jpg'),
(8, 2, 4, 'papryka', 50, 'zielona', 10.99, 'papryka.jpg'),
(9, 12, 10, 'Star Wars 1', 1, 'Luke Skywalker i ksi??niczka Leia w walce z ciemn? stron? mocy', 25, 'star-wars.jpg'),
(10, 7, 9, 'Alien', 1, 'Za?oga statku kosmicznego Nostromo odbiera tajemniczy sygna? i l?duje na niewielkiej planetoidzie, gdzie jeden z jej cz?onków zostaje zaatakowany przez obc? form? ?ycia.', 20, 'alien.jpg'),
(11, 12, 10, 'E.T.', 1, 'Przybysz z innej planety zaprzyja?nia si? z ch?opcem i jego rodzin?.', 30, 'et.jpg'),
(12, 7, 9, 'Alien2', 1, 'Za?oga statku kosmicznego Nostromo odbiera tajemniczy sygna? i l?duje na niewielkiej planetoidzie, gdzie jeden z jej cz?onków zostaje zaatakowany przez obc? form? ?ycia.', 20, 'alien.jpg'),
(13, 12, 10, 'hobbit2', 1, 'Hobbit Bilbo Baggins wyrusza w niebezpieczn? podro?, by wraz z czarodziejem Gandalfem i trzynastoma krasnoludami pokona? smoka Smauga.', 30, 'hobbit.jpg'),
(14, 12, 10, 'Fantasy2', 1, 'Elfy, krasnoludy i inne fantastyczne itstoty w walce o swoj? planet?.', 10, 'fantasy.jpg'),
(15, 7, 9, 'Alien3', 1, 'Za?oga statku kosmicznego Nostromo odbiera tajemniczy sygna? i l?duje na niewielkiej planetoidzie, gdzie jeden z jej cz?onków zostaje zaatakowany przez obc? form? ?ycia.', 20, 'alien.jpg'),
(16, 12, 10, 'hobbit3', 1, 'Hobbit Bilbo Baggins wyrusza w niebezpieczn? podro?, by wraz z czarodziejem Gandalfem i trzynastoma krasnoludami pokona? smoka Smauga.', 30, 'hobbit.jpg'),
(17, 12, 10, 'Star Wars 2', 1, 'Luke Skywalker i ksi??niczka Leia w walce z ciemn? stron? mocy', 25, 'star-wars.jpg'),
(18, 7, 9, 'Alien4', 1, 'Za?oga statku kosmicznego Nostromo odbiera tajemniczy sygna? i l?duje na niewielkiej planetoidzie, gdzie jeden z jej cz?onków zostaje zaatakowany przez obc? form? ?ycia.', 20, 'alien.jpg'),
(19, 12, 10, 'Fantasy', 1, 'Elfy, krasnoludy i inne fantastyczne itstoty w walce o swoj? planet?.', 10, 'fantasy.jpg'),
(20, 12, 10, 'Star Wars 3', 1, 'Luke Skywalker i ksi??niczka Leia w walce z ciemn? stron? mocy', 25, 'star-wars.jpg'),
(21, 12, 10, 'hobbit', 1, 'Hobbit Bilbo Baggins wyrusza w niebezpieczn? podro?, by wraz z czarodziejem Gandalfem i trzynastoma krasnoludami pokona? smoka Smauga.', 30, 'hobbit.jpg'),
(22, 11, 11, 'Koralowa wyspa', 1, 'Hamprey Bogart w jednej ze swoich wielkich ról.', 10, 'koralowa_wyspa.jpg'),
(23, 13, 10, 'krokodyl', 1, 'Gigantyczny krokodyl atakuje pewne miasto.', 10, 'krokodyl.jpg'),
(24, 12, 10, 'Star Wars 4', 1, 'Luke Skywalker i ksi??niczka Leia w walce z ciemn? stron? mocy', 25, 'star-wars.jpg'),
(25, 12, 10, 'SteamPunk', 1, 'Wizja postapokaliptycznej planety', 15, 'steampunk.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaje`
--

CREATE TABLE `rodzaje` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `rodzaje`
--

INSERT INTO `rodzaje` (`id`, `nazwa`) VALUES
(1, 'owoce'),
(2, 'warzywa'),
(3, 'oleje'),
(4, 'soki'),
(5, 'sery'),
(6, 'slodycze'),
(7, 'horrory'),
(8, 'kryminalne'),
(9, 'komedie'),
(10, 'familijne'),
(11, 'obyczajowe'),
(12, 'fantastyczne'),
(13, 'przygodowe');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `hobby`
--
ALTER TABLE `hobby`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `producenci`
--
ALTER TABLE `producenci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rodzaje`
--
ALTER TABLE `rodzaje`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `hobby`
--
ALTER TABLE `hobby`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `osoby`
--
ALTER TABLE `osoby`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT dla tabeli `producenci`
--
ALTER TABLE `producenci`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT dla tabeli `rodzaje`
--
ALTER TABLE `rodzaje`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Baza danych: `baza-wordpress`
--
CREATE DATABASE IF NOT EXISTS `baza-wordpress` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `baza-wordpress`;
--
-- Baza danych: `choinki`
--
CREATE DATABASE IF NOT EXISTS `choinki` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `choinki`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `choinka`
--

CREATE TABLE `choinka` (
  `Cena - typ rzeczywisty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `choinka1`
--

CREATE TABLE `choinka1` (
  `id_choinki` int(11) NOT NULL,
  `Gatunek` text NOT NULL,
  `Rozmiar` text NOT NULL,
  `Cena - typ rzeczywisty` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `choinkaa`
--

CREATE TABLE `choinkaa` (
  `id_choinki` int(11) NOT NULL,
  `Gatunek` text NOT NULL,
  `Rozmiar` text NOT NULL,
  `Cena - typ rzeczywisty` float NOT NULL,
  `Pochodzenie` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `choinkaa`
--

INSERT INTO `choinkaa` (`id_choinki`, `Gatunek`, `Rozmiar`, `Cena - typ rzeczywisty`, `Pochodzenie`) VALUES
(0, 'Świerk kłujacy (świerk srebrny)', 'średnia', 59.69, ' Ameryka Północna'),
(1, 'Świerk pospolity\r\n', 'mała', 144.99, ' Europa'),
(2, 'Sosna pospolita', 'mała', 130.49, 'Europa Północna i Środkowa'),
(3, 'Jodła pospolita', 'duża', 180.99, 'środkowa i południowa Europa'),
(4, 'Choinka kanadyjska', 'duża', 210.99, 'Ameryka Północna');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `choinkaa`
--
ALTER TABLE `choinkaa`
  ADD PRIMARY KEY (`id_choinki`);
--
-- Baza danych: `ee09`
--
CREATE DATABASE IF NOT EXISTS `ee09` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ee09`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dyspozytorzy`
--

CREATE TABLE `dyspozytorzy` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `dyspozytorzy`
--

INSERT INTO `dyspozytorzy` (`id`, `imie`, `nazwisko`) VALUES
(1, 'Ewelina', 'Nowak'),
(2, 'Krzysztof', 'Kowalewski'),
(3, 'Joanna', 'Pospieszalska'),
(4, 'Jan', 'Winny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `karty_wedkarskie`
--

CREATE TABLE `karty_wedkarskie` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `adres` text DEFAULT NULL,
  `data_zezwolenia` date DEFAULT NULL,
  `punkty` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `karty_wedkarskie`
--

INSERT INTO `karty_wedkarskie` (`id`, `imie`, `nazwisko`, `adres`, `data_zezwolenia`, `punkty`) VALUES
(1, 'Jan', 'Kowalski', 'Warszawa, Aleje Jerozolimskie 65/4', '2018-02-15', 23),
(2, 'Andrzej', 'Nowak', 'Poznan, Dabowskiego 16/4', '2018-03-12', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lowisko`
--

CREATE TABLE `lowisko` (
  `id` int(10) UNSIGNED NOT NULL,
  `Ryby_id` int(10) UNSIGNED NOT NULL,
  `akwen` text DEFAULT NULL,
  `wojewodztwo` text DEFAULT NULL,
  `rodzaj` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `lowisko`
--

INSERT INTO `lowisko` (`id`, `Ryby_id`, `akwen`, `wojewodztwo`, `rodzaj`) VALUES
(1, 2, 'Zalew Wegrowski', 'Mazowieckie', 4),
(2, 3, 'Zbiornik Bukowka', 'Dolnoslaskie', 2),
(3, 2, 'Jeziorko Bartbetowskie', 'Warminsko-Mazurskie', 2),
(4, 1, 'Warta-Obrzycko', 'Wielkopolskie', 3),
(5, 2, 'Stawy Milkow', 'Podkarpackie', 5),
(6, 7, 'Przemsza k. Okradzinowa', 'Slaskie', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `okres_ochronny`
--

CREATE TABLE `okres_ochronny` (
  `id` int(10) UNSIGNED NOT NULL,
  `Ryby_id` int(10) UNSIGNED NOT NULL,
  `od_miesiaca` int(10) UNSIGNED DEFAULT NULL,
  `do_miesiaca` int(10) UNSIGNED DEFAULT NULL,
  `wymiar_ochronny` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `okres_ochronny`
--

INSERT INTO `okres_ochronny` (`id`, `Ryby_id`, `od_miesiaca`, `do_miesiaca`, `wymiar_ochronny`) VALUES
(1, 1, 1, 4, 50),
(2, 2, 0, 0, 30),
(3, 3, 1, 5, 50),
(4, 4, 0, 0, 15),
(5, 5, 11, 6, 70),
(6, 6, 0, 0, 0),
(7, 7, 0, 0, 0),
(8, 8, 0, 0, 25);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `publikacje`
--

CREATE TABLE `publikacje` (
  `id` int(11) NOT NULL,
  `tytul` text DEFAULT NULL,
  `rok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ratownicy`
--

CREATE TABLE `ratownicy` (
  `id` int(10) UNSIGNED NOT NULL,
  `nrKaretki` int(10) UNSIGNED DEFAULT NULL,
  `ratownik1` text DEFAULT NULL,
  `ratownik2` text DEFAULT NULL,
  `ratownik3` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ratownicy`
--

INSERT INTO `ratownicy` (`id`, `nrKaretki`, `ratownik1`, `ratownik2`, `ratownik3`) VALUES
(1, 10, 'Krzysztof Lewandowski', 'Janina Gawlowska', 'Ewa Krasinska'),
(2, 8, 'Robert Marciniak', 'Robert Bialy', 'Krystyna Kowalska'),
(3, 45, 'Tomasz Kos', 'Janusz Sowa', 'Grzegorz Witkowski'),
(4, 13, 'Krzysztof Jerzykowski', 'Jan Niepokorski', 'Waldemar Skory'),
(5, 20, 'Adam Nowak', 'Jan Kowalski', 'Anna Nowakowska'),
(6, 6, 'qqq', 'qq', 'q');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ryby`
--

CREATE TABLE `ryby` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` text DEFAULT NULL,
  `wystepowanie` text DEFAULT NULL,
  `styl_zycia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ryby`
--

INSERT INTO `ryby` (`id`, `nazwa`, `wystepowanie`, `styl_zycia`) VALUES
(1, 'Szczupak', 'stawy, rzeki', 1),
(2, 'Karp', 'stawy, jeziora', 2),
(3, 'Sandacz', 'stawy, jeziora, rzeki', 1),
(4, 'Okon', 'rzeki', 1),
(5, 'Sum', 'jeziora, rzeki', 1),
(6, 'Dorsz', 'morza, oceany', 1),
(7, 'Leszcz', 'jeziora', 2),
(8, 'Lin', 'jeziora', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `telefon` text DEFAULT NULL,
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`id`, `imie`, `nazwisko`, `telefon`, `email`) VALUES
(1, 'Anna', 'Kowalska', '601601601', 'anna@poczta.pl'),
(2, 'Jan', 'Nowak', '608608608', 'jan@poczta.pl'),
(3, 'Jolanta', 'Jasny', '606606606', 'jolanta@poczta.pl'),
(4, 'qqq', 'www', '345', 'dsfsdklfs@daskl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyniki`
--

CREATE TABLE `wyniki` (
  `id` int(10) UNSIGNED NOT NULL,
  `dyscyplina_id` int(10) UNSIGNED NOT NULL,
  `sportowiec_id` int(10) UNSIGNED NOT NULL,
  `wynik` decimal(5,2) DEFAULT NULL,
  `dataUstanowienia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wyniki`
--

INSERT INTO `wyniki` (`id`, `dyscyplina_id`, `sportowiec_id`, `wynik`, `dataUstanowienia`) VALUES
(1, 1, 1, '12.40', '2015-10-14'),
(2, 1, 1, '12.00', '2015-10-06'),
(3, 1, 2, '11.80', '2015-10-14'),
(4, 1, 2, '11.90', '2015-10-06'),
(5, 1, 3, '11.50', '2015-10-14'),
(6, 1, 3, '11.56', '2015-10-06'),
(7, 1, 4, '11.70', '2015-10-14'),
(8, 1, 4, '11.67', '2015-10-06'),
(9, 1, 5, '11.30', '2015-10-14'),
(10, 1, 5, '11.52', '2015-10-06'),
(11, 1, 6, '12.10', '2015-10-14'),
(12, 1, 6, '12.00', '2015-10-06'),
(13, 3, 1, '63.00', '2015-11-11'),
(14, 3, 1, '63.60', '2015-10-13'),
(15, 3, 2, '64.00', '2015-11-11'),
(16, 3, 2, '63.60', '2015-10-13'),
(17, 3, 3, '60.00', '2015-11-11'),
(18, 3, 3, '61.60', '2015-10-13'),
(19, 3, 4, '63.50', '2015-11-11'),
(20, 3, 4, '63.60', '2015-10-13'),
(21, 3, 5, '70.00', '2015-10-07'),
(22, 3, 6, '68.00', '2015-10-07');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id` int(10) UNSIGNED NOT NULL,
  `Samochody_id` int(10) UNSIGNED NOT NULL,
  `Klient` text DEFAULT NULL,
  `telefon` text DEFAULT NULL,
  `dataZam` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `Samochody_id`, `Klient`, `telefon`, `dataZam`) VALUES
(1, 3, 'Anna Kowalska', '111222333', '2016-02-15'),
(2, 6, 'Jan Nowakowski', '222111333', '2016-02-15'),
(3, 8, 'Marcin Kolwal', '333111222', '2016-02-15');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawody_wedkarskie`
--

CREATE TABLE `zawody_wedkarskie` (
  `id` int(10) UNSIGNED NOT NULL,
  `Karty_wedkarskie_id` int(10) UNSIGNED NOT NULL,
  `Lowisko_id` int(10) UNSIGNED NOT NULL,
  `data_zawodow` date DEFAULT NULL,
  `sedzia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zawody_wedkarskie`
--

INSERT INTO `zawody_wedkarskie` (`id`, `Karty_wedkarskie_id`, `Lowisko_id`, `data_zawodow`, `sedzia`) VALUES
(1, 1, 3, '2018-04-12', 'Jan Kowalewski'),
(2, 1, 5, '2018-05-01', 'Jan Kowalewski'),
(3, 1, 2, '2018-06-01', 'Jan Kowalewski'),
(4, 2, 1, '2018-06-21', 'Krzysztof Dobrowolski');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zgloszenia`
--

CREATE TABLE `zgloszenia` (
  `id` int(10) UNSIGNED NOT NULL,
  `ratownicy_id` int(10) UNSIGNED NOT NULL,
  `dyspozytorzy_id` int(10) UNSIGNED NOT NULL,
  `adres` text DEFAULT NULL,
  `pilne` tinyint(1) DEFAULT NULL,
  `czas_zgloszenia` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zgloszenia`
--

INSERT INTO `zgloszenia` (`id`, `ratownicy_id`, `dyspozytorzy_id`, `adres`, `pilne`, `czas_zgloszenia`) VALUES
(1, 3, 4, 'Warszawa, Marszalkowska 133/2', 0, '15:30:00'),
(2, 3, 4, 'Warszawa, Postepu 13/2', 0, '15:30:00'),
(3, 1, 1, 'Warszawa, Dluga 2', 1, '15:34:00'),
(4, 3, 2, 'Warszawa, Krasinskiego 34', 0, '15:45:00'),
(5, 4, 3, 'Warszawa, Edelmana 5/22', 0, '15:47:00'),
(6, 2, 4, 'Warszawa, Nowowiejska 56/1', 1, '16:20:00'),
(7, 1, 3, 'Warszawa, Poleczki 2/2', 0, '16:23:00');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dyspozytorzy`
--
ALTER TABLE `dyspozytorzy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `karty_wedkarskie`
--
ALTER TABLE `karty_wedkarskie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `lowisko`
--
ALTER TABLE `lowisko`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `okres_ochronny`
--
ALTER TABLE `okres_ochronny`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `publikacje`
--
ALTER TABLE `publikacje`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `ratownicy`
--
ALTER TABLE `ratownicy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `ryby`
--
ALTER TABLE `ryby`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zawody_wedkarskie`
--
ALTER TABLE `zawody_wedkarskie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zgloszenia`
--
ALTER TABLE `zgloszenia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `dyspozytorzy`
--
ALTER TABLE `dyspozytorzy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `karty_wedkarskie`
--
ALTER TABLE `karty_wedkarskie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `lowisko`
--
ALTER TABLE `lowisko`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `okres_ochronny`
--
ALTER TABLE `okres_ochronny`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `publikacje`
--
ALTER TABLE `publikacje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `ratownicy`
--
ALTER TABLE `ratownicy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `ryby`
--
ALTER TABLE `ryby`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `zawody_wedkarskie`
--
ALTER TABLE `zawody_wedkarskie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `zgloszenia`
--
ALTER TABLE `zgloszenia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Baza danych: `forumpsy`
--
CREATE DATABASE IF NOT EXISTS `forumpsy` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `forumpsy`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `konta`
--

CREATE TABLE `konta` (
  `id` int(10) UNSIGNED NOT NULL,
  `nick` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rejestracja` year(4) DEFAULT NULL,
  `postow` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `konta`
--

INSERT INTO `konta` (`id`, `nick`, `email`, `rejestracja`, `postow`) VALUES
(1, 'Jacek', 'jacek@serwer.pl', 2019, 50),
(2, 'Ewa', 'ewa@serwer.pl', 2021, 13),
(3, 'Jan', 'jan@serwer.pl', 2017, 90),
(4, 'Anna', 'anna@serwer.pl', 2021, 4),
(5, 'Gosia', 'malgorzata@serwer.pl', 2021, 6),
(6, 'Krzysiek', 'krzys@serwer.pl', 2020, 23),
(7, 'Romek', 'romek@serwer.pl', 2018, 30),
(8, 'Ola', 'ola@serwer.pl', 2021, 0),
(9, 'Tomek', 'tom@serwer.pl', 2016, 90),
(10, 'Monika', 'mon@serwer.pl', 2020, 100);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `odpowiedzi`
--

CREATE TABLE `odpowiedzi` (
  `id` int(10) UNSIGNED NOT NULL,
  `Pytania_id` int(10) UNSIGNED NOT NULL,
  `konta_id` int(10) UNSIGNED NOT NULL,
  `odpowiedz` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `odpowiedzi`
--

INSERT INTO `odpowiedzi` (`id`, `Pytania_id`, `konta_id`, `odpowiedz`) VALUES
(1, 1, 4, 'Jeśli pies nie był nigdy czesany to zacznij czesać mięciutką szczotką. Tak aby piesek nie zraził się do tego zabiegu.'),
(2, 1, 5, 'Bardzo delikatnie czesz łapki i brodę i ogonek.'),
(3, 1, 9, 'Nagradzaj spokój. Dopiero jak zauwazysz że pies nie stresuje się przy czesaniu można stopniowo zacząć czesać i trymować.'),
(4, 2, 2, 'Przede wszystkim wyrzuć te wszystkie rzeczy na których psy śpią'),
(5, 2, 7, 'Musisz dokładnie poodkurzać mieszkanie, dywany, chodniki, mable, zasłony oraz dodatkowo wytrzepać, i przede wszystkim dokładnie poodkurzać zakamarki.'),
(6, 2, 5, 'Dla psów dostępne są również szampony owadobójcze. '),
(7, 2, 9, 'Psy powinny też chodzić bez przerwy w obroży owadobójczej, dodatkowo powinny być zakropione kroplami tzw. spot-on.'),
(8, 1, 5, 'Przyda Ci się także wysoki stół,\r\nna którym postawisz pieska.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pytania`
--

CREATE TABLE `pytania` (
  `id` int(10) UNSIGNED NOT NULL,
  `konta_id` int(10) UNSIGNED NOT NULL,
  `pytanie` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `pytania`
--

INSERT INTO `pytania` (`id`, `konta_id`, `pytanie`) VALUES
(1, 1, 'Mam pytanie w jaki sposób dbać o sierść sznaucera? Jestem nowym właścicielem i nie za bardzo jeszcze wiem jak to robić. Dziękuję za pomoc.'),
(2, 10, 'Witam mam wielki problem z pchłami u moich psów. Pomocy!'),
(3, 5, 'Czym czesać pudla. Proszę o pomoc'),
(4, 3, 'Moje pieski mnie nie słuchają jak sobie z tym radzić?');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `konta`
--
ALTER TABLE `konta`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `odpowiedzi`
--
ALTER TABLE `odpowiedzi`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pytania`
--
ALTER TABLE `pytania`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `konta`
--
ALTER TABLE `konta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `odpowiedzi`
--
ALTER TABLE `odpowiedzi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT dla tabeli `pytania`
--
ALTER TABLE `pytania`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Baza danych: `images`
--
CREATE DATABASE IF NOT EXISTS `images` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `images`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `images`
--

CREATE TABLE `images` (
  `ID` int(11) NOT NULL,
  `image_path` varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `images`
--

INSERT INTO `images` (`ID`, `image_path`) VALUES
(1, 'pexels-chevanon-photography-312418-g.jpg'),
(2, 'pexels-claire-morgan-4068029-g.jpg'),
(3, 'pexels-daria-obymaha-1691924-g.jpg'),
(4, 'pexels-ekrulila-2128109-g.jpg'),
(5, 'pexels-ioana-motoc-10530087-g.jpg'),
(6, 'pexels-lil-artsy-3216564-g.jpg'),
(7, 'pexels-lood-goosen-1235706-g.jpg'),
(8, 'pexels-marta-dzedyshko-2377474-g.jpg'),
(9, 'pexels-uriel-mont-6314962-g.jpg'),
(10, 'pexels-wallace-chuck-2126268-git-git.jpg'),
(11, 'pexels-александр-полепкин-10761633-g.jpg'),
(12, 'pexels-анастасия-триббиани-9362029-g.jpg');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `images`
--
ALTER TABLE `images`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Baza danych: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Zrzut danych tabeli `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Zrzut danych tabeli `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'choinka', 'table', 'choinki', ''),
('root', 'choinka1', 'table', 'choinki', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Zrzut danych tabeli `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"wynajem\",\"table\":\"rezerwacje\"},{\"db\":\"wynajem\",\"table\":\"pokoje\"},{\"db\":\"ee09\",\"table\":\"ratownicy\"},{\"db\":\"ee09\",\"table\":\"zgloszenia\"},{\"db\":\"auta\",\"table\":\"klienci\"},{\"db\":\"auta\",\"table\":\"samochody\"},{\"db\":\"auta\",\"table\":\"klasa\"},{\"db\":\"auta\",\"table\":\"wypozyczenia\"},{\"db\":\"portal\",\"table\":\"uzytkownicy\"},{\"db\":\"portal\",\"table\":\"dane\"}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Zrzut danych tabeli `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'choinki', 'choinkaa', '{\"sorted_col\":\"`choinkaa`.`Cena - typ rzeczywisty`  ASC\",\"CREATE_TIME\":\"2021-12-22 08:30:28\"}', '2021-12-22 08:08:13'),
('root', 'images', 'images', '{\"sorted_col\":\"`images`.`image_path`  DESC\"}', '2022-12-30 13:48:20');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-01-08 16:32:43', '{\"Console\\/Mode\":\"show\",\"lang\":\"pl\",\"Console\\/Height\":407.971}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeksy dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeksy dla tabeli `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeksy dla tabeli `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeksy dla tabeli `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeksy dla tabeli `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeksy dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeksy dla tabeli `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeksy dla tabeli `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeksy dla tabeli `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeksy dla tabeli `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Baza danych: `pogotowieee09`
--
CREATE DATABASE IF NOT EXISTS `pogotowieee09` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pogotowieee09`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dyspozytorzy`
--

CREATE TABLE `dyspozytorzy` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `dyspozytorzy`
--

INSERT INTO `dyspozytorzy` (`id`, `imie`, `nazwisko`) VALUES
(1, 'Ewelina', 'Nowak'),
(2, 'Krzysztof', 'Kowalewski'),
(3, 'Joanna', 'Pospieszalska'),
(4, 'Jan', 'Winny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `karty_wedkarskie`
--

CREATE TABLE `karty_wedkarskie` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `adres` text DEFAULT NULL,
  `data_zezwolenia` date DEFAULT NULL,
  `punkty` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `karty_wedkarskie`
--

INSERT INTO `karty_wedkarskie` (`id`, `imie`, `nazwisko`, `adres`, `data_zezwolenia`, `punkty`) VALUES
(1, 'Jan', 'Kowalski', 'Warszawa, Aleje Jerozolimskie 65/4', '2018-02-15', 23),
(2, 'Andrzej', 'Nowak', 'Poznan, Dabowskiego 16/4', '2018-03-12', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lowisko`
--

CREATE TABLE `lowisko` (
  `id` int(10) UNSIGNED NOT NULL,
  `Ryby_id` int(10) UNSIGNED NOT NULL,
  `akwen` text DEFAULT NULL,
  `wojewodztwo` text DEFAULT NULL,
  `rodzaj` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `lowisko`
--

INSERT INTO `lowisko` (`id`, `Ryby_id`, `akwen`, `wojewodztwo`, `rodzaj`) VALUES
(1, 2, 'Zalew Wegrowski', 'Mazowieckie', 4),
(2, 3, 'Zbiornik Bukowka', 'Dolnoslaskie', 2),
(3, 2, 'Jeziorko Bartbetowskie', 'Warminsko-Mazurskie', 2),
(4, 1, 'Warta-Obrzycko', 'Wielkopolskie', 3),
(5, 2, 'Stawy Milkow', 'Podkarpackie', 5),
(6, 7, 'Przemsza k. Okradzinowa', 'Slaskie', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `okres_ochronny`
--

CREATE TABLE `okres_ochronny` (
  `id` int(10) UNSIGNED NOT NULL,
  `Ryby_id` int(10) UNSIGNED NOT NULL,
  `od_miesiaca` int(10) UNSIGNED DEFAULT NULL,
  `do_miesiaca` int(10) UNSIGNED DEFAULT NULL,
  `wymiar_ochronny` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `okres_ochronny`
--

INSERT INTO `okres_ochronny` (`id`, `Ryby_id`, `od_miesiaca`, `do_miesiaca`, `wymiar_ochronny`) VALUES
(1, 1, 1, 4, 50),
(2, 2, 0, 0, 30),
(3, 3, 1, 5, 50),
(4, 4, 0, 0, 15),
(5, 5, 11, 6, 70),
(6, 6, 0, 0, 0),
(7, 7, 0, 0, 0),
(8, 8, 0, 0, 25);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `publikacje`
--

CREATE TABLE `publikacje` (
  `id` int(11) NOT NULL,
  `tytul` text DEFAULT NULL,
  `rok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ratownicy`
--

CREATE TABLE `ratownicy` (
  `id` int(10) UNSIGNED NOT NULL,
  `nrKaretki` int(10) UNSIGNED DEFAULT NULL,
  `ratownik1` text DEFAULT NULL,
  `ratownik2` text DEFAULT NULL,
  `ratownik3` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ratownicy`
--

INSERT INTO `ratownicy` (`id`, `nrKaretki`, `ratownik1`, `ratownik2`, `ratownik3`) VALUES
(1, 10, 'Krzysztof Lewandowski', 'Janina Gawlowska', 'Ewa Krasinska'),
(2, 8, 'Robert Marciniak', 'Robert Bialy', 'Krystyna Kowalska'),
(3, 45, 'Tomasz Kos', 'Janusz Sowa', 'Grzegorz Witkowski'),
(4, 13, 'Krzysztof Jerzykowski', 'Jan Niepokorski', 'Waldemar Skory'),
(5, 20, 'Adam Nowak', 'Jan Kowalski', 'Anna Nowakowska'),
(6, 4, 'bagno bag', 'awaw gggg', 'awaw gaga'),
(7, 1, 'daaaaaaaaa ', 'yaaaaaa', ' beka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ryby`
--

CREATE TABLE `ryby` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` text DEFAULT NULL,
  `wystepowanie` text DEFAULT NULL,
  `styl_zycia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ryby`
--

INSERT INTO `ryby` (`id`, `nazwa`, `wystepowanie`, `styl_zycia`) VALUES
(1, 'Szczupak', 'stawy, rzeki', 1),
(2, 'Karp', 'stawy, jeziora', 2),
(3, 'Sandacz', 'stawy, jeziora, rzeki', 1),
(4, 'Okon', 'rzeki', 1),
(5, 'Sum', 'jeziora, rzeki', 1),
(6, 'Dorsz', 'morza, oceany', 1),
(7, 'Leszcz', 'jeziora', 2),
(8, 'Lin', 'jeziora', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `telefon` text DEFAULT NULL,
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`id`, `imie`, `nazwisko`, `telefon`, `email`) VALUES
(1, 'Anna', 'Kowalska', '601601601', 'anna@poczta.pl'),
(2, 'Jan', 'Nowak', '608608608', 'jan@poczta.pl'),
(3, 'Jolanta', 'Jasny', '606606606', 'jolanta@poczta.pl'),
(4, 'qqq', 'www', '345', 'dsfsdklfs@daskl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyniki`
--

CREATE TABLE `wyniki` (
  `id` int(10) UNSIGNED NOT NULL,
  `dyscyplina_id` int(10) UNSIGNED NOT NULL,
  `sportowiec_id` int(10) UNSIGNED NOT NULL,
  `wynik` decimal(5,2) DEFAULT NULL,
  `dataUstanowienia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wyniki`
--

INSERT INTO `wyniki` (`id`, `dyscyplina_id`, `sportowiec_id`, `wynik`, `dataUstanowienia`) VALUES
(1, 1, 1, '12.40', '2015-10-14'),
(2, 1, 1, '12.00', '2015-10-06'),
(3, 1, 2, '11.80', '2015-10-14'),
(4, 1, 2, '11.90', '2015-10-06'),
(5, 1, 3, '11.50', '2015-10-14'),
(6, 1, 3, '11.56', '2015-10-06'),
(7, 1, 4, '11.70', '2015-10-14'),
(8, 1, 4, '11.67', '2015-10-06'),
(9, 1, 5, '11.30', '2015-10-14'),
(10, 1, 5, '11.52', '2015-10-06'),
(11, 1, 6, '12.10', '2015-10-14'),
(12, 1, 6, '12.00', '2015-10-06'),
(13, 3, 1, '63.00', '2015-11-11'),
(14, 3, 1, '63.60', '2015-10-13'),
(15, 3, 2, '64.00', '2015-11-11'),
(16, 3, 2, '63.60', '2015-10-13'),
(17, 3, 3, '60.00', '2015-11-11'),
(18, 3, 3, '61.60', '2015-10-13'),
(19, 3, 4, '63.50', '2015-11-11'),
(20, 3, 4, '63.60', '2015-10-13'),
(21, 3, 5, '70.00', '2015-10-07'),
(22, 3, 6, '68.00', '2015-10-07');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id` int(10) UNSIGNED NOT NULL,
  `Samochody_id` int(10) UNSIGNED NOT NULL,
  `Klient` text DEFAULT NULL,
  `telefon` text DEFAULT NULL,
  `dataZam` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `Samochody_id`, `Klient`, `telefon`, `dataZam`) VALUES
(1, 3, 'Anna Kowalska', '111222333', '2016-02-15'),
(2, 6, 'Jan Nowakowski', '222111333', '2016-02-15'),
(3, 8, 'Marcin Kolwal', '333111222', '2016-02-15');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawody_wedkarskie`
--

CREATE TABLE `zawody_wedkarskie` (
  `id` int(10) UNSIGNED NOT NULL,
  `Karty_wedkarskie_id` int(10) UNSIGNED NOT NULL,
  `Lowisko_id` int(10) UNSIGNED NOT NULL,
  `data_zawodow` date DEFAULT NULL,
  `sedzia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zawody_wedkarskie`
--

INSERT INTO `zawody_wedkarskie` (`id`, `Karty_wedkarskie_id`, `Lowisko_id`, `data_zawodow`, `sedzia`) VALUES
(1, 1, 3, '2018-04-12', 'Jan Kowalewski'),
(2, 1, 5, '2018-05-01', 'Jan Kowalewski'),
(3, 1, 2, '2018-06-01', 'Jan Kowalewski'),
(4, 2, 1, '2018-06-21', 'Krzysztof Dobrowolski');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zgloszenia`
--

CREATE TABLE `zgloszenia` (
  `id` int(10) UNSIGNED NOT NULL,
  `ratownicy_id` int(10) UNSIGNED NOT NULL,
  `dyspozytorzy_id` int(10) UNSIGNED NOT NULL,
  `adres` text DEFAULT NULL,
  `pilne` tinyint(1) DEFAULT NULL,
  `czas_zgloszenia` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zgloszenia`
--

INSERT INTO `zgloszenia` (`id`, `ratownicy_id`, `dyspozytorzy_id`, `adres`, `pilne`, `czas_zgloszenia`) VALUES
(1, 3, 4, 'Warszawa, Marszalkowska 133/2', 0, '15:30:00'),
(2, 3, 4, 'Warszawa, Postepu 13/2', 0, '15:30:00'),
(3, 1, 1, 'Warszawa, Dluga 2', 1, '15:34:00'),
(4, 3, 2, 'Warszawa, Krasinskiego 34', 0, '15:45:00'),
(5, 4, 3, 'Warszawa, Edelmana 5/22', 0, '15:47:00'),
(6, 2, 4, 'Warszawa, Nowowiejska 56/1', 1, '16:20:00'),
(7, 1, 3, 'Warszawa, Poleczki 2/2', 0, '16:23:00');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dyspozytorzy`
--
ALTER TABLE `dyspozytorzy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `karty_wedkarskie`
--
ALTER TABLE `karty_wedkarskie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `lowisko`
--
ALTER TABLE `lowisko`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `okres_ochronny`
--
ALTER TABLE `okres_ochronny`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `publikacje`
--
ALTER TABLE `publikacje`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `ratownicy`
--
ALTER TABLE `ratownicy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `ryby`
--
ALTER TABLE `ryby`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zawody_wedkarskie`
--
ALTER TABLE `zawody_wedkarskie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zgloszenia`
--
ALTER TABLE `zgloszenia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `dyspozytorzy`
--
ALTER TABLE `dyspozytorzy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `karty_wedkarskie`
--
ALTER TABLE `karty_wedkarskie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `lowisko`
--
ALTER TABLE `lowisko`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `okres_ochronny`
--
ALTER TABLE `okres_ochronny`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `publikacje`
--
ALTER TABLE `publikacje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `ratownicy`
--
ALTER TABLE `ratownicy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `ryby`
--
ALTER TABLE `ryby`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `zawody_wedkarskie`
--
ALTER TABLE `zawody_wedkarskie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `zgloszenia`
--
ALTER TABLE `zgloszenia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Baza danych: `portal`
--
CREATE DATABASE IF NOT EXISTS `portal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `portal`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dane`
--

CREATE TABLE `dane` (
  `id` int(10) UNSIGNED NOT NULL,
  `rok_urodz` year(4) DEFAULT NULL,
  `przyjaciol` int(10) UNSIGNED DEFAULT NULL,
  `hobby` varchar(20) DEFAULT NULL,
  `zdjecie` varchar(100) DEFAULT NULL,
  `stanowisko` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `dane`
--

INSERT INTO `dane` (`id`, `rok_urodz`, `przyjaciol`, `hobby`, `zdjecie`, `stanowisko`) VALUES
(1, 1995, 10, 'moda', 'o6.jpg', NULL),
(2, 1990, 20, 'film', 'o4.jpg', NULL),
(3, 1990, 20, 'cross', 'o1.jpg', NULL),
(4, 2001, 4, 'finanse', 'o2.jpg', NULL),
(5, 2002, 50, 'muzyka', 'o8.jpg', NULL),
(6, 1994, 10, 'baseball', 'o6.jpg', NULL),
(7, 1990, 20, 'film', 'o5.jpg', NULL),
(8, 1990, 20, 'film', 'o3.jpg', NULL),
(9, 2001, 0, 'psychologia', 'o7.jpg', NULL),
(10, 2002, 50, 'muzyka', 'o2.jpg', NULL),
(11, 1994, 10, 'DIY', 'o6.jpg', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `haslo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `login`, `haslo`) VALUES
(1, 'Justyna', 'a056c8d05ae9ac6ca180bc991b93b7ffe37563e0'),
(2, 'Ewa', 'c50267b906a652f2142cfab006e215c9f6fdc8a0'),
(3, 'Krzysiek', '637a81ed8e8217bb01c15c67c39b43b0ab4e20f1'),
(4, 'Adam', '8578173555a47d4ea49e697badfda270dee0858f'),
(5, 'Magda', '99ebdbd711b0e1854a6c2e93f759efc2af291fd0'),
(6, 'Werka', '186154712b2d5f6791d85b9a0987b98fa231779c'),
(7, 'Janek', '7823372203bd98aeb10e6f33a6ce7dab12d13423'),
(8, 'Heniek', '425ffc1422dc4f32528bd9fd5af355fdb5c96192'),
(9, 'Ola', '4ae9fa0a8299a828a886c0eb30c930c7cf302a72'),
(10, 'Dawid', 'b3054ff0797ff0b2bbce03ec897fe63e0b6490e0'),
(11, 'Ewelina', '7e240de74fb1ed08fa08d38063f6a6a91462a815');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dane`
--
ALTER TABLE `dane`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `dane`
--
ALTER TABLE `dane`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Baza danych: `prognoza`
--
CREATE DATABASE IF NOT EXISTS `prognoza` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prognoza`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `karty_wedkarskie`
--

CREATE TABLE `karty_wedkarskie` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `adres` text DEFAULT NULL,
  `data_zezwolenia` date DEFAULT NULL,
  `punkty` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `karty_wedkarskie`
--

INSERT INTO `karty_wedkarskie` (`id`, `imie`, `nazwisko`, `adres`, `data_zezwolenia`, `punkty`) VALUES
(1, 'Jan', 'Kowalski', 'Warszawa, Aleje Jerozolimskie 65/4', '2018-02-15', 23),
(2, 'Andrzej', 'Nowak', 'Poznan, Dabowskiego 16/4', '2018-03-12', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lowisko`
--

CREATE TABLE `lowisko` (
  `id` int(10) UNSIGNED NOT NULL,
  `Ryby_id` int(10) UNSIGNED NOT NULL,
  `akwen` text DEFAULT NULL,
  `wojewodztwo` text DEFAULT NULL,
  `rodzaj` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `lowisko`
--

INSERT INTO `lowisko` (`id`, `Ryby_id`, `akwen`, `wojewodztwo`, `rodzaj`) VALUES
(1, 2, 'Zalew Wegrowski', 'Mazowieckie', 4),
(2, 3, 'Zbiornik Bukowka', 'Dolnoslaskie', 2),
(3, 2, 'Jeziorko Bartbetowskie', 'Warminsko-Mazurskie', 2),
(4, 1, 'Warta-Obrzycko', 'Wielkopolskie', 3),
(5, 2, 'Stawy Milkow', 'Podkarpackie', 5),
(6, 7, 'Przemsza k. Okradzinowa', 'Slaskie', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `matematycy`
--

CREATE TABLE `matematycy` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `rok_urodzenia` int(10) DEFAULT NULL,
  `liczba_publikacji` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `matematycy`
--

INSERT INTO `matematycy` (`id`, `imie`, `nazwisko`, `rok_urodzenia`, `liczba_publikacji`) VALUES
(1, 'Stefan', 'Banach', 1892, 20),
(2, 'Leonardo', 'Fibonacci', 1175, 15),
(3, 'Augustin', 'Cauchy', 1789, 10),
(4, 'Leonard', 'Euler', 1707, 30),
(5, 'Gotfried', 'Leibniz', 1646, 40);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miasta`
--

CREATE TABLE `miasta` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` text DEFAULT NULL,
  `województwo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `miasta`
--

INSERT INTO `miasta` (`id`, `nazwa`, `województwo`) VALUES
(1, 'Wroclaw', NULL),
(2, 'Poznan', NULL),
(3, 'Warszawa', NULL),
(4, 'Gdansk', NULL),
(5, 'Zielona Góra', NULL),
(6, 'Lublin', NULL),
(7, 'Tychy', NULL),
(8, 'Katowice', NULL),
(9, 'Opole', NULL),
(10, 'Zakopane', NULL),
(11, 'Kraków', NULL),
(12, 'Szczecin', NULL),
(13, 'Gdynia', NULL),
(14, 'Koszalin', NULL),
(15, 'Malbork', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `okres_ochronny`
--

CREATE TABLE `okres_ochronny` (
  `id` int(10) UNSIGNED NOT NULL,
  `Ryby_id` int(10) UNSIGNED NOT NULL,
  `od_miesiaca` int(10) UNSIGNED DEFAULT NULL,
  `do_miesiaca` int(10) UNSIGNED DEFAULT NULL,
  `wymiar_ochronny` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `okres_ochronny`
--

INSERT INTO `okres_ochronny` (`id`, `Ryby_id`, `od_miesiaca`, `do_miesiaca`, `wymiar_ochronny`) VALUES
(1, 1, 1, 4, 50),
(2, 2, 0, 0, 30),
(3, 3, 1, 5, 50),
(4, 4, 0, 0, 15),
(5, 5, 11, 6, 70),
(6, 6, 0, 0, 0),
(7, 7, 0, 0, 0),
(8, 8, 0, 0, 25);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pogoda`
--

CREATE TABLE `pogoda` (
  `id` int(10) UNSIGNED NOT NULL,
  `miasta_id` int(10) UNSIGNED NOT NULL,
  `data_prognozy` date DEFAULT NULL,
  `temperatura_noc` int(11) DEFAULT NULL,
  `temperatura_dzien` int(11) DEFAULT NULL,
  `opady` int(10) UNSIGNED DEFAULT NULL,
  `cisnienie` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `pogoda`
--

INSERT INTO `pogoda` (`id`, `miasta_id`, `data_prognozy`, `temperatura_noc`, `temperatura_dzien`, `opady`, `cisnienie`) VALUES
(1, 1, '2019-05-31', 15, 23, 33, 1020),
(2, 1, '2019-05-10', 15, 23, 0, 1020),
(3, 1, '2019-05-11', 14, 22, 0, 1020),
(4, 1, '2019-05-12', 10, 14, 0, 1020),
(5, 1, '2019-05-13', 6, 15, 0, 1020),
(6, 1, '2019-05-14', 5, 11, 7, 1000),
(7, 1, '2019-05-15', 6, 11, 33, 1000),
(8, 1, '2019-05-16', 6, 15, 32, 997),
(9, 1, '2019-05-17', 12, 20, 11, 997),
(10, 2, '2019-05-11', 11, 23, 0, 1020),
(11, 2, '2019-05-12', 5, 20, 0, 1020),
(12, 2, '2019-05-13', 5, 20, 0, 1020),
(13, 2, '2019-05-14', 8, 23, 4, 1000),
(14, 2, '2019-05-15', 8, 19, 4, 1000),
(15, 2, '2019-05-16', 11, 17, 30, 995),
(16, 2, '2019-05-17', 11, 15, 30, 995),
(17, 2, '2019-05-18', 12, 15, 30, 996);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `publikacje`
--

CREATE TABLE `publikacje` (
  `id` int(11) NOT NULL,
  `tytul` text DEFAULT NULL,
  `rok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ryby`
--

CREATE TABLE `ryby` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` text DEFAULT NULL,
  `wystepowanie` text DEFAULT NULL,
  `styl_zycia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ryby`
--

INSERT INTO `ryby` (`id`, `nazwa`, `wystepowanie`, `styl_zycia`) VALUES
(1, 'Szczupak', 'stawy, rzeki', 1),
(2, 'Karp', 'stawy, jeziora', 2),
(3, 'Sandacz', 'stawy, jeziora, rzeki', 1),
(4, 'Okon', 'rzeki', 1),
(5, 'Sum', 'jeziora, rzeki', 1),
(6, 'Dorsz', 'morza, oceany', 1),
(7, 'Leszcz', 'jeziora', 2),
(8, 'Lin', 'jeziora', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `telefon` text DEFAULT NULL,
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`id`, `imie`, `nazwisko`, `telefon`, `email`) VALUES
(1, 'Anna', 'Kowalska', '601601601', 'anna@poczta.pl'),
(2, 'Jan', 'Nowak', '608608608', 'jan@poczta.pl'),
(3, 'Jolanta', 'Jasny', '606606606', 'jolanta@poczta.pl'),
(4, 'qqq', 'www', '345', 'dsfsdklfs@daskl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyniki`
--

CREATE TABLE `wyniki` (
  `id` int(10) UNSIGNED NOT NULL,
  `dyscyplina_id` int(10) UNSIGNED NOT NULL,
  `sportowiec_id` int(10) UNSIGNED NOT NULL,
  `wynik` decimal(5,2) DEFAULT NULL,
  `dataUstanowienia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wyniki`
--

INSERT INTO `wyniki` (`id`, `dyscyplina_id`, `sportowiec_id`, `wynik`, `dataUstanowienia`) VALUES
(1, 1, 1, '12.40', '2015-10-14'),
(2, 1, 1, '12.00', '2015-10-06'),
(3, 1, 2, '11.80', '2015-10-14'),
(4, 1, 2, '11.90', '2015-10-06'),
(5, 1, 3, '11.50', '2015-10-14'),
(6, 1, 3, '11.56', '2015-10-06'),
(7, 1, 4, '11.70', '2015-10-14'),
(8, 1, 4, '11.67', '2015-10-06'),
(9, 1, 5, '11.30', '2015-10-14'),
(10, 1, 5, '11.52', '2015-10-06'),
(11, 1, 6, '12.10', '2015-10-14'),
(12, 1, 6, '12.00', '2015-10-06'),
(13, 3, 1, '63.00', '2015-11-11'),
(14, 3, 1, '63.60', '2015-10-13'),
(15, 3, 2, '64.00', '2015-11-11'),
(16, 3, 2, '63.60', '2015-10-13'),
(17, 3, 3, '60.00', '2015-11-11'),
(18, 3, 3, '61.60', '2015-10-13'),
(19, 3, 4, '63.50', '2015-11-11'),
(20, 3, 4, '63.60', '2015-10-13'),
(21, 3, 5, '70.00', '2015-10-07'),
(22, 3, 6, '68.00', '2015-10-07');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id` int(10) UNSIGNED NOT NULL,
  `Samochody_id` int(10) UNSIGNED NOT NULL,
  `Klient` text DEFAULT NULL,
  `telefon` text DEFAULT NULL,
  `dataZam` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `Samochody_id`, `Klient`, `telefon`, `dataZam`) VALUES
(1, 3, 'Anna Kowalska', '111222333', '2016-02-15'),
(2, 6, 'Jan Nowakowski', '222111333', '2016-02-15'),
(3, 8, 'Marcin Kolwal', '333111222', '2016-02-15');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawody_wedkarskie`
--

CREATE TABLE `zawody_wedkarskie` (
  `id` int(10) UNSIGNED NOT NULL,
  `Karty_wedkarskie_id` int(10) UNSIGNED NOT NULL,
  `Lowisko_id` int(10) UNSIGNED NOT NULL,
  `data_zawodow` date DEFAULT NULL,
  `sedzia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zawody_wedkarskie`
--

INSERT INTO `zawody_wedkarskie` (`id`, `Karty_wedkarskie_id`, `Lowisko_id`, `data_zawodow`, `sedzia`) VALUES
(1, 1, 3, '2018-04-12', 'Jan Kowalewski'),
(2, 1, 5, '2018-05-01', 'Jan Kowalewski'),
(3, 1, 2, '2018-06-01', 'Jan Kowalewski'),
(4, 2, 1, '2018-06-21', 'Krzysztof Dobrowolski');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `karty_wedkarskie`
--
ALTER TABLE `karty_wedkarskie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `lowisko`
--
ALTER TABLE `lowisko`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `matematycy`
--
ALTER TABLE `matematycy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `miasta`
--
ALTER TABLE `miasta`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `okres_ochronny`
--
ALTER TABLE `okres_ochronny`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pogoda`
--
ALTER TABLE `pogoda`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `publikacje`
--
ALTER TABLE `publikacje`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `ryby`
--
ALTER TABLE `ryby`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zawody_wedkarskie`
--
ALTER TABLE `zawody_wedkarskie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `karty_wedkarskie`
--
ALTER TABLE `karty_wedkarskie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `lowisko`
--
ALTER TABLE `lowisko`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `matematycy`
--
ALTER TABLE `matematycy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `miasta`
--
ALTER TABLE `miasta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `okres_ochronny`
--
ALTER TABLE `okres_ochronny`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `pogoda`
--
ALTER TABLE `pogoda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `publikacje`
--
ALTER TABLE `publikacje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `ryby`
--
ALTER TABLE `ryby`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `zawody_wedkarskie`
--
ALTER TABLE `zawody_wedkarskie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Baza danych: `psy`
--
CREATE DATABASE IF NOT EXISTS `psy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `psy`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `haslo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `login`, `haslo`) VALUES
(1, 'Justyna', 'a056c8d05ae9ac6ca180bc991b93b7ffe37563e0'),
(2, 'Ewa', 'c50267b906a652f2142cfab006e215c9f6fdc8a0'),
(3, 'Krzysiek', '637a81ed8e8217bb01c15c67c39b43b0ab4e20f1'),
(4, 'Adam', '8578173555a47d4ea49e697badfda270dee0858f'),
(5, 'Magda', '99ebdbd711b0e1854a6c2e93f759efc2af291fd0'),
(6, 'Werka', '186154712b2d5f6791d85b9a0987b98fa231779c'),
(7, 'Janek', '7823372203bd98aeb10e6f33a6ce7dab12d13423'),
(8, 'Heniek', '425ffc1422dc4f32528bd9fd5af355fdb5c96192'),
(9, 'Ola', '4ae9fa0a8299a828a886c0eb30c930c7cf302a72'),
(10, 'Dawid', 'b3054ff0797ff0b2bbce03ec897fe63e0b6490e0'),
(11, 'Ewelina', '7e240de74fb1ed08fa08d38063f6a6a91462a815'),
(12, 'dziad', 'gaga'),
(13, 'dziad', 'gaga'),
(14, 'hujk', '159b0c4aee9a825be489507183f1cec03951da63'),
(15, 'hujk', '159b0c4aee9a825be489507183f1cec03951da63'),
(16, 'dziad', '32e377e240010fa0357f8242a5ace8ec42a0434e'),
(17, 'dziad', '32e377e240010fa0357f8242a5ace8ec42a0434e'),
(18, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(19, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(20, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(21, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(22, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(23, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(24, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(25, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(26, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(27, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(28, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(29, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(30, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(31, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(32, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(33, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(34, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(35, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(36, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(37, 'ddd', '9c969ddf454079e3d439973bbab63ea6233e4087'),
(38, '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(39, 'wdad', '0ebf4466ee48da441882f9bf78119567466bf788'),
(40, 'wdad', '0ebf4466ee48da441882f9bf78119567466bf788'),
(41, '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(42, '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(43, 'daaaa', 'fedd1d1122aa65028c81e16ceb85d9c73790a2fa'),
(44, '', 'cdd4f874095045f4ae6670038cbbd05fac9d4802');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- Baza danych: `uzytkownicy`
--
CREATE DATABASE IF NOT EXISTS `uzytkownicy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uzytkownicy`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `user` text COLLATE utf8_polish_ci NOT NULL,
  `pass` text COLLATE utf8_polish_ci NOT NULL,
  `email` text COLLATE utf8_polish_ci NOT NULL,
  `drewno` int(11) NOT NULL,
  `kamien` int(11) NOT NULL,
  `zboze` int(11) NOT NULL,
  `dnipremium` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `user`, `pass`, `email`, `drewno`, `kamien`, `zboze`, `dnipremium`) VALUES
(1, 'adam', 'qwerty', 'adam@gmail.com', 213, 5675, 342, 0),
(2, 'marek', 'asdfg', 'marek@gmail.com', 324, 1123, 4325, 15),
(3, 'anna', 'zxcvb', 'anna@gmail.com', 4536, 17, 120, 25),
(4, 'andrzej', 'asdfg', 'andrzej@gmail.com', 5465, 132, 189, 0),
(5, 'justyna', 'yuiop', 'justyna@gmail.com', 245, 890, 554, 0),
(6, 'kasia', 'hjkkl', 'kasia@gmail.com', 267, 980, 109, 12),
(7, 'beata', 'fgthj', 'beata@gmail.com', 565, 356, 447, 77),
(8, 'jakub', 'ertyu', 'jakub@gmail.com', 2467, 557, 876, 0),
(9, 'janusz', 'cvbnm', 'janusz@gmail.com', 65, 456, 2467, 0),
(10, 'roman', 'dfghj', 'roman@gmail.com', 97, 226, 245, 23);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Komentator WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2021-12-21 22:19:28', '2021-12-21 21:19:28', 'Cześć, to jest komentarz.\nAby zapoznać się z moderowaniem, edycją i usuwaniem komentarzy, należy odwiedzić ekran Komentarze w kokpicie.\nAwatary komentujących pochodzą z <a href=\"https://pl.gravatar.com\">Gravatara</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/czad', 'yes'),
(2, 'home', 'http://localhost/czad', 'yes'),
(3, 'blogname', 'czad witrynka', 'yes'),
(4, 'blogdescription', 'Kolejna witryna oparta na WordPressie', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'draki573573@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'j F Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:95:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=5&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:0:{}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentytwentyone', 'yes'),
(41, 'stylesheet', 'twentytwentyone', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '49752', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '0', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', 'Europe/Warsaw', 'yes'),
(81, 'page_for_posts', '8', 'yes'),
(82, 'page_on_front', '5', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1655673567', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '49752', 'yes'),
(100, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'yes'),
(102, 'WPLANG', 'pl_PL', 'yes'),
(103, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:156:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Ostatnie wpisy</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:232:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Najnowsze komentarze</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:145:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archiwa</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:149:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Kategorie</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(105, 'cron', 'a:6:{i:1640132368;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1640164768;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1640207968;a:2:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1640207985;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1640207987;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(106, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'recovery_keys', 'a:0:{}', 'yes'),
(120, 'theme_mods_twentytwentyone', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:2:{s:7:\"primary\";i:2;s:6:\"footer\";i:3;}}', 'yes'),
(121, 'https_detection_errors', 'a:1:{s:23:\"ssl_verification_failed\";a:1:{i:0;s:36:\"Weryfikacja SSLa nie powiodła się.\";}}', 'yes'),
(126, '_site_transient_timeout_theme_roots', '1640123370', 'no'),
(127, '_site_transient_theme_roots', 'a:3:{s:14:\"twentynineteen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";}', 'no'),
(129, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/pl_PL/wordpress-5.8.2.zip\";s:6:\"locale\";s:5:\"pl_PL\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/pl_PL/wordpress-5.8.2.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.8.2\";s:7:\"version\";s:5:\"5.8.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1640121747;s:15:\"version_checked\";s:5:\"5.8.2\";s:12:\"translations\";a:0:{}}', 'no'),
(130, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1640121747;s:7:\"checked\";a:3:{s:14:\"twentynineteen\";s:3:\"2.1\";s:12:\"twentytwenty\";s:3:\"1.8\";s:15:\"twentytwentyone\";s:3:\"1.4\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"2.1\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.2.1.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.8\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.8.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentytwentyone\";a:6:{s:5:\"theme\";s:15:\"twentytwentyone\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentyone/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentyone.1.4.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'no'),
(131, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1640121745;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.2.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.2.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";}s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}}', 'no'),
(132, '_site_transient_timeout_browser_d44bfba7ec2b67d9eb9e6c1eea55c253', '1640726386', 'no'),
(133, '_site_transient_browser_d44bfba7ec2b67d9eb9e6c1eea55c253', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"96.0.4664.110\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(134, '_site_transient_timeout_php_check_bbe0b0d516d9a70a0e1aa1834ea07179', '1640726387', 'no'),
(135, '_site_transient_php_check_bbe0b0d516d9a70a0e1aa1834ea07179', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(137, '_site_transient_timeout_community-events-d41d8cd98f00b204e9800998ecf8427e', '1640166083', 'no'),
(138, '_site_transient_community-events-d41d8cd98f00b204e9800998ecf8427e', 'a:4:{s:9:\"sandboxed\";b:0;s:5:\"error\";N;s:8:\"location\";a:1:{s:2:\"ip\";b:0;}s:6:\"events\";a:1:{i:0;a:10:{s:4:\"type\";s:8:\"wordcamp\";s:5:\"title\";s:24:\"WordCamp Vienna, Austria\";s:3:\"url\";s:33:\"https://vienna.wordcamp.org/2022/\";s:6:\"meetup\";N;s:10:\"meetup_url\";N;s:4:\"date\";s:19:\"2022-04-23 00:00:00\";s:8:\"end_date\";s:19:\"2022-04-23 00:00:00\";s:20:\"start_unix_timestamp\";i:1650664800;s:18:\"end_unix_timestamp\";i:1650664800;s:8:\"location\";a:4:{s:8:\"location\";s:15:\"Vienna, Austria\";s:7:\"country\";s:2:\"AT\";s:8:\"latitude\";d:48.2129431;s:9:\"longitude\";d:16.3608799;}}}}', 'no'),
(139, 'can_compress_scripts', '1', 'no'),
(140, '_transient_timeout_feed_a2a8f6ff8f129a81518b9f747f983e41', '1640164789', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(141, '_transient_feed_a2a8f6ff8f129a81518b9f747f983e41', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:49:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"Blog | WordPress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:24:\"https://pl.wordpress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 27 Nov 2019 09:42:44 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"pl-PL\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://wordpress.org/?v=5.9-beta3-52402\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:10:{i:0;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:42:\"Dołącz do grupy tłumaczeniowej na Slack\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:76:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:85:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 31 Jul 2018 07:46:24 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"Polskie tłumaczenie i witryna\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=2025\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:429:\"Autorem tego wpisu jest Magdalena Stanek Tłumaczu porozmawiajmy! Podczas tegorocznego Contributor Day na WordCampie w Poznaniu w grupie tłumaczeniowej zebrała się zaangażowana ekipa, która stwierdziła, że fajnie by było tłumaczyć razem przez cały rok, a nie tylko podczas Contributor Day. W związku z tym założyliśmy kanał Slack dla polskich tłumaczy, gdzie będziemy prowadzić cotygodniowe spotkania [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:19:\"Waclaw Jacek (a11n)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1047:\"\n<p><em>Autorem tego wpisu jest Magdalena Stanek</em></p>\n\n\n\n<p>Tłumaczu porozmawiajmy!</p>\n\n\n\n<p>Podczas tegorocznego Contributor Day na WordCampie w Poznaniu w grupie tłumaczeniowej zebrała się zaangażowana ekipa, która stwierdziła, że fajnie by było tłumaczyć razem przez cały rok, a nie tylko podczas Contributor Day.</p>\n\n\n\n<p>W związku z tym założyliśmy kanał Slack dla polskich tłumaczy, gdzie będziemy prowadzić cotygodniowe spotkania w każdą środę o 20:00. Celem spotkań jest wspólne motywowanie się do  poświęcenia trochę więcej czasu na tłumaczenia, rozwiewanie wątpliwości, dyskutowanie na temat różnych spraw związanych z tłumaczeniami i i oczywiście pomaganie sobie nawzajem. </p>\n\n\n\n<p>Możesz się zalogować tutaj <a href=\"https://wordpresspopolsku.slack.com/signup\">https://wordpresspopolsku.slack.com/signup</a> (do logowania najlepiej użyć swoich danych z wordpress.org).</p>\n\n\n\n<p>Mamy nadzieję, że inicjatywa Cię zainteresuje i dołączysz do nas.<br>\nDo zobaczenia na Slacku!</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"8\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"WordCamp Łódź 2019\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:64:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 17 Oct 2019 11:30:37 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:10:\"Wydarzenia\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"wordcamp\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=3981\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:454:\"Prowadzisz stronę opartą na WordPressie? Jesteś deweloperem lub prowadzisz działalność opartą o usługi związane z WordPressem? A może jesteś blogerem lub zajmujesz się e-marketingiem? Niezależnie od stopnia znajomości i roli jaką odgrywa WordPress w Twoim życiu, konferencja WordCamp Łódź 2019 skierowana jest właśnie do Ciebie. WordCamp to ogólnopolska konferencja poświęcona pośrednio i bezpośrednio WordPressowi. To [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Katarzyna Gajewska\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3116:\"\n<p>Prowadzisz stronę opartą na WordPressie? Jesteś deweloperem lub prowadzisz działalność opartą o usługi związane z WordPressem? A może jesteś blogerem lub zajmujesz się e-marketingiem? Niezależnie od stopnia znajomości i roli jaką odgrywa WordPress w Twoim życiu, konferencja <strong><a href=\"https://2019.lodz.wordcamp.org/\" target=\"_blank\" rel=\"noreferrer noopener\" aria-label=\"WordCamp Łódź 2019 (opens in a new tab)\">WordCamp Łódź 2019</a></strong> skierowana jest właśnie do Ciebie.<br><br>WordCamp to ogólnopolska konferencja poświęcona pośrednio i bezpośrednio WordPressowi. To doskonała okazja na poszerzenie swojej wiedzy i zdobycie nowych kontaktów, które mogą zaowocować nowymi wyzwaniami w życiu zawodowym. To też doskonała okazja na podzielenie się swoją wiedzą i wymianę doświadczeń z innymi miłośnikami WordPressa. <br><br>WordCamp to trzy dni inspirujących prelekcji prowadzonych przez niesamowitych specjalistów. To warsztaty, dzięki którym zdobędziecie nowe umiejętności. To także Contributor Day &#8211; dzień stworzony specjalnie dla Was &#8211; twórców, deweloperów, tłumaczy, blogerów, projektantów. Tego dnia to Wy możecie podarować swoją pomoc i zaangażowanie w rozwój WordPressa.<br><br>To także spotkania ze sponsorami, dzięki którym WordCamp nie mógłby się odbyć. To oni i ich pomoc sprawia, że konferencja jest dostępna dla tak wielu osób w bardzo przystępnej cenie.<br>Pakiety sponsorskie dostosowane są do różnych potrzeb oraz możliwości. Sponsorami są zarówno duże, międzynarodowe marki, jak i lokalne biznesy działające w naszym regionie. Jeśli chcesz znaleźć się w zacnym gronie sponsorów tegorocznego WordCampa, wybierz odpowiedni pakiet pod tym adresem: <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://2019.lodz.wordcamp.org/zostan-sponsorem-wordcamp-lodz-2019/?fbclid=IwAR0COkUojiqsrmCzYWLHvH0TSJ4cA3t8g_KkqzvT4wDT9Il_LH6cweKVTRo\">https://2019.lodz.wordcamp.org/zostan-sponsorem-wordcamp-lodz-2019/</a><br><br>WordCamp to również networking, czyli wspólna zabawa w trakcie Middle Party. <br><br>Tegoroczny WordCamp odbędzie się w Hotelu Ambasador Premium w Łodzi przy ulicy Kilińskiego 145. Dla Waszej wygody odbędzie się tutaj zarówno pierwszy dzień &#8211; Contributor Day oraz warsztaty, jak i dwa dni konferencyjne poświęcone prezentacjom. Na Middle Party też zapraszamy do Hotelu Ambasador Premium.<br><br>Bilety możecie kupić na naszej stronie internetowej: <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://l.facebook.com/l.php?u=https%3A%2F%2F2019.lodz.wordcamp.org%2Fbilety%2F%3Ffbclid%3DIwAR3mM-avOgA5H501q0GD-Y1_VccHbsAkssRqSiL_-cVvTacnPeuDt-fpHq4&amp;h=AT0XqbIJMRrLiuvJ2dnl3grccZ5OTXPpgmZ7xc5ZdxRe7bKjUN28aGLo6T4YeRHgDnlj2YgcRtaEMkfTJHDGtFS5H_TVjTb998shqjeQS-8QAd-9ZBOK1ko--FQMcGz38J4O41U\">https://2019.lodz.wordcamp.org/bilety/</a><br><br>Przy rejestracji nie zapomnijcie wypełnić specjalnego pola z rozmiarem. Na każdego czeka oficjalny, wyjątkowy Swag! <br><br>Do zobaczenia 22 listopada w Hotelu Ambasador Premium w Łodzi! </p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:60:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"10\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.9.7 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 07 Jul 2018 14:18:34 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1945\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:463:\"WordPress 4.9.7 jest już dostępny. To wydanie poprawia bezpieczeństwo wszystkich wersji systemu począwszy od 3.7. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. WordPress w wersji 4.9.6 i wcześniejszych zawiera błąd związany z obsługą mediów, który może pozwolić użytkownikom z pewnymi prawami dostępu na podjęcie próby usunięcia plików spoza katalogu uploads. Dziękujemy Slavco za zgłoszenie błędu, a także Mattowi [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:4564:\"<p>WordPress 4.9.7 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> wszystkich wersji systemu począwszy od 3.7. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1945\"></span></p>\n<p>WordPress w wersji 4.9.6 i wcześniejszych zawiera błąd związany z obsługą mediów, który może pozwolić użytkownikom z pewnymi prawami dostępu na podjęcie próby usunięcia plików spoza katalogu <em>uploads</em>.</p>\n<p>Dziękujemy <a href=\"https://hackerone.com/slavco\">Slavco</a> za zgłoszenie błędu, a także <a href=\"https://www.wordfence.com/\">Mattowi Barry&#8217;emu</a> za zgłoszenie powiązanych z tą kwestią problemów.</p>\n<p>W WordPressie 4.9.7 naprawiono także 17 innych problemów, w szczególności:</p>\n<ul>\n<li>Taksonomie: Ulepszenie obsługi cache dla zapytań dotyczących terminów.</li>\n<li>Wpisy i inne Typy Treści: Usuwanie ciasteczka dotyczącego hasła dla podstrony, gdy użytkownik wyloguje się.</li>\n<li>Widgety: Dopuszczenie używania podstawowych znaczników HTML w opisach paneli bocznych w sekcji Widgety panelu administracyjnego.</li>\n<li>Kokpit wydarzeń społecznościowych: Zawsze pokazuj najbliższe spotkanie WordCamp, jeśli takowe się zbliża &#8211; nawet, gdy wcześniej planowane są spotkania w dalszych lokalizacjach.</li>\n<li>Prywatność: Upewnienie się, że domyślna treść polityki prywatności nie spowoduje wystąpienia krytycznego błędu podczas czyszczenia reguł przekształcania adresów poza kontekstem administracyjnym.</li>\n</ul>\n<p>W dokumentacji Codex znajdziesz <a href=\"https://codex.wordpress.org/Version_4.9.7\">więcej informacji na temat wszystkich kwestii rozwiązanych w wersji 4.9.7</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.7</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Wcześniej zaplanowane wydanie 4.9.7 będzie od teraz nazywane 4.9.8 i zostanie <a href=\"https://make.wordpress.org/core/2018/07/04/dev-chat-summary-july-4th-4-9-7-week-7/\">opublikowane zgodnie z planem</a>.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.7:</p>\n<p><a href=\"https://profiles.wordpress.org/1naveengiri/\">1naveengiri</a>, <a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/abdullahramzan/\">abdullahramzan</a>, <a href=\"https://profiles.wordpress.org/alejandroxlopez/\">alejandroxlopez</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/aryamaaru/\">Arun</a>, <a href=\"https://profiles.wordpress.org/birgire/\">Birgir Erlendsson (birgire)</a>, <a href=\"https://profiles.wordpress.org/bjornw/\">BjornW</a>, <a href=\"https://profiles.wordpress.org/boonebgorges/\">Boone Gorges</a>, <a href=\"https://profiles.wordpress.org/kraftbj/\">Brandon Kraft</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/dlh/\">David Herrera</a>, <a href=\"https://profiles.wordpress.org/flixos90/\">Felix Arntz</a>, <a href=\"https://profiles.wordpress.org/garetharnold/\">Gareth</a>, <a href=\"https://profiles.wordpress.org/iandunn/\">Ian Dunn</a>, <a href=\"https://profiles.wordpress.org/ianbelanger/\">ibelanger</a>, <a href=\"https://profiles.wordpress.org/johnbillion/\">John Blackbourn</a>, <a href=\"https://profiles.wordpress.org/desrosj/\">Jonathan Desrosiers</a>, <a href=\"https://profiles.wordpress.org/joyously/\">Joy</a>, <a href=\"https://profiles.wordpress.org/khaihong/\">khaihong</a>, <a href=\"https://profiles.wordpress.org/lbenicio/\">lbenicio</a>, <a href=\"https://profiles.wordpress.org/leanderiversen/\">Leander Iversen</a>, <a href=\"https://profiles.wordpress.org/mermel/\">mermel</a>, <a href=\"https://profiles.wordpress.org/metalandcoffee/\">metalandcoffee</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Migrated to @jeffpaul</a>, <a href=\"https://profiles.wordpress.org/palmiak/\">palmiak</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/skoldin/\">skoldin</a>, <a href=\"https://profiles.wordpress.org/subrataemfluence/\">Subrata Sarkar</a>, <a href=\"https://profiles.wordpress.org/itowhid06/\">Towhidul Islam</a>, <a href=\"https://profiles.wordpress.org/warmlaundry/\">warmlaundry</a> oraz <a href=\"https://profiles.wordpress.org/yuriv/\">YuriV</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:43:\"Program WordCamp Poznań 2018 już tu jest!\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:86:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 26 May 2018 08:28:57 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:10:\"Wydarzenia\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"wordcamp\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1817\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:395:\"Pewnie większość z was już wie, że w zeszłym tygodniu opublikowaliśmy program tegorocznego WordCampa, który odbędzie się w dniach 6-8 lipca w Poznaniu. WordCamp Poznań 2018 zbliża się dużymi krokami! Jeśli nie masz jeszcze biletu, to nie zastanawiaj się już dłużej, tylko kup bilet na najważniejsze WordPressowe wydarzenie 2018 roku! Zapraszamy do zapoznania się z [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Katarzyna Gajewska\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2455:\"<p>Pewnie większość z was już wie, że w zeszłym tygodniu opublikowaliśmy program tegorocznego WordCampa, który odbędzie się w dniach <strong>6-8 lipca w Poznaniu</strong>.</p>\n<p>WordCamp Poznań 2018 zbliża się dużymi krokami! Jeśli nie masz jeszcze biletu, to nie zastanawiaj się już dłużej, tylko <a href=\"https://2018.poznan.wordcamp.org/bilety/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>kup bilet</strong></a> na najważniejsze WordPressowe wydarzenie 2018 roku! Zapraszamy do zapoznania się z <a href=\"https://2018.poznan.wordcamp.org/program/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>pełnym programem konferencji</strong></a> i do zapisywania się na warsztaty oraz Contributor Day.</p>\n<p>Startujemy 6 lipca! Pierwszego dnia konferencji po prostu nie można przegapić. Zaczniemy od bardziej praktycznych wyzwań. Każdy uczestnik będzie miał możliwość wzięcia udziału w ciekawych warsztatach, które będą świetną okazją, aby zdobyć nowe umiejętności i poznać ciekawych ludzi. W tym roku zaserwujemy aż 6 różnych warsztatów. Warto zapoznać się z tematami i już dziś zarezerwować sobie miejsce. Równolegle do warsztatów będzie odbywał się <a href=\"https://2018.poznan.wordcamp.org/czym-jest-contributor-day/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>Contributor Day</strong></a>, podczas którego będzie można dołączyć do innych entuzjastów i popracować nad kodem, tłumaczeniem lub zająć się odpowiadaniem na pytania na forum wsparcia. Z pewnością każdy znajdzie tutaj coś dla siebie!</p>\n<p>Kolejne dwa dni konferencji będą wypełnione ciekawymi prelekcjami, na których nie może cię zabraknąć! Tematy są podzielone na dwie ścieżki: ogólną i techniczną. Ścieżkę ogólną polecamy wszystkim, którzy są zainteresowani tematami związanymi z wykorzystaniem WordPressa, blogowaniem i innymi zagadnieniami. Będziecie mieli okazję dowiedzieć się więcej o dostępności, pracy zdalnej, wycenie projektów czy analityce. Z kolei ścieżkę techniczną polecamy uczestnikom poszukującym bardziej specjalistycznej wiedzy. Będzie to świetna okazja, żeby posłuchać prelekcji na temat backupu, automatyzacji zadań czy zabezpieczenia WordPressa. Tematyka zarówno ścieżki ogólnej, jak i technicznej, jest bardzo zróżnicowana. Bez wątpienia każdy znajdzie coś, co go zainteresuje!</p>\n<p>Do zobaczenia w Poznaniu!</p>\n<p>&nbsp;</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"WordPress 4.9.4 – Wydanie poprawiające ważny błąd\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:93:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Feb 2018 18:25:48 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1539\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:489:\"WordPress 4.9.4 jest już dostępny. To wydanie rozwiązuje istotny problem wprowadzony w wersji 4.9.3, który powodował, że strony obsługujące automatyczne aktualizacje nie będą mogły ich przeprowadzić. Wymagane jest ręczne zaktualizowanie WordPressa do wersji 4.9.4 przez Ciebie lub Twojego dostawcę hostingu. Cztery lata temu, w wydaniu 3.7 &#8222;Basie&#8221; WordPressa wprowadziliśmy możliwość automatycznej aktualizacji systemu, dzięki czemu strony stały [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2631:\"<p>WordPress 4.9.4 jest już dostępny.</p>\n<p>To wydanie rozwiązuje istotny problem wprowadzony w wersji 4.9.3, który powodował, że strony obsługujące automatyczne aktualizacje nie będą mogły ich przeprowadzić. <strong><span style=\"text-decoration: underline\">Wymagane jest ręczne zaktualizowanie WordPressa</span> do wersji 4.9.4 przez Ciebie lub Twojego dostawcę hostingu.</strong></p>\n<p><span id=\"more-1539\"></span></p>\n<p>Cztery lata temu, w wydaniu <a href=\"https://wordpress.org/news/2013/10/basie/\">3.7 &#8222;Basie&#8221; WordPressa</a> wprowadziliśmy możliwość automatycznej aktualizacji systemu, dzięki czemu strony stały się bezpieczniejsze i mniej awaryjne &#8211; nawet, jeśli samodzielnie nie miałeś możliwości ich aktualizować. Przez te 4 lata mechanizm ten pomógł milionom witryn, aktualizując je do bieżących wersji i naprawiając bardzo sporadyczne usterki. Niestety we wczorajszym <a href=\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/\">wydaniu 4.9.3</a> znalazł się ważny błąd, który został wykryty dopiero po upublicznieniu nowej wersji systemu. Błąd ten powoduje, że WordPress nie zaktualizuje się automatycznie do wersji 4.9.4, co oznacza, że aktualizację taką trzeba przeprowadzić ręcznie z poziomu panelu administracyjnego lub z pomocą dostawcy serwera hostingowego.</p>\n<p><strong>Aby przeprowadzić ręczną aktualizację, udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Dopóki tego nie wykonasz, WordPress <span style=\"text-decoration: underline\">nie będzie aktualizował się automatycznie do kolejnych wersji</span>. Zalecamy, by zrobić to natychmiast.</strong></p>\n<p>Dostawcy hostingu, którzy aktualizują automatycznie WordPressa w imieniu swoich klientów, mogą przystąpić do aktualizacji w standardowym trybie. Będziemy ściśle współpracować z innymi dostawcami hostingu, by jak najwięcej ich klientów otrzymało tą aktualizację.</p>\n<p><a href=\"https://make.wordpress.org/core/2018/02/06/wordpress-4-9-4-release-the-technical-details/\">Więcej szczegółów technicznych opublikowaliśmy na naszym blogu o tworzeniu rdzenia WordPressa</a>. Pełna lista zmian dostępna jest w <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.9.4&amp;group=component\">spisie zamkniętych wątków</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.4</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:89:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"WordPress 4.9.3 – Wydanie poprawiające błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:79:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:87:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Feb 2018 10:50:35 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1536\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:450:\"WordPress 4.9.3 jest już dostępny. To wydanie zawiera poprawki 34 błędów obecnych w wersji 4.9 WordPressa, w tym dotyczących zestawów zmian na ekranie Personalizacji, widgetów, edytora wizualnego i kompatybilności z PHP 7.2.  Spis wszystkich zmian znajdziesz w liście zamkniętych wątków oraz liście przeprowadzonych zmian. Pobierz WordPressa 4.9.3 lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3596:\"<p>WordPress 4.9.3 jest już dostępny.</p>\n<p>To wydanie zawiera poprawki 34 błędów obecnych w wersji 4.9 WordPressa, w tym dotyczących zestawów zmian na ekranie Personalizacji, widgetów, edytora wizualnego i kompatybilności z PHP 7.2.  Spis wszystkich zmian znajdziesz<span style=\"line-height: 1.5\"> w <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.9.3&amp;group=component\">liście zamkniętych wątków</a> oraz <a href=\"https://core.trac.wordpress.org/log/branches/4.9?rev=42630&amp;stop_rev=42521\">liście przeprowadzonych zmian</a>.</span></p>\n<p><span id=\"more-1536\"></span></p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.3</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.3:</p>\n<p><a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/abdullahramzan/\">abdullahramzan</a>, <a href=\"https://profiles.wordpress.org/adamsilverstein/\">Adam Silverstein</a>, <a href=\"https://profiles.wordpress.org/afercia/\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/andreiglingeanu/\">andreiglingeanu</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/bpayton/\">Brandon Payton</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/coleh/\">coleh</a>, <a href=\"https://profiles.wordpress.org/darko-a7/\">Darko A7</a>, <a href=\"https://profiles.wordpress.org/desertsnowman/\">David Cramer</a>, <a href=\"https://profiles.wordpress.org/dlh/\">David Herrera</a>, <a href=\"https://profiles.wordpress.org/dd32/\">Dion Hulse</a>, <a href=\"https://profiles.wordpress.org/flixos90/\">Felix Arntz</a>, <a href=\"https://profiles.wordpress.org/frank-klein/\">Frank Klein</a>, <a href=\"https://profiles.wordpress.org/pento/\">Gary Pendergast</a>, <a href=\"https://profiles.wordpress.org/audrasjb/\">Jb Audras</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Jeffrey Paul</a>, <a href=\"https://profiles.wordpress.org/lizkarkoski/\">lizkarkoski</a>, <a href=\"https://profiles.wordpress.org/clorith/\">Marius L. J.</a>, <a href=\"https://profiles.wordpress.org/mattyrob/\">mattyrob</a>, <a href=\"https://profiles.wordpress.org/munyagu/\">munyagu</a>, <a href=\"https://profiles.wordpress.org/ndavison/\">ndavison</a>, <a href=\"https://profiles.wordpress.org/nickmomrik/\">Nick Momrik</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc/\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/rachelbaker/\">Rachel Baker</a>, <a href=\"https://profiles.wordpress.org/rishishah/\">rishishah</a>, <a href=\"https://profiles.wordpress.org/othellobloke/\">Ryan Paul</a>, <a href=\"https://profiles.wordpress.org/sasiddiqui/\">Sami Ahmed Siddiqui</a>, <a href=\"https://profiles.wordpress.org/sayedwp/\">Sayed Taqui</a>, <a href=\"https://profiles.wordpress.org/seanchayes/\">Sean Hayes</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/shooper/\">Shawn Hooper</a>, <a href=\"https://profiles.wordpress.org/netweb/\">Stephen Edgar</a>, <a href=\"https://profiles.wordpress.org/manikmist09/\">Sultan Nasir Uddin</a>, <a href=\"https://profiles.wordpress.org/tigertech/\">tigertech</a> oraz <a href=\"https://profiles.wordpress.org/westonruter/\">Weston Ruter</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.9.2 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 17 Jan 2018 11:06:38 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1512\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:467:\"WordPress 4.9.2 jest już dostępny. To wydanie poprawia bezpieczeństwo we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. Wykryto podatność na atak XSS w plikach Flash biblioteki MediaElement, która jest dołączana do WordPressa w celu zapewnienia kompatybilności ze starszym oprogramowaniem. Ponieważ pliki te nie są już potrzebne w zdecydowanej większości przypadków, zostały one usunięte [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:4168:\"<p>WordPress 4.9.2 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1512\"></span></p>\n<p>Wykryto podatność na atak XSS w plikach Flash biblioteki MediaElement, która jest dołączana do WordPressa w celu zapewnienia kompatybilności ze starszym oprogramowaniem. Ponieważ pliki te nie są już potrzebne w zdecydowanej większości przypadków, zostały one usunięte z WordPressa.</p>\n<p>Biblioteka MediaElement została już udostępniona w nowej wersji, która naprawa problem. W repozytorium wtyczek WordPressa znajduje się nowa <a href=\"https://wordpress.org/plugins/mediaelement-flash-fallbacks/\">wtyczka, przywracająca obsługę biblioteki MediaElement z poprawionymi plikami</a>.</p>\n<p>Dziękujemy zgłaszającym (<a href=\"https://opnsec.com\">Enguerran Gillier</a> i <a href=\"https://widiz.com/\">Widiz</a>) za <a href=\"https://make.wordpress.org/core/handbook/reporting-security-vulnerabilities/\">odpowiedzialne ujawnienie</a> problemów z bezpieczeństwem.</p>\n<p>W WordPressie 4.9.2 rozwiązano także 21 innych problemów, w tym:</p>\n<ul>\n<li>naprawiono błędy JavaScript, które uniemożliwiały zapisywanie wpisów w Firefoxie,</li>\n<li>przywrócono wcześniejsze, niezależne od taksonomii działanie <code>get_category_link()</code> i <code>category_description()</code>,</li>\n<li>od teraz zmiana motywu spowoduje podjęcie próby przywrócenia poprzednich przypisań widgetów &#8211; nawet, jeśli w ostatnio używanym motywie nie były dostępne żadne obszary na widgety.</li>\n</ul>\n<p>W dokumentacji Codex znajdziesz <a href=\"https://codex.wordpress.org/Version_4.9.2\">więcej informacji na temat wszystkich rozwiązanych problemów w wersji 4.9.2</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.2</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.2:</p>\n<p><a href=\"https://profiles.wordpress.org/0x6f0/\">0x6f0</a>, <a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/afercia/\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/aduth/\">Andrew Duthie</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/blobfolio/\">Blobfolio</a>, <a href=\"https://profiles.wordpress.org/boonebgorges/\">Boone Gorges</a>, <a href=\"https://profiles.wordpress.org/icaleb/\">Caleb Burks</a>, <a href=\"https://profiles.wordpress.org/poena/\">Carolina Nymark</a>, <a href=\"https://profiles.wordpress.org/chasewg/\">chasewg</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/dd32/\">Dion Hulse</a>, <a href=\"https://profiles.wordpress.org/hardik-amipara/\">Hardik Amipara</a>, <a href=\"https://profiles.wordpress.org/ionvv/\">ionvv</a>, <a href=\"https://profiles.wordpress.org/jaswrks/\">Jason Caldwell</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Jeffrey Paul</a>, <a href=\"https://profiles.wordpress.org/jeremyfelt/\">Jeremy Felt</a>, <a href=\"https://profiles.wordpress.org/joemcgill/\">Joe McGill</a>, <a href=\"https://profiles.wordpress.org/johnschulz/\">johnschulz</a>, <a href=\"https://profiles.wordpress.org/juiiee8487/\">Juhi Patel</a>, <a href=\"https://profiles.wordpress.org/obenland/\">Konstantin Obenland</a>, <a href=\"https://profiles.wordpress.org/markjaquith/\">Mark Jaquith</a>, <a href=\"https://profiles.wordpress.org/rabmalin/\">Nilambar Sharma</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc/\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/rachelbaker/\">Rachel Baker</a>, <a href=\"https://profiles.wordpress.org/rinkuyadav999/\">Rinku Y</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a> oraz <a href=\"https://profiles.wordpress.org/westonruter/\">Weston Ruter</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"WordPress 4.8.3 – Wydanie poprawiające bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:88:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 31 Oct 2017 11:26:39 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1289\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:475:\"WordPress 4.8.3 jest już dostępny. To wydanie poprawia bezpieczeństwo we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. WordPress w wersji 4.8.2 i wcześniejszych jest podatny na problem z $wpdb-&#62;prepare(), który może prowadzić do tworzenia nieoczekiwanych i niebezpiecznych zapytań, umożliwiających potencjalny atak metodą SQL injection (SQLi). Rdzeń systemu nie jest bezpośrednio podatny na ten [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1522:\"<p>WordPress 4.8.3 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1289\"></span></p>\n<p>WordPress w wersji 4.8.2 i wcześniejszych jest podatny na problem z <code>$wpdb-&gt;prepare()</code>, który może prowadzić do tworzenia nieoczekiwanych i niebezpiecznych zapytań, umożliwiających potencjalny atak metodą SQL injection (SQLi). Rdzeń systemu nie jest bezpośrednio podatny na ten problem, ale dodaliśmy dodatkowe zabezpieczenia, by wtyczki i motywy nie mogły go przypadkowo powodować. Problem zgłosił <a href=\"https://twitter.com/ircmaxell\">Anthony Ferrara</a>.</p>\n<p>To wydanie WordPressa zmienia zachowanie funkcji <code>esc_sql()</code>. Różnica nie będzie istotna dla większości programistów. Zachęcamy do <a href=\"https://make.wordpress.org/core/2017/10/31/changed-behaviour-of-esc_sql-in-wordpress-4-8-3/\">przeczytania informacji dla deweloperów</a>.</p>\n<p>Dziękujemy zgłaszającemu za <a href=\"https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/\">odpowiedzialne ujawnienie</a> problemu z bezpieczeństwem.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.8.3</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:93:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 4.9 Beta 2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:66:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 12 Oct 2017 07:03:53 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Wersje testowe\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1235\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:433:\"WordPress 4.9 Beta 2 jest już dostępny! Oprogramowanie jest wciąż w fazie tworzenia, dlatego nie zalecamy jego używania w witrynie produkcyjnej. Zastanów się nad środowiskiem testowym i tam sprawdzaj do woli. Aby przetestować WordPress 4.9, wypróbuj wtyczkę WordPress Beta Tester (regularnie aktualizuje one do  &#8222;krawych nocnych wydań&#8221;) albo pobierz wersję beta (zip). Więcej informacji na temat [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Marcin Pietrzak\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1781:\"<p>WordPress 4.9 Beta 2 jest już dostępny!</p>\n<p><strong>Oprogramowanie jest wciąż w fazie tworzenia</strong>, dlatego nie zalecamy jego używania w witrynie produkcyjnej. Zastanów się nad środowiskiem testowym i tam sprawdzaj do woli. Aby przetestować WordPress 4.9, wypróbuj wtyczkę <a href=\"https://pl.wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> (regularnie aktualizuje one do  &#8222;krawych nocnych wydań&#8221;) albo <a href=\"https://wordpress.org/wordpress-4.9-beta2.zip\">pobierz wersję beta</a> (zip).</p>\n<p>Więcej informacji na temat tego, co nowego w wersji 4.9, znajdziesz w blogu we wpisie <a href=\"https://wordpress.org/news/2017/10/wordpress-4-9-beta-1/\">Beta 1</a> (po angielsku). Od tego czasu dokonaliśmy <a href=\"https://core.trac.wordpress.org/log/trunk/?action=stop_on_copy&amp;mode=stop_on_copy&amp;rev=41846&amp;stop_rev=41777&amp;limit=100&amp;sfp_email=&amp;sfph_mail=\">70 zmian</a> w wersji Beta 2.</p>\n<p><a href=\"https://translate.wordpress.org/locale/pl/default/wp/dev\">Pomóż nam przetłumaczyć WordPress na język polski</a>!</p>\n<p><strong>Jeśli widzisz błąd</strong>, napisz wiadomość na forum <a href=\"https://wordpress.org/support/forum/alphabeta\">Alpha/Beta</a>. Jeżeli coś nie działa, to chcielibyśm się tego dowiedzieć właśnie do ciebie! Jeśli czujesz się na siłach, żeby napisać raport zawierający opis jak powtórzyć błąd to  skorzystaj z serwisu <a href=\"https://make.wordpress.org/core/reports/\">WordPress Trac</a>. Na nim też znajdziesz <a href=\"https://core.trac.wordpress.org/tickets/major\">listę znanych błędów</a>.</p>\n<p><em>Przetestujmy razem:</em><br />\n<em> edytowanie kodu, przełączniki tematyczne,</em><br />\n<em> widgety, harmonogramowanie.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:62:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.8.2 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 22 Sep 2017 11:37:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1213\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:476:\"WordPress 4.8.2 jest już dostępny. Wersja poprawia bezpieczeństwo wszystkich poprzednich wersji i zdecydowanie zachęcamy do natychmiastowej aktualizacji witryn. WordPress w wersji 4.8.1 i starsze mają następujące problemy z bezpieczeństwem: $wpdb-&#62; prepare() mogło tworzyć nieoczekiwane i niebezpieczne zapytania prowadzące do potencjalnego wstrzyknięcia kod SQL (SQLi). Core WordPressa nie jest bezpośrednio narażony na ten problem, ale poprawiono [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Marcin Pietrzak\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3051:\"<p>WordPress 4.8.2 jest już dostępny. Wersja <strong>poprawia bezpieczeństwo</strong> wszystkich poprzednich wersji i zdecydowanie zachęcamy do natychmiastowej aktualizacji witryn.</p>\n<p>WordPress w wersji 4.8.1 i starsze mają następujące problemy z bezpieczeństwem:</p>\n<ol>\n<li><strong>$wpdb-&gt; prepare()</strong> mogło tworzyć nieoczekiwane i niebezpieczne zapytania prowadzące do potencjalnego wstrzyknięcia kod SQL (SQLi). Core WordPressa nie jest bezpośrednio narażony na ten problem, ale poprawiono proces tworzenia zapytań aby zapobiegać podatności we wtyczkach i motywach. Zgłoszone przez <a href=\"https://hackerone.com/slavco\">Slavco</a></li>\n<li>Wykryto podatność na cross-site scripting (XSS) w używaniu oEmbed. Zgłoszone przez xknown zespołu ds. Zabezpieczeń WordPress.</li>\n<li>W edytorze wizualnym wykryto lukę w zabezpieczeniach skryptów przed cross-site scripting (XSS) Zgłoszone przez <a href=\"https://twitter.com/brutelogic\">Rodolfo Assis (@brutelogic)</a> Sucuri Security.</li>\n<li>W kodzie do rozpakowywania wykryto lukę w zabezpieczeniach ścieżki do pliku. Zgłoszone przez <a href=\"https://hackerone.com/noxrnet\">Alex Chapman (noxrnet)</a>.</li>\n<li>W edytorze wtyczek wykryto luka w zabezpieczeniach cross-site scripting (XSS). Zgłoszone przez 陈瑞琦 (Chen Ruiqi).</li>\n<li>Na ekranie użytkownika i terminach edycji zostały wykryte otwarte przekierowanie. Zgłoszone przez <a href=\"https://hackerone.com/ysx\">Yasin Soliman (ysx)</a>.</li>\n<li>Odkryto lukę w zabezpieczeniach ścieżki na ekranie personalizacji witryny. Zgłoszone przez Weston Ruter z zespołu ds. Bezpieczeństwa WordPress.</li>\n<li>Wykryto podatność na cross-site scripting (XSS)  w nazwach szablonów. Zgłoszone przez <a href=\"https://hackerone.com/sikic\">Luka (sikic)</a>.</li>\n<li>Wykryto podatność na cross-site scripting (XSS) w linkach modalnych. Zgłoszone przez <a href=\"https://hackerone.com/qasuar\">Anas Roubi (qasuar)</a>.</li>\n</ol>\n<p>Dziękujemy zgłaszającym za praktykowanie <a href=\"https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/\">odpowiedzialnego ujawnienia (en)</a>.</p>\n<p>Oprócz powyższych kwestii związanych z bezpieczeństwem, WordPress 4.8.2 zawiera 6 poprawek utrzymaniowych serii 4.8. Więcej informacji można znaleźć w <a href=\"https://codex.wordpress.org/Version_4.8.2\">notce wydania wersji (en)</a> oraz na <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.8.2&amp;group=component&amp;col=id&amp;col=summary&amp;col=component&amp;col=status&amp;col=owner&amp;col=type&amp;col=priority&amp;col=keywords&amp;order=priority\">liście zmian</a>.</p>\n<p><a href=\"https://pl.wordpress.org/wordpress-4.8.2-pl_PL.zip\">Pobierz WordPress 4.8.2</a> lub przejdź do Panel → Aktualizacje i kliknij przycisk &#8222;Aktualizuj teraz&#8221;. Strony obsługujące automatyczne aktualizacje w tle już zaczynają aktualizować się do wersji 4.8.2.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do wydania 4.8.2.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:35:\"https://pl.wordpress.org/news/feed/\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"\n	hourly	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"\n	1	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:8:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Tue, 21 Dec 2021 21:19:48 GMT\";s:12:\"content-type\";s:34:\"application/rss+xml; charset=UTF-8\";s:6:\"x-olaf\";s:3:\"⛄\";s:13:\"last-modified\";s:29:\"Wed, 24 Nov 2021 08:51:25 GMT\";s:4:\"link\";s:61:\"<https://pl.wordpress.org/wp-json/>; rel=\"https://api.w.org/\"\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:4:\"x-nc\";s:9:\"HIT ord 2\";}}s:5:\"build\";s:14:\"20201016172007\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(142, '_transient_timeout_feed_mod_a2a8f6ff8f129a81518b9f747f983e41', '1640164789', 'no'),
(143, '_transient_feed_mod_a2a8f6ff8f129a81518b9f747f983e41', '1640121589', 'no'),
(144, '_transient_timeout_feed_a421d6f32723068ab074a40017a9e1f9', '1640164790', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(145, '_transient_feed_a421d6f32723068ab074a40017a9e1f9', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:49:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"WordPress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:24:\"https://pl.wordpress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 27 Nov 2019 09:42:44 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"pl-PL\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://wordpress.org/?v=5.9-beta3-52402\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:10:{i:0;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"WordCamp Łódź 2019\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:64:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 17 Oct 2019 11:30:37 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:10:\"Wydarzenia\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"wordcamp\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=3981\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:454:\"Prowadzisz stronę opartą na WordPressie? Jesteś deweloperem lub prowadzisz działalność opartą o usługi związane z WordPressem? A może jesteś blogerem lub zajmujesz się e-marketingiem? Niezależnie od stopnia znajomości i roli jaką odgrywa WordPress w Twoim życiu, konferencja WordCamp Łódź 2019 skierowana jest właśnie do Ciebie. WordCamp to ogólnopolska konferencja poświęcona pośrednio i bezpośrednio WordPressowi. To [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Katarzyna Gajewska\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3116:\"\n<p>Prowadzisz stronę opartą na WordPressie? Jesteś deweloperem lub prowadzisz działalność opartą o usługi związane z WordPressem? A może jesteś blogerem lub zajmujesz się e-marketingiem? Niezależnie od stopnia znajomości i roli jaką odgrywa WordPress w Twoim życiu, konferencja <strong><a href=\"https://2019.lodz.wordcamp.org/\" target=\"_blank\" rel=\"noreferrer noopener\" aria-label=\"WordCamp Łódź 2019 (opens in a new tab)\">WordCamp Łódź 2019</a></strong> skierowana jest właśnie do Ciebie.<br><br>WordCamp to ogólnopolska konferencja poświęcona pośrednio i bezpośrednio WordPressowi. To doskonała okazja na poszerzenie swojej wiedzy i zdobycie nowych kontaktów, które mogą zaowocować nowymi wyzwaniami w życiu zawodowym. To też doskonała okazja na podzielenie się swoją wiedzą i wymianę doświadczeń z innymi miłośnikami WordPressa. <br><br>WordCamp to trzy dni inspirujących prelekcji prowadzonych przez niesamowitych specjalistów. To warsztaty, dzięki którym zdobędziecie nowe umiejętności. To także Contributor Day &#8211; dzień stworzony specjalnie dla Was &#8211; twórców, deweloperów, tłumaczy, blogerów, projektantów. Tego dnia to Wy możecie podarować swoją pomoc i zaangażowanie w rozwój WordPressa.<br><br>To także spotkania ze sponsorami, dzięki którym WordCamp nie mógłby się odbyć. To oni i ich pomoc sprawia, że konferencja jest dostępna dla tak wielu osób w bardzo przystępnej cenie.<br>Pakiety sponsorskie dostosowane są do różnych potrzeb oraz możliwości. Sponsorami są zarówno duże, międzynarodowe marki, jak i lokalne biznesy działające w naszym regionie. Jeśli chcesz znaleźć się w zacnym gronie sponsorów tegorocznego WordCampa, wybierz odpowiedni pakiet pod tym adresem: <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://2019.lodz.wordcamp.org/zostan-sponsorem-wordcamp-lodz-2019/?fbclid=IwAR0COkUojiqsrmCzYWLHvH0TSJ4cA3t8g_KkqzvT4wDT9Il_LH6cweKVTRo\">https://2019.lodz.wordcamp.org/zostan-sponsorem-wordcamp-lodz-2019/</a><br><br>WordCamp to również networking, czyli wspólna zabawa w trakcie Middle Party. <br><br>Tegoroczny WordCamp odbędzie się w Hotelu Ambasador Premium w Łodzi przy ulicy Kilińskiego 145. Dla Waszej wygody odbędzie się tutaj zarówno pierwszy dzień &#8211; Contributor Day oraz warsztaty, jak i dwa dni konferencyjne poświęcone prezentacjom. Na Middle Party też zapraszamy do Hotelu Ambasador Premium.<br><br>Bilety możecie kupić na naszej stronie internetowej: <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://l.facebook.com/l.php?u=https%3A%2F%2F2019.lodz.wordcamp.org%2Fbilety%2F%3Ffbclid%3DIwAR3mM-avOgA5H501q0GD-Y1_VccHbsAkssRqSiL_-cVvTacnPeuDt-fpHq4&amp;h=AT0XqbIJMRrLiuvJ2dnl3grccZ5OTXPpgmZ7xc5ZdxRe7bKjUN28aGLo6T4YeRHgDnlj2YgcRtaEMkfTJHDGtFS5H_TVjTb998shqjeQS-8QAd-9ZBOK1ko--FQMcGz38J4O41U\">https://2019.lodz.wordcamp.org/bilety/</a><br><br>Przy rejestracji nie zapomnijcie wypełnić specjalnego pola z rozmiarem. Na każdego czeka oficjalny, wyjątkowy Swag! <br><br>Do zobaczenia 22 listopada w Hotelu Ambasador Premium w Łodzi! </p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:60:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"10\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:42:\"Dołącz do grupy tłumaczeniowej na Slack\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:76:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:85:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 31 Jul 2018 07:46:24 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"Polskie tłumaczenie i witryna\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=2025\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:429:\"Autorem tego wpisu jest Magdalena Stanek Tłumaczu porozmawiajmy! Podczas tegorocznego Contributor Day na WordCampie w Poznaniu w grupie tłumaczeniowej zebrała się zaangażowana ekipa, która stwierdziła, że fajnie by było tłumaczyć razem przez cały rok, a nie tylko podczas Contributor Day. W związku z tym założyliśmy kanał Slack dla polskich tłumaczy, gdzie będziemy prowadzić cotygodniowe spotkania [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:19:\"Waclaw Jacek (a11n)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1047:\"\n<p><em>Autorem tego wpisu jest Magdalena Stanek</em></p>\n\n\n\n<p>Tłumaczu porozmawiajmy!</p>\n\n\n\n<p>Podczas tegorocznego Contributor Day na WordCampie w Poznaniu w grupie tłumaczeniowej zebrała się zaangażowana ekipa, która stwierdziła, że fajnie by było tłumaczyć razem przez cały rok, a nie tylko podczas Contributor Day.</p>\n\n\n\n<p>W związku z tym założyliśmy kanał Slack dla polskich tłumaczy, gdzie będziemy prowadzić cotygodniowe spotkania w każdą środę o 20:00. Celem spotkań jest wspólne motywowanie się do  poświęcenia trochę więcej czasu na tłumaczenia, rozwiewanie wątpliwości, dyskutowanie na temat różnych spraw związanych z tłumaczeniami i i oczywiście pomaganie sobie nawzajem. </p>\n\n\n\n<p>Możesz się zalogować tutaj <a href=\"https://wordpresspopolsku.slack.com/signup\">https://wordpresspopolsku.slack.com/signup</a> (do logowania najlepiej użyć swoich danych z wordpress.org).</p>\n\n\n\n<p>Mamy nadzieję, że inicjatywa Cię zainteresuje i dołączysz do nas.<br>\nDo zobaczenia na Slacku!</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"8\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.9.7 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 07 Jul 2018 14:18:34 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1945\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:463:\"WordPress 4.9.7 jest już dostępny. To wydanie poprawia bezpieczeństwo wszystkich wersji systemu począwszy od 3.7. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. WordPress w wersji 4.9.6 i wcześniejszych zawiera błąd związany z obsługą mediów, który może pozwolić użytkownikom z pewnymi prawami dostępu na podjęcie próby usunięcia plików spoza katalogu uploads. Dziękujemy Slavco za zgłoszenie błędu, a także Mattowi [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:4564:\"<p>WordPress 4.9.7 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> wszystkich wersji systemu począwszy od 3.7. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1945\"></span></p>\n<p>WordPress w wersji 4.9.6 i wcześniejszych zawiera błąd związany z obsługą mediów, który może pozwolić użytkownikom z pewnymi prawami dostępu na podjęcie próby usunięcia plików spoza katalogu <em>uploads</em>.</p>\n<p>Dziękujemy <a href=\"https://hackerone.com/slavco\">Slavco</a> za zgłoszenie błędu, a także <a href=\"https://www.wordfence.com/\">Mattowi Barry&#8217;emu</a> za zgłoszenie powiązanych z tą kwestią problemów.</p>\n<p>W WordPressie 4.9.7 naprawiono także 17 innych problemów, w szczególności:</p>\n<ul>\n<li>Taksonomie: Ulepszenie obsługi cache dla zapytań dotyczących terminów.</li>\n<li>Wpisy i inne Typy Treści: Usuwanie ciasteczka dotyczącego hasła dla podstrony, gdy użytkownik wyloguje się.</li>\n<li>Widgety: Dopuszczenie używania podstawowych znaczników HTML w opisach paneli bocznych w sekcji Widgety panelu administracyjnego.</li>\n<li>Kokpit wydarzeń społecznościowych: Zawsze pokazuj najbliższe spotkanie WordCamp, jeśli takowe się zbliża &#8211; nawet, gdy wcześniej planowane są spotkania w dalszych lokalizacjach.</li>\n<li>Prywatność: Upewnienie się, że domyślna treść polityki prywatności nie spowoduje wystąpienia krytycznego błędu podczas czyszczenia reguł przekształcania adresów poza kontekstem administracyjnym.</li>\n</ul>\n<p>W dokumentacji Codex znajdziesz <a href=\"https://codex.wordpress.org/Version_4.9.7\">więcej informacji na temat wszystkich kwestii rozwiązanych w wersji 4.9.7</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.7</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Wcześniej zaplanowane wydanie 4.9.7 będzie od teraz nazywane 4.9.8 i zostanie <a href=\"https://make.wordpress.org/core/2018/07/04/dev-chat-summary-july-4th-4-9-7-week-7/\">opublikowane zgodnie z planem</a>.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.7:</p>\n<p><a href=\"https://profiles.wordpress.org/1naveengiri/\">1naveengiri</a>, <a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/abdullahramzan/\">abdullahramzan</a>, <a href=\"https://profiles.wordpress.org/alejandroxlopez/\">alejandroxlopez</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/aryamaaru/\">Arun</a>, <a href=\"https://profiles.wordpress.org/birgire/\">Birgir Erlendsson (birgire)</a>, <a href=\"https://profiles.wordpress.org/bjornw/\">BjornW</a>, <a href=\"https://profiles.wordpress.org/boonebgorges/\">Boone Gorges</a>, <a href=\"https://profiles.wordpress.org/kraftbj/\">Brandon Kraft</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/dlh/\">David Herrera</a>, <a href=\"https://profiles.wordpress.org/flixos90/\">Felix Arntz</a>, <a href=\"https://profiles.wordpress.org/garetharnold/\">Gareth</a>, <a href=\"https://profiles.wordpress.org/iandunn/\">Ian Dunn</a>, <a href=\"https://profiles.wordpress.org/ianbelanger/\">ibelanger</a>, <a href=\"https://profiles.wordpress.org/johnbillion/\">John Blackbourn</a>, <a href=\"https://profiles.wordpress.org/desrosj/\">Jonathan Desrosiers</a>, <a href=\"https://profiles.wordpress.org/joyously/\">Joy</a>, <a href=\"https://profiles.wordpress.org/khaihong/\">khaihong</a>, <a href=\"https://profiles.wordpress.org/lbenicio/\">lbenicio</a>, <a href=\"https://profiles.wordpress.org/leanderiversen/\">Leander Iversen</a>, <a href=\"https://profiles.wordpress.org/mermel/\">mermel</a>, <a href=\"https://profiles.wordpress.org/metalandcoffee/\">metalandcoffee</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Migrated to @jeffpaul</a>, <a href=\"https://profiles.wordpress.org/palmiak/\">palmiak</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/skoldin/\">skoldin</a>, <a href=\"https://profiles.wordpress.org/subrataemfluence/\">Subrata Sarkar</a>, <a href=\"https://profiles.wordpress.org/itowhid06/\">Towhidul Islam</a>, <a href=\"https://profiles.wordpress.org/warmlaundry/\">warmlaundry</a> oraz <a href=\"https://profiles.wordpress.org/yuriv/\">YuriV</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:43:\"Program WordCamp Poznań 2018 już tu jest!\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:86:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 26 May 2018 08:28:57 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:10:\"Wydarzenia\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"wordcamp\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1817\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:395:\"Pewnie większość z was już wie, że w zeszłym tygodniu opublikowaliśmy program tegorocznego WordCampa, który odbędzie się w dniach 6-8 lipca w Poznaniu. WordCamp Poznań 2018 zbliża się dużymi krokami! Jeśli nie masz jeszcze biletu, to nie zastanawiaj się już dłużej, tylko kup bilet na najważniejsze WordPressowe wydarzenie 2018 roku! Zapraszamy do zapoznania się z [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Katarzyna Gajewska\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2455:\"<p>Pewnie większość z was już wie, że w zeszłym tygodniu opublikowaliśmy program tegorocznego WordCampa, który odbędzie się w dniach <strong>6-8 lipca w Poznaniu</strong>.</p>\n<p>WordCamp Poznań 2018 zbliża się dużymi krokami! Jeśli nie masz jeszcze biletu, to nie zastanawiaj się już dłużej, tylko <a href=\"https://2018.poznan.wordcamp.org/bilety/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>kup bilet</strong></a> na najważniejsze WordPressowe wydarzenie 2018 roku! Zapraszamy do zapoznania się z <a href=\"https://2018.poznan.wordcamp.org/program/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>pełnym programem konferencji</strong></a> i do zapisywania się na warsztaty oraz Contributor Day.</p>\n<p>Startujemy 6 lipca! Pierwszego dnia konferencji po prostu nie można przegapić. Zaczniemy od bardziej praktycznych wyzwań. Każdy uczestnik będzie miał możliwość wzięcia udziału w ciekawych warsztatach, które będą świetną okazją, aby zdobyć nowe umiejętności i poznać ciekawych ludzi. W tym roku zaserwujemy aż 6 różnych warsztatów. Warto zapoznać się z tematami i już dziś zarezerwować sobie miejsce. Równolegle do warsztatów będzie odbywał się <a href=\"https://2018.poznan.wordcamp.org/czym-jest-contributor-day/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>Contributor Day</strong></a>, podczas którego będzie można dołączyć do innych entuzjastów i popracować nad kodem, tłumaczeniem lub zająć się odpowiadaniem na pytania na forum wsparcia. Z pewnością każdy znajdzie tutaj coś dla siebie!</p>\n<p>Kolejne dwa dni konferencji będą wypełnione ciekawymi prelekcjami, na których nie może cię zabraknąć! Tematy są podzielone na dwie ścieżki: ogólną i techniczną. Ścieżkę ogólną polecamy wszystkim, którzy są zainteresowani tematami związanymi z wykorzystaniem WordPressa, blogowaniem i innymi zagadnieniami. Będziecie mieli okazję dowiedzieć się więcej o dostępności, pracy zdalnej, wycenie projektów czy analityce. Z kolei ścieżkę techniczną polecamy uczestnikom poszukującym bardziej specjalistycznej wiedzy. Będzie to świetna okazja, żeby posłuchać prelekcji na temat backupu, automatyzacji zadań czy zabezpieczenia WordPressa. Tematyka zarówno ścieżki ogólnej, jak i technicznej, jest bardzo zróżnicowana. Bez wątpienia każdy znajdzie coś, co go zainteresuje!</p>\n<p>Do zobaczenia w Poznaniu!</p>\n<p>&nbsp;</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"WordPress 4.9.4 – Wydanie poprawiające ważny błąd\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:93:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Feb 2018 18:25:48 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1539\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:489:\"WordPress 4.9.4 jest już dostępny. To wydanie rozwiązuje istotny problem wprowadzony w wersji 4.9.3, który powodował, że strony obsługujące automatyczne aktualizacje nie będą mogły ich przeprowadzić. Wymagane jest ręczne zaktualizowanie WordPressa do wersji 4.9.4 przez Ciebie lub Twojego dostawcę hostingu. Cztery lata temu, w wydaniu 3.7 &#8222;Basie&#8221; WordPressa wprowadziliśmy możliwość automatycznej aktualizacji systemu, dzięki czemu strony stały [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2631:\"<p>WordPress 4.9.4 jest już dostępny.</p>\n<p>To wydanie rozwiązuje istotny problem wprowadzony w wersji 4.9.3, który powodował, że strony obsługujące automatyczne aktualizacje nie będą mogły ich przeprowadzić. <strong><span style=\"text-decoration: underline\">Wymagane jest ręczne zaktualizowanie WordPressa</span> do wersji 4.9.4 przez Ciebie lub Twojego dostawcę hostingu.</strong></p>\n<p><span id=\"more-1539\"></span></p>\n<p>Cztery lata temu, w wydaniu <a href=\"https://wordpress.org/news/2013/10/basie/\">3.7 &#8222;Basie&#8221; WordPressa</a> wprowadziliśmy możliwość automatycznej aktualizacji systemu, dzięki czemu strony stały się bezpieczniejsze i mniej awaryjne &#8211; nawet, jeśli samodzielnie nie miałeś możliwości ich aktualizować. Przez te 4 lata mechanizm ten pomógł milionom witryn, aktualizując je do bieżących wersji i naprawiając bardzo sporadyczne usterki. Niestety we wczorajszym <a href=\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/\">wydaniu 4.9.3</a> znalazł się ważny błąd, który został wykryty dopiero po upublicznieniu nowej wersji systemu. Błąd ten powoduje, że WordPress nie zaktualizuje się automatycznie do wersji 4.9.4, co oznacza, że aktualizację taką trzeba przeprowadzić ręcznie z poziomu panelu administracyjnego lub z pomocą dostawcy serwera hostingowego.</p>\n<p><strong>Aby przeprowadzić ręczną aktualizację, udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Dopóki tego nie wykonasz, WordPress <span style=\"text-decoration: underline\">nie będzie aktualizował się automatycznie do kolejnych wersji</span>. Zalecamy, by zrobić to natychmiast.</strong></p>\n<p>Dostawcy hostingu, którzy aktualizują automatycznie WordPressa w imieniu swoich klientów, mogą przystąpić do aktualizacji w standardowym trybie. Będziemy ściśle współpracować z innymi dostawcami hostingu, by jak najwięcej ich klientów otrzymało tą aktualizację.</p>\n<p><a href=\"https://make.wordpress.org/core/2018/02/06/wordpress-4-9-4-release-the-technical-details/\">Więcej szczegółów technicznych opublikowaliśmy na naszym blogu o tworzeniu rdzenia WordPressa</a>. Pełna lista zmian dostępna jest w <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.9.4&amp;group=component\">spisie zamkniętych wątków</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.4</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:89:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"WordPress 4.9.3 – Wydanie poprawiające błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:79:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:87:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Feb 2018 10:50:35 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1536\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:450:\"WordPress 4.9.3 jest już dostępny. To wydanie zawiera poprawki 34 błędów obecnych w wersji 4.9 WordPressa, w tym dotyczących zestawów zmian na ekranie Personalizacji, widgetów, edytora wizualnego i kompatybilności z PHP 7.2.  Spis wszystkich zmian znajdziesz w liście zamkniętych wątków oraz liście przeprowadzonych zmian. Pobierz WordPressa 4.9.3 lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3596:\"<p>WordPress 4.9.3 jest już dostępny.</p>\n<p>To wydanie zawiera poprawki 34 błędów obecnych w wersji 4.9 WordPressa, w tym dotyczących zestawów zmian na ekranie Personalizacji, widgetów, edytora wizualnego i kompatybilności z PHP 7.2.  Spis wszystkich zmian znajdziesz<span style=\"line-height: 1.5\"> w <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.9.3&amp;group=component\">liście zamkniętych wątków</a> oraz <a href=\"https://core.trac.wordpress.org/log/branches/4.9?rev=42630&amp;stop_rev=42521\">liście przeprowadzonych zmian</a>.</span></p>\n<p><span id=\"more-1536\"></span></p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.3</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.3:</p>\n<p><a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/abdullahramzan/\">abdullahramzan</a>, <a href=\"https://profiles.wordpress.org/adamsilverstein/\">Adam Silverstein</a>, <a href=\"https://profiles.wordpress.org/afercia/\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/andreiglingeanu/\">andreiglingeanu</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/bpayton/\">Brandon Payton</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/coleh/\">coleh</a>, <a href=\"https://profiles.wordpress.org/darko-a7/\">Darko A7</a>, <a href=\"https://profiles.wordpress.org/desertsnowman/\">David Cramer</a>, <a href=\"https://profiles.wordpress.org/dlh/\">David Herrera</a>, <a href=\"https://profiles.wordpress.org/dd32/\">Dion Hulse</a>, <a href=\"https://profiles.wordpress.org/flixos90/\">Felix Arntz</a>, <a href=\"https://profiles.wordpress.org/frank-klein/\">Frank Klein</a>, <a href=\"https://profiles.wordpress.org/pento/\">Gary Pendergast</a>, <a href=\"https://profiles.wordpress.org/audrasjb/\">Jb Audras</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Jeffrey Paul</a>, <a href=\"https://profiles.wordpress.org/lizkarkoski/\">lizkarkoski</a>, <a href=\"https://profiles.wordpress.org/clorith/\">Marius L. J.</a>, <a href=\"https://profiles.wordpress.org/mattyrob/\">mattyrob</a>, <a href=\"https://profiles.wordpress.org/munyagu/\">munyagu</a>, <a href=\"https://profiles.wordpress.org/ndavison/\">ndavison</a>, <a href=\"https://profiles.wordpress.org/nickmomrik/\">Nick Momrik</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc/\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/rachelbaker/\">Rachel Baker</a>, <a href=\"https://profiles.wordpress.org/rishishah/\">rishishah</a>, <a href=\"https://profiles.wordpress.org/othellobloke/\">Ryan Paul</a>, <a href=\"https://profiles.wordpress.org/sasiddiqui/\">Sami Ahmed Siddiqui</a>, <a href=\"https://profiles.wordpress.org/sayedwp/\">Sayed Taqui</a>, <a href=\"https://profiles.wordpress.org/seanchayes/\">Sean Hayes</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/shooper/\">Shawn Hooper</a>, <a href=\"https://profiles.wordpress.org/netweb/\">Stephen Edgar</a>, <a href=\"https://profiles.wordpress.org/manikmist09/\">Sultan Nasir Uddin</a>, <a href=\"https://profiles.wordpress.org/tigertech/\">tigertech</a> oraz <a href=\"https://profiles.wordpress.org/westonruter/\">Weston Ruter</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.9.2 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 17 Jan 2018 11:06:38 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1512\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:467:\"WordPress 4.9.2 jest już dostępny. To wydanie poprawia bezpieczeństwo we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. Wykryto podatność na atak XSS w plikach Flash biblioteki MediaElement, która jest dołączana do WordPressa w celu zapewnienia kompatybilności ze starszym oprogramowaniem. Ponieważ pliki te nie są już potrzebne w zdecydowanej większości przypadków, zostały one usunięte [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:4168:\"<p>WordPress 4.9.2 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1512\"></span></p>\n<p>Wykryto podatność na atak XSS w plikach Flash biblioteki MediaElement, która jest dołączana do WordPressa w celu zapewnienia kompatybilności ze starszym oprogramowaniem. Ponieważ pliki te nie są już potrzebne w zdecydowanej większości przypadków, zostały one usunięte z WordPressa.</p>\n<p>Biblioteka MediaElement została już udostępniona w nowej wersji, która naprawa problem. W repozytorium wtyczek WordPressa znajduje się nowa <a href=\"https://wordpress.org/plugins/mediaelement-flash-fallbacks/\">wtyczka, przywracająca obsługę biblioteki MediaElement z poprawionymi plikami</a>.</p>\n<p>Dziękujemy zgłaszającym (<a href=\"https://opnsec.com\">Enguerran Gillier</a> i <a href=\"https://widiz.com/\">Widiz</a>) za <a href=\"https://make.wordpress.org/core/handbook/reporting-security-vulnerabilities/\">odpowiedzialne ujawnienie</a> problemów z bezpieczeństwem.</p>\n<p>W WordPressie 4.9.2 rozwiązano także 21 innych problemów, w tym:</p>\n<ul>\n<li>naprawiono błędy JavaScript, które uniemożliwiały zapisywanie wpisów w Firefoxie,</li>\n<li>przywrócono wcześniejsze, niezależne od taksonomii działanie <code>get_category_link()</code> i <code>category_description()</code>,</li>\n<li>od teraz zmiana motywu spowoduje podjęcie próby przywrócenia poprzednich przypisań widgetów &#8211; nawet, jeśli w ostatnio używanym motywie nie były dostępne żadne obszary na widgety.</li>\n</ul>\n<p>W dokumentacji Codex znajdziesz <a href=\"https://codex.wordpress.org/Version_4.9.2\">więcej informacji na temat wszystkich rozwiązanych problemów w wersji 4.9.2</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.2</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.2:</p>\n<p><a href=\"https://profiles.wordpress.org/0x6f0/\">0x6f0</a>, <a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/afercia/\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/aduth/\">Andrew Duthie</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/blobfolio/\">Blobfolio</a>, <a href=\"https://profiles.wordpress.org/boonebgorges/\">Boone Gorges</a>, <a href=\"https://profiles.wordpress.org/icaleb/\">Caleb Burks</a>, <a href=\"https://profiles.wordpress.org/poena/\">Carolina Nymark</a>, <a href=\"https://profiles.wordpress.org/chasewg/\">chasewg</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/dd32/\">Dion Hulse</a>, <a href=\"https://profiles.wordpress.org/hardik-amipara/\">Hardik Amipara</a>, <a href=\"https://profiles.wordpress.org/ionvv/\">ionvv</a>, <a href=\"https://profiles.wordpress.org/jaswrks/\">Jason Caldwell</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Jeffrey Paul</a>, <a href=\"https://profiles.wordpress.org/jeremyfelt/\">Jeremy Felt</a>, <a href=\"https://profiles.wordpress.org/joemcgill/\">Joe McGill</a>, <a href=\"https://profiles.wordpress.org/johnschulz/\">johnschulz</a>, <a href=\"https://profiles.wordpress.org/juiiee8487/\">Juhi Patel</a>, <a href=\"https://profiles.wordpress.org/obenland/\">Konstantin Obenland</a>, <a href=\"https://profiles.wordpress.org/markjaquith/\">Mark Jaquith</a>, <a href=\"https://profiles.wordpress.org/rabmalin/\">Nilambar Sharma</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc/\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/rachelbaker/\">Rachel Baker</a>, <a href=\"https://profiles.wordpress.org/rinkuyadav999/\">Rinku Y</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a> oraz <a href=\"https://profiles.wordpress.org/westonruter/\">Weston Ruter</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"WordPress 4.8.3 – Wydanie poprawiające bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:88:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 31 Oct 2017 11:26:39 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1289\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:475:\"WordPress 4.8.3 jest już dostępny. To wydanie poprawia bezpieczeństwo we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. WordPress w wersji 4.8.2 i wcześniejszych jest podatny na problem z $wpdb-&#62;prepare(), który może prowadzić do tworzenia nieoczekiwanych i niebezpiecznych zapytań, umożliwiających potencjalny atak metodą SQL injection (SQLi). Rdzeń systemu nie jest bezpośrednio podatny na ten [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1522:\"<p>WordPress 4.8.3 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1289\"></span></p>\n<p>WordPress w wersji 4.8.2 i wcześniejszych jest podatny na problem z <code>$wpdb-&gt;prepare()</code>, który może prowadzić do tworzenia nieoczekiwanych i niebezpiecznych zapytań, umożliwiających potencjalny atak metodą SQL injection (SQLi). Rdzeń systemu nie jest bezpośrednio podatny na ten problem, ale dodaliśmy dodatkowe zabezpieczenia, by wtyczki i motywy nie mogły go przypadkowo powodować. Problem zgłosił <a href=\"https://twitter.com/ircmaxell\">Anthony Ferrara</a>.</p>\n<p>To wydanie WordPressa zmienia zachowanie funkcji <code>esc_sql()</code>. Różnica nie będzie istotna dla większości programistów. Zachęcamy do <a href=\"https://make.wordpress.org/core/2017/10/31/changed-behaviour-of-esc_sql-in-wordpress-4-8-3/\">przeczytania informacji dla deweloperów</a>.</p>\n<p>Dziękujemy zgłaszającemu za <a href=\"https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/\">odpowiedzialne ujawnienie</a> problemu z bezpieczeństwem.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.8.3</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:93:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 4.9 Beta 2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:66:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 12 Oct 2017 07:03:53 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Wersje testowe\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1235\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:433:\"WordPress 4.9 Beta 2 jest już dostępny! Oprogramowanie jest wciąż w fazie tworzenia, dlatego nie zalecamy jego używania w witrynie produkcyjnej. Zastanów się nad środowiskiem testowym i tam sprawdzaj do woli. Aby przetestować WordPress 4.9, wypróbuj wtyczkę WordPress Beta Tester (regularnie aktualizuje one do  &#8222;krawych nocnych wydań&#8221;) albo pobierz wersję beta (zip). Więcej informacji na temat [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Marcin Pietrzak\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1781:\"<p>WordPress 4.9 Beta 2 jest już dostępny!</p>\n<p><strong>Oprogramowanie jest wciąż w fazie tworzenia</strong>, dlatego nie zalecamy jego używania w witrynie produkcyjnej. Zastanów się nad środowiskiem testowym i tam sprawdzaj do woli. Aby przetestować WordPress 4.9, wypróbuj wtyczkę <a href=\"https://pl.wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> (regularnie aktualizuje one do  &#8222;krawych nocnych wydań&#8221;) albo <a href=\"https://wordpress.org/wordpress-4.9-beta2.zip\">pobierz wersję beta</a> (zip).</p>\n<p>Więcej informacji na temat tego, co nowego w wersji 4.9, znajdziesz w blogu we wpisie <a href=\"https://wordpress.org/news/2017/10/wordpress-4-9-beta-1/\">Beta 1</a> (po angielsku). Od tego czasu dokonaliśmy <a href=\"https://core.trac.wordpress.org/log/trunk/?action=stop_on_copy&amp;mode=stop_on_copy&amp;rev=41846&amp;stop_rev=41777&amp;limit=100&amp;sfp_email=&amp;sfph_mail=\">70 zmian</a> w wersji Beta 2.</p>\n<p><a href=\"https://translate.wordpress.org/locale/pl/default/wp/dev\">Pomóż nam przetłumaczyć WordPress na język polski</a>!</p>\n<p><strong>Jeśli widzisz błąd</strong>, napisz wiadomość na forum <a href=\"https://wordpress.org/support/forum/alphabeta\">Alpha/Beta</a>. Jeżeli coś nie działa, to chcielibyśm się tego dowiedzieć właśnie do ciebie! Jeśli czujesz się na siłach, żeby napisać raport zawierający opis jak powtórzyć błąd to  skorzystaj z serwisu <a href=\"https://make.wordpress.org/core/reports/\">WordPress Trac</a>. Na nim też znajdziesz <a href=\"https://core.trac.wordpress.org/tickets/major\">listę znanych błędów</a>.</p>\n<p><em>Przetestujmy razem:</em><br />\n<em> edytowanie kodu, przełączniki tematyczne,</em><br />\n<em> widgety, harmonogramowanie.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:62:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.8.2 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 22 Sep 2017 11:37:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1213\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:476:\"WordPress 4.8.2 jest już dostępny. Wersja poprawia bezpieczeństwo wszystkich poprzednich wersji i zdecydowanie zachęcamy do natychmiastowej aktualizacji witryn. WordPress w wersji 4.8.1 i starsze mają następujące problemy z bezpieczeństwem: $wpdb-&#62; prepare() mogło tworzyć nieoczekiwane i niebezpieczne zapytania prowadzące do potencjalnego wstrzyknięcia kod SQL (SQLi). Core WordPressa nie jest bezpośrednio narażony na ten problem, ale poprawiono [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Marcin Pietrzak\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3051:\"<p>WordPress 4.8.2 jest już dostępny. Wersja <strong>poprawia bezpieczeństwo</strong> wszystkich poprzednich wersji i zdecydowanie zachęcamy do natychmiastowej aktualizacji witryn.</p>\n<p>WordPress w wersji 4.8.1 i starsze mają następujące problemy z bezpieczeństwem:</p>\n<ol>\n<li><strong>$wpdb-&gt; prepare()</strong> mogło tworzyć nieoczekiwane i niebezpieczne zapytania prowadzące do potencjalnego wstrzyknięcia kod SQL (SQLi). Core WordPressa nie jest bezpośrednio narażony na ten problem, ale poprawiono proces tworzenia zapytań aby zapobiegać podatności we wtyczkach i motywach. Zgłoszone przez <a href=\"https://hackerone.com/slavco\">Slavco</a></li>\n<li>Wykryto podatność na cross-site scripting (XSS) w używaniu oEmbed. Zgłoszone przez xknown zespołu ds. Zabezpieczeń WordPress.</li>\n<li>W edytorze wizualnym wykryto lukę w zabezpieczeniach skryptów przed cross-site scripting (XSS) Zgłoszone przez <a href=\"https://twitter.com/brutelogic\">Rodolfo Assis (@brutelogic)</a> Sucuri Security.</li>\n<li>W kodzie do rozpakowywania wykryto lukę w zabezpieczeniach ścieżki do pliku. Zgłoszone przez <a href=\"https://hackerone.com/noxrnet\">Alex Chapman (noxrnet)</a>.</li>\n<li>W edytorze wtyczek wykryto luka w zabezpieczeniach cross-site scripting (XSS). Zgłoszone przez 陈瑞琦 (Chen Ruiqi).</li>\n<li>Na ekranie użytkownika i terminach edycji zostały wykryte otwarte przekierowanie. Zgłoszone przez <a href=\"https://hackerone.com/ysx\">Yasin Soliman (ysx)</a>.</li>\n<li>Odkryto lukę w zabezpieczeniach ścieżki na ekranie personalizacji witryny. Zgłoszone przez Weston Ruter z zespołu ds. Bezpieczeństwa WordPress.</li>\n<li>Wykryto podatność na cross-site scripting (XSS)  w nazwach szablonów. Zgłoszone przez <a href=\"https://hackerone.com/sikic\">Luka (sikic)</a>.</li>\n<li>Wykryto podatność na cross-site scripting (XSS) w linkach modalnych. Zgłoszone przez <a href=\"https://hackerone.com/qasuar\">Anas Roubi (qasuar)</a>.</li>\n</ol>\n<p>Dziękujemy zgłaszającym za praktykowanie <a href=\"https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/\">odpowiedzialnego ujawnienia (en)</a>.</p>\n<p>Oprócz powyższych kwestii związanych z bezpieczeństwem, WordPress 4.8.2 zawiera 6 poprawek utrzymaniowych serii 4.8. Więcej informacji można znaleźć w <a href=\"https://codex.wordpress.org/Version_4.8.2\">notce wydania wersji (en)</a> oraz na <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.8.2&amp;group=component&amp;col=id&amp;col=summary&amp;col=component&amp;col=status&amp;col=owner&amp;col=type&amp;col=priority&amp;col=keywords&amp;order=priority\">liście zmian</a>.</p>\n<p><a href=\"https://pl.wordpress.org/wordpress-4.8.2-pl_PL.zip\">Pobierz WordPress 4.8.2</a> lub przejdź do Panel → Aktualizacje i kliknij przycisk &#8222;Aktualizuj teraz&#8221;. Strony obsługujące automatyczne aktualizacje w tle już zaczynają aktualizować się do wersji 4.8.2.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do wydania 4.8.2.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:30:\"https://pl.wordpress.org/feed/\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"\n	hourly	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"\n	1	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:8:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Tue, 21 Dec 2021 21:19:49 GMT\";s:12:\"content-type\";s:34:\"application/rss+xml; charset=UTF-8\";s:6:\"x-olaf\";s:3:\"⛄\";s:13:\"last-modified\";s:29:\"Fri, 07 May 2021 01:00:42 GMT\";s:4:\"link\";s:61:\"<https://pl.wordpress.org/wp-json/>; rel=\"https://api.w.org/\"\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:4:\"x-nc\";s:9:\"HIT ord 1\";}}s:5:\"build\";s:14:\"20201016172007\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(146, '_transient_timeout_feed_mod_a421d6f32723068ab074a40017a9e1f9', '1640164790', 'no'),
(147, '_transient_feed_mod_a421d6f32723068ab074a40017a9e1f9', '1640121590', 'no'),
(148, '_transient_timeout_dash_v2_5ed7e1a5d79caaf375d35c33f6782653', '1640164790', 'no'),
(149, '_transient_dash_v2_5ed7e1a5d79caaf375d35c33f6782653', '<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/\'>WordCamp Łódź 2019</a></li><li><a class=\'rsswidget\' href=\'https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/\'>Dołącz do grupy tłumaczeniowej na Slack</a></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/\'>WordCamp Łódź 2019</a></li><li><a class=\'rsswidget\' href=\'https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/\'>Dołącz do grupy tłumaczeniowej na Slack</a></li><li><a class=\'rsswidget\' href=\'https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\'>WordPress 4.9.7 – Wydanie poprawiające bezpieczeństwo i błędy</a></li></ul></div>', 'no'),
(151, 'widget_recent-comments', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(152, 'widget_recent-posts', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(155, 'nav_menu_options', 'a:1:{s:8:\"auto_add\";a:0:{}}', 'yes'),
(158, 'finished_updating_comment_type', '1', 'yes'),
(159, '_site_transient_timeout_wp_remote_block_patterns_68ee87835fb9f68c1b918b2ce720fe2e', '1640125299', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(160, '_site_transient_wp_remote_block_patterns_68ee87835fb9f68c1b918b2ce720fe2e', 'a:26:{i:0;O:8:\"stdClass\":7:{s:2:\"id\";i:2145;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:5:\"Cytat\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:671:\"\n<hr class=\"wp-block-separator is-style-default\" />\n\n\n\n<div class=\"wp-block-image is-style-rounded\"><figure class=\"aligncenter size-large is-resized\"><img loading=\"lazy\" src=\"https://s.w.org/images/core/5.8/portrait.jpg\" alt=\"Profil boczny kobiety w golfie w kolorze russet i białej torebce. Patrzy w górę z zamkniętymi oczami.\" width=\"150\" height=\"150\" /></figure></div>\n\n\n\n<blockquote class=\"wp-block-quote has-text-align-center is-style-large\"><p>&#8222;Przyczynianie się do rozwoju daje mi poczucie, że jestem użyteczny dla planety&#8221;.</p><cite>— Anna Wong, <em>Woluntariusz</em></cite></blockquote>\n\n\n\n<hr class=\"wp-block-separator is-style-default\" />\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:0:\"\";s:19:\"wpop_viewport_width\";i:800;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:1:{i:0;s:4:\"text\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1033:\"<!-- wp:separator {\"className\":\"is-style-default\"} -->\n<hr class=\"wp-block-separator is-style-default\" />\n<!-- /wp:separator -->\n\n<!-- wp:image {\"align\":\"center\",\"width\":150,\"height\":150,\"sizeSlug\":\"large\",\"linkDestination\":\"none\",\"className\":\"is-style-rounded\"} -->\n<div class=\"wp-block-image is-style-rounded\"><figure class=\"aligncenter size-large is-resized\"><img src=\"https://s.w.org/images/core/5.8/portrait.jpg\" alt=\"Profil boczny kobiety w golfie w kolorze russet i białej torebce. Patrzy w górę z zamkniętymi oczami.\" width=\"150\" height=\"150\" /></figure></div>\n<!-- /wp:image -->\n\n<!-- wp:quote {\"align\":\"center\",\"className\":\"is-style-large\"} -->\n<blockquote class=\"wp-block-quote has-text-align-center is-style-large\"><p>\"Przyczynianie się do rozwoju daje mi poczucie, że jestem użyteczny dla planety\".</p><cite>— Anna Wong, <em>Woluntariusz</em></cite></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:separator {\"className\":\"is-style-default\"} -->\n<hr class=\"wp-block-separator is-style-default\" />\n<!-- /wp:separator -->\";}i:1;O:8:\"stdClass\":7:{s:2:\"id\";i:2135;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:40:\"Duży nagłówek z tekstem i przyciskiem\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1059:\"\n<div class=\"wp-block-cover alignfull has-background-dim-40 has-background-dim has-parallax\" style=\"background-image:url(https://s.w.org/images/core/5.8/art-01.jpg);background-color:#000000;min-height:100vh\"><div class=\"wp-block-cover__inner-container\">\n<h2 class=\"alignwide has-white-color has-text-color\" style=\"font-size:48px;line-height:1.2\"><strong><em>Za granicą:</em></strong><br><strong><em>1500 — 1960</em></strong></h2>\n\n\n\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\" style=\"flex-basis:60%\">\n<p class=\"has-text-color\" style=\"color:#ffffff\">Wystawa poświęcona różnym wyobrażeniom oceanu na przestrzeni dziejów, od XVI do XX wieku. Odbywa się w naszym Open Room na <em>Piętrze 2</em>.</p>\n\n\n\n<div class=\"wp-container-61c24485524e1 wp-block-buttons\">\n<div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link has-text-color has-background no-border-radius\" style=\"background-color:#000000;color:#ffffff\">Odwiedź</a></div>\n</div>\n</div>\n\n\n\n<div class=\"wp-block-column\"></div>\n</div>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:68:\"Duży nagłówek z obrazkiem tła i tekstem oraz przycisk na górze.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:1:{i:0;s:6:\"header\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1842:\"<!-- wp:cover {\"url\":\"https://s.w.org/images/core/5.8/art-01.jpg\",\"hasParallax\":true,\"dimRatio\":40,\"customOverlayColor\":\"#000000\",\"minHeight\":100,\"minHeightUnit\":\"vh\",\"contentPosition\":\"center center\",\"align\":\"full\"} -->\n<div class=\"wp-block-cover alignfull has-background-dim-40 has-background-dim has-parallax\" style=\"background-image:url(https://s.w.org/images/core/5.8/art-01.jpg);background-color:#000000;min-height:100vh\"><div class=\"wp-block-cover__inner-container\"><!-- wp:heading {\"style\":{\"typography\":{\"fontSize\":\"48px\",\"lineHeight\":\"1.2\"}},\"className\":\"alignwide has-white-color has-text-color\"} -->\n<h2 class=\"alignwide has-white-color has-text-color\" style=\"font-size:48px;line-height:1.2\"><strong><em>Za granicą:</em></strong><br><strong><em>1500 — 1960</em></strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column {\"width\":\"60%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:60%\"><!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#ffffff\"}}} -->\n<p class=\"has-text-color\" style=\"color:#ffffff\">Wystawa poświęcona różnym wyobrażeniom oceanu na przestrzeni dziejów, od XVI do XX wieku. Odbywa się w naszym Open Room na <em>Piętrze 2</em>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:buttons -->\n<div class=\"wp-block-buttons\"><!-- wp:button {\"borderRadius\":0,\"style\":{\"color\":{\"text\":\"#ffffff\",\"background\":\"#000000\"}},\"className\":\"is-style-outline\"} -->\n<div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link has-text-color has-background no-border-radius\" style=\"background-color:#000000;color:#ffffff\">Odwiedź</a></div>\n<!-- /wp:button --></div>\n<!-- /wp:buttons --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div></div>\n<!-- /wp:cover -->\";}i:2;O:8:\"stdClass\":7:{s:2:\"id\";i:2481;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:47:\"Duży nagłówek z tekstem wyrównanym do lewej\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1039:\"\n<div class=\"wp-block-cover alignfull has-background-dim-60 has-background-dim\" style=\"min-height:800px\"><img class=\"wp-block-cover__image-background\" alt=\"\" src=\"https://s.w.org/images/core/5.8/forest.jpg\" data-object-fit=\"cover\" /><div class=\"wp-block-cover__inner-container\">\n<h2 class=\"alignwide has-text-color\" style=\"color:#ffe074;font-size:64px\">Las.</h2>\n\n\n\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\" style=\"flex-basis:55%\">\n<div style=\"height:330px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<p class=\"has-text-color\" style=\"color:#ffe074;font-size:12px;line-height:1.3\"><em>Nawet dziecko wie, jak cenny jest las. Świeży, zapierający dech w piersiach zapach drzew. Echo ptaków latających nad tą gęstą wielkością. Stabilny klimat, zrównoważone, różnorodne życie i źródło kultury. A jednak, lasy i inne ekosystemy wiszą na włosku, zagrożone przekształceniem w pola uprawne, pastwiska i plantacje.</em></p>\n</div>\n\n\n\n<div class=\"wp-block-column\"></div>\n</div>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:40:\"Zdjęcie na okładce z cytatem na górze\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:8:\"featured\";i:1;s:6:\"header\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1630:\"<!-- wp:cover {\"url\":\"https://s.w.org/images/core/5.8/forest.jpg\",\"dimRatio\":60,\"minHeight\":800,\"align\":\"full\"} -->\n<div class=\"wp-block-cover alignfull has-background-dim-60 has-background-dim\" style=\"min-height:800px\"><img class=\"wp-block-cover__image-background\" alt=\"\" src=\"https://s.w.org/images/core/5.8/forest.jpg\" data-object-fit=\"cover\" /><div class=\"wp-block-cover__inner-container\"><!-- wp:heading {\"align\":\"wide\",\"style\":{\"color\":{\"text\":\"#ffe074\"},\"typography\":{\"fontSize\":\"64px\"}}} -->\n<h2 class=\"alignwide has-text-color\" style=\"color:#ffe074;font-size:64px\">Las.</h2>\n<!-- /wp:heading -->\n\n<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column {\"width\":\"55%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:55%\"><!-- wp:spacer {\"height\":330} -->\n<div style=\"height:330px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#ffe074\"},\"typography\":{\"lineHeight\":\"1.3\",\"fontSize\":\"12px\"}}} -->\n<p class=\"has-text-color\" style=\"color:#ffe074;font-size:12px;line-height:1.3\"><em>Nawet dziecko wie, jak cenny jest las. Świeży, zapierający dech w piersiach zapach drzew. Echo ptaków latających nad tą gęstą wielkością. Stabilny klimat, zrównoważone, różnorodne życie i źródło kultury. A jednak, lasy i inne ekosystemy wiszą na włosku, zagrożone przekształceniem w pola uprawne, pastwiska i plantacje.</em></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div></div>\n<!-- /wp:cover -->\";}i:3;O:8:\"stdClass\":7:{s:2:\"id\";i:2151;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:23:\"Dwa obrazki obok siebie\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:647:\"\n<figure class=\"wp-block-gallery alignwide columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><img src=\"https://s.w.org/images/core/5.8/nature-above-01.jpg\" alt=\"Widok z lotu ptaka na fale rozbijające się o brzeg.\" data-full-url=\"https://s.w.org/images/core/5.8/nature-above-01.jpg\" data-link=\"#\" /></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://s.w.org/images/core/5.8/nature-above-02.jpg\" alt=\"Widok z lotu ptaka na pole. Droga biegnie przez prawy górny róg.\" data-full-url=\"https://s.w.org/images/core/5.8/nature-above-02.jpg\" data-link=\"#\" /></figure></li></ul></figure>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:49:\"Galeria obrazów z dwoma przykładowymi obrazami.\";s:19:\"wpop_viewport_width\";i:800;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:1:{i:0;s:7:\"gallery\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:737:\"<!-- wp:gallery {\"ids\":[null,null],\"linkTo\":\"none\",\"align\":\"wide\"} -->\n<figure class=\"wp-block-gallery alignwide columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><img src=\"https://s.w.org/images/core/5.8/nature-above-01.jpg\" alt=\"Widok z lotu ptaka na fale rozbijające się o brzeg.\" data-full-url=\"https://s.w.org/images/core/5.8/nature-above-01.jpg\" data-link=\"#\" /></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://s.w.org/images/core/5.8/nature-above-02.jpg\" alt=\"Widok z lotu ptaka na pole. Droga biegnie przez prawy górny róg.\" data-full-url=\"https://s.w.org/images/core/5.8/nature-above-02.jpg\" data-link=\"#\" /></figure></li></ul></figure>\n<!-- /wp:gallery -->\";}i:4;O:8:\"stdClass\":7:{s:2:\"id\";i:2149;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:28:\"Dwie kolumny tekstu i tytuł\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1345:\"\n<h2 style=\"font-size:38px;line-height:1.4\"><strong>Podróż rozpoczęła się szczęśliwie, przy błękitnym niebie i spokojnym morzu.</strong></h2>\n\n\n\n<div class=\"wp-block-columns\">\n<div class=\"wp-block-column\">\n<p style=\"font-size:18px\">Weszli za nią na pokład. Dym i domy zniknęły, a statek znajdował się na szerokiej przestrzeni morza, bardzo świeżego i czystego, choć bladego we wczesnym świetle. Zostawili zabłocony Londyn. Bardzo cienka linia cienia zwężała się na horyzoncie, ledwie na tyle gruba, by wytrzymać ciężar Paryża, który jednak na niej spoczywał. Byli wolni od dróg, wolni od ludzi, i ta sama radość z wolności ogarnęła ich wszystkich.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\">\n<p style=\"font-size:18px\">Statek płynął spokojnie przez małe fale, które uderzały w niego, a potem rozchodziły się jak musująca woda, pozostawiając po obu stronach niewielką granicę bąbelków i piany. Bezbarwne październikowe niebo było cienko zachmurzone, jakby przez smugę dymu z ogniska, a powietrze było cudownie słone i rześkie. Rzeczywiście było zbyt zimno, by stać w miejscu. Pani Ambrose objęła ramieniem swego męża, a gdy ruszyli, można było poznać po sposobie, w jaki jej pochylony policzek zwrócił się ku jego, że ma coś prywatnego do zakomunikowania.\n </p>\n</div>\n</div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:53:\"Dwie kolumny tekstu poprzedzone długim nagłówkiem.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:7:\"columns\";i:1;s:4:\"text\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1725:\"<!-- wp:heading {\"style\":{\"typography\":{\"fontSize\":38,\"lineHeight\":\"1.4\"}}} -->\n<h2 style=\"font-size:38px;line-height:1.4\"><strong>Podróż rozpoczęła się szczęśliwie, przy błękitnym niebie i spokojnym morzu.</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"style\":{\"typography\":{\"fontSize\":18}}} -->\n<p style=\"font-size:18px\">Weszli za nią na pokład. Dym i domy zniknęły, a statek znajdował się na szerokiej przestrzeni morza, bardzo świeżego i czystego, choć bladego we wczesnym świetle. Zostawili zabłocony Londyn. Bardzo cienka linia cienia zwężała się na horyzoncie, ledwie na tyle gruba, by wytrzymać ciężar Paryża, który jednak na niej spoczywał. Byli wolni od dróg, wolni od ludzi, i ta sama radość z wolności ogarnęła ich wszystkich.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"style\":{\"typography\":{\"fontSize\":18}}} -->\n<p style=\"font-size:18px\">Statek płynął spokojnie przez małe fale, które uderzały w niego, a potem rozchodziły się jak musująca woda, pozostawiając po obu stronach niewielką granicę bąbelków i piany. Bezbarwne październikowe niebo było cienko zachmurzone, jakby przez smugę dymu z ogniska, a powietrze było cudownie słone i rześkie. Rzeczywiście było zbyt zimno, by stać w miejscu. Pani Ambrose objęła ramieniem swego męża, a gdy ruszyli, można było poznać po sposobie, w jaki jej pochylony policzek zwrócił się ku jego, że ma coś prywatnego do zakomunikowania.\n </p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\";}i:5;O:8:\"stdClass\":7:{s:2:\"id\";i:2208;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:48:\"Dwie kolumny tekstu z przesuniętym nagłówkiem\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1968:\"\n<div class=\"wp-container-61c244855538d wp-block-group alignfull has-background\" style=\"background-color:#f2f0e9\"><div class=\"wp-block-group__inner-container\">\n<div style=\"height:70px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<div class=\"wp-block-columns alignwide are-vertically-aligned-center\">\n<div class=\"wp-block-column\" style=\"flex-basis:50%\">\n<p class=\"has-text-color\" style=\"color:#000000;font-size:30px;line-height:1.1\"><strong>Oceaniczna inspiracja</strong></p>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:50%\">\n<hr class=\"wp-block-separator has-text-color has-background is-style-wide\" style=\"background-color:#000000;color:#000000\" />\n</div>\n</div>\n\n\n\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\"></div>\n\n\n\n<div class=\"wp-block-column\">\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">Zawinąwszy welony wokół głów, kobiety weszły na pokład. Posuwali się teraz statecznie w dół rzeki, mijając ciemne kształty zakotwiczonych statków, a Londyn był rojem świateł z bladożółtym baldachimem opadającym nad nim. Były tam światła wielkich teatrów, światła długich ulic, światła, które wskazywały ogromne place domowego komfortu, światła, które wisiały wysoko w powietrzu.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\">\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">Żaden mrok nigdy nie osiadłby na tych lampach, tak jak nie osiadł na nich żaden mrok od setek lat. Straszne wydawało się to, że miasto powinno płonąć wiecznie w tym samym miejscu; straszne przynajmniej dla ludzi wyruszających na morskie przygody, którzy widzieli je jako otoczony kopiec, wiecznie spalony, wiecznie pokryty bliznami. Z pokładu statku wielkie miasto ukazało się jako przygarbiona i tchórzliwa postać, osowiały nędzarz. </p>\n</div>\n</div>\n\n\n\n<div style=\"height:40px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:49:\"Dwie kolumny tekstu z przesuniętym nagłówkiem.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:7:\"columns\";i:1;s:4:\"text\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:2890:\"<!-- wp:group {\"align\":\"full\",\"style\":{\"color\":{\"background\":\"#f2f0e9\"}}} -->\n<div class=\"wp-block-group alignfull has-background\" style=\"background-color:#f2f0e9\"><!-- wp:spacer {\"height\":70} -->\n<div style=\"height:70px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:columns {\"verticalAlignment\":\"center\",\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide are-vertically-aligned-center\"><!-- wp:column {\"width\":\"50%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:50%\"><!-- wp:paragraph {\"style\":{\"typography\":{\"lineHeight\":\"1.1\",\"fontSize\":\"30px\"},\"color\":{\"text\":\"#000000\"}}} -->\n<p class=\"has-text-color\" style=\"color:#000000;font-size:30px;line-height:1.1\"><strong>Oceaniczna inspiracja</strong></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"width\":\"50%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:50%\"><!-- wp:separator {\"customColor\":\"#000000\",\"className\":\"is-style-wide\"} -->\n<hr class=\"wp-block-separator has-text-color has-background is-style-wide\" style=\"background-color:#000000;color:#000000\" />\n<!-- /wp:separator --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column -->\n<div class=\"wp-block-column\"></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#000000\"}},\"fontSize\":\"extra-small\"} -->\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">Zawinąwszy welony wokół głów, kobiety weszły na pokład. Posuwali się teraz statecznie w dół rzeki, mijając ciemne kształty zakotwiczonych statków, a Londyn był rojem świateł z bladożółtym baldachimem opadającym nad nim. Były tam światła wielkich teatrów, światła długich ulic, światła, które wskazywały ogromne place domowego komfortu, światła, które wisiały wysoko w powietrzu.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#000000\"}},\"fontSize\":\"extra-small\"} -->\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">Żaden mrok nigdy nie osiadłby na tych lampach, tak jak nie osiadł na nich żaden mrok od setek lat. Straszne wydawało się to, że miasto powinno płonąć wiecznie w tym samym miejscu; straszne przynajmniej dla ludzi wyruszających na morskie przygody, którzy widzieli je jako otoczony kopiec, wiecznie spalony, wiecznie pokryty bliznami. Z pokładu statku wielkie miasto ukazało się jako przygarbiona i tchórzliwa postać, osowiały nędzarz. </p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:spacer {\"height\":40} -->\n<div style=\"height:40px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer --></div>\n<!-- /wp:group -->\";}i:6;O:8:\"stdClass\":7:{s:2:\"id\";i:2131;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:47:\"Media i tekst w kontenerze o pełnej wysokości\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1277:\"\n<div class=\"wp-block-cover alignfull has-background-dim\" style=\"background-color:#ffffff;min-height:100vh\"><div class=\"wp-block-cover__inner-container\">\n<div class=\"wp-block-media-text alignwide is-stacked-on-mobile is-vertically-aligned-center is-image-fill\" style=\"grid-template-columns:56% auto\"><figure class=\"wp-block-media-text__media\" style=\"background-image:url(https://s.w.org/images/core/5.8/soil.jpg);background-position:50% 50%\"><img src=\"https://s.w.org/images/core/5.8/soil.jpg\" alt=\"Zbliżenie na wyschniętą, spękaną ziemię.\" /></figure><div class=\"wp-block-media-text__content\">\n<h2 class=\"has-text-color\" style=\"color:#000000;font-size:32px\"><strong>Jaki jest problem?</strong></h2>\n\n\n\n<p class=\"has-text-color\" style=\"color:#000000;font-size:17px\">Drzewa są dziś ważniejsze niż kiedykolwiek wcześniej. Z drzew wytwarza się podobno ponad 10 000 produktów. Dzięki chemii ze niewielkich stosów drewna powstają chemikalia, tworzywa sztuczne i tkaniny, które były nie do wyobrażenia, gdy topór po raz pierwszy ściął teksańskie drzewo.</p>\n\n\n\n<div class=\"wp-container-61c244855643c wp-block-buttons\">\n<div class=\"wp-block-button is-style-fill\"><a class=\"wp-block-button__link\">Dowiedz się więcej</a></div>\n</div>\n</div></div>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:89:\"Blok medialno-tekstowy z obrazkiem po lewej stronie i tekstem oraz przyciskiem po prawej.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:1:{i:0;s:6:\"header\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1920:\"<!-- wp:cover {\"customOverlayColor\":\"#ffffff\",\"minHeight\":100,\"minHeightUnit\":\"vh\",\"contentPosition\":\"center center\",\"align\":\"full\"} -->\n<div class=\"wp-block-cover alignfull has-background-dim\" style=\"background-color:#ffffff;min-height:100vh\"><div class=\"wp-block-cover__inner-container\"><!-- wp:media-text {\"mediaLink\":\"https://s.w.org/images/core/5.8/soil.jpg\",\"mediaType\":\"image\",\"mediaWidth\":56,\"verticalAlignment\":\"center\",\"imageFill\":true} -->\n<div class=\"wp-block-media-text alignwide is-stacked-on-mobile is-vertically-aligned-center is-image-fill\" style=\"grid-template-columns:56% auto\"><figure class=\"wp-block-media-text__media\" style=\"background-image:url(https://s.w.org/images/core/5.8/soil.jpg);background-position:50% 50%\"><img src=\"https://s.w.org/images/core/5.8/soil.jpg\" alt=\"Zbliżenie na wyschniętą, spękaną ziemię.\" /></figure><div class=\"wp-block-media-text__content\"><!-- wp:heading {\"style\":{\"typography\":{\"fontSize\":\"32px\"},\"color\":{\"text\":\"#000000\"}}} -->\n<h2 class=\"has-text-color\" style=\"color:#000000;font-size:32px\"><strong>Jaki jest problem?</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"style\":{\"typography\":{\"fontSize\":\"17px\"},\"color\":{\"text\":\"#000000\"}}} -->\n<p class=\"has-text-color\" style=\"color:#000000;font-size:17px\">Drzewa są dziś ważniejsze niż kiedykolwiek wcześniej. Z drzew wytwarza się podobno ponad 10 000 produktów. Dzięki chemii ze niewielkich stosów drewna powstają chemikalia, tworzywa sztuczne i tkaniny, które były nie do wyobrażenia, gdy topór po raz pierwszy ściął teksańskie drzewo.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:buttons -->\n<div class=\"wp-block-buttons\"><!-- wp:button {\"className\":\"is-style-fill\"} -->\n<div class=\"wp-block-button is-style-fill\"><a class=\"wp-block-button__link\">Dowiedz się więcej</a></div>\n<!-- /wp:button --></div>\n<!-- /wp:buttons --></div></div>\n<!-- /wp:media-text --></div></div>\n<!-- /wp:cover -->\";}i:7;O:8:\"stdClass\":7:{s:2:\"id\";i:2209;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:34:\"Media i tekst z obrazkiem po lewej\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:547:\"\n<div class=\"wp-block-media-text alignfull is-stacked-on-mobile is-vertically-aligned-center\"><figure class=\"wp-block-media-text__media\"><img src=\"https://s.w.org/images/core/5.8/architecture-04.jpg\" alt=\"Zbliżenie, abstrakcyjny widok na architekturę.\" /></figure><div class=\"wp-block-media-text__content\">\n<h3 class=\"has-text-align-center has-text-color\" style=\"color:#000000\"><strong>Otwarte przestrzenie</strong></h3>\n\n\n\n<p class=\"has-text-align-center has-extra-small-font-size\"><a href=\"#\">Zobacz przypadek użycia ↗</a></p>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:70:\"Blok medialno-tekstowy z obrazem po lewej i tekstem po prawej stronie.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:8:\"featured\";i:1;s:6:\"header\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:854:\"<!-- wp:media-text {\"align\":\"full\",\"mediaType\":\"image\",\"verticalAlignment\":\"center\"} -->\n<div class=\"wp-block-media-text alignfull is-stacked-on-mobile is-vertically-aligned-center\"><figure class=\"wp-block-media-text__media\"><img src=\"https://s.w.org/images/core/5.8/architecture-04.jpg\" alt=\"Zbliżenie, abstrakcyjny widok na architekturę.\" /></figure><div class=\"wp-block-media-text__content\"><!-- wp:heading {\"textAlign\":\"center\",\"level\":3,\"style\":{\"color\":{\"text\":\"#000000\"}}} -->\n<h3 class=\"has-text-align-center has-text-color\" style=\"color:#000000\"><strong>Otwarte przestrzenie</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"align\":\"center\",\"fontSize\":\"extra-small\"} -->\n<p class=\"has-text-align-center has-extra-small-font-size\"><a href=\"#\">Zobacz przypadek użycia ↗</a></p>\n<!-- /wp:paragraph --></div></div>\n<!-- /wp:media-text -->\";}i:8;O:8:\"stdClass\":7:{s:2:\"id\";i:2477;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:35:\"Media i tekst z obrazkiem po prawej\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:715:\"\n<div class=\"wp-block-media-text alignfull has-media-on-the-right is-stacked-on-mobile is-vertically-aligned-center is-style-default\" style=\"grid-template-columns:auto 56%\"><figure class=\"wp-block-media-text__media\"><img src=\"https://s.w.org/images/core/5.8/art-02.jpg\" alt=\"Zielony i brązowy krajobraz wiejski prowadzący do jasnoniebieskiego oceanu i lekko zachmurzonego nieba, wykonany farbami olejnymi.\" /></figure><div class=\"wp-block-media-text__content\">\n<h2 class=\"has-text-color\" style=\"color:#000000\"><strong>Brzeg z błękitnym morzem</strong></h2>\n\n\n\n<p class=\"has-text-color\" style=\"color:#636363;font-size:17px;line-height:1.1\">Eleanor Harris&nbsp;(Amerykanka, 1901-1942)</p>\n</div></div>\n\n\n\n<p></p>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:70:\"Blok medialno-tekstowy z obrazem po prawej i tekstem po lewej stronie.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:1:{i:0;s:6:\"header\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1168:\"<!-- wp:media-text {\"align\":\"full\",\"mediaPosition\":\"right\",\"mediaLink\":\"#\",\"mediaType\":\"image\",\"mediaWidth\":56,\"verticalAlignment\":\"center\",\"className\":\"is-style-default\"} -->\n<div class=\"wp-block-media-text alignfull has-media-on-the-right is-stacked-on-mobile is-vertically-aligned-center is-style-default\" style=\"grid-template-columns:auto 56%\"><figure class=\"wp-block-media-text__media\"><img src=\"https://s.w.org/images/core/5.8/art-02.jpg\" alt=\"Zielony i brązowy krajobraz wiejski prowadzący do jasnoniebieskiego oceanu i lekko zachmurzonego nieba, wykonany farbami olejnymi.\" /></figure><div class=\"wp-block-media-text__content\"><!-- wp:heading {\"style\":{\"color\":{\"text\":\"#000000\"}}} -->\n<h2 class=\"has-text-color\" style=\"color:#000000\"><strong>Brzeg z błękitnym morzem</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"style\":{\"typography\":{\"lineHeight\":\"1.1\",\"fontSize\":\"17px\"},\"color\":{\"text\":\"#636363\"}}} -->\n<p class=\"has-text-color\" style=\"color:#636363;font-size:17px;line-height:1.1\">Eleanor Harris&nbsp;(Amerykanka, 1901-1942)</p>\n<!-- /wp:paragraph --></div></div>\n<!-- /wp:media-text -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\";}i:9;O:8:\"stdClass\":7:{s:2:\"id\";i:2210;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:10:\"Nagłówek\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:292:\"\n<h2 class=\"alignwide\" style=\"font-size:48px;line-height:1.1\">Jesteśmy studiem w Berlinie z międzynarodową doświadczeniem w architekturze, urbanistyce i projektowaniu wnętrz. Wierzymy w dzielenie się wiedzą i promowanie dialogu, aby zwiększyć kreatywny potencjał współpracy.</h2>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:16:\"Tekst nagłówka\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:8:\"featured\";i:1;s:4:\"text\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:410:\"<!-- wp:heading {\"align\":\"wide\",\"style\":{\"typography\":{\"fontSize\":\"48px\",\"lineHeight\":\"1.1\"}}} -->\n<h2 class=\"alignwide\" style=\"font-size:48px;line-height:1.1\">Jesteśmy studiem w Berlinie z międzynarodową doświadczeniem w architekturze, urbanistyce i projektowaniu wnętrz. Wierzymy w dzielenie się wiedzą i promowanie dialogu, aby zwiększyć kreatywny potencjał współpracy.</h2>\n<!-- /wp:heading -->\";}i:10;O:8:\"stdClass\":7:{s:2:\"id\";i:2205;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:32:\"Three columns with offset images\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1098:\"\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\" style=\"flex-basis:25%\">\n<figure class=\"wp-block-image size-large is-style-default\"><img src=\"https://s.w.org/images/core/5.8/architecture-01.jpg\" alt=\"Zbliżenie, abstrakcyjny widok na geometryczną architekturę.\" /></figure>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:25%\">\n<div style=\"height:500px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<div style=\"height:150px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/architecture-02.jpg\" alt=\"Zbliżenie, widok pod kątem na okno w białym budynku.\" /></figure>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:45%\">\n<figure class=\"wp-block-image size-large is-style-default\"><img src=\"https://s.w.org/images/core/5.8/architecture-03.jpg\" alt=\"Zbliżenie na narożnik białego, geometrycznego budynku z ostrymi punktami i okrągłymi narożnikami.\" /></figure>\n\n\n\n<div style=\"height:285px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n</div>\n</div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:39:\"Trzy kolumny z przesuniętymi obrazami.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:7:\"gallery\";i:1;s:6:\"images\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1774:\"<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column {\"width\":\"25%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:25%\"><!-- wp:image {\"sizeSlug\":\"large\",\"linkDestination\":\"none\",\"className\":\"is-style-default\"} -->\n<figure class=\"wp-block-image size-large is-style-default\"><img src=\"https://s.w.org/images/core/5.8/architecture-01.jpg\" alt=\"Zbliżenie, abstrakcyjny widok na geometryczną architekturę.\" /></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"width\":\"25%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:25%\"><!-- wp:spacer {\"height\":500} -->\n<div style=\"height:500px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:spacer {\"height\":150} -->\n<div style=\"height:150px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:image {\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/architecture-02.jpg\" alt=\"Zbliżenie, widok pod kątem na okno w białym budynku.\" /></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"width\":\"45%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:45%\"><!-- wp:image {\"sizeSlug\":\"large\",\"linkDestination\":\"none\",\"className\":\"is-style-default\"} -->\n<figure class=\"wp-block-image size-large is-style-default\"><img src=\"https://s.w.org/images/core/5.8/architecture-03.jpg\" alt=\"Zbliżenie na narożnik białego, geometrycznego budynku z ostrymi punktami i okrągłymi narożnikami.\" /></figure>\n<!-- /wp:image -->\n\n<!-- wp:spacer {\"height\":285} -->\n<div style=\"height:285px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\";}i:11;O:8:\"stdClass\":7:{s:2:\"id\";i:2206;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:19:\"Trzy kolumny tekstu\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:819:\"\n<div class=\"wp-block-columns alignfull has-text-color has-background\" style=\"background-color:#ffffff;color:#000000\">\n<div class=\"wp-block-column\">\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"https://wordpress.org\">Przydatne informacje ↗</a></strong></h3>\n\n\n\n<p>Get a virtual tour of the museum. Ideal for schools and events.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\">\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"https://wordpress.org\">Current Shows ↗</a></strong></h3>\n\n\n\n<p>Stay updated and see our current exhibitions here.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\">\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"https://wordpress.org\">Przydatne informacje ↗</a></strong></h3>\n\n\n\n<p>Get to know our opening times, ticket prices and discounts.</p>\n</div>\n</div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:20:\"Trzy kolumny tekstu.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:3:{i:0;s:7:\"columns\";i:1;s:8:\"featured\";i:2;s:4:\"text\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1514:\"<!-- wp:columns {\"align\":\"full\",\"style\":{\"color\":{\"text\":\"#000000\",\"background\":\"#ffffff\"}}} -->\n<div class=\"wp-block-columns alignfull has-text-color has-background\" style=\"background-color:#ffffff;color:#000000\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:heading {\"level\":3,\"style\":{\"typography\":{\"fontSize\":\"24px\",\"lineHeight\":\"1.3\"}}} -->\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"https://wordpress.org\">Przydatne informacje ↗</a></strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Get a virtual tour of the museum. Ideal for schools and events.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:heading {\"level\":3,\"style\":{\"typography\":{\"fontSize\":\"24px\",\"lineHeight\":\"1.3\"}}} -->\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"https://wordpress.org\">Current Shows ↗</a></strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Stay updated and see our current exhibitions here.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:heading {\"level\":3,\"style\":{\"typography\":{\"fontSize\":\"24px\",\"lineHeight\":\"1.3\"}}} -->\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"https://wordpress.org\">Przydatne informacje ↗</a></strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Get to know our opening times, ticket prices and discounts.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\";}i:12;O:8:\"stdClass\":7:{s:2:\"id\";i:2207;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:34:\"Trzy kolumny z obrazkami i tekstem\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:2661:\"\n<div class=\"wp-container-61c244855ae0f wp-block-group alignfull has-background\" style=\"background-color:#f8f4e4\"><div class=\"wp-block-group__inner-container\">\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\">\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<h6 class=\"has-text-color\" style=\"color:#000000\">EKOSYSTEM</h6>\n\n\n\n<p class=\"has-text-color\" style=\"color:#000000;font-size:5vw;line-height:1.1\"><strong>Positive growth.</strong></p>\n\n\n\n<div style=\"height:5px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n</div>\n</div>\n\n\n\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\" style=\"flex-basis:33.38%\">\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\"><em>Nature</em>, in the common sense, refers to essences unchanged by man; space, the air, the river, the leaf.&nbsp;<em>Art</em>&nbsp;is applied to the mixture of his will with the same things, as in a house, a canal, a statue, a picture. But his operations taken together are so insignificant, a little chipping, baking, patching, and washing, that in an impression so grand as that of the world on the human mind, they do not vary the result.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:33%\">\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-01.jpg\" alt=\"Słońce zachodzące przez gęsty las drzew.\" /></figure>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:33.62%\">\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-02.jpg\" alt=\"Turbiny wiatrowe stojące na trawiastej równinie, na tle błękitnego nieba.\" /></figure>\n</div>\n</div>\n\n\n\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\" style=\"flex-basis:67%\">\n<div class=\"wp-block-image\"><figure class=\"alignright size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-03.jpg\" alt=\"Słońce świeciło nad granią schodzącą do brzegu. W oddali po drodze jedzie samochód.\" /></figure></div>\n</div>\n\n\n\n<div class=\"wp-block-column is-vertically-aligned-center\" style=\"flex-basis:33%\">\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">Niewątpliwie nie mamy pytań, na które nie ma odpowiedzi. Musimy ufać doskonałości stworzenia tak dalece, aby wierzyć, że jakakolwiek ciekawość porządku rzeczy, wzbudzona w naszych umysłach, porządek rzeczy może ją zaspokoić. Stan każdego człowieka jest rozwiązaniem w hieroglifie na te pytania, które on by postawił.</p>\n</div>\n</div>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:71:\"Trzy kolumny z obrazami i tekstem, z pionowymi odstępami dla wyglądu.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"pl_PL\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:7:\"columns\";i:1;s:8:\"featured\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:4001:\"<!-- wp:group {\"align\":\"full\",\"style\":{\"color\":{\"background\":\"#f8f4e4\"}}} -->\n<div class=\"wp-block-group alignfull has-background\" style=\"background-color:#f8f4e4\"><!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:spacer -->\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:heading {\"level\":6,\"style\":{\"color\":{\"text\":\"#000000\"}}} -->\n<h6 class=\"has-text-color\" style=\"color:#000000\">EKOSYSTEM</h6>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"style\":{\"typography\":{\"lineHeight\":\"1.1\",\"fontSize\":\"5vw\"},\"color\":{\"text\":\"#000000\"}}} -->\n<p class=\"has-text-color\" style=\"color:#000000;font-size:5vw;line-height:1.1\"><strong>Positive growth.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:spacer {\"height\":5} -->\n<div style=\"height:5px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column {\"width\":\"33.38%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:33.38%\"><!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#000000\"}},\"fontSize\":\"extra-small\"} -->\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\"><em>Nature</em>, in the common sense, refers to essences unchanged by man; space, the air, the river, the leaf.&nbsp;<em>Art</em>&nbsp;is applied to the mixture of his will with the same things, as in a house, a canal, a statue, a picture. But his operations taken together are so insignificant, a little chipping, baking, patching, and washing, that in an impression so grand as that of the world on the human mind, they do not vary the result.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"width\":\"33%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:33%\"><!-- wp:spacer -->\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:image {\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-01.jpg\" alt=\"Słońce zachodzące przez gęsty las drzew.\" /></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"width\":\"33.62%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:33.62%\"><!-- wp:image {\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-02.jpg\" alt=\"Turbiny wiatrowe stojące na trawiastej równinie, na tle błękitnego nieba.\" /></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column {\"width\":\"67%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:67%\"><!-- wp:image {\"align\":\"right\",\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<div class=\"wp-block-image\"><figure class=\"alignright size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-03.jpg\" alt=\"Słońce świeciło nad granią schodzącą do brzegu. W oddali po drodze jedzie samochód.\" /></figure></div>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"verticalAlignment\":\"center\",\"width\":\"33%\"} -->\n<div class=\"wp-block-column is-vertically-aligned-center\" style=\"flex-basis:33%\"><!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#000000\"}},\"fontSize\":\"extra-small\"} -->\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">Niewątpliwie nie mamy pytań, na które nie ma odpowiedzi. Musimy ufać doskonałości stworzenia tak dalece, aby wierzyć, że jakakolwiek ciekawość porządku rzeczy, wzbudzona w naszych umysłach, porządek rzeczy może ją zaspokoić. Stan każdego człowieka jest rozwiązaniem w hieroglifie na te pytania, które on by postawił.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div>\n<!-- /wp:group -->\";}i:13;O:8:\"stdClass\":7:{s:2:\"id\";i:184;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:7:\"Heading\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:290:\"\n<h2 class=\"alignwide\" style=\"font-size:48px;line-height:1.1\">We&#8217;re a studio in Berlin with an international practice in architecture, urban planning and interior design. We believe in sharing knowledge and promoting dialogue to increase the creative potential of collaboration.</h2>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:12:\"Heading text\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:1:{i:0;s:12:\"core/heading\";}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:8:\"featured\";i:1;s:4:\"text\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:402:\"<!-- wp:heading {\"align\":\"wide\",\"style\":{\"typography\":{\"fontSize\":\"48px\",\"lineHeight\":\"1.1\"}}} -->\n<h2 class=\"alignwide\" style=\"font-size:48px;line-height:1.1\">We\'re a studio in Berlin with an international practice in architecture, urban planning and interior design. We believe in sharing knowledge and promoting dialogue to increase the creative potential of collaboration.</h2>\n<!-- /wp:heading -->\";}i:14;O:8:\"stdClass\":7:{s:2:\"id\";i:185;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:35:\"Large header with left-aligned text\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1019:\"\n<div class=\"wp-block-cover alignfull has-background-dim-60 has-background-dim\" style=\"min-height:800px\"><img class=\"wp-block-cover__image-background\" alt=\"\" src=\"https://s.w.org/images/core/5.8/forest.jpg\" data-object-fit=\"cover\" /><div class=\"wp-block-cover__inner-container\">\n<h2 class=\"alignwide has-text-color\" style=\"color:#ffe074;font-size:64px\">Forest.</h2>\n\n\n\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\" style=\"flex-basis:55%\">\n<div style=\"height:330px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<p class=\"has-text-color\" style=\"color:#ffe074;font-size:12px;line-height:1.3\"><em>Even a child knows how valuable the forest is. The fresh, breathtaking smell of trees. Echoing birds flying above that dense magnitude. A stable climate, a sustainable diverse life and a source of culture. Yet, forests and other ecosystems hang in the balance, threatened to become croplands, pasture, and plantations.</em></p>\n</div>\n\n\n\n<div class=\"wp-block-column\"></div>\n</div>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:29:\"Cover image with quote on top\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:8:\"featured\";i:1;s:6:\"header\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1610:\"<!-- wp:cover {\"url\":\"https://s.w.org/images/core/5.8/forest.jpg\",\"dimRatio\":60,\"minHeight\":800,\"align\":\"full\"} -->\n<div class=\"wp-block-cover alignfull has-background-dim-60 has-background-dim\" style=\"min-height:800px\"><img class=\"wp-block-cover__image-background\" alt=\"\" src=\"https://s.w.org/images/core/5.8/forest.jpg\" data-object-fit=\"cover\" /><div class=\"wp-block-cover__inner-container\"><!-- wp:heading {\"align\":\"wide\",\"style\":{\"color\":{\"text\":\"#ffe074\"},\"typography\":{\"fontSize\":\"64px\"}}} -->\n<h2 class=\"alignwide has-text-color\" style=\"color:#ffe074;font-size:64px\">Forest.</h2>\n<!-- /wp:heading -->\n\n<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column {\"width\":\"55%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:55%\"><!-- wp:spacer {\"height\":330} -->\n<div style=\"height:330px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#ffe074\"},\"typography\":{\"lineHeight\":\"1.3\",\"fontSize\":\"12px\"}}} -->\n<p class=\"has-text-color\" style=\"color:#ffe074;font-size:12px;line-height:1.3\"><em>Even a child knows how valuable the forest is. The fresh, breathtaking smell of trees. Echoing birds flying above that dense magnitude. A stable climate, a sustainable diverse life and a source of culture. Yet, forests and other ecosystems hang in the balance, threatened to become croplands, pasture, and plantations.</em></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div></div>\n<!-- /wp:cover -->\";}i:15;O:8:\"stdClass\":7:{s:2:\"id\";i:186;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:35:\"Large header with text and a button\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1082:\"\n<div class=\"wp-block-cover alignfull has-background-dim-40 has-background-dim has-parallax\" style=\"background-image:url(https://s.w.org/images/core/5.8/art-01.jpg);background-color:#000000;min-height:100vh\"><div class=\"wp-block-cover__inner-container\">\n<h2 class=\"alignwide has-white-color has-text-color\" style=\"font-size:48px;line-height:1.2\"><strong><em>Overseas:</em></strong><br><strong><em>1500 — 1960</em></strong></h2>\n\n\n\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\" style=\"flex-basis:60%\">\n<p class=\"has-text-color\" style=\"color:#ffffff\">An exhibition about the different representations of the ocean throughout time, between the sixteenth and the twentieth century. Taking place in our Open Room in <em>Floor 2</em>.</p>\n\n\n\n<div class=\"wp-container-61c244855da00 wp-block-buttons\">\n<div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link has-text-color has-background no-border-radius\" style=\"background-color:#000000;color:#ffffff\">Visit</a></div>\n</div>\n</div>\n\n\n\n<div class=\"wp-block-column\"></div>\n</div>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:62:\"Large header with background image and text and button on top.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:1:{i:0;s:6:\"header\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1865:\"<!-- wp:cover {\"url\":\"https://s.w.org/images/core/5.8/art-01.jpg\",\"hasParallax\":true,\"dimRatio\":40,\"customOverlayColor\":\"#000000\",\"minHeight\":100,\"minHeightUnit\":\"vh\",\"contentPosition\":\"center center\",\"align\":\"full\"} -->\n<div class=\"wp-block-cover alignfull has-background-dim-40 has-background-dim has-parallax\" style=\"background-image:url(https://s.w.org/images/core/5.8/art-01.jpg);background-color:#000000;min-height:100vh\"><div class=\"wp-block-cover__inner-container\"><!-- wp:heading {\"style\":{\"typography\":{\"fontSize\":\"48px\",\"lineHeight\":\"1.2\"}},\"className\":\"alignwide has-white-color has-text-color\"} -->\n<h2 class=\"alignwide has-white-color has-text-color\" style=\"font-size:48px;line-height:1.2\"><strong><em>Overseas:</em></strong><br><strong><em>1500 — 1960</em></strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column {\"width\":\"60%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:60%\"><!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#ffffff\"}}} -->\n<p class=\"has-text-color\" style=\"color:#ffffff\">An exhibition about the different representations of the ocean throughout time, between the sixteenth and the twentieth century. Taking place in our Open Room in <em>Floor 2</em>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:buttons -->\n<div class=\"wp-block-buttons\"><!-- wp:button {\"borderRadius\":0,\"style\":{\"color\":{\"text\":\"#ffffff\",\"background\":\"#000000\"}},\"className\":\"is-style-outline\"} -->\n<div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link has-text-color has-background no-border-radius\" style=\"background-color:#000000;color:#ffffff\">Visit</a></div>\n<!-- /wp:button --></div>\n<!-- /wp:buttons --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div></div>\n<!-- /wp:cover -->\";}i:16;O:8:\"stdClass\":7:{s:2:\"id\";i:196;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:41:\"Media and text in a full height container\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1221:\"\n<div class=\"wp-block-cover alignfull has-background-dim\" style=\"background-color:#ffffff;min-height:100vh\"><div class=\"wp-block-cover__inner-container\">\n<div class=\"wp-block-media-text alignwide is-stacked-on-mobile is-vertically-aligned-center is-image-fill\" style=\"grid-template-columns:56% auto\"><figure class=\"wp-block-media-text__media\" style=\"background-image:url(https://s.w.org/images/core/5.8/soil.jpg);background-position:50% 50%\"><img src=\"https://s.w.org/images/core/5.8/soil.jpg\" alt=\"Close-up of dried, cracked earth.\" /></figure><div class=\"wp-block-media-text__content\">\n<h2 class=\"has-text-color\" style=\"color:#000000;font-size:32px\"><strong>What&#8217;s the problem?</strong></h2>\n\n\n\n<p class=\"has-text-color\" style=\"color:#000000;font-size:17px\">Trees are more important today than ever before. More than 10,000 products are reportedly made from trees. Through chemistry, the humble woodpile is yielding chemicals, plastics and fabrics that were beyond comprehension when an axe first felled a Texas tree.</p>\n\n\n\n<div class=\"wp-container-61c244855ea04 wp-block-buttons\">\n<div class=\"wp-block-button is-style-fill\"><a class=\"wp-block-button__link\">Learn more</a></div>\n</div>\n</div></div>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:77:\"Media and text block with image to the left and text and button to the right.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:1:{i:0;s:6:\"header\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1858:\"<!-- wp:cover {\"customOverlayColor\":\"#ffffff\",\"minHeight\":100,\"minHeightUnit\":\"vh\",\"contentPosition\":\"center center\",\"align\":\"full\"} -->\n<div class=\"wp-block-cover alignfull has-background-dim\" style=\"background-color:#ffffff;min-height:100vh\"><div class=\"wp-block-cover__inner-container\"><!-- wp:media-text {\"mediaLink\":\"https://s.w.org/images/core/5.8/soil.jpg\",\"mediaType\":\"image\",\"mediaWidth\":56,\"verticalAlignment\":\"center\",\"imageFill\":true} -->\n<div class=\"wp-block-media-text alignwide is-stacked-on-mobile is-vertically-aligned-center is-image-fill\" style=\"grid-template-columns:56% auto\"><figure class=\"wp-block-media-text__media\" style=\"background-image:url(https://s.w.org/images/core/5.8/soil.jpg);background-position:50% 50%\"><img src=\"https://s.w.org/images/core/5.8/soil.jpg\" alt=\"Close-up of dried, cracked earth.\" /></figure><div class=\"wp-block-media-text__content\"><!-- wp:heading {\"style\":{\"typography\":{\"fontSize\":\"32px\"},\"color\":{\"text\":\"#000000\"}}} -->\n<h2 class=\"has-text-color\" style=\"color:#000000;font-size:32px\"><strong>What\'s the problem?</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"style\":{\"typography\":{\"fontSize\":\"17px\"},\"color\":{\"text\":\"#000000\"}}} -->\n<p class=\"has-text-color\" style=\"color:#000000;font-size:17px\">Trees are more important today than ever before. More than 10,000 products are reportedly made from trees. Through chemistry, the humble woodpile is yielding chemicals, plastics and fabrics that were beyond comprehension when an axe first felled a Texas tree.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:buttons -->\n<div class=\"wp-block-buttons\"><!-- wp:button {\"className\":\"is-style-fill\"} -->\n<div class=\"wp-block-button is-style-fill\"><a class=\"wp-block-button__link\">Learn more</a></div>\n<!-- /wp:button --></div>\n<!-- /wp:buttons --></div></div>\n<!-- /wp:media-text --></div></div>\n<!-- /wp:cover -->\";}i:17;O:8:\"stdClass\":7:{s:2:\"id\";i:192;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:37:\"Media and text with image on the left\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:520:\"\n<div class=\"wp-block-media-text alignfull is-stacked-on-mobile is-vertically-aligned-center\"><figure class=\"wp-block-media-text__media\"><img src=\"https://s.w.org/images/core/5.8/architecture-04.jpg\" alt=\"Close-up, abstract view of architecture.\" /></figure><div class=\"wp-block-media-text__content\">\n<h3 class=\"has-text-align-center has-text-color\" style=\"color:#000000\"><strong>Open Spaces</strong></h3>\n\n\n\n<p class=\"has-text-align-center has-extra-small-font-size\"><a href=\"#\">See case study ↗</a></p>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:66:\"Media and text block with image to the left and text to the right.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:8:\"featured\";i:1;s:6:\"header\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:827:\"<!-- wp:media-text {\"align\":\"full\",\"mediaType\":\"image\",\"verticalAlignment\":\"center\"} -->\n<div class=\"wp-block-media-text alignfull is-stacked-on-mobile is-vertically-aligned-center\"><figure class=\"wp-block-media-text__media\"><img src=\"https://s.w.org/images/core/5.8/architecture-04.jpg\" alt=\"Close-up, abstract view of architecture.\" /></figure><div class=\"wp-block-media-text__content\"><!-- wp:heading {\"textAlign\":\"center\",\"level\":3,\"style\":{\"color\":{\"text\":\"#000000\"}}} -->\n<h3 class=\"has-text-align-center has-text-color\" style=\"color:#000000\"><strong>Open Spaces</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"align\":\"center\",\"fontSize\":\"extra-small\"} -->\n<p class=\"has-text-align-center has-extra-small-font-size\"><a href=\"#\">See case study ↗</a></p>\n<!-- /wp:paragraph --></div></div>\n<!-- /wp:media-text -->\";}i:18;O:8:\"stdClass\":7:{s:2:\"id\";i:195;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:38:\"Media and text with image on the right\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:685:\"\n<div class=\"wp-block-media-text alignfull has-media-on-the-right is-stacked-on-mobile is-vertically-aligned-center is-style-default\" style=\"grid-template-columns:auto 56%\"><figure class=\"wp-block-media-text__media\"><img src=\"https://s.w.org/images/core/5.8/art-02.jpg\" alt=\"A green and brown rural landscape leading into a bright blue ocean and slightly cloudy sky, done in oil paints.\" /></figure><div class=\"wp-block-media-text__content\">\n<h2 class=\"has-text-color\" style=\"color:#000000\"><strong>Shore with Blue Sea</strong></h2>\n\n\n\n<p class=\"has-text-color\" style=\"color:#636363;font-size:17px;line-height:1.1\">Eleanor Harris&nbsp;(American, 1901-1942)</p>\n</div></div>\n\n\n\n<p></p>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:66:\"Media and text block with image to the right and text to the left.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:1:{i:0;s:6:\"header\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1138:\"<!-- wp:media-text {\"align\":\"full\",\"mediaPosition\":\"right\",\"mediaLink\":\"#\",\"mediaType\":\"image\",\"mediaWidth\":56,\"verticalAlignment\":\"center\",\"className\":\"is-style-default\"} -->\n<div class=\"wp-block-media-text alignfull has-media-on-the-right is-stacked-on-mobile is-vertically-aligned-center is-style-default\" style=\"grid-template-columns:auto 56%\"><figure class=\"wp-block-media-text__media\"><img src=\"https://s.w.org/images/core/5.8/art-02.jpg\" alt=\"A green and brown rural landscape leading into a bright blue ocean and slightly cloudy sky, done in oil paints.\" /></figure><div class=\"wp-block-media-text__content\"><!-- wp:heading {\"style\":{\"color\":{\"text\":\"#000000\"}}} -->\n<h2 class=\"has-text-color\" style=\"color:#000000\"><strong>Shore with Blue Sea</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"style\":{\"typography\":{\"lineHeight\":\"1.1\",\"fontSize\":\"17px\"},\"color\":{\"text\":\"#636363\"}}} -->\n<p class=\"has-text-color\" style=\"color:#636363;font-size:17px;line-height:1.1\">Eleanor Harris&nbsp;(American, 1901-1942)</p>\n<!-- /wp:paragraph --></div></div>\n<!-- /wp:media-text -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\";}i:19;O:8:\"stdClass\":7:{s:2:\"id\";i:27;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:5:\"Quote\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:656:\"\n<hr class=\"wp-block-separator is-style-default\" />\n\n\n\n<div class=\"wp-block-image is-style-rounded\"><figure class=\"aligncenter size-large is-resized\"><img loading=\"lazy\" src=\"https://s.w.org/images/core/5.8/portrait.jpg\" alt=\"A side profile of a woman in a russet-colored turtleneck and white bag. She looks up with her eyes closed.\" width=\"150\" height=\"150\" /></figure></div>\n\n\n\n<blockquote class=\"wp-block-quote has-text-align-center is-style-large\"><p>&#8222;Contributing makes me feel like I&#8217;m being useful to the planet.&#8221;</p><cite>— Anna Wong, <em>Volunteer</em></cite></blockquote>\n\n\n\n<hr class=\"wp-block-separator is-style-default\" />\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:0:\"\";s:19:\"wpop_viewport_width\";i:800;s:16:\"wpop_block_types\";a:1:{i:0;s:10:\"core/quote\";}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:1:{i:0;s:4:\"text\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1012:\"<!-- wp:separator {\"className\":\"is-style-default\"} -->\n<hr class=\"wp-block-separator is-style-default\" />\n<!-- /wp:separator -->\n\n<!-- wp:image {\"align\":\"center\",\"width\":150,\"height\":150,\"sizeSlug\":\"large\",\"linkDestination\":\"none\",\"className\":\"is-style-rounded\"} -->\n<div class=\"wp-block-image is-style-rounded\"><figure class=\"aligncenter size-large is-resized\"><img src=\"https://s.w.org/images/core/5.8/portrait.jpg\" alt=\"A side profile of a woman in a russet-colored turtleneck and white bag. She looks up with her eyes closed.\" width=\"150\" height=\"150\" /></figure></div>\n<!-- /wp:image -->\n\n<!-- wp:quote {\"align\":\"center\",\"className\":\"is-style-large\"} -->\n<blockquote class=\"wp-block-quote has-text-align-center is-style-large\"><p>\"Contributing makes me feel like I\'m being useful to the planet.\"</p><cite>— Anna Wong, <em>Volunteer</em></cite></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:separator {\"className\":\"is-style-default\"} -->\n<hr class=\"wp-block-separator is-style-default\" />\n<!-- /wp:separator -->\";}i:20;O:8:\"stdClass\":7:{s:2:\"id\";i:200;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:21:\"Three columns of text\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:801:\"\n<div class=\"wp-block-columns alignfull has-text-color has-background\" style=\"background-color:#ffffff;color:#000000\">\n<div class=\"wp-block-column\">\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"http://wordpress.org\">Virtual Tour ↗</a></strong></h3>\n\n\n\n<p>Get a virtual tour of the museum. Ideal for schools and events.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\">\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"https://wordpress.org\">Current Shows ↗</a></strong></h3>\n\n\n\n<p>Stay updated and see our current exhibitions here.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\">\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"https://wordpress.org\">Useful Info ↗</a></strong></h3>\n\n\n\n<p>Get to know our opening times, ticket prices and discounts.</p>\n</div>\n</div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:22:\"Three columns of text.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:3:{i:0;s:7:\"columns\";i:1;s:8:\"featured\";i:2;s:4:\"text\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1496:\"<!-- wp:columns {\"align\":\"full\",\"style\":{\"color\":{\"text\":\"#000000\",\"background\":\"#ffffff\"}}} -->\n<div class=\"wp-block-columns alignfull has-text-color has-background\" style=\"background-color:#ffffff;color:#000000\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:heading {\"level\":3,\"style\":{\"typography\":{\"fontSize\":\"24px\",\"lineHeight\":\"1.3\"}}} -->\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"http://wordpress.org\">Virtual Tour ↗</a></strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Get a virtual tour of the museum. Ideal for schools and events.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:heading {\"level\":3,\"style\":{\"typography\":{\"fontSize\":\"24px\",\"lineHeight\":\"1.3\"}}} -->\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"https://wordpress.org\">Current Shows ↗</a></strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Stay updated and see our current exhibitions here.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:heading {\"level\":3,\"style\":{\"typography\":{\"fontSize\":\"24px\",\"lineHeight\":\"1.3\"}}} -->\n<h3 style=\"font-size:24px;line-height:1.3\"><strong><a href=\"https://wordpress.org\">Useful Info ↗</a></strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Get to know our opening times, ticket prices and discounts.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\";}i:21;O:8:\"stdClass\":7:{s:2:\"id\";i:199;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:34:\"Three columns with images and text\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:2646:\"\n<div class=\"wp-container-61c2448562b50 wp-block-group alignfull has-background\" style=\"background-color:#f8f4e4\"><div class=\"wp-block-group__inner-container\">\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\">\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<h6 class=\"has-text-color\" style=\"color:#000000\">ECOSYSTEM</h6>\n\n\n\n<p class=\"has-text-color\" style=\"color:#000000;font-size:5vw;line-height:1.1\"><strong>Positive growth.</strong></p>\n\n\n\n<div style=\"height:5px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n</div>\n</div>\n\n\n\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\" style=\"flex-basis:33.38%\">\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\"><em>Nature</em>, in the common sense, refers to essences unchanged by man; space, the air, the river, the leaf.&nbsp;<em>Art</em>&nbsp;is applied to the mixture of his will with the same things, as in a house, a canal, a statue, a picture. But his operations taken together are so insignificant, a little chipping, baking, patching, and washing, that in an impression so grand as that of the world on the human mind, they do not vary the result.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:33%\">\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-01.jpg\" alt=\"The sun setting through a dense forest of trees.\" /></figure>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:33.62%\">\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-02.jpg\" alt=\"Wind turbines standing on a grassy plain, against a blue sky.\" /></figure>\n</div>\n</div>\n\n\n\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\" style=\"flex-basis:67%\">\n<div class=\"wp-block-image\"><figure class=\"alignright size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-03.jpg\" alt=\"The sun shining over a ridge leading down into the shore. In the distance, a car drives down a road.\" /></figure></div>\n</div>\n\n\n\n<div class=\"wp-block-column is-vertically-aligned-center\" style=\"flex-basis:33%\">\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">Undoubtedly we have no questions to ask which are unanswerable. We must trust the perfection of the creation so far, as to believe that whatever curiosity the order of things has awakened in our minds, the order of things can satisfy. Every man&#8217;s condition is a solution in hieroglyphic to those inquiries he would put.</p>\n</div>\n</div>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:77:\"Three columns with images and text, with vertical spacing for an offset look.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:7:\"columns\";i:1;s:8:\"featured\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:3980:\"<!-- wp:group {\"align\":\"full\",\"style\":{\"color\":{\"background\":\"#f8f4e4\"}}} -->\n<div class=\"wp-block-group alignfull has-background\" style=\"background-color:#f8f4e4\"><!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:spacer -->\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:heading {\"level\":6,\"style\":{\"color\":{\"text\":\"#000000\"}}} -->\n<h6 class=\"has-text-color\" style=\"color:#000000\">ECOSYSTEM</h6>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph {\"style\":{\"typography\":{\"lineHeight\":\"1.1\",\"fontSize\":\"5vw\"},\"color\":{\"text\":\"#000000\"}}} -->\n<p class=\"has-text-color\" style=\"color:#000000;font-size:5vw;line-height:1.1\"><strong>Positive growth.</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:spacer {\"height\":5} -->\n<div style=\"height:5px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column {\"width\":\"33.38%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:33.38%\"><!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#000000\"}},\"fontSize\":\"extra-small\"} -->\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\"><em>Nature</em>, in the common sense, refers to essences unchanged by man; space, the air, the river, the leaf.&nbsp;<em>Art</em>&nbsp;is applied to the mixture of his will with the same things, as in a house, a canal, a statue, a picture. But his operations taken together are so insignificant, a little chipping, baking, patching, and washing, that in an impression so grand as that of the world on the human mind, they do not vary the result.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"width\":\"33%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:33%\"><!-- wp:spacer -->\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:image {\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-01.jpg\" alt=\"The sun setting through a dense forest of trees.\" /></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"width\":\"33.62%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:33.62%\"><!-- wp:image {\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-02.jpg\" alt=\"Wind turbines standing on a grassy plain, against a blue sky.\" /></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column {\"width\":\"67%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:67%\"><!-- wp:image {\"align\":\"right\",\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<div class=\"wp-block-image\"><figure class=\"alignright size-large\"><img src=\"https://s.w.org/images/core/5.8/outside-03.jpg\" alt=\"The sun shining over a ridge leading down into the shore. In the distance, a car drives down a road.\" /></figure></div>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"verticalAlignment\":\"center\",\"width\":\"33%\"} -->\n<div class=\"wp-block-column is-vertically-aligned-center\" style=\"flex-basis:33%\"><!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#000000\"}},\"fontSize\":\"extra-small\"} -->\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">Undoubtedly we have no questions to ask which are unanswerable. We must trust the perfection of the creation so far, as to believe that whatever curiosity the order of things has awakened in our minds, the order of things can satisfy. Every man\'s condition is a solution in hieroglyphic to those inquiries he would put.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns --></div>\n<!-- /wp:group -->\";}i:22;O:8:\"stdClass\":7:{s:2:\"id\";i:201;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:32:\"Three columns with offset images\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1077:\"\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\" style=\"flex-basis:25%\">\n<figure class=\"wp-block-image size-large is-style-default\"><img src=\"https://s.w.org/images/core/5.8/architecture-01.jpg\" alt=\"Close-up, abstract view of geometric architecture.\" /></figure>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:25%\">\n<div style=\"height:500px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<div style=\"height:150px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/architecture-02.jpg\" alt=\"Close-up, angled view of a window on a white building.\" /></figure>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:45%\">\n<figure class=\"wp-block-image size-large is-style-default\"><img src=\"https://s.w.org/images/core/5.8/architecture-03.jpg\" alt=\"Close-up of the corner of a white, geometric building with both sharp points and round corners.\" /></figure>\n\n\n\n<div style=\"height:285px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n</div>\n</div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:33:\"Three columns with offset images.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:7:\"gallery\";i:1;s:6:\"images\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1753:\"<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column {\"width\":\"25%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:25%\"><!-- wp:image {\"sizeSlug\":\"large\",\"linkDestination\":\"none\",\"className\":\"is-style-default\"} -->\n<figure class=\"wp-block-image size-large is-style-default\"><img src=\"https://s.w.org/images/core/5.8/architecture-01.jpg\" alt=\"Close-up, abstract view of geometric architecture.\" /></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"width\":\"25%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:25%\"><!-- wp:spacer {\"height\":500} -->\n<div style=\"height:500px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:spacer {\"height\":150} -->\n<div style=\"height:150px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:image {\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"https://s.w.org/images/core/5.8/architecture-02.jpg\" alt=\"Close-up, angled view of a window on a white building.\" /></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"width\":\"45%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:45%\"><!-- wp:image {\"sizeSlug\":\"large\",\"linkDestination\":\"none\",\"className\":\"is-style-default\"} -->\n<figure class=\"wp-block-image size-large is-style-default\"><img src=\"https://s.w.org/images/core/5.8/architecture-03.jpg\" alt=\"Close-up of the corner of a white, geometric building with both sharp points and round corners.\" /></figure>\n<!-- /wp:image -->\n\n<!-- wp:spacer {\"height\":285} -->\n<div style=\"height:285px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\";}i:23;O:8:\"stdClass\":7:{s:2:\"id\";i:29;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:29:\"Two columns of text and title\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1337:\"\n<h2 style=\"font-size:38px;line-height:1.4\"><strong>The voyage had begun, and had begun happily with a soft blue sky, and a calm sea.</strong></h2>\n\n\n\n<div class=\"wp-block-columns\">\n<div class=\"wp-block-column\">\n<p style=\"font-size:18px\">They followed her on to the deck. All the smoke and the houses had disappeared, and the ship was out in a wide space of sea very fresh and clear though pale in the early light. They had left London sitting on its mud. A very thin line of shadow tapered on the horizon, scarcely thick enough to stand the burden of Paris, which nevertheless rested upon it. They were free of roads, free of mankind, and the same exhilaration at their freedom ran through them all.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\">\n<p style=\"font-size:18px\">The ship was making her way steadily through small waves which slapped her and then fizzled like effervescing water, leaving a little border of bubbles and foam on either side. The colourless October sky above was thinly clouded as if by the trail of wood-fire smoke, and the air was wonderfully salt and brisk. Indeed it was too cold to stand still. Mrs. Ambrose drew her arm within her husband&#8217;s, and as they moved off it could be seen from the way in which her sloping cheek turned up to his that she had something private to communicate.</p>\n</div>\n</div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:47:\"Two columns of text preceded by a long heading.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:7:\"columns\";i:1;s:4:\"text\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:1711:\"<!-- wp:heading {\"style\":{\"typography\":{\"fontSize\":38,\"lineHeight\":\"1.4\"}}} -->\n<h2 style=\"font-size:38px;line-height:1.4\"><strong>The voyage had begun, and had begun happily with a soft blue sky, and a calm sea.</strong></h2>\n<!-- /wp:heading -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"style\":{\"typography\":{\"fontSize\":18}}} -->\n<p style=\"font-size:18px\">They followed her on to the deck. All the smoke and the houses had disappeared, and the ship was out in a wide space of sea very fresh and clear though pale in the early light. They had left London sitting on its mud. A very thin line of shadow tapered on the horizon, scarcely thick enough to stand the burden of Paris, which nevertheless rested upon it. They were free of roads, free of mankind, and the same exhilaration at their freedom ran through them all.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"style\":{\"typography\":{\"fontSize\":18}}} -->\n<p style=\"font-size:18px\">The ship was making her way steadily through small waves which slapped her and then fizzled like effervescing water, leaving a little border of bubbles and foam on either side. The colourless October sky above was thinly clouded as if by the trail of wood-fire smoke, and the air was wonderfully salt and brisk. Indeed it was too cold to stand still. Mrs. Ambrose drew her arm within her husband\'s, and as they moved off it could be seen from the way in which her sloping cheek turned up to his that she had something private to communicate.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\";}i:24;O:8:\"stdClass\":7:{s:2:\"id\";i:197;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:39:\"Two columns of text with offset heading\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:1915:\"\n<div class=\"wp-container-61c2448565789 wp-block-group alignfull has-background\" style=\"background-color:#f2f0e9\"><div class=\"wp-block-group__inner-container\">\n<div style=\"height:70px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n\n\n\n<div class=\"wp-block-columns alignwide are-vertically-aligned-center\">\n<div class=\"wp-block-column\" style=\"flex-basis:50%\">\n<p class=\"has-text-color\" style=\"color:#000000;font-size:30px;line-height:1.1\"><strong>Oceanic Inspiration</strong></p>\n</div>\n\n\n\n<div class=\"wp-block-column\" style=\"flex-basis:50%\">\n<hr class=\"wp-block-separator has-text-color has-background is-style-wide\" style=\"background-color:#000000;color:#000000\" />\n</div>\n</div>\n\n\n\n<div class=\"wp-block-columns alignwide\">\n<div class=\"wp-block-column\"></div>\n\n\n\n<div class=\"wp-block-column\">\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">Winding veils round their heads, the women walked on deck. They were now moving steadily down the river, passing the dark shapes of ships at anchor, and London was a swarm of lights with a pale yellow canopy drooping above it. There were the lights of the great theatres, the lights of the long streets, lights that indicated huge squares of domestic comfort, lights that hung high in air.</p>\n</div>\n\n\n\n<div class=\"wp-block-column\">\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">No darkness would ever settle upon those lamps, as no darkness had settled upon them for hundreds of years. It seemed dreadful that the town should blaze for ever in the same spot; dreadful at least to people going away to adventure upon the sea, and beholding it as a circumscribed mound, eternally burnt, eternally scarred. From the deck of the ship the great city appeared a crouched and cowardly figure, a sedentary miser.</p>\n</div>\n</div>\n\n\n\n<div style=\"height:40px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n</div></div>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:43:\"Two columns of text with an offset heading.\";s:19:\"wpop_viewport_width\";i:1200;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:2:{i:0;s:7:\"columns\";i:1;s:4:\"text\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:2837:\"<!-- wp:group {\"align\":\"full\",\"style\":{\"color\":{\"background\":\"#f2f0e9\"}}} -->\n<div class=\"wp-block-group alignfull has-background\" style=\"background-color:#f2f0e9\"><!-- wp:spacer {\"height\":70} -->\n<div style=\"height:70px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:columns {\"verticalAlignment\":\"center\",\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide are-vertically-aligned-center\"><!-- wp:column {\"width\":\"50%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:50%\"><!-- wp:paragraph {\"style\":{\"typography\":{\"lineHeight\":\"1.1\",\"fontSize\":\"30px\"},\"color\":{\"text\":\"#000000\"}}} -->\n<p class=\"has-text-color\" style=\"color:#000000;font-size:30px;line-height:1.1\"><strong>Oceanic Inspiration</strong></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"width\":\"50%\"} -->\n<div class=\"wp-block-column\" style=\"flex-basis:50%\"><!-- wp:separator {\"customColor\":\"#000000\",\"className\":\"is-style-wide\"} -->\n<hr class=\"wp-block-separator has-text-color has-background is-style-wide\" style=\"background-color:#000000;color:#000000\" />\n<!-- /wp:separator --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:columns {\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide\"><!-- wp:column -->\n<div class=\"wp-block-column\"></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#000000\"}},\"fontSize\":\"extra-small\"} -->\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">Winding veils round their heads, the women walked on deck. They were now moving steadily down the river, passing the dark shapes of ships at anchor, and London was a swarm of lights with a pale yellow canopy drooping above it. There were the lights of the great theatres, the lights of the long streets, lights that indicated huge squares of domestic comfort, lights that hung high in air.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph {\"style\":{\"color\":{\"text\":\"#000000\"}},\"fontSize\":\"extra-small\"} -->\n<p class=\"has-text-color has-extra-small-font-size\" style=\"color:#000000\">No darkness would ever settle upon those lamps, as no darkness had settled upon them for hundreds of years. It seemed dreadful that the town should blaze for ever in the same spot; dreadful at least to people going away to adventure upon the sea, and beholding it as a circumscribed mound, eternally burnt, eternally scarred. From the deck of the ship the great city appeared a crouched and cowardly figure, a sedentary miser.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:spacer {\"height\":40} -->\n<div style=\"height:40px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer --></div>\n<!-- /wp:group -->\";}i:25;O:8:\"stdClass\":7:{s:2:\"id\";i:19;s:5:\"title\";O:8:\"stdClass\":1:{s:8:\"rendered\";s:23:\"Two images side by side\";}s:7:\"content\";O:8:\"stdClass\":2:{s:8:\"rendered\";s:647:\"\n<figure class=\"wp-block-gallery alignwide columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><img src=\"https://s.w.org/images/core/5.8/nature-above-01.jpg\" alt=\"An aerial view of waves crashing against a shore.\" data-full-url=\"https://s.w.org/images/core/5.8/nature-above-01.jpg\" data-link=\"#\" /></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://s.w.org/images/core/5.8/nature-above-02.jpg\" alt=\"An aerial view of a field. A road runs through the upper right corner.\" data-full-url=\"https://s.w.org/images/core/5.8/nature-above-02.jpg\" data-link=\"#\" /></figure></li></ul></figure>\n\";s:9:\"protected\";b:0;}s:4:\"meta\";O:8:\"stdClass\":7:{s:10:\"spay_email\";s:0:\"\";s:13:\"wpop_keywords\";s:0:\"\";s:16:\"wpop_description\";s:41:\"An image gallery with two example images.\";s:19:\"wpop_viewport_width\";i:800;s:16:\"wpop_block_types\";a:0:{}s:11:\"wpop_locale\";s:5:\"en_US\";s:20:\"wpop_unlisted_reason\";s:0:\"\";}s:14:\"category_slugs\";a:1:{i:0;s:7:\"gallery\";}s:13:\"keyword_slugs\";a:1:{i:0;s:4:\"core\";}s:15:\"pattern_content\";s:737:\"<!-- wp:gallery {\"ids\":[null,null],\"linkTo\":\"none\",\"align\":\"wide\"} -->\n<figure class=\"wp-block-gallery alignwide columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><img src=\"https://s.w.org/images/core/5.8/nature-above-01.jpg\" alt=\"An aerial view of waves crashing against a shore.\" data-full-url=\"https://s.w.org/images/core/5.8/nature-above-01.jpg\" data-link=\"#\" /></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://s.w.org/images/core/5.8/nature-above-02.jpg\" alt=\"An aerial view of a field. A road runs through the upper right corner.\" data-full-url=\"https://s.w.org/images/core/5.8/nature-above-02.jpg\" data-link=\"#\" /></figure></li></ul></figure>\n<!-- /wp:gallery -->\";}}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(161, '_site_transient_timeout_available_translations', '1640132518', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(162, '_site_transient_available_translations', 'a:127:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-05-13 15:59:22\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-17 11:49:29\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:6:\"4.8.17\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.17/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-08 17:57:56\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-12 20:34:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:6:\"4.9.18\";s:7:\"updated\";s:19:\"2019-10-29 07:54:22\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.9.18/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-01 15:31:45\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:5:\"5.4.8\";s:7:\"updated\";s:19:\"2020-10-31 08:48:37\";s:12:\"english_name\";s:20:\"Bengali (Bangladesh)\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.8/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2020-10-30 03:24:38\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:33:\"མུ་མཐུད་དུ།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-16 21:42:36\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-15 09:50:05\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-11-15 22:52:34\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-16 20:33:10\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-12 13:35:53\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsæt\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-13 18:09:57\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/5.8.2/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-07-22 10:24:47\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/translation/core/5.8.2/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-07-22 10:24:20\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_AT\";a:8:{s:8:\"language\";s:5:\"de_AT\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-07-10 12:19:50\";s:12:\"english_name\";s:16:\"German (Austria)\";s:11:\"native_name\";s:21:\"Deutsch (Österreich)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/de_AT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-13 18:06:50\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dsb\";a:8:{s:8:\"language\";s:3:\"dsb\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-02 11:17:46\";s:12:\"english_name\";s:13:\"Lower Sorbian\";s:11:\"native_name\";s:16:\"Dolnoserbšćina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.8.2/dsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"dsb\";i:3;s:3:\"dsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Dalej\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-06 23:28:37\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-09 10:29:25\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-25 03:05:46\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-03 10:52:30\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-25 03:09:33\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-04 18:08:37\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-12 16:17:36\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-07-30 00:35:05\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:22:\"Español de Costa Rica\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/es_CR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_EC\";a:8:{s:8:\"language\";s:5:\"es_EC\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-02 02:19:31\";s:12:\"english_name\";s:17:\"Spanish (Ecuador)\";s:11:\"native_name\";s:19:\"Español de Ecuador\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/es_EC.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-06 11:31:19\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/es_ES.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-18 06:07:34\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/es_AR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-06-14 16:02:22\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/es_CL.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_UY\";a:8:{s:8:\"language\";s:5:\"es_UY\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-31 18:33:26\";s:12:\"english_name\";s:17:\"Spanish (Uruguay)\";s:11:\"native_name\";s:19:\"Español de Uruguay\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/es_UY.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PR\";a:8:{s:8:\"language\";s:5:\"es_PR\";s:7:\"version\";s:5:\"5.4.8\";s:7:\"updated\";s:19:\"2020-04-29 15:36:59\";s:12:\"english_name\";s:21:\"Spanish (Puerto Rico)\";s:11:\"native_name\";s:23:\"Español de Puerto Rico\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.8/es_PR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:6:\"5.2.13\";s:7:\"updated\";s:19:\"2019-03-02 06:35:01\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.2.13/es_GT.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-14 13:29:01\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/es_CO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_DO\";a:8:{s:8:\"language\";s:5:\"es_DO\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-08 14:32:50\";s:12:\"english_name\";s:28:\"Spanish (Dominican Republic)\";s:11:\"native_name\";s:33:\"Español de República Dominicana\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/es_DO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-02 02:19:00\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/es_VE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-04 20:53:18\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/es_PE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-02 13:13:00\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/es_MX.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2020-08-12 08:38:59\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-11 09:49:40\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_AF\";a:8:{s:8:\"language\";s:5:\"fa_AF\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-11-20 16:34:11\";s:12:\"english_name\";s:21:\"Persian (Afghanistan)\";s:11:\"native_name\";s:31:\"(فارسی (افغانستان\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/fa_AF.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-20 12:04:09\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-17 11:15:06\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-07 15:52:29\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-17 14:28:10\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-02-22 13:54:46\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:3:\"fur\";a:8:{s:8:\"language\";s:3:\"fur\";s:7:\"version\";s:6:\"4.8.17\";s:7:\"updated\";s:19:\"2018-01-29 17:32:35\";s:12:\"english_name\";s:8:\"Friulian\";s:11:\"native_name\";s:8:\"Friulian\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.17/fur.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"fur\";i:3;s:3:\"fur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-26 18:07:06\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:6:\"4.9.18\";s:7:\"updated\";s:19:\"2018-09-14 12:33:48\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.18/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"ચાલુ રાખવું\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:6:\"4.4.25\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.4.25/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-20 10:01:27\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:5:\"5.4.8\";s:7:\"updated\";s:19:\"2020-11-06 12:34:38\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.8/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"जारी रखें\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-15 18:51:47\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:3:\"hsb\";a:8:{s:8:\"language\";s:3:\"hsb\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-02 11:18:08\";s:12:\"english_name\";s:13:\"Upper Sorbian\";s:11:\"native_name\";s:17:\"Hornjoserbšćina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.8.2/hsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"hsb\";i:3;s:3:\"hsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:4:\"Dale\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-13 09:45:39\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-25 11:28:10\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:6:\"4.9.18\";s:7:\"updated\";s:19:\"2018-12-11 10:40:02\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.18/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-14 16:49:52\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-11-27 05:18:09\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"次へ\";}}s:5:\"jv_ID\";a:8:{s:8:\"language\";s:5:\"jv_ID\";s:7:\"version\";s:6:\"4.9.18\";s:7:\"updated\";s:19:\"2019-02-16 23:58:56\";s:12:\"english_name\";s:8:\"Javanese\";s:11:\"native_name\";s:9:\"Basa Jawa\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.18/jv_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"jv\";i:2;s:3:\"jav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Nerusaké\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-21 06:43:12\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-14 17:37:38\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.8.2/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"kk\";a:8:{s:8:\"language\";s:2:\"kk\";s:7:\"version\";s:6:\"4.9.18\";s:7:\"updated\";s:19:\"2018-07-10 11:35:44\";s:12:\"english_name\";s:6:\"Kazakh\";s:11:\"native_name\";s:19:\"Қазақ тілі\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.18/kk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kk\";i:2;s:3:\"kaz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Жалғастыру\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:6:\"5.2.13\";s:7:\"updated\";s:19:\"2019-06-10 16:18:28\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.2.13/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:2:\"kn\";a:8:{s:8:\"language\";s:2:\"kn\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-03 06:17:02\";s:12:\"english_name\";s:7:\"Kannada\";s:11:\"native_name\";s:15:\"ಕನ್ನಡ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/kn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kn\";i:2;s:3:\"kan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"ಮುಂದುವರಿಸು\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-06 13:14:34\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-07 16:32:30\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.8.2/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-23 12:35:40\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-17 20:04:07\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"5.4.8\";s:7:\"updated\";s:19:\"2020-07-01 09:16:57\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.4.8/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:43:32\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 07:29:35\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"Үргэлжлүүлэх\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:6:\"4.9.18\";s:7:\"updated\";s:19:\"2019-11-22 15:32:08\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.18/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:6:\"4.9.18\";s:7:\"updated\";s:19:\"2018-08-31 11:57:07\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.18/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.2.30\";s:7:\"updated\";s:19:\"2017-12-26 11:57:10\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.2.30/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-21 04:11:41\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:6:\"5.2.13\";s:7:\"updated\";s:19:\"2020-05-31 16:07:59\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.2.13/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-12 17:53:09\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-11-14 12:51:29\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/5.8.2/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-06 13:55:08\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-18 10:59:16\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:6:\"4.8.17\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.17/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:7:\"Punjabi\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-21 17:33:07\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.3.26\";s:7:\"updated\";s:19:\"2015-12-02 21:41:29\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.3.26/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:5:\"pt_AO\";a:8:{s:8:\"language\";s:5:\"pt_AO\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-11-27 16:28:47\";s:12:\"english_name\";s:19:\"Portuguese (Angola)\";s:11:\"native_name\";s:20:\"Português de Angola\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/pt_AO.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-08 19:39:30\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-15 08:56:03\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-09-09 21:40:55\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/5.8.2/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-21 19:13:08\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-16 23:35:59\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:3:\"snd\";a:8:{s:8:\"language\";s:3:\"snd\";s:7:\"version\";s:5:\"5.4.8\";s:7:\"updated\";s:19:\"2020-07-07 01:53:37\";s:12:\"english_name\";s:6:\"Sindhi\";s:11:\"native_name\";s:8:\"سنڌي\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.4.8/snd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"sd\";i:2;s:3:\"snd\";i:3;s:3:\"snd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"اڳتي هلو\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-10 07:31:29\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:3:\"skr\";a:8:{s:8:\"language\";s:3:\"skr\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-15 15:37:00\";s:12:\"english_name\";s:7:\"Saraiki\";s:11:\"native_name\";s:14:\"سرائیکی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.8.2/skr.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"skr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"جاری رکھو\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-11-23 08:11:23\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-02 20:06:53\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-08-01 21:21:06\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-16 08:39:17\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:2:\"sw\";a:8:{s:8:\"language\";s:2:\"sw\";s:7:\"version\";s:6:\"5.3.10\";s:7:\"updated\";s:19:\"2019-10-13 15:35:35\";s:12:\"english_name\";s:7:\"Swahili\";s:11:\"native_name\";s:9:\"Kiswahili\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.3.10/sw.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sw\";i:2;s:3:\"swa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Endelea\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:5:\"ta_LK\";a:8:{s:8:\"language\";s:5:\"ta_LK\";s:7:\"version\";s:6:\"4.2.30\";s:7:\"updated\";s:19:\"2015-12-03 01:07:44\";s:12:\"english_name\";s:17:\"Tamil (Sri Lanka)\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.2.30/ta_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"தொடர்க\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-12-14 08:30:56\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:6:\"4.8.17\";s:7:\"updated\";s:19:\"2017-09-30 09:04:29\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.17/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-04 12:16:39\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:6:\"4.9.18\";s:7:\"updated\";s:19:\"2021-07-03 18:41:33\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:16:\"ئۇيغۇرچە\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.18/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-10-10 16:46:39\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:5:\"5.4.8\";s:7:\"updated\";s:19:\"2020-04-09 11:17:33\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.4.8/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-02-28 12:02:22\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-11-16 07:16:28\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.2/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-11-05 11:55:27\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"5.8.2\";s:7:\"updated\";s:19:\"2021-11-16 00:27:59\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.2/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-06-27 10:46:14\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:16:\"香港中文版	\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}}', 'no');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(4, 5, '_customize_changeset_uuid', '30f561fa-a8a7-4286-b6b5-ed609215c184'),
(6, 6, '_customize_changeset_uuid', '30f561fa-a8a7-4286-b6b5-ed609215c184'),
(8, 7, '_customize_changeset_uuid', '30f561fa-a8a7-4286-b6b5-ed609215c184'),
(10, 8, '_customize_changeset_uuid', '30f561fa-a8a7-4286-b6b5-ed609215c184'),
(11, 14, '_menu_item_type', 'custom'),
(12, 14, '_menu_item_menu_item_parent', '0'),
(13, 14, '_menu_item_object_id', '14'),
(14, 14, '_menu_item_object', 'custom'),
(15, 14, '_menu_item_target', ''),
(16, 14, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(17, 14, '_menu_item_xfn', ''),
(18, 14, '_menu_item_url', 'http://localhost/czad/'),
(19, 15, '_menu_item_type', 'post_type'),
(20, 15, '_menu_item_menu_item_parent', '0'),
(21, 15, '_menu_item_object_id', '6'),
(22, 15, '_menu_item_object', 'page'),
(23, 15, '_menu_item_target', ''),
(24, 15, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(25, 15, '_menu_item_xfn', ''),
(26, 15, '_menu_item_url', ''),
(27, 16, '_menu_item_type', 'post_type'),
(28, 16, '_menu_item_menu_item_parent', '0'),
(29, 16, '_menu_item_object_id', '8'),
(30, 16, '_menu_item_object', 'page'),
(31, 16, '_menu_item_target', ''),
(32, 16, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(33, 16, '_menu_item_xfn', ''),
(34, 16, '_menu_item_url', ''),
(35, 17, '_menu_item_type', 'post_type'),
(36, 17, '_menu_item_menu_item_parent', '0'),
(37, 17, '_menu_item_object_id', '7'),
(38, 17, '_menu_item_object', 'page'),
(39, 17, '_menu_item_target', ''),
(40, 17, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(41, 17, '_menu_item_xfn', ''),
(42, 17, '_menu_item_url', ''),
(43, 18, '_menu_item_type', 'custom'),
(44, 18, '_menu_item_menu_item_parent', '0'),
(45, 18, '_menu_item_object_id', '18'),
(46, 18, '_menu_item_object', 'custom'),
(47, 18, '_menu_item_target', ''),
(48, 18, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(49, 18, '_menu_item_xfn', ''),
(50, 18, '_menu_item_url', 'https://www.facebook.com/wordpress'),
(51, 19, '_menu_item_type', 'custom'),
(52, 19, '_menu_item_menu_item_parent', '0'),
(53, 19, '_menu_item_object_id', '19'),
(54, 19, '_menu_item_object', 'custom'),
(55, 19, '_menu_item_target', ''),
(56, 19, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(57, 19, '_menu_item_xfn', ''),
(58, 19, '_menu_item_url', 'https://twitter.com/wordpress'),
(59, 20, '_menu_item_type', 'custom'),
(60, 20, '_menu_item_menu_item_parent', '0'),
(61, 20, '_menu_item_object_id', '20'),
(62, 20, '_menu_item_object', 'custom'),
(63, 20, '_menu_item_target', ''),
(64, 20, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(65, 20, '_menu_item_xfn', ''),
(66, 20, '_menu_item_url', 'https://www.instagram.com/explore/tags/wordcamp/'),
(67, 21, '_menu_item_type', 'custom'),
(68, 21, '_menu_item_menu_item_parent', '0'),
(69, 21, '_menu_item_object_id', '21'),
(70, 21, '_menu_item_object', 'custom'),
(71, 21, '_menu_item_target', ''),
(72, 21, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(73, 21, '_menu_item_xfn', ''),
(74, 21, '_menu_item_url', 'mailto:wordpress@example.com'),
(75, 9, '_wp_trash_meta_status', 'publish'),
(76, 9, '_wp_trash_meta_time', '1640121623'),
(77, 22, '_edit_lock', '1640121560:1'),
(78, 23, '_edit_lock', '1640121580:1'),
(79, 5, '_edit_lock', '1640121864:1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2021-12-21 22:19:28', '2021-12-21 21:19:28', '<!-- wp:paragraph -->\n<p>Witamy w WordPressie. To jest twój pierwszy wpis. Edytuj go lub usuń, a następnie zacznij pisać!</p>\n<!-- /wp:paragraph -->', 'Witaj, świecie!', '', 'publish', 'open', 'open', '', 'witaj-swiecie', '', '', '2021-12-21 22:19:28', '2021-12-21 21:19:28', '', 0, 'http://localhost/czad/?p=1', 0, 'post', '', 1),
(2, 1, '2021-12-21 22:19:28', '2021-12-21 21:19:28', '<!-- wp:paragraph -->\n<p>Przykładowa strona. Strony są inne niż wpisy na blogu, ponieważ nie tylko znajdują się zawsze w jednym miejscu, ale także pojawiają się w menu witryny (w większości motywów). Większość użytkowników zaczyna od strony z informacjami o sobie, która zapozna ich przed odwiedzającymi witrynę. Taka strona może zawierać na przykład taką treść:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Cześć! Za dnia jestem kurierem rowerowym, nocą próbuję swoich sił w aktorstwie, a to jest moja witryna. Mieszkam w Krakowie, mam wspaniałego psa który wabi się Reks i lubię piña coladę (oraz spacery, gdy pada deszcz).</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...albo coś takiego:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Firma XYZ Doohickey została założona w 1971 roku i od tamtej pory dostarcza społeczeństwu dobrej jakości gadżety. Znajdująca się w Gotham City XYZ zatrudnia ponad 2000 osób i robi niesamowite rzeczy dla społeczności Gotham.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Jako nowy użytkownik WordPressa, powinieneś przejść do <a href=\"http://localhost/czad/wp-admin/\">swojego kokpitu</a> aby usunąć tę stronę i stworzyć nowe z własną treścią. Dobrej zabawy!</p>\n<!-- /wp:paragraph -->', 'Przykładowa strona', '', 'publish', 'closed', 'open', '', 'przykladowa-strona', '', '', '2021-12-21 22:19:28', '2021-12-21 21:19:28', '', 0, 'http://localhost/czad/?page_id=2', 0, 'page', '', 0),
(3, 1, '2021-12-21 22:19:28', '2021-12-21 21:19:28', '<!-- wp:heading --><h2>Kim jesteśmy</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Adres naszej strony internetowej to: http://localhost/czad.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Komentarze</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Kiedy odwiedzający witrynę zostawia komentarz, zbieramy dane widoczne w formularzu komentowania, jak i adres IP odwiedzającego oraz podpis jego przeglądarki jako pomoc przy wykrywaniu spamu.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Anonimizowany ciąg znaków utworzony z twojego adresu e-mail (zwany też hashem) może zostać przesłany do usługi Gravatar w celu sprawdzenia czy jest używany. Polityka prywatności usługi Gravatar jest dostępna pod adresem: https://automattic.com/privacy/. Po zatwierdzeniu komentarza twój obrazek profilowy jest widoczny publicznie w kontekście twojego komentarza.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli jesteś zarejestrowanym użytkownikiem i wgrywasz na witrynę obrazki, powinieneś unikać przesyłania obrazków z tagami EXIF lokalizacji. Odwiedzający stronę mogą pobrać i odczytać pełne dane lokalizacyjne z obrazków w witrynie.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Ciasteczka</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli zostawisz na naszej witrynie komentarz, będzie można wybrać opcję zapisu twojej nazwy, adresu e-mail i adresu strony internetowej w ciasteczkach, dzięki którym podczas pisania kolejnych komentarzy powyższe informacje będą już dogodnie uzupełnione. Ciasteczka wygasają po roku.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Jeśli odwiedzisz stronę logowania, utworzymy tymczasowe ciasteczko na potrzeby sprawdzenia czy twoja przeglądarka akceptuje ciasteczka. Nie zawiera ono żadnych danych osobistych i zostanie usunięte, kiedy przeglądarka zostanie zamknięta.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Podczas logowania tworzymy dodatkowo kilka ciasteczek potrzebnych do zapisu twoich informacji logowania oraz wybranych opcji ekranu. Ciasteczka logowania wygasają po dwóch dniach, a opcji ekranu po roku. Jeśli zaznaczysz opcję &bdquo;Pamiętaj mnie&rdquo;, logowanie wygaśnie po dwóch tygodniach. Jeśli wylogujesz się ze swojego konta, ciasteczka logowania zostaną usunięte.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Jeśli zmodyfikujesz albo opublikujesz artykuł, w twojej przeglądarce zostanie zapisane dodatkowe ciasteczko. To ciasteczko nie zawiera żadnych danych osobistych, wskazując po prostu na identyfikator przed chwilą edytowanego artykułu. Wygasa ono po 1 dniu.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Osadzone treści z innych witryn</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Artykuły na tej witrynie mogą zawierać osadzone treści (np. filmy, obrazki, artykuły itp.). Osadzone treści z innych witryn zachowują się analogicznie do tego, jakby użytkownik odwiedził bezpośrednio konkretną witrynę.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Witryny mogą zbierać informacje o tobie, używać ciasteczek, dołączać dodatkowe, zewnętrzne systemy śledzenia i monitorować twoje interakcje z osadzonym materiałem, włączając w to śledzenie twoich interakcji z osadzonym materiałem jeśli posiadasz konto i jesteś zalogowany w tamtej witrynie.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Z kim dzielimy się danymi</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli zażądasz zresetowania hasła, twój adres IP zostanie dołączony do wysyłanej wiadomości.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Jak długo przechowujemy twoje dane</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli zostawisz komentarz, jego treść i metadane będą przechowywane przez czas nieokreślony. Dzięki temu jesteśmy w stanie rozpoznawać i zatwierdzać kolejne komentarze automatycznie, bez wysyłania ich do każdorazowej moderacji.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Dla użytkowników którzy zarejestrowali się na naszej stronie internetowej (jeśli tacy są), przechowujemy również informacje osobiste wprowadzone w profilu. Każdy użytkownik może dokonać wglądu, korekty albo skasować swoje informacje osobiste w dowolnej chwili (nie licząc nazwy użytkownika, której nie można zmienić). Administratorzy strony również mogą przeglądać i modyfikować te informacje.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Jakie masz prawa do swoich danych</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli masz konto użytkownika albo dodałeś komentarze w tej witrynie, możesz zażądać dostarczenia pliku z wyeksportowanym kompletem twoich danych osobistych będących w naszym posiadaniu, w tym całość tych dostarczonych przez ciebie. Możesz również zażądać usunięcia przez nas całości twoich danych osobistych w naszym posiadaniu. Nie dotyczy to żadnych danych które jesteśmy zobligowani zachować ze względów administracyjnych, prawnych albo bezpieczeństwa.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Gdzie przesyłamy twoje dane</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Komentarze gości mogą być sprawdzane za pomocą automatycznej usługi wykrywania spamu.</p><!-- /wp:paragraph -->', 'Polityka prywatności', '', 'draft', 'closed', 'open', '', 'polityka-prywatnosci', '', '', '2021-12-21 22:19:28', '2021-12-21 21:19:28', '', 0, 'http://localhost/czad/?page_id=3', 0, 'page', '', 0),
(4, 1, '2021-12-21 22:19:47', '0000-00-00 00:00:00', '', 'Automatycznie zapisany szkic', '', 'auto-draft', 'open', 'open', '', '', '', '', '2021-12-21 22:19:47', '0000-00-00 00:00:00', '', 0, 'http://localhost/czad/?p=4', 0, 'post', '', 0),
(5, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '\n					<!-- wp:heading {\"align\":\"wide\",\"fontSize\":\"gigantic\",\"style\":{\"typography\":{\"lineHeight\":\"1.1\"}}} -->\n					<h2 class=\"alignwide has-text-align-wide has-gigantic-font-size\" style=\"line-height:1.1\">Twórz swoją witrynę za pomocą bloków</h2>\n					<!-- /wp:heading -->\n\n					<!-- wp:spacer -->\n					<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:columns {\"verticalAlignment\":\"center\",\"align\":\"wide\",\"className\":\"is-style-twentytwentyone-columns-overlap\"} -->\n					<div class=\"wp-block-columns alignwide are-vertically-aligned-center is-style-twentytwentyone-columns-overlap\"><!-- wp:column {\"verticalAlignment\":\"center\"} -->\n					<div class=\"wp-block-column is-vertically-aligned-center\"><!-- wp:image {\"align\":\"full\",\"sizeSlug\":\"large\"} -->\n					<figure class=\"wp-block-image alignfull size-large\"><img src=\"http://localhost/czad/wp-content/themes/twentytwentyone/assets/images/roses-tremieres-hollyhocks-1884.jpg\" alt=\"&#8220;Malwy&#8221; - Berthe Morisot\"/></figure>\n					<!-- /wp:image -->\n\n					<!-- wp:spacer -->\n					<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:image {\"align\":\"full\",\"sizeSlug\":\"large\",\"className\":\"is-style-twentytwentyone-image-frame\"} -->\n					<figure class=\"wp-block-image alignfull size-large is-style-twentytwentyone-image-frame\"><img src=\"http://localhost/czad/wp-content/themes/twentytwentyone/assets/images/in-the-bois-de-boulogne.jpg\" alt=\"&#8220;W Lasku Bolońskim&#8221; - Berthe Morisot\"/></figure>\n					<!-- /wp:image --></div>\n					<!-- /wp:column -->\n\n					<!-- wp:column {\"verticalAlignment\":\"center\"} -->\n					<div class=\"wp-block-column is-vertically-aligned-center\"><!-- wp:spacer -->\n					<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:image {\"sizeSlug\":\"large\",\"className\":\"alignfull size-full is-style-twentytwentyone-border\"} -->\n					<figure class=\"wp-block-image size-large alignfull size-full is-style-twentytwentyone-border\"><img src=\"http://localhost/czad/wp-content/themes/twentytwentyone/assets/images/young-woman-in-mauve.jpg\" alt=\"&#8220;Młoda kobieta w fiołkach&#8221; - Berthe Morisot\"/></figure>\n					<!-- /wp:image --></div>\n					<!-- /wp:column --></div>\n					<!-- /wp:columns -->\n\n					<!-- wp:spacer {\"height\":50} -->\n					<div style=\"height:50px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:columns {\"verticalAlignment\":\"top\",\"align\":\"wide\"} -->\n					<div class=\"wp-block-columns alignwide are-vertically-aligned-top\"><!-- wp:column {\"verticalAlignment\":\"top\"} -->\n					<div class=\"wp-block-column is-vertically-aligned-top\"><!-- wp:heading {\"level\":3} -->\n					<h3>Dodaj wzorzec bloków</h3>\n					<!-- /wp:heading -->\n\n					<!-- wp:paragraph -->\n					<p>Wzory bloków to wstępnie zaprojektowane grupy bloków. Aby dodać, wybierz przycisk dodaj blok [+] na pasku narzędzi u góry edytora. Przejdź do karty Wzory pod paskiem wyszukiwania i wybierz.</p>\n					<!-- /wp:paragraph --></div>\n					<!-- /wp:column -->\n\n					<!-- wp:column {\"verticalAlignment\":\"top\"} -->\n					<div class=\"wp-block-column is-vertically-aligned-top\"><!-- wp:heading {\"level\":3} -->\n					<h3>Dodaj ramkę do obrazków</h3>\n					<!-- /wp:heading -->\n\n					<!-- wp:paragraph -->\n					<p>Twenty Twenty-One zawiera stylowe obramowanie treści. W bloku obrazka otwórz panel „Style” z paska bocznego edytora. Wybierz styl bloku „Ramka”, aby aktywować.</p>\n					<!-- /wp:paragraph --></div>\n					<!-- /wp:column -->\n\n					<!-- wp:column {\"verticalAlignment\":\"top\"} -->\n					<div class=\"wp-block-column is-vertically-aligned-top\"><!-- wp:heading {\"level\":3} -->\n					<h3>Nakładające się kolumny</h3>\n					<!-- /wp:heading -->\n\n					<!-- wp:paragraph -->\n					<p>Twenty Twenty-One zawiera również styl nakładania się na bloków kolumn. Po zaznaczeniu bloku Kolumny otwórz panel „Style” na pasku bocznym Edytora. Wybierz styl bloku „Nakładanie”, aby wypróbować.</p>\n					<!-- /wp:paragraph --></div>\n					<!-- /wp:column --></div>\n					<!-- /wp:columns -->\n\n					<!-- wp:spacer -->\n					<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:cover {\"overlayColor\":\"green\",\"contentPosition\":\"center center\",\"align\":\"wide\",\"className\":\"is-style-twentytwentyone-border\"} -->\n					<div class=\"wp-block-cover alignwide has-green-background-color has-background-dim is-style-twentytwentyone-border\"><div class=\"wp-block-cover__inner-container\"><!-- wp:spacer {\"height\":20} -->\n					<div style=\"height:20px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:paragraph {\"fontSize\":\"huge\"} -->\n					<p class=\"has-huge-font-size\">Potrzebujesz pomocy?</p>\n					<!-- /wp:paragraph -->\n\n					<!-- wp:spacer {\"height\":75} -->\n					<div style=\"height:75px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:columns -->\n					<div class=\"wp-block-columns\"><!-- wp:column -->\n					<div class=\"wp-block-column\"><!-- wp:paragraph -->\n					<p><a href=\"https://wordpress.org/support/article/twenty-twenty-one/\">Przeczytaj dokumentację motywu</a></p>\n					<!-- /wp:paragraph --></div>\n					<!-- /wp:column -->\n\n					<!-- wp:column -->\n					<div class=\"wp-block-column\"><!-- wp:paragraph -->\n					<p><a href=\"https://wordpress.org/support/theme/twentytwentyone/\">Sprawdź forum wsparcia</a></p>\n					<!-- /wp:paragraph --></div>\n					<!-- /wp:column --></div>\n					<!-- /wp:columns -->\n\n					<!-- wp:spacer {\"height\":20} -->\n					<div style=\"height:20px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer --></div></div>\n					<!-- /wp:cover -->', 'Twórz swoją witrynę za pomocą bloków', '', 'publish', 'closed', 'closed', '', 'tworz-swoja-witryne-za-pomoca-blokow', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/?page_id=5', 0, 'page', '', 0),
(6, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '<!-- wp:paragraph -->\n<p>Możesz być artystą, który chciałby przedstawić siebie i swoją pracę, a może to strona firmowa, a sama firma ma misję do opisania.</p>\n<!-- /wp:paragraph -->', 'Informacje', '', 'publish', 'closed', 'closed', '', 'informacje', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/?page_id=6', 0, 'page', '', 0),
(7, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '<!-- wp:paragraph -->\n<p>Strona z podstawowymi informacjami kontaktowymi, takimi jak adres, numer telefonu. Można także spróbować wtyczki, za pomocą której dodamy formularz kontaktowy.</p>\n<!-- /wp:paragraph -->', 'Kontakt', '', 'publish', 'closed', 'closed', '', 'kontakt', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/?page_id=7', 0, 'page', '', 0),
(8, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/?page_id=8', 0, 'page', '', 0),
(9, 1, '2021-12-21 22:20:22', '2021-12-21 21:20:22', '{\n    \"nav_menus_created_posts\": {\n        \"starter_content\": true,\n        \"value\": [\n            5,\n            6,\n            7,\n            8\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:19:55\"\n    },\n    \"nav_menu[-1]\": {\n        \"value\": {\n            \"name\": \"Menu g\\u0142\\u00f3wne\",\n            \"description\": \"\",\n            \"parent\": 0,\n            \"auto_add\": false\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:20:22\"\n    },\n    \"nav_menu_item[-1]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"\",\n            \"menu_item_parent\": 0,\n            \"position\": 0,\n            \"type\": \"custom\",\n            \"title\": \"Strona g\\u0142\\u00f3wna\",\n            \"url\": \"http://localhost/czad/\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"\",\n            \"nav_menu_term_id\": -1,\n            \"_invalid\": false,\n            \"type_label\": \"W\\u0142asny odno\\u015bnik\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:20:22\"\n    },\n    \"nav_menu_item[-2]\": {\n        \"value\": {\n            \"object_id\": 6,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 1,\n            \"type\": \"post_type\",\n            \"title\": \"Informacje\",\n            \"url\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"Informacje\",\n            \"nav_menu_term_id\": -1,\n            \"_invalid\": false,\n            \"type_label\": \"Strona\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:20:22\"\n    },\n    \"nav_menu_item[-3]\": {\n        \"value\": {\n            \"object_id\": 8,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 2,\n            \"type\": \"post_type\",\n            \"title\": \"Blog\",\n            \"url\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"Blog\",\n            \"nav_menu_term_id\": -1,\n            \"_invalid\": false,\n            \"type_label\": \"Strona\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:20:22\"\n    },\n    \"nav_menu_item[-4]\": {\n        \"value\": {\n            \"object_id\": 7,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 3,\n            \"type\": \"post_type\",\n            \"title\": \"Kontakt\",\n            \"url\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"Kontakt\",\n            \"nav_menu_term_id\": -1,\n            \"_invalid\": false,\n            \"type_label\": \"Strona\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:20:22\"\n    },\n    \"twentytwentyone::nav_menu_locations[primary]\": {\n        \"starter_content\": true,\n        \"value\": -1,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:19:55\"\n    },\n    \"nav_menu[-5]\": {\n        \"value\": {\n            \"name\": \"Drugorz\\u0119dne menu\",\n            \"description\": \"\",\n            \"parent\": 0,\n            \"auto_add\": false\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:20:22\"\n    },\n    \"nav_menu_item[-5]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"\",\n            \"menu_item_parent\": 0,\n            \"position\": 0,\n            \"type\": \"custom\",\n            \"title\": \"Facebook\",\n            \"url\": \"https://www.facebook.com/wordpress\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"\",\n            \"nav_menu_term_id\": -5,\n            \"_invalid\": false,\n            \"type_label\": \"W\\u0142asny odno\\u015bnik\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:20:22\"\n    },\n    \"nav_menu_item[-6]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"\",\n            \"menu_item_parent\": 0,\n            \"position\": 1,\n            \"type\": \"custom\",\n            \"title\": \"Twitter\",\n            \"url\": \"https://twitter.com/wordpress\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"\",\n            \"nav_menu_term_id\": -5,\n            \"_invalid\": false,\n            \"type_label\": \"W\\u0142asny odno\\u015bnik\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:20:22\"\n    },\n    \"nav_menu_item[-7]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"\",\n            \"menu_item_parent\": 0,\n            \"position\": 2,\n            \"type\": \"custom\",\n            \"title\": \"Instagram\",\n            \"url\": \"https://www.instagram.com/explore/tags/wordcamp/\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"\",\n            \"nav_menu_term_id\": -5,\n            \"_invalid\": false,\n            \"type_label\": \"W\\u0142asny odno\\u015bnik\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:20:22\"\n    },\n    \"nav_menu_item[-8]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"\",\n            \"menu_item_parent\": 0,\n            \"position\": 3,\n            \"type\": \"custom\",\n            \"title\": \"Email\",\n            \"url\": \"mailto:wordpress@example.com\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"\",\n            \"nav_menu_term_id\": -5,\n            \"_invalid\": false,\n            \"type_label\": \"W\\u0142asny odno\\u015bnik\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:20:22\"\n    },\n    \"twentytwentyone::nav_menu_locations[footer]\": {\n        \"starter_content\": true,\n        \"value\": -5,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:19:55\"\n    },\n    \"show_on_front\": {\n        \"starter_content\": true,\n        \"value\": \"page\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:19:55\"\n    },\n    \"page_on_front\": {\n        \"starter_content\": true,\n        \"value\": 5,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:19:55\"\n    },\n    \"page_for_posts\": {\n        \"starter_content\": true,\n        \"value\": 8,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-12-21 21:19:55\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '30f561fa-a8a7-4286-b6b5-ed609215c184', '', '', '2021-12-21 22:20:22', '2021-12-21 21:20:22', '', 0, 'http://localhost/czad/?p=9', 0, 'customize_changeset', '', 0),
(10, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '\n					<!-- wp:heading {\"align\":\"wide\",\"fontSize\":\"gigantic\",\"style\":{\"typography\":{\"lineHeight\":\"1.1\"}}} -->\n					<h2 class=\"alignwide has-text-align-wide has-gigantic-font-size\" style=\"line-height:1.1\">Twórz swoją witrynę za pomocą bloków</h2>\n					<!-- /wp:heading -->\n\n					<!-- wp:spacer -->\n					<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:columns {\"verticalAlignment\":\"center\",\"align\":\"wide\",\"className\":\"is-style-twentytwentyone-columns-overlap\"} -->\n					<div class=\"wp-block-columns alignwide are-vertically-aligned-center is-style-twentytwentyone-columns-overlap\"><!-- wp:column {\"verticalAlignment\":\"center\"} -->\n					<div class=\"wp-block-column is-vertically-aligned-center\"><!-- wp:image {\"align\":\"full\",\"sizeSlug\":\"large\"} -->\n					<figure class=\"wp-block-image alignfull size-large\"><img src=\"http://localhost/czad/wp-content/themes/twentytwentyone/assets/images/roses-tremieres-hollyhocks-1884.jpg\" alt=\"&#8220;Malwy&#8221; - Berthe Morisot\"/></figure>\n					<!-- /wp:image -->\n\n					<!-- wp:spacer -->\n					<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:image {\"align\":\"full\",\"sizeSlug\":\"large\",\"className\":\"is-style-twentytwentyone-image-frame\"} -->\n					<figure class=\"wp-block-image alignfull size-large is-style-twentytwentyone-image-frame\"><img src=\"http://localhost/czad/wp-content/themes/twentytwentyone/assets/images/in-the-bois-de-boulogne.jpg\" alt=\"&#8220;W Lasku Bolońskim&#8221; - Berthe Morisot\"/></figure>\n					<!-- /wp:image --></div>\n					<!-- /wp:column -->\n\n					<!-- wp:column {\"verticalAlignment\":\"center\"} -->\n					<div class=\"wp-block-column is-vertically-aligned-center\"><!-- wp:spacer -->\n					<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:image {\"sizeSlug\":\"large\",\"className\":\"alignfull size-full is-style-twentytwentyone-border\"} -->\n					<figure class=\"wp-block-image size-large alignfull size-full is-style-twentytwentyone-border\"><img src=\"http://localhost/czad/wp-content/themes/twentytwentyone/assets/images/young-woman-in-mauve.jpg\" alt=\"&#8220;Młoda kobieta w fiołkach&#8221; - Berthe Morisot\"/></figure>\n					<!-- /wp:image --></div>\n					<!-- /wp:column --></div>\n					<!-- /wp:columns -->\n\n					<!-- wp:spacer {\"height\":50} -->\n					<div style=\"height:50px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:columns {\"verticalAlignment\":\"top\",\"align\":\"wide\"} -->\n					<div class=\"wp-block-columns alignwide are-vertically-aligned-top\"><!-- wp:column {\"verticalAlignment\":\"top\"} -->\n					<div class=\"wp-block-column is-vertically-aligned-top\"><!-- wp:heading {\"level\":3} -->\n					<h3>Dodaj wzorzec bloków</h3>\n					<!-- /wp:heading -->\n\n					<!-- wp:paragraph -->\n					<p>Wzory bloków to wstępnie zaprojektowane grupy bloków. Aby dodać, wybierz przycisk dodaj blok [+] na pasku narzędzi u góry edytora. Przejdź do karty Wzory pod paskiem wyszukiwania i wybierz.</p>\n					<!-- /wp:paragraph --></div>\n					<!-- /wp:column -->\n\n					<!-- wp:column {\"verticalAlignment\":\"top\"} -->\n					<div class=\"wp-block-column is-vertically-aligned-top\"><!-- wp:heading {\"level\":3} -->\n					<h3>Dodaj ramkę do obrazków</h3>\n					<!-- /wp:heading -->\n\n					<!-- wp:paragraph -->\n					<p>Twenty Twenty-One zawiera stylowe obramowanie treści. W bloku obrazka otwórz panel „Style” z paska bocznego edytora. Wybierz styl bloku „Ramka”, aby aktywować.</p>\n					<!-- /wp:paragraph --></div>\n					<!-- /wp:column -->\n\n					<!-- wp:column {\"verticalAlignment\":\"top\"} -->\n					<div class=\"wp-block-column is-vertically-aligned-top\"><!-- wp:heading {\"level\":3} -->\n					<h3>Nakładające się kolumny</h3>\n					<!-- /wp:heading -->\n\n					<!-- wp:paragraph -->\n					<p>Twenty Twenty-One zawiera również styl nakładania się na bloków kolumn. Po zaznaczeniu bloku Kolumny otwórz panel „Style” na pasku bocznym Edytora. Wybierz styl bloku „Nakładanie”, aby wypróbować.</p>\n					<!-- /wp:paragraph --></div>\n					<!-- /wp:column --></div>\n					<!-- /wp:columns -->\n\n					<!-- wp:spacer -->\n					<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:cover {\"overlayColor\":\"green\",\"contentPosition\":\"center center\",\"align\":\"wide\",\"className\":\"is-style-twentytwentyone-border\"} -->\n					<div class=\"wp-block-cover alignwide has-green-background-color has-background-dim is-style-twentytwentyone-border\"><div class=\"wp-block-cover__inner-container\"><!-- wp:spacer {\"height\":20} -->\n					<div style=\"height:20px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:paragraph {\"fontSize\":\"huge\"} -->\n					<p class=\"has-huge-font-size\">Potrzebujesz pomocy?</p>\n					<!-- /wp:paragraph -->\n\n					<!-- wp:spacer {\"height\":75} -->\n					<div style=\"height:75px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer -->\n\n					<!-- wp:columns -->\n					<div class=\"wp-block-columns\"><!-- wp:column -->\n					<div class=\"wp-block-column\"><!-- wp:paragraph -->\n					<p><a href=\"https://wordpress.org/support/article/twenty-twenty-one/\">Przeczytaj dokumentację motywu</a></p>\n					<!-- /wp:paragraph --></div>\n					<!-- /wp:column -->\n\n					<!-- wp:column -->\n					<div class=\"wp-block-column\"><!-- wp:paragraph -->\n					<p><a href=\"https://wordpress.org/support/theme/twentytwentyone/\">Sprawdź forum wsparcia</a></p>\n					<!-- /wp:paragraph --></div>\n					<!-- /wp:column --></div>\n					<!-- /wp:columns -->\n\n					<!-- wp:spacer {\"height\":20} -->\n					<div style=\"height:20px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n					<!-- /wp:spacer --></div></div>\n					<!-- /wp:cover -->', 'Twórz swoją witrynę za pomocą bloków', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 5, 'http://localhost/czad/?p=10', 0, 'revision', '', 0),
(11, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '<!-- wp:paragraph -->\n<p>Możesz być artystą, który chciałby przedstawić siebie i swoją pracę, a może to strona firmowa, a sama firma ma misję do opisania.</p>\n<!-- /wp:paragraph -->', 'Informacje', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 6, 'http://localhost/czad/?p=11', 0, 'revision', '', 0),
(12, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '<!-- wp:paragraph -->\n<p>Strona z podstawowymi informacjami kontaktowymi, takimi jak adres, numer telefonu. Można także spróbować wtyczki, za pomocą której dodamy formularz kontaktowy.</p>\n<!-- /wp:paragraph -->', 'Kontakt', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 7, 'http://localhost/czad/?p=12', 0, 'revision', '', 0),
(13, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 8, 'http://localhost/czad/?p=13', 0, 'revision', '', 0),
(14, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 'Strona główna', '', 'publish', 'closed', 'closed', '', 'strona-glowna', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/2021/12/21/strona-glowna/', 0, 'nav_menu_item', '', 0),
(15, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', ' ', '', '', 'publish', 'closed', 'closed', '', '15', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/2021/12/21/15/', 1, 'nav_menu_item', '', 0),
(16, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', ' ', '', '', 'publish', 'closed', 'closed', '', '16', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/2021/12/21/16/', 2, 'nav_menu_item', '', 0),
(17, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', ' ', '', '', 'publish', 'closed', 'closed', '', '17', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/2021/12/21/17/', 3, 'nav_menu_item', '', 0),
(18, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 'Facebook', '', 'publish', 'closed', 'closed', '', 'facebook', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/2021/12/21/facebook/', 0, 'nav_menu_item', '', 0),
(19, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 'Twitter', '', 'publish', 'closed', 'closed', '', 'twitter', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/2021/12/21/twitter/', 1, 'nav_menu_item', '', 0),
(20, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 'Instagram', '', 'publish', 'closed', 'closed', '', 'instagram', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/2021/12/21/instagram/', 2, 'nav_menu_item', '', 0),
(21, 1, '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 'Email', '', 'publish', 'closed', 'closed', '', 'email', '', '', '2021-12-21 22:20:23', '2021-12-21 21:20:23', '', 0, 'http://localhost/czad/2021/12/21/email/', 3, 'nav_menu_item', '', 0),
(22, 1, '2021-12-21 22:21:39', '0000-00-00 00:00:00', '', 'Automatycznie zapisany szkic', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2021-12-21 22:21:39', '0000-00-00 00:00:00', '', 0, 'http://localhost/czad/?page_id=22', 0, 'page', '', 0),
(23, 1, '2021-12-21 22:22:02', '0000-00-00 00:00:00', '', 'Automatycznie zapisany szkic', '', 'auto-draft', 'open', 'open', '', '', '', '', '2021-12-21 22:22:02', '0000-00-00 00:00:00', '', 0, 'http://localhost/czad/?p=23', 0, 'post', '', 0),
(24, 1, '2021-12-21 22:24:42', '2021-12-21 21:24:42', '<!-- wp:heading {\"align\":\"wide\",\"style\":{\"typography\":{\"lineHeight\":\"1.1\"}},\"className\":\"has-text-align-wide\",\"fontSize\":\"gigantic\"} -->\n<h2 class=\"alignwide has-text-align-wide has-gigantic-font-size\" style=\"line-height:1.1\">Twórz swoją witrynę za pomocą bloków</h2>\n<!-- /wp:heading -->\n\n<!-- wp:spacer -->\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:columns {\"verticalAlignment\":\"center\",\"align\":\"wide\",\"className\":\"is-style-twentytwentyone-columns-overlap\"} -->\n<div class=\"wp-block-columns alignwide are-vertically-aligned-center is-style-twentytwentyone-columns-overlap\"><!-- wp:column {\"verticalAlignment\":\"center\"} -->\n<div class=\"wp-block-column is-vertically-aligned-center\"><!-- wp:image {\"align\":\"full\",\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image alignfull size-large\"><img src=\"http://localhost/czad/wp-content/themes/twentytwentyone/assets/images/roses-tremieres-hollyhocks-1884.jpg\" alt=\"“Malwy” - Berthe Morisot\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:spacer -->\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:image {\"align\":\"full\",\"sizeSlug\":\"large\",\"className\":\"is-style-twentytwentyone-image-frame\"} -->\n<figure class=\"wp-block-image alignfull size-large is-style-twentytwentyone-image-frame\"><img src=\"http://localhost/czad/wp-content/themes/twentytwentyone/assets/images/in-the-bois-de-boulogne.jpg\" alt=\"“W Lasku Bolońskim” - Berthe Morisot\"/></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"verticalAlignment\":\"center\"} -->\n<div class=\"wp-block-column is-vertically-aligned-center\"><!-- wp:spacer -->\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:image {\"sizeSlug\":\"large\",\"className\":\"alignfull size-full is-style-twentytwentyone-border\"} -->\n<figure class=\"wp-block-image size-large alignfull size-full is-style-twentytwentyone-border\"><img src=\"http://localhost/czad/wp-content/themes/twentytwentyone/assets/images/young-woman-in-mauve.jpg\" alt=\"“Młoda kobieta w fiołkach” - Berthe Morisot\"/></figure>\n<!-- /wp:image --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:spacer {\"height\":50} -->\n<div style=\"height:50px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:columns {\"verticalAlignment\":\"top\",\"align\":\"wide\"} -->\n<div class=\"wp-block-columns alignwide are-vertically-aligned-top\"><!-- wp:column {\"verticalAlignment\":\"top\"} -->\n<div class=\"wp-block-column is-vertically-aligned-top\"><!-- wp:heading {\"level\":3} -->\n<h3>Dodaj wzorzec bloków</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Wzory bloków to wstępnie zaprojektowane grupy bloków. Aby dodać, wybierz przycisk dodaj blok [+] na pasku narzędzi u góry edytora. Przejdź do karty Wzory pod paskiem wyszukiwania i wybierz.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"verticalAlignment\":\"top\"} -->\n<div class=\"wp-block-column is-vertically-aligned-top\"><!-- wp:heading {\"level\":3} -->\n<h3>Dodaj ramkę do obrazków</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Twenty Twenty-One zawiera stylowe obramowanie treści. W bloku obrazka otwórz panel „Style” z paska bocznego edytora. Wybierz styl bloku „Ramka”, aby aktywować.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column {\"verticalAlignment\":\"top\"} -->\n<div class=\"wp-block-column is-vertically-aligned-top\"><!-- wp:heading {\"level\":3} -->\n<h3>Nakładające się kolumny</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Twenty Twenty-One zawiera również styl nakładania się na bloków kolumn. Po zaznaczeniu bloku Kolumny otwórz panel „Style” na pasku bocznym Edytora. Wybierz styl bloku „Nakładanie”, aby wypróbować.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:spacer -->\n<div style=\"height:100px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:cover {\"overlayColor\":\"green\",\"contentPosition\":\"center center\",\"align\":\"wide\",\"className\":\"is-style-twentytwentyone-border\"} -->\n<div class=\"wp-block-cover alignwide has-green-background-color has-background-dim is-style-twentytwentyone-border\"><div class=\"wp-block-cover__inner-container\"><!-- wp:spacer {\"height\":20} -->\n<div style=\"height:20px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:paragraph {\"fontSize\":\"huge\"} -->\n<p class=\"has-huge-font-size\">Potrzebujesz pomocy?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:spacer {\"height\":75} -->\n<div style=\"height:75px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer -->\n\n<!-- wp:columns -->\n<div class=\"wp-block-columns\"><!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p><a href=\"https://wordpress.org/support/article/twenty-twenty-one/\">Przeczytaj dokumentację motywu</a></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column -->\n\n<!-- wp:column -->\n<div class=\"wp-block-column\"><!-- wp:paragraph -->\n<p><a href=\"https://wordpress.org/support/theme/twentytwentyone/\">Sprawdź forum wsparcia</a></p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:column --></div>\n<!-- /wp:columns -->\n\n<!-- wp:spacer {\"height\":20} -->\n<div style=\"height:20px\" aria-hidden=\"true\" class=\"wp-block-spacer\"></div>\n<!-- /wp:spacer --></div></div>\n<!-- /wp:cover -->\n\n<!-- wp:code -->\n<pre class=\"wp-block-code\"><code></code></pre>\n<!-- /wp:code -->', 'Twórz swoją witrynę za pomocą bloków', '', 'inherit', 'closed', 'closed', '', '5-autosave-v1', '', '', '2021-12-21 22:24:42', '2021-12-21 21:24:42', '', 5, 'http://localhost/czad/?p=24', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Bez kategorii', 'bez-kategorii', 0),
(2, 'Menu główne', 'menu-glowne', 0),
(3, 'Drugorzędne menu', 'drugorzedne-menu', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(14, 2, 0),
(15, 2, 0),
(16, 2, 0),
(17, 2, 0),
(18, 3, 0),
(19, 3, 0),
(20, 3, 0),
(21, 3, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 4),
(3, 3, 'nav_menu', '', 0, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'dziad'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"7ae4b703bb916e607cae39de630545ced261136951d70c6df4f74d94c6a0c7d4\";a:4:{s:10:\"expiration\";i:1641331185;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36\";s:5:\"login\";i:1640121585;}s:64:\"fe3cb71af55a79c4c00f5e2aced23874e46e0fdc738228b3f18464a0dfeae15e\";a:4:{s:10:\"expiration\";i:1641332481;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36\";s:5:\"login\";i:1640122881;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'dziad', '$P$BT1OrqR5nZrokHiaeDu.ZeDSjdoXf1/', 'dziad', 'draki573573@gmail.com', 'http://localhost/czad', '2021-12-21 21:19:28', '', 0, 'dziad');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeksy dla tabeli `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indeksy dla tabeli `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indeksy dla tabeli `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indeksy dla tabeli `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indeksy dla tabeli `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indeksy dla tabeli `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indeksy dla tabeli `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indeksy dla tabeli `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indeksy dla tabeli `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indeksy dla tabeli `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indeksy dla tabeli `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indeksy dla tabeli `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT dla tabeli `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT dla tabeli `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Baza danych: `wedkowanie`
--
CREATE DATABASE IF NOT EXISTS `wedkowanie` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wedkowanie`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `karty_wedkarskie`
--

CREATE TABLE `karty_wedkarskie` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `adres` text DEFAULT NULL,
  `data_zezwolenia` date DEFAULT NULL,
  `punkty` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `karty_wedkarskie`
--

INSERT INTO `karty_wedkarskie` (`id`, `imie`, `nazwisko`, `adres`, `data_zezwolenia`, `punkty`) VALUES
(1, 'Jan', 'Kowalski', 'Warszawa, Aleje Jerozolimskie 65/4', '2018-02-15', 23),
(2, 'Andrzej', 'Nowak', 'Poznan, Dabowskiego 16/4', '2018-03-12', 3),
(3, 'Grzegorz', 'Niemczyk', 'Gdynia, Batorego 14/5', '2018-02-23', 0),
(24, 'Grzesiek', 'Floryda', 'lat 12 pedofil i pada?', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lowisko`
--

CREATE TABLE `lowisko` (
  `id` int(10) UNSIGNED NOT NULL,
  `Ryby_id` int(10) UNSIGNED NOT NULL,
  `akwen` text DEFAULT NULL,
  `wojewodztwo` text DEFAULT NULL,
  `rodzaj` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `lowisko`
--

INSERT INTO `lowisko` (`id`, `Ryby_id`, `akwen`, `wojewodztwo`, `rodzaj`) VALUES
(1, 2, 'Zalew Wegrowski', 'Mazowieckie', 4),
(2, 3, 'Zbiornik Bukowka', 'Dolnoslaskie', 2),
(3, 2, 'Jeziorko Bartbetowskie', 'Warminsko-Mazurskie', 2),
(4, 1, 'Warta-Obrzycko', 'Wielkopolskie', 3),
(5, 2, 'Stawy Milkow', 'Podkarpackie', 5),
(6, 7, 'Przemsza k. Okradzinowa', 'Slaskie', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `okres_ochronny`
--

CREATE TABLE `okres_ochronny` (
  `id` int(10) UNSIGNED NOT NULL,
  `Ryby_id` int(10) UNSIGNED NOT NULL,
  `od_miesiaca` int(10) UNSIGNED DEFAULT NULL,
  `do_miesiaca` int(10) UNSIGNED DEFAULT NULL,
  `wymiar_ochronny` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `okres_ochronny`
--

INSERT INTO `okres_ochronny` (`id`, `Ryby_id`, `od_miesiaca`, `do_miesiaca`, `wymiar_ochronny`) VALUES
(1, 1, 1, 4, 50),
(2, 2, 0, 0, 30),
(3, 3, 1, 5, 50),
(4, 4, 0, 0, 15),
(5, 5, 11, 6, 70),
(6, 6, 0, 0, 0),
(7, 7, 0, 0, 0),
(8, 8, 0, 0, 25);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pokoje`
--

CREATE TABLE `pokoje` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(20) NOT NULL,
  `cena` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ryby`
--

CREATE TABLE `ryby` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` text DEFAULT NULL,
  `wystepowanie` text DEFAULT NULL,
  `styl_zycia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ryby`
--

INSERT INTO `ryby` (`id`, `nazwa`, `wystepowanie`, `styl_zycia`) VALUES
(1, 'Szczupak', 'stawy, rzeki', 1),
(2, 'Karp', 'stawy, jeziora', 2),
(3, 'Sandacz', 'stawy, jeziora, rzeki', 1),
(4, 'Okon', 'rzeki', 1),
(5, 'Sum', 'jeziora, rzeki', 1),
(6, 'Dorsz', 'morza, oceany', 1),
(7, 'Leszcz', 'jeziora', 2),
(8, 'Lin', 'jeziora', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochody`
--

CREATE TABLE `samochody` (
  `id` int(10) UNSIGNED NOT NULL,
  `marka` text DEFAULT NULL,
  `model` text DEFAULT NULL,
  `rocznik` year(4) DEFAULT NULL,
  `kolor` text DEFAULT NULL,
  `stan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `samochody`
--

INSERT INTO `samochody` (`id`, `marka`, `model`, `rocznik`, `kolor`, `stan`) VALUES
(1, 'Fiat', 'Punto', 2016, 'czerwony', 'bardzo dobry'),
(2, 'Fiat', 'Punto', 2002, 'czerwony', 'dobry'),
(3, 'Fiat', 'Punto', 2007, 'niebieski', 'bardzo bobry'),
(4, 'Opel', 'Corsa', 2016, 'grafitowy', 'bardzo dobry'),
(5, 'Opel', 'Astra', 2003, 'niebieski', 'porysowany lakier'),
(6, 'Toyota', 'Corolla', 2016, 'czerwony', 'bardzo dobry'),
(7, 'Toyota', 'Corolla', 2014, 'szary', 'dobry'),
(8, 'Toyota', 'Yaris', 2004, 'granatowy', 'dobry');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typy`
--

CREATE TABLE `typy` (
  `id` int(10) UNSIGNED NOT NULL,
  `kategoria` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `typy`
--

INSERT INTO `typy` (`id`, `kategoria`) VALUES
(1, 'Procesor'),
(2, 'RAM'),
(5, 'karta graficzna'),
(6, 'HDD');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `wiek` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uczniowie`
--

INSERT INTO `uczniowie` (`imie`, `nazwisko`, `wiek`) VALUES
('Kamil', 'Ryba', 11),
('Karolina', 'Witecka', 8),
('Karol', 'Rybacki', 9),
('Marina', 'Damiencka', 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `telefon` text DEFAULT NULL,
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`id`, `imie`, `nazwisko`, `telefon`, `email`) VALUES
(1, 'Anna', 'Kowalska', '601601601', 'anna@poczta.pl'),
(2, 'Jan', 'Nowak', '608608608', 'jan@poczta.pl'),
(3, 'Jolanta', 'Jasny', '606606606', 'jolanta@poczta.pl'),
(4, 'qqq', 'www', '345', 'dsfsdklfs@daskl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyniki`
--

CREATE TABLE `wyniki` (
  `id` int(10) UNSIGNED NOT NULL,
  `dyscyplina_id` int(10) UNSIGNED NOT NULL,
  `sportowiec_id` int(10) UNSIGNED NOT NULL,
  `wynik` decimal(5,2) DEFAULT NULL,
  `dataUstanowienia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wyniki`
--

INSERT INTO `wyniki` (`id`, `dyscyplina_id`, `sportowiec_id`, `wynik`, `dataUstanowienia`) VALUES
(1, 1, 1, '12.40', '2015-10-14'),
(2, 1, 1, '12.00', '2015-10-06'),
(3, 1, 2, '11.80', '2015-10-14'),
(4, 1, 2, '11.90', '2015-10-06'),
(5, 1, 3, '11.50', '2015-10-14'),
(6, 1, 3, '11.56', '2015-10-06'),
(7, 1, 4, '11.70', '2015-10-14'),
(8, 1, 4, '11.67', '2015-10-06'),
(9, 1, 5, '11.30', '2015-10-14'),
(10, 1, 5, '11.52', '2015-10-06'),
(11, 1, 6, '12.10', '2015-10-14'),
(12, 1, 6, '12.00', '2015-10-06'),
(13, 3, 1, '63.00', '2015-11-11'),
(14, 3, 1, '63.60', '2015-10-13'),
(15, 3, 2, '64.00', '2015-11-11'),
(16, 3, 2, '63.60', '2015-10-13'),
(17, 3, 3, '60.00', '2015-11-11'),
(18, 3, 3, '61.60', '2015-10-13'),
(19, 3, 4, '63.50', '2015-11-11'),
(20, 3, 4, '63.60', '2015-10-13'),
(21, 3, 5, '70.00', '2015-10-07'),
(22, 3, 6, '68.00', '2015-10-07');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id` int(10) UNSIGNED NOT NULL,
  `Samochody_id` int(10) UNSIGNED NOT NULL,
  `Klient` text DEFAULT NULL,
  `telefon` text DEFAULT NULL,
  `dataZam` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `Samochody_id`, `Klient`, `telefon`, `dataZam`) VALUES
(1, 3, 'Anna Kowalska', '111222333', '2016-02-15'),
(2, 6, 'Jan Nowakowski', '222111333', '2016-02-15'),
(3, 8, 'Marcin Kolwal', '333111222', '2016-02-15');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zawody_wedkarskie`
--

CREATE TABLE `zawody_wedkarskie` (
  `id` int(10) UNSIGNED NOT NULL,
  `Karty_wedkarskie_id` int(10) UNSIGNED NOT NULL,
  `Lowisko_id` int(10) UNSIGNED NOT NULL,
  `data_zawodow` date DEFAULT NULL,
  `sedzia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zawody_wedkarskie`
--

INSERT INTO `zawody_wedkarskie` (`id`, `Karty_wedkarskie_id`, `Lowisko_id`, `data_zawodow`, `sedzia`) VALUES
(1, 1, 3, '2018-04-12', 'Jan Kowalewski'),
(2, 1, 5, '2018-05-01', 'Jan Kowalewski'),
(3, 1, 2, '2018-06-01', 'Jan Kowalewski'),
(4, 2, 1, '2018-06-21', 'Krzysztof Dobrowolski');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `karty_wedkarskie`
--
ALTER TABLE `karty_wedkarskie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `lowisko`
--
ALTER TABLE `lowisko`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `okres_ochronny`
--
ALTER TABLE `okres_ochronny`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `ryby`
--
ALTER TABLE `ryby`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `typy`
--
ALTER TABLE `typy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zawody_wedkarskie`
--
ALTER TABLE `zawody_wedkarskie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `karty_wedkarskie`
--
ALTER TABLE `karty_wedkarskie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `lowisko`
--
ALTER TABLE `lowisko`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `okres_ochronny`
--
ALTER TABLE `okres_ochronny`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `ryby`
--
ALTER TABLE `ryby`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `samochody`
--
ALTER TABLE `samochody`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `typy`
--
ALTER TABLE `typy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `zawody_wedkarskie`
--
ALTER TABLE `zawody_wedkarskie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Baza danych: `wordpress`
--
CREATE DATABASE IF NOT EXISTS `wordpress` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `wordpress`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Komentator WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2022-03-30 19:57:31', '2022-03-30 17:57:31', 'Cześć, to jest komentarz.\nAby zapoznać się z moderowaniem, edycją i usuwaniem komentarzy, należy odwiedzić ekran Komentarze w kokpicie.\nAwatary komentujących pochodzą z <a href=\"https://pl.gravatar.com\">Gravatara</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'wordpress', 'yes'),
(4, 'blogdescription', 'Kolejna witryna oparta na WordPressie', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'smagaczkrystian1bigzst@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'j F Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:94:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:0:{}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentytwenty', 'yes'),
(41, 'stylesheet', 'twentytwenty', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '51917', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:3:{i:2;a:4:{s:5:\"title\";s:10:\"O witrynie\";s:4:\"text\";s:105:\"Może to być dobre miejsce, aby przedstawić siebie i swoją witrynę lub wymienić zaangażowane osoby.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:3;a:4:{s:5:\"title\";s:11:\"Znajdź nas\";s:4:\"text\";s:174:\"<strong>Adres</strong>\nul. Marszałkowska 1\nWarszawa, 00-500\n\n<strong>Godziny</strong>\nPoniedziałek&mdash;piątek: 9:00&ndash;17:00\nSobota &amp; Niedziela: 11:00&ndash;15:00\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', 'Europe/Warsaw', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '0', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1664215050', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '51917', 'yes'),
(100, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(101, 'fresh_site', '1', 'yes'),
(102, 'WPLANG', 'pl_PL', 'yes'),
(103, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:156:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Ostatnie wpisy</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:232:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Najnowsze komentarze</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:145:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archiwa</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:149:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Kategorie</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(105, 'cron', 'a:6:{i:1648666651;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1648706251;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1648749451;a:2:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1648749460;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1648749461;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(106, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'recovery_keys', 'a:0:{}', 'yes'),
(120, '_transient_timeout_global_styles_twentytwentytwo', '1648663112', 'no'),
(121, '_transient_global_styles_twentytwentytwo', 'body{--wp--preset--color--black: #000000;--wp--preset--color--cyan-bluish-gray: #abb8c3;--wp--preset--color--white: #ffffff;--wp--preset--color--pale-pink: #f78da7;--wp--preset--color--vivid-red: #cf2e2e;--wp--preset--color--luminous-vivid-orange: #ff6900;--wp--preset--color--luminous-vivid-amber: #fcb900;--wp--preset--color--light-green-cyan: #7bdcb5;--wp--preset--color--vivid-green-cyan: #00d084;--wp--preset--color--pale-cyan-blue: #8ed1fc;--wp--preset--color--vivid-cyan-blue: #0693e3;--wp--preset--color--vivid-purple: #9b51e0;--wp--preset--color--foreground: #000000;--wp--preset--color--background: #ffffff;--wp--preset--color--primary: #1a4548;--wp--preset--color--secondary: #ffe2c7;--wp--preset--color--tertiary: #F6F6F6;--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg,rgba(6,147,227,1) 0%,rgb(155,81,224) 100%);--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg,rgb(122,220,180) 0%,rgb(0,208,130) 100%);--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg,rgba(252,185,0,1) 0%,rgba(255,105,0,1) 100%);--wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg,rgba(255,105,0,1) 0%,rgb(207,46,46) 100%);--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg,rgb(238,238,238) 0%,rgb(169,184,195) 100%);--wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg,rgb(74,234,220) 0%,rgb(151,120,209) 20%,rgb(207,42,186) 40%,rgb(238,44,130) 60%,rgb(251,105,98) 80%,rgb(254,248,76) 100%);--wp--preset--gradient--blush-light-purple: linear-gradient(135deg,rgb(255,206,236) 0%,rgb(152,150,240) 100%);--wp--preset--gradient--blush-bordeaux: linear-gradient(135deg,rgb(254,205,165) 0%,rgb(254,45,45) 50%,rgb(107,0,62) 100%);--wp--preset--gradient--luminous-dusk: linear-gradient(135deg,rgb(255,203,112) 0%,rgb(199,81,192) 50%,rgb(65,88,208) 100%);--wp--preset--gradient--pale-ocean: linear-gradient(135deg,rgb(255,245,203) 0%,rgb(182,227,212) 50%,rgb(51,167,181) 100%);--wp--preset--gradient--electric-grass: linear-gradient(135deg,rgb(202,248,128) 0%,rgb(113,206,126) 100%);--wp--preset--gradient--midnight: linear-gradient(135deg,rgb(2,3,129) 0%,rgb(40,116,252) 100%);--wp--preset--gradient--vertical-secondary-to-tertiary: linear-gradient(to bottom,var(--wp--preset--color--secondary) 0%,var(--wp--preset--color--tertiary) 100%);--wp--preset--gradient--vertical-secondary-to-background: linear-gradient(to bottom,var(--wp--preset--color--secondary) 0%,var(--wp--preset--color--background) 100%);--wp--preset--gradient--vertical-tertiary-to-background: linear-gradient(to bottom,var(--wp--preset--color--tertiary) 0%,var(--wp--preset--color--background) 100%);--wp--preset--gradient--diagonal-primary-to-foreground: linear-gradient(to bottom right,var(--wp--preset--color--primary) 0%,var(--wp--preset--color--foreground) 100%);--wp--preset--gradient--diagonal-secondary-to-background: linear-gradient(to bottom right,var(--wp--preset--color--secondary) 50%,var(--wp--preset--color--background) 50%);--wp--preset--gradient--diagonal-background-to-secondary: linear-gradient(to bottom right,var(--wp--preset--color--background) 50%,var(--wp--preset--color--secondary) 50%);--wp--preset--gradient--diagonal-tertiary-to-background: linear-gradient(to bottom right,var(--wp--preset--color--tertiary) 50%,var(--wp--preset--color--background) 50%);--wp--preset--gradient--diagonal-background-to-tertiary: linear-gradient(to bottom right,var(--wp--preset--color--background) 50%,var(--wp--preset--color--tertiary) 50%);--wp--preset--duotone--dark-grayscale: url(\'#wp-duotone-dark-grayscale\');--wp--preset--duotone--grayscale: url(\'#wp-duotone-grayscale\');--wp--preset--duotone--purple-yellow: url(\'#wp-duotone-purple-yellow\');--wp--preset--duotone--blue-red: url(\'#wp-duotone-blue-red\');--wp--preset--duotone--midnight: url(\'#wp-duotone-midnight\');--wp--preset--duotone--magenta-yellow: url(\'#wp-duotone-magenta-yellow\');--wp--preset--duotone--purple-green: url(\'#wp-duotone-purple-green\');--wp--preset--duotone--blue-orange: url(\'#wp-duotone-blue-orange\');--wp--preset--duotone--foreground-and-background: url(\'#wp-duotone-foreground-and-background\');--wp--preset--duotone--foreground-and-secondary: url(\'#wp-duotone-foreground-and-secondary\');--wp--preset--duotone--foreground-and-tertiary: url(\'#wp-duotone-foreground-and-tertiary\');--wp--preset--duotone--primary-and-background: url(\'#wp-duotone-primary-and-background\');--wp--preset--duotone--primary-and-secondary: url(\'#wp-duotone-primary-and-secondary\');--wp--preset--duotone--primary-and-tertiary: url(\'#wp-duotone-primary-and-tertiary\');--wp--preset--font-size--small: 1rem;--wp--preset--font-size--medium: 1.125rem;--wp--preset--font-size--large: 1.75rem;--wp--preset--font-size--x-large: clamp(1.75rem, 3vw, 2.25rem);--wp--preset--font-family--system-font: -apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,Oxygen-Sans,Ubuntu,Cantarell,\"Helvetica Neue\",sans-serif;--wp--preset--font-family--source-serif-pro: \"Source Serif Pro\", serif;--wp--custom--spacing--small: max(1.25rem, 5vw);--wp--custom--spacing--medium: clamp(2rem, 8vw, calc(4 * var(--wp--style--block-gap)));--wp--custom--spacing--large: clamp(4rem, 10vw, 8rem);--wp--custom--spacing--outer: var(--wp--custom--spacing--small, 1.25rem);--wp--custom--typography--font-size--huge: clamp(2.25rem, 4vw, 2.75rem);--wp--custom--typography--font-size--gigantic: clamp(2.75rem, 6vw, 3.25rem);--wp--custom--typography--font-size--colossal: clamp(3.25rem, 8vw, 6.25rem);--wp--custom--typography--line-height--tiny: 1.15;--wp--custom--typography--line-height--small: 1.2;--wp--custom--typography--line-height--medium: 1.4;--wp--custom--typography--line-height--normal: 1.6;}body { margin: 0; }body{background-color: var(--wp--preset--color--background);color: var(--wp--preset--color--foreground);font-family: var(--wp--preset--font-family--system-font);font-size: var(--wp--preset--font-size--medium);line-height: var(--wp--custom--typography--line-height--normal);--wp--style--block-gap: 1.5rem;}.wp-site-blocks > .alignleft { float: left; margin-right: 2em; }.wp-site-blocks > .alignright { float: right; margin-left: 2em; }.wp-site-blocks > .aligncenter { justify-content: center; margin-left: auto; margin-right: auto; }.wp-site-blocks > * { margin-top: 0; margin-bottom: 0; }.wp-site-blocks > * + * { margin-top: var( --wp--style--block-gap ); }h1{font-family: var(--wp--preset--font-family--source-serif-pro);font-size: var(--wp--custom--typography--font-size--colossal);font-weight: 300;line-height: var(--wp--custom--typography--line-height--tiny);}h2{font-family: var(--wp--preset--font-family--source-serif-pro);font-size: var(--wp--custom--typography--font-size--gigantic);font-weight: 300;line-height: var(--wp--custom--typography--line-height--small);}h3{font-family: var(--wp--preset--font-family--source-serif-pro);font-size: var(--wp--custom--typography--font-size--huge);font-weight: 300;line-height: var(--wp--custom--typography--line-height--tiny);}h4{font-family: var(--wp--preset--font-family--source-serif-pro);font-size: var(--wp--preset--font-size--x-large);font-weight: 300;line-height: var(--wp--custom--typography--line-height--tiny);}h5{font-family: var(--wp--preset--font-family--system-font);font-size: var(--wp--preset--font-size--medium);font-weight: 700;line-height: var(--wp--custom--typography--line-height--normal);text-transform: uppercase;}h6{font-family: var(--wp--preset--font-family--system-font);font-size: var(--wp--preset--font-size--medium);font-weight: 400;line-height: var(--wp--custom--typography--line-height--normal);text-transform: uppercase;}a{color: var(--wp--preset--color--foreground);}.wp-block-button__link{background-color: var(--wp--preset--color--primary);border-radius: 0;color: var(--wp--preset--color--background);font-size: var(--wp--preset--font-size--medium);}.wp-block-post-title{font-family: var(--wp--preset--font-family--source-serif-pro);font-size: var(--wp--custom--typography--font-size--gigantic);font-weight: 300;line-height: var(--wp--custom--typography--line-height--tiny);}.wp-block-post-comments{padding-top: var(--wp--custom--spacing--small);}.wp-block-pullquote{border-width: 1px 0;}.wp-block-query-title{font-family: var(--wp--preset--font-family--source-serif-pro);font-size: var(--wp--custom--typography--font-size--gigantic);font-weight: 300;line-height: var(--wp--custom--typography--line-height--small);}.wp-block-quote{border-width: 1px;}.wp-block-site-title{font-family: var(--wp--preset--font-family--system-font);font-size: var(--wp--preset--font-size--medium);font-weight: normal;line-height: var(--wp--custom--typography--line-height--normal);}.has-black-color{color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-color{color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-color{color: var(--wp--preset--color--white) !important;}.has-pale-pink-color{color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-color{color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-color{color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-color{color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-color{color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-color{color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-color{color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-color{color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-color{color: var(--wp--preset--color--vivid-purple) !important;}.has-foreground-color{color: var(--wp--preset--color--foreground) !important;}.has-background-color{color: var(--wp--preset--color--background) !important;}.has-primary-color{color: var(--wp--preset--color--primary) !important;}.has-secondary-color{color: var(--wp--preset--color--secondary) !important;}.has-tertiary-color{color: var(--wp--preset--color--tertiary) !important;}.has-black-background-color{background-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-background-color{background-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-background-color{background-color: var(--wp--preset--color--white) !important;}.has-pale-pink-background-color{background-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-background-color{background-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-background-color{background-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-background-color{background-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-background-color{background-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-background-color{background-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-background-color{background-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-background-color{background-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-background-color{background-color: var(--wp--preset--color--vivid-purple) !important;}.has-foreground-background-color{background-color: var(--wp--preset--color--foreground) !important;}.has-background-background-color{background-color: var(--wp--preset--color--background) !important;}.has-primary-background-color{background-color: var(--wp--preset--color--primary) !important;}.has-secondary-background-color{background-color: var(--wp--preset--color--secondary) !important;}.has-tertiary-background-color{background-color: var(--wp--preset--color--tertiary) !important;}.has-black-border-color{border-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-border-color{border-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-border-color{border-color: var(--wp--preset--color--white) !important;}.has-pale-pink-border-color{border-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-border-color{border-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-border-color{border-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-border-color{border-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-border-color{border-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-border-color{border-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-border-color{border-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-border-color{border-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-border-color{border-color: var(--wp--preset--color--vivid-purple) !important;}.has-foreground-border-color{border-color: var(--wp--preset--color--foreground) !important;}.has-background-border-color{border-color: var(--wp--preset--color--background) !important;}.has-primary-border-color{border-color: var(--wp--preset--color--primary) !important;}.has-secondary-border-color{border-color: var(--wp--preset--color--secondary) !important;}.has-tertiary-border-color{border-color: var(--wp--preset--color--tertiary) !important;}.has-vivid-cyan-blue-to-vivid-purple-gradient-background{background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;}.has-light-green-cyan-to-vivid-green-cyan-gradient-background{background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;}.has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;}.has-luminous-vivid-orange-to-vivid-red-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;}.has-very-light-gray-to-cyan-bluish-gray-gradient-background{background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;}.has-cool-to-warm-spectrum-gradient-background{background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;}.has-blush-light-purple-gradient-background{background: var(--wp--preset--gradient--blush-light-purple) !important;}.has-blush-bordeaux-gradient-background{background: var(--wp--preset--gradient--blush-bordeaux) !important;}.has-luminous-dusk-gradient-background{background: var(--wp--preset--gradient--luminous-dusk) !important;}.has-pale-ocean-gradient-background{background: var(--wp--preset--gradient--pale-ocean) !important;}.has-electric-grass-gradient-background{background: var(--wp--preset--gradient--electric-grass) !important;}.has-midnight-gradient-background{background: var(--wp--preset--gradient--midnight) !important;}.has-vertical-secondary-to-tertiary-gradient-background{background: var(--wp--preset--gradient--vertical-secondary-to-tertiary) !important;}.has-vertical-secondary-to-background-gradient-background{background: var(--wp--preset--gradient--vertical-secondary-to-background) !important;}.has-vertical-tertiary-to-background-gradient-background{background: var(--wp--preset--gradient--vertical-tertiary-to-background) !important;}.has-diagonal-primary-to-foreground-gradient-background{background: var(--wp--preset--gradient--diagonal-primary-to-foreground) !important;}.has-diagonal-secondary-to-background-gradient-background{background: var(--wp--preset--gradient--diagonal-secondary-to-background) !important;}.has-diagonal-background-to-secondary-gradient-background{background: var(--wp--preset--gradient--diagonal-background-to-secondary) !important;}.has-diagonal-tertiary-to-background-gradient-background{background: var(--wp--preset--gradient--diagonal-tertiary-to-background) !important;}.has-diagonal-background-to-tertiary-gradient-background{background: var(--wp--preset--gradient--diagonal-background-to-tertiary) !important;}.has-small-font-size{font-size: var(--wp--preset--font-size--small) !important;}.has-medium-font-size{font-size: var(--wp--preset--font-size--medium) !important;}.has-large-font-size{font-size: var(--wp--preset--font-size--large) !important;}.has-x-large-font-size{font-size: var(--wp--preset--font-size--x-large) !important;}.has-system-font-font-family{font-family: var(--wp--preset--font-family--system-font) !important;}.has-source-serif-pro-font-family{font-family: var(--wp--preset--font-family--source-serif-pro) !important;}', 'no'),
(122, 'theme_mods_twentytwentytwo', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1648663094;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(123, '_transient_timeout_global_styles_svg_filters_twentytwentytwo', '1648663112', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(124, '_transient_global_styles_svg_filters_twentytwentytwo', '<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-dark-grayscale\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 0.49803921568627\" /><feFuncG type=\"table\" tableValues=\"0 0.49803921568627\" /><feFuncB type=\"table\" tableValues=\"0 0.49803921568627\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-grayscale\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 1\" /><feFuncG type=\"table\" tableValues=\"0 1\" /><feFuncB type=\"table\" tableValues=\"0 1\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-purple-yellow\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.54901960784314 0.98823529411765\" /><feFuncG type=\"table\" tableValues=\"0 1\" /><feFuncB type=\"table\" tableValues=\"0.71764705882353 0.25490196078431\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-blue-red\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 1\" /><feFuncG type=\"table\" tableValues=\"0 0.27843137254902\" /><feFuncB type=\"table\" tableValues=\"0.5921568627451 0.27843137254902\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-midnight\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 0\" /><feFuncG type=\"table\" tableValues=\"0 0.64705882352941\" /><feFuncB type=\"table\" tableValues=\"0 1\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-magenta-yellow\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.78039215686275 1\" /><feFuncG type=\"table\" tableValues=\"0 0.94901960784314\" /><feFuncB type=\"table\" tableValues=\"0.35294117647059 0.47058823529412\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-purple-green\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.65098039215686 0.40392156862745\" /><feFuncG type=\"table\" tableValues=\"0 1\" /><feFuncB type=\"table\" tableValues=\"0.44705882352941 0.4\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-blue-orange\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.098039215686275 1\" /><feFuncG type=\"table\" tableValues=\"0 0.66274509803922\" /><feFuncB type=\"table\" tableValues=\"0.84705882352941 0.41960784313725\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-foreground-and-background\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 1\" /><feFuncG type=\"table\" tableValues=\"0 1\" /><feFuncB type=\"table\" tableValues=\"0 1\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-foreground-and-secondary\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 1\" /><feFuncG type=\"table\" tableValues=\"0 0.88627450980392\" /><feFuncB type=\"table\" tableValues=\"0 0.78039215686275\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-foreground-and-tertiary\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 0.96470588235294\" /><feFuncG type=\"table\" tableValues=\"0 0.96470588235294\" /><feFuncB type=\"table\" tableValues=\"0 0.96470588235294\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-primary-and-background\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.10196078431373 1\" /><feFuncG type=\"table\" tableValues=\"0.27058823529412 1\" /><feFuncB type=\"table\" tableValues=\"0.28235294117647 1\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-primary-and-secondary\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.10196078431373 1\" /><feFuncG type=\"table\" tableValues=\"0.27058823529412 0.88627450980392\" /><feFuncB type=\"table\" tableValues=\"0.28235294117647 0.78039215686275\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-primary-and-tertiary\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.10196078431373 0.96470588235294\" /><feFuncG type=\"table\" tableValues=\"0.27058823529412 0.96470588235294\" /><feFuncB type=\"table\" tableValues=\"0.28235294117647 0.96470588235294\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg>', 'no'),
(125, 'https_detection_errors', 'a:1:{s:23:\"ssl_verification_failed\";a:1:{i:0;s:36:\"Weryfikacja SSLa nie powiodła się.\";}}', 'yes'),
(129, '_site_transient_timeout_theme_roots', '1648664853', 'no'),
(130, '_site_transient_theme_roots', 'a:3:{s:12:\"twentytwenty\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";s:15:\"twentytwentytwo\";s:7:\"/themes\";}', 'no'),
(132, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/pl_PL/wordpress-5.9.2.zip\";s:6:\"locale\";s:5:\"pl_PL\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/pl_PL/wordpress-5.9.2.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.9.2\";s:7:\"version\";s:5:\"5.9.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.9\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1648663055;s:15:\"version_checked\";s:5:\"5.9.2\";s:12:\"translations\";a:0:{}}', 'no'),
(133, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1648663056;s:7:\"checked\";a:3:{s:12:\"twentytwenty\";s:3:\"1.9\";s:15:\"twentytwentyone\";s:3:\"1.5\";s:15:\"twentytwentytwo\";s:3:\"1.1\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.9\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.9.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentytwentyone\";a:6:{s:5:\"theme\";s:15:\"twentytwentyone\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentyone/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentyone.1.5.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentytwo\";a:6:{s:5:\"theme\";s:15:\"twentytwentytwo\";s:11:\"new_version\";s:3:\"1.1\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentytwo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentytwo.1.1.zip\";s:8:\"requires\";s:3:\"5.9\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'no'),
(134, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1648663056;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.2.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.2.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";}s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}s:7:\"checked\";a:2:{s:19:\"akismet/akismet.php\";s:5:\"4.2.2\";s:9:\"hello.php\";s:5:\"1.7.2\";}}', 'no'),
(135, '_site_transient_timeout_available_translations', '1648673857', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(136, '_site_transient_available_translations', 'a:128:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-05-13 15:59:22\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"am\";a:8:{s:8:\"language\";s:2:\"am\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-02 19:28:57\";s:12:\"english_name\";s:7:\"Amharic\";s:11:\"native_name\";s:12:\"አማርኛ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/am.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"am\";i:2;s:3:\"amh\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"ቀጥል\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-24 06:01:42\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:6:\"4.8.19\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.19/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"5.8.4\";s:7:\"updated\";s:19:\"2021-09-08 17:57:56\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.4/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-12 20:34:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:6:\"4.9.20\";s:7:\"updated\";s:19:\"2019-10-29 07:54:22\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.9.20/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-29 12:06:55\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:6:\"5.4.10\";s:7:\"updated\";s:19:\"2020-10-31 08:48:37\";s:12:\"english_name\";s:20:\"Bengali (Bangladesh)\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.4.10/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2020-10-30 03:24:38\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:33:\"མུ་མཐུད་དུ།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-01-26 00:32:49\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 08:09:04\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-24 13:25:00\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:9:\"Čeština\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-18 16:29:19\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-25 09:25:03\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsæt\";}}s:5:\"de_AT\";a:8:{s:8:\"language\";s:5:\"de_AT\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-17 12:58:14\";s:12:\"english_name\";s:16:\"German (Austria)\";s:11:\"native_name\";s:21:\"Deutsch (Österreich)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/de_AT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 09:14:20\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-01-24 12:22:31\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/translation/core/5.9.2/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-01-24 12:26:13\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 07:33:21\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/5.9.2/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dsb\";a:8:{s:8:\"language\";s:3:\"dsb\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 09:37:19\";s:12:\"english_name\";s:13:\"Lower Sorbian\";s:11:\"native_name\";s:16:\"Dolnoserbšćina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.9.2/dsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"dsb\";i:3;s:3:\"dsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Dalej\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 12:16:36\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-22 23:27:29\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-03 19:07:54\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2021-12-24 12:36:39\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-22 23:27:53\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-22 23:28:15\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-20 13:34:40\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 04:41:53\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/es_ES.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_EC\";a:8:{s:8:\"language\";s:5:\"es_EC\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 04:44:22\";s:12:\"english_name\";s:17:\"Spanish (Ecuador)\";s:11:\"native_name\";s:19:\"Español de Ecuador\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/es_EC.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-28 00:39:08\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/es_AR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 14:14:00\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/es_MX.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 04:42:59\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/es_VE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CR\";a:8:{s:8:\"language\";s:5:\"es_CR\";s:7:\"version\";s:5:\"5.8.4\";s:7:\"updated\";s:19:\"2021-07-30 00:35:05\";s:12:\"english_name\";s:20:\"Spanish (Costa Rica)\";s:11:\"native_name\";s:22:\"Español de Costa Rica\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.4/es_CR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"5.8.4\";s:7:\"updated\";s:19:\"2021-10-04 20:53:18\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.4/es_PE.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_DO\";a:8:{s:8:\"language\";s:5:\"es_DO\";s:7:\"version\";s:5:\"5.8.4\";s:7:\"updated\";s:19:\"2021-10-08 14:32:50\";s:12:\"english_name\";s:28:\"Spanish (Dominican Republic)\";s:11:\"native_name\";s:33:\"Español de República Dominicana\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.4/es_DO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-06-14 16:02:22\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/es_CL.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_UY\";a:8:{s:8:\"language\";s:5:\"es_UY\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-31 18:33:26\";s:12:\"english_name\";s:17:\"Spanish (Uruguay)\";s:11:\"native_name\";s:19:\"Español de Uruguay\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/es_UY.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PR\";a:8:{s:8:\"language\";s:5:\"es_PR\";s:7:\"version\";s:6:\"5.4.10\";s:7:\"updated\";s:19:\"2020-04-29 15:36:59\";s:12:\"english_name\";s:21:\"Spanish (Puerto Rico)\";s:11:\"native_name\";s:23:\"Español de Puerto Rico\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.4.10/es_PR.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 04:45:11\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/es_CO.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:6:\"5.2.15\";s:7:\"updated\";s:19:\"2019-03-02 06:35:01\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.2.15/es_GT.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"es\";i:2;s:3:\"spa\";i:3;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2020-08-12 08:38:59\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8-beta/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-06 18:28:40\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-27 18:45:37\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"fa_AF\";a:8:{s:8:\"language\";s:5:\"fa_AF\";s:7:\"version\";s:5:\"5.8.4\";s:7:\"updated\";s:19:\"2021-11-20 16:34:11\";s:12:\"english_name\";s:21:\"Persian (Afghanistan)\";s:11:\"native_name\";s:31:\"(فارسی (افغانستان\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.4/fa_AF.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-22 17:24:14\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 03:59:15\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-02-22 13:54:46\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-01 20:02:47\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:3:\"fur\";a:8:{s:8:\"language\";s:3:\"fur\";s:7:\"version\";s:6:\"4.8.19\";s:7:\"updated\";s:19:\"2018-01-29 17:32:35\";s:12:\"english_name\";s:8:\"Friulian\";s:11:\"native_name\";s:8:\"Friulian\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.19/fur.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"fur\";i:3;s:3:\"fur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-29 22:40:12\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:6:\"4.9.20\";s:7:\"updated\";s:19:\"2018-09-14 12:33:48\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.20/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"ચાલુ રાખવું\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:6:\"4.4.27\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.4.27/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-14 22:20:29\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:6:\"5.4.10\";s:7:\"updated\";s:19:\"2020-11-06 12:34:38\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/5.4.10/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"जारी रखें\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-16 09:39:56\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:3:\"hsb\";a:8:{s:8:\"language\";s:3:\"hsb\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 09:38:59\";s:12:\"english_name\";s:13:\"Upper Sorbian\";s:11:\"native_name\";s:17:\"Hornjoserbšćina\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.9.2/hsb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"hsb\";i:3;s:3:\"hsb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:4:\"Dale\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-03 08:37:09\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-22 09:07:27\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:6:\"4.9.20\";s:7:\"updated\";s:19:\"2018-12-11 10:40:02\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.20/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 08:09:26\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-29 23:58:18\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"次へ\";}}s:5:\"jv_ID\";a:8:{s:8:\"language\";s:5:\"jv_ID\";s:7:\"version\";s:6:\"4.9.20\";s:7:\"updated\";s:19:\"2019-02-16 23:58:56\";s:12:\"english_name\";s:8:\"Javanese\";s:11:\"native_name\";s:9:\"Basa Jawa\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.20/jv_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"jv\";i:2;s:3:\"jav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Nerusaké\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-01-24 08:56:29\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-14 17:35:42\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.9.2/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"kk\";a:8:{s:8:\"language\";s:2:\"kk\";s:7:\"version\";s:6:\"4.9.20\";s:7:\"updated\";s:19:\"2018-07-10 11:35:44\";s:12:\"english_name\";s:6:\"Kazakh\";s:11:\"native_name\";s:19:\"Қазақ тілі\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.20/kk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kk\";i:2;s:3:\"kaz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Жалғастыру\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:6:\"5.2.15\";s:7:\"updated\";s:19:\"2019-06-10 16:18:28\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.2.15/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:2:\"kn\";a:8:{s:8:\"language\";s:2:\"kn\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-23 01:39:33\";s:12:\"english_name\";s:7:\"Kannada\";s:11:\"native_name\";s:15:\"ಕನ್ನಡ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/kn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"kn\";i:2;s:3:\"kan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"ಮುಂದುವರಿಸು\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-01 01:29:44\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:5:\"5.8.4\";s:7:\"updated\";s:19:\"2021-12-07 16:32:30\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.8.4/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-23 12:35:40\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-20 09:46:42\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-17 12:19:10\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:43:32\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 07:29:35\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"Үргэлжлүүлэх\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:6:\"4.9.20\";s:7:\"updated\";s:19:\"2019-11-22 15:32:08\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.9.20/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:5:\"5.5.9\";s:7:\"updated\";s:19:\"2022-03-11 13:52:22\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.5.9/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.2.32\";s:7:\"updated\";s:19:\"2017-12-26 11:57:10\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.2.32/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-25 15:14:25\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-18 17:18:02\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-20 07:46:40\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/5.9.2/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 12:50:43\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 07:20:28\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-03-18 10:59:16\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:6:\"4.8.19\";s:7:\"updated\";s:19:\"2017-08-25 10:03:08\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/4.8.19/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:7:\"Punjabi\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 06:48:20\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.3.28\";s:7:\"updated\";s:19:\"2015-12-02 21:41:29\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.3.28/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-25 08:23:37\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-09 13:52:45\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_AO\";a:8:{s:8:\"language\";s:5:\"pt_AO\";s:7:\"version\";s:5:\"5.8.4\";s:7:\"updated\";s:19:\"2021-11-27 16:28:47\";s:12:\"english_name\";s:19:\"Portuguese (Angola)\";s:11:\"native_name\";s:20:\"Português de Angola\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.4/pt_AO.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:10:\"pt_PT_ao90\";a:8:{s:8:\"language\";s:10:\"pt_PT_ao90\";s:7:\"version\";s:5:\"5.8.4\";s:7:\"updated\";s:19:\"2021-09-09 21:40:55\";s:12:\"english_name\";s:27:\"Portuguese (Portugal, AO90)\";s:11:\"native_name\";s:17:\"Português (AO90)\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/translation/core/5.8.4/pt_PT_ao90.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 16:36:19\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 14:45:05\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:3:\"snd\";a:8:{s:8:\"language\";s:3:\"snd\";s:7:\"version\";s:6:\"5.4.10\";s:7:\"updated\";s:19:\"2020-07-07 01:53:37\";s:12:\"english_name\";s:6:\"Sindhi\";s:11:\"native_name\";s:8:\"سنڌي\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/translation/core/5.4.10/snd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"sd\";i:2;s:3:\"snd\";i:3;s:3:\"snd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"اڳتي هلو\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-23 08:05:13\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:3:\"skr\";a:8:{s:8:\"language\";s:3:\"skr\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-01-24 13:37:43\";s:12:\"english_name\";s:7:\"Saraiki\";s:11:\"native_name\";s:14:\"سرائیکی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.9.2/skr.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"skr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"جاری رکھو\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-02-01 10:20:40\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-29 17:36:48\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"5.8.4\";s:7:\"updated\";s:19:\"2021-08-01 21:21:06\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.8.4/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 05:35:04\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:2:\"sw\";a:8:{s:8:\"language\";s:2:\"sw\";s:7:\"version\";s:6:\"5.3.12\";s:7:\"updated\";s:19:\"2019-10-13 15:35:35\";s:12:\"english_name\";s:7:\"Swahili\";s:11:\"native_name\";s:9:\"Kiswahili\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.3.12/sw.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sw\";i:2;s:3:\"swa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Endelea\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:5:\"ta_LK\";a:8:{s:8:\"language\";s:5:\"ta_LK\";s:7:\"version\";s:6:\"4.2.32\";s:7:\"updated\";s:19:\"2015-12-03 01:07:44\";s:12:\"english_name\";s:17:\"Tamil (Sri Lanka)\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.2.32/ta_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"தொடர்க\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"5.8.4\";s:7:\"updated\";s:19:\"2021-12-28 02:58:38\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.4/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:6:\"4.8.19\";s:7:\"updated\";s:19:\"2017-09-30 09:04:29\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.8.19/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-06 13:13:53\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:6:\"4.9.20\";s:7:\"updated\";s:19:\"2021-07-03 18:41:33\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:16:\"ئۇيغۇرچە\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.9.20/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"5.8.4\";s:7:\"updated\";s:19:\"2022-03-06 15:05:20\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.8.4/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:6:\"5.4.10\";s:7:\"updated\";s:19:\"2020-04-09 11:17:33\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.4.10/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:8:\"5.8-beta\";s:7:\"updated\";s:19:\"2021-02-28 12:02:22\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/translation/core/5.8-beta/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-30 13:50:02\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/5.9.2/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-11 09:46:03\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-14 15:03:38\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:16:\"香港中文版	\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"5.9.2\";s:7:\"updated\";s:19:\"2022-03-18 15:13:38\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/5.9.2/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(137, '_site_transient_timeout_browser_5ab22b5061f9430ba62c6f2c7a11ba02', '1649267861', 'no'),
(138, '_site_transient_browser_5ab22b5061f9430ba62c6f2c7a11ba02', 'a:10:{s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"98.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:32:\"https://www.mozilla.org/firefox/\";s:7:\"img_src\";s:44:\"http://s.w.org/images/browsers/firefox.png?1\";s:11:\"img_src_ssl\";s:45:\"https://s.w.org/images/browsers/firefox.png?1\";s:15:\"current_version\";s:2:\"56\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(139, '_site_transient_timeout_php_check_bbe0b0d516d9a70a0e1aa1834ea07179', '1649267861', 'no'),
(140, '_site_transient_php_check_bbe0b0d516d9a70a0e1aa1834ea07179', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(142, '_site_transient_timeout_community-events-1aecf33ab8525ff212ebdffbb438372e', '1648706262', 'no'),
(143, '_site_transient_community-events-1aecf33ab8525ff212ebdffbb438372e', 'a:4:{s:9:\"sandboxed\";b:0;s:5:\"error\";N;s:8:\"location\";a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}s:6:\"events\";a:1:{i:0;a:10:{s:4:\"type\";s:8:\"wordcamp\";s:5:\"title\";s:24:\"WordCamp Vienna, Austria\";s:3:\"url\";s:33:\"https://vienna.wordcamp.org/2022/\";s:6:\"meetup\";N;s:10:\"meetup_url\";N;s:4:\"date\";s:19:\"2022-04-23 08:00:00\";s:8:\"end_date\";s:19:\"2022-04-23 08:00:00\";s:20:\"start_unix_timestamp\";i:1650693600;s:18:\"end_unix_timestamp\";i:1650693600;s:8:\"location\";a:4:{s:8:\"location\";s:15:\"Vienna, Austria\";s:7:\"country\";s:2:\"AT\";s:8:\"latitude\";d:48.2129431;s:9:\"longitude\";d:16.3608799;}}}}', 'no'),
(144, 'can_compress_scripts', '1', 'no'),
(145, '_transient_timeout_feed_a2a8f6ff8f129a81518b9f747f983e41', '1648706263', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(146, '_transient_feed_a2a8f6ff8f129a81518b9f747f983e41', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:49:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"Blog | WordPress.org Polska\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:24:\"https://pl.wordpress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 27 Nov 2019 09:42:44 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"pl-PL\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://wordpress.org/?v=6.0-alpha-52936\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:10:{i:0;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:42:\"Dołącz do grupy tłumaczeniowej na Slack\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:76:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:85:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 31 Jul 2018 07:46:24 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"Polskie tłumaczenie i witryna\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=2025\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:429:\"Autorem tego wpisu jest Magdalena Stanek Tłumaczu porozmawiajmy! Podczas tegorocznego Contributor Day na WordCampie w Poznaniu w grupie tłumaczeniowej zebrała się zaangażowana ekipa, która stwierdziła, że fajnie by było tłumaczyć razem przez cały rok, a nie tylko podczas Contributor Day. W związku z tym założyliśmy kanał Slack dla polskich tłumaczy, gdzie będziemy prowadzić cotygodniowe spotkania [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:19:\"Waclaw Jacek (a11n)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1047:\"\n<p><em>Autorem tego wpisu jest Magdalena Stanek</em></p>\n\n\n\n<p>Tłumaczu porozmawiajmy!</p>\n\n\n\n<p>Podczas tegorocznego Contributor Day na WordCampie w Poznaniu w grupie tłumaczeniowej zebrała się zaangażowana ekipa, która stwierdziła, że fajnie by było tłumaczyć razem przez cały rok, a nie tylko podczas Contributor Day.</p>\n\n\n\n<p>W związku z tym założyliśmy kanał Slack dla polskich tłumaczy, gdzie będziemy prowadzić cotygodniowe spotkania w każdą środę o 20:00. Celem spotkań jest wspólne motywowanie się do  poświęcenia trochę więcej czasu na tłumaczenia, rozwiewanie wątpliwości, dyskutowanie na temat różnych spraw związanych z tłumaczeniami i i oczywiście pomaganie sobie nawzajem. </p>\n\n\n\n<p>Możesz się zalogować tutaj <a href=\"https://wordpresspopolsku.slack.com/signup\">https://wordpresspopolsku.slack.com/signup</a> (do logowania najlepiej użyć swoich danych z wordpress.org).</p>\n\n\n\n<p>Mamy nadzieję, że inicjatywa Cię zainteresuje i dołączysz do nas.<br>\nDo zobaczenia na Slacku!</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"8\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"WordCamp Łódź 2019\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:64:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 17 Oct 2019 11:30:37 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:10:\"Wydarzenia\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"wordcamp\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=3981\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:454:\"Prowadzisz stronę opartą na WordPressie? Jesteś deweloperem lub prowadzisz działalność opartą o usługi związane z WordPressem? A może jesteś blogerem lub zajmujesz się e-marketingiem? Niezależnie od stopnia znajomości i roli jaką odgrywa WordPress w Twoim życiu, konferencja WordCamp Łódź 2019 skierowana jest właśnie do Ciebie. WordCamp to ogólnopolska konferencja poświęcona pośrednio i bezpośrednio WordPressowi. To [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Katarzyna Gajewska\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3116:\"\n<p>Prowadzisz stronę opartą na WordPressie? Jesteś deweloperem lub prowadzisz działalność opartą o usługi związane z WordPressem? A może jesteś blogerem lub zajmujesz się e-marketingiem? Niezależnie od stopnia znajomości i roli jaką odgrywa WordPress w Twoim życiu, konferencja <strong><a href=\"https://2019.lodz.wordcamp.org/\" target=\"_blank\" rel=\"noreferrer noopener\" aria-label=\"WordCamp Łódź 2019 (opens in a new tab)\">WordCamp Łódź 2019</a></strong> skierowana jest właśnie do Ciebie.<br><br>WordCamp to ogólnopolska konferencja poświęcona pośrednio i bezpośrednio WordPressowi. To doskonała okazja na poszerzenie swojej wiedzy i zdobycie nowych kontaktów, które mogą zaowocować nowymi wyzwaniami w życiu zawodowym. To też doskonała okazja na podzielenie się swoją wiedzą i wymianę doświadczeń z innymi miłośnikami WordPressa. <br><br>WordCamp to trzy dni inspirujących prelekcji prowadzonych przez niesamowitych specjalistów. To warsztaty, dzięki którym zdobędziecie nowe umiejętności. To także Contributor Day &#8211; dzień stworzony specjalnie dla Was &#8211; twórców, deweloperów, tłumaczy, blogerów, projektantów. Tego dnia to Wy możecie podarować swoją pomoc i zaangażowanie w rozwój WordPressa.<br><br>To także spotkania ze sponsorami, dzięki którym WordCamp nie mógłby się odbyć. To oni i ich pomoc sprawia, że konferencja jest dostępna dla tak wielu osób w bardzo przystępnej cenie.<br>Pakiety sponsorskie dostosowane są do różnych potrzeb oraz możliwości. Sponsorami są zarówno duże, międzynarodowe marki, jak i lokalne biznesy działające w naszym regionie. Jeśli chcesz znaleźć się w zacnym gronie sponsorów tegorocznego WordCampa, wybierz odpowiedni pakiet pod tym adresem: <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://2019.lodz.wordcamp.org/zostan-sponsorem-wordcamp-lodz-2019/?fbclid=IwAR0COkUojiqsrmCzYWLHvH0TSJ4cA3t8g_KkqzvT4wDT9Il_LH6cweKVTRo\">https://2019.lodz.wordcamp.org/zostan-sponsorem-wordcamp-lodz-2019/</a><br><br>WordCamp to również networking, czyli wspólna zabawa w trakcie Middle Party. <br><br>Tegoroczny WordCamp odbędzie się w Hotelu Ambasador Premium w Łodzi przy ulicy Kilińskiego 145. Dla Waszej wygody odbędzie się tutaj zarówno pierwszy dzień &#8211; Contributor Day oraz warsztaty, jak i dwa dni konferencyjne poświęcone prezentacjom. Na Middle Party też zapraszamy do Hotelu Ambasador Premium.<br><br>Bilety możecie kupić na naszej stronie internetowej: <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://l.facebook.com/l.php?u=https%3A%2F%2F2019.lodz.wordcamp.org%2Fbilety%2F%3Ffbclid%3DIwAR3mM-avOgA5H501q0GD-Y1_VccHbsAkssRqSiL_-cVvTacnPeuDt-fpHq4&amp;h=AT0XqbIJMRrLiuvJ2dnl3grccZ5OTXPpgmZ7xc5ZdxRe7bKjUN28aGLo6T4YeRHgDnlj2YgcRtaEMkfTJHDGtFS5H_TVjTb998shqjeQS-8QAd-9ZBOK1ko--FQMcGz38J4O41U\">https://2019.lodz.wordcamp.org/bilety/</a><br><br>Przy rejestracji nie zapomnijcie wypełnić specjalnego pola z rozmiarem. Na każdego czeka oficjalny, wyjątkowy Swag! <br><br>Do zobaczenia 22 listopada w Hotelu Ambasador Premium w Łodzi! </p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:60:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"12\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.9.7 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 07 Jul 2018 14:18:34 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1945\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:463:\"WordPress 4.9.7 jest już dostępny. To wydanie poprawia bezpieczeństwo wszystkich wersji systemu począwszy od 3.7. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. WordPress w wersji 4.9.6 i wcześniejszych zawiera błąd związany z obsługą mediów, który może pozwolić użytkownikom z pewnymi prawami dostępu na podjęcie próby usunięcia plików spoza katalogu uploads. Dziękujemy Slavco za zgłoszenie błędu, a także Mattowi [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:4564:\"<p>WordPress 4.9.7 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> wszystkich wersji systemu począwszy od 3.7. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1945\"></span></p>\n<p>WordPress w wersji 4.9.6 i wcześniejszych zawiera błąd związany z obsługą mediów, który może pozwolić użytkownikom z pewnymi prawami dostępu na podjęcie próby usunięcia plików spoza katalogu <em>uploads</em>.</p>\n<p>Dziękujemy <a href=\"https://hackerone.com/slavco\">Slavco</a> za zgłoszenie błędu, a także <a href=\"https://www.wordfence.com/\">Mattowi Barry&#8217;emu</a> za zgłoszenie powiązanych z tą kwestią problemów.</p>\n<p>W WordPressie 4.9.7 naprawiono także 17 innych problemów, w szczególności:</p>\n<ul>\n<li>Taksonomie: Ulepszenie obsługi cache dla zapytań dotyczących terminów.</li>\n<li>Wpisy i inne Typy Treści: Usuwanie ciasteczka dotyczącego hasła dla podstrony, gdy użytkownik wyloguje się.</li>\n<li>Widgety: Dopuszczenie używania podstawowych znaczników HTML w opisach paneli bocznych w sekcji Widgety panelu administracyjnego.</li>\n<li>Kokpit wydarzeń społecznościowych: Zawsze pokazuj najbliższe spotkanie WordCamp, jeśli takowe się zbliża &#8211; nawet, gdy wcześniej planowane są spotkania w dalszych lokalizacjach.</li>\n<li>Prywatność: Upewnienie się, że domyślna treść polityki prywatności nie spowoduje wystąpienia krytycznego błędu podczas czyszczenia reguł przekształcania adresów poza kontekstem administracyjnym.</li>\n</ul>\n<p>W dokumentacji Codex znajdziesz <a href=\"https://codex.wordpress.org/Version_4.9.7\">więcej informacji na temat wszystkich kwestii rozwiązanych w wersji 4.9.7</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.7</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Wcześniej zaplanowane wydanie 4.9.7 będzie od teraz nazywane 4.9.8 i zostanie <a href=\"https://make.wordpress.org/core/2018/07/04/dev-chat-summary-july-4th-4-9-7-week-7/\">opublikowane zgodnie z planem</a>.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.7:</p>\n<p><a href=\"https://profiles.wordpress.org/1naveengiri/\">1naveengiri</a>, <a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/abdullahramzan/\">abdullahramzan</a>, <a href=\"https://profiles.wordpress.org/alejandroxlopez/\">alejandroxlopez</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/aryamaaru/\">Arun</a>, <a href=\"https://profiles.wordpress.org/birgire/\">Birgir Erlendsson (birgire)</a>, <a href=\"https://profiles.wordpress.org/bjornw/\">BjornW</a>, <a href=\"https://profiles.wordpress.org/boonebgorges/\">Boone Gorges</a>, <a href=\"https://profiles.wordpress.org/kraftbj/\">Brandon Kraft</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/dlh/\">David Herrera</a>, <a href=\"https://profiles.wordpress.org/flixos90/\">Felix Arntz</a>, <a href=\"https://profiles.wordpress.org/garetharnold/\">Gareth</a>, <a href=\"https://profiles.wordpress.org/iandunn/\">Ian Dunn</a>, <a href=\"https://profiles.wordpress.org/ianbelanger/\">ibelanger</a>, <a href=\"https://profiles.wordpress.org/johnbillion/\">John Blackbourn</a>, <a href=\"https://profiles.wordpress.org/desrosj/\">Jonathan Desrosiers</a>, <a href=\"https://profiles.wordpress.org/joyously/\">Joy</a>, <a href=\"https://profiles.wordpress.org/khaihong/\">khaihong</a>, <a href=\"https://profiles.wordpress.org/lbenicio/\">lbenicio</a>, <a href=\"https://profiles.wordpress.org/leanderiversen/\">Leander Iversen</a>, <a href=\"https://profiles.wordpress.org/mermel/\">mermel</a>, <a href=\"https://profiles.wordpress.org/metalandcoffee/\">metalandcoffee</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Migrated to @jeffpaul</a>, <a href=\"https://profiles.wordpress.org/palmiak/\">palmiak</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/skoldin/\">skoldin</a>, <a href=\"https://profiles.wordpress.org/subrataemfluence/\">Subrata Sarkar</a>, <a href=\"https://profiles.wordpress.org/itowhid06/\">Towhidul Islam</a>, <a href=\"https://profiles.wordpress.org/warmlaundry/\">warmlaundry</a> oraz <a href=\"https://profiles.wordpress.org/yuriv/\">YuriV</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:43:\"Program WordCamp Poznań 2018 już tu jest!\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:86:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 26 May 2018 08:28:57 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:10:\"Wydarzenia\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"wordcamp\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1817\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:395:\"Pewnie większość z was już wie, że w zeszłym tygodniu opublikowaliśmy program tegorocznego WordCampa, który odbędzie się w dniach 6-8 lipca w Poznaniu. WordCamp Poznań 2018 zbliża się dużymi krokami! Jeśli nie masz jeszcze biletu, to nie zastanawiaj się już dłużej, tylko kup bilet na najważniejsze WordPressowe wydarzenie 2018 roku! Zapraszamy do zapoznania się z [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Katarzyna Gajewska\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2455:\"<p>Pewnie większość z was już wie, że w zeszłym tygodniu opublikowaliśmy program tegorocznego WordCampa, który odbędzie się w dniach <strong>6-8 lipca w Poznaniu</strong>.</p>\n<p>WordCamp Poznań 2018 zbliża się dużymi krokami! Jeśli nie masz jeszcze biletu, to nie zastanawiaj się już dłużej, tylko <a href=\"https://2018.poznan.wordcamp.org/bilety/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>kup bilet</strong></a> na najważniejsze WordPressowe wydarzenie 2018 roku! Zapraszamy do zapoznania się z <a href=\"https://2018.poznan.wordcamp.org/program/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>pełnym programem konferencji</strong></a> i do zapisywania się na warsztaty oraz Contributor Day.</p>\n<p>Startujemy 6 lipca! Pierwszego dnia konferencji po prostu nie można przegapić. Zaczniemy od bardziej praktycznych wyzwań. Każdy uczestnik będzie miał możliwość wzięcia udziału w ciekawych warsztatach, które będą świetną okazją, aby zdobyć nowe umiejętności i poznać ciekawych ludzi. W tym roku zaserwujemy aż 6 różnych warsztatów. Warto zapoznać się z tematami i już dziś zarezerwować sobie miejsce. Równolegle do warsztatów będzie odbywał się <a href=\"https://2018.poznan.wordcamp.org/czym-jest-contributor-day/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>Contributor Day</strong></a>, podczas którego będzie można dołączyć do innych entuzjastów i popracować nad kodem, tłumaczeniem lub zająć się odpowiadaniem na pytania na forum wsparcia. Z pewnością każdy znajdzie tutaj coś dla siebie!</p>\n<p>Kolejne dwa dni konferencji będą wypełnione ciekawymi prelekcjami, na których nie może cię zabraknąć! Tematy są podzielone na dwie ścieżki: ogólną i techniczną. Ścieżkę ogólną polecamy wszystkim, którzy są zainteresowani tematami związanymi z wykorzystaniem WordPressa, blogowaniem i innymi zagadnieniami. Będziecie mieli okazję dowiedzieć się więcej o dostępności, pracy zdalnej, wycenie projektów czy analityce. Z kolei ścieżkę techniczną polecamy uczestnikom poszukującym bardziej specjalistycznej wiedzy. Będzie to świetna okazja, żeby posłuchać prelekcji na temat backupu, automatyzacji zadań czy zabezpieczenia WordPressa. Tematyka zarówno ścieżki ogólnej, jak i technicznej, jest bardzo zróżnicowana. Bez wątpienia każdy znajdzie coś, co go zainteresuje!</p>\n<p>Do zobaczenia w Poznaniu!</p>\n<p>&nbsp;</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"WordPress 4.9.4 – Wydanie poprawiające ważny błąd\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:93:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Feb 2018 18:25:48 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1539\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:489:\"WordPress 4.9.4 jest już dostępny. To wydanie rozwiązuje istotny problem wprowadzony w wersji 4.9.3, który powodował, że strony obsługujące automatyczne aktualizacje nie będą mogły ich przeprowadzić. Wymagane jest ręczne zaktualizowanie WordPressa do wersji 4.9.4 przez Ciebie lub Twojego dostawcę hostingu. Cztery lata temu, w wydaniu 3.7 &#8222;Basie&#8221; WordPressa wprowadziliśmy możliwość automatycznej aktualizacji systemu, dzięki czemu strony stały [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2631:\"<p>WordPress 4.9.4 jest już dostępny.</p>\n<p>To wydanie rozwiązuje istotny problem wprowadzony w wersji 4.9.3, który powodował, że strony obsługujące automatyczne aktualizacje nie będą mogły ich przeprowadzić. <strong><span style=\"text-decoration: underline\">Wymagane jest ręczne zaktualizowanie WordPressa</span> do wersji 4.9.4 przez Ciebie lub Twojego dostawcę hostingu.</strong></p>\n<p><span id=\"more-1539\"></span></p>\n<p>Cztery lata temu, w wydaniu <a href=\"https://wordpress.org/news/2013/10/basie/\">3.7 &#8222;Basie&#8221; WordPressa</a> wprowadziliśmy możliwość automatycznej aktualizacji systemu, dzięki czemu strony stały się bezpieczniejsze i mniej awaryjne &#8211; nawet, jeśli samodzielnie nie miałeś możliwości ich aktualizować. Przez te 4 lata mechanizm ten pomógł milionom witryn, aktualizując je do bieżących wersji i naprawiając bardzo sporadyczne usterki. Niestety we wczorajszym <a href=\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/\">wydaniu 4.9.3</a> znalazł się ważny błąd, który został wykryty dopiero po upublicznieniu nowej wersji systemu. Błąd ten powoduje, że WordPress nie zaktualizuje się automatycznie do wersji 4.9.4, co oznacza, że aktualizację taką trzeba przeprowadzić ręcznie z poziomu panelu administracyjnego lub z pomocą dostawcy serwera hostingowego.</p>\n<p><strong>Aby przeprowadzić ręczną aktualizację, udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Dopóki tego nie wykonasz, WordPress <span style=\"text-decoration: underline\">nie będzie aktualizował się automatycznie do kolejnych wersji</span>. Zalecamy, by zrobić to natychmiast.</strong></p>\n<p>Dostawcy hostingu, którzy aktualizują automatycznie WordPressa w imieniu swoich klientów, mogą przystąpić do aktualizacji w standardowym trybie. Będziemy ściśle współpracować z innymi dostawcami hostingu, by jak najwięcej ich klientów otrzymało tą aktualizację.</p>\n<p><a href=\"https://make.wordpress.org/core/2018/02/06/wordpress-4-9-4-release-the-technical-details/\">Więcej szczegółów technicznych opublikowaliśmy na naszym blogu o tworzeniu rdzenia WordPressa</a>. Pełna lista zmian dostępna jest w <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.9.4&amp;group=component\">spisie zamkniętych wątków</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.4</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:89:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"WordPress 4.9.3 – Wydanie poprawiające błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:79:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:87:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Feb 2018 10:50:35 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1536\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:450:\"WordPress 4.9.3 jest już dostępny. To wydanie zawiera poprawki 34 błędów obecnych w wersji 4.9 WordPressa, w tym dotyczących zestawów zmian na ekranie Personalizacji, widgetów, edytora wizualnego i kompatybilności z PHP 7.2.  Spis wszystkich zmian znajdziesz w liście zamkniętych wątków oraz liście przeprowadzonych zmian. Pobierz WordPressa 4.9.3 lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3596:\"<p>WordPress 4.9.3 jest już dostępny.</p>\n<p>To wydanie zawiera poprawki 34 błędów obecnych w wersji 4.9 WordPressa, w tym dotyczących zestawów zmian na ekranie Personalizacji, widgetów, edytora wizualnego i kompatybilności z PHP 7.2.  Spis wszystkich zmian znajdziesz<span style=\"line-height: 1.5\"> w <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.9.3&amp;group=component\">liście zamkniętych wątków</a> oraz <a href=\"https://core.trac.wordpress.org/log/branches/4.9?rev=42630&amp;stop_rev=42521\">liście przeprowadzonych zmian</a>.</span></p>\n<p><span id=\"more-1536\"></span></p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.3</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.3:</p>\n<p><a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/abdullahramzan/\">abdullahramzan</a>, <a href=\"https://profiles.wordpress.org/adamsilverstein/\">Adam Silverstein</a>, <a href=\"https://profiles.wordpress.org/afercia/\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/andreiglingeanu/\">andreiglingeanu</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/bpayton/\">Brandon Payton</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/coleh/\">coleh</a>, <a href=\"https://profiles.wordpress.org/darko-a7/\">Darko A7</a>, <a href=\"https://profiles.wordpress.org/desertsnowman/\">David Cramer</a>, <a href=\"https://profiles.wordpress.org/dlh/\">David Herrera</a>, <a href=\"https://profiles.wordpress.org/dd32/\">Dion Hulse</a>, <a href=\"https://profiles.wordpress.org/flixos90/\">Felix Arntz</a>, <a href=\"https://profiles.wordpress.org/frank-klein/\">Frank Klein</a>, <a href=\"https://profiles.wordpress.org/pento/\">Gary Pendergast</a>, <a href=\"https://profiles.wordpress.org/audrasjb/\">Jb Audras</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Jeffrey Paul</a>, <a href=\"https://profiles.wordpress.org/lizkarkoski/\">lizkarkoski</a>, <a href=\"https://profiles.wordpress.org/clorith/\">Marius L. J.</a>, <a href=\"https://profiles.wordpress.org/mattyrob/\">mattyrob</a>, <a href=\"https://profiles.wordpress.org/munyagu/\">munyagu</a>, <a href=\"https://profiles.wordpress.org/ndavison/\">ndavison</a>, <a href=\"https://profiles.wordpress.org/nickmomrik/\">Nick Momrik</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc/\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/rachelbaker/\">Rachel Baker</a>, <a href=\"https://profiles.wordpress.org/rishishah/\">rishishah</a>, <a href=\"https://profiles.wordpress.org/othellobloke/\">Ryan Paul</a>, <a href=\"https://profiles.wordpress.org/sasiddiqui/\">Sami Ahmed Siddiqui</a>, <a href=\"https://profiles.wordpress.org/sayedwp/\">Sayed Taqui</a>, <a href=\"https://profiles.wordpress.org/seanchayes/\">Sean Hayes</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/shooper/\">Shawn Hooper</a>, <a href=\"https://profiles.wordpress.org/netweb/\">Stephen Edgar</a>, <a href=\"https://profiles.wordpress.org/manikmist09/\">Sultan Nasir Uddin</a>, <a href=\"https://profiles.wordpress.org/tigertech/\">tigertech</a> oraz <a href=\"https://profiles.wordpress.org/westonruter/\">Weston Ruter</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.9.2 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 17 Jan 2018 11:06:38 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1512\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:467:\"WordPress 4.9.2 jest już dostępny. To wydanie poprawia bezpieczeństwo we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. Wykryto podatność na atak XSS w plikach Flash biblioteki MediaElement, która jest dołączana do WordPressa w celu zapewnienia kompatybilności ze starszym oprogramowaniem. Ponieważ pliki te nie są już potrzebne w zdecydowanej większości przypadków, zostały one usunięte [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:4168:\"<p>WordPress 4.9.2 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1512\"></span></p>\n<p>Wykryto podatność na atak XSS w plikach Flash biblioteki MediaElement, która jest dołączana do WordPressa w celu zapewnienia kompatybilności ze starszym oprogramowaniem. Ponieważ pliki te nie są już potrzebne w zdecydowanej większości przypadków, zostały one usunięte z WordPressa.</p>\n<p>Biblioteka MediaElement została już udostępniona w nowej wersji, która naprawa problem. W repozytorium wtyczek WordPressa znajduje się nowa <a href=\"https://wordpress.org/plugins/mediaelement-flash-fallbacks/\">wtyczka, przywracająca obsługę biblioteki MediaElement z poprawionymi plikami</a>.</p>\n<p>Dziękujemy zgłaszającym (<a href=\"https://opnsec.com\">Enguerran Gillier</a> i <a href=\"https://widiz.com/\">Widiz</a>) za <a href=\"https://make.wordpress.org/core/handbook/reporting-security-vulnerabilities/\">odpowiedzialne ujawnienie</a> problemów z bezpieczeństwem.</p>\n<p>W WordPressie 4.9.2 rozwiązano także 21 innych problemów, w tym:</p>\n<ul>\n<li>naprawiono błędy JavaScript, które uniemożliwiały zapisywanie wpisów w Firefoxie,</li>\n<li>przywrócono wcześniejsze, niezależne od taksonomii działanie <code>get_category_link()</code> i <code>category_description()</code>,</li>\n<li>od teraz zmiana motywu spowoduje podjęcie próby przywrócenia poprzednich przypisań widgetów &#8211; nawet, jeśli w ostatnio używanym motywie nie były dostępne żadne obszary na widgety.</li>\n</ul>\n<p>W dokumentacji Codex znajdziesz <a href=\"https://codex.wordpress.org/Version_4.9.2\">więcej informacji na temat wszystkich rozwiązanych problemów w wersji 4.9.2</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.2</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.2:</p>\n<p><a href=\"https://profiles.wordpress.org/0x6f0/\">0x6f0</a>, <a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/afercia/\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/aduth/\">Andrew Duthie</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/blobfolio/\">Blobfolio</a>, <a href=\"https://profiles.wordpress.org/boonebgorges/\">Boone Gorges</a>, <a href=\"https://profiles.wordpress.org/icaleb/\">Caleb Burks</a>, <a href=\"https://profiles.wordpress.org/poena/\">Carolina Nymark</a>, <a href=\"https://profiles.wordpress.org/chasewg/\">chasewg</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/dd32/\">Dion Hulse</a>, <a href=\"https://profiles.wordpress.org/hardik-amipara/\">Hardik Amipara</a>, <a href=\"https://profiles.wordpress.org/ionvv/\">ionvv</a>, <a href=\"https://profiles.wordpress.org/jaswrks/\">Jason Caldwell</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Jeffrey Paul</a>, <a href=\"https://profiles.wordpress.org/jeremyfelt/\">Jeremy Felt</a>, <a href=\"https://profiles.wordpress.org/joemcgill/\">Joe McGill</a>, <a href=\"https://profiles.wordpress.org/johnschulz/\">johnschulz</a>, <a href=\"https://profiles.wordpress.org/juiiee8487/\">Juhi Patel</a>, <a href=\"https://profiles.wordpress.org/obenland/\">Konstantin Obenland</a>, <a href=\"https://profiles.wordpress.org/markjaquith/\">Mark Jaquith</a>, <a href=\"https://profiles.wordpress.org/rabmalin/\">Nilambar Sharma</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc/\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/rachelbaker/\">Rachel Baker</a>, <a href=\"https://profiles.wordpress.org/rinkuyadav999/\">Rinku Y</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a> oraz <a href=\"https://profiles.wordpress.org/westonruter/\">Weston Ruter</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"WordPress 4.8.3 – Wydanie poprawiające bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:88:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 31 Oct 2017 11:26:39 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1289\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:475:\"WordPress 4.8.3 jest już dostępny. To wydanie poprawia bezpieczeństwo we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. WordPress w wersji 4.8.2 i wcześniejszych jest podatny na problem z $wpdb-&#62;prepare(), który może prowadzić do tworzenia nieoczekiwanych i niebezpiecznych zapytań, umożliwiających potencjalny atak metodą SQL injection (SQLi). Rdzeń systemu nie jest bezpośrednio podatny na ten [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1522:\"<p>WordPress 4.8.3 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1289\"></span></p>\n<p>WordPress w wersji 4.8.2 i wcześniejszych jest podatny na problem z <code>$wpdb-&gt;prepare()</code>, który może prowadzić do tworzenia nieoczekiwanych i niebezpiecznych zapytań, umożliwiających potencjalny atak metodą SQL injection (SQLi). Rdzeń systemu nie jest bezpośrednio podatny na ten problem, ale dodaliśmy dodatkowe zabezpieczenia, by wtyczki i motywy nie mogły go przypadkowo powodować. Problem zgłosił <a href=\"https://twitter.com/ircmaxell\">Anthony Ferrara</a>.</p>\n<p>To wydanie WordPressa zmienia zachowanie funkcji <code>esc_sql()</code>. Różnica nie będzie istotna dla większości programistów. Zachęcamy do <a href=\"https://make.wordpress.org/core/2017/10/31/changed-behaviour-of-esc_sql-in-wordpress-4-8-3/\">przeczytania informacji dla deweloperów</a>.</p>\n<p>Dziękujemy zgłaszającemu za <a href=\"https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/\">odpowiedzialne ujawnienie</a> problemu z bezpieczeństwem.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.8.3</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:93:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 4.9 Beta 2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:66:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 12 Oct 2017 07:03:53 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Wersje testowe\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1235\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:433:\"WordPress 4.9 Beta 2 jest już dostępny! Oprogramowanie jest wciąż w fazie tworzenia, dlatego nie zalecamy jego używania w witrynie produkcyjnej. Zastanów się nad środowiskiem testowym i tam sprawdzaj do woli. Aby przetestować WordPress 4.9, wypróbuj wtyczkę WordPress Beta Tester (regularnie aktualizuje one do  &#8222;krawych nocnych wydań&#8221;) albo pobierz wersję beta (zip). Więcej informacji na temat [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Marcin Pietrzak\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1781:\"<p>WordPress 4.9 Beta 2 jest już dostępny!</p>\n<p><strong>Oprogramowanie jest wciąż w fazie tworzenia</strong>, dlatego nie zalecamy jego używania w witrynie produkcyjnej. Zastanów się nad środowiskiem testowym i tam sprawdzaj do woli. Aby przetestować WordPress 4.9, wypróbuj wtyczkę <a href=\"https://pl.wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> (regularnie aktualizuje one do  &#8222;krawych nocnych wydań&#8221;) albo <a href=\"https://wordpress.org/wordpress-4.9-beta2.zip\">pobierz wersję beta</a> (zip).</p>\n<p>Więcej informacji na temat tego, co nowego w wersji 4.9, znajdziesz w blogu we wpisie <a href=\"https://wordpress.org/news/2017/10/wordpress-4-9-beta-1/\">Beta 1</a> (po angielsku). Od tego czasu dokonaliśmy <a href=\"https://core.trac.wordpress.org/log/trunk/?action=stop_on_copy&amp;mode=stop_on_copy&amp;rev=41846&amp;stop_rev=41777&amp;limit=100&amp;sfp_email=&amp;sfph_mail=\">70 zmian</a> w wersji Beta 2.</p>\n<p><a href=\"https://translate.wordpress.org/locale/pl/default/wp/dev\">Pomóż nam przetłumaczyć WordPress na język polski</a>!</p>\n<p><strong>Jeśli widzisz błąd</strong>, napisz wiadomość na forum <a href=\"https://wordpress.org/support/forum/alphabeta\">Alpha/Beta</a>. Jeżeli coś nie działa, to chcielibyśm się tego dowiedzieć właśnie do ciebie! Jeśli czujesz się na siłach, żeby napisać raport zawierający opis jak powtórzyć błąd to  skorzystaj z serwisu <a href=\"https://make.wordpress.org/core/reports/\">WordPress Trac</a>. Na nim też znajdziesz <a href=\"https://core.trac.wordpress.org/tickets/major\">listę znanych błędów</a>.</p>\n<p><em>Przetestujmy razem:</em><br />\n<em> edytowanie kodu, przełączniki tematyczne,</em><br />\n<em> widgety, harmonogramowanie.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:62:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.8.2 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 22 Sep 2017 11:37:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1213\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:476:\"WordPress 4.8.2 jest już dostępny. Wersja poprawia bezpieczeństwo wszystkich poprzednich wersji i zdecydowanie zachęcamy do natychmiastowej aktualizacji witryn. WordPress w wersji 4.8.1 i starsze mają następujące problemy z bezpieczeństwem: $wpdb-&#62; prepare() mogło tworzyć nieoczekiwane i niebezpieczne zapytania prowadzące do potencjalnego wstrzyknięcia kod SQL (SQLi). Core WordPressa nie jest bezpośrednio narażony na ten problem, ale poprawiono [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Marcin Pietrzak\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3051:\"<p>WordPress 4.8.2 jest już dostępny. Wersja <strong>poprawia bezpieczeństwo</strong> wszystkich poprzednich wersji i zdecydowanie zachęcamy do natychmiastowej aktualizacji witryn.</p>\n<p>WordPress w wersji 4.8.1 i starsze mają następujące problemy z bezpieczeństwem:</p>\n<ol>\n<li><strong>$wpdb-&gt; prepare()</strong> mogło tworzyć nieoczekiwane i niebezpieczne zapytania prowadzące do potencjalnego wstrzyknięcia kod SQL (SQLi). Core WordPressa nie jest bezpośrednio narażony na ten problem, ale poprawiono proces tworzenia zapytań aby zapobiegać podatności we wtyczkach i motywach. Zgłoszone przez <a href=\"https://hackerone.com/slavco\">Slavco</a></li>\n<li>Wykryto podatność na cross-site scripting (XSS) w używaniu oEmbed. Zgłoszone przez xknown zespołu ds. Zabezpieczeń WordPress.</li>\n<li>W edytorze wizualnym wykryto lukę w zabezpieczeniach skryptów przed cross-site scripting (XSS) Zgłoszone przez <a href=\"https://twitter.com/brutelogic\">Rodolfo Assis (@brutelogic)</a> Sucuri Security.</li>\n<li>W kodzie do rozpakowywania wykryto lukę w zabezpieczeniach ścieżki do pliku. Zgłoszone przez <a href=\"https://hackerone.com/noxrnet\">Alex Chapman (noxrnet)</a>.</li>\n<li>W edytorze wtyczek wykryto luka w zabezpieczeniach cross-site scripting (XSS). Zgłoszone przez 陈瑞琦 (Chen Ruiqi).</li>\n<li>Na ekranie użytkownika i terminach edycji zostały wykryte otwarte przekierowanie. Zgłoszone przez <a href=\"https://hackerone.com/ysx\">Yasin Soliman (ysx)</a>.</li>\n<li>Odkryto lukę w zabezpieczeniach ścieżki na ekranie personalizacji witryny. Zgłoszone przez Weston Ruter z zespołu ds. Bezpieczeństwa WordPress.</li>\n<li>Wykryto podatność na cross-site scripting (XSS)  w nazwach szablonów. Zgłoszone przez <a href=\"https://hackerone.com/sikic\">Luka (sikic)</a>.</li>\n<li>Wykryto podatność na cross-site scripting (XSS) w linkach modalnych. Zgłoszone przez <a href=\"https://hackerone.com/qasuar\">Anas Roubi (qasuar)</a>.</li>\n</ol>\n<p>Dziękujemy zgłaszającym za praktykowanie <a href=\"https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/\">odpowiedzialnego ujawnienia (en)</a>.</p>\n<p>Oprócz powyższych kwestii związanych z bezpieczeństwem, WordPress 4.8.2 zawiera 6 poprawek utrzymaniowych serii 4.8. Więcej informacji można znaleźć w <a href=\"https://codex.wordpress.org/Version_4.8.2\">notce wydania wersji (en)</a> oraz na <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.8.2&amp;group=component&amp;col=id&amp;col=summary&amp;col=component&amp;col=status&amp;col=owner&amp;col=type&amp;col=priority&amp;col=keywords&amp;order=priority\">liście zmian</a>.</p>\n<p><a href=\"https://pl.wordpress.org/wordpress-4.8.2-pl_PL.zip\">Pobierz WordPress 4.8.2</a> lub przejdź do Panel → Aktualizacje i kliknij przycisk &#8222;Aktualizuj teraz&#8221;. Strony obsługujące automatyczne aktualizacje w tle już zaczynają aktualizować się do wersji 4.8.2.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do wydania 4.8.2.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:35:\"https://pl.wordpress.org/news/feed/\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"\n	hourly	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"\n	1	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:8:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Wed, 30 Mar 2022 17:57:42 GMT\";s:12:\"content-type\";s:34:\"application/rss+xml; charset=UTF-8\";s:6:\"x-olaf\";s:3:\"⛄\";s:13:\"last-modified\";s:29:\"Mon, 21 Mar 2022 08:06:56 GMT\";s:4:\"link\";s:61:\"<https://pl.wordpress.org/wp-json/>; rel=\"https://api.w.org/\"\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:4:\"x-nc\";s:9:\"HIT ord 2\";}}s:5:\"build\";s:14:\"20211220193300\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(147, '_transient_timeout_feed_mod_a2a8f6ff8f129a81518b9f747f983e41', '1648706263', 'no'),
(148, '_transient_feed_mod_a2a8f6ff8f129a81518b9f747f983e41', '1648663063', 'no'),
(149, '_transient_timeout_feed_a421d6f32723068ab074a40017a9e1f9', '1648706263', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(150, '_transient_feed_a421d6f32723068ab074a40017a9e1f9', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:49:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress.org Polska\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:24:\"https://pl.wordpress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 27 Nov 2019 09:42:44 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"pl-PL\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://wordpress.org/?v=6.0-alpha-52936\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:10:{i:0;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"WordCamp Łódź 2019\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:64:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 17 Oct 2019 11:30:37 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:10:\"Wydarzenia\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"wordcamp\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=3981\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:454:\"Prowadzisz stronę opartą na WordPressie? Jesteś deweloperem lub prowadzisz działalność opartą o usługi związane z WordPressem? A może jesteś blogerem lub zajmujesz się e-marketingiem? Niezależnie od stopnia znajomości i roli jaką odgrywa WordPress w Twoim życiu, konferencja WordCamp Łódź 2019 skierowana jest właśnie do Ciebie. WordCamp to ogólnopolska konferencja poświęcona pośrednio i bezpośrednio WordPressowi. To [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Katarzyna Gajewska\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3116:\"\n<p>Prowadzisz stronę opartą na WordPressie? Jesteś deweloperem lub prowadzisz działalność opartą o usługi związane z WordPressem? A może jesteś blogerem lub zajmujesz się e-marketingiem? Niezależnie od stopnia znajomości i roli jaką odgrywa WordPress w Twoim życiu, konferencja <strong><a href=\"https://2019.lodz.wordcamp.org/\" target=\"_blank\" rel=\"noreferrer noopener\" aria-label=\"WordCamp Łódź 2019 (opens in a new tab)\">WordCamp Łódź 2019</a></strong> skierowana jest właśnie do Ciebie.<br><br>WordCamp to ogólnopolska konferencja poświęcona pośrednio i bezpośrednio WordPressowi. To doskonała okazja na poszerzenie swojej wiedzy i zdobycie nowych kontaktów, które mogą zaowocować nowymi wyzwaniami w życiu zawodowym. To też doskonała okazja na podzielenie się swoją wiedzą i wymianę doświadczeń z innymi miłośnikami WordPressa. <br><br>WordCamp to trzy dni inspirujących prelekcji prowadzonych przez niesamowitych specjalistów. To warsztaty, dzięki którym zdobędziecie nowe umiejętności. To także Contributor Day &#8211; dzień stworzony specjalnie dla Was &#8211; twórców, deweloperów, tłumaczy, blogerów, projektantów. Tego dnia to Wy możecie podarować swoją pomoc i zaangażowanie w rozwój WordPressa.<br><br>To także spotkania ze sponsorami, dzięki którym WordCamp nie mógłby się odbyć. To oni i ich pomoc sprawia, że konferencja jest dostępna dla tak wielu osób w bardzo przystępnej cenie.<br>Pakiety sponsorskie dostosowane są do różnych potrzeb oraz możliwości. Sponsorami są zarówno duże, międzynarodowe marki, jak i lokalne biznesy działające w naszym regionie. Jeśli chcesz znaleźć się w zacnym gronie sponsorów tegorocznego WordCampa, wybierz odpowiedni pakiet pod tym adresem: <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://2019.lodz.wordcamp.org/zostan-sponsorem-wordcamp-lodz-2019/?fbclid=IwAR0COkUojiqsrmCzYWLHvH0TSJ4cA3t8g_KkqzvT4wDT9Il_LH6cweKVTRo\">https://2019.lodz.wordcamp.org/zostan-sponsorem-wordcamp-lodz-2019/</a><br><br>WordCamp to również networking, czyli wspólna zabawa w trakcie Middle Party. <br><br>Tegoroczny WordCamp odbędzie się w Hotelu Ambasador Premium w Łodzi przy ulicy Kilińskiego 145. Dla Waszej wygody odbędzie się tutaj zarówno pierwszy dzień &#8211; Contributor Day oraz warsztaty, jak i dwa dni konferencyjne poświęcone prezentacjom. Na Middle Party też zapraszamy do Hotelu Ambasador Premium.<br><br>Bilety możecie kupić na naszej stronie internetowej: <a rel=\"noreferrer noopener\" target=\"_blank\" href=\"https://l.facebook.com/l.php?u=https%3A%2F%2F2019.lodz.wordcamp.org%2Fbilety%2F%3Ffbclid%3DIwAR3mM-avOgA5H501q0GD-Y1_VccHbsAkssRqSiL_-cVvTacnPeuDt-fpHq4&amp;h=AT0XqbIJMRrLiuvJ2dnl3grccZ5OTXPpgmZ7xc5ZdxRe7bKjUN28aGLo6T4YeRHgDnlj2YgcRtaEMkfTJHDGtFS5H_TVjTb998shqjeQS-8QAd-9ZBOK1ko--FQMcGz38J4O41U\">https://2019.lodz.wordcamp.org/bilety/</a><br><br>Przy rejestracji nie zapomnijcie wypełnić specjalnego pola z rozmiarem. Na każdego czeka oficjalny, wyjątkowy Swag! <br><br>Do zobaczenia 22 listopada w Hotelu Ambasador Premium w Łodzi! </p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:60:\"https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"12\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:42:\"Dołącz do grupy tłumaczeniowej na Slack\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:76:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:85:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 31 Jul 2018 07:46:24 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"Polskie tłumaczenie i witryna\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=2025\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:429:\"Autorem tego wpisu jest Magdalena Stanek Tłumaczu porozmawiajmy! Podczas tegorocznego Contributor Day na WordCampie w Poznaniu w grupie tłumaczeniowej zebrała się zaangażowana ekipa, która stwierdziła, że fajnie by było tłumaczyć razem przez cały rok, a nie tylko podczas Contributor Day. W związku z tym założyliśmy kanał Slack dla polskich tłumaczy, gdzie będziemy prowadzić cotygodniowe spotkania [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:19:\"Waclaw Jacek (a11n)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1047:\"\n<p><em>Autorem tego wpisu jest Magdalena Stanek</em></p>\n\n\n\n<p>Tłumaczu porozmawiajmy!</p>\n\n\n\n<p>Podczas tegorocznego Contributor Day na WordCampie w Poznaniu w grupie tłumaczeniowej zebrała się zaangażowana ekipa, która stwierdziła, że fajnie by było tłumaczyć razem przez cały rok, a nie tylko podczas Contributor Day.</p>\n\n\n\n<p>W związku z tym założyliśmy kanał Slack dla polskich tłumaczy, gdzie będziemy prowadzić cotygodniowe spotkania w każdą środę o 20:00. Celem spotkań jest wspólne motywowanie się do  poświęcenia trochę więcej czasu na tłumaczenia, rozwiewanie wątpliwości, dyskutowanie na temat różnych spraw związanych z tłumaczeniami i i oczywiście pomaganie sobie nawzajem. </p>\n\n\n\n<p>Możesz się zalogować tutaj <a href=\"https://wordpresspopolsku.slack.com/signup\">https://wordpresspopolsku.slack.com/signup</a> (do logowania najlepiej użyć swoich danych z wordpress.org).</p>\n\n\n\n<p>Mamy nadzieję, że inicjatywa Cię zainteresuje i dołączysz do nas.<br>\nDo zobaczenia na Slacku!</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"8\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.9.7 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 07 Jul 2018 14:18:34 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1945\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:463:\"WordPress 4.9.7 jest już dostępny. To wydanie poprawia bezpieczeństwo wszystkich wersji systemu począwszy od 3.7. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. WordPress w wersji 4.9.6 i wcześniejszych zawiera błąd związany z obsługą mediów, który może pozwolić użytkownikom z pewnymi prawami dostępu na podjęcie próby usunięcia plików spoza katalogu uploads. Dziękujemy Slavco za zgłoszenie błędu, a także Mattowi [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:4564:\"<p>WordPress 4.9.7 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> wszystkich wersji systemu począwszy od 3.7. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1945\"></span></p>\n<p>WordPress w wersji 4.9.6 i wcześniejszych zawiera błąd związany z obsługą mediów, który może pozwolić użytkownikom z pewnymi prawami dostępu na podjęcie próby usunięcia plików spoza katalogu <em>uploads</em>.</p>\n<p>Dziękujemy <a href=\"https://hackerone.com/slavco\">Slavco</a> za zgłoszenie błędu, a także <a href=\"https://www.wordfence.com/\">Mattowi Barry&#8217;emu</a> za zgłoszenie powiązanych z tą kwestią problemów.</p>\n<p>W WordPressie 4.9.7 naprawiono także 17 innych problemów, w szczególności:</p>\n<ul>\n<li>Taksonomie: Ulepszenie obsługi cache dla zapytań dotyczących terminów.</li>\n<li>Wpisy i inne Typy Treści: Usuwanie ciasteczka dotyczącego hasła dla podstrony, gdy użytkownik wyloguje się.</li>\n<li>Widgety: Dopuszczenie używania podstawowych znaczników HTML w opisach paneli bocznych w sekcji Widgety panelu administracyjnego.</li>\n<li>Kokpit wydarzeń społecznościowych: Zawsze pokazuj najbliższe spotkanie WordCamp, jeśli takowe się zbliża &#8211; nawet, gdy wcześniej planowane są spotkania w dalszych lokalizacjach.</li>\n<li>Prywatność: Upewnienie się, że domyślna treść polityki prywatności nie spowoduje wystąpienia krytycznego błędu podczas czyszczenia reguł przekształcania adresów poza kontekstem administracyjnym.</li>\n</ul>\n<p>W dokumentacji Codex znajdziesz <a href=\"https://codex.wordpress.org/Version_4.9.7\">więcej informacji na temat wszystkich kwestii rozwiązanych w wersji 4.9.7</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.7</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Wcześniej zaplanowane wydanie 4.9.7 będzie od teraz nazywane 4.9.8 i zostanie <a href=\"https://make.wordpress.org/core/2018/07/04/dev-chat-summary-july-4th-4-9-7-week-7/\">opublikowane zgodnie z planem</a>.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.7:</p>\n<p><a href=\"https://profiles.wordpress.org/1naveengiri/\">1naveengiri</a>, <a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/abdullahramzan/\">abdullahramzan</a>, <a href=\"https://profiles.wordpress.org/alejandroxlopez/\">alejandroxlopez</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/aryamaaru/\">Arun</a>, <a href=\"https://profiles.wordpress.org/birgire/\">Birgir Erlendsson (birgire)</a>, <a href=\"https://profiles.wordpress.org/bjornw/\">BjornW</a>, <a href=\"https://profiles.wordpress.org/boonebgorges/\">Boone Gorges</a>, <a href=\"https://profiles.wordpress.org/kraftbj/\">Brandon Kraft</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/dlh/\">David Herrera</a>, <a href=\"https://profiles.wordpress.org/flixos90/\">Felix Arntz</a>, <a href=\"https://profiles.wordpress.org/garetharnold/\">Gareth</a>, <a href=\"https://profiles.wordpress.org/iandunn/\">Ian Dunn</a>, <a href=\"https://profiles.wordpress.org/ianbelanger/\">ibelanger</a>, <a href=\"https://profiles.wordpress.org/johnbillion/\">John Blackbourn</a>, <a href=\"https://profiles.wordpress.org/desrosj/\">Jonathan Desrosiers</a>, <a href=\"https://profiles.wordpress.org/joyously/\">Joy</a>, <a href=\"https://profiles.wordpress.org/khaihong/\">khaihong</a>, <a href=\"https://profiles.wordpress.org/lbenicio/\">lbenicio</a>, <a href=\"https://profiles.wordpress.org/leanderiversen/\">Leander Iversen</a>, <a href=\"https://profiles.wordpress.org/mermel/\">mermel</a>, <a href=\"https://profiles.wordpress.org/metalandcoffee/\">metalandcoffee</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Migrated to @jeffpaul</a>, <a href=\"https://profiles.wordpress.org/palmiak/\">palmiak</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/skoldin/\">skoldin</a>, <a href=\"https://profiles.wordpress.org/subrataemfluence/\">Subrata Sarkar</a>, <a href=\"https://profiles.wordpress.org/itowhid06/\">Towhidul Islam</a>, <a href=\"https://profiles.wordpress.org/warmlaundry/\">warmlaundry</a> oraz <a href=\"https://profiles.wordpress.org/yuriv/\">YuriV</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:43:\"Program WordCamp Poznań 2018 już tu jest!\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:86:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 26 May 2018 08:28:57 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:10:\"Wydarzenia\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"wordcamp\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1817\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:395:\"Pewnie większość z was już wie, że w zeszłym tygodniu opublikowaliśmy program tegorocznego WordCampa, który odbędzie się w dniach 6-8 lipca w Poznaniu. WordCamp Poznań 2018 zbliża się dużymi krokami! Jeśli nie masz jeszcze biletu, to nie zastanawiaj się już dłużej, tylko kup bilet na najważniejsze WordPressowe wydarzenie 2018 roku! Zapraszamy do zapoznania się z [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Katarzyna Gajewska\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2455:\"<p>Pewnie większość z was już wie, że w zeszłym tygodniu opublikowaliśmy program tegorocznego WordCampa, który odbędzie się w dniach <strong>6-8 lipca w Poznaniu</strong>.</p>\n<p>WordCamp Poznań 2018 zbliża się dużymi krokami! Jeśli nie masz jeszcze biletu, to nie zastanawiaj się już dłużej, tylko <a href=\"https://2018.poznan.wordcamp.org/bilety/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>kup bilet</strong></a> na najważniejsze WordPressowe wydarzenie 2018 roku! Zapraszamy do zapoznania się z <a href=\"https://2018.poznan.wordcamp.org/program/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>pełnym programem konferencji</strong></a> i do zapisywania się na warsztaty oraz Contributor Day.</p>\n<p>Startujemy 6 lipca! Pierwszego dnia konferencji po prostu nie można przegapić. Zaczniemy od bardziej praktycznych wyzwań. Każdy uczestnik będzie miał możliwość wzięcia udziału w ciekawych warsztatach, które będą świetną okazją, aby zdobyć nowe umiejętności i poznać ciekawych ludzi. W tym roku zaserwujemy aż 6 różnych warsztatów. Warto zapoznać się z tematami i już dziś zarezerwować sobie miejsce. Równolegle do warsztatów będzie odbywał się <a href=\"https://2018.poznan.wordcamp.org/czym-jest-contributor-day/\" target=\"_blank\" rel=\"noopener noreferrer\"><strong>Contributor Day</strong></a>, podczas którego będzie można dołączyć do innych entuzjastów i popracować nad kodem, tłumaczeniem lub zająć się odpowiadaniem na pytania na forum wsparcia. Z pewnością każdy znajdzie tutaj coś dla siebie!</p>\n<p>Kolejne dwa dni konferencji będą wypełnione ciekawymi prelekcjami, na których nie może cię zabraknąć! Tematy są podzielone na dwie ścieżki: ogólną i techniczną. Ścieżkę ogólną polecamy wszystkim, którzy są zainteresowani tematami związanymi z wykorzystaniem WordPressa, blogowaniem i innymi zagadnieniami. Będziecie mieli okazję dowiedzieć się więcej o dostępności, pracy zdalnej, wycenie projektów czy analityce. Z kolei ścieżkę techniczną polecamy uczestnikom poszukującym bardziej specjalistycznej wiedzy. Będzie to świetna okazja, żeby posłuchać prelekcji na temat backupu, automatyzacji zadań czy zabezpieczenia WordPressa. Tematyka zarówno ścieżki ogólnej, jak i technicznej, jest bardzo zróżnicowana. Bez wątpienia każdy znajdzie coś, co go zainteresuje!</p>\n<p>Do zobaczenia w Poznaniu!</p>\n<p>&nbsp;</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"https://pl.wordpress.org/2018/05/26/program-wordcamp-poznan-2018-juz-tu-jest/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"WordPress 4.9.4 – Wydanie poprawiające ważny błąd\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:93:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Feb 2018 18:25:48 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1539\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:489:\"WordPress 4.9.4 jest już dostępny. To wydanie rozwiązuje istotny problem wprowadzony w wersji 4.9.3, który powodował, że strony obsługujące automatyczne aktualizacje nie będą mogły ich przeprowadzić. Wymagane jest ręczne zaktualizowanie WordPressa do wersji 4.9.4 przez Ciebie lub Twojego dostawcę hostingu. Cztery lata temu, w wydaniu 3.7 &#8222;Basie&#8221; WordPressa wprowadziliśmy możliwość automatycznej aktualizacji systemu, dzięki czemu strony stały [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:2631:\"<p>WordPress 4.9.4 jest już dostępny.</p>\n<p>To wydanie rozwiązuje istotny problem wprowadzony w wersji 4.9.3, który powodował, że strony obsługujące automatyczne aktualizacje nie będą mogły ich przeprowadzić. <strong><span style=\"text-decoration: underline\">Wymagane jest ręczne zaktualizowanie WordPressa</span> do wersji 4.9.4 przez Ciebie lub Twojego dostawcę hostingu.</strong></p>\n<p><span id=\"more-1539\"></span></p>\n<p>Cztery lata temu, w wydaniu <a href=\"https://wordpress.org/news/2013/10/basie/\">3.7 &#8222;Basie&#8221; WordPressa</a> wprowadziliśmy możliwość automatycznej aktualizacji systemu, dzięki czemu strony stały się bezpieczniejsze i mniej awaryjne &#8211; nawet, jeśli samodzielnie nie miałeś możliwości ich aktualizować. Przez te 4 lata mechanizm ten pomógł milionom witryn, aktualizując je do bieżących wersji i naprawiając bardzo sporadyczne usterki. Niestety we wczorajszym <a href=\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/\">wydaniu 4.9.3</a> znalazł się ważny błąd, który został wykryty dopiero po upublicznieniu nowej wersji systemu. Błąd ten powoduje, że WordPress nie zaktualizuje się automatycznie do wersji 4.9.4, co oznacza, że aktualizację taką trzeba przeprowadzić ręcznie z poziomu panelu administracyjnego lub z pomocą dostawcy serwera hostingowego.</p>\n<p><strong>Aby przeprowadzić ręczną aktualizację, udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Dopóki tego nie wykonasz, WordPress <span style=\"text-decoration: underline\">nie będzie aktualizował się automatycznie do kolejnych wersji</span>. Zalecamy, by zrobić to natychmiast.</strong></p>\n<p>Dostawcy hostingu, którzy aktualizują automatycznie WordPressa w imieniu swoich klientów, mogą przystąpić do aktualizacji w standardowym trybie. Będziemy ściśle współpracować z innymi dostawcami hostingu, by jak najwięcej ich klientów otrzymało tą aktualizację.</p>\n<p><a href=\"https://make.wordpress.org/core/2018/02/06/wordpress-4-9-4-release-the-technical-details/\">Więcej szczegółów technicznych opublikowaliśmy na naszym blogu o tworzeniu rdzenia WordPressa</a>. Pełna lista zmian dostępna jest w <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.9.4&amp;group=component\">spisie zamkniętych wątków</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.4</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:89:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-4-wydanie-poprawiajace-wazny-blad/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"5\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"WordPress 4.9.3 – Wydanie poprawiające błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:79:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:87:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 06 Feb 2018 10:50:35 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1536\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:450:\"WordPress 4.9.3 jest już dostępny. To wydanie zawiera poprawki 34 błędów obecnych w wersji 4.9 WordPressa, w tym dotyczących zestawów zmian na ekranie Personalizacji, widgetów, edytora wizualnego i kompatybilności z PHP 7.2.  Spis wszystkich zmian znajdziesz w liście zamkniętych wątków oraz liście przeprowadzonych zmian. Pobierz WordPressa 4.9.3 lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3596:\"<p>WordPress 4.9.3 jest już dostępny.</p>\n<p>To wydanie zawiera poprawki 34 błędów obecnych w wersji 4.9 WordPressa, w tym dotyczących zestawów zmian na ekranie Personalizacji, widgetów, edytora wizualnego i kompatybilności z PHP 7.2.  Spis wszystkich zmian znajdziesz<span style=\"line-height: 1.5\"> w <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.9.3&amp;group=component\">liście zamkniętych wątków</a> oraz <a href=\"https://core.trac.wordpress.org/log/branches/4.9?rev=42630&amp;stop_rev=42521\">liście przeprowadzonych zmian</a>.</span></p>\n<p><span id=\"more-1536\"></span></p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.3</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.3:</p>\n<p><a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/abdullahramzan/\">abdullahramzan</a>, <a href=\"https://profiles.wordpress.org/adamsilverstein/\">Adam Silverstein</a>, <a href=\"https://profiles.wordpress.org/afercia/\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/andreiglingeanu/\">andreiglingeanu</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/bpayton/\">Brandon Payton</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/coleh/\">coleh</a>, <a href=\"https://profiles.wordpress.org/darko-a7/\">Darko A7</a>, <a href=\"https://profiles.wordpress.org/desertsnowman/\">David Cramer</a>, <a href=\"https://profiles.wordpress.org/dlh/\">David Herrera</a>, <a href=\"https://profiles.wordpress.org/dd32/\">Dion Hulse</a>, <a href=\"https://profiles.wordpress.org/flixos90/\">Felix Arntz</a>, <a href=\"https://profiles.wordpress.org/frank-klein/\">Frank Klein</a>, <a href=\"https://profiles.wordpress.org/pento/\">Gary Pendergast</a>, <a href=\"https://profiles.wordpress.org/audrasjb/\">Jb Audras</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Jeffrey Paul</a>, <a href=\"https://profiles.wordpress.org/lizkarkoski/\">lizkarkoski</a>, <a href=\"https://profiles.wordpress.org/clorith/\">Marius L. J.</a>, <a href=\"https://profiles.wordpress.org/mattyrob/\">mattyrob</a>, <a href=\"https://profiles.wordpress.org/munyagu/\">munyagu</a>, <a href=\"https://profiles.wordpress.org/ndavison/\">ndavison</a>, <a href=\"https://profiles.wordpress.org/nickmomrik/\">Nick Momrik</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc/\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/rachelbaker/\">Rachel Baker</a>, <a href=\"https://profiles.wordpress.org/rishishah/\">rishishah</a>, <a href=\"https://profiles.wordpress.org/othellobloke/\">Ryan Paul</a>, <a href=\"https://profiles.wordpress.org/sasiddiqui/\">Sami Ahmed Siddiqui</a>, <a href=\"https://profiles.wordpress.org/sayedwp/\">Sayed Taqui</a>, <a href=\"https://profiles.wordpress.org/seanchayes/\">Sean Hayes</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a>, <a href=\"https://profiles.wordpress.org/shooper/\">Shawn Hooper</a>, <a href=\"https://profiles.wordpress.org/netweb/\">Stephen Edgar</a>, <a href=\"https://profiles.wordpress.org/manikmist09/\">Sultan Nasir Uddin</a>, <a href=\"https://profiles.wordpress.org/tigertech/\">tigertech</a> oraz <a href=\"https://profiles.wordpress.org/westonruter/\">Weston Ruter</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://pl.wordpress.org/2018/02/06/wordpress-4-9-3-wydanie-poprawiajace-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.9.2 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 17 Jan 2018 11:06:38 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1512\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:467:\"WordPress 4.9.2 jest już dostępny. To wydanie poprawia bezpieczeństwo we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. Wykryto podatność na atak XSS w plikach Flash biblioteki MediaElement, która jest dołączana do WordPressa w celu zapewnienia kompatybilności ze starszym oprogramowaniem. Ponieważ pliki te nie są już potrzebne w zdecydowanej większości przypadków, zostały one usunięte [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:4168:\"<p>WordPress 4.9.2 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1512\"></span></p>\n<p>Wykryto podatność na atak XSS w plikach Flash biblioteki MediaElement, która jest dołączana do WordPressa w celu zapewnienia kompatybilności ze starszym oprogramowaniem. Ponieważ pliki te nie są już potrzebne w zdecydowanej większości przypadków, zostały one usunięte z WordPressa.</p>\n<p>Biblioteka MediaElement została już udostępniona w nowej wersji, która naprawa problem. W repozytorium wtyczek WordPressa znajduje się nowa <a href=\"https://wordpress.org/plugins/mediaelement-flash-fallbacks/\">wtyczka, przywracająca obsługę biblioteki MediaElement z poprawionymi plikami</a>.</p>\n<p>Dziękujemy zgłaszającym (<a href=\"https://opnsec.com\">Enguerran Gillier</a> i <a href=\"https://widiz.com/\">Widiz</a>) za <a href=\"https://make.wordpress.org/core/handbook/reporting-security-vulnerabilities/\">odpowiedzialne ujawnienie</a> problemów z bezpieczeństwem.</p>\n<p>W WordPressie 4.9.2 rozwiązano także 21 innych problemów, w tym:</p>\n<ul>\n<li>naprawiono błędy JavaScript, które uniemożliwiały zapisywanie wpisów w Firefoxie,</li>\n<li>przywrócono wcześniejsze, niezależne od taksonomii działanie <code>get_category_link()</code> i <code>category_description()</code>,</li>\n<li>od teraz zmiana motywu spowoduje podjęcie próby przywrócenia poprzednich przypisań widgetów &#8211; nawet, jeśli w ostatnio używanym motywie nie były dostępne żadne obszary na widgety.</li>\n</ul>\n<p>W dokumentacji Codex znajdziesz <a href=\"https://codex.wordpress.org/Version_4.9.2\">więcej informacji na temat wszystkich rozwiązanych problemów w wersji 4.9.2</a>.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.9.2</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do powstania wersji 4.9.2:</p>\n<p><a href=\"https://profiles.wordpress.org/0x6f0/\">0x6f0</a>, <a href=\"https://profiles.wordpress.org/jorbin/\">Aaron Jorbin</a>, <a href=\"https://profiles.wordpress.org/afercia/\">Andrea Fercia</a>, <a href=\"https://profiles.wordpress.org/aduth/\">Andrew Duthie</a>, <a href=\"https://profiles.wordpress.org/azaozz/\">Andrew Ozz</a>, <a href=\"https://profiles.wordpress.org/blobfolio/\">Blobfolio</a>, <a href=\"https://profiles.wordpress.org/boonebgorges/\">Boone Gorges</a>, <a href=\"https://profiles.wordpress.org/icaleb/\">Caleb Burks</a>, <a href=\"https://profiles.wordpress.org/poena/\">Carolina Nymark</a>, <a href=\"https://profiles.wordpress.org/chasewg/\">chasewg</a>, <a href=\"https://profiles.wordpress.org/chetan200891/\">Chetan Prajapati</a>, <a href=\"https://profiles.wordpress.org/dd32/\">Dion Hulse</a>, <a href=\"https://profiles.wordpress.org/hardik-amipara/\">Hardik Amipara</a>, <a href=\"https://profiles.wordpress.org/ionvv/\">ionvv</a>, <a href=\"https://profiles.wordpress.org/jaswrks/\">Jason Caldwell</a>, <a href=\"https://profiles.wordpress.org/jbpaul17/\">Jeffrey Paul</a>, <a href=\"https://profiles.wordpress.org/jeremyfelt/\">Jeremy Felt</a>, <a href=\"https://profiles.wordpress.org/joemcgill/\">Joe McGill</a>, <a href=\"https://profiles.wordpress.org/johnschulz/\">johnschulz</a>, <a href=\"https://profiles.wordpress.org/juiiee8487/\">Juhi Patel</a>, <a href=\"https://profiles.wordpress.org/obenland/\">Konstantin Obenland</a>, <a href=\"https://profiles.wordpress.org/markjaquith/\">Mark Jaquith</a>, <a href=\"https://profiles.wordpress.org/rabmalin/\">Nilambar Sharma</a>, <a href=\"https://profiles.wordpress.org/peterwilsoncc/\">Peter Wilson</a>, <a href=\"https://profiles.wordpress.org/rachelbaker/\">Rachel Baker</a>, <a href=\"https://profiles.wordpress.org/rinkuyadav999/\">Rinku Y</a>, <a href=\"https://profiles.wordpress.org/sergeybiryukov/\">Sergey Biryukov</a> oraz <a href=\"https://profiles.wordpress.org/westonruter/\">Weston Ruter</a>.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2018/01/17/wordpress-4-9-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"WordPress 4.8.3 – Wydanie poprawiające bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:88:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 31 Oct 2017 11:26:39 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1289\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:475:\"WordPress 4.8.3 jest już dostępny. To wydanie poprawia bezpieczeństwo we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji. WordPress w wersji 4.8.2 i wcześniejszych jest podatny na problem z $wpdb-&#62;prepare(), który może prowadzić do tworzenia nieoczekiwanych i niebezpiecznych zapytań, umożliwiających potencjalny atak metodą SQL injection (SQLi). Rdzeń systemu nie jest bezpośrednio podatny na ten [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Chris Trynkiewicz (Sukces Strony)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1522:\"<p>WordPress 4.8.3 jest już dostępny. <strong>To wydanie poprawia bezpieczeństwo</strong> we wszystkich poprzednich wersjach systemu. Zalecane jest natychmiastowe przeprowadzenie aktualizacji.</p>\n<p><span id=\"more-1289\"></span></p>\n<p>WordPress w wersji 4.8.2 i wcześniejszych jest podatny na problem z <code>$wpdb-&gt;prepare()</code>, który może prowadzić do tworzenia nieoczekiwanych i niebezpiecznych zapytań, umożliwiających potencjalny atak metodą SQL injection (SQLi). Rdzeń systemu nie jest bezpośrednio podatny na ten problem, ale dodaliśmy dodatkowe zabezpieczenia, by wtyczki i motywy nie mogły go przypadkowo powodować. Problem zgłosił <a href=\"https://twitter.com/ircmaxell\">Anthony Ferrara</a>.</p>\n<p>To wydanie WordPressa zmienia zachowanie funkcji <code>esc_sql()</code>. Różnica nie będzie istotna dla większości programistów. Zachęcamy do <a href=\"https://make.wordpress.org/core/2017/10/31/changed-behaviour-of-esc_sql-in-wordpress-4-8-3/\">przeczytania informacji dla deweloperów</a>.</p>\n<p>Dziękujemy zgłaszającemu za <a href=\"https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/\">odpowiedzialne ujawnienie</a> problemu z bezpieczeństwem.</p>\n<p><a href=\"https://pl.wordpress.org/\">Pobierz WordPressa 4.8.3</a> lub udaj się do sekcji Kokpit → Aktualizacje panelu administracyjnego i po prostu kliknij przycisk „Zaktualizuj teraz”. Witryny, które obsługują automatyczne aktualizacje, rozpoczęły już ich przeprowadzanie.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:93:\"https://pl.wordpress.org/2017/10/31/wordpress-4-8-3-wydanie-poprawiajace-bezpieczenstwo/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:73:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress 4.9 Beta 2\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:66:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 12 Oct 2017 07:03:53 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Wersje testowe\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1235\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:433:\"WordPress 4.9 Beta 2 jest już dostępny! Oprogramowanie jest wciąż w fazie tworzenia, dlatego nie zalecamy jego używania w witrynie produkcyjnej. Zastanów się nad środowiskiem testowym i tam sprawdzaj do woli. Aby przetestować WordPress 4.9, wypróbuj wtyczkę WordPress Beta Tester (regularnie aktualizuje one do  &#8222;krawych nocnych wydań&#8221;) albo pobierz wersję beta (zip). Więcej informacji na temat [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Marcin Pietrzak\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1781:\"<p>WordPress 4.9 Beta 2 jest już dostępny!</p>\n<p><strong>Oprogramowanie jest wciąż w fazie tworzenia</strong>, dlatego nie zalecamy jego używania w witrynie produkcyjnej. Zastanów się nad środowiskiem testowym i tam sprawdzaj do woli. Aby przetestować WordPress 4.9, wypróbuj wtyczkę <a href=\"https://pl.wordpress.org/plugins/wordpress-beta-tester/\">WordPress Beta Tester</a> (regularnie aktualizuje one do  &#8222;krawych nocnych wydań&#8221;) albo <a href=\"https://wordpress.org/wordpress-4.9-beta2.zip\">pobierz wersję beta</a> (zip).</p>\n<p>Więcej informacji na temat tego, co nowego w wersji 4.9, znajdziesz w blogu we wpisie <a href=\"https://wordpress.org/news/2017/10/wordpress-4-9-beta-1/\">Beta 1</a> (po angielsku). Od tego czasu dokonaliśmy <a href=\"https://core.trac.wordpress.org/log/trunk/?action=stop_on_copy&amp;mode=stop_on_copy&amp;rev=41846&amp;stop_rev=41777&amp;limit=100&amp;sfp_email=&amp;sfph_mail=\">70 zmian</a> w wersji Beta 2.</p>\n<p><a href=\"https://translate.wordpress.org/locale/pl/default/wp/dev\">Pomóż nam przetłumaczyć WordPress na język polski</a>!</p>\n<p><strong>Jeśli widzisz błąd</strong>, napisz wiadomość na forum <a href=\"https://wordpress.org/support/forum/alphabeta\">Alpha/Beta</a>. Jeżeli coś nie działa, to chcielibyśm się tego dowiedzieć właśnie do ciebie! Jeśli czujesz się na siłach, żeby napisać raport zawierający opis jak powtórzyć błąd to  skorzystaj z serwisu <a href=\"https://make.wordpress.org/core/reports/\">WordPress Trac</a>. Na nim też znajdziesz <a href=\"https://core.trac.wordpress.org/tickets/major\">listę znanych błędów</a>.</p>\n<p><em>Przetestujmy razem:</em><br />\n<em> edytowanie kodu, przełączniki tematyczne,</em><br />\n<em> widgety, harmonogramowanie.</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:62:\"https://pl.wordpress.org/2017/10/12/wordpress-4-9-beta-2/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:76:\"\n		\n		\n					\n		\n		\n		\n				\n		\n		\n\n					\n										\n					\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"WordPress 4.8.2 – Wydanie poprawiające bezpieczeństwo i błędy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:96:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:104:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 22 Sep 2017 11:37:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:2:{i:0;a:5:{s:4:\"data\";s:15:\"Bezpieczeństwo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:7:\"Wydanie\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"https://pl.wordpress.org/?p=1213\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:476:\"WordPress 4.8.2 jest już dostępny. Wersja poprawia bezpieczeństwo wszystkich poprzednich wersji i zdecydowanie zachęcamy do natychmiastowej aktualizacji witryn. WordPress w wersji 4.8.1 i starsze mają następujące problemy z bezpieczeństwem: $wpdb-&#62; prepare() mogło tworzyć nieoczekiwane i niebezpieczne zapytania prowadzące do potencjalnego wstrzyknięcia kod SQL (SQLi). Core WordPressa nie jest bezpośrednio narażony na ten problem, ale poprawiono [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Marcin Pietrzak\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:3051:\"<p>WordPress 4.8.2 jest już dostępny. Wersja <strong>poprawia bezpieczeństwo</strong> wszystkich poprzednich wersji i zdecydowanie zachęcamy do natychmiastowej aktualizacji witryn.</p>\n<p>WordPress w wersji 4.8.1 i starsze mają następujące problemy z bezpieczeństwem:</p>\n<ol>\n<li><strong>$wpdb-&gt; prepare()</strong> mogło tworzyć nieoczekiwane i niebezpieczne zapytania prowadzące do potencjalnego wstrzyknięcia kod SQL (SQLi). Core WordPressa nie jest bezpośrednio narażony na ten problem, ale poprawiono proces tworzenia zapytań aby zapobiegać podatności we wtyczkach i motywach. Zgłoszone przez <a href=\"https://hackerone.com/slavco\">Slavco</a></li>\n<li>Wykryto podatność na cross-site scripting (XSS) w używaniu oEmbed. Zgłoszone przez xknown zespołu ds. Zabezpieczeń WordPress.</li>\n<li>W edytorze wizualnym wykryto lukę w zabezpieczeniach skryptów przed cross-site scripting (XSS) Zgłoszone przez <a href=\"https://twitter.com/brutelogic\">Rodolfo Assis (@brutelogic)</a> Sucuri Security.</li>\n<li>W kodzie do rozpakowywania wykryto lukę w zabezpieczeniach ścieżki do pliku. Zgłoszone przez <a href=\"https://hackerone.com/noxrnet\">Alex Chapman (noxrnet)</a>.</li>\n<li>W edytorze wtyczek wykryto luka w zabezpieczeniach cross-site scripting (XSS). Zgłoszone przez 陈瑞琦 (Chen Ruiqi).</li>\n<li>Na ekranie użytkownika i terminach edycji zostały wykryte otwarte przekierowanie. Zgłoszone przez <a href=\"https://hackerone.com/ysx\">Yasin Soliman (ysx)</a>.</li>\n<li>Odkryto lukę w zabezpieczeniach ścieżki na ekranie personalizacji witryny. Zgłoszone przez Weston Ruter z zespołu ds. Bezpieczeństwa WordPress.</li>\n<li>Wykryto podatność na cross-site scripting (XSS)  w nazwach szablonów. Zgłoszone przez <a href=\"https://hackerone.com/sikic\">Luka (sikic)</a>.</li>\n<li>Wykryto podatność na cross-site scripting (XSS) w linkach modalnych. Zgłoszone przez <a href=\"https://hackerone.com/qasuar\">Anas Roubi (qasuar)</a>.</li>\n</ol>\n<p>Dziękujemy zgłaszającym za praktykowanie <a href=\"https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/\">odpowiedzialnego ujawnienia (en)</a>.</p>\n<p>Oprócz powyższych kwestii związanych z bezpieczeństwem, WordPress 4.8.2 zawiera 6 poprawek utrzymaniowych serii 4.8. Więcej informacji można znaleźć w <a href=\"https://codex.wordpress.org/Version_4.8.2\">notce wydania wersji (en)</a> oraz na <a href=\"https://core.trac.wordpress.org/query?status=closed&amp;milestone=4.8.2&amp;group=component&amp;col=id&amp;col=summary&amp;col=component&amp;col=status&amp;col=owner&amp;col=type&amp;col=priority&amp;col=keywords&amp;order=priority\">liście zmian</a>.</p>\n<p><a href=\"https://pl.wordpress.org/wordpress-4.8.2-pl_PL.zip\">Pobierz WordPress 4.8.2</a> lub przejdź do Panel → Aktualizacje i kliknij przycisk &#8222;Aktualizuj teraz&#8221;. Strony obsługujące automatyczne aktualizacje w tle już zaczynają aktualizować się do wersji 4.8.2.</p>\n<p>Dziękujemy wszystkim, którzy przyczynili się do wydania 4.8.2.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"https://pl.wordpress.org/2017/09/22/wordpress-4-8-2-wydanie-poprawiajace-bezpieczenstwo-i-bledy/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:30:\"https://pl.wordpress.org/feed/\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"\n	hourly	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"\n	1	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:8:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Wed, 30 Mar 2022 17:57:43 GMT\";s:12:\"content-type\";s:34:\"application/rss+xml; charset=UTF-8\";s:6:\"x-olaf\";s:3:\"⛄\";s:13:\"last-modified\";s:29:\"Fri, 07 May 2021 01:00:42 GMT\";s:4:\"link\";s:61:\"<https://pl.wordpress.org/wp-json/>; rel=\"https://api.w.org/\"\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:4:\"x-nc\";s:9:\"HIT ord 1\";}}s:5:\"build\";s:14:\"20211220193300\";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(151, '_transient_timeout_feed_mod_a421d6f32723068ab074a40017a9e1f9', '1648706263', 'no'),
(152, '_transient_feed_mod_a421d6f32723068ab074a40017a9e1f9', '1648663063', 'no'),
(153, '_transient_timeout_dash_v2_5ed7e1a5d79caaf375d35c33f6782653', '1648706263', 'no'),
(154, '_transient_dash_v2_5ed7e1a5d79caaf375d35c33f6782653', '<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/\'>WordCamp Łódź 2019</a></li><li><a class=\'rsswidget\' href=\'https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/\'>Dołącz do grupy tłumaczeniowej na Slack</a></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://pl.wordpress.org/2019/10/17/wordcamp-lodz-2019/\'>WordCamp Łódź 2019</a></li><li><a class=\'rsswidget\' href=\'https://pl.wordpress.org/2018/07/31/dolacz-do-grupy-tlumaczeniowej-na-slack/\'>Dołącz do grupy tłumaczeniowej na Slack</a></li><li><a class=\'rsswidget\' href=\'https://pl.wordpress.org/2018/07/07/wordpress-4-9-7-wydanie-poprawiajace-bezpieczenstwo-i-bledy/\'>WordPress 4.9.7 – Wydanie poprawiające bezpieczeństwo i błędy</a></li></ul></div>', 'no'),
(155, 'current_theme', 'Twenty Twenty', 'yes'),
(156, 'theme_mods_twentytwenty', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(157, 'theme_switched', '', 'yes'),
(160, 'widget_recent-comments', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(161, 'widget_recent-posts', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(164, '_transient_timeout_global_styles_twentytwenty', '1648663160', 'no'),
(165, '_transient_global_styles_twentytwenty', 'body{--wp--preset--color--black: #000000;--wp--preset--color--cyan-bluish-gray: #abb8c3;--wp--preset--color--white: #ffffff;--wp--preset--color--pale-pink: #f78da7;--wp--preset--color--vivid-red: #cf2e2e;--wp--preset--color--luminous-vivid-orange: #ff6900;--wp--preset--color--luminous-vivid-amber: #fcb900;--wp--preset--color--light-green-cyan: #7bdcb5;--wp--preset--color--vivid-green-cyan: #00d084;--wp--preset--color--pale-cyan-blue: #8ed1fc;--wp--preset--color--vivid-cyan-blue: #0693e3;--wp--preset--color--vivid-purple: #9b51e0;--wp--preset--color--accent: #cd2653;--wp--preset--color--primary: #000000;--wp--preset--color--secondary: #6d6d6d;--wp--preset--color--subtle-background: #dcd7ca;--wp--preset--color--background: #f5efe0;--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg,rgba(6,147,227,1) 0%,rgb(155,81,224) 100%);--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg,rgb(122,220,180) 0%,rgb(0,208,130) 100%);--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg,rgba(252,185,0,1) 0%,rgba(255,105,0,1) 100%);--wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg,rgba(255,105,0,1) 0%,rgb(207,46,46) 100%);--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg,rgb(238,238,238) 0%,rgb(169,184,195) 100%);--wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg,rgb(74,234,220) 0%,rgb(151,120,209) 20%,rgb(207,42,186) 40%,rgb(238,44,130) 60%,rgb(251,105,98) 80%,rgb(254,248,76) 100%);--wp--preset--gradient--blush-light-purple: linear-gradient(135deg,rgb(255,206,236) 0%,rgb(152,150,240) 100%);--wp--preset--gradient--blush-bordeaux: linear-gradient(135deg,rgb(254,205,165) 0%,rgb(254,45,45) 50%,rgb(107,0,62) 100%);--wp--preset--gradient--luminous-dusk: linear-gradient(135deg,rgb(255,203,112) 0%,rgb(199,81,192) 50%,rgb(65,88,208) 100%);--wp--preset--gradient--pale-ocean: linear-gradient(135deg,rgb(255,245,203) 0%,rgb(182,227,212) 50%,rgb(51,167,181) 100%);--wp--preset--gradient--electric-grass: linear-gradient(135deg,rgb(202,248,128) 0%,rgb(113,206,126) 100%);--wp--preset--gradient--midnight: linear-gradient(135deg,rgb(2,3,129) 0%,rgb(40,116,252) 100%);--wp--preset--duotone--dark-grayscale: url(\'#wp-duotone-dark-grayscale\');--wp--preset--duotone--grayscale: url(\'#wp-duotone-grayscale\');--wp--preset--duotone--purple-yellow: url(\'#wp-duotone-purple-yellow\');--wp--preset--duotone--blue-red: url(\'#wp-duotone-blue-red\');--wp--preset--duotone--midnight: url(\'#wp-duotone-midnight\');--wp--preset--duotone--magenta-yellow: url(\'#wp-duotone-magenta-yellow\');--wp--preset--duotone--purple-green: url(\'#wp-duotone-purple-green\');--wp--preset--duotone--blue-orange: url(\'#wp-duotone-blue-orange\');--wp--preset--font-size--small: 18px;--wp--preset--font-size--medium: 20px;--wp--preset--font-size--large: 26.25px;--wp--preset--font-size--x-large: 42px;--wp--preset--font-size--normal: 21px;--wp--preset--font-size--larger: 32px;}.has-black-color{color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-color{color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-color{color: var(--wp--preset--color--white) !important;}.has-pale-pink-color{color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-color{color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-color{color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-color{color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-color{color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-color{color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-color{color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-color{color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-color{color: var(--wp--preset--color--vivid-purple) !important;}.has-black-background-color{background-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-background-color{background-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-background-color{background-color: var(--wp--preset--color--white) !important;}.has-pale-pink-background-color{background-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-background-color{background-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-background-color{background-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-background-color{background-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-background-color{background-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-background-color{background-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-background-color{background-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-background-color{background-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-background-color{background-color: var(--wp--preset--color--vivid-purple) !important;}.has-black-border-color{border-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-border-color{border-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-border-color{border-color: var(--wp--preset--color--white) !important;}.has-pale-pink-border-color{border-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-border-color{border-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-border-color{border-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-border-color{border-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-border-color{border-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-border-color{border-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-border-color{border-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-border-color{border-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-border-color{border-color: var(--wp--preset--color--vivid-purple) !important;}.has-vivid-cyan-blue-to-vivid-purple-gradient-background{background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;}.has-light-green-cyan-to-vivid-green-cyan-gradient-background{background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;}.has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;}.has-luminous-vivid-orange-to-vivid-red-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;}.has-very-light-gray-to-cyan-bluish-gray-gradient-background{background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;}.has-cool-to-warm-spectrum-gradient-background{background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;}.has-blush-light-purple-gradient-background{background: var(--wp--preset--gradient--blush-light-purple) !important;}.has-blush-bordeaux-gradient-background{background: var(--wp--preset--gradient--blush-bordeaux) !important;}.has-luminous-dusk-gradient-background{background: var(--wp--preset--gradient--luminous-dusk) !important;}.has-pale-ocean-gradient-background{background: var(--wp--preset--gradient--pale-ocean) !important;}.has-electric-grass-gradient-background{background: var(--wp--preset--gradient--electric-grass) !important;}.has-midnight-gradient-background{background: var(--wp--preset--gradient--midnight) !important;}.has-small-font-size{font-size: var(--wp--preset--font-size--small) !important;}.has-medium-font-size{font-size: var(--wp--preset--font-size--medium) !important;}.has-large-font-size{font-size: var(--wp--preset--font-size--large) !important;}.has-x-large-font-size{font-size: var(--wp--preset--font-size--x-large) !important;}', 'no'),
(166, '_transient_timeout_global_styles_svg_filters_twentytwenty', '1648663160', 'no'),
(167, '_transient_global_styles_svg_filters_twentytwenty', '<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-dark-grayscale\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 0.49803921568627\" /><feFuncG type=\"table\" tableValues=\"0 0.49803921568627\" /><feFuncB type=\"table\" tableValues=\"0 0.49803921568627\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-grayscale\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 1\" /><feFuncG type=\"table\" tableValues=\"0 1\" /><feFuncB type=\"table\" tableValues=\"0 1\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-purple-yellow\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.54901960784314 0.98823529411765\" /><feFuncG type=\"table\" tableValues=\"0 1\" /><feFuncB type=\"table\" tableValues=\"0.71764705882353 0.25490196078431\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-blue-red\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 1\" /><feFuncG type=\"table\" tableValues=\"0 0.27843137254902\" /><feFuncB type=\"table\" tableValues=\"0.5921568627451 0.27843137254902\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-midnight\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0 0\" /><feFuncG type=\"table\" tableValues=\"0 0.64705882352941\" /><feFuncB type=\"table\" tableValues=\"0 1\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-magenta-yellow\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.78039215686275 1\" /><feFuncG type=\"table\" tableValues=\"0 0.94901960784314\" /><feFuncB type=\"table\" tableValues=\"0.35294117647059 0.47058823529412\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-purple-green\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.65098039215686 0.40392156862745\" /><feFuncG type=\"table\" tableValues=\"0 1\" /><feFuncB type=\"table\" tableValues=\"0.44705882352941 0.4\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 0 0\" width=\"0\" height=\"0\" focusable=\"false\" role=\"none\" style=\"visibility: hidden; position: absolute; left: -9999px; overflow: hidden;\" ><defs><filter id=\"wp-duotone-blue-orange\"><feColorMatrix color-interpolation-filters=\"sRGB\" type=\"matrix\" values=\" .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 .299 .587 .114 0 0 \" /><feComponentTransfer color-interpolation-filters=\"sRGB\" ><feFuncR type=\"table\" tableValues=\"0.098039215686275 1\" /><feFuncG type=\"table\" tableValues=\"0 0.66274509803922\" /><feFuncB type=\"table\" tableValues=\"0.84705882352941 0.41960784313725\" /><feFuncA type=\"table\" tableValues=\"1 1\" /></feComponentTransfer><feComposite in2=\"SourceGraphic\" operator=\"in\" /></filter></defs></svg>', 'no'),
(170, 'finished_updating_comment_type', '1', 'yes'),
(171, 'recently_activated', 'a:0:{}', 'yes'),
(172, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1648673991', 'no'),
(173, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'O:8:\"stdClass\":100:{s:11:\"woocommerce\";a:3:{s:4:\"name\";s:11:\"woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:5:\"count\";i:5433;}s:6:\"widget\";a:3:{s:4:\"name\";s:6:\"widget\";s:4:\"slug\";s:6:\"widget\";s:5:\"count\";i:4788;}s:4:\"post\";a:3:{s:4:\"name\";s:4:\"post\";s:4:\"slug\";s:4:\"post\";s:5:\"count\";i:2751;}s:5:\"admin\";a:3:{s:4:\"name\";s:5:\"admin\";s:4:\"slug\";s:5:\"admin\";s:5:\"count\";i:2621;}s:5:\"posts\";a:3:{s:4:\"name\";s:5:\"posts\";s:4:\"slug\";s:5:\"posts\";s:5:\"count\";i:2026;}s:9:\"shortcode\";a:3:{s:4:\"name\";s:9:\"shortcode\";s:4:\"slug\";s:9:\"shortcode\";s:5:\"count\";i:1876;}s:8:\"comments\";a:3:{s:4:\"name\";s:8:\"comments\";s:4:\"slug\";s:8:\"comments\";s:5:\"count\";i:1871;}s:3:\"seo\";a:3:{s:4:\"name\";s:3:\"seo\";s:4:\"slug\";s:3:\"seo\";s:5:\"count\";i:1556;}s:6:\"images\";a:3:{s:4:\"name\";s:6:\"images\";s:4:\"slug\";s:6:\"images\";s:5:\"count\";i:1542;}s:6:\"google\";a:3:{s:4:\"name\";s:6:\"google\";s:4:\"slug\";s:6:\"google\";s:5:\"count\";i:1520;}s:5:\"image\";a:3:{s:4:\"name\";s:5:\"image\";s:4:\"slug\";s:5:\"image\";s:5:\"count\";i:1513;}s:7:\"twitter\";a:3:{s:4:\"name\";s:7:\"twitter\";s:4:\"slug\";s:7:\"twitter\";s:5:\"count\";i:1506;}s:8:\"facebook\";a:3:{s:4:\"name\";s:8:\"facebook\";s:4:\"slug\";s:8:\"facebook\";s:5:\"count\";i:1486;}s:9:\"ecommerce\";a:3:{s:4:\"name\";s:9:\"ecommerce\";s:4:\"slug\";s:9:\"ecommerce\";s:5:\"count\";i:1355;}s:7:\"sidebar\";a:3:{s:4:\"name\";s:7:\"sidebar\";s:4:\"slug\";s:7:\"sidebar\";s:5:\"count\";i:1313;}s:5:\"email\";a:3:{s:4:\"name\";s:5:\"email\";s:4:\"slug\";s:5:\"email\";s:5:\"count\";i:1312;}s:7:\"gallery\";a:3:{s:4:\"name\";s:7:\"gallery\";s:4:\"slug\";s:7:\"gallery\";s:5:\"count\";i:1252;}s:4:\"page\";a:3:{s:4:\"name\";s:4:\"page\";s:4:\"slug\";s:4:\"page\";s:5:\"count\";i:1168;}s:6:\"social\";a:3:{s:4:\"name\";s:6:\"social\";s:4:\"slug\";s:6:\"social\";s:5:\"count\";i:1143;}s:5:\"login\";a:3:{s:4:\"name\";s:5:\"login\";s:4:\"slug\";s:5:\"login\";s:5:\"count\";i:1100;}s:8:\"security\";a:3:{s:4:\"name\";s:8:\"security\";s:4:\"slug\";s:8:\"security\";s:5:\"count\";i:998;}s:5:\"video\";a:3:{s:4:\"name\";s:5:\"video\";s:4:\"slug\";s:5:\"video\";s:5:\"count\";i:956;}s:10:\"e-commerce\";a:3:{s:4:\"name\";s:10:\"e-commerce\";s:4:\"slug\";s:10:\"e-commerce\";s:5:\"count\";i:942;}s:7:\"widgets\";a:3:{s:4:\"name\";s:7:\"widgets\";s:4:\"slug\";s:7:\"widgets\";s:5:\"count\";i:929;}s:5:\"links\";a:3:{s:4:\"name\";s:5:\"links\";s:4:\"slug\";s:5:\"links\";s:5:\"count\";i:894;}s:4:\"spam\";a:3:{s:4:\"name\";s:4:\"spam\";s:4:\"slug\";s:4:\"spam\";s:5:\"count\";i:850;}s:7:\"content\";a:3:{s:4:\"name\";s:7:\"content\";s:4:\"slug\";s:7:\"content\";s:5:\"count\";i:840;}s:9:\"analytics\";a:3:{s:4:\"name\";s:9:\"analytics\";s:4:\"slug\";s:9:\"analytics\";s:5:\"count\";i:839;}s:6:\"slider\";a:3:{s:4:\"name\";s:6:\"slider\";s:4:\"slug\";s:6:\"slider\";s:5:\"count\";i:837;}s:4:\"form\";a:3:{s:4:\"name\";s:4:\"form\";s:4:\"slug\";s:4:\"form\";s:5:\"count\";i:819;}s:7:\"payment\";a:3:{s:4:\"name\";s:7:\"payment\";s:4:\"slug\";s:7:\"payment\";s:5:\"count\";i:782;}s:10:\"buddypress\";a:3:{s:4:\"name\";s:10:\"buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:5:\"count\";i:772;}s:5:\"media\";a:3:{s:4:\"name\";s:5:\"media\";s:4:\"slug\";s:5:\"media\";s:5:\"count\";i:771;}s:6:\"search\";a:3:{s:4:\"name\";s:6:\"search\";s:4:\"slug\";s:6:\"search\";s:5:\"count\";i:750;}s:6:\"editor\";a:3:{s:4:\"name\";s:6:\"editor\";s:4:\"slug\";s:6:\"editor\";s:5:\"count\";i:748;}s:3:\"rss\";a:3:{s:4:\"name\";s:3:\"rss\";s:4:\"slug\";s:3:\"rss\";s:5:\"count\";i:728;}s:5:\"pages\";a:3:{s:4:\"name\";s:5:\"pages\";s:4:\"slug\";s:5:\"pages\";s:5:\"count\";i:722;}s:9:\"gutenberg\";a:3:{s:4:\"name\";s:9:\"gutenberg\";s:4:\"slug\";s:9:\"gutenberg\";s:5:\"count\";i:720;}s:4:\"menu\";a:3:{s:4:\"name\";s:4:\"menu\";s:4:\"slug\";s:4:\"menu\";s:5:\"count\";i:704;}s:12:\"contact-form\";a:3:{s:4:\"name\";s:12:\"contact form\";s:4:\"slug\";s:12:\"contact-form\";s:5:\"count\";i:688;}s:15:\"payment-gateway\";a:3:{s:4:\"name\";s:15:\"payment gateway\";s:4:\"slug\";s:15:\"payment-gateway\";s:5:\"count\";i:687;}s:4:\"feed\";a:3:{s:4:\"name\";s:4:\"feed\";s:4:\"slug\";s:4:\"feed\";s:5:\"count\";i:673;}s:5:\"embed\";a:3:{s:4:\"name\";s:5:\"embed\";s:4:\"slug\";s:5:\"embed\";s:5:\"count\";i:670;}s:8:\"category\";a:3:{s:4:\"name\";s:8:\"category\";s:4:\"slug\";s:8:\"category\";s:5:\"count\";i:669;}s:6:\"jquery\";a:3:{s:4:\"name\";s:6:\"jquery\";s:4:\"slug\";s:6:\"jquery\";s:5:\"count\";i:667;}s:4:\"ajax\";a:3:{s:4:\"name\";s:4:\"ajax\";s:4:\"slug\";s:4:\"ajax\";s:5:\"count\";i:659;}s:5:\"block\";a:3:{s:4:\"name\";s:5:\"block\";s:4:\"slug\";s:5:\"block\";s:5:\"count\";i:632;}s:7:\"youtube\";a:3:{s:4:\"name\";s:7:\"youtube\";s:4:\"slug\";s:7:\"youtube\";s:5:\"count\";i:613;}s:9:\"elementor\";a:3:{s:4:\"name\";s:9:\"elementor\";s:4:\"slug\";s:9:\"elementor\";s:5:\"count\";i:613;}s:3:\"css\";a:3:{s:4:\"name\";s:3:\"css\";s:4:\"slug\";s:3:\"css\";s:5:\"count\";i:608;}s:4:\"link\";a:3:{s:4:\"name\";s:4:\"link\";s:4:\"slug\";s:4:\"link\";s:5:\"count\";i:598;}s:10:\"javascript\";a:3:{s:4:\"name\";s:10:\"javascript\";s:4:\"slug\";s:10:\"javascript\";s:5:\"count\";i:596;}s:9:\"affiliate\";a:3:{s:4:\"name\";s:9:\"affiliate\";s:4:\"slug\";s:9:\"affiliate\";s:5:\"count\";i:590;}s:5:\"share\";a:3:{s:4:\"name\";s:5:\"share\";s:4:\"slug\";s:5:\"share\";s:5:\"count\";i:581;}s:9:\"dashboard\";a:3:{s:4:\"name\";s:9:\"dashboard\";s:4:\"slug\";s:9:\"dashboard\";s:5:\"count\";i:573;}s:10:\"responsive\";a:3:{s:4:\"name\";s:10:\"responsive\";s:4:\"slug\";s:10:\"responsive\";s:5:\"count\";i:573;}s:3:\"api\";a:3:{s:4:\"name\";s:3:\"api\";s:4:\"slug\";s:3:\"api\";s:5:\"count\";i:573;}s:5:\"theme\";a:3:{s:4:\"name\";s:5:\"theme\";s:4:\"slug\";s:5:\"theme\";s:5:\"count\";i:571;}s:7:\"contact\";a:3:{s:4:\"name\";s:7:\"contact\";s:4:\"slug\";s:7:\"contact\";s:5:\"count\";i:566;}s:7:\"comment\";a:3:{s:4:\"name\";s:7:\"comment\";s:4:\"slug\";s:7:\"comment\";s:5:\"count\";i:564;}s:3:\"ads\";a:3:{s:4:\"name\";s:3:\"ads\";s:4:\"slug\";s:3:\"ads\";s:5:\"count\";i:554;}s:6:\"custom\";a:3:{s:4:\"name\";s:6:\"custom\";s:4:\"slug\";s:6:\"custom\";s:5:\"count\";i:546;}s:10:\"categories\";a:3:{s:4:\"name\";s:10:\"categories\";s:4:\"slug\";s:10:\"categories\";s:5:\"count\";i:537;}s:4:\"user\";a:3:{s:4:\"name\";s:4:\"user\";s:4:\"slug\";s:4:\"user\";s:5:\"count\";i:527;}s:9:\"marketing\";a:3:{s:4:\"name\";s:9:\"marketing\";s:4:\"slug\";s:9:\"marketing\";s:5:\"count\";i:525;}s:6:\"events\";a:3:{s:4:\"name\";s:6:\"events\";s:4:\"slug\";s:6:\"events\";s:5:\"count\";i:523;}s:6:\"button\";a:3:{s:4:\"name\";s:6:\"button\";s:4:\"slug\";s:6:\"button\";s:5:\"count\";i:520;}s:4:\"chat\";a:3:{s:4:\"name\";s:4:\"chat\";s:4:\"slug\";s:4:\"chat\";s:5:\"count\";i:508;}s:6:\"mobile\";a:3:{s:4:\"name\";s:6:\"mobile\";s:4:\"slug\";s:6:\"mobile\";s:5:\"count\";i:507;}s:4:\"tags\";a:3:{s:4:\"name\";s:4:\"tags\";s:4:\"slug\";s:4:\"tags\";s:5:\"count\";i:505;}s:8:\"shipping\";a:3:{s:4:\"name\";s:8:\"shipping\";s:4:\"slug\";s:8:\"shipping\";s:5:\"count\";i:505;}s:5:\"popup\";a:3:{s:4:\"name\";s:5:\"popup\";s:4:\"slug\";s:5:\"popup\";s:5:\"count\";i:492;}s:5:\"users\";a:3:{s:4:\"name\";s:5:\"users\";s:4:\"slug\";s:5:\"users\";s:5:\"count\";i:492;}s:14:\"contact-form-7\";a:3:{s:4:\"name\";s:14:\"contact form 7\";s:4:\"slug\";s:14:\"contact-form-7\";s:5:\"count\";i:491;}s:5:\"forms\";a:3:{s:4:\"name\";s:5:\"forms\";s:4:\"slug\";s:5:\"forms\";s:5:\"count\";i:486;}s:8:\"calendar\";a:3:{s:4:\"name\";s:8:\"calendar\";s:4:\"slug\";s:8:\"calendar\";s:5:\"count\";i:480;}s:10:\"newsletter\";a:3:{s:4:\"name\";s:10:\"newsletter\";s:4:\"slug\";s:10:\"newsletter\";s:5:\"count\";i:457;}s:10:\"navigation\";a:3:{s:4:\"name\";s:10:\"navigation\";s:4:\"slug\";s:10:\"navigation\";s:5:\"count\";i:453;}s:5:\"photo\";a:3:{s:4:\"name\";s:5:\"photo\";s:4:\"slug\";s:5:\"photo\";s:5:\"count\";i:451;}s:11:\"performance\";a:3:{s:4:\"name\";s:11:\"performance\";s:4:\"slug\";s:11:\"performance\";s:5:\"count\";i:447;}s:9:\"slideshow\";a:3:{s:4:\"name\";s:9:\"slideshow\";s:4:\"slug\";s:9:\"slideshow\";s:5:\"count\";i:444;}s:5:\"stats\";a:3:{s:4:\"name\";s:5:\"stats\";s:4:\"slug\";s:5:\"stats\";s:5:\"count\";i:437;}s:10:\"statistics\";a:3:{s:4:\"name\";s:10:\"statistics\";s:4:\"slug\";s:10:\"statistics\";s:5:\"count\";i:430;}s:6:\"photos\";a:3:{s:4:\"name\";s:6:\"photos\";s:4:\"slug\";s:6:\"photos\";s:5:\"count\";i:426;}s:12:\"social-media\";a:3:{s:4:\"name\";s:12:\"social media\";s:4:\"slug\";s:12:\"social-media\";s:5:\"count\";i:419;}s:8:\"redirect\";a:3:{s:4:\"name\";s:8:\"redirect\";s:4:\"slug\";s:8:\"redirect\";s:5:\"count\";i:418;}s:4:\"news\";a:3:{s:4:\"name\";s:4:\"news\";s:4:\"slug\";s:4:\"news\";s:5:\"count\";i:411;}s:6:\"blocks\";a:3:{s:4:\"name\";s:6:\"blocks\";s:4:\"slug\";s:6:\"blocks\";s:5:\"count\";i:408;}s:12:\"notification\";a:3:{s:4:\"name\";s:12:\"notification\";s:4:\"slug\";s:12:\"notification\";s:5:\"count\";i:407;}s:10:\"shortcodes\";a:3:{s:4:\"name\";s:10:\"shortcodes\";s:4:\"slug\";s:10:\"shortcodes\";s:5:\"count\";i:405;}s:4:\"code\";a:3:{s:4:\"name\";s:4:\"code\";s:4:\"slug\";s:4:\"code\";s:5:\"count\";i:394;}s:8:\"tracking\";a:3:{s:4:\"name\";s:8:\"tracking\";s:4:\"slug\";s:8:\"tracking\";s:5:\"count\";i:393;}s:7:\"plugins\";a:3:{s:4:\"name\";s:7:\"plugins\";s:4:\"slug\";s:7:\"plugins\";s:5:\"count\";i:393;}s:6:\"import\";a:3:{s:4:\"name\";s:6:\"import\";s:4:\"slug\";s:6:\"import\";s:5:\"count\";i:392;}s:9:\"multisite\";a:3:{s:4:\"name\";s:9:\"multisite\";s:4:\"slug\";s:9:\"multisite\";s:5:\"count\";i:391;}s:3:\"url\";a:3:{s:4:\"name\";s:3:\"url\";s:4:\"slug\";s:3:\"url\";s:5:\"count\";i:385;}s:7:\"gateway\";a:3:{s:4:\"name\";s:7:\"gateway\";s:4:\"slug\";s:7:\"gateway\";s:5:\"count\";i:380;}s:4:\"meta\";a:3:{s:4:\"name\";s:4:\"meta\";s:4:\"slug\";s:4:\"meta\";s:5:\"count\";i:378;}s:4:\"list\";a:3:{s:4:\"name\";s:4:\"list\";s:4:\"slug\";s:4:\"list\";s:5:\"count\";i:375;}s:5:\"cache\";a:3:{s:4:\"name\";s:5:\"cache\";s:4:\"slug\";s:5:\"cache\";s:5:\"count\";i:372;}}', 'no');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_wp_attached_file', '2022/03/2020-landscape-1.png'),
(4, 5, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:769;s:4:\"file\";s:28:\"2022/03/2020-landscape-1.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(5, 5, '_starter_content_theme', 'twentytwenty'),
(6, 5, '_customize_draft_post_name', 'otwarte-drzwi-do-nowego-muzeum-sztuki-nowoczesnej'),
(7, 6, '_thumbnail_id', '5'),
(8, 6, '_customize_draft_post_name', 'nowe-muzeum-sztuki-nowoczesnej-otwarlo-swoje-powoje'),
(9, 6, '_customize_changeset_uuid', 'b76c7ce9-65ca-49d0-9a7c-be5acfa510fe'),
(10, 7, '_customize_draft_post_name', 'informacje'),
(11, 7, '_customize_changeset_uuid', 'b76c7ce9-65ca-49d0-9a7c-be5acfa510fe'),
(12, 8, '_customize_draft_post_name', 'kontakt'),
(13, 8, '_customize_changeset_uuid', 'b76c7ce9-65ca-49d0-9a7c-be5acfa510fe'),
(14, 9, '_customize_draft_post_name', 'blog'),
(15, 9, '_customize_changeset_uuid', 'b76c7ce9-65ca-49d0-9a7c-be5acfa510fe');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2022-03-30 19:57:31', '2022-03-30 17:57:31', '<!-- wp:paragraph -->\n<p>Witamy w WordPressie. To jest twój pierwszy wpis. Edytuj go lub usuń, a następnie zacznij pisać!</p>\n<!-- /wp:paragraph -->', 'Witaj, świecie!', '', 'publish', 'open', 'open', '', 'witaj-swiecie', '', '', '2022-03-30 19:57:31', '2022-03-30 17:57:31', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2022-03-30 19:57:31', '2022-03-30 17:57:31', '<!-- wp:paragraph -->\n<p>Przykładowa strona. Strony są inne niż wpisy na blogu, ponieważ nie tylko znajdują się zawsze w jednym miejscu, ale także pojawiają się w menu witryny (w większości motywów). Większość użytkowników zaczyna od strony z informacjami o sobie, która zapozna ich przed odwiedzającymi witrynę. Taka strona może zawierać na przykład taką treść:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Cześć! Za dnia jestem kurierem rowerowym, nocą próbuję swoich sił w aktorstwie, a to jest moja witryna. Mieszkam w Krakowie, mam wspaniałego psa który wabi się Reks i lubię piña coladę (oraz spacery, gdy pada deszcz).</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...albo coś takiego:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Firma XYZ Doohickey została założona w 1971 roku i od tamtej pory dostarcza społeczeństwu dobrej jakości gadżety. Znajdująca się w Gotham City XYZ zatrudnia ponad 2000 osób i robi niesamowite rzeczy dla społeczności Gotham.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Jako nowy użytkownik WordPressa, powinieneś przejść do <a href=\"http://localhost/wordpress/wp-admin/\">swojego kokpitu</a> aby usunąć tę stronę i stworzyć nowe z własną treścią. Dobrej zabawy!</p>\n<!-- /wp:paragraph -->', 'Przykładowa strona', '', 'publish', 'closed', 'open', '', 'przykladowa-strona', '', '', '2022-03-30 19:57:31', '2022-03-30 17:57:31', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2022-03-30 19:57:31', '2022-03-30 17:57:31', '<!-- wp:heading --><h2>Kim jesteśmy</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Adres naszej strony internetowej to: http://localhost/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Komentarze</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Kiedy odwiedzający witrynę zostawia komentarz, zbieramy dane widoczne w formularzu komentowania, jak i adres IP odwiedzającego oraz podpis jego przeglądarki jako pomoc przy wykrywaniu spamu.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Anonimizowany ciąg znaków utworzony z twojego adresu e-mail (zwany też hashem) może zostać przesłany do usługi Gravatar w celu sprawdzenia czy jest używany. Polityka prywatności usługi Gravatar jest dostępna pod adresem: https://automattic.com/privacy/. Po zatwierdzeniu komentarza twój obrazek profilowy jest widoczny publicznie w kontekście twojego komentarza.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli jesteś zarejestrowanym użytkownikiem i wgrywasz na witrynę obrazki, powinieneś unikać przesyłania obrazków z tagami EXIF lokalizacji. Odwiedzający stronę mogą pobrać i odczytać pełne dane lokalizacyjne z obrazków w witrynie.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Ciasteczka</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli zostawisz na naszej witrynie komentarz, będzie można wybrać opcję zapisu twojej nazwy, adresu e-mail i adresu strony internetowej w ciasteczkach, dzięki którym podczas pisania kolejnych komentarzy powyższe informacje będą już dogodnie uzupełnione. Ciasteczka wygasają po roku.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Jeśli odwiedzisz stronę logowania, utworzymy tymczasowe ciasteczko na potrzeby sprawdzenia czy twoja przeglądarka akceptuje ciasteczka. Nie zawiera ono żadnych danych osobistych i zostanie usunięte, kiedy przeglądarka zostanie zamknięta.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Podczas logowania tworzymy dodatkowo kilka ciasteczek potrzebnych do zapisu twoich informacji logowania oraz wybranych opcji ekranu. Ciasteczka logowania wygasają po dwóch dniach, a opcji ekranu po roku. Jeśli zaznaczysz opcję &bdquo;Pamiętaj mnie&rdquo;, logowanie wygaśnie po dwóch tygodniach. Jeśli wylogujesz się ze swojego konta, ciasteczka logowania zostaną usunięte.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Jeśli zmodyfikujesz albo opublikujesz artykuł, w twojej przeglądarce zostanie zapisane dodatkowe ciasteczko. To ciasteczko nie zawiera żadnych danych osobistych, wskazując po prostu na identyfikator przed chwilą edytowanego artykułu. Wygasa ono po 1 dniu.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Osadzone treści z innych witryn</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Artykuły na tej witrynie mogą zawierać osadzone treści (np. filmy, obrazki, artykuły itp.). Osadzone treści z innych witryn zachowują się analogicznie do tego, jakby użytkownik odwiedził bezpośrednio konkretną witrynę.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Witryny mogą zbierać informacje o tobie, używać ciasteczek, dołączać dodatkowe, zewnętrzne systemy śledzenia i monitorować twoje interakcje z osadzonym materiałem, włączając w to śledzenie twoich interakcji z osadzonym materiałem jeśli posiadasz konto i jesteś zalogowany w tamtej witrynie.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Z kim dzielimy się danymi</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli zażądasz zresetowania hasła, twój adres IP zostanie dołączony do wysyłanej wiadomości.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Jak długo przechowujemy twoje dane</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli zostawisz komentarz, jego treść i metadane będą przechowywane przez czas nieokreślony. Dzięki temu jesteśmy w stanie rozpoznawać i zatwierdzać kolejne komentarze automatycznie, bez wysyłania ich do każdorazowej moderacji.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Dla użytkowników którzy zarejestrowali się na naszej stronie internetowej (jeśli tacy są), przechowujemy również informacje osobiste wprowadzone w profilu. Każdy użytkownik może dokonać wglądu, korekty albo skasować swoje informacje osobiste w dowolnej chwili (nie licząc nazwy użytkownika, której nie można zmienić). Administratorzy strony również mogą przeglądać i modyfikować te informacje.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Jakie masz prawa do swoich danych</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli masz konto użytkownika albo dodałeś komentarze w tej witrynie, możesz zażądać dostarczenia pliku z wyeksportowanym kompletem twoich danych osobistych będących w naszym posiadaniu, w tym całość tych dostarczonych przez ciebie. Możesz również zażądać usunięcia przez nas całości twoich danych osobistych w naszym posiadaniu. Nie dotyczy to żadnych danych które jesteśmy zobligowani zachować ze względów administracyjnych, prawnych albo bezpieczeństwa.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Gdzie przesyłamy twoje dane</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Komentarze gości mogą być sprawdzane za pomocą automatycznej usługi wykrywania spamu.</p><!-- /wp:paragraph -->', 'Polityka prywatności', '', 'draft', 'closed', 'open', '', 'polityka-prywatnosci', '', '', '2022-03-30 19:57:31', '2022-03-30 17:57:31', '', 0, 'http://localhost/wordpress/?page_id=3', 0, 'page', '', 0),
(4, 1, '2022-03-30 19:57:41', '0000-00-00 00:00:00', '', 'Automatycznie zapisany szkic', '', 'auto-draft', 'open', 'open', '', '', '', '', '2022-03-30 19:57:41', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=4', 0, 'post', '', 0),
(5, 1, '2022-03-30 19:58:18', '0000-00-00 00:00:00', '', 'Otwarte drzwi do nowego Muzeum Sztuki Nowoczesnej', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2022-03-30 19:58:18', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/wp-content/uploads/2022/03/2020-landscape-1.png', 0, 'attachment', 'image/png', 0),
(6, 1, '2022-03-30 19:58:18', '0000-00-00 00:00:00', '<!-- wp:group {\"align\":\"wide\"} --><div class=\"wp-block-group alignwide\"><div class=\"wp-block-group__inner-container\"><!-- wp:heading {\"align\":\"center\"} --><h2 class=\"has-text-align-center\">Najważniejsze miejsce dla sztuki współczesnej w północnej Szwecji. W lato otwarte codziennie od 10 do 18.</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:columns {\"align\":\"wide\"} --><div class=\"wp-block-columns alignwide\"><!-- wp:column --><div class=\"wp-block-column\"><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://localhost/wordpress/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-1.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>Prace i dni</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Sierpień 1 -- Grudzień 1</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Czytaj dalej</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://localhost/wordpress/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-3.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>Obszar działania</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Październik 1 -- Grudzień 1</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Czytaj dalej</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --><!-- wp:column --><div class=\"wp-block-column\"><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://localhost/wordpress/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-2.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>Życie na które zasługuję</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Sierpień 1 -- Grudzień 1</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Czytaj dalej</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://localhost/wordpress/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-4.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:heading {\"level\":3} --><h3>Od Signac do Matisse</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Październik 1 -- Grudzień 1</p><!-- /wp:paragraph --><!-- wp:button {\"className\":\"is-style-outline\"} --><div class=\"wp-block-button is-style-outline\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Czytaj dalej</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --></div><!-- /wp:columns --><!-- wp:image {\"align\":\"full\",\"id\":37,\"sizeSlug\":\"full\"} --><figure class=\"wp-block-image alignfull size-full\"><img src=\"http://localhost/wordpress/wp-content/themes/twentytwenty/assets/images/2020-landscape-2.png\" alt=\"\" class=\"wp-image-37\"/></figure><!-- /wp:image --><!-- wp:group {\"align\":\"wide\"} --><div class=\"wp-block-group alignwide\"><div class=\"wp-block-group__inner-container\"><!-- wp:heading {\"align\":\"center\",\"textColor\":\"accent\"} --><h2 class=\"has-accent-color has-text-align-center\">&#8220;Cyborgi, jak ustaliła filozof Donna Haraway, nie okazują czci. Nie pamiętają kosmosu.&#8221;</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:paragraph {\"dropCap\":true} --><p class=\"has-drop-cap\">Na siedmiu piętrach efektownej architektury Muzeum Sztuki Nowoczesnej można zobaczyć wystawy międzynarodowej sztuki współczesnej, czasami wraz z historyczną retrospektywą. Zagadnienia egzystencjalne, polityczne i filozoficzne są głównym wątkiem programu. Dla odwiedzających przygotowane zostały różne formy zwiedzania jak np. oprowadzanie z przewodnikiem, spotkania z artystami, wykłady, pokazy filmowe i wiele innych. Wstęp jest wolny.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Wystawy powstają przy współpracy Muzeum Sztuki Nowoczesnej z artystami i muzeami na całym świecie, przez co bardzo często przyciągają uwagę międzynarodową. Muzeum Sztuki Nowoczesnej otrzymało specjalne wyróżnienie Europejskiego Muzeum Roku i było jednym z najlepszych kandydatów do nagrody Szwedzkiego Muzeum Roku, a także do nagrody Muzeum Rady Europy.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p></p><!-- /wp:paragraph --><!-- wp:group {\"customBackgroundColor\":\"#ffffff\",\"align\":\"wide\"} --><div class=\"wp-block-group alignwide has-background\" style=\"background-color:#ffffff\"><div class=\"wp-block-group__inner-container\"><!-- wp:group --><div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:heading {\"align\":\"center\"} --><h2 class=\"has-text-align-center\">Dołącz i otrzymuj ekskluzywne oferty!</h2><!-- /wp:heading --><!-- wp:paragraph {\"align\":\"center\"} --><p class=\"has-text-align-center\">Subskrybenci mają dostęp do ekskluzywnych eksponatów i wyprzedaży. Członkostwo kosztuje 99,99 PLN i jest naliczane raz do roku.</p><!-- /wp:paragraph --><!-- wp:button {\"align\":\"center\"} --><div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/\">Dołącz do klubu</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div></div><!-- /wp:group --><!-- wp:gallery {\"ids\":[39,38],\"align\":\"wide\"} --><figure class=\"wp-block-gallery alignwide columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wordpress/wp-content/themes/twentytwenty/assets/images/2020-square-2.png\" alt=\"\" data-id=\"39\" data-full-url=\"http://localhost/wordpress/wp-content/themes/twentytwenty/assets/images/2020-square-2.png\" data-link=\"assets/images/2020-square-2/\" class=\"wp-image-39\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/wordpress/wp-content/themes/twentytwenty/assets/images/2020-square-1.png\" alt=\"\" data-id=\"38\" data-full-url=\"http://localhost/wordpress/wp-content/themes/twentytwenty/assets/images/2020-square-1.png\" data-link=\"http://localhost/wordpress/wp-content/themes/twentytwenty/assets/images/2020-square-1/\" class=\"wp-image-38\"/></figure></li></ul></figure><!-- /wp:gallery -->', 'Nowe Muzeum Sztuki Nowoczesnej otwarło swoje powoje', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2022-03-30 19:58:18', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?page_id=6', 0, 'page', '', 0),
(7, 1, '2022-03-30 19:58:18', '0000-00-00 00:00:00', '<!-- wp:paragraph -->\n<p>Możesz być artystą, który chciałby przedstawić siebie i swoją pracę, a może to strona firmowa, a sama firma ma misję do opisania.</p>\n<!-- /wp:paragraph -->', 'Informacje', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2022-03-30 19:58:18', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?page_id=7', 0, 'page', '', 0),
(8, 1, '2022-03-30 19:58:18', '0000-00-00 00:00:00', '<!-- wp:paragraph -->\n<p>Strona z podstawowymi informacjami kontaktowymi, takimi jak adres, numer telefonu. Można także spróbować wtyczki, za pomocą której dodamy formularz kontaktowy.</p>\n<!-- /wp:paragraph -->', 'Kontakt', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2022-03-30 19:58:18', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?page_id=8', 0, 'page', '', 0),
(9, 1, '2022-03-30 19:58:18', '0000-00-00 00:00:00', '', 'Blog', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2022-03-30 19:58:18', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?page_id=9', 0, 'page', '', 0),
(10, 1, '2022-03-30 19:58:18', '0000-00-00 00:00:00', '{\n    \"widget_text[2]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjEwOiJPIHdpdHJ5bmllIjtzOjQ6InRleHQiO3M6MTA1OiJNb8W8ZSB0byBiecSHIGRvYnJlIG1pZWpzY2UsIGFieSBwcnplZHN0YXdpxIcgc2llYmllIGkgc3dvasSFIHdpdHJ5bsSZIGx1YiB3eW1pZW5pxIcgemFhbmdhxbxvd2FuZSBvc29ieS4iO3M6NjoiZmlsdGVyIjtiOjE7czo2OiJ2aXN1YWwiO2I6MTt9\",\n            \"title\": \"O witrynie\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"09d5c57f15dda72badf4c8028179d315\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"sidebars_widgets[sidebar-1]\": {\n        \"starter_content\": true,\n        \"value\": [\n            \"text-2\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"widget_text[3]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTo0OntzOjU6InRpdGxlIjtzOjExOiJabmFqZMW6IG5hcyI7czo0OiJ0ZXh0IjtzOjE3NDoiPHN0cm9uZz5BZHJlczwvc3Ryb25nPgp1bC4gTWFyc3phxYJrb3dza2EgMQpXYXJzemF3YSwgMDAtNTAwCgo8c3Ryb25nPkdvZHppbnk8L3N0cm9uZz4KUG9uaWVkemlhxYJlayZtZGFzaDtwacSFdGVrOiA5OjAwJm5kYXNoOzE3OjAwClNvYm90YSAmYW1wOyBOaWVkemllbGE6IDExOjAwJm5kYXNoOzE1OjAwIjtzOjY6ImZpbHRlciI7YjoxO3M6NjoidmlzdWFsIjtiOjE7fQ==\",\n            \"title\": \"Znajd\\u017a nas\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"6d7e84e5e0d8bcad29e725798251a07c\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"sidebars_widgets[sidebar-2]\": {\n        \"starter_content\": true,\n        \"value\": [\n            \"text-3\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menus_created_posts\": {\n        \"starter_content\": true,\n        \"value\": [\n            5,\n            6,\n            7,\n            8,\n            9\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu[-1]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"name\": \"Podstawowy\"\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-1]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"custom\",\n            \"title\": \"Strona g\\u0142\\u00f3wna\",\n            \"url\": \"http://localhost/wordpress/\",\n            \"position\": 0,\n            \"nav_menu_term_id\": -1,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-2]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 7,\n            \"position\": 1,\n            \"nav_menu_term_id\": -1,\n            \"title\": \"Informacje\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-3]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 9,\n            \"position\": 2,\n            \"nav_menu_term_id\": -1,\n            \"title\": \"Blog\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-4]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 8,\n            \"position\": 3,\n            \"nav_menu_term_id\": -1,\n            \"title\": \"Kontakt\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"twentytwenty::nav_menu_locations[primary]\": {\n        \"starter_content\": true,\n        \"value\": -1,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu[-5]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"name\": \"Podstawowy\"\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-5]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"custom\",\n            \"title\": \"Strona g\\u0142\\u00f3wna\",\n            \"url\": \"http://localhost/wordpress/\",\n            \"position\": 0,\n            \"nav_menu_term_id\": -5,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-6]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 7,\n            \"position\": 1,\n            \"nav_menu_term_id\": -5,\n            \"title\": \"Informacje\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-7]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 9,\n            \"position\": 2,\n            \"nav_menu_term_id\": -5,\n            \"title\": \"Blog\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-8]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"type\": \"post_type\",\n            \"object\": \"page\",\n            \"object_id\": 8,\n            \"position\": 3,\n            \"nav_menu_term_id\": -5,\n            \"title\": \"Kontakt\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"twentytwenty::nav_menu_locations[expanded]\": {\n        \"starter_content\": true,\n        \"value\": -5,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu[-9]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"name\": \"Menu odno\\u015bnik\\u00f3w serwis\\u00f3w spo\\u0142eczno\\u015bciowych\"\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-9]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Yelp\",\n            \"url\": \"https://www.yelp.com\",\n            \"position\": 0,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-10]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Facebook\",\n            \"url\": \"https://www.facebook.com/wordpress\",\n            \"position\": 1,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-11]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Twitter\",\n            \"url\": \"https://twitter.com/wordpress\",\n            \"position\": 2,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-12]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Instagram\",\n            \"url\": \"https://www.instagram.com/explore/tags/wordcamp/\",\n            \"position\": 3,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"nav_menu_item[-13]\": {\n        \"starter_content\": true,\n        \"value\": {\n            \"title\": \"Email\",\n            \"url\": \"mailto:wordpress@example.com\",\n            \"position\": 4,\n            \"nav_menu_term_id\": -9,\n            \"object_id\": 0\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"twentytwenty::nav_menu_locations[social]\": {\n        \"starter_content\": true,\n        \"value\": -9,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"show_on_front\": {\n        \"starter_content\": true,\n        \"value\": \"page\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"page_on_front\": {\n        \"starter_content\": true,\n        \"value\": 6,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    },\n    \"page_for_posts\": {\n        \"starter_content\": true,\n        \"value\": 9,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-03-30 17:58:18\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', 'b76c7ce9-65ca-49d0-9a7c-be5acfa510fe', '', '', '2022-03-30 19:58:18', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=10', 0, 'customize_changeset', '', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Bez kategorii', 'bez-kategorii', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'dziad'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"26ba194a0cb7a82d0e50b3859361fdb47c000536d706ef8b73ef5ccf46ab5e7f\";a:4:{s:10:\"expiration\";i:1649872660;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0\";s:5:\"login\";i:1648663060;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'dziad', '$P$BLSyW1eREIrX4fpJ/ZEcwHzueVXW7k.', 'dziad', 'smagaczkrystian1bigzst@gmail.com', 'http://localhost/wordpress', '2022-03-30 17:57:30', '', 0, 'dziad');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indeksy dla tabeli `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indeksy dla tabeli `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indeksy dla tabeli `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indeksy dla tabeli `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indeksy dla tabeli `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indeksy dla tabeli `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indeksy dla tabeli `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indeksy dla tabeli `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indeksy dla tabeli `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indeksy dla tabeli `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indeksy dla tabeli `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT dla tabeli `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Baza danych: `wynajem`
--
CREATE DATABASE IF NOT EXISTS `wynajem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wynajem`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pokoje`
--

CREATE TABLE `pokoje` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(20) NOT NULL,
  `cena` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pokoje`
--

INSERT INTO `pokoje` (`id`, `nazwa`, `cena`) VALUES
(1, 'jednoosobowy', 115),
(2, 'dwuosobowy', 195.5),
(3, 'trzyosobowy', 241.5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `id_rez` int(10) UNSIGNED NOT NULL,
  `id_pok` int(10) UNSIGNED DEFAULT NULL,
  `liczba_dn` int(10) UNSIGNED DEFAULT NULL,
  `sezon` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `rezerwacje`
--

INSERT INTO `rezerwacje` (`id_rez`, `id_pok`, `liczba_dn`, `sezon`) VALUES
(1, 1, 10, 'lato'),
(2, 2, 2, 'zima'),
(3, 1, 5, 'lato'),
(4, 2, 6, 'zima'),
(5, 1, 5, 'lato'),
(6, 3, 9, 'zima'),
(7, 1, 8, 'zima'),
(8, 2, 3, 'lato'),
(9, 1, 3, 'lato'),
(10, 3, 4, 'lato');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pokoje`
--
ALTER TABLE `pokoje`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`id_rez`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
