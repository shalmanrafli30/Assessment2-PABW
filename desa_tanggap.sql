-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Bulan Mei 2024 pada 03.29
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `desa_tanggap`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `judul_berita` varchar(255) NOT NULL,
  `isi_berita` text NOT NULL,
  `tanggal_berita` datetime NOT NULL,
  `foto_berita` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id_berita`, `judul_berita`, `isi_berita`, `tanggal_berita`, `foto_berita`) VALUES
(1, 'Posyandu Desa Melakukan Pemeriksaan Kesehatan Gratis', 'Posyandu Desa Melakukan Pemeriksaan Kesehatan Gratis bagi Balita dan Ibu Hamil pada Hari Minggu, 12 Mei 2024.', '2024-05-09 13:00:00', 'foto_posyandu1.jpg'),
(2, 'Pembangunan Jalan Desa Segera Dimulai', 'Pemerintah desa akan segera memulai pembangunan jalan di beberapa wilayah desa.', '2024-05-09 14:00:00', 'foto_jalan1.jpg'),
(3, 'Vaksinasi Covid-19 Dosis Ketiga Tersedia di Puskesmas', 'Puskesmas desa menyediakan layanan vaksinasi Covid-19 dosis ketiga bagi masyarakat umum.', '2024-05-09 15:00:00', 'foto_vaksin.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `diskusi_laporan`
--

CREATE TABLE `diskusi_laporan` (
  `id_diskusi` int(11) NOT NULL,
  `id_laporan` int(11) NOT NULL,
  `id_masyarakat` int(11) NOT NULL,
  `isi_diskusi` text NOT NULL,
  `tanggal_diskusi` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `diskusi_laporan`
--

INSERT INTO `diskusi_laporan` (`id_diskusi`, `id_laporan`, `id_masyarakat`, `isi_diskusi`, `tanggal_diskusi`) VALUES
(1, 1, 2, 'Saya juga mengalami masalah dengan sampah menumpuk di jalan. Semoga segera ditindaklanjuti.', '2024-05-09 10:30:00'),
(2, 1, 3, 'Saya sudah melaporkan masalah ini ke dinas terkait beberapa hari yang lalu, tapi belum ada tanggapan.', '2024-05-09 11:15:00'),
(3, 2, 1, 'Terima kasih informasinya. Saya akan segera periksa lampu jalan tersebut.', '2024-05-09 11:30:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int(11) NOT NULL,
  `id_masyarakat` int(11) NOT NULL,
  `isi_feedback` text NOT NULL,
  `tanggal_feedback` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak_darurat`
--

