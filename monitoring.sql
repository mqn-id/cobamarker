-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07 Nov 2017 pada 15.01
-- Versi Server: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monitoring`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `blok`
--

CREATE TABLE `blok` (
  `id_blok` int(50) NOT NULL,
  `name_blok` varchar(255) NOT NULL,
  `telp_blok` varchar(100) NOT NULL,
  `add_blok` longtext NOT NULL,
  `sum_client` int(100) NOT NULL,
  `pusat_client` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `blok`
--

INSERT INTO `blok` (`id_blok`, `name_blok`, `telp_blok`, `add_blok`, `sum_client`, `pusat_client`) VALUES
(1, 'Random Stasiun I', '(023) 131-2032', 'Jl. Siliwangi', 0, '0'),
(2, 'Random Stasiun III', '(021) 102-3512', 'Jati barang coy', 0, '0'),
(3, 'Random Stasiun II', '(023) 122-3511', 'Jl. mekar sucisaa', 0, '0'),
(4, 'Kantor I', '(021) 539-2322', 'Jl. jalan', 0, '0'),
(6, 'Kantor III', '(021) 619-2312', 'Entahlah', 0, '0'),
(11, 'Kantor DAOP Tiga', '(100) 009-9992', 'Kejaksanan', 0, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `client`
--

CREATE TABLE `client` (
  `id_client` int(50) NOT NULL,
  `id_blok` int(50) NOT NULL,
  `ip_client` varchar(50) NOT NULL,
  `name_client` varchar(255) NOT NULL,
  `status_client` enum('Connected','Disconnected','Destination net unreachable','Destination host unreachable','Request timed out') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `client`
--

INSERT INTO `client` (`id_client`, `id_blok`, `ip_client`, `name_client`, `status_client`) VALUES
(1, 11, '10.1.16.22', 'Asmi [W]', 'Disconnected'),
(2, 11, '10.1.17.21', 'Galur [E]', 'Disconnected'),
(3, 11, '10.1.17.22', 'Galur [W]', 'Disconnected'),
(4, 11, '10.1.18.22', 'Rawa Buaya [W]', 'Disconnected'),
(5, 11, '10.1.19.22', 'Grogol [W]', 'Disconnected'),
(6, 11, '10.1.23.21', 'TU GAS [E]', 'Disconnected'),
(7, 11, '10.1.23.22', 'TU GAS [W]', 'Disconnected'),
(8, 11, '10.1.24.21', 'Layur [E]', 'Disconnected'),
(9, 11, '10.1.24.22', 'Layur [W]', 'Disconnected'),
(10, 11, '10.1.25.21', 'Pemuda Rawamangun [E]', 'Disconnected'),
(11, 11, '10.1.25.22', 'Pemuda Rawamangun [W]', 'Disconnected'),
(12, 11, '10.1.26.21', 'Valedrome [E]', 'Disconnected'),
(13, 11, '10.1.26.22', 'Valedrome [W]', 'Disconnected'),
(14, 11, '10.1.27.21', 'Sunan Giri [E]', 'Disconnected'),
(15, 11, '10.1.28.21', 'UNJ [E]', 'Disconnected'),
(16, 11, '10.1.28.22', 'UNJ [W]', 'Disconnected'),
(17, 11, '10.1.29.21', 'Pramuka BPKP [E]', 'Disconnected'),
(18, 11, '10.1.29.22', 'Pramuka BPKP [W]', 'Disconnected'),
(19, 11, '10.1.31.21', 'Utan Kayu [E]', 'Disconnected'),
(20, 11, '10.1.32.21', 'Pasar Genjing [E]', 'Disconnected'),
(21, 11, '10.1.35.21', 'Pasar Rumput [E]', 'Disconnected'),
(22, 11, '10.1.35.22', 'Pasar Rumput [W]', 'Disconnected'),
(23, 11, '10.1.36.21', 'Halimun [E]', 'Disconnected'),
(24, 11, '10.1.36.22', 'Halimun [W]', 'Disconnected'),
(25, 11, '10.1.43.22', 'Matraman [W]', 'Disconnected'),
(26, 11, '10.1.43.24', 'Matraman [S]', 'Disconnected'),
(27, 11, '10.1.43.25', 'Matraman [N]', 'Disconnected'),
(28, 11, '10.1.44.21', 'Salemba Carolus [E]', 'Disconnected'),
(29, 11, '10.1.45.21', 'UI Salemba [E]', 'Disconnected'),
(30, 11, '10.1.45.22', 'UI Salemba [W]', 'Disconnected'),
(31, 11, '10.1.47.22', 'Pal Putih [W]', 'Connected'),
(32, 11, '10.1.49.21', 'Budi Utomo [E]', 'Connected'),
(33, 11, '10.1.50.21', 'Pasar Baru [E]', 'Connected'),
(34, 11, '10.1.50.22', 'Pasar Baru [W]', 'Connected'),
(35, 11, '10.1.52.21', 'Pademangan [E]', 'Connected'),
(36, 11, '10.1.52.22', 'Pademangan [W]', 'Connected'),
(37, 11, '10.1.58.22', 'SMK 57 [N]', 'Connected'),
(38, 11, '10.1.62.21', 'Warung Jati [S]', 'Connected'),
(39, 11, '10.1.63.21', 'Imigrasi [S]', 'Destination host unreachable'),
(40, 11, '10.1.64.21', 'Duren Tiga [S]', 'Destination host unreachable'),
(41, 11, '10.1.64.22', 'Duren Tiga [N]', 'Destination host unreachable'),
(42, 11, '10.1.65.21', '09  - Mampang Prapatan [S]', 'Destination host unreachable'),
(43, 11, '10.1.65.22', '09  - Mampang Prapatan [N]', 'Destination host unreachable'),
(44, 11, '10.1.66.21', 'Kuningan Timur [S]', 'Disconnected'),
(45, 11, '10.1.66.22', 'Kuningan Timur [N]', 'Destination host unreachable'),
(46, 11, '10.1.67.21', 'Patra Kuningan [S]', 'Connected'),
(47, 11, '10.1.67.22', 'Patra Kuningan [N]', 'Disconnected'),
(48, 11, '10.1.70.21', 'Karet Kuningan [S]', 'Connected'),
(49, 11, '10.1.70.22', 'Karet Kuningan [N]', 'Connected'),
(50, 11, '10.1.71.21', 'Kuningan Madya Aini [S]', 'Connected'),
(51, 11, '10.1.72.21', 'Setiabudi Utara [S]', 'Connected'),
(52, 11, '10.1.72.22', 'Setiabudi Utara [N]', 'Connected'),
(53, 11, '10.1.140.58', 'Kampung Melayu [S]', 'Connected'),
(54, 11, '10.1.140.59', 'Kampung Melayu [N]', 'Connected'),
(55, 11, '10.1.140.2', 'Bidara Cina [S]', 'Destination host unreachable'),
(56, 11, '10.1.140.3', 'Bidara Cina [S]', 'Destination host unreachable'),
(57, 11, '10.1.140.4', 'Cawang Otista [S]', 'Connected'),
(58, 11, '10.1.140.5', 'Cawang Otista [N]', 'Connected'),
(59, 11, '10.1.140.6', 'BNN [S]', 'Connected'),
(60, 11, '10.1.140.7', 'BNN [N]', 'Connected'),
(61, 11, '10.1.140.9', 'Cawang UKI [N]', 'Connected'),
(62, 11, '10.1.140.12', 'PGC Cililitan [S]', 'Connected'),
(63, 11, '10.1.140.13', 'PGC Cililitan [N]', 'Connected'),
(64, 11, '10.1.140.15', 'Pasar Induk [N]', 'Connected'),
(65, 11, '10.1.140.16', 'RS. Harapan Bunda [S]', 'Destination host unreachable'),
(66, 11, '10.1.140.30', 'FO. Raya Bogor [S]', 'Connected'),
(67, 11, '10.1.140.31', 'FO. Raya Bogor [N]', 'Connected'),
(68, 11, '10.1.140.19', 'Tanah Merdeka [N]', 'Connected'),
(69, 11, '10.1.78.21', 'Pond Indah 2 [S]', 'Connected'),
(70, 11, '10.1.78.22', 'Pond Indah 2 [N]', 'Connected'),
(71, 11, '10.1.140.24', 'Pondok Indah 1 [S]', 'Destination host unreachable'),
(72, 11, '10.1.140.25', 'Pondok Indah 1 [N]', 'Destination host unreachable'),
(73, 11, '10.1.140.26', 'Tanah Kusir Kodim [S]', 'Connected'),
(74, 11, '10.1.140.28', 'Kebayoran Lama Bungur [S]', 'Disconnected'),
(75, 11, '10.1.140.34', 'Permata Hijau [S]', 'Connected'),
(76, 11, '10.1.140.35', 'Permata Hijau [N]', 'Connected'),
(77, 11, '10.1.140.36', 'RS Medika Permata Hijau [S]', 'Connected'),
(78, 11, '10.1.140.37', 'RS Medika Permata Hijau [N]', 'Connected'),
(79, 11, '10.1.140.38', 'Pos Pengumben [S]', 'Connected'),
(80, 11, '10.1.140.39', 'Pos Pengumben [N]', 'Connected'),
(81, 11, '10.1.140.41', 'Kebon Jeruk [N]', 'Destination host unreachable'),
(82, 11, '10.1.140.42', 'Duri Kepa [S]', 'Destination host unreachable'),
(83, 11, '10.1.140.43', 'Duri Kepa [N]', 'Connected'),
(84, 11, '10.1.140.44', 'Kedoya Raya/Assidiqiyah [S]', 'Connected'),
(85, 11, '10.1.140.45', 'Kedoya Raya/Assidiqiyah [N]', 'Connected'),
(86, 11, '10.1.140.46', 'Kedoya Green Garden [S]', 'Connected'),
(87, 11, '10.1.140.47', 'Kedoya Green Garden [N]', 'Connected'),
(88, 11, '10.1.140.49', 'Grogol 2 [N]', 'Connected'),
(89, 11, '10.1.140.54', 'Rs. Tarakan [S]', 'Connected'),
(90, 11, '10.1.140.55', 'Rs. Tarakan [N]', 'Connected'),
(91, 11, '10.1.140.56', 'Petojo [S]', 'Connected'),
(92, 11, '10.1.140.57', 'Petojo [N]', 'Connected'),
(93, 11, '10.1.140.60', 'Harmoni [S]', 'Connected'),
(94, 11, '10.1.140.61', 'Harmoni [N]', 'Connected');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id_log` int(10) NOT NULL,
  `id_client` varchar(100) NOT NULL,
  `date_log` varchar(25) NOT NULL,
  `hour_log` varchar(25) NOT NULL,
  `status_log` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log`
--

INSERT INTO `log` (`id_log`, `id_client`, `date_log`, `hour_log`, `status_log`) VALUES
(96, '5', '05 Feb 2016', '20', 0),
(97, '26', '05 Feb 2016', '20', 0),
(98, '16', '05 Feb 2016', '19', 0),
(110, '23', '05 Feb 2016', '20', 0),
(111, '21', '05 Feb 2016', '20', 0),
(112, '14', '05 Feb 2016', '20', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penanda`
--

