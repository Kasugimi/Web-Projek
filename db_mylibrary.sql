-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 10, 2026 at 08:26 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan_sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `pengarang` varchar(100) DEFAULT NULL,
  `penerbit` varchar(100) DEFAULT NULL,
  `stok` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `pengarang`, `penerbit`, `stok`) VALUES
(6, 'Belajar PHP', 'Melinda', 'PT. baca buku', 0),
(7, 'Panduan menggunakan komputer', 'Melinda', 'PT. baca buku', 13),
(9, 'Dari Temen Jadi Demen', 'Revan Sanjaya', 'PT. baca baca', 17),
(10, 'She\'s My Future', 'Revan Sanjaya', 'PT. baca baca', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `id_transaksi` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_buku` int DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status` enum('dipinjam','kembali') DEFAULT 'dipinjam'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`id_transaksi`, `id_user`, `id_buku`, `tanggal_pinjam`, `tanggal_kembali`, `status`) VALUES
(28, 18, 10, '2026-02-23', '2026-04-09', 'kembali'),
(29, 20, 7, '2026-04-09', NULL, 'dipinjam'),
(37, 21, 9, '2026-04-10', NULL, 'dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `role` enum('admin','siswa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_lengkap`, `role`) VALUES
(18, 'raka17', 'e5b2a975d9b73165bcc8b5e63ce488ff', 'Raka Surya Nur Maulana', 'siswa'),
(19, 'admin', '471c75ee6643a10934502bdafee198fb', 'Andi Rizki', 'admin'),
(20, 'Rakanur', '471c75ee6643a10934502bdafee198fb', 'Raka Nur', 'siswa'),
(21, 'andi', '471c75ee6643a10934502bdafee198fb', 'Andi', 'siswa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pinjam`
--
ALTER TABLE `pinjam`
  MODIFY `id_transaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `pinjam_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