CREATE TABLE `kontak_darurat` (
  `id_kontak` int(11) NOT NULL,
  `nama_kontak` varchar(255) NOT NULL,
  `no_telepon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kontak_darurat`
--

INSERT INTO `kontak_darurat` (`id_kontak`, `nama_kontak`, `no_telepon`) VALUES
(1, 'Polisi', '110'),
(2, 'Ambulans', '118'),
(3, 'Pemadam Kebakaran', '113');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` int(11) NOT NULL,
  `id_masyarakat` int(11) NOT NULL,
  `kategori_laporan` varchar(255) NOT NULL,
  `judul_laporan` varchar(255) NOT NULL,
  `deskripsi_laporan` text NOT NULL,
  `tanggal_laporan` datetime NOT NULL,
  `status_laporan` enum('Baru','Sedang Diproses','Selesai') NOT NULL DEFAULT 'Baru',
  `lampiran` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `id_masyarakat`, `kategori_laporan`, `judul_laporan`, `deskripsi_laporan`, `tanggal_laporan`, `status_laporan`, `lampiran`) VALUES
(1, 1, 'Sampah', 'Sampah menumpuk di jalan', 'Jalan depan rumah saya penuh dengan sampah yang sudah berhari-hari tidak diangkut.', '2024-05-09 10:00:00', 'Baru', 'foto_sampah1.jpg'),
(2, 2, 'Penerangan Jalan', 'Lampu jalan mati', 'Lampu jalan di depan rumah saya sudah mati beberapa hari ini.', '2024-05-09 11:00:00', 'Baru', 'foto_lampu_mati1.jpg'),
(3, 3, 'Fasilitas Umum', 'Taman rusak', 'Peralatan bermain di taman dekat rumah saya rusak.', '2024-05-09 12:00:00', 'Baru', 'foto_taman_rusak1.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat_desa`
--

CREATE TABLE `masyarakat_desa` (
  `id_masyarakat` int(11) NOT NULL,
  `NIK` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `masyarakat_desa`
--

INSERT INTO `masyarakat_desa` (`id_masyarakat`, `NIK`, `nama`, `username`, `password`, `alamat`, `no_telepon`, `email`) VALUES
(1, '3200012345678901', 'Budi Setiawan', 'budisetiawan', 'rahasia123', 'Jl. Merdeka No. 1', '08123456789', 'budisetiawan@gmail.com'),
(2, '3200023456789012', 'Ani Lestari', 'anilestari', 'rahasia456', 'Jl. Sudirman No. 2', '08523456789', 'anilestari@yahoo.com'),
(3, '3200034567890123', 'Cipto Raharjo', 'ciptoraharjo', 'rahasia789', 'Jl. Diponegoro No. 3', '08723456789', 'ciptoraharjo@hotmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengurusan_dokumen`
--

CREATE TABLE `pengurusan_dokumen` (
  `id_pengurusan_dokumen` int(11) NOT NULL,
  `id_masyarakat` int(11) NOT NULL,
  `jenis_dokumen` varchar(255) NOT NULL,
  `status_pengurusan` enum('Sedang Diproses','Selesai') NOT NULL DEFAULT 'Sedang Diproses',
  `tanggal_pengurusan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indeks untuk tabel `diskusi_laporan`
--
ALTER TABLE `diskusi_laporan`
  ADD PRIMARY KEY (`id_diskusi`),
  ADD KEY `id_laporan` (`id_laporan`),
  ADD KEY `id_masyarakat` (`id_masyarakat`);

--
-- Indeks untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD KEY `id_masyarakat` (`id_masyarakat`);

--
-- Indeks untuk tabel `kontak_darurat`
--
ALTER TABLE `kontak_darurat`
  ADD PRIMARY KEY (`id_kontak`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_masyarakat` (`id_masyarakat`);

--
-- Indeks untuk tabel `masyarakat_desa`
--
ALTER TABLE `masyarakat_desa`
  ADD PRIMARY KEY (`id_masyarakat`),
  ADD UNIQUE KEY `NIK` (`NIK`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `pengurusan_dokumen`
--
ALTER TABLE `pengurusan_dokumen`
  ADD PRIMARY KEY (`id_pengurusan_dokumen`),
  ADD KEY `id_masyarakat` (`id_masyarakat`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `diskusi_laporan`
--
ALTER TABLE `diskusi_laporan`
  MODIFY `id_diskusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kontak_darurat`
--
ALTER TABLE `kontak_darurat`
  MODIFY `id_kontak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `masyarakat_desa`
--
ALTER TABLE `masyarakat_desa`
  MODIFY `id_masyarakat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pengurusan_dokumen`
--
ALTER TABLE `pengurusan_dokumen`
  MODIFY `id_pengurusan_dokumen` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `diskusi_laporan`
--
ALTER TABLE `diskusi_laporan`
  ADD CONSTRAINT `diskusi_laporan_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`),
  ADD CONSTRAINT `diskusi_laporan_ibfk_2` FOREIGN KEY (`id_masyarakat`) REFERENCES `masyarakat_desa` (`id_masyarakat`);

--
-- Ketidakleluasaan untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_masyarakat`) REFERENCES `masyarakat_desa` (`id_masyarakat`);

--
-- Ketidakleluasaan untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`id_masyarakat`) REFERENCES `masyarakat_desa` (`id_masyarakat`);

--
-- Ketidakleluasaan untuk tabel `pengurusan_dokumen`
--
ALTER TABLE `pengurusan_dokumen`
  ADD CONSTRAINT `pengurusan_dokumen_ibfk_1` FOREIGN KEY (`id_masyarakat`) REFERENCES `masyarakat_desa` (`id_masyarakat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
