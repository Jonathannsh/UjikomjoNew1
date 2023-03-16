-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Mar 2023 pada 02.17
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk_jonathan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` char(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `username`, `password`, `telp`, `level`) VALUES
('0001', 'Jonathan', 'jonathan', '78842815248300fa6ae79f7776a5080a', '081982779001', 'masyarakat'),
('0002', 'Faidan', 'faidan', '634f5911e7d436cfbb2b3e338275dfdf', '081982779002', 'masyarakat'),
('0003', 'Cadera', 'cadera', '9c9c461e325ae95a7abace84c7835f72', '081982779003', 'masyarakat'),
('0004', 'Haidan', 'haidan', '18e82345988664b43b636152113fb2e9', '081982779004', 'masyarakat'),
('0005', 'Legzed', 'legzed', '79b48202648743b06f6134c56e39b63b', '081982779005', 'masyarakat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tgl_pengaduan` date NOT NULL,
  `nik` char(16) NOT NULL,
  `judul_laporan` varchar(50) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('0','proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `judul_laporan`, `isi_laporan`, `foto`, `status`) VALUES
(6, '2023-03-10', '0001', 'Sampah di Sungai', 'Sampah membuat air disekitar menjadi tidak jernih\r\n\r\n', '463-Sampah.jpg', 'selesai'),
(7, '2023-03-10', '0001', 'Macet', 'Terlalu banyak kendaraan yang tidak mematuhi rambu lalu lintas\r\n', '891-Macet.jpg', 'proses'),
(8, '2023-03-10', '0001', 'Data Palsu', 'Masyarakat sekitar memiliki keresahan tentang Data Palsu yang mulai menyebar\r\n', '123-Data palsu.jpg', 'selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp`, `level`) VALUES
(1, 'Frezz', 'frezz', 'afb91ef692fd08c445e8cb1bab2ccf9c', '081345235421', 'admin'),
(2, 'Jowzz', 'jowzz', '21232f297a57a5a743894a0e4a801fc3', '081345235422', 'admin'),
(3, 'Kowyz', 'kowyz', 'bf51ea4e83b4780ee987004dbf931dc2', '081345235423', 'admin'),
(4, 'Loytz', 'loytz', 'c9a04c06c900c70a5d2f6425d47ec4a6', '081345235424', 'petugas'),
(5, 'Jetzz', 'jetzz', 'b8bd308b8ec935a37d60877d42057758', '081345235425', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_pengaduan` int(11) NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`) VALUES
(13, 8, '2023-03-10', 'Kami akan menindak tegas bagi para pengguna data palsu agar kejadian ini tidak terulang!', 2),
(14, 6, '2023-03-10', 'Kami sudah mengirimkan bala bantuan agar sungai dapat kembali bersih!', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