CREATE TABLE `penanda` (
  `id_client` int(11) NOT NULL,
  `latitude` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `nama_halte` varchar(255) NOT NULL,
  `koridor` enum('2','3','4','5','6','7','8') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penanda`
--

INSERT INTO `penanda` (`id_client`, `latitude`, `longitude`, `nama_halte`, `koridor`) VALUES
(1, -6.171971, 106.888840, 'Asmi [W]', '2'),
(2, -6.174400, 106.854752, 'Galur [E]', '2'),
(3, -6.174347, 106.854721, 'Galur [W]', '2'),
(4, -6.153973, 106.726349, 'Rawa Buaya [W]', '3'),
(5, -6.166773, 106.789680, 'Grogol [W]', '3'),
(6, -6.192331, 106.904991, 'TU GAS [E]', '4'),
(7, -6.192300, 106.904968, 'TU GAS [W]', '4'),
(8, -6.193488, 106.899017, 'Layur [E]', '4'),
(9, -6.193519, 106.899017, 'Layur [W]', '4'),
(10, -6.193484, 106.891617, 'Pemuda Rawamangun [E]', '4'),
(11, -6.193439, 106.891647, 'Pemuda Rawamangun [W]', '4'),
(12, -6.193406, 106.888168, 'Valedrome [E]', '4'),
(13, -6.193456, 106.888176, 'Valedrome [W]', '4'),
(14, -6.193230, 106.883667, 'Sunan Giri [E]', '4'),
(15, -6.192866, 106.880295, 'UNJ [E]', '4'),
(16, -6.192894, 106.880280, 'UNJ [W]', '4'),
(17, -6.192148, 106.874016, 'Pramuka BPKP [E]', '4'),
(18, -6.192173, 106.874016, 'Pramuka BPKP [W]', '4'),
(19, -6.192718, 106.864594, 'Utan Kayu [E]', '4'),
(20, -6.194445, 106.860893, 'Pasar Genjing [E]', '4'),
(21, -6.207072, 106.841263, 'Pasar Rumput [E]', '4'),
(22, -6.207195, 106.841263, 'Pasar Rumput [W]', '4'),
(23, -6.205108, 106.833397, 'Halimun [E]', '4'),
(24, -6.205117, 106.833389, 'Halimun [W]', '4'),
(25, -6.200009, 106.854622, 'Matraman [W]', '5'),
(26, -6.199528, 106.853996, 'Matraman [S]', '5'),
(27, -6.200009, 106.854622, 'Matraman [N]', '5'),
(28, -6.196832, 106.851112, 'Salemba Carolus [E]', '5'),
(29, -6.193657, 106.848953, 'UI Salemba [E]', '5'),
(30, -6.193530, 106.849136, 'UI Salemba [W]', '5'),
(31, -6.184508, 106.843826, 'Pal Putih [W]', '5'),
(32, -6.165980, 106.839081, 'Budi Utomo [E]', '5'),
(33, -6.162363, 106.838165, 'Pasar Baru [E]', '5'),
(34, -6.162460, 106.838104, 'Pasar Baru [W]', '5'),
(35, -6.133706, 106.831635, 'Pademangan [E]', '5'),
(36, -6.133769, 106.831665, 'Pademangan [W]', '5'),
(37, -6.291147, 106.823509, 'SMK 57 [N]', '6'),
(38, -6.262245, 106.829651, 'Warung Jati [S]', '6'),
(39, -6.256707, 106.827980, 'Imigrasi [S]', '6'),
(40, -6.252320, 106.826927, 'Duren Tiga [S]', '6'),
(41, -6.251931, 106.826866, 'Duren Tiga [N]', '6'),
(42, -6.242126, 106.825768, '09  - Mampang Prapatan [S]', '6'),
(43, -6.242156, 106.825630, '09  - Mampang Prapatan [N]', '6'),
(44, -6.236046, 106.827904, 'Kuningan Timur [S]', '6'),
(45, -6.235969, 106.827705, 'Kuningan Timur [N]', '6'),
(46, -6.233455, 106.831436, 'Patra Kuningan [S]', '6'),
(47, -6.233268, 106.831223, 'Patra Kuningan [N]', '6'),
(48, -6.217293, 106.830902, 'Karet Kuningan [S]', '6'),
(49, -6.217424, 106.830826, 'Karet Kuningan [N]', '6'),
(50, -6.212827, 106.830902, 'Kuningan Madya Aini [S]', '6'),
(51, -6.208266, 106.829689, 'Setiabudi Utara [S]', '6'),
(52, -6.208008, 106.829826, 'Setiabudi Utara [N]', '6'),
(53, -6.224909, 106.866463, 'Kampung Melayu [S]', '7'),
(54, -6.225011, 106.867126, 'Kampung Melayu [N]', '7'),
(55, -6.229898, 106.867287, 'Bidara Cina [S]', '7'),
(56, -6.229905, 106.867134, 'Bidara Cina [S]', '7'),
(57, -6.243981, 106.868698, 'Cawang Otista [S]', '7'),
(58, -6.243928, 106.868530, 'Cawang Otista [N]', '7'),
(59, -6.246197, 106.872101, 'BNN [S]', '7'),
(60, -6.246058, 106.872147, 'BNN [N]', '7'),
(61, -6.250342, 106.873589, 'Cawang UKI [N]', '7'),
(62, -6.262340, 106.866516, 'PGC Cililitan [S]', '7'),
(63, -6.262350, 106.866516, 'PGC Cililitan [N]', '7'),
(64, -6.294283, 106.871971, 'Pasar Induk [N]', '7'),
(65, -6.302068, 106.867973, 'RS. Harapan Bunda [S]', '7'),
(66, -6.306548, 106.865608, 'FO. Raya Bogor [S]', '7'),
(67, -6.306492, 106.865646, 'FO. Raya Bogor [N]', '7'),
(68, -6.308227, 106.874153, 'Tanah Merdeka [N]', '7'),
(69, -6.267219, 106.783646, 'Pond Indah 2 [S]', '8'),
(70, -6.267219, 106.783592, 'Pond Indah 2 [N]', '8'),
(71, -6.287344, 106.779228, 'Pondok Indah 1 [S]', '8'),
(72, -6.287371, 106.779259, 'Pondok Indah 1 [N]', '8'),
(73, -6.257110, 106.781746, 'Tanah Kusir Kodim [S]', '8'),
(74, -6.252892, 106.781593, 'Kebayoran Lama Bungur [S]', '8'),
(75, -6.221291, 106.783119, 'Permata Hijau [S]', '8'),
(76, -6.221454, 106.783089, 'Permata Hijau [N]', '8'),
(77, -6.218253, 106.777473, 'RS Medika Permata Hijau [S]', '8'),
(78, -6.218310, 106.777435, 'RS Medika Permata Hijau [N]', '8'),
(79, -6.212943, 106.772270, 'Pos Pengumben [S]', '8'),
(80, -6.212992, 106.772316, 'Pos Pengumben [N]', '8'),
(81, -6.194280, 106.768890, 'Kebon Jeruk [N]', '8'),
(82, -6.185334, 106.768433, 'Duri Kepa [S]', '8'),
(83, -6.185387, 106.768463, 'Duri Kepa [N]', '8'),
(84, -6.174514, 106.765869, 'Kedoya Raya/Assidiqiyah [S]', '8'),
(85, -6.174493, 106.765831, 'Kedoya Raya/Assidiqiyah [N]', '8'),
(86, -6.164435, 106.762993, 'Kedoya Green Garden [S]', '8'),
(87, -6.164478, 106.762985, 'Kedoya Green Garden [N]', '8'),
(88, -6.166751, 106.789749, 'Grogol 2 [N]', '8'),
(89, -6.171133, 106.810066, 'Rs. Tarakan [S]', '8'),
(90, -6.171062, 106.810074, 'Rs. Tarakan [N]', '8'),
(91, -6.169991, 106.816971, 'Petojo [S]', '8'),
(92, -6.169947, 106.816963, 'Petojo [N]', '8'),
(93, -6.165841, 106.820435, 'Harmoni [S]', '8'),
(94, -6.165822, 106.820541, 'Harmoni [N]', '8');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` enum('Superadmin','Admin') NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`username`, `password`, `level`, `img`) VALUES
('2013470127', '2013470127', 'Superadmin', 'ilmudetil.png'),
('admin', '1', 'Admin', 'desi.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blok`
--
ALTER TABLE `blok`
  ADD PRIMARY KEY (`id_blok`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`,`ip_client`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `penanda`
--
ALTER TABLE `penanda`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blok`
--
ALTER TABLE `blok`
  MODIFY `id_blok` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `penanda`
--
ALTER TABLE `penanda`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
