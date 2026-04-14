-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Apr 2026 pada 10.36
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.10

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
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `pengarang` varchar(100) DEFAULT NULL,
  `penerbit` varchar(100) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `pengarang`, `penerbit`, `stok`) VALUES
(6, 'Belajar PHP', 'Melinda', 'PT. baca buku', 1),
(7, 'Panduan menggunakan komputer', 'Melinda', 'PT. baca buku', 13),
(9, 'Dari Temen Jadi Demen', 'Revan Sanjaya', 'PT. baca baca', 19),
(10, 'She\'s My Future', 'Revan Sanjaya', 'PT. baca baca', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjam`
--

CREATE TABLE `pinjam` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status` enum('dipinjam','kembali') DEFAULT 'dipinjam'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pinjam`
--

INSERT INTO `pinjam` (`id_transaksi`, `id_user`, `id_buku`, `tanggal_pinjam`, `tanggal_kembali`, `status`) VALUES
(16, 13, 6, '2026-02-22', '2026-02-21', 'dipinjam'),
(17, 13, 6, '2026-02-22', NULL, 'dipinjam'),
(21, 13, 6, '2026-02-23', '2026-02-23', 'kembali'),
(22, 13, 6, '2026-02-23', NULL, 'dipinjam'),
(23, 13, 7, '2026-02-23', NULL, 'dipinjam'),
(25, 18, 6, '2026-02-23', NULL, 'dipinjam'),
(26, 18, 7, '2026-02-23', '2026-04-09', 'kembali'),
(27, 18, 9, '2026-02-23', NULL, 'dipinjam'),
(28, 18, 10, '2026-02-23', '2026-04-09', 'kembali'),
(29, 20, 7, '2026-04-09', NULL, 'dipinjam'),
(30, 20, 9, '2026-04-09', '2026-04-09', 'kembali'),
(31, 20, 6, '2026-04-09', '2026-04-09', 'kembali'),
(32, 20, 6, '2026-04-09', '2026-04-09', 'kembali'),
(33, 20, 6, '2026-04-09', NULL, 'dipinjam'),
(34, 18, 6, '2026-04-09', NULL, 'dipinjam'),
(36, 17, 10, '2026-04-13', NULL, 'dipinjam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `role` enum('admin','siswa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_lengkap`, `role`) VALUES
(13, 'eve1524', 'Eve', 'Evelyn Wilton', 'siswa'),
(17, 'kevin5', '5b1b68a9abf4d2cd155c81a9225fd158', 'Kevin Naas', 'siswa'),
(18, 'raka17', 'e5b2a975d9b73165bcc8b5e63ce488ff', 'Raka Surya Nur Maulana', 'siswa'),
(19, 'admin', '471c75ee6643a10934502bdafee198fb', 'Andi Rizki', 'admin'),
(20, 'Rakanur', '471c75ee6643a10934502bdafee198fb', 'Raka Nur', 'siswa');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `pinjam_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
