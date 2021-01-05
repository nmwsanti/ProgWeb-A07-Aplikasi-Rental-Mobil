-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2021 at 02:14 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(3) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email_admin` varchar(50) NOT NULL,
  `password` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_admin`, `username`, `email_admin`, `password`) VALUES
(1, 'admin', 'admin', 'admin123@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mobil`
--

CREATE TABLE `tb_mobil` (
  `id_mobil` int(10) NOT NULL,
  `gambar` varchar(50) NOT NULL,
  `merk_mobil` varchar(50) NOT NULL,
  `nama_mobil` varchar(50) NOT NULL,
  `warna_mobil` varchar(50) NOT NULL,
  `plat_mobil` varchar(50) NOT NULL,
  `harga_mobil` int(12) NOT NULL,
  `stok_mobil` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_mobil`
--

INSERT INTO `tb_mobil` (`id_mobil`, `gambar`, `merk_mobil`, `nama_mobil`, `warna_mobil`, `plat_mobil`, `harga_mobil`, `stok_mobil`) VALUES
(1, 'avanza.jpg', 'Toyota', 'Avanza', 'Putih', 'L 1543 KD', 600000, 2),
(2, 'calya.jpg', 'Toyota', 'Calya', 'Merah', 'B 1954 CC', 600000, 3),
(3, 'ertiga.jpg', 'Suzuki', 'Ertiga', 'Silver', 'L 2745 MK', 560000, 2),
(4, 'sigra.jpg', 'Daihatsu', 'Sigra', 'Merah', 'L 1234 SY', 555000, 2),
(5, 'xenia.jpg', 'Daihatsu', 'Xenia', 'Putih', 'L 1386 FG', 675000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_registrasi`
--

CREATE TABLE `tb_registrasi` (
  `id_regis` int(10) NOT NULL,
  `tgl_regis` date NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `ktp_user` varchar(50) NOT NULL,
  `merk_mobil` varchar(50) NOT NULL,
  `nama_mobil` varchar(50) NOT NULL,
  `no_plat` varchar(50) NOT NULL,
  `warna_mobil` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_registrasi`
--

INSERT INTO `tb_registrasi` (`id_regis`, `tgl_regis`, `nama_user`, `ktp_user`, `merk_mobil`, `nama_mobil`, `no_plat`, `warna_mobil`) VALUES
(1, '2021-01-02', 'Yustiani', '3578051234678905', 'Toyota', 'Avanza', 'L 1543 KD', 'Putih');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(10) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `ktp_user` varchar(50) NOT NULL,
  `alamat_user` varchar(100) NOT NULL,
  `tempatlahir_user` varchar(50) NOT NULL,
  `tgllahir_user` date NOT NULL,
  `notlp_user` varchar(15) NOT NULL,
  `username_user` varchar(50) NOT NULL,
  `pass_user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `ktp_user`, `alamat_user`, `tempatlahir_user`, `tgllahir_user`, `notlp_user`, `username_user`, `pass_user`) VALUES
(1, 'Yustiani', '3578051234678905', 'Karah no 1000, Surabaya, Jawa Timur', 'Bandung', '1999-04-26', '081234567890', 'yustiani1', 'janganlupadoa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_mobil`
--
ALTER TABLE `tb_mobil`
  ADD PRIMARY KEY (`id_mobil`),
  ADD KEY `plat_mobil` (`plat_mobil`);

--
-- Indexes for table `tb_registrasi`
--
ALTER TABLE `tb_registrasi`
  ADD PRIMARY KEY (`id_regis`),
  ADD KEY `ktp_user` (`ktp_user`,`no_plat`),
  ADD KEY `no_plat` (`no_plat`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `ktp_user` (`ktp_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_mobil`
--
ALTER TABLE `tb_mobil`
  MODIFY `id_mobil` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_registrasi`
--
ALTER TABLE `tb_registrasi`
  MODIFY `id_regis` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_registrasi`
--
ALTER TABLE `tb_registrasi`
  ADD CONSTRAINT `tb_registrasi_ibfk_1` FOREIGN KEY (`no_plat`) REFERENCES `tb_mobil` (`plat_mobil`),
  ADD CONSTRAINT `tb_registrasi_ibfk_2` FOREIGN KEY (`ktp_user`) REFERENCES `tb_user` (`ktp_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
