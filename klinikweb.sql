-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 01:03 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinikweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `aturan_pakai`
--

CREATE TABLE `aturan_pakai` (
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam` time NOT NULL DEFAULT '00:00:00',
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kode_brng` varchar(15) NOT NULL DEFAULT '',
  `aturan` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aturan_pakai`
--

INSERT INTO `aturan_pakai` (`tgl_perawatan`, `jam`, `no_rawat`, `kode_brng`, `aturan`) VALUES
('2024-12-08', '17:17:06', '2024/12/08/000001', 'B00001', '20');

-- --------------------------------------------------------

--
-- Table structure for table `bahasa_pasien`
--

CREATE TABLE `bahasa_pasien` (
  `id` int(11) NOT NULL,
  `nama_bahasa` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `bahasa_pasien`
--

INSERT INTO `bahasa_pasien` (`id`, `nama_bahasa`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `bangsal`
--

CREATE TABLE `bangsal` (
  `kd_bangsal` char(5) NOT NULL,
  `nm_bangsal` varchar(30) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bangsal`
--

INSERT INTO `bangsal` (`kd_bangsal`, `nm_bangsal`, `status`) VALUES
('-', '-', '1'),
('ANG', 'Anggrek', '1'),
('APT', 'Apotek', '1'),
('GF', 'Gudang Farmasi', '1');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `namabank` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`namabank`) VALUES
('-'),
('T');

-- --------------------------------------------------------

--
-- Table structure for table `barcode`
--

CREATE TABLE `barcode` (
  `id` int(11) NOT NULL,
  `barcode` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `beri_obat_operasi`
--

CREATE TABLE `beri_obat_operasi` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `kd_obat` varchar(15) NOT NULL,
  `hargasatuan` double NOT NULL,
  `jumlah` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `berkas_digital_perawatan`
--

CREATE TABLE `berkas_digital_perawatan` (
  `no_rawat` varchar(17) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `lokasi_file` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bidang`
--

CREATE TABLE `bidang` (
  `nama` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bidang`
--

INSERT INTO `bidang` (`nama`) VALUES
('-');

-- --------------------------------------------------------

--
-- Table structure for table `booking_operasi`
--

CREATE TABLE `booking_operasi` (
  `no_rawat` varchar(17) DEFAULT NULL,
  `kode_paket` varchar(15) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL,
  `status` enum('Menunggu','Proses Operasi','Selesai') DEFAULT NULL,
  `kd_dokter` varchar(20) DEFAULT NULL,
  `kd_ruang_ok` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_periksa`
--

CREATE TABLE `booking_periksa` (
  `no_booking` varchar(17) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_telp` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `kd_poli` varchar(5) DEFAULT NULL,
  `tambahan_pesan` varchar(400) DEFAULT NULL,
  `status` enum('Diterima','Ditolak','Belum Dibalas') NOT NULL,
  `tanggal_booking` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_periksa_balasan`
--

CREATE TABLE `booking_periksa_balasan` (
  `no_booking` varchar(17) NOT NULL,
  `balasan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_periksa_diterima`
--

CREATE TABLE `booking_periksa_diterima` (
  `no_booking` varchar(17) NOT NULL,
  `no_rkm_medis` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_registrasi`
--

CREATE TABLE `booking_registrasi` (
  `tanggal_booking` date DEFAULT NULL,
  `jam_booking` time DEFAULT NULL,
  `no_rkm_medis` varchar(15) NOT NULL,
  `tanggal_periksa` date NOT NULL,
  `kd_dokter` varchar(20) DEFAULT NULL,
  `kd_poli` varchar(5) DEFAULT NULL,
  `no_reg` varchar(8) DEFAULT NULL,
  `kd_pj` char(3) DEFAULT NULL,
  `limit_reg` int(1) DEFAULT NULL,
  `waktu_kunjungan` datetime DEFAULT NULL,
  `status` enum('Terdaftar','Belum','Batal','Dokter Berhalangan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bpjs_prb`
--

CREATE TABLE `bpjs_prb` (
  `no_sep` varchar(40) NOT NULL,
  `prb` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridging_rujukan_bpjs`
--

CREATE TABLE `bridging_rujukan_bpjs` (
  `no_sep` varchar(40) NOT NULL,
  `tglRujukan` date DEFAULT NULL,
  `tglRencanaKunjungan` date NOT NULL,
  `ppkDirujuk` varchar(20) DEFAULT NULL,
  `nm_ppkDirujuk` varchar(100) DEFAULT NULL,
  `jnsPelayanan` enum('1','2') DEFAULT NULL,
  `catatan` varchar(200) DEFAULT NULL,
  `diagRujukan` varchar(10) DEFAULT NULL,
  `nama_diagRujukan` varchar(400) DEFAULT NULL,
  `tipeRujukan` enum('0. Penuh','1. Partial','2. Rujuk Balik') DEFAULT NULL,
  `poliRujukan` varchar(15) DEFAULT NULL,
  `nama_poliRujukan` varchar(50) DEFAULT NULL,
  `no_rujukan` varchar(40) NOT NULL,
  `user` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridging_sep`
--

CREATE TABLE `bridging_sep` (
  `no_sep` varchar(40) NOT NULL DEFAULT '',
  `no_rawat` varchar(17) DEFAULT NULL,
  `tglsep` date DEFAULT NULL,
  `tglrujukan` date DEFAULT NULL,
  `no_rujukan` varchar(40) DEFAULT NULL,
  `kdppkrujukan` varchar(12) DEFAULT NULL,
  `nmppkrujukan` varchar(200) DEFAULT NULL,
  `kdppkpelayanan` varchar(12) DEFAULT NULL,
  `nmppkpelayanan` varchar(200) DEFAULT NULL,
  `jnspelayanan` enum('1','2') DEFAULT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `diagawal` varchar(10) DEFAULT NULL,
  `nmdiagnosaawal` varchar(400) DEFAULT NULL,
  `kdpolitujuan` varchar(15) DEFAULT NULL,
  `nmpolitujuan` varchar(50) DEFAULT NULL,
  `klsrawat` enum('1','2','3') DEFAULT NULL,
  `klsnaik` enum('','1','2','3','4','5','6','7') NOT NULL,
  `pembiayaan` enum('','1','2','3') NOT NULL,
  `pjnaikkelas` varchar(100) NOT NULL,
  `lakalantas` enum('0','1','2','3') DEFAULT NULL,
  `user` varchar(25) DEFAULT NULL,
  `nomr` varchar(15) DEFAULT NULL,
  `nama_pasien` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `peserta` varchar(100) DEFAULT NULL,
  `jkel` enum('L','P') DEFAULT NULL,
  `no_kartu` varchar(25) DEFAULT NULL,
  `tglpulang` datetime DEFAULT NULL,
  `asal_rujukan` enum('1. Faskes 1','2. Faskes 2(RS)') NOT NULL,
  `eksekutif` enum('0. Tidak','1.Ya') NOT NULL,
  `cob` enum('0. Tidak','1.Ya') NOT NULL,
  `notelep` varchar(40) NOT NULL,
  `katarak` enum('0. Tidak','1.Ya') NOT NULL,
  `tglkkl` date NOT NULL,
  `keterangankkl` varchar(100) NOT NULL,
  `suplesi` enum('0. Tidak','1.Ya') NOT NULL,
  `no_sep_suplesi` varchar(40) NOT NULL,
  `kdprop` varchar(10) NOT NULL,
  `nmprop` varchar(50) NOT NULL,
  `kdkab` varchar(10) NOT NULL,
  `nmkab` varchar(50) NOT NULL,
  `kdkec` varchar(10) NOT NULL,
  `nmkec` varchar(50) NOT NULL,
  `noskdp` varchar(40) NOT NULL,
  `kddpjp` varchar(10) NOT NULL,
  `nmdpdjp` varchar(100) NOT NULL,
  `tujuankunjungan` enum('0','1','2') NOT NULL,
  `flagprosedur` enum('','0','1') NOT NULL,
  `penunjang` enum('','1','2','3','4','5','6','7','8','9','10','11','12') NOT NULL,
  `asesmenpelayanan` enum('','1','2','3','4','5') NOT NULL,
  `kddpjplayanan` varchar(10) NOT NULL,
  `nmdpjplayanan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridging_sep_internal`
--

CREATE TABLE `bridging_sep_internal` (
  `no_sep` varchar(40) NOT NULL DEFAULT '',
  `no_rawat` varchar(17) DEFAULT NULL,
  `tglsep` date DEFAULT NULL,
  `tglrujukan` date DEFAULT NULL,
  `no_rujukan` varchar(40) DEFAULT NULL,
  `kdppkrujukan` varchar(12) DEFAULT NULL,
  `nmppkrujukan` varchar(200) DEFAULT NULL,
  `kdppkpelayanan` varchar(12) DEFAULT NULL,
  `nmppkpelayanan` varchar(200) DEFAULT NULL,
  `jnspelayanan` enum('1','2') DEFAULT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `diagawal` varchar(10) DEFAULT NULL,
  `nmdiagnosaawal` varchar(400) DEFAULT NULL,
  `kdpolitujuan` varchar(15) DEFAULT NULL,
  `nmpolitujuan` varchar(50) DEFAULT NULL,
  `klsrawat` enum('1','2','3') DEFAULT NULL,
  `klsnaik` enum('','1','2','3','4','5','6','7') NOT NULL,
  `pembiayaan` enum('','1','2','3') NOT NULL,
  `pjnaikkelas` varchar(100) NOT NULL,
  `lakalantas` enum('0','1','2','3') DEFAULT NULL,
  `user` varchar(25) DEFAULT NULL,
  `nomr` varchar(15) DEFAULT NULL,
  `nama_pasien` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `peserta` varchar(100) DEFAULT NULL,
  `jkel` enum('L','P') DEFAULT NULL,
  `no_kartu` varchar(25) DEFAULT NULL,
  `tglpulang` datetime DEFAULT NULL,
  `asal_rujukan` enum('1. Faskes 1','2. Faskes 2(RS)') NOT NULL,
  `eksekutif` enum('0. Tidak','1.Ya') NOT NULL,
  `cob` enum('0. Tidak','1.Ya') NOT NULL,
  `notelep` varchar(40) NOT NULL,
  `katarak` enum('0. Tidak','1.Ya') NOT NULL,
  `tglkkl` date NOT NULL,
  `keterangankkl` varchar(100) NOT NULL,
  `suplesi` enum('0. Tidak','1.Ya') NOT NULL,
  `no_sep_suplesi` varchar(40) NOT NULL,
  `kdprop` varchar(10) NOT NULL,
  `nmprop` varchar(50) NOT NULL,
  `kdkab` varchar(10) NOT NULL,
  `nmkab` varchar(50) NOT NULL,
  `kdkec` varchar(10) NOT NULL,
  `nmkec` varchar(50) NOT NULL,
  `noskdp` varchar(40) NOT NULL,
  `kddpjp` varchar(10) NOT NULL,
  `nmdpdjp` varchar(100) NOT NULL,
  `tujuankunjungan` enum('0','1','2') NOT NULL,
  `flagprosedur` enum('','0','1') NOT NULL,
  `penunjang` enum('','1','2','3','4','5','6','7','8','9','10','11','12') NOT NULL,
  `asesmenpelayanan` enum('','1','2','3','4','5') NOT NULL,
  `kddpjplayanan` varchar(10) NOT NULL,
  `nmdpjplayanan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridging_srb_bpjs`
--

CREATE TABLE `bridging_srb_bpjs` (
  `no_sep` varchar(40) NOT NULL,
  `no_srb` varchar(10) NOT NULL,
  `tgl_srb` date DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `kodeprogram` varchar(3) DEFAULT NULL,
  `namaprogram` varchar(70) DEFAULT NULL,
  `kodedpjp` varchar(10) DEFAULT NULL,
  `nmdpjp` varchar(100) DEFAULT NULL,
  `user` varchar(25) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `saran` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridging_surat_kontrol_bpjs`
--

CREATE TABLE `bridging_surat_kontrol_bpjs` (
  `no_sep` varchar(40) DEFAULT NULL,
  `tgl_surat` date NOT NULL,
  `no_surat` varchar(40) NOT NULL,
  `tgl_rencana` date DEFAULT NULL,
  `kd_dokter_bpjs` varchar(20) DEFAULT NULL,
  `nm_dokter_bpjs` varchar(50) DEFAULT NULL,
  `kd_poli_bpjs` varchar(15) DEFAULT NULL,
  `nm_poli_bpjs` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridging_surat_pri_bpjs`
--

CREATE TABLE `bridging_surat_pri_bpjs` (
  `no_rawat` varchar(17) DEFAULT NULL,
  `no_kartu` varchar(25) DEFAULT NULL,
  `tgl_surat` date NOT NULL,
  `no_surat` varchar(40) NOT NULL,
  `tgl_rencana` date DEFAULT NULL,
  `kd_dokter_bpjs` varchar(20) DEFAULT NULL,
  `nm_dokter_bpjs` varchar(50) DEFAULT NULL,
  `kd_poli_bpjs` varchar(15) DEFAULT NULL,
  `nm_poli_bpjs` varchar(40) DEFAULT NULL,
  `diagnosa` varchar(130) NOT NULL,
  `no_sep` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cacat_fisik`
--

CREATE TABLE `cacat_fisik` (
  `id` int(11) NOT NULL,
  `nama_cacat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cacat_fisik`
--

INSERT INTO `cacat_fisik` (`id`, `nama_cacat`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `catatan_perawatan`
--

CREATE TABLE `catatan_perawatan` (
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `no_rawat` varchar(17) DEFAULT NULL,
  `kd_dokter` varchar(20) DEFAULT NULL,
  `catatan` varchar(700) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `databarang`
--

CREATE TABLE `databarang` (
  `kode_brng` varchar(15) NOT NULL DEFAULT '',
  `nama_brng` varchar(80) DEFAULT NULL,
  `kode_satbesar` char(4) NOT NULL,
  `kode_sat` char(4) DEFAULT NULL,
  `letak_barang` varchar(100) DEFAULT NULL,
  `dasar` double NOT NULL,
  `h_beli` double DEFAULT NULL,
  `ralan` double DEFAULT NULL,
  `kelas1` double DEFAULT NULL,
  `kelas2` double DEFAULT NULL,
  `kelas3` double DEFAULT NULL,
  `utama` double DEFAULT NULL,
  `vip` double DEFAULT NULL,
  `vvip` double DEFAULT NULL,
  `beliluar` double DEFAULT NULL,
  `jualbebas` double DEFAULT NULL,
  `karyawan` double DEFAULT NULL,
  `stokminimal` double DEFAULT NULL,
  `kdjns` char(4) DEFAULT NULL,
  `isi` double NOT NULL,
  `kapasitas` double NOT NULL,
  `expire` date DEFAULT NULL,
  `status` enum('0','1') NOT NULL,
  `kode_industri` char(5) DEFAULT NULL,
  `kode_kategori` char(4) DEFAULT NULL,
  `kode_golongan` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `databarang`
--

INSERT INTO `databarang` (`kode_brng`, `nama_brng`, `kode_satbesar`, `kode_sat`, `letak_barang`, `dasar`, `h_beli`, `ralan`, `kelas1`, `kelas2`, `kelas3`, `utama`, `vip`, `vvip`, `beliluar`, `jualbebas`, `karyawan`, `stokminimal`, `kdjns`, `isi`, `kapasitas`, `expire`, `status`, `kode_industri`, `kode_kategori`, `kode_golongan`) VALUES
('B00001', 'Paracetamol 500mg', '-', '-', 'Apotik', 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 5000, 100, 'TG', 10, 500, '2024-06-10', '1', '-', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `dep_id` char(4) NOT NULL,
  `nama` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`dep_id`, `nama`) VALUES
('-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pemberian_obat`
--

CREATE TABLE `detail_pemberian_obat` (
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam` time NOT NULL DEFAULT '00:00:00',
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kode_brng` varchar(15) NOT NULL,
  `h_beli` double DEFAULT NULL,
  `biaya_obat` double DEFAULT NULL,
  `jml` double NOT NULL,
  `embalase` double DEFAULT NULL,
  `tuslah` double DEFAULT NULL,
  `total` double NOT NULL,
  `status` enum('Ralan','Ranap') DEFAULT NULL,
  `kd_bangsal` char(5) DEFAULT NULL,
  `no_batch` varchar(20) NOT NULL,
  `no_faktur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pemberian_obat`
--

INSERT INTO `detail_pemberian_obat` (`tgl_perawatan`, `jam`, `no_rawat`, `kode_brng`, `h_beli`, `biaya_obat`, `jml`, `embalase`, `tuslah`, `total`, `status`, `kd_bangsal`, `no_batch`, `no_faktur`) VALUES
('2024-12-08', '17:17:06', '2024/12/08/000001', 'B00001', 5000, 5000, 10, 0, 0, 50000, 'Ralan', 'APT', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa_lab`
--

CREATE TABLE `detail_periksa_lab` (
  `no_rawat` varchar(17) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time NOT NULL,
  `id_template` int(11) NOT NULL,
  `nilai` varchar(200) NOT NULL,
  `nilai_rujukan` varchar(30) NOT NULL,
  `keterangan` varchar(60) NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `bagian_perujuk` double NOT NULL,
  `bagian_dokter` double NOT NULL,
  `bagian_laborat` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_item` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosa_pasien`
--

CREATE TABLE `diagnosa_pasien` (
  `no_rawat` varchar(17) NOT NULL,
  `kd_penyakit` varchar(10) NOT NULL,
  `status` enum('Ralan','Ranap') NOT NULL,
  `prioritas` tinyint(4) NOT NULL,
  `status_penyakit` enum('Lama','Baru') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `kd_dokter` varchar(20) NOT NULL,
  `nm_dokter` varchar(50) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `tmp_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `gol_drh` enum('A','B','O','AB','-') DEFAULT NULL,
  `agama` varchar(12) DEFAULT NULL,
  `almt_tgl` varchar(60) DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `stts_nikah` enum('BELUM MENIKAH','MENIKAH','JANDA','DUDHA','JOMBLO') DEFAULT NULL,
  `kd_sps` char(5) DEFAULT NULL,
  `alumni` varchar(60) DEFAULT NULL,
  `no_ijn_praktek` varchar(120) DEFAULT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`kd_dokter`, `nm_dokter`, `jk`, `tmp_lahir`, `tgl_lahir`, `gol_drh`, `agama`, `almt_tgl`, `no_telp`, `stts_nikah`, `kd_sps`, `alumni`, `no_ijn_praktek`, `status`) VALUES
('DR001', 'dr. Ataaka Muhammad', 'L', 'Barabai', '2000-09-18', 'O', 'Islam', 'Barabai', '-', 'MENIKAH', 'UMUM', 'UI', '-', '1');

-- --------------------------------------------------------

--
-- Table structure for table `dpjp_ranap`
--

CREATE TABLE `dpjp_ranap` (
  `no_rawat` varchar(17) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_index`
--

CREATE TABLE `emergency_index` (
  `kode_emergency` varchar(3) NOT NULL,
  `nama_emergency` varchar(200) DEFAULT NULL,
  `indek` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergency_index`
--

INSERT INTO `emergency_index` (`kode_emergency`, `nama_emergency`, `indek`) VALUES
('-', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gambar_radiologi`
--

CREATE TABLE `gambar_radiologi` (
  `no_rawat` varchar(17) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time NOT NULL,
  `lokasi_gambar` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `golongan_barang`
--

CREATE TABLE `golongan_barang` (
  `kode` char(4) NOT NULL,
  `nama` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `golongan_barang`
--

INSERT INTO `golongan_barang` (`kode`, `nama`) VALUES
('-', '-'),
('TG', 'Tablet Generik');

-- --------------------------------------------------------

--
-- Table structure for table `gudangbarang`
--

CREATE TABLE `gudangbarang` (
  `kode_brng` varchar(15) NOT NULL,
  `kd_bangsal` char(5) NOT NULL DEFAULT '',
  `stok` double NOT NULL,
  `no_batch` varchar(20) NOT NULL,
  `no_faktur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gudangbarang`
--

INSERT INTO `gudangbarang` (`kode_brng`, `kd_bangsal`, `stok`, `no_batch`, `no_faktur`) VALUES
('B00001', 'APT', 90, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_radiologi`
--

CREATE TABLE `hasil_radiologi` (
  `no_rawat` varchar(17) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time NOT NULL,
  `hasil` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `icd9`
--

CREATE TABLE `icd9` (
  `kode` varchar(8) NOT NULL,
  `deskripsi_panjang` varchar(250) DEFAULT NULL,
  `deskripsi_pendek` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `industrifarmasi`
--

CREATE TABLE `industrifarmasi` (
  `kode_industri` char(5) NOT NULL DEFAULT '',
  `nama_industri` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `kota` varchar(20) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `industrifarmasi`
--

INSERT INTO `industrifarmasi` (`kode_industri`, `nama_industri`, `alamat`, `kota`, `no_telp`) VALUES
('-', '-', '-', '-', '0');

-- --------------------------------------------------------

--
-- Table structure for table `inventaris`
--

CREATE TABLE `inventaris` (
  `no_inventaris` varchar(30) NOT NULL,
  `kode_barang` varchar(20) DEFAULT NULL,
  `asal_barang` enum('Beli','Bantuan','Hibah','-') DEFAULT NULL,
  `tgl_pengadaan` date DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `status_barang` enum('Ada','Rusak','Hilang','Perbaikan','Dipinjam','-') DEFAULT NULL,
  `id_ruang` char(5) DEFAULT NULL,
  `no_rak` char(3) DEFAULT NULL,
  `no_box` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_barang`
--

CREATE TABLE `inventaris_barang` (
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(60) DEFAULT NULL,
  `jml_barang` int(11) DEFAULT NULL,
  `kode_produsen` varchar(10) DEFAULT NULL,
  `id_merk` varchar(10) DEFAULT NULL,
  `thn_produksi` year(4) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `id_kategori` char(10) DEFAULT NULL,
  `id_jenis` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_jenis`
--

CREATE TABLE `inventaris_jenis` (
  `id_jenis` char(10) NOT NULL,
  `nama_jenis` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_kategori`
--

CREATE TABLE `inventaris_kategori` (
  `id_kategori` char(10) NOT NULL,
  `nama_kategori` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_merk`
--

CREATE TABLE `inventaris_merk` (
  `id_merk` varchar(10) NOT NULL,
  `nama_merk` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_peminjaman`
--

CREATE TABLE `inventaris_peminjaman` (
  `peminjam` varchar(50) NOT NULL DEFAULT '',
  `tlp` varchar(13) NOT NULL,
  `no_inventaris` varchar(30) NOT NULL DEFAULT '',
  `tgl_pinjam` date NOT NULL DEFAULT '0000-00-00',
  `tgl_kembali` date DEFAULT NULL,
  `nip` varchar(20) NOT NULL DEFAULT '',
  `status_pinjam` enum('Masih Dipinjam','Sudah Kembali') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_produsen`
--

CREATE TABLE `inventaris_produsen` (
  `kode_produsen` varchar(10) NOT NULL,
  `nama_produsen` varchar(40) DEFAULT NULL,
  `alamat_produsen` varchar(70) DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `website_produsen` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_ruang`
--

CREATE TABLE `inventaris_ruang` (
  `id_ruang` varchar(5) NOT NULL,
  `nama_ruang` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `kd_jbtn` char(4) NOT NULL DEFAULT '',
  `nm_jbtn` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`kd_jbtn`, `nm_jbtn`) VALUES
('-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `kd_dokter` varchar(20) NOT NULL,
  `hari_kerja` enum('SENIN','SELASA','RABU','KAMIS','JUMAT','SABTU','AKHAD') NOT NULL DEFAULT 'SENIN',
  `jam_mulai` time NOT NULL DEFAULT '00:00:00',
  `jam_selesai` time DEFAULT NULL,
  `kd_poli` char(5) DEFAULT NULL,
  `kuota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_pegawai`
--

CREATE TABLE `jadwal_pegawai` (
  `id` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `bulan` enum('01','02','03','04','05','06','07','08','09','10','11','12') NOT NULL,
  `h1` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h2` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h3` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h4` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h5` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h6` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h7` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h8` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h9` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h10` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h11` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h12` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h13` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h14` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h15` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h16` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h17` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h18` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h19` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h20` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h21` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h22` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h23` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h24` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h25` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h26` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h27` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h28` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h29` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h30` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h31` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_tambahan`
--

CREATE TABLE `jadwal_tambahan` (
  `id` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `bulan` enum('01','02','03','04','05','06','07','08','09','10','11','12') NOT NULL,
  `h1` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h2` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h3` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h4` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h5` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h6` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h7` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h8` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h9` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h10` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h11` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h12` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h13` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h14` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h15` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h16` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h17` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h18` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h19` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h20` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h21` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h22` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h23` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h24` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h25` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h26` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h27` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h28` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h29` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h30` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h31` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jam_jaga`
--

CREATE TABLE `jam_jaga` (
  `no_id` int(11) NOT NULL,
  `dep_id` char(4) NOT NULL,
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_pulang` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jam_masuk`
--

CREATE TABLE `jam_masuk` (
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_pulang` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jam_masuk`
--

INSERT INTO `jam_masuk` (`shift`, `jam_masuk`, `jam_pulang`) VALUES
('Pagi', '06:00:00', '16:00:00'),
('Pagi2', '08:00:00', '14:00:00'),
('Pagi3', '10:00:00', '17:00:00'),
('Siang', '14:00:00', '08:00:00'),
('Siang2', '14:00:00', '21:00:00'),
('Malam', '20:00:00', '02:00:00'),
('Midle Siang1', '00:00:00', '06:00:00'),
('Midle Siang3', '00:00:00', '00:00:00'),
('Midle Siang4', '04:00:00', '16:00:00'),
('Midle Malam1', '00:00:00', '06:00:00'),
('Midle Malam5', '22:00:00', '07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `kdjns` char(4) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`kdjns`, `nama`, `keterangan`) VALUES
('-', '-', '-'),
('TG', 'Tablet Generik', 'Tablet Generik');

-- --------------------------------------------------------

--
-- Table structure for table `jnj_jabatan`
--

CREATE TABLE `jnj_jabatan` (
  `kode` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tnj` double NOT NULL,
  `indek` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jnj_jabatan`
--

INSERT INTO `jnj_jabatan` (`kode`, `nama`, `tnj`, `indek`) VALUES
('-', '-', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jns_perawatan`
--

CREATE TABLE `jns_perawatan` (
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nm_perawatan` varchar(80) DEFAULT NULL,
  `kd_kategori` char(5) DEFAULT NULL,
  `material` double DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double DEFAULT NULL,
  `tarif_tindakanpr` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `total_byrdr` double DEFAULT NULL,
  `total_byrpr` double DEFAULT NULL,
  `total_byrdrpr` double NOT NULL,
  `kd_pj` char(3) NOT NULL,
  `kd_poli` char(5) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jns_perawatan`
--

INSERT INTO `jns_perawatan` (`kd_jenis_prw`, `nm_perawatan`, `kd_kategori`, `material`, `bhp`, `tarif_tindakandr`, `tarif_tindakanpr`, `kso`, `menejemen`, `total_byrdr`, `total_byrpr`, `total_byrdrpr`, `kd_pj`, `kd_poli`, `status`) VALUES
('RJ001', 'Pemeriksaan rutin', '-', 0, 0, 50000, 0, 0, 0, 50000, 0, 50000, '-', '-', '1');

-- --------------------------------------------------------

--
-- Table structure for table `jns_perawatan_inap`
--

CREATE TABLE `jns_perawatan_inap` (
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nm_perawatan` varchar(80) DEFAULT NULL,
  `kd_kategori` char(5) NOT NULL,
  `material` double DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double DEFAULT NULL,
  `tarif_tindakanpr` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `total_byrdr` double DEFAULT NULL,
  `total_byrpr` double DEFAULT NULL,
  `total_byrdrpr` double NOT NULL,
  `kd_pj` char(3) NOT NULL,
  `kd_bangsal` char(5) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `kelas` enum('-','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jns_perawatan_inap`
--

INSERT INTO `jns_perawatan_inap` (`kd_jenis_prw`, `nm_perawatan`, `kd_kategori`, `material`, `bhp`, `tarif_tindakandr`, `tarif_tindakanpr`, `kso`, `menejemen`, `total_byrdr`, `total_byrpr`, `total_byrdrpr`, `kd_pj`, `kd_bangsal`, `status`, `kelas`) VALUES
('RI001', 'Pasang Infus', '-', 0, 0, 0, 25000, 0, 0, 0, 25000, 25000, '-', '-', '1', 'Kelas 1');

-- --------------------------------------------------------

--
-- Table structure for table `jns_perawatan_lab`
--

CREATE TABLE `jns_perawatan_lab` (
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nm_perawatan` varchar(80) DEFAULT NULL,
  `bagian_rs` double DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `total_byr` double DEFAULT NULL,
  `kd_pj` char(3) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `kelas` enum('-','Rawat Jalan','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') NOT NULL,
  `kategori` enum('PK','PA','MB') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jns_perawatan_lab`
--

INSERT INTO `jns_perawatan_lab` (`kd_jenis_prw`, `nm_perawatan`, `bagian_rs`, `bhp`, `tarif_perujuk`, `tarif_tindakan_dokter`, `tarif_tindakan_petugas`, `kso`, `menejemen`, `total_byr`, `kd_pj`, `status`, `kelas`, `kategori`) VALUES
('LAB001', 'Pemeriksaan Darah', 0, 0, 0, 100000, 0, 0, 0, 100000, '-', '1', 'Kelas 1', 'PK');

-- --------------------------------------------------------

--
-- Table structure for table `jns_perawatan_radiologi`
--

CREATE TABLE `jns_perawatan_radiologi` (
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nm_perawatan` varchar(80) DEFAULT NULL,
  `bagian_rs` double DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `total_byr` double DEFAULT NULL,
  `kd_pj` char(3) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `kelas` enum('-','Rawat Jalan','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jns_perawatan_radiologi`
--

INSERT INTO `jns_perawatan_radiologi` (`kd_jenis_prw`, `nm_perawatan`, `bagian_rs`, `bhp`, `tarif_perujuk`, `tarif_tindakan_dokter`, `tarif_tindakan_petugas`, `kso`, `menejemen`, `total_byr`, `kd_pj`, `status`, `kelas`) VALUES
('RAD001', 'Thorax', 0, 0, 0, 150000, 0, 0, 0, 150000, '-', '1', 'Kelas 1');

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `kd_kab` int(11) NOT NULL,
  `nm_kab` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`kd_kab`, `nm_kab`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `kd_kamar` varchar(15) NOT NULL,
  `kd_bangsal` char(5) DEFAULT NULL,
  `trf_kamar` double DEFAULT NULL,
  `status` enum('ISI','KOSONG','DIBERSIHKAN','DIBOOKING') DEFAULT NULL,
  `kelas` enum('Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') DEFAULT NULL,
  `statusdata` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`kd_kamar`, `kd_bangsal`, `trf_kamar`, `status`, `kelas`, `statusdata`) VALUES
('ANG01', 'ANG', 100000, 'KOSONG', 'Kelas 1', '1'),
('ANG02', 'ANG', 100000, 'KOSONG', 'Kelas 1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `kamar_inap`
--

CREATE TABLE `kamar_inap` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_kamar` varchar(15) NOT NULL,
  `trf_kamar` double DEFAULT NULL,
  `diagnosa_awal` varchar(100) DEFAULT NULL,
  `diagnosa_akhir` varchar(100) DEFAULT NULL,
  `tgl_masuk` date NOT NULL DEFAULT '0000-00-00',
  `jam_masuk` time NOT NULL DEFAULT '00:00:00',
  `tgl_keluar` date DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `lama` double DEFAULT NULL,
  `ttl_biaya` double DEFAULT NULL,
  `stts_pulang` enum('Sehat','Rujuk','APS','+','Meninggal','Sembuh','Membaik','Pulang Paksa','-','Pindah Kamar','Status Belum Lengkap','Atas Persetujuan Dokter','Atas Permintaan Sendiri','Isoman','Lain-lain') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `kode` char(4) NOT NULL,
  `nama` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`kode`, `nama`) VALUES
('-', '-'),
('Gene', 'Generik');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_penyakit`
--

CREATE TABLE `kategori_penyakit` (
  `kd_ktg` varchar(8) NOT NULL,
  `nm_kategori` varchar(30) DEFAULT NULL,
  `ciri_umum` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_penyakit`
--

INSERT INTO `kategori_penyakit` (`kd_ktg`, `nm_kategori`, `ciri_umum`) VALUES
('-', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_perawatan`
--

CREATE TABLE `kategori_perawatan` (
  `kd_kategori` char(5) NOT NULL,
  `nm_kategori` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_perawatan`
--

INSERT INTO `kategori_perawatan` (`kd_kategori`, `nm_kategori`) VALUES
('-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `kd_kec` int(11) NOT NULL,
  `nm_kec` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`kd_kec`, `nm_kec`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_jabatan`
--

CREATE TABLE `kelompok_jabatan` (
  `kode_kelompok` varchar(3) NOT NULL,
  `nama_kelompok` varchar(100) DEFAULT NULL,
  `indek` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelompok_jabatan`
--

INSERT INTO `kelompok_jabatan` (`kode_kelompok`, `nama_kelompok`, `indek`) VALUES
('-', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `kd_kel` varchar(11) NOT NULL,
  `nm_kel` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`kd_kel`, `nm_kel`) VALUES
('1', '-');

-- --------------------------------------------------------

--
-- Table structure for table `kodesatuan`
--

CREATE TABLE `kodesatuan` (
  `kode_sat` char(4) NOT NULL,
  `satuan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kodesatuan`
--

INSERT INTO `kodesatuan` (`kode_sat`, `satuan`) VALUES
('-', '-'),
('tab', 'Tablet');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_operasi`
--

CREATE TABLE `laporan_operasi` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `diagnosa_preop` varchar(100) NOT NULL,
  `diagnosa_postop` varchar(100) NOT NULL,
  `jaringan_dieksekusi` varchar(100) NOT NULL,
  `selesaioperasi` datetime NOT NULL,
  `permintaan_pa` enum('Ya','Tidak') NOT NULL,
  `laporan_operasi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maping_dokter_dpjpvclaim`
--

CREATE TABLE `maping_dokter_dpjpvclaim` (
  `kd_dokter` varchar(20) NOT NULL,
  `kd_dokter_bpjs` varchar(20) DEFAULT NULL,
  `nm_dokter_bpjs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `maping_dokter_pcare`
--

CREATE TABLE `maping_dokter_pcare` (
  `kd_dokter` varchar(20) NOT NULL,
  `kd_dokter_pcare` varchar(20) DEFAULT NULL,
  `nm_dokter_pcare` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `maping_poliklinik_pcare`
--

CREATE TABLE `maping_poliklinik_pcare` (
  `kd_poli_rs` char(5) NOT NULL,
  `kd_poli_pcare` char(5) DEFAULT NULL,
  `nm_poli_pcare` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `maping_poli_bpjs`
--

CREATE TABLE `maping_poli_bpjs` (
  `kd_poli_rs` varchar(5) NOT NULL,
  `kd_poli_bpjs` varchar(15) NOT NULL,
  `nm_poli_bpjs` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_aturan_pakai`
--

CREATE TABLE `master_aturan_pakai` (
  `aturan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_aturan_pakai`
--

INSERT INTO `master_aturan_pakai` (`aturan`) VALUES
('3 x 1 Sehari');

-- --------------------------------------------------------

--
-- Table structure for table `master_berkas_digital`
--

CREATE TABLE `master_berkas_digital` (
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_berkas_digital`
--

INSERT INTO `master_berkas_digital` (`kode`, `nama`) VALUES
('DIG001', 'Berkas Digital');

-- --------------------------------------------------------

--
-- Table structure for table `master_masalah_keperawatan`
--

CREATE TABLE `master_masalah_keperawatan` (
  `kode_masalah` varchar(3) NOT NULL,
  `nama_masalah` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `metode_racik`
--

CREATE TABLE `metode_racik` (
  `kd_racik` varchar(3) NOT NULL,
  `nm_racik` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metode_racik`
--

INSERT INTO `metode_racik` (`kd_racik`, `nm_racik`) VALUES
('1', 'Puyer');

-- --------------------------------------------------------

--
-- Table structure for table `mlite_akun_kegiatan`
--

CREATE TABLE `mlite_akun_kegiatan` (
  `id` int(11) NOT NULL,
  `kegiatan` varchar(200) DEFAULT NULL,
  `kd_rek` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_antrian_loket`
--

CREATE TABLE `mlite_antrian_loket` (
  `kd` int(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `noantrian` varchar(50) NOT NULL,
  `no_rkm_medis` varchar(50) DEFAULT NULL,
  `postdate` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL DEFAULT '00:00:00',
  `status` varchar(10) NOT NULL DEFAULT '0',
  `loket` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_antrian_referensi`
--

CREATE TABLE `mlite_antrian_referensi` (
  `tanggal_periksa` date NOT NULL,
  `no_rkm_medis` varchar(50) NOT NULL,
  `nomor_kartu` varchar(50) NOT NULL,
  `nomor_referensi` varchar(50) NOT NULL,
  `kodebooking` varchar(100) NOT NULL,
  `jenis_kunjungan` varchar(10) NOT NULL,
  `status_kirim` varchar(20) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_antrian_referensi_batal`
--

CREATE TABLE `mlite_antrian_referensi_batal` (
  `tanggal_batal` date NOT NULL,
  `nomor_referensi` varchar(50) NOT NULL,
  `kodebooking` varchar(100) NOT NULL,
  `keterangan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_antrian_referensi_taskid`
--

CREATE TABLE `mlite_antrian_referensi_taskid` (
  `tanggal_periksa` date NOT NULL,
  `nomor_referensi` varchar(50) NOT NULL,
  `taskid` varchar(50) NOT NULL,
  `waktu` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `keterangan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_apamregister`
--

CREATE TABLE `mlite_apamregister` (
  `nama_lengkap` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `nomor_ktp` varchar(225) NOT NULL,
  `nomor_telepon` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_billing`
--

CREATE TABLE `mlite_billing` (
  `id_billing` int(11) NOT NULL,
  `kd_billing` varchar(100) NOT NULL,
  `no_rawat` varchar(17) NOT NULL,
  `jumlah_total` int(100) NOT NULL,
  `potongan` int(100) NOT NULL,
  `jumlah_harus_bayar` int(100) NOT NULL,
  `jumlah_bayar` int(100) NOT NULL,
  `tgl_billing` date NOT NULL,
  `jam_billing` time NOT NULL,
  `id_user` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mlite_billing`
--

INSERT INTO `mlite_billing` (`id_billing`, `kd_billing`, `no_rawat`, `jumlah_total`, `potongan`, `jumlah_harus_bayar`, `jumlah_bayar`, `tgl_billing`, `jam_billing`, `id_user`, `keterangan`) VALUES
(1, 'RJ.08.12.2024.17.18.39', '2024/12/08/000001', 100000, 0, 100000, 100000, '2024-12-08', '17:18:39', 1, 'Tunai'),
(2, 'RJ.08.12.2024.17.18.39', '2024/12/08/000001', 100000, 0, 100000, 100000, '2024-12-08', '17:18:39', 1, 'Tunai');

-- --------------------------------------------------------

--
-- Table structure for table `mlite_bridging_pcare`
--

CREATE TABLE `mlite_bridging_pcare` (
  `id` int(11) NOT NULL,
  `no_rawat` text NOT NULL,
  `no_rkm_medis` text DEFAULT NULL,
  `tgl_daftar` text DEFAULT NULL,
  `nomor_kunjungan` text DEFAULT NULL,
  `kode_provider_peserta` text DEFAULT NULL,
  `nomor_jaminan` text DEFAULT NULL,
  `kode_poli` text DEFAULT NULL,
  `nama_poli` text DEFAULT NULL,
  `kunjungan_sakit` text DEFAULT NULL,
  `sistole` text DEFAULT NULL,
  `diastole` text DEFAULT NULL,
  `nadi` text DEFAULT NULL,
  `respirasi` text DEFAULT NULL,
  `tinggi` text DEFAULT NULL,
  `berat` text DEFAULT NULL,
  `lingkar_perut` text DEFAULT NULL,
  `rujuk_balik` text DEFAULT NULL,
  `subyektif` text DEFAULT NULL,
  `kode_tkp` text DEFAULT NULL,
  `nomor_urut` text DEFAULT NULL,
  `kode_kesadaran` text DEFAULT NULL,
  `nama_kesadaran` text DEFAULT NULL,
  `terapi` text DEFAULT NULL,
  `kode_status_pulang` text DEFAULT NULL,
  `nama_status_pulang` text DEFAULT NULL,
  `tgl_pulang` text DEFAULT NULL,
  `tgl_kunjungan` text DEFAULT NULL,
  `kode_dokter` text DEFAULT NULL,
  `nama_dokter` text DEFAULT NULL,
  `kode_diagnosa1` text DEFAULT NULL,
  `nama_diagnosa1` text DEFAULT NULL,
  `kode_diagnosa2` text DEFAULT NULL,
  `nama_diagnosa2` text DEFAULT NULL,
  `kode_diagnosa3` text DEFAULT NULL,
  `nama_diagnosa3` text DEFAULT NULL,
  `tgl_estimasi_rujuk` text DEFAULT NULL,
  `kode_ppk` text DEFAULT NULL,
  `nama_ppk` text DEFAULT NULL,
  `kode_spesialis` text DEFAULT NULL,
  `nama_spesialis` text DEFAULT NULL,
  `kode_subspesialis` text DEFAULT NULL,
  `nama_subspesialis` text DEFAULT NULL,
  `kode_sarana` text DEFAULT NULL,
  `nama_sarana` text DEFAULT NULL,
  `kode_referensikhusus` text DEFAULT NULL,
  `nama_referensikhusus` text DEFAULT NULL,
  `kode_faskeskhusus` text DEFAULT NULL,
  `nama_faskeskhusus` text DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `kode_tacc` text DEFAULT NULL,
  `nama_tacc` text DEFAULT NULL,
  `alasan_tacc` text DEFAULT NULL,
  `id_user` text NOT NULL,
  `tgl_input` text NOT NULL,
  `status_kirim` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_detailjurnal`
--

CREATE TABLE `mlite_detailjurnal` (
  `no_jurnal` varchar(20) DEFAULT NULL,
  `kd_rek` varchar(15) DEFAULT NULL,
  `arus_kas` int(10) NOT NULL,
  `debet` double NOT NULL,
  `kredit` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_duitku`
--

CREATE TABLE `mlite_duitku` (
  `id` int(10) NOT NULL,
  `tanggal` datetime NOT NULL,
  `no_rkm_medis` varchar(15) NOT NULL,
  `paymentUrl` varchar(255) NOT NULL,
  `merchantCode` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `vaNumber` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `statusCode` varchar(255) NOT NULL,
  `statusMessage` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_fenton`
--

CREATE TABLE `mlite_fenton` (
  `id` int(11) NOT NULL,
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `usia_kehamilan` int(11) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `berat_badan` float NOT NULL,
  `lingkar_kepala` int(11) NOT NULL,
  `panjang_badan` int(11) NOT NULL,
  `petugas` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_geolocation_presensi`
--

CREATE TABLE `mlite_geolocation_presensi` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `latitude` varchar(200) NOT NULL,
  `longitude` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_jurnal`
--

CREATE TABLE `mlite_jurnal` (
  `no_jurnal` varchar(20) NOT NULL,
  `no_bukti` varchar(20) DEFAULT NULL,
  `tgl_jurnal` date DEFAULT NULL,
  `jenis` enum('U','P') DEFAULT NULL,
  `kegiatan` varchar(250) NOT NULL,
  `keterangan` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_login_attempts`
--

CREATE TABLE `mlite_login_attempts` (
  `ip` text DEFAULT NULL,
  `attempts` int(100) NOT NULL,
  `expires` int(100) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mlite_login_attempts`
--

INSERT INTO `mlite_login_attempts` (`ip`, `attempts`, `expires`) VALUES
('::1', 0, 1733661410),
('192.168.1.5', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mlite_modules`
--

CREATE TABLE `mlite_modules` (
  `id` int(11) NOT NULL,
  `dir` text DEFAULT NULL,
  `sequence` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mlite_modules`
--

INSERT INTO `mlite_modules` (`id`, `dir`, `sequence`) VALUES
(1, 'settings', '9'),
(2, 'dashboard', '0'),
(3, 'master', '1'),
(4, 'pasien', '2'),
(5, 'rawat_jalan', '3'),
(6, 'kasir_rawat_jalan', '4'),
(7, 'kepegawaian', '5'),
(8, 'farmasi', '6'),
(9, 'users', '8'),
(10, 'modules', '7'),
(11, 'wagateway', '10'),
(12, 'apotek_ralan', '11'),
(13, 'dokter_ralan', '12'),
(14, 'igd', '13'),
(15, 'dokter_igd', '14'),
(16, 'laboratorium', '15'),
(17, 'radiologi', '16'),
(18, 'icd_10', '17'),
(19, 'rawat_inap', '18'),
(20, 'apotek_ranap', '19'),
(21, 'dokter_ranap', '20'),
(22, 'kasir_rawat_inap', '21'),
(23, 'operasi', '22'),
(24, 'anjungan', '23'),
(25, 'api', '24'),
(26, 'jkn_mobile', '25'),
(27, 'vclaim', '26'),
(28, 'keuangan', '27'),
(29, 'manajemen', '28'),
(30, 'presensi', '29'),
(31, 'vedika', '30'),
(32, 'profil', '31'),
(33, 'orthanc', '32'),
(34, 'veronisa', '33'),
(35, 'icd_9', '34');

-- --------------------------------------------------------

--
-- Table structure for table `mlite_notifications`
--

CREATE TABLE `mlite_notifications` (
  `id` int(11) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `pesan` text NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `no_rkm_medis` varchar(255) NOT NULL,
  `status` varchar(250) NOT NULL DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_odontogram`
--

CREATE TABLE `mlite_odontogram` (
  `id` int(11) NOT NULL,
  `no_rkm_medis` text NOT NULL,
  `pemeriksaan` text DEFAULT NULL,
  `kondisi` text DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `id_user` text NOT NULL,
  `tgl_input` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_ohis`
--

CREATE TABLE `mlite_ohis` (
  `id` int(11) NOT NULL,
  `no_rkm_medis` text NOT NULL,
  `d_16` text DEFAULT NULL,
  `d_11` text DEFAULT NULL,
  `d_26` text DEFAULT NULL,
  `d_36` text DEFAULT NULL,
  `d_31` text DEFAULT NULL,
  `d_46` text DEFAULT NULL,
  `c_16` text DEFAULT NULL,
  `c_11` text DEFAULT NULL,
  `c_26` text DEFAULT NULL,
  `c_36` text DEFAULT NULL,
  `c_31` text DEFAULT NULL,
  `c_46` text DEFAULT NULL,
  `debris` text DEFAULT NULL,
  `calculus` text DEFAULT NULL,
  `nilai` text DEFAULT NULL,
  `kriteria` text DEFAULT NULL,
  `id_user` text NOT NULL,
  `tgl_input` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_pengaduan`
--

CREATE TABLE `mlite_pengaduan` (
  `id` varchar(15) NOT NULL,
  `tanggal` datetime NOT NULL,
  `no_rkm_medis` varchar(15) NOT NULL,
  `pesan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_pengaduan_detail`
--

CREATE TABLE `mlite_pengaduan_detail` (
  `id` int(10) NOT NULL,
  `pengaduan_id` varchar(15) NOT NULL,
  `tanggal` datetime NOT NULL,
  `no_rkm_medis` varchar(15) NOT NULL,
  `pesan` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_penilaian_awal_keperawatan_gigi`
--

CREATE TABLE `mlite_penilaian_awal_keperawatan_gigi` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `informasi` enum('Autoanamnesis','Alloanamnesis') NOT NULL,
  `td` varchar(8) NOT NULL DEFAULT '',
  `nadi` varchar(5) NOT NULL DEFAULT '',
  `rr` varchar(5) NOT NULL,
  `suhu` varchar(5) NOT NULL DEFAULT '',
  `bb` varchar(5) NOT NULL DEFAULT '',
  `tb` varchar(5) NOT NULL DEFAULT '',
  `bmi` varchar(10) NOT NULL,
  `keluhan_utama` varchar(150) NOT NULL DEFAULT '',
  `riwayat_penyakit` enum('Tidak Ada','Diabetes Melitus','Hipertensi','Penyakit Jantung','HIV','Hepatitis','Haemophilia','Lain-lain') DEFAULT NULL,
  `ket_riwayat_penyakit` varchar(30) NOT NULL,
  `alergi` varchar(25) NOT NULL DEFAULT '',
  `riwayat_perawatan_gigi` enum('Tidak','Ya, Kapan') NOT NULL,
  `ket_riwayat_perawatan_gigi` varchar(50) NOT NULL DEFAULT '',
  `kebiasaan_sikat_gigi` enum('1x','2x','3x','Mandi','Setelah Makan','Sebelum Tidur') NOT NULL,
  `kebiasaan_lain` enum('Tidak ada','Minum kopi/teh','Minum alkohol','Bruxism','Menggigit pensil','Mengunyah 1 sisi rahang','Merokok','Lain-lain') DEFAULT NULL,
  `ket_kebiasaan_lain` varchar(30) NOT NULL,
  `obat_yang_diminum_saatini` varchar(100) DEFAULT NULL,
  `alat_bantu` enum('Tidak','Ya') NOT NULL,
  `ket_alat_bantu` varchar(30) NOT NULL,
  `prothesa` enum('Tidak','Ya') NOT NULL,
  `ket_pro` varchar(50) NOT NULL,
  `status_psiko` enum('Tenang','Takut','Cemas','Depresi','Lain-lain') NOT NULL,
  `ket_psiko` varchar(70) NOT NULL,
  `hub_keluarga` enum('Baik','Tidak Baik') NOT NULL,
  `tinggal_dengan` enum('Sendiri','Orang Tua','Suami / Istri','Lainnya') NOT NULL,
  `ket_tinggal` varchar(40) NOT NULL,
  `ekonomi` enum('Baik','Cukup','Kurang') NOT NULL,
  `budaya` enum('Tidak Ada','Ada') NOT NULL,
  `ket_budaya` varchar(50) NOT NULL,
  `edukasi` enum('Pasien','Keluarga') NOT NULL,
  `ket_edukasi` varchar(50) NOT NULL,
  `berjalan_a` enum('Ya','Tidak') NOT NULL,
  `berjalan_b` enum('Ya','Tidak') NOT NULL,
  `berjalan_c` enum('Ya','Tidak') NOT NULL,
  `hasil` enum('Tidak beresiko (tidak ditemukan a dan b)','Resiko rendah (ditemukan a/b)','Resiko tinggi (ditemukan a dan b)') NOT NULL,
  `lapor` enum('Ya','Tidak') NOT NULL,
  `ket_lapor` varchar(15) NOT NULL,
  `nyeri` enum('Tidak Ada Nyeri','Nyeri Akut','Nyeri Kronis') NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `skala_nyeri` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL,
  `durasi` varchar(25) NOT NULL,
  `frekuensi` varchar(25) NOT NULL,
  `nyeri_hilang` enum('Istirahat','Medengar Musik','Minum Obat','Tidak ada nyeri','Lain-lain') NOT NULL,
  `ket_nyeri` varchar(40) NOT NULL,
  `pada_dokter` enum('Tidak','Ya') NOT NULL,
  `ket_dokter` varchar(15) NOT NULL,
  `kebersihan_mulut` enum('Baik','Cukup','Kurang') NOT NULL,
  `mukosa_mulut` enum('Normal','Pigmentasi','Radang') NOT NULL,
  `karies` enum('Ada','Tidak') NOT NULL,
  `karang_gigi` enum('Ada','Tidak') NOT NULL,
  `gingiva` enum('Normal','Radang') NOT NULL,
  `palatum` enum('Normal','Radang') NOT NULL,
  `rencana` varchar(200) NOT NULL,
  `nip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_penilaian_awal_keperawatan_ralan`
--

CREATE TABLE `mlite_penilaian_awal_keperawatan_ralan` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `informasi` enum('Autoanamnesis','Alloanamnesis') NOT NULL,
  `td` varchar(8) NOT NULL DEFAULT '',
  `nadi` varchar(5) NOT NULL DEFAULT '',
  `rr` varchar(5) NOT NULL,
  `suhu` varchar(5) NOT NULL DEFAULT '',
  `gcs` varchar(5) NOT NULL,
  `bb` varchar(5) NOT NULL DEFAULT '',
  `tb` varchar(5) NOT NULL DEFAULT '',
  `bmi` varchar(10) NOT NULL,
  `keluhan_utama` varchar(150) NOT NULL DEFAULT '',
  `rpd` varchar(100) NOT NULL DEFAULT '',
  `rpk` varchar(100) NOT NULL,
  `rpo` varchar(100) NOT NULL,
  `alergi` varchar(25) NOT NULL DEFAULT '',
  `alat_bantu` enum('Tidak','Ya') NOT NULL,
  `ket_bantu` varchar(50) NOT NULL DEFAULT '',
  `prothesa` enum('Tidak','Ya') NOT NULL,
  `ket_pro` varchar(50) NOT NULL,
  `adl` enum('Mandiri','Dibantu') NOT NULL,
  `status_psiko` enum('Tenang','Takut','Cemas','Depresi','Lain-lain') NOT NULL,
  `ket_psiko` varchar(70) NOT NULL,
  `hub_keluarga` enum('Baik','Tidak Baik') NOT NULL,
  `tinggal_dengan` enum('Sendiri','Orang Tua','Suami / Istri','Lainnya') NOT NULL,
  `ket_tinggal` varchar(40) NOT NULL,
  `ekonomi` enum('Baik','Cukup','Kurang') NOT NULL,
  `budaya` enum('Tidak Ada','Ada') NOT NULL,
  `ket_budaya` varchar(50) NOT NULL,
  `edukasi` enum('Pasien','Keluarga') NOT NULL,
  `ket_edukasi` varchar(50) NOT NULL,
  `berjalan_a` enum('Ya','Tidak') NOT NULL,
  `berjalan_b` enum('Ya','Tidak') NOT NULL,
  `berjalan_c` enum('Ya','Tidak') NOT NULL,
  `hasil` enum('Tidak beresiko (tidak ditemukan a dan b)','Resiko rendah (ditemukan a/b)','Resiko tinggi (ditemukan a dan b)') NOT NULL,
  `lapor` enum('Ya','Tidak') NOT NULL,
  `ket_lapor` varchar(15) NOT NULL,
  `sg1` enum('Tidak','Tidak Yakin','Ya, 1-5 Kg','Ya, 6-10 Kg','Ya, 11-15 Kg','Ya, >15 Kg') NOT NULL,
  `nilai1` enum('0','1','2','3','4') NOT NULL,
  `sg2` enum('Ya','Tidak') NOT NULL,
  `nilai2` enum('0','1') NOT NULL,
  `total_hasil` tinyint(4) NOT NULL,
  `nyeri` enum('Tidak Ada Nyeri','Nyeri Akut','Nyeri Kronis') NOT NULL,
  `provokes` enum('Proses Penyakit','Benturan','Lain-lain') NOT NULL,
  `ket_provokes` varchar(40) NOT NULL,
  `quality` enum('Seperti Tertusuk','Berdenyut','Teriris','Tertindih','Tertiban','Lain-lain') NOT NULL,
  `ket_quality` varchar(50) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `menyebar` enum('Tidak','Ya') NOT NULL,
  `skala_nyeri` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL,
  `durasi` varchar(25) NOT NULL,
  `nyeri_hilang` enum('Istirahat','Medengar Musik','Minum Obat') NOT NULL,
  `ket_nyeri` varchar(40) NOT NULL,
  `pada_dokter` enum('Tidak','Ya') NOT NULL,
  `ket_dokter` varchar(15) NOT NULL,
  `rencana` varchar(200) NOT NULL,
  `nip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_penilaian_awal_keperawatan_ranap`
--

CREATE TABLE `mlite_penilaian_awal_keperawatan_ranap` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `informasi` enum('Autoanamnesis','Alloanamnesis') NOT NULL,
  `ket_informasi` varchar(30) NOT NULL,
  `tiba_diruang_rawat` enum('Jalan Tanpa Bantuan','Kursi Roda','Brankar') NOT NULL,
  `kasus_trauma` enum('Trauma','Non Trauma') DEFAULT NULL,
  `cara_masuk` enum('Poli','IGD','Lain-lain') NOT NULL,
  `rps` varchar(300) NOT NULL,
  `rpd` varchar(100) NOT NULL,
  `rpk` varchar(100) NOT NULL,
  `rpo` varchar(100) NOT NULL,
  `riwayat_pembedahan` varchar(40) NOT NULL,
  `riwayat_dirawat_dirs` varchar(40) NOT NULL,
  `alat_bantu_dipakai` enum('Kacamata','Prothesa','Alat Bantu Dengar','Lain-lain') NOT NULL,
  `riwayat_kehamilan` enum('Tidak','Ya') NOT NULL,
  `riwayat_kehamilan_perkiraan` varchar(30) NOT NULL,
  `riwayat_tranfusi` varchar(40) NOT NULL,
  `riwayat_alergi` varchar(40) NOT NULL,
  `riwayat_merokok` enum('Tidak','Ya') NOT NULL,
  `riwayat_merokok_jumlah` varchar(5) NOT NULL,
  `riwayat_alkohol` enum('Tidak','Ya') NOT NULL,
  `riwayat_alkohol_jumlah` varchar(5) NOT NULL,
  `riwayat_narkoba` enum('Tidak','Ya') NOT NULL,
  `riwayat_olahraga` enum('Tidak','Ya') NOT NULL,
  `pemeriksaan_mental` varchar(40) NOT NULL,
  `pemeriksaan_keadaan_umum` enum('Baik','Sedang','Buruk') NOT NULL,
  `pemeriksaan_gcs` varchar(10) NOT NULL,
  `pemeriksaan_td` varchar(8) NOT NULL,
  `pemeriksaan_nadi` varchar(5) NOT NULL,
  `pemeriksaan_rr` varchar(5) NOT NULL,
  `pemeriksaan_suhu` varchar(5) NOT NULL,
  `pemeriksaan_spo2` varchar(5) NOT NULL,
  `pemeriksaan_bb` varchar(5) NOT NULL,
  `pemeriksaan_tb` varchar(5) NOT NULL,
  `pemeriksaan_susunan_kepala` enum('TAK','Hydrocephalus','Hematoma','Lain-lain') NOT NULL,
  `pemeriksaan_susunan_wajah` enum('TAK','Asimetris','Kelainan Kongenital') NOT NULL,
  `pemeriksaan_susunan_leher` enum('TAK','Kaku Kuduk','Pembesaran Thyroid','Pembesaran KGB') NOT NULL,
  `pemeriksaan_susunan_kejang` enum('TAK','Kuat','Ada') NOT NULL,
  `pemeriksaan_susunan_sensorik` enum('TAK','Sakit Nyeri','Rasa kebas') NOT NULL,
  `pemeriksaan_kardiovaskuler_denyut_nadi` enum('Teratur','Tidak Teratur') NOT NULL,
  `pemeriksaan_kardiovaskuler_sirkulasi` enum('Akral Hangat','Akral Dingin','Edema') NOT NULL,
  `pemeriksaan_kardiovaskuler_pulsasi` enum('Kuat','Lemah','Lain-lain') NOT NULL,
  `pemeriksaan_respirasi_pola_nafas` enum('Normal','Bradipnea','Tachipnea') NOT NULL,
  `pemeriksaan_respirasi_retraksi` enum('Tidak Ada','Ringan','Berat') NOT NULL,
  `pemeriksaan_respirasi_suara_nafas` enum('Vesikuler','Wheezing','Rhonki') NOT NULL,
  `pemeriksaan_respirasi_volume_pernafasan` enum('Normal','Hiperventilasi','Hipoventilasi') NOT NULL,
  `pemeriksaan_respirasi_jenis_pernafasan` enum('Pernafasan Dada','Alat Bantu Pernafasaan') NOT NULL,
  `pemeriksaan_respirasi_irama_nafas` enum('Teratur','Tidak Teratur') NOT NULL,
  `pemeriksaan_respirasi_batuk` enum('Tidak','Ya : Produktif','Ya : Non Produktif') NOT NULL,
  `pemeriksaan_gastrointestinal_mulut` enum('TAK','Stomatitis','Mukosa Kering','Bibir Pucat','Lain-lain') NOT NULL,
  `pemeriksaan_gastrointestinal_gigi` enum('TAK','Karies','Goyang','Lain-lain') NOT NULL,
  `pemeriksaan_gastrointestinal_lidah` enum('TAK','Kotor','Gerak Asimetris','Lain-lain') NOT NULL,
  `pemeriksaan_gastrointestinal_tenggorokan` enum('TAK','Gangguan Menelan','Sakit Menelan','Lain-lain') NOT NULL,
  `pemeriksaan_gastrointestinal_abdomen` enum('Supel','Asictes',' Tegang','Nyeri Tekan/Lepas','Lain-lain') NOT NULL,
  `pemeriksaan_gastrointestinal_peistatik_usus` enum('TAK','Tidak Ada Bising Usus','Hiperistaltik') NOT NULL,
  `pemeriksaan_gastrointestinal_anus` enum('TAK','Atresia Ani') NOT NULL,
  `pemeriksaan_neurologi_pengelihatan` enum('TAK','Ada Kelainan') NOT NULL,
  `pemeriksaan_neurologi_alat_bantu_penglihatan` enum('Tidak','Kacamata','Lensa Kontak') NOT NULL,
  `pemeriksaan_neurologi_pendengaran` enum('TAK','Berdengung','Nyeri','Tuli','Keluar Cairan','Lain-lain') NOT NULL,
  `pemeriksaan_neurologi_bicara` enum('Jelas','Tidak Jelas') NOT NULL,
  `pemeriksaan_neurologi_sensorik` enum('TAK','Sakit Nyeri','Rasa Kebas','Lain-lain') NOT NULL,
  `pemeriksaan_neurologi_motorik` enum('TAK','Hemiparese','Tetraparese','Tremor','Lain-lain') NOT NULL,
  `pemeriksaan_neurologi_kekuatan_otot` enum('Kuat','Lemah') NOT NULL,
  `pemeriksaan_integument_warnakulit` enum('Pucat','Sianosis','Normal','Lain-lain') NOT NULL,
  `pemeriksaan_integument_turgor` enum('Baik','Sedang','Buruk') NOT NULL,
  `pemeriksaan_integument_kulit` enum('Normal','Rash/Kemerahan','Luka','Memar','Ptekie','Bula') NOT NULL,
  `pemeriksaan_integument_dekubitas` enum('Tidak Ada','Usia > 65 tahun','Obesitas','Imobilisasi','Paraplegi/Vegetative State','Dirawat Di HCU','Penyakit Kronis (DM, CHF, CKD)','Inkontinentia Uri/Alvi') NOT NULL,
  `pemeriksaan_muskuloskletal_pergerakan_sendi` enum('Bebas','Terbatas') NOT NULL,
  `pemeriksaan_muskuloskletal_kekauatan_otot` enum('Baik','Lemah','Tremor') NOT NULL,
  `pemeriksaan_muskuloskletal_nyeri_sendi` enum('Tidak Ada','Ada') NOT NULL,
  `pemeriksaan_muskuloskletal_oedema` enum('Tidak Ada','Ada') NOT NULL,
  `pemeriksaan_muskuloskletal_fraktur` enum('Tidak Ada','Ada') NOT NULL,
  `pemeriksaan_eliminasi_bab_frekuensi_jumlah` varchar(5) NOT NULL,
  `pemeriksaan_eliminasi_bab_frekuensi_durasi` varchar(10) NOT NULL,
  `pemeriksaan_eliminasi_bab_konsistensi` varchar(30) NOT NULL,
  `pemeriksaan_eliminasi_bab_warna` varchar(30) NOT NULL,
  `pemeriksaan_eliminasi_bak_frekuensi_jumlah` varchar(5) NOT NULL,
  `pemeriksaan_eliminasi_bak_frekuensi_durasi` varchar(10) NOT NULL,
  `pemeriksaan_eliminasi_bak_warna` varchar(30) NOT NULL,
  `pemeriksaan_eliminasi_bak_lainlain` varchar(30) NOT NULL,
  `pola_aktifitas_makanminum` enum('Mandiri','Bantuan Orang Lain') NOT NULL,
  `pola_aktifitas_mandi` enum('Mandiri','Bantuan Orang Lain') NOT NULL,
  `pola_aktifitas_eliminasi` enum('Mandiri','Bantuan Orang Lain') NOT NULL,
  `pola_aktifitas_berpakaian` enum('Mandiri','Bantuan Orang Lain') NOT NULL,
  `pola_aktifitas_berpindah` enum('Mandiri','Bantuan Orang Lain') NOT NULL,
  `pola_nutrisi_frekuesi_makan` varchar(3) NOT NULL,
  `pola_nutrisi_jenis_makanan` varchar(20) NOT NULL,
  `pola_nutrisi_porsi_makan` varchar(3) NOT NULL,
  `pola_tidur_lama_tidur` varchar(3) NOT NULL,
  `pola_tidur_gangguan` enum('Tidak Ada Gangguan','Insomnia') NOT NULL,
  `pengkajian_fungsi_kemampuan_sehari` enum('Mandiri','Bantuan Minimal','Bantuan Sebagian','Ketergantungan Total') NOT NULL,
  `pengkajian_fungsi_aktifitas` enum('Tirah Baring','Duduk','Berjalan') NOT NULL,
  `pengkajian_fungsi_berjalan` enum('TAK','Penurunan Kekuatan/ROM','Paralisis','Sering Jatuh','Deformitas','Hilang Keseimbangan','Riwayat Patah Tulang','Lain-lain') NOT NULL,
  `pengkajian_fungsi_ambulasi` enum('Walker','Tongkat','Kursi Roda','Tidak Menggunakan') NOT NULL,
  `pengkajian_fungsi_ekstrimitas_atas` enum('TAK','Lemah','Oedema','Tidak Simetris','Lain-lain') NOT NULL,
  `pengkajian_fungsi_ekstrimitas_bawah` enum('TAK','Varises','Oedema','Tidak Simetris','Lain-lain') NOT NULL,
  `pengkajian_fungsi_menggenggam` enum('Tidak Ada Kesulitan','Terakhir','Lain-lain') NOT NULL,
  `pengkajian_fungsi_koordinasi` enum('Tidak Ada Kesulitan','Ada Masalah') NOT NULL,
  `pengkajian_fungsi_kesimpulan` enum('Ya (Co DPJP)','Tidak (Tidak Perlu Co DPJP)') NOT NULL,
  `riwayat_psiko_kondisi_psiko` enum('Tidak Ada Masalah','Marah','Takut','Depresi','Cepat Lelah','Cemas','Gelisah','Sulit Tidur','Lain-lain') NOT NULL,
  `riwayat_psiko_gangguan_jiwa` enum('Ya','Tidak') NOT NULL,
  `riwayat_psiko_perilaku` enum('Tidak Ada Masalah','Perilaku Kekerasan','Gangguan Efek','Gangguan Memori','Halusinasi','Kecenderungan Percobaan Bunuh Diri','Lain-lain') NOT NULL,
  `riwayat_psiko_hubungan_keluarga` enum('Harmonis','Kurang Harmonis','Tidak Harmonis','Konflik Besar') NOT NULL,
  `riwayat_psiko_tinggal` enum('Sendiri','Orang Tua','Suami/Istri','Keluarga','Lain-lain') NOT NULL,
  `riwayat_psiko_nilai_kepercayaan` enum('Tidak Ada','Ada') NOT NULL,
  `riwayat_psiko_pendidikan_pj` enum('-','TS','TK','SD','SMP','SMA','SLTA/SEDERAJAT','D1','D2','D3','D4','S1','S2','S3') NOT NULL,
  `riwayat_psiko_edukasi_diberikan` enum('Pasien','Keluarga') NOT NULL,
  `penilaian_nyeri` enum('Tidak Ada Nyeri','Nyeri Akut','Nyeri Kronis') NOT NULL,
  `penilaian_nyeri_penyebab` enum('Proses Penyakit','Benturan','Lain-lain') NOT NULL,
  `penilaian_nyeri_kualitas` enum('Seperti Tertusuk','Berdenyut','Teriris','Tertindih','Tertiban','Lain-lain') NOT NULL,
  `penilaian_nyeri_lokasi` varchar(50) NOT NULL,
  `penilaian_nyeri_menyebar` enum('Tidak','Ya') NOT NULL,
  `penilaian_nyeri_skala` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL,
  `penilaian_nyeri_waktu` varchar(5) NOT NULL,
  `penilaian_nyeri_hilang` enum('Istirahat','Medengar Musik','Minum Obat') NOT NULL,
  `penilaian_nyeri_diberitahukan_dokter` enum('Tidak','Ya') NOT NULL,
  `penilaian_nyeri_jam_diberitahukan_dokter` varchar(10) NOT NULL,
  `penilaian_jatuhmorse_skala1` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhmorse_nilai1` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhmorse_skala2` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhmorse_nilai2` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhmorse_skala3` enum('Tidak Ada/Kursi Roda/Perawat/Tirah Baring','Tongkat/Alat Penopang','Berpegangan Pada Perabot') DEFAULT NULL,
  `penilaian_jatuhmorse_nilai3` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhmorse_skala4` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhmorse_nilai4` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhmorse_skala5` enum('Normal/Tirah Baring/Imobilisasi','Lemah','Terganggu') DEFAULT NULL,
  `penilaian_jatuhmorse_nilai5` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhmorse_skala6` enum('Sadar Akan Kemampuan Diri Sendiri','Sering Lupa Akan Keterbatasan Yang Dimiliki') DEFAULT NULL,
  `penilaian_jatuhmorse_nilai6` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhmorse_totalnilai` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_skala1` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhsydney_nilai1` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_skala2` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhsydney_nilai2` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_skala3` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhsydney_nilai3` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_skala4` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhsydney_nilai4` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_skala5` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhsydney_nilai5` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_skala6` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhsydney_nilai6` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_skala7` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhsydney_nilai7` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_skala8` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhsydney_nilai8` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_skala9` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhsydney_nilai9` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_skala10` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhsydney_nilai10` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_skala11` enum('Tidak','Ya') DEFAULT NULL,
  `penilaian_jatuhsydney_nilai11` tinyint(4) DEFAULT NULL,
  `penilaian_jatuhsydney_totalnilai` tinyint(4) DEFAULT NULL,
  `skrining_gizi1` enum('Tidak ada penurunan berat badan','Tidak yakin/ tidak tahu/ terasa baju lebih longgar','Ya 1-5 kg','Ya 6-10 kg','Ya 11-15 kg','Ya > 15 kg') DEFAULT NULL,
  `nilai_gizi1` int(11) DEFAULT NULL,
  `skrining_gizi2` enum('Tidak','Ya') DEFAULT NULL,
  `nilai_gizi2` int(11) DEFAULT NULL,
  `nilai_total_gizi` double DEFAULT NULL,
  `skrining_gizi_diagnosa_khusus` enum('Tidak','Ya') DEFAULT NULL,
  `skrining_gizi_diketahui_dietisen` enum('Tidak','Ya') DEFAULT NULL,
  `skrining_gizi_jam_diketahui_dietisen` varchar(10) DEFAULT NULL,
  `rencana` varchar(200) DEFAULT NULL,
  `nip1` varchar(20) NOT NULL,
  `nip2` varchar(20) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_penilaian_medis_igd`
--

CREATE TABLE `mlite_penilaian_medis_igd` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `anamnesis` enum('Autoanamnesis','Alloanamnesis') NOT NULL,
  `hubungan` varchar(100) NOT NULL,
  `keluhan_utama` varchar(2000) NOT NULL DEFAULT '',
  `rps` varchar(2000) NOT NULL,
  `rpd` varchar(1000) NOT NULL DEFAULT '',
  `rpk` varchar(1000) NOT NULL,
  `rpo` varchar(1000) NOT NULL,
  `alergi` varchar(100) NOT NULL DEFAULT '',
  `keadaan` enum('Sehat','Sakit Ringan','Sakit Sedang','Sakit Berat') NOT NULL,
  `gcs` varchar(10) NOT NULL,
  `kesadaran` enum('Compos Mentis','Apatis','Somnolen','Sopor','Koma') NOT NULL,
  `td` varchar(8) NOT NULL DEFAULT '',
  `nadi` varchar(5) NOT NULL DEFAULT '',
  `rr` varchar(5) NOT NULL,
  `suhu` varchar(5) NOT NULL DEFAULT '',
  `spo` varchar(5) NOT NULL,
  `bb` varchar(5) NOT NULL DEFAULT '',
  `tb` varchar(5) NOT NULL DEFAULT '',
  `kepala` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `mata` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `gigi` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `leher` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `thoraks` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `abdomen` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `genital` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `ekstremitas` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `ket_fisik` text NOT NULL,
  `ket_lokalis` text NOT NULL,
  `ekg` text NOT NULL,
  `rad` text NOT NULL,
  `lab` text NOT NULL,
  `diagnosis` varchar(500) NOT NULL,
  `tata` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_penilaian_medis_ralan`
--

CREATE TABLE `mlite_penilaian_medis_ralan` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `anamnesis` enum('Autoanamnesis','Alloanamnesis') NOT NULL,
  `hubungan` varchar(30) NOT NULL,
  `keluhan_utama` varchar(2000) NOT NULL DEFAULT '',
  `rps` varchar(2000) NOT NULL,
  `rpd` varchar(1000) NOT NULL DEFAULT '',
  `rpk` varchar(1000) NOT NULL,
  `rpo` varchar(1000) NOT NULL,
  `alergi` varchar(50) NOT NULL DEFAULT '',
  `keadaan` enum('Sehat','Sakit Ringan','Sakit Sedang','Sakit Berat') NOT NULL,
  `gcs` varchar(10) NOT NULL,
  `kesadaran` enum('Compos Mentis','Apatis','Somnolen','Sopor','Koma') NOT NULL,
  `td` varchar(8) NOT NULL DEFAULT '',
  `nadi` varchar(5) NOT NULL DEFAULT '',
  `rr` varchar(5) NOT NULL,
  `suhu` varchar(5) NOT NULL DEFAULT '',
  `spo` varchar(5) NOT NULL,
  `bb` varchar(5) NOT NULL DEFAULT '',
  `tb` varchar(5) NOT NULL DEFAULT '',
  `kepala` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `gigi` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `tht` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `thoraks` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `abdomen` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `genital` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `ekstremitas` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `kulit` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `ket_fisik` text NOT NULL,
  `ket_lokalis` text NOT NULL,
  `penunjang` text NOT NULL,
  `diagnosis` varchar(500) NOT NULL,
  `tata` text NOT NULL,
  `konsulrujuk` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_penilaian_medis_ranap`
--

CREATE TABLE `mlite_penilaian_medis_ranap` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `anamnesis` enum('Autoanamnesis','Alloanamnesis') NOT NULL,
  `hubungan` varchar(100) NOT NULL,
  `keluhan_utama` varchar(2000) NOT NULL DEFAULT '',
  `rps` varchar(2000) NOT NULL,
  `rpd` varchar(1000) NOT NULL DEFAULT '',
  `rpk` varchar(1000) NOT NULL,
  `rpo` varchar(1000) NOT NULL,
  `alergi` varchar(100) NOT NULL DEFAULT '',
  `keadaan` enum('Sehat','Sakit Ringan','Sakit Sedang','Sakit Berat') NOT NULL,
  `gcs` varchar(10) NOT NULL,
  `kesadaran` enum('Compos Mentis','Apatis','Somnolen','Sopor','Koma') NOT NULL,
  `td` varchar(8) NOT NULL DEFAULT '',
  `nadi` varchar(5) NOT NULL DEFAULT '',
  `rr` varchar(5) NOT NULL,
  `suhu` varchar(5) NOT NULL DEFAULT '',
  `spo` varchar(5) NOT NULL,
  `bb` varchar(5) NOT NULL DEFAULT '',
  `tb` varchar(5) NOT NULL DEFAULT '',
  `kepala` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `mata` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `gigi` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `tht` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `thoraks` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `jantung` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `paru` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `abdomen` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `genital` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `ekstremitas` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `kulit` enum('Normal','Abnormal','Tidak Diperiksa') NOT NULL,
  `ket_fisik` text NOT NULL,
  `ket_lokalis` text NOT NULL,
  `lab` text NOT NULL,
  `rad` text NOT NULL,
  `penunjang` text NOT NULL,
  `diagnosis` varchar(500) NOT NULL,
  `tata` text NOT NULL,
  `edukasi` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_penilaian_ulang_nyeri`
--

CREATE TABLE `mlite_penilaian_ulang_nyeri` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `nyeri` enum('Tidak Ada Nyeri','Nyeri Akut','Nyeri Kronis') NOT NULL,
  `provokes` enum('Proses Penyakit','Benturan','Lain-lain','-') NOT NULL,
  `ket_provokes` varchar(40) NOT NULL,
  `quality` enum('Seperti Tertusuk','Berdenyut','Teriris','Tertindih','Tertiban','Lain-lain','-') NOT NULL,
  `ket_quality` varchar(50) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `menyebar` enum('Tidak','Ya') NOT NULL,
  `skala_nyeri` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL,
  `durasi` varchar(25) NOT NULL,
  `nyeri_hilang` enum('Istirahat','Medengar Musik','Minum Obat','-') NOT NULL,
  `ket_nyeri` varchar(40) NOT NULL,
  `manajemen_nyeri` varchar(1000) DEFAULT NULL,
  `nip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_penjualan`
--

CREATE TABLE `mlite_penjualan` (
  `id` int(11) NOT NULL,
  `nama_pembeli` varchar(100) DEFAULT NULL,
  `alamat_pembeli` varchar(100) DEFAULT NULL,
  `nomor_telepon` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_penjualan_barang`
--

CREATE TABLE `mlite_penjualan_barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `stok` varchar(100) DEFAULT NULL,
  `harga` varchar(100) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_penjualan_billing`
--

CREATE TABLE `mlite_penjualan_billing` (
  `id` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `jumlah_total` int(100) NOT NULL,
  `potongan` int(100) DEFAULT NULL,
  `jumlah_harus_bayar` int(100) NOT NULL,
  `jumlah_bayar` int(100) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `id_user` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_penjualan_detail`
--

CREATE TABLE `mlite_penjualan_detail` (
  `id` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `harga_total` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `id_user` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_peta_mukosa_rongga_mulut`
--

CREATE TABLE `mlite_peta_mukosa_rongga_mulut` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `kelainan` text DEFAULT NULL,
  `gambar` text DEFAULT NULL,
  `nip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_rekening`
--

CREATE TABLE `mlite_rekening` (
  `kd_rek` varchar(15) NOT NULL DEFAULT '',
  `nm_rek` varchar(100) DEFAULT NULL,
  `tipe` enum('N','M','R') DEFAULT NULL,
  `balance` enum('D','K') DEFAULT NULL,
  `level` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_rekeningtahun`
--

CREATE TABLE `mlite_rekeningtahun` (
  `thn` year(4) NOT NULL,
  `kd_rek` varchar(15) NOT NULL DEFAULT '',
  `saldo_awal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_remember_me`
--

CREATE TABLE `mlite_remember_me` (
  `id` int(11) NOT NULL,
  `token` text DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `expiry` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_satu_sehat_departemen`
--

CREATE TABLE `mlite_satu_sehat_departemen` (
  `dep_id` char(4) NOT NULL,
  `id_organisasi_satusehat` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_satu_sehat_lokasi`
--

CREATE TABLE `mlite_satu_sehat_lokasi` (
  `kode` char(5) NOT NULL,
  `lokasi` varchar(40) DEFAULT NULL,
  `id_organisasi_satusehat` varchar(40) DEFAULT NULL,
  `id_lokasi_satusehat` varchar(40) DEFAULT NULL,
  `longitude` varchar(30) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `altitude` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_satu_sehat_mapping_praktisi`
--

CREATE TABLE `mlite_satu_sehat_mapping_praktisi` (
  `practitioner_id` varchar(40) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_satu_sehat_response`
--

CREATE TABLE `mlite_satu_sehat_response` (
  `no_rawat` varchar(17) NOT NULL,
  `id_encounter` varchar(50) DEFAULT NULL,
  `id_condition` varchar(50) DEFAULT NULL,
  `id_observation_ttvnadi` varchar(50) DEFAULT NULL,
  `id_observation_ttvrespirasi` varchar(50) DEFAULT NULL,
  `id_observation_ttvsuhu` varchar(50) DEFAULT NULL,
  `id_observation_ttvspo2` varchar(50) DEFAULT NULL,
  `id_observation_ttvgcs` varchar(50) DEFAULT NULL,
  `id_observation_ttvtinggi` varchar(50) DEFAULT NULL,
  `id_observation_ttvberat` varchar(50) DEFAULT NULL,
  `id_observation_ttvperut` varchar(50) DEFAULT NULL,
  `id_observation_ttvtensi` varchar(50) DEFAULT NULL,
  `id_observation_ttvkesadaran` varchar(50) DEFAULT NULL,
  `id_procedure` varchar(50) DEFAULT NULL,
  `id_composition` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_settings`
--

CREATE TABLE `mlite_settings` (
  `id` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `value` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mlite_settings`
--

INSERT INTO `mlite_settings` (`id`, `module`, `field`, `value`) VALUES
(1, 'settings', 'logo', 'uploads/settings/logo_67559f8f76321.png'),
(2, 'settings', 'nama_instansi', 'Klinik'),
(3, 'settings', 'alamat', 'Jl. Perintis Kemerdekaan 45'),
(4, 'settings', 'kota', 'Barabai'),
(5, 'settings', 'propinsi', 'Kalimantan Selatan'),
(6, 'settings', 'nomor_telepon', '0812345678'),
(7, 'settings', 'email', 'info@mlite.id'),
(8, 'settings', 'website', 'https://mlite.id'),
(9, 'settings', 'ppk_bpjs', '-'),
(10, 'settings', 'footer', 'Copyright {?=date(\"Y\")?} &copy; by drg. F. Basoro. All rights reserved.'),
(11, 'settings', 'homepage', 'main'),
(12, 'settings', 'wallpaper', 'uploads/settings/wallpaper_67559f8fa5c50.jpg'),
(13, 'settings', 'text_color', '#44813e'),
(14, 'settings', 'igd', 'UMU'),
(15, 'settings', 'laboratorium', '-'),
(16, 'settings', 'pj_laboratorium', 'DR001'),
(17, 'settings', 'radiologi', '-'),
(18, 'settings', 'pj_radiologi', 'DR001'),
(19, 'settings', 'dokter_ralan_per_dokter', 'false'),
(20, 'settings', 'cekstatusbayar', 'true'),
(21, 'settings', 'ceklimit', 'false'),
(22, 'settings', 'responsivevoice', 'true'),
(23, 'settings', 'notif_presensi', 'false'),
(24, 'settings', 'BpjsApiUrl', 'https://apijkn-dev.bpjs-kesehatan.go.id/vclaim-rest-dev/'),
(25, 'settings', 'BpjsConsID', '-'),
(26, 'settings', 'BpjsSecretKey', '-'),
(27, 'settings', 'BpjsUserKey', '-'),
(28, 'settings', 'timezone', 'Asia/Bangkok'),
(29, 'settings', 'theme', 'default'),
(30, 'settings', 'theme_admin', 'mlite'),
(31, 'settings', 'admin_mode', 'complex'),
(32, 'settings', 'input_kasir', 'tidak'),
(33, 'settings', 'editor', 'wysiwyg'),
(34, 'settings', 'version', '4.1.8'),
(35, 'settings', 'update_check', '0'),
(36, 'settings', 'update_changelog', ''),
(37, 'settings', 'update_version', '0'),
(38, 'settings', 'license', ''),
(39, 'farmasi', 'deporalan', 'APT'),
(40, 'farmasi', 'igd', 'APT'),
(41, 'farmasi', 'deporanap', 'APT'),
(42, 'farmasi', 'gudang', 'APT'),
(43, 'wagateway', 'server', 'https://mlite.id'),
(44, 'wagateway', 'token', '-'),
(45, 'wagateway', 'phonenumber', '-'),
(46, 'anjungan', 'display_poli', ''),
(47, 'anjungan', 'carabayar', ''),
(48, 'anjungan', 'antrian_loket', '1'),
(49, 'anjungan', 'antrian_cs', '2'),
(50, 'anjungan', 'antrian_apotek', '3'),
(51, 'anjungan', 'panggil_loket', '1'),
(52, 'anjungan', 'panggil_loket_nomor', '1'),
(53, 'anjungan', 'panggil_cs', '1'),
(54, 'anjungan', 'panggil_cs_nomor', '1'),
(55, 'anjungan', 'panggil_apotek', '1'),
(56, 'anjungan', 'panggil_apotek_nomor', '1'),
(57, 'anjungan', 'text_anjungan', 'Running text anjungan pasien mandiri.....'),
(58, 'anjungan', 'text_loket', 'Running text display antrian loket.....'),
(59, 'anjungan', 'text_poli', 'Running text display antrian poliklinik.....'),
(60, 'anjungan', 'text_laboratorium', 'Running text display antrian laboratorium.....'),
(61, 'anjungan', 'text_apotek', 'Running text display antrian apotek.....'),
(62, 'anjungan', 'text_farmasi', 'Running text display antrian farmasi.....'),
(63, 'anjungan', 'vidio', 'G4im8_n0OoI'),
(64, 'api', 'apam_key', 'qtbexUAxzqO3M8dCOo2vDMFvgYjdUEdMLVo341'),
(65, 'api', 'apam_status_daftar', 'Terdaftar'),
(66, 'api', 'apam_status_dilayani', 'Anda siap dilayani'),
(67, 'api', 'apam_webappsurl', 'http://localhost/webapps/'),
(68, 'api', 'apam_normpetugas', '000001,000002'),
(69, 'api', 'apam_limit', '2'),
(70, 'api', 'apam_smtp_host', 'ssl://smtp.gmail.com'),
(71, 'api', 'apam_smtp_port', '465'),
(72, 'api', 'apam_smtp_username', ''),
(73, 'api', 'apam_smtp_password', ''),
(74, 'api', 'apam_kdpj', ''),
(75, 'api', 'apam_kdprop', ''),
(76, 'api', 'apam_kdkab', ''),
(77, 'api', 'apam_kdkec', ''),
(78, 'api', 'duitku_merchantCode', ''),
(79, 'api', 'duitku_merchantKey', ''),
(80, 'api', 'duitku_paymentAmount', ''),
(81, 'api', 'duitku_paymentMethod', ''),
(82, 'api', 'duitku_productDetails', ''),
(83, 'api', 'duitku_expiryPeriod', ''),
(84, 'api', 'duitku_kdpj', ''),
(85, 'api', 'berkasdigital_key', 'qtbexUAxzqO3M8dCOo2vDMFvgYjdUEdMLVo341'),
(86, 'jkn_mobile', 'x_username', 'jkn'),
(87, 'jkn_mobile', 'x_password', 'mobile'),
(88, 'jkn_mobile', 'header_token', 'X-Token'),
(89, 'jkn_mobile', 'header_username', 'X-Username'),
(90, 'jkn_mobile', 'header_password', 'X-Password'),
(91, 'jkn_mobile', 'BpjsConsID', ''),
(92, 'jkn_mobile', 'BpjsSecretKey', ''),
(93, 'jkn_mobile', 'BpjsUserKey', ''),
(94, 'jkn_mobile', 'BpjsAntrianUrl', 'https://apijkn-dev.bpjs-kesehatan.go.id/antreanrs_dev/'),
(95, 'jkn_mobile', 'kd_pj_bpjs', ''),
(96, 'jkn_mobile', 'exclude_taskid', ''),
(97, 'jkn_mobile', 'display', ''),
(98, 'jkn_mobile', 'kdprop', '1'),
(99, 'jkn_mobile', 'kdkab', '1'),
(100, 'jkn_mobile', 'kdkec', '1'),
(101, 'jkn_mobile', 'kdkel', '1'),
(102, 'jkn_mobile', 'perusahaan_pasien', ''),
(103, 'jkn_mobile', 'suku_bangsa', ''),
(104, 'jkn_mobile', 'bahasa_pasien', ''),
(105, 'jkn_mobile', 'cacat_fisik', ''),
(106, 'keuangan', 'jurnal_kasir', '0'),
(107, 'keuangan', 'akun_kredit_pendaftaran', ''),
(108, 'keuangan', 'akun_kredit_tindakan', ''),
(109, 'keuangan', 'akun_kredit_obat_bhp', ''),
(110, 'keuangan', 'akun_kredit_laboratorium', ''),
(111, 'keuangan', 'akun_kredit_radiologi', ''),
(112, 'keuangan', 'akun_kredit_tambahan_biaya', ''),
(113, 'manajemen', 'penjab_umum', 'UMU'),
(114, 'manajemen', 'penjab_bpjs', 'BPJ'),
(115, 'presensi', 'lat', '-2.58'),
(116, 'presensi', 'lon', '115.37'),
(117, 'presensi', 'distance', '2'),
(118, 'presensi', 'helloworld', 'Jangan Lupa Bahagia; \nCara untuk memulai adalah berhenti berbicara dan mulai melakukan; \nWaktu yang hilang tidak akan pernah ditemukan lagi; \nKamu bisa membodohi semua orang, tetapi kamu tidak bisa membohongi pikiranmu; \nIni bukan tentang ide. Ini tentang mewujudkan ide; \nBekerja bukan hanya untuk mencari materi. Bekerja merupakan manfaat bagi banyak orang'),
(119, 'vedika', 'carabayar', ''),
(120, 'vedika', 'sep', ''),
(121, 'vedika', 'skdp', ''),
(122, 'vedika', 'operasi', ''),
(123, 'vedika', 'individual', ''),
(124, 'vedika', 'billing', 'mlite'),
(125, 'vedika', 'periode', '2023-01'),
(126, 'vedika', 'verifikasi', '2023-01'),
(127, 'vedika', 'inacbgs_prosedur_bedah', ''),
(128, 'vedika', 'inacbgs_prosedur_non_bedah', ''),
(129, 'vedika', 'inacbgs_konsultasi', ''),
(130, 'vedika', 'inacbgs_tenaga_ahli', ''),
(131, 'vedika', 'inacbgs_keperawatan', ''),
(132, 'vedika', 'inacbgs_penunjang', ''),
(133, 'vedika', 'inacbgs_pelayanan_darah', ''),
(134, 'vedika', 'inacbgs_rehabilitasi', ''),
(135, 'vedika', 'inacbgs_rawat_intensif', ''),
(136, 'vedika', 'eklaim_url', ''),
(137, 'vedika', 'eklaim_key', ''),
(138, 'vedika', 'eklaim_kelasrs', 'CP'),
(139, 'vedika', 'eklaim_payor_id', '3'),
(140, 'vedika', 'eklaim_payor_cd', 'JKN'),
(141, 'vedika', 'eklaim_cob_cd', '#'),
(142, 'orthanc', 'server', 'http://localhost:8042'),
(143, 'orthanc', 'username', 'orthanc'),
(144, 'orthanc', 'password', 'orthanc'),
(145, 'veronisa', 'username', ''),
(146, 'veronisa', 'password', ''),
(147, 'veronisa', 'obat_kronis', ''),
(148, 'jkn_mobile', 'kirimantrian', 'tidak'),
(149, 'settings', 'keamanan', 'ya'),
(150, 'dokter_ralan', 'set_sudah', 'tidak'),
(151, 'settings', 'websocket', 'tidak'),
(152, 'settings', 'websocket_proxy', ''),
(153, 'settings', 'username_fp', ''),
(154, 'settings', 'password_fp', ''),
(155, 'settings', 'username_frista', ''),
(156, 'settings', 'password_frista', ''),
(157, 'settings', 'billing_obat', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `mlite_subrekening`
--

CREATE TABLE `mlite_subrekening` (
  `kd_rek` varchar(15) NOT NULL,
  `kd_rek2` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_surat_rujukan`
--

CREATE TABLE `mlite_surat_rujukan` (
  `id` int(11) NOT NULL,
  `nomor_surat` varchar(100) DEFAULT NULL,
  `no_rawat` varchar(100) DEFAULT NULL,
  `no_rkm_medis` varchar(100) DEFAULT NULL,
  `nm_pasien` varchar(100) DEFAULT NULL,
  `tgl_lahir` varchar(100) DEFAULT NULL,
  `umur` varchar(100) DEFAULT NULL,
  `jk` varchar(100) DEFAULT NULL,
  `alamat` varchar(1000) DEFAULT NULL,
  `kepada` varchar(250) DEFAULT NULL,
  `di` varchar(250) DEFAULT NULL,
  `anamnesa` varchar(100) DEFAULT NULL,
  `pemeriksaan_fisik` varchar(100) DEFAULT NULL,
  `pemeriksaan_penunjang` varchar(100) DEFAULT NULL,
  `diagnosa` varchar(100) DEFAULT NULL,
  `terapi` varchar(100) DEFAULT NULL,
  `alasan_dirujuk` varchar(250) DEFAULT NULL,
  `dokter` varchar(100) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_surat_sakit`
--

CREATE TABLE `mlite_surat_sakit` (
  `id` int(11) NOT NULL,
  `nomor_surat` varchar(100) DEFAULT NULL,
  `no_rawat` varchar(100) DEFAULT NULL,
  `no_rkm_medis` varchar(100) DEFAULT NULL,
  `nm_pasien` varchar(100) DEFAULT NULL,
  `tgl_lahir` varchar(100) DEFAULT NULL,
  `umur` varchar(100) DEFAULT NULL,
  `jk` varchar(100) DEFAULT NULL,
  `alamat` varchar(1000) DEFAULT NULL,
  `keadaan` varchar(100) DEFAULT NULL,
  `diagnosa` varchar(100) DEFAULT NULL,
  `lama_angka` varchar(100) DEFAULT NULL,
  `lama_huruf` varchar(100) DEFAULT NULL,
  `tanggal_mulai` varchar(100) DEFAULT NULL,
  `tanggal_selesai` varchar(100) DEFAULT NULL,
  `dokter` varchar(100) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_surat_sehat`
--

CREATE TABLE `mlite_surat_sehat` (
  `id` int(11) NOT NULL,
  `nomor_surat` varchar(100) DEFAULT NULL,
  `no_rawat` varchar(100) DEFAULT NULL,
  `no_rkm_medis` varchar(100) DEFAULT NULL,
  `nm_pasien` varchar(100) DEFAULT NULL,
  `tgl_lahir` varchar(100) DEFAULT NULL,
  `umur` varchar(100) DEFAULT NULL,
  `jk` varchar(100) DEFAULT NULL,
  `alamat` varchar(1000) DEFAULT NULL,
  `tanggal` varchar(100) DEFAULT NULL,
  `berat_badan` varchar(100) DEFAULT NULL,
  `tinggi_badan` varchar(100) DEFAULT NULL,
  `tensi` varchar(100) DEFAULT NULL,
  `gol_darah` varchar(100) DEFAULT NULL,
  `riwayat_penyakit` varchar(100) DEFAULT NULL,
  `keperluan` varchar(100) DEFAULT NULL,
  `dokter` varchar(100) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_temporary`
--

CREATE TABLE `mlite_temporary` (
  `temp1` text DEFAULT NULL,
  `temp2` text DEFAULT NULL,
  `temp3` text DEFAULT NULL,
  `temp4` text DEFAULT NULL,
  `temp5` text DEFAULT NULL,
  `temp6` text DEFAULT NULL,
  `temp7` text DEFAULT NULL,
  `temp8` text DEFAULT NULL,
  `temp9` text DEFAULT NULL,
  `temp10` text DEFAULT NULL,
  `temp11` text DEFAULT NULL,
  `temp12` text DEFAULT NULL,
  `temp13` text DEFAULT NULL,
  `temp14` text DEFAULT NULL,
  `temp15` text DEFAULT NULL,
  `temp16` text DEFAULT NULL,
  `temp17` text DEFAULT NULL,
  `temp18` text DEFAULT NULL,
  `temp19` text DEFAULT NULL,
  `temp20` text DEFAULT NULL,
  `temp21` text DEFAULT NULL,
  `temp22` text DEFAULT NULL,
  `temp23` text DEFAULT NULL,
  `temp24` text DEFAULT NULL,
  `temp25` text DEFAULT NULL,
  `temp26` text DEFAULT NULL,
  `temp27` text DEFAULT NULL,
  `temp28` text DEFAULT NULL,
  `temp29` text DEFAULT NULL,
  `temp30` text DEFAULT NULL,
  `temp31` text DEFAULT NULL,
  `temp32` text DEFAULT NULL,
  `temp33` text DEFAULT NULL,
  `temp34` text DEFAULT NULL,
  `temp35` text DEFAULT NULL,
  `temp36` text DEFAULT NULL,
  `temp37` text DEFAULT NULL,
  `temp38` text DEFAULT NULL,
  `temp39` text DEFAULT NULL,
  `temp40` text DEFAULT NULL,
  `temp41` text DEFAULT NULL,
  `temp42` text DEFAULT NULL,
  `temp43` text DEFAULT NULL,
  `temp44` text DEFAULT NULL,
  `temp45` text DEFAULT NULL,
  `temp46` text DEFAULT NULL,
  `temp47` text DEFAULT NULL,
  `temp48` text DEFAULT NULL,
  `temp49` text DEFAULT NULL,
  `temp50` text DEFAULT NULL,
  `temp51` text DEFAULT NULL,
  `temp52` text DEFAULT NULL,
  `temp53` text DEFAULT NULL,
  `temp54` text DEFAULT NULL,
  `temp55` text DEFAULT NULL,
  `temp56` text DEFAULT NULL,
  `temp57` text DEFAULT NULL,
  `temp58` text DEFAULT NULL,
  `temp59` text DEFAULT NULL,
  `temp60` text DEFAULT NULL,
  `temp61` text DEFAULT NULL,
  `temp62` text DEFAULT NULL,
  `temp63` text DEFAULT NULL,
  `temp64` text DEFAULT NULL,
  `temp65` text DEFAULT NULL,
  `temp66` text DEFAULT NULL,
  `temp67` text DEFAULT NULL,
  `temp68` text DEFAULT NULL,
  `temp69` text DEFAULT NULL,
  `temp70` text DEFAULT NULL,
  `temp71` text DEFAULT NULL,
  `temp72` text DEFAULT NULL,
  `temp73` text DEFAULT NULL,
  `temp74` text DEFAULT NULL,
  `temp75` text DEFAULT NULL,
  `temp76` text DEFAULT NULL,
  `temp77` text DEFAULT NULL,
  `temp78` text DEFAULT NULL,
  `temp79` text DEFAULT NULL,
  `temp80` text DEFAULT NULL,
  `temp81` text DEFAULT NULL,
  `temp82` text DEFAULT NULL,
  `temp83` text DEFAULT NULL,
  `temp84` text DEFAULT NULL,
  `temp85` text DEFAULT NULL,
  `temp86` text DEFAULT NULL,
  `temp87` text DEFAULT NULL,
  `temp88` text DEFAULT NULL,
  `temp89` text DEFAULT NULL,
  `temp90` text DEFAULT NULL,
  `temp91` text DEFAULT NULL,
  `temp92` text DEFAULT NULL,
  `temp93` text DEFAULT NULL,
  `temp94` text DEFAULT NULL,
  `temp95` text DEFAULT NULL,
  `temp96` text DEFAULT NULL,
  `temp97` text DEFAULT NULL,
  `temp98` text DEFAULT NULL,
  `temp99` text DEFAULT NULL,
  `temp100` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_triase`
--

CREATE TABLE `mlite_triase` (
  `no_rawat` varchar(17) NOT NULL,
  `tgl_kunjungan` datetime NOT NULL,
  `cara_masuk` enum('Jalan','Brankar','Kursi Roda','Digendong') NOT NULL,
  `alat_transportasi` enum('-','AGD','Sendiri','Swasta') NOT NULL,
  `alasan_kedatangan` enum('Datang Sendiri','Polisi','Rujukan','-') NOT NULL,
  `keterangan_kedatangan` varchar(100) NOT NULL,
  `macam_kasus` enum('Trauma Kecelakaan Lalu Lintas','Trauma Kecelakaan Kerja','Trauma Kasus Unit Pelayanan Anak & Perempuan','Trauma Lainnya','Non Trauma') NOT NULL,
  `tekanan_darah` varchar(8) NOT NULL,
  `nadi` varchar(3) NOT NULL,
  `pernapasan` varchar(3) NOT NULL,
  `suhu` varchar(5) NOT NULL,
  `saturasi_o2` varchar(3) NOT NULL,
  `nyeri` varchar(5) NOT NULL,
  `jenis_triase` enum('Primer','Sekunder') NOT NULL,
  `keluhan_utama` varchar(500) NOT NULL,
  `kebutuhan_khusus` enum('-','UPPA','Airborne','Dekontaminan') NOT NULL,
  `catatan` varchar(100) NOT NULL,
  `plan` enum('Ruang Resusitasi','Ruang Kritis','Zona Kuning','Zona Hijau') NOT NULL,
  `nik` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_triase_detail`
--

CREATE TABLE `mlite_triase_detail` (
  `no_rawat` varchar(17) NOT NULL,
  `skala` varchar(3) NOT NULL,
  `kode_skala` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_triase_pemeriksaan`
--

CREATE TABLE `mlite_triase_pemeriksaan` (
  `kode_pemeriksaan` varchar(3) NOT NULL,
  `nama_pemeriksaan` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_triase_skala`
--

CREATE TABLE `mlite_triase_skala` (
  `id` int(11) NOT NULL,
  `kode_pemeriksaan` varchar(3) NOT NULL,
  `skala` int(11) NOT NULL,
  `kode_skala` varchar(3) NOT NULL,
  `pengkajian_skala` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_users`
--

CREATE TABLE `mlite_users` (
  `id` int(11) NOT NULL,
  `username` text DEFAULT NULL,
  `fullname` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'user',
  `cap` varchar(100) DEFAULT '',
  `access` varchar(500) NOT NULL DEFAULT 'dashboard'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mlite_users`
--

INSERT INTO `mlite_users` (`id`, `username`, `fullname`, `description`, `password`, `avatar`, `email`, `role`, `cap`, `access`) VALUES
(1, 'admin', 'Administrator', 'Admin ganteng baik hati, suka menabung dan tidak sombong.', '$2y$10$pgRnDiukCbiYVqsamMM3ROWViSRqbyCCL33N8.ykBKZx0dlplXe9i', 'avatar6422cb573b50c.png', 'info@mlite.id', 'admin', '', 'all'),
(2, 'DR001', 'dr. Ataaka Muhammad', '-', '$2y$10$fCCe5tyh5Bd.B4fDrl8fk.7Yg9dQ/SNHhTec6LNk6kv4aEtkvt4FS', 'avatar643a104444515.png', 'info@mlite.id', 'admin', '', 'all'),
(3, 'K001', 'Kasir1', '', '$2y$10$jHgqzokB4TtYZuW3s3NlgO7.BZXm8HRGqsyq1HTo9Prfq1Q4mTKKC', 'avatar6755903652cf0.png', 'afdaewfd@wsefwe.com', 'kasir', '', 'pasien,rawat_jalan,kasir_rawat_jalan,kepegawaian,farmasi,users,wagateway,apotek_ralan,dokter_ralan,igd,dokter_igd,laboratorium,radiologi,icd_10,rawat_inap,apotek_ranap,dokter_ranap,kasir_rawat_inap,operasi,anjungan,api,jkn_mobile,vclaim,keuangan,manajemen,presensi,vedika,profil,orthanc,veronisa,icd_9,dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `mlite_users_vedika`
--

CREATE TABLE `mlite_users_vedika` (
  `id` int(11) NOT NULL,
  `username` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `fullname` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_vedika`
--

CREATE TABLE `mlite_vedika` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `no_rkm_medis` varchar(6) NOT NULL,
  `no_rawat` varchar(100) NOT NULL,
  `tgl_registrasi` varchar(100) NOT NULL,
  `nosep` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_vedika_feedback`
--

CREATE TABLE `mlite_vedika_feedback` (
  `id` int(11) NOT NULL,
  `nosep` varchar(100) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_veronisa`
--

CREATE TABLE `mlite_veronisa` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `no_rkm_medis` varchar(6) NOT NULL,
  `no_rawat` varchar(100) NOT NULL,
  `tgl_registrasi` varchar(100) NOT NULL,
  `nosep` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_veronisa_feedback`
--

CREATE TABLE `mlite_veronisa_feedback` (
  `id` int(11) NOT NULL,
  `nosep` varchar(100) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_berkas`
--

CREATE TABLE `mutasi_berkas` (
  `no_rawat` varchar(17) NOT NULL,
  `status` enum('Sudah Dikirim','Sudah Diterima','Sudah Kembali','Tidak Ada','Masuk Ranap') DEFAULT NULL,
  `dikirim` datetime DEFAULT NULL,
  `diterima` datetime DEFAULT NULL,
  `kembali` datetime DEFAULT NULL,
  `tidakada` datetime DEFAULT NULL,
  `ranap` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obatbhp_ok`
--

CREATE TABLE `obatbhp_ok` (
  `kd_obat` varchar(15) NOT NULL,
  `nm_obat` varchar(50) NOT NULL,
  `kode_sat` char(4) NOT NULL,
  `hargasatuan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obat_racikan`
--

CREATE TABLE `obat_racikan` (
  `tgl_perawatan` date NOT NULL,
  `jam` time NOT NULL,
  `no_rawat` varchar(17) NOT NULL,
  `no_racik` varchar(2) NOT NULL,
  `nama_racik` varchar(100) NOT NULL,
  `kd_racik` varchar(3) NOT NULL,
  `jml_dr` int(11) NOT NULL,
  `aturan_pakai` varchar(150) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `operasi`
--

CREATE TABLE `operasi` (
  `no_rawat` varchar(17) NOT NULL,
  `tgl_operasi` datetime NOT NULL,
  `jenis_anasthesi` varchar(8) NOT NULL,
  `kategori` enum('-','Khusus','Besar','Sedang','Kecil','Elektive','Emergency') DEFAULT NULL,
  `operator1` varchar(20) NOT NULL,
  `operator2` varchar(20) NOT NULL,
  `operator3` varchar(20) NOT NULL,
  `asisten_operator1` varchar(20) NOT NULL,
  `asisten_operator2` varchar(20) NOT NULL,
  `asisten_operator3` varchar(20) DEFAULT NULL,
  `instrumen` varchar(20) DEFAULT NULL,
  `dokter_anak` varchar(20) NOT NULL,
  `perawaat_resusitas` varchar(20) NOT NULL,
  `dokter_anestesi` varchar(20) NOT NULL,
  `asisten_anestesi` varchar(20) NOT NULL,
  `asisten_anestesi2` varchar(20) DEFAULT NULL,
  `bidan` varchar(20) NOT NULL,
  `bidan2` varchar(20) DEFAULT NULL,
  `bidan3` varchar(20) DEFAULT NULL,
  `perawat_luar` varchar(20) NOT NULL,
  `omloop` varchar(20) DEFAULT NULL,
  `omloop2` varchar(20) DEFAULT NULL,
  `omloop3` varchar(20) DEFAULT NULL,
  `omloop4` varchar(20) DEFAULT NULL,
  `omloop5` varchar(20) DEFAULT NULL,
  `dokter_pjanak` varchar(20) DEFAULT NULL,
  `dokter_umum` varchar(20) DEFAULT NULL,
  `kode_paket` varchar(15) NOT NULL,
  `biayaoperator1` double NOT NULL,
  `biayaoperator2` double NOT NULL,
  `biayaoperator3` double NOT NULL,
  `biayaasisten_operator1` double NOT NULL,
  `biayaasisten_operator2` double NOT NULL,
  `biayaasisten_operator3` double DEFAULT NULL,
  `biayainstrumen` double DEFAULT NULL,
  `biayadokter_anak` double NOT NULL,
  `biayaperawaat_resusitas` double NOT NULL,
  `biayadokter_anestesi` double NOT NULL,
  `biayaasisten_anestesi` double NOT NULL,
  `biayaasisten_anestesi2` double DEFAULT NULL,
  `biayabidan` double NOT NULL,
  `biayabidan2` double DEFAULT NULL,
  `biayabidan3` double DEFAULT NULL,
  `biayaperawat_luar` double NOT NULL,
  `biayaalat` double NOT NULL,
  `biayasewaok` double NOT NULL,
  `akomodasi` double DEFAULT NULL,
  `bagian_rs` double NOT NULL,
  `biaya_omloop` double DEFAULT NULL,
  `biaya_omloop2` double DEFAULT NULL,
  `biaya_omloop3` double DEFAULT NULL,
  `biaya_omloop4` double DEFAULT NULL,
  `biaya_omloop5` double DEFAULT NULL,
  `biayasarpras` double DEFAULT NULL,
  `biaya_dokter_pjanak` double DEFAULT NULL,
  `biaya_dokter_umum` double DEFAULT NULL,
  `status` enum('Ranap','Ralan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `opname`
--

CREATE TABLE `opname` (
  `kode_brng` varchar(15) NOT NULL,
  `h_beli` double DEFAULT NULL,
  `tanggal` date NOT NULL,
  `stok` double NOT NULL,
  `real` double NOT NULL,
  `selisih` double NOT NULL,
  `nomihilang` double NOT NULL,
  `lebih` double NOT NULL,
  `nomilebih` double NOT NULL,
  `keterangan` varchar(60) NOT NULL,
  `kd_bangsal` char(5) NOT NULL,
  `no_batch` varchar(20) NOT NULL,
  `no_faktur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paket_operasi`
--

CREATE TABLE `paket_operasi` (
  `kode_paket` varchar(15) NOT NULL,
  `nm_perawatan` varchar(80) NOT NULL,
  `kategori` enum('Kebidanan','Operasi') DEFAULT NULL,
  `operator1` double NOT NULL,
  `operator2` double NOT NULL,
  `operator3` double NOT NULL,
  `asisten_operator1` double DEFAULT NULL,
  `asisten_operator2` double NOT NULL,
  `asisten_operator3` double DEFAULT NULL,
  `instrumen` double DEFAULT NULL,
  `dokter_anak` double NOT NULL,
  `perawaat_resusitas` double NOT NULL,
  `dokter_anestesi` double NOT NULL,
  `asisten_anestesi` double NOT NULL,
  `asisten_anestesi2` double DEFAULT NULL,
  `bidan` double NOT NULL,
  `bidan2` double DEFAULT NULL,
  `bidan3` double DEFAULT NULL,
  `perawat_luar` double NOT NULL,
  `sewa_ok` double NOT NULL,
  `alat` double NOT NULL,
  `akomodasi` double DEFAULT NULL,
  `bagian_rs` double NOT NULL,
  `omloop` double NOT NULL,
  `omloop2` double DEFAULT NULL,
  `omloop3` double DEFAULT NULL,
  `omloop4` double DEFAULT NULL,
  `omloop5` double DEFAULT NULL,
  `sarpras` double DEFAULT NULL,
  `dokter_pjanak` double DEFAULT NULL,
  `dokter_umum` double DEFAULT NULL,
  `kd_pj` char(3) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL,
  `kelas` enum('-','Rawat Jalan','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `no_rkm_medis` varchar(15) NOT NULL,
  `nm_pasien` varchar(40) DEFAULT NULL,
  `no_ktp` varchar(20) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `tmp_lahir` varchar(15) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `nm_ibu` varchar(40) NOT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `gol_darah` enum('A','B','O','AB','-') DEFAULT NULL,
  `pekerjaan` varchar(60) DEFAULT NULL,
  `stts_nikah` enum('BELUM MENIKAH','MENIKAH','JANDA','DUDHA','JOMBLO') DEFAULT NULL,
  `agama` varchar(12) DEFAULT NULL,
  `tgl_daftar` date DEFAULT NULL,
  `no_tlp` varchar(40) DEFAULT NULL,
  `umur` varchar(30) NOT NULL,
  `pnd` enum('TS','TK','SD','SMP','SMA','SLTA/SEDERAJAT','D1','D2','D3','D4','S1','S2','S3','-') NOT NULL,
  `keluarga` enum('AYAH','IBU','ISTRI','SUAMI','SAUDARA','ANAK') DEFAULT NULL,
  `namakeluarga` varchar(50) NOT NULL,
  `kd_pj` char(3) NOT NULL,
  `no_peserta` varchar(25) DEFAULT NULL,
  `kd_kel` varchar(100) NOT NULL,
  `kd_kec` int(11) NOT NULL,
  `kd_kab` int(11) NOT NULL,
  `pekerjaanpj` varchar(35) NOT NULL,
  `alamatpj` varchar(100) NOT NULL,
  `kelurahanpj` varchar(60) NOT NULL,
  `kecamatanpj` varchar(60) NOT NULL,
  `kabupatenpj` varchar(60) NOT NULL,
  `perusahaan_pasien` varchar(8) NOT NULL,
  `suku_bangsa` int(11) NOT NULL,
  `bahasa_pasien` int(11) NOT NULL,
  `cacat_fisik` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `kd_prop` int(11) NOT NULL,
  `propinsipj` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`no_rkm_medis`, `nm_pasien`, `no_ktp`, `jk`, `tmp_lahir`, `tgl_lahir`, `nm_ibu`, `alamat`, `gol_darah`, `pekerjaan`, `stts_nikah`, `agama`, `tgl_daftar`, `no_tlp`, `umur`, `pnd`, `keluarga`, `namakeluarga`, `kd_pj`, `no_peserta`, `kd_kel`, `kd_kec`, `kd_kab`, `pekerjaanpj`, `alamatpj`, `kelurahanpj`, `kecamatanpj`, `kabupatenpj`, `perusahaan_pasien`, `suku_bangsa`, `bahasa_pasien`, `cacat_fisik`, `email`, `nip`, `kd_prop`, `propinsipj`) VALUES
('000001', 'Vian', '123', 'L', '-', '1992-08-24', 'Nur', 'Ciputat', 'O', 'Karyawan', 'MENIKAH', 'ISLAM', '2024-12-08', '', '32 Th 3 Bl 15 Hr', 'S1', 'AYAH', '-', 'UMU', '', '1', 1, 1, '-', 'Ciputat', '-', '-', '-', '-', 1, 1, 1, '-', '-', 1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` enum('Pria','Wanita') NOT NULL,
  `jbtn` varchar(25) NOT NULL,
  `jnj_jabatan` varchar(5) NOT NULL,
  `kode_kelompok` varchar(3) NOT NULL,
  `kode_resiko` varchar(3) NOT NULL,
  `kode_emergency` varchar(3) NOT NULL,
  `departemen` char(4) NOT NULL,
  `bidang` varchar(15) NOT NULL,
  `stts_wp` char(5) NOT NULL,
  `stts_kerja` char(3) NOT NULL,
  `npwp` varchar(15) NOT NULL,
  `pendidikan` varchar(80) NOT NULL,
  `gapok` double NOT NULL,
  `tmp_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `mulai_kerja` date NOT NULL,
  `ms_kerja` enum('<1','PT','FT>1') NOT NULL,
  `indexins` char(4) NOT NULL,
  `bpd` varchar(50) NOT NULL,
  `rekening` varchar(25) NOT NULL,
  `stts_aktif` enum('AKTIF','CUTI','KELUAR','TENAGA LUAR') NOT NULL,
  `wajibmasuk` tinyint(2) NOT NULL,
  `pengurang` double NOT NULL,
  `indek` tinyint(4) NOT NULL,
  `mulai_kontrak` date DEFAULT NULL,
  `cuti_diambil` int(11) NOT NULL,
  `dankes` double NOT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `no_ktp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nik`, `nama`, `jk`, `jbtn`, `jnj_jabatan`, `kode_kelompok`, `kode_resiko`, `kode_emergency`, `departemen`, `bidang`, `stts_wp`, `stts_kerja`, `npwp`, `pendidikan`, `gapok`, `tmp_lahir`, `tgl_lahir`, `alamat`, `kota`, `mulai_kerja`, `ms_kerja`, `indexins`, `bpd`, `rekening`, `stts_aktif`, `wajibmasuk`, `pengurang`, `indek`, `mulai_kontrak`, `cuti_diambil`, `dankes`, `photo`, `no_ktp`) VALUES
(1, 'DR001', 'dr. Ataaka Muhammad', 'Pria', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', 0, 'Barabai', '2016-06-10', '-', 'Barabai', '2019-09-18', '<1', '-', '-', '-', 'AKTIF', 0, 0, 0, '2019-09-18', 1, 0, '-', '0'),
(2, 'K001', 'Kasir1', 'Pria', '-', '-', '-', '-', '-', '-', '-', '-', '-', '0', '-', 0, '', '0000-00-00', '', '', '2024-12-08', '<1', '-', '-', '0', 'AKTIF', 0, 0, 0, '2024-12-08', 0, 0, 'pages/pegawai/photo/.png', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pemeliharaan_inventaris`
--

CREATE TABLE `pemeliharaan_inventaris` (
  `no_inventaris` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `uraian_kegiatan` varchar(255) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `pelaksana` enum('Teknisi Rumah Sakit','Teknisi Rujukan','Pihak ke III') NOT NULL,
  `biaya` double NOT NULL,
  `jenis_pemeliharaan` enum('Running Maintenance','Shut Down Maintenance','Emergency Maintenance') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan_ralan`
--

CREATE TABLE `pemeriksaan_ralan` (
  `no_rawat` varchar(17) NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time NOT NULL,
  `suhu_tubuh` varchar(5) DEFAULT NULL,
  `tensi` varchar(8) NOT NULL,
  `nadi` varchar(3) DEFAULT NULL,
  `respirasi` varchar(3) DEFAULT NULL,
  `tinggi` varchar(5) DEFAULT NULL,
  `berat` varchar(5) DEFAULT NULL,
  `spo2` varchar(3) NOT NULL,
  `gcs` varchar(10) DEFAULT NULL,
  `kesadaran` enum('Compos Mentis','Somnolence','Sopor','Coma') NOT NULL,
  `keluhan` varchar(2000) DEFAULT NULL,
  `pemeriksaan` varchar(2000) DEFAULT NULL,
  `alergi` varchar(50) DEFAULT NULL,
  `lingkar_perut` varchar(5) DEFAULT NULL,
  `rtl` varchar(2000) NOT NULL,
  `penilaian` varchar(2000) NOT NULL,
  `instruksi` varchar(2000) NOT NULL,
  `evaluasi` varchar(2000) NOT NULL,
  `nip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemeriksaan_ralan`
--

INSERT INTO `pemeriksaan_ralan` (`no_rawat`, `tgl_perawatan`, `jam_rawat`, `suhu_tubuh`, `tensi`, `nadi`, `respirasi`, `tinggi`, `berat`, `spo2`, `gcs`, `kesadaran`, `keluhan`, `pemeriksaan`, `alergi`, `lingkar_perut`, `rtl`, `penilaian`, `instruksi`, `evaluasi`, `nip`) VALUES
('2024/12/08/000001', '2024-12-08', '17:02:22', '', '-', '', '', '', '', '', '', 'Compos Mentis', 's', 'o', '', '-', 'p', 'a', '', '', 'DR001');

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan_ranap`
--

CREATE TABLE `pemeriksaan_ranap` (
  `no_rawat` varchar(17) NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time NOT NULL,
  `suhu_tubuh` varchar(5) DEFAULT NULL,
  `tensi` varchar(8) NOT NULL,
  `nadi` varchar(3) DEFAULT NULL,
  `respirasi` varchar(3) DEFAULT NULL,
  `tinggi` varchar(5) DEFAULT NULL,
  `berat` varchar(5) DEFAULT NULL,
  `spo2` varchar(3) NOT NULL,
  `gcs` varchar(10) DEFAULT NULL,
  `kesadaran` enum('Compos Mentis','Somnolence','Sopor','Coma') NOT NULL,
  `keluhan` varchar(2000) DEFAULT NULL,
  `pemeriksaan` varchar(2000) DEFAULT NULL,
  `alergi` varchar(50) DEFAULT NULL,
  `penilaian` varchar(2000) NOT NULL,
  `rtl` varchar(2000) NOT NULL,
  `instruksi` varchar(2000) NOT NULL,
  `evaluasi` varchar(2000) NOT NULL,
  `nip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE `pendidikan` (
  `tingkat` varchar(80) NOT NULL,
  `indek` tinyint(4) NOT NULL,
  `gapok1` double NOT NULL,
  `kenaikan` double NOT NULL,
  `maksimal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendidikan`
--

INSERT INTO `pendidikan` (`tingkat`, `indek`, `gapok1`, `kenaikan`, `maksimal`) VALUES
('-', 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `penjab`
--

CREATE TABLE `penjab` (
  `kd_pj` char(3) NOT NULL,
  `png_jawab` varchar(30) NOT NULL,
  `nama_perusahaan` varchar(60) NOT NULL,
  `alamat_asuransi` varchar(130) NOT NULL,
  `no_telp` varchar(40) NOT NULL,
  `attn` varchar(60) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjab`
--

INSERT INTO `penjab` (`kd_pj`, `png_jawab`, `nama_perusahaan`, `alamat_asuransi`, `no_telp`, `attn`, `status`) VALUES
('-', '-', '-', '-', '0', '0', '1'),
('BPJ', 'BPJS Kesehatan', '-', '-', '0', '0', '1'),
('UMU', 'Umum', '-', '-', '0', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `kd_penyakit` varchar(10) NOT NULL,
  `nm_penyakit` varchar(250) DEFAULT NULL,
  `ciri_ciri` text DEFAULT NULL,
  `keterangan` varchar(60) DEFAULT NULL,
  `kd_ktg` varchar(8) DEFAULT NULL,
  `status` enum('Menular','Tidak Menular') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perbaikan_inventaris`
--

CREATE TABLE `perbaikan_inventaris` (
  `no_permintaan` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `uraian_kegiatan` varchar(255) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `pelaksana` enum('Teknisi Rumah Sakit','Teknisi Rujukan','Pihak ke III') NOT NULL,
  `biaya` double NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `status` enum('Bisa Diperbaiki','Tidak Bisa Diperbaiki') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `periksa_lab`
--

CREATE TABLE `periksa_lab` (
  `no_rawat` varchar(17) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time NOT NULL,
  `dokter_perujuk` varchar(20) NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya` double NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `status` enum('Ralan','Ranap') DEFAULT NULL,
  `kategori` enum('PA','PK','MB') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `periksa_radiologi`
--

CREATE TABLE `periksa_radiologi` (
  `no_rawat` varchar(17) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time NOT NULL,
  `dokter_perujuk` varchar(20) NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya` double NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `status` enum('Ranap','Ralan') DEFAULT NULL,
  `proyeksi` varchar(50) NOT NULL,
  `kV` varchar(10) NOT NULL,
  `mAS` varchar(10) NOT NULL,
  `FFD` varchar(10) NOT NULL,
  `BSF` varchar(10) NOT NULL,
  `inak` varchar(10) NOT NULL,
  `jml_penyinaran` varchar(10) NOT NULL,
  `dosis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_detail_permintaan_lab`
--

CREATE TABLE `permintaan_detail_permintaan_lab` (
  `noorder` varchar(15) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `id_template` int(11) NOT NULL,
  `stts_bayar` enum('Sudah','Belum') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_lab`
--

CREATE TABLE `permintaan_lab` (
  `noorder` varchar(15) NOT NULL,
  `no_rawat` varchar(17) NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `jam_permintaan` time NOT NULL,
  `tgl_sampel` date NOT NULL,
  `jam_sampel` time NOT NULL,
  `tgl_hasil` date NOT NULL,
  `jam_hasil` time NOT NULL,
  `dokter_perujuk` varchar(20) NOT NULL,
  `status` enum('ralan','ranap') NOT NULL,
  `informasi_tambahan` varchar(60) NOT NULL,
  `diagnosa_klinis` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_pemeriksaan_lab`
--

CREATE TABLE `permintaan_pemeriksaan_lab` (
  `noorder` varchar(15) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `stts_bayar` enum('Sudah','Belum') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_pemeriksaan_radiologi`
--

CREATE TABLE `permintaan_pemeriksaan_radiologi` (
  `noorder` varchar(15) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `stts_bayar` enum('Sudah','Belum') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_perbaikan_inventaris`
--

CREATE TABLE `permintaan_perbaikan_inventaris` (
  `no_permintaan` varchar(15) NOT NULL,
  `no_inventaris` varchar(30) DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `deskripsi_kerusakan` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_radiologi`
--

CREATE TABLE `permintaan_radiologi` (
  `noorder` varchar(15) NOT NULL,
  `no_rawat` varchar(17) NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `jam_permintaan` time NOT NULL,
  `tgl_sampel` date NOT NULL,
  `jam_sampel` time NOT NULL,
  `tgl_hasil` date NOT NULL,
  `jam_hasil` time NOT NULL,
  `dokter_perujuk` varchar(20) NOT NULL,
  `status` enum('ralan','ranap') NOT NULL,
  `informasi_tambahan` varchar(60) NOT NULL,
  `diagnosa_klinis` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personal_pasien`
--

CREATE TABLE `personal_pasien` (
  `no_rkm_medis` varchar(15) NOT NULL,
  `gambar` varchar(1000) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan_pasien`
--

CREATE TABLE `perusahaan_pasien` (
  `kode_perusahaan` varchar(8) NOT NULL,
  `nama_perusahaan` varchar(70) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `kota` varchar(40) DEFAULT NULL,
  `no_telp` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perusahaan_pasien`
--

INSERT INTO `perusahaan_pasien` (`kode_perusahaan`, `nama_perusahaan`, `alamat`, `kota`, `no_telp`) VALUES
('-', '-', '-', '-', '0');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `nip` varchar(20) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `tmp_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `gol_darah` enum('A','B','O','AB','-') DEFAULT NULL,
  `agama` varchar(12) DEFAULT NULL,
  `stts_nikah` enum('BELUM MENIKAH','MENIKAH','JANDA','DUDHA','JOMBLO') DEFAULT NULL,
  `alamat` varchar(60) DEFAULT NULL,
  `kd_jbtn` char(4) DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`nip`, `nama`, `jk`, `tmp_lahir`, `tgl_lahir`, `gol_darah`, `agama`, `stts_nikah`, `alamat`, `kd_jbtn`, `no_telp`, `status`) VALUES
('DR001', 'dr. Ataaka Muhammad', 'L', 'Barabai', '2020-12-01', 'A', 'Islam', 'MENIKAH', '-', '-', '0', '1'),
('K001', 'Kasir 1', 'L', '', '0000-00-00', '-', 'ISLAM', 'BELUM MENIKAH', '', '-', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `poliklinik`
--

CREATE TABLE `poliklinik` (
  `kd_poli` char(5) NOT NULL DEFAULT '',
  `nm_poli` varchar(50) DEFAULT NULL,
  `registrasi` double NOT NULL,
  `registrasilama` double NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poliklinik`
--

INSERT INTO `poliklinik` (`kd_poli`, `nm_poli`, `registrasi`, `registrasilama`, `status`) VALUES
('-', '-', 0, 0, '1'),
('IGDK', 'IGD', 0, 0, '1'),
('UMU', 'Umum', 0, 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `propinsi`
--

CREATE TABLE `propinsi` (
  `kd_prop` int(11) NOT NULL,
  `nm_prop` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `propinsi`
--

INSERT INTO `propinsi` (`kd_prop`, `nm_prop`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `prosedur_pasien`
--

CREATE TABLE `prosedur_pasien` (
  `no_rawat` varchar(17) NOT NULL,
  `kode` varchar(8) NOT NULL,
  `status` enum('Ralan','Ranap') NOT NULL,
  `prioritas` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap_dr`
--

CREATE TABLE `rawat_inap_dr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam_rawat` time NOT NULL DEFAULT '00:00:00',
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap_drpr`
--

CREATE TABLE `rawat_inap_drpr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `nip` varchar(20) NOT NULL DEFAULT '',
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam_rawat` time NOT NULL DEFAULT '00:00:00',
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double DEFAULT NULL,
  `tarif_tindakanpr` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap_pr`
--

CREATE TABLE `rawat_inap_pr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nip` varchar(20) NOT NULL DEFAULT '',
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam_rawat` time NOT NULL DEFAULT '00:00:00',
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakanpr` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jl_dr`
--

CREATE TABLE `rawat_jl_dr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time NOT NULL,
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL,
  `stts_bayar` enum('Sudah','Belum','Suspen') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rawat_jl_dr`
--

INSERT INTO `rawat_jl_dr` (`no_rawat`, `kd_jenis_prw`, `kd_dokter`, `tgl_perawatan`, `jam_rawat`, `material`, `bhp`, `tarif_tindakandr`, `kso`, `menejemen`, `biaya_rawat`, `stts_bayar`) VALUES
('2024/12/08/000001', 'RJ001', 'DR001', '2024-12-08', '17:02:27', 0, 0, 50000, 0, 0, 50000, 'Belum');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jl_drpr`
--

CREATE TABLE `rawat_jl_drpr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time NOT NULL,
  `material` double DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double DEFAULT NULL,
  `tarif_tindakanpr` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL,
  `stts_bayar` enum('Sudah','Belum','Suspen') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jl_pr`
--

CREATE TABLE `rawat_jl_pr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nip` varchar(20) NOT NULL DEFAULT '',
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time NOT NULL,
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakanpr` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL,
  `stts_bayar` enum('Sudah','Belum','Suspen') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reg_periksa`
--

CREATE TABLE `reg_periksa` (
  `no_reg` varchar(8) DEFAULT NULL,
  `no_rawat` varchar(17) NOT NULL,
  `tgl_registrasi` date DEFAULT NULL,
  `jam_reg` time DEFAULT NULL,
  `kd_dokter` varchar(20) DEFAULT NULL,
  `no_rkm_medis` varchar(15) DEFAULT NULL,
  `kd_poli` char(5) DEFAULT NULL,
  `p_jawab` varchar(100) DEFAULT NULL,
  `almt_pj` varchar(200) DEFAULT NULL,
  `hubunganpj` varchar(20) DEFAULT NULL,
  `biaya_reg` double DEFAULT NULL,
  `stts` enum('Belum','Sudah','Batal','Berkas Diterima','Dirujuk','Meninggal','Dirawat','Pulang Paksa') DEFAULT NULL,
  `stts_daftar` enum('-','Lama','Baru') NOT NULL,
  `status_lanjut` enum('Ralan','Ranap') NOT NULL,
  `kd_pj` char(3) NOT NULL,
  `umurdaftar` int(11) DEFAULT NULL,
  `sttsumur` enum('Th','Bl','Hr') DEFAULT NULL,
  `status_bayar` enum('Sudah Bayar','Belum Bayar') NOT NULL,
  `status_poli` enum('Lama','Baru') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_periksa`
--

INSERT INTO `reg_periksa` (`no_reg`, `no_rawat`, `tgl_registrasi`, `jam_reg`, `kd_dokter`, `no_rkm_medis`, `kd_poli`, `p_jawab`, `almt_pj`, `hubunganpj`, `biaya_reg`, `stts`, `stts_daftar`, `status_lanjut`, `kd_pj`, `umurdaftar`, `sttsumur`, `status_bayar`, `status_poli`) VALUES
('001', '2024/12/08/000001', '2024-12-08', '16:57:37', 'DR001', '000001', 'UMU', '-', '-', '-', 0, 'Belum', 'Baru', 'Ralan', 'UMU', 32, 'Th', 'Sudah Bayar', 'Lama');

-- --------------------------------------------------------

--
-- Table structure for table `rekap_presensi`
--

CREATE TABLE `rekap_presensi` (
  `id` int(10) NOT NULL,
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') NOT NULL,
  `jam_datang` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `jam_pulang` datetime DEFAULT NULL,
  `status` enum('Tepat Waktu','Terlambat Toleransi','Terlambat I','Terlambat II','Tepat Waktu & PSW','Terlambat Toleransi & PSW','Terlambat I & PSW','Terlambat II & PSW') NOT NULL,
  `keterlambatan` varchar(20) NOT NULL,
  `durasi` varchar(20) DEFAULT NULL,
  `keterangan` varchar(100) NOT NULL,
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep_dokter`
--

CREATE TABLE `resep_dokter` (
  `no_resep` varchar(14) DEFAULT NULL,
  `kode_brng` varchar(15) DEFAULT NULL,
  `jml` double DEFAULT NULL,
  `aturan_pakai` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep_dokter_racikan`
--

CREATE TABLE `resep_dokter_racikan` (
  `no_resep` varchar(14) NOT NULL,
  `no_racik` varchar(2) NOT NULL,
  `nama_racik` varchar(100) NOT NULL,
  `kd_racik` varchar(3) NOT NULL,
  `jml_dr` int(11) NOT NULL,
  `aturan_pakai` varchar(150) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep_dokter_racikan_detail`
--

CREATE TABLE `resep_dokter_racikan_detail` (
  `no_resep` varchar(14) NOT NULL,
  `no_racik` varchar(2) NOT NULL,
  `kode_brng` varchar(15) NOT NULL,
  `p1` double DEFAULT NULL,
  `p2` double DEFAULT NULL,
  `kandungan` varchar(10) DEFAULT NULL,
  `jml` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep_obat`
--

CREATE TABLE `resep_obat` (
  `no_resep` varchar(14) NOT NULL DEFAULT '',
  `tgl_perawatan` date DEFAULT NULL,
  `jam` time NOT NULL,
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_dokter` varchar(20) NOT NULL,
  `tgl_peresepan` date DEFAULT NULL,
  `jam_peresepan` time DEFAULT NULL,
  `status` enum('ralan','ranap') DEFAULT NULL,
  `tgl_penyerahan` date NOT NULL,
  `jam_penyerahan` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep_pulang`
--

CREATE TABLE `resep_pulang` (
  `no_rawat` varchar(17) NOT NULL,
  `kode_brng` varchar(15) NOT NULL,
  `jml_barang` double NOT NULL,
  `harga` double NOT NULL,
  `total` double NOT NULL,
  `dosis` varchar(150) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `kd_bangsal` varchar(5) NOT NULL,
  `no_batch` varchar(20) NOT NULL,
  `no_faktur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resiko_kerja`
--

CREATE TABLE `resiko_kerja` (
  `kode_resiko` varchar(3) NOT NULL,
  `nama_resiko` varchar(200) DEFAULT NULL,
  `indek` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resiko_kerja`
--

INSERT INTO `resiko_kerja` (`kode_resiko`, `nama_resiko`, `indek`) VALUES
('-', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `resume_pasien`
--

CREATE TABLE `resume_pasien` (
  `no_rawat` varchar(17) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `keluhan_utama` text NOT NULL,
  `jalannya_penyakit` text NOT NULL,
  `pemeriksaan_penunjang` text NOT NULL,
  `hasil_laborat` text NOT NULL,
  `diagnosa_utama` varchar(80) NOT NULL,
  `kd_diagnosa_utama` varchar(10) NOT NULL,
  `diagnosa_sekunder` varchar(80) NOT NULL,
  `kd_diagnosa_sekunder` varchar(10) NOT NULL,
  `diagnosa_sekunder2` varchar(80) NOT NULL,
  `kd_diagnosa_sekunder2` varchar(10) NOT NULL,
  `diagnosa_sekunder3` varchar(80) NOT NULL,
  `kd_diagnosa_sekunder3` varchar(10) NOT NULL,
  `diagnosa_sekunder4` varchar(80) NOT NULL,
  `kd_diagnosa_sekunder4` varchar(10) NOT NULL,
  `prosedur_utama` varchar(80) NOT NULL,
  `kd_prosedur_utama` varchar(8) NOT NULL,
  `prosedur_sekunder` varchar(80) NOT NULL,
  `kd_prosedur_sekunder` varchar(8) NOT NULL,
  `prosedur_sekunder2` varchar(80) NOT NULL,
  `kd_prosedur_sekunder2` varchar(8) NOT NULL,
  `prosedur_sekunder3` varchar(80) NOT NULL,
  `kd_prosedur_sekunder3` varchar(8) NOT NULL,
  `kondisi_pulang` enum('Hidup','Meninggal') NOT NULL,
  `obat_pulang` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resume_pasien_ranap`
--

CREATE TABLE `resume_pasien_ranap` (
  `no_rawat` varchar(17) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `diagnosa_awal` varchar(100) NOT NULL,
  `alasan` varchar(100) NOT NULL,
  `keluhan_utama` text NOT NULL,
  `pemeriksaan_fisik` text NOT NULL,
  `jalannya_penyakit` text NOT NULL,
  `pemeriksaan_penunjang` text NOT NULL,
  `hasil_laborat` text NOT NULL,
  `tindakan_dan_operasi` text NOT NULL,
  `obat_di_rs` text NOT NULL,
  `diagnosa_utama` varchar(80) NOT NULL,
  `kd_diagnosa_utama` varchar(10) NOT NULL,
  `diagnosa_sekunder` varchar(80) NOT NULL,
  `kd_diagnosa_sekunder` varchar(10) NOT NULL,
  `diagnosa_sekunder2` varchar(80) NOT NULL,
  `kd_diagnosa_sekunder2` varchar(10) NOT NULL,
  `diagnosa_sekunder3` varchar(80) NOT NULL,
  `kd_diagnosa_sekunder3` varchar(10) NOT NULL,
  `diagnosa_sekunder4` varchar(80) NOT NULL,
  `kd_diagnosa_sekunder4` varchar(10) NOT NULL,
  `prosedur_utama` varchar(80) NOT NULL,
  `kd_prosedur_utama` varchar(8) NOT NULL,
  `prosedur_sekunder` varchar(80) NOT NULL,
  `kd_prosedur_sekunder` varchar(8) NOT NULL,
  `prosedur_sekunder2` varchar(80) NOT NULL,
  `kd_prosedur_sekunder2` varchar(8) NOT NULL,
  `prosedur_sekunder3` varchar(80) NOT NULL,
  `kd_prosedur_sekunder3` varchar(8) NOT NULL,
  `alergi` varchar(100) NOT NULL,
  `diet` text NOT NULL,
  `lab_belum` text NOT NULL,
  `edukasi` text NOT NULL,
  `cara_keluar` enum('Atas Izin Dokter','Pindah RS','Pulang Atas Permintaan Sendiri','Lainnya') NOT NULL,
  `ket_keluar` varchar(50) DEFAULT NULL,
  `keadaan` enum('Membaik','Sembuh','Keadaan Khusus','Meninggal') NOT NULL,
  `ket_keadaan` varchar(50) DEFAULT NULL,
  `dilanjutkan` enum('Kembali Ke RS','RS Lain','Dokter Luar','Puskesmes','Lainnya') NOT NULL,
  `ket_dilanjutkan` varchar(50) DEFAULT NULL,
  `kontrol` datetime DEFAULT NULL,
  `obat_pulang` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_barang_medis`
--

CREATE TABLE `riwayat_barang_medis` (
  `kode_brng` varchar(15) DEFAULT NULL,
  `stok_awal` double DEFAULT NULL,
  `masuk` double DEFAULT NULL,
  `keluar` double DEFAULT NULL,
  `stok_akhir` double NOT NULL,
  `posisi` enum('Pemberian Obat','Pengadaan','Penerimaan','Piutang','Retur Beli','Retur Jual','Retur Piutang','Mutasi','Opname','Resep Pulang','Retur Pasien','Stok Pasien Ranap','Pengambilan Medis','Penjualan','Stok Keluar','Hibah') DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `petugas` varchar(20) DEFAULT NULL,
  `kd_bangsal` char(5) DEFAULT NULL,
  `status` enum('Simpan','Hapus') DEFAULT NULL,
  `no_batch` varchar(20) NOT NULL,
  `no_faktur` varchar(20) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `riwayat_barang_medis`
--

INSERT INTO `riwayat_barang_medis` (`kode_brng`, `stok_awal`, `masuk`, `keluar`, `stok_akhir`, `posisi`, `tanggal`, `jam`, `petugas`, `kd_bangsal`, `status`, `no_batch`, `no_faktur`, `keterangan`) VALUES
('B00001', 0, 100, 0, 100, 'Pengadaan', '2024-12-08', '17:15:56', 'Administrator', 'APT', 'Simpan', '0', '0', '-'),
('B00001', 100, 0, 10, 90, 'Pemberian Obat', '2024-12-08', '17:17:06', 'Administrator', 'APT', 'Simpan', '0', '0', '2024/12/08/000001 000001 Vian');

-- --------------------------------------------------------

--
-- Table structure for table `ruang_ok`
--

CREATE TABLE `ruang_ok` (
  `kd_ruang_ok` varchar(3) NOT NULL,
  `nm_ruang_ok` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `set_keterlambatan`
--

CREATE TABLE `set_keterlambatan` (
  `toleransi` int(11) DEFAULT NULL,
  `terlambat1` int(11) DEFAULT NULL,
  `terlambat2` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `set_no_rkm_medis`
--

CREATE TABLE `set_no_rkm_medis` (
  `no_rkm_medis` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `set_no_rkm_medis`
--

INSERT INTO `set_no_rkm_medis` (`no_rkm_medis`) VALUES
('000001');

-- --------------------------------------------------------

--
-- Table structure for table `skdp_bpjs`
--

CREATE TABLE `skdp_bpjs` (
  `tahun` year(4) NOT NULL,
  `no_rkm_medis` varchar(15) DEFAULT NULL,
  `diagnosa` varchar(50) NOT NULL,
  `terapi` varchar(50) NOT NULL,
  `alasan1` varchar(50) DEFAULT NULL,
  `alasan2` varchar(50) DEFAULT NULL,
  `rtl1` varchar(50) DEFAULT NULL,
  `rtl2` varchar(50) DEFAULT NULL,
  `tanggal_datang` datetime DEFAULT NULL,
  `tanggal_rujukan` datetime NOT NULL,
  `no_antrian` varchar(6) NOT NULL,
  `kd_dokter` varchar(20) DEFAULT NULL,
  `status` enum('Menunggu','Sudah Periksa','Batal Periksa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `spesialis`
--

CREATE TABLE `spesialis` (
  `kd_sps` char(5) NOT NULL DEFAULT '',
  `nm_sps` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spesialis`
--

INSERT INTO `spesialis` (`kd_sps`, `nm_sps`) VALUES
('UMUM', 'Dokter Umum');

-- --------------------------------------------------------

--
-- Table structure for table `stts_kerja`
--

CREATE TABLE `stts_kerja` (
  `stts` char(3) NOT NULL,
  `ktg` varchar(20) NOT NULL,
  `indek` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stts_kerja`
--

INSERT INTO `stts_kerja` (`stts`, `ktg`, `indek`) VALUES
('-', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stts_wp`
--

CREATE TABLE `stts_wp` (
  `stts` char(5) NOT NULL,
  `ktg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stts_wp`
--

INSERT INTO `stts_wp` (`stts`, `ktg`) VALUES
('-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `suku_bangsa`
--

CREATE TABLE `suku_bangsa` (
  `id` int(11) NOT NULL,
  `nama_suku_bangsa` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `suku_bangsa`
--

INSERT INTO `suku_bangsa` (`id`, `nama_suku_bangsa`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `tambahan_biaya`
--

CREATE TABLE `tambahan_biaya` (
  `no_rawat` varchar(17) NOT NULL,
  `nama_biaya` varchar(60) NOT NULL,
  `besar_biaya` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `template_laboratorium`
--

CREATE TABLE `template_laboratorium` (
  `kd_jenis_prw` varchar(15) NOT NULL,
  `id_template` int(11) NOT NULL,
  `Pemeriksaan` varchar(200) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `nilai_rujukan_ld` varchar(30) NOT NULL,
  `nilai_rujukan_la` varchar(30) NOT NULL,
  `nilai_rujukan_pd` varchar(30) NOT NULL,
  `nilai_rujukan_pa` varchar(30) NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `bagian_perujuk` double NOT NULL,
  `bagian_dokter` double NOT NULL,
  `bagian_laborat` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_item` double NOT NULL,
  `urut` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `template_laboratorium`
--

INSERT INTO `template_laboratorium` (`kd_jenis_prw`, `id_template`, `Pemeriksaan`, `satuan`, `nilai_rujukan_ld`, `nilai_rujukan_la`, `nilai_rujukan_pd`, `nilai_rujukan_pa`, `bagian_rs`, `bhp`, `bagian_perujuk`, `bagian_dokter`, `bagian_laborat`, `kso`, `menejemen`, `biaya_item`, `urut`) VALUES
('LAB001', 1, 'Leukosit', 'LK', '10', '5', '10', '5', 0, 0, 0, 0, 0, 0, 0, 0, 1),
('LAB001', 2, 'Hemoglobin', 'HB', '20', '10', '20', '10', 0, 0, 0, 0, 0, 0, 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `temporary_presensi`
--

CREATE TABLE `temporary_presensi` (
  `id` int(11) NOT NULL,
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') NOT NULL,
  `jam_datang` datetime DEFAULT NULL,
  `jam_pulang` datetime DEFAULT NULL,
  `status` enum('Tepat Waktu','Terlambat Toleransi','Terlambat I','Terlambat II','Tepat Waktu & PSW','Terlambat Toleransi & PSW','Terlambat I & PSW','Terlambat II & PSW') NOT NULL,
  `keterlambatan` varchar(20) NOT NULL,
  `durasi` varchar(20) DEFAULT NULL,
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utd_donor`
--

CREATE TABLE `utd_donor` (
  `no_donor` varchar(15) NOT NULL,
  `no_pendonor` varchar(15) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `dinas` enum('Pagi','Siang','Sore','Malam') DEFAULT NULL,
  `tensi` varchar(7) DEFAULT NULL,
  `no_bag` int(11) DEFAULT NULL,
  `jenis_bag` enum('SB','DB','TB','QB') DEFAULT NULL,
  `jenis_donor` enum('DB','DP','DS') DEFAULT NULL,
  `tempat_aftap` enum('Dalam Gedung','Luar Gedung') DEFAULT NULL,
  `petugas_aftap` varchar(20) DEFAULT NULL,
  `hbsag` enum('Negatif','Positif') DEFAULT NULL,
  `hcv` enum('Negatif','Positif') DEFAULT NULL,
  `hiv` enum('Negatif','Positif') DEFAULT NULL,
  `spilis` enum('Negatif','Positif') DEFAULT NULL,
  `malaria` enum('Negatif','Positif') DEFAULT NULL,
  `petugas_u_saring` varchar(20) DEFAULT NULL,
  `status` enum('Aman','Cekal') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utd_komponen_darah`
--

CREATE TABLE `utd_komponen_darah` (
  `kode` varchar(5) NOT NULL,
  `nama` varchar(70) DEFAULT NULL,
  `lama` smallint(6) DEFAULT NULL,
  `jasa_sarana` double DEFAULT NULL,
  `paket_bhp` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `manajemen` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `pembatalan` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utd_pendonor`
--

CREATE TABLE `utd_pendonor` (
  `no_pendonor` varchar(15) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `no_ktp` varchar(20) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `tmp_lahir` varchar(15) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kd_kel` int(11) NOT NULL,
  `kd_kec` int(11) NOT NULL,
  `kd_kab` int(11) NOT NULL,
  `kd_prop` int(11) NOT NULL,
  `golongan_darah` enum('A','AB','B','O') NOT NULL,
  `resus` enum('(-)','(+)') NOT NULL,
  `no_telp` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utd_stok_darah`
--

CREATE TABLE `utd_stok_darah` (
  `no_kantong` varchar(20) NOT NULL DEFAULT '',
  `kode_komponen` varchar(5) DEFAULT NULL,
  `golongan_darah` enum('A','AB','B','O') DEFAULT NULL,
  `resus` enum('(-)','(+)') DEFAULT NULL,
  `tanggal_aftap` date DEFAULT NULL,
  `tanggal_kadaluarsa` date DEFAULT NULL,
  `asal_darah` enum('Hibah','Beli','Produksi Sendiri') DEFAULT NULL,
  `status` enum('Ada','Diambil','Dimusnahkan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aturan_pakai`
--
ALTER TABLE `aturan_pakai`
  ADD PRIMARY KEY (`tgl_perawatan`,`jam`,`no_rawat`,`kode_brng`),
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kode_brng` (`kode_brng`);

--
-- Indexes for table `bahasa_pasien`
--
ALTER TABLE `bahasa_pasien`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `nama_bahasa` (`nama_bahasa`) USING BTREE;

--
-- Indexes for table `bangsal`
--
ALTER TABLE `bangsal`
  ADD PRIMARY KEY (`kd_bangsal`),
  ADD KEY `nm_bangsal` (`nm_bangsal`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`namabank`);

--
-- Indexes for table `barcode`
--
ALTER TABLE `barcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`);

--
-- Indexes for table `beri_obat_operasi`
--
ALTER TABLE `beri_obat_operasi`
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_obat` (`kd_obat`),
  ADD KEY `tanggal` (`tanggal`),
  ADD KEY `hargasatuan` (`hargasatuan`),
  ADD KEY `jumlah` (`jumlah`);

--
-- Indexes for table `berkas_digital_perawatan`
--
ALTER TABLE `berkas_digital_perawatan`
  ADD PRIMARY KEY (`no_rawat`,`kode`,`lokasi_file`) USING BTREE,
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `bidang`
--
ALTER TABLE `bidang`
  ADD PRIMARY KEY (`nama`);

--
-- Indexes for table `booking_operasi`
--
ALTER TABLE `booking_operasi`
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kode_paket` (`kode_paket`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `kd_ruang_ok` (`kd_ruang_ok`);

--
-- Indexes for table `booking_periksa`
--
ALTER TABLE `booking_periksa`
  ADD PRIMARY KEY (`no_booking`),
  ADD UNIQUE KEY `tanggal` (`tanggal`,`no_telp`),
  ADD KEY `kd_poli` (`kd_poli`);

--
-- Indexes for table `booking_periksa_balasan`
--
ALTER TABLE `booking_periksa_balasan`
  ADD PRIMARY KEY (`no_booking`);

--
-- Indexes for table `booking_periksa_diterima`
--
ALTER TABLE `booking_periksa_diterima`
  ADD PRIMARY KEY (`no_booking`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`);

--
-- Indexes for table `booking_registrasi`
--
ALTER TABLE `booking_registrasi`
  ADD PRIMARY KEY (`no_rkm_medis`,`tanggal_periksa`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `kd_poli` (`kd_poli`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`),
  ADD KEY `kd_pj` (`kd_pj`);

--
-- Indexes for table `bpjs_prb`
--
ALTER TABLE `bpjs_prb`
  ADD PRIMARY KEY (`no_sep`);

--
-- Indexes for table `bridging_rujukan_bpjs`
--
ALTER TABLE `bridging_rujukan_bpjs`
  ADD PRIMARY KEY (`no_rujukan`),
  ADD KEY `no_sep` (`no_sep`);

--
-- Indexes for table `bridging_sep`
--
ALTER TABLE `bridging_sep`
  ADD PRIMARY KEY (`no_sep`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `bridging_sep_internal`
--
ALTER TABLE `bridging_sep_internal`
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `no_sep` (`no_sep`);

--
-- Indexes for table `bridging_srb_bpjs`
--
ALTER TABLE `bridging_srb_bpjs`
  ADD PRIMARY KEY (`no_sep`,`no_srb`);

--
-- Indexes for table `bridging_surat_kontrol_bpjs`
--
ALTER TABLE `bridging_surat_kontrol_bpjs`
  ADD PRIMARY KEY (`no_surat`),
  ADD KEY `bridging_surat_kontrol_bpjs_ibfk_1` (`no_sep`);

--
-- Indexes for table `bridging_surat_pri_bpjs`
--
ALTER TABLE `bridging_surat_pri_bpjs`
  ADD PRIMARY KEY (`no_surat`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `cacat_fisik`
--
ALTER TABLE `cacat_fisik`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `nama_cacat` (`nama_cacat`) USING BTREE;

--
-- Indexes for table `catatan_perawatan`
--
ALTER TABLE `catatan_perawatan`
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_dokter` (`kd_dokter`);

--
-- Indexes for table `databarang`
--
ALTER TABLE `databarang`
  ADD PRIMARY KEY (`kode_brng`),
  ADD KEY `kode_sat` (`kode_sat`),
  ADD KEY `kdjns` (`kdjns`),
  ADD KEY `nama_brng` (`nama_brng`),
  ADD KEY `letak_barang` (`letak_barang`),
  ADD KEY `h_beli` (`h_beli`),
  ADD KEY `h_distributor` (`ralan`),
  ADD KEY `h_grosir` (`kelas1`),
  ADD KEY `h_retail` (`kelas2`),
  ADD KEY `stok` (`stokminimal`),
  ADD KEY `kapasitas` (`kapasitas`),
  ADD KEY `kode_industri` (`kode_industri`),
  ADD KEY `kelas3` (`kelas3`),
  ADD KEY `utama` (`utama`),
  ADD KEY `vip` (`vip`),
  ADD KEY `vvip` (`vvip`),
  ADD KEY `beliluar` (`beliluar`),
  ADD KEY `jualbebas` (`jualbebas`),
  ADD KEY `karyawan` (`karyawan`),
  ADD KEY `expire` (`expire`),
  ADD KEY `status` (`status`),
  ADD KEY `kode_kategori` (`kode_kategori`),
  ADD KEY `kode_golongan` (`kode_golongan`),
  ADD KEY `kode_satbesar` (`kode_satbesar`) USING BTREE;

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`dep_id`),
  ADD KEY `nama` (`nama`);

--
-- Indexes for table `detail_pemberian_obat`
--
ALTER TABLE `detail_pemberian_obat`
  ADD PRIMARY KEY (`tgl_perawatan`,`jam`,`no_rawat`,`kode_brng`,`no_batch`,`no_faktur`) USING BTREE,
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_obat` (`kode_brng`),
  ADD KEY `tgl_perawatan` (`tgl_perawatan`),
  ADD KEY `jam` (`jam`),
  ADD KEY `jml` (`jml`),
  ADD KEY `tambahan` (`embalase`),
  ADD KEY `total` (`total`),
  ADD KEY `biaya_obat` (`biaya_obat`),
  ADD KEY `kd_bangsal` (`kd_bangsal`),
  ADD KEY `tuslah` (`tuslah`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `detail_periksa_lab`
--
ALTER TABLE `detail_periksa_lab`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`tgl_periksa`,`jam`,`id_template`),
  ADD KEY `id_template` (`id_template`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `tgl_periksa` (`tgl_periksa`),
  ADD KEY `jam` (`jam`),
  ADD KEY `nilai` (`nilai`),
  ADD KEY `nilai_rujukan` (`nilai_rujukan`),
  ADD KEY `keterangan` (`keterangan`),
  ADD KEY `biaya_item` (`biaya_item`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `kso` (`kso`),
  ADD KEY `bagian_rs` (`bagian_rs`),
  ADD KEY `bhp` (`bhp`),
  ADD KEY `bagian_perujuk` (`bagian_perujuk`),
  ADD KEY `bagian_dokter` (`bagian_dokter`),
  ADD KEY `bagian_laborat` (`bagian_laborat`);

--
-- Indexes for table `diagnosa_pasien`
--
ALTER TABLE `diagnosa_pasien`
  ADD PRIMARY KEY (`no_rawat`,`kd_penyakit`,`status`),
  ADD KEY `kd_penyakit` (`kd_penyakit`),
  ADD KEY `status` (`status`),
  ADD KEY `prioritas` (`prioritas`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`kd_dokter`),
  ADD KEY `kd_sps` (`kd_sps`),
  ADD KEY `nm_dokter` (`nm_dokter`),
  ADD KEY `jk` (`jk`),
  ADD KEY `tmp_lahir` (`tmp_lahir`),
  ADD KEY `tgl_lahir` (`tgl_lahir`),
  ADD KEY `gol_drh` (`gol_drh`),
  ADD KEY `agama` (`agama`),
  ADD KEY `almt_tgl` (`almt_tgl`),
  ADD KEY `no_telp` (`no_telp`),
  ADD KEY `stts_nikah` (`stts_nikah`),
  ADD KEY `alumni` (`alumni`),
  ADD KEY `no_ijn_praktek` (`no_ijn_praktek`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `dpjp_ranap`
--
ALTER TABLE `dpjp_ranap`
  ADD PRIMARY KEY (`no_rawat`,`kd_dokter`),
  ADD KEY `dpjp_ranap_ibfk_2` (`kd_dokter`);

--
-- Indexes for table `emergency_index`
--
ALTER TABLE `emergency_index`
  ADD PRIMARY KEY (`kode_emergency`);

--
-- Indexes for table `gambar_radiologi`
--
ALTER TABLE `gambar_radiologi`
  ADD PRIMARY KEY (`no_rawat`,`tgl_periksa`,`jam`,`lokasi_gambar`);

--
-- Indexes for table `golongan_barang`
--
ALTER TABLE `golongan_barang`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `gudangbarang`
--
ALTER TABLE `gudangbarang`
  ADD PRIMARY KEY (`kode_brng`,`kd_bangsal`,`no_batch`,`no_faktur`) USING BTREE,
  ADD KEY `kode_brng` (`kode_brng`),
  ADD KEY `stok` (`stok`),
  ADD KEY `kd_bangsal` (`kd_bangsal`) USING BTREE;

--
-- Indexes for table `hasil_radiologi`
--
ALTER TABLE `hasil_radiologi`
  ADD PRIMARY KEY (`no_rawat`,`tgl_periksa`,`jam`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `icd9`
--
ALTER TABLE `icd9`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `industrifarmasi`
--
ALTER TABLE `industrifarmasi`
  ADD PRIMARY KEY (`kode_industri`),
  ADD KEY `nama_industri` (`nama_industri`),
  ADD KEY `alamat` (`alamat`),
  ADD KEY `kota` (`kota`),
  ADD KEY `no_telp` (`no_telp`);

--
-- Indexes for table `inventaris`
--
ALTER TABLE `inventaris`
  ADD PRIMARY KEY (`no_inventaris`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `kd_ruang` (`id_ruang`),
  ADD KEY `asal_barang` (`asal_barang`),
  ADD KEY `tgl_pengadaan` (`tgl_pengadaan`),
  ADD KEY `harga` (`harga`),
  ADD KEY `status_barang` (`status_barang`),
  ADD KEY `no_rak` (`no_rak`),
  ADD KEY `no_box` (`no_box`);

--
-- Indexes for table `inventaris_barang`
--
ALTER TABLE `inventaris_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `kode_produsen` (`kode_produsen`),
  ADD KEY `id_merk` (`id_merk`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_jenis` (`id_jenis`),
  ADD KEY `nama_barang` (`nama_barang`),
  ADD KEY `jml_barang` (`jml_barang`),
  ADD KEY `thn_produksi` (`thn_produksi`),
  ADD KEY `isbn` (`isbn`);

--
-- Indexes for table `inventaris_jenis`
--
ALTER TABLE `inventaris_jenis`
  ADD PRIMARY KEY (`id_jenis`),
  ADD KEY `nama_jenis` (`nama_jenis`);

--
-- Indexes for table `inventaris_kategori`
--
ALTER TABLE `inventaris_kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `inventaris_merk`
--
ALTER TABLE `inventaris_merk`
  ADD PRIMARY KEY (`id_merk`),
  ADD KEY `nama_merk` (`nama_merk`);

--
-- Indexes for table `inventaris_peminjaman`
--
ALTER TABLE `inventaris_peminjaman`
  ADD PRIMARY KEY (`peminjam`,`no_inventaris`,`tgl_pinjam`,`nip`) USING BTREE,
  ADD KEY `no_inventaris` (`no_inventaris`) USING BTREE,
  ADD KEY `nip` (`nip`) USING BTREE,
  ADD KEY `tgl_kembali` (`tgl_kembali`) USING BTREE,
  ADD KEY `status_pinjam` (`status_pinjam`) USING BTREE;

--
-- Indexes for table `inventaris_produsen`
--
ALTER TABLE `inventaris_produsen`
  ADD PRIMARY KEY (`kode_produsen`),
  ADD KEY `nama_produsen` (`nama_produsen`),
  ADD KEY `alamat_produsen` (`alamat_produsen`),
  ADD KEY `no_telp` (`no_telp`),
  ADD KEY `email` (`email`),
  ADD KEY `website_produsen` (`website_produsen`);

--
-- Indexes for table `inventaris_ruang`
--
ALTER TABLE `inventaris_ruang`
  ADD PRIMARY KEY (`id_ruang`),
  ADD KEY `nama_ruang` (`nama_ruang`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`kd_jbtn`),
  ADD KEY `nm_jbtn` (`nm_jbtn`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kd_dokter`,`hari_kerja`,`jam_mulai`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `kd_poli` (`kd_poli`),
  ADD KEY `jam_mulai` (`jam_mulai`),
  ADD KEY `jam_selesai` (`jam_selesai`);

--
-- Indexes for table `jadwal_pegawai`
--
ALTER TABLE `jadwal_pegawai`
  ADD PRIMARY KEY (`id`,`tahun`,`bulan`),
  ADD KEY `h1` (`h1`),
  ADD KEY `h2` (`h2`),
  ADD KEY `h3` (`h3`),
  ADD KEY `h4` (`h4`),
  ADD KEY `h30` (`h30`),
  ADD KEY `h31` (`h31`),
  ADD KEY `h29` (`h29`),
  ADD KEY `h28` (`h28`),
  ADD KEY `h18` (`h18`),
  ADD KEY `h9` (`h9`);

--
-- Indexes for table `jadwal_tambahan`
--
ALTER TABLE `jadwal_tambahan`
  ADD PRIMARY KEY (`id`,`tahun`,`bulan`);

--
-- Indexes for table `jam_jaga`
--
ALTER TABLE `jam_jaga`
  ADD PRIMARY KEY (`no_id`),
  ADD UNIQUE KEY `dep_id_2` (`dep_id`,`shift`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `shift` (`shift`),
  ADD KEY `jam_masuk` (`jam_masuk`),
  ADD KEY `jam_pulang` (`jam_pulang`);

--
-- Indexes for table `jam_masuk`
--
ALTER TABLE `jam_masuk`
  ADD PRIMARY KEY (`shift`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`kdjns`),
  ADD KEY `nama` (`nama`),
  ADD KEY `keterangan` (`keterangan`);

--
-- Indexes for table `jnj_jabatan`
--
ALTER TABLE `jnj_jabatan`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `nama` (`nama`),
  ADD KEY `tnj` (`tnj`);

--
-- Indexes for table `jns_perawatan`
--
ALTER TABLE `jns_perawatan`
  ADD PRIMARY KEY (`kd_jenis_prw`),
  ADD KEY `kd_kategori` (`kd_kategori`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `kd_poli` (`kd_poli`),
  ADD KEY `nm_perawatan` (`nm_perawatan`),
  ADD KEY `material` (`material`),
  ADD KEY `tarif_tindakandr` (`tarif_tindakandr`),
  ADD KEY `tarif_tindakanpr` (`tarif_tindakanpr`),
  ADD KEY `total_byrdr` (`total_byrdr`),
  ADD KEY `total_byrpr` (`total_byrpr`),
  ADD KEY `kso` (`kso`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `status` (`status`),
  ADD KEY `total_byrdrpr` (`total_byrdrpr`),
  ADD KEY `bhp` (`bhp`);

--
-- Indexes for table `jns_perawatan_inap`
--
ALTER TABLE `jns_perawatan_inap`
  ADD PRIMARY KEY (`kd_jenis_prw`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `kd_bangsal` (`kd_bangsal`),
  ADD KEY `kd_kategori` (`kd_kategori`),
  ADD KEY `nm_perawatan` (`nm_perawatan`),
  ADD KEY `material` (`material`),
  ADD KEY `tarif_tindakandr` (`tarif_tindakandr`),
  ADD KEY `tarif_tindakanpr` (`tarif_tindakanpr`),
  ADD KEY `total_byrdr` (`total_byrdr`),
  ADD KEY `total_byrpr` (`total_byrpr`),
  ADD KEY `bhp` (`bhp`),
  ADD KEY `kso` (`kso`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `status` (`status`),
  ADD KEY `total_byrdrpr` (`total_byrdrpr`);

--
-- Indexes for table `jns_perawatan_lab`
--
ALTER TABLE `jns_perawatan_lab`
  ADD PRIMARY KEY (`kd_jenis_prw`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `nm_perawatan` (`nm_perawatan`),
  ADD KEY `tarif_perujuk` (`tarif_perujuk`),
  ADD KEY `tarif_tindakan_dokter` (`tarif_tindakan_dokter`),
  ADD KEY `tarif_tindakan_petugas` (`tarif_tindakan_petugas`),
  ADD KEY `total_byr` (`total_byr`),
  ADD KEY `bagian_rs` (`bagian_rs`),
  ADD KEY `bhp` (`bhp`),
  ADD KEY `kso` (`kso`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `jns_perawatan_radiologi`
--
ALTER TABLE `jns_perawatan_radiologi`
  ADD PRIMARY KEY (`kd_jenis_prw`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `nm_perawatan` (`nm_perawatan`),
  ADD KEY `bagian_rs` (`bagian_rs`),
  ADD KEY `tarif_perujuk` (`tarif_perujuk`),
  ADD KEY `tarif_tindakan_dokter` (`tarif_tindakan_dokter`),
  ADD KEY `tarif_tindakan_petugas` (`tarif_tindakan_petugas`),
  ADD KEY `total_byr` (`total_byr`),
  ADD KEY `bhp` (`bhp`),
  ADD KEY `kso` (`kso`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`kd_kab`),
  ADD UNIQUE KEY `nm_kab` (`nm_kab`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`kd_kamar`),
  ADD KEY `kd_bangsal` (`kd_bangsal`),
  ADD KEY `trf_kamar` (`trf_kamar`),
  ADD KEY `status` (`status`),
  ADD KEY `kelas` (`kelas`),
  ADD KEY `statusdata` (`statusdata`);

--
-- Indexes for table `kamar_inap`
--
ALTER TABLE `kamar_inap`
  ADD PRIMARY KEY (`no_rawat`,`tgl_masuk`,`jam_masuk`),
  ADD KEY `kd_kamar` (`kd_kamar`),
  ADD KEY `diagnosa_awal` (`diagnosa_awal`),
  ADD KEY `diagnosa_akhir` (`diagnosa_akhir`),
  ADD KEY `tgl_keluar` (`tgl_keluar`),
  ADD KEY `jam_keluar` (`jam_keluar`),
  ADD KEY `lama` (`lama`),
  ADD KEY `ttl_biaya` (`ttl_biaya`),
  ADD KEY `stts_pulang` (`stts_pulang`),
  ADD KEY `trf_kamar` (`trf_kamar`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `kategori_penyakit`
--
ALTER TABLE `kategori_penyakit`
  ADD PRIMARY KEY (`kd_ktg`),
  ADD KEY `nm_kategori` (`nm_kategori`),
  ADD KEY `ciri_umum` (`ciri_umum`);

--
-- Indexes for table `kategori_perawatan`
--
ALTER TABLE `kategori_perawatan`
  ADD PRIMARY KEY (`kd_kategori`),
  ADD KEY `nm_kategori` (`nm_kategori`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`kd_kec`);

--
-- Indexes for table `kelompok_jabatan`
--
ALTER TABLE `kelompok_jabatan`
  ADD PRIMARY KEY (`kode_kelompok`);

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`kd_kel`);

--
-- Indexes for table `kodesatuan`
--
ALTER TABLE `kodesatuan`
  ADD PRIMARY KEY (`kode_sat`),
  ADD KEY `satuan` (`satuan`);

--
-- Indexes for table `laporan_operasi`
--
ALTER TABLE `laporan_operasi`
  ADD PRIMARY KEY (`no_rawat`,`tanggal`);

--
-- Indexes for table `maping_dokter_dpjpvclaim`
--
ALTER TABLE `maping_dokter_dpjpvclaim`
  ADD PRIMARY KEY (`kd_dokter`) USING BTREE;

--
-- Indexes for table `maping_dokter_pcare`
--
ALTER TABLE `maping_dokter_pcare`
  ADD PRIMARY KEY (`kd_dokter`) USING BTREE;

--
-- Indexes for table `maping_poliklinik_pcare`
--
ALTER TABLE `maping_poliklinik_pcare`
  ADD PRIMARY KEY (`kd_poli_rs`) USING BTREE;

--
-- Indexes for table `maping_poli_bpjs`
--
ALTER TABLE `maping_poli_bpjs`
  ADD PRIMARY KEY (`kd_poli_rs`),
  ADD UNIQUE KEY `kd_poli_bpjs` (`kd_poli_bpjs`) USING BTREE;

--
-- Indexes for table `master_aturan_pakai`
--
ALTER TABLE `master_aturan_pakai`
  ADD PRIMARY KEY (`aturan`);

--
-- Indexes for table `master_berkas_digital`
--
ALTER TABLE `master_berkas_digital`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `master_masalah_keperawatan`
--
ALTER TABLE `master_masalah_keperawatan`
  ADD PRIMARY KEY (`kode_masalah`) USING BTREE;

--
-- Indexes for table `metode_racik`
--
ALTER TABLE `metode_racik`
  ADD PRIMARY KEY (`kd_racik`) USING BTREE;

--
-- Indexes for table `mlite_akun_kegiatan`
--
ALTER TABLE `mlite_akun_kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_antrian_loket`
--
ALTER TABLE `mlite_antrian_loket`
  ADD PRIMARY KEY (`kd`);

--
-- Indexes for table `mlite_billing`
--
ALTER TABLE `mlite_billing`
  ADD PRIMARY KEY (`id_billing`);

--
-- Indexes for table `mlite_bridging_pcare`
--
ALTER TABLE `mlite_bridging_pcare`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mlite_detailjurnal`
--
ALTER TABLE `mlite_detailjurnal`
  ADD KEY `no_jurnal` (`no_jurnal`),
  ADD KEY `kd_rek` (`kd_rek`),
  ADD KEY `debet` (`debet`),
  ADD KEY `kredit` (`kredit`);

--
-- Indexes for table `mlite_duitku`
--
ALTER TABLE `mlite_duitku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference` (`reference`),
  ADD KEY `mlite_duitku_ibfk_1` (`no_rkm_medis`);

--
-- Indexes for table `mlite_fenton`
--
ALTER TABLE `mlite_fenton`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mlite_geolocation_presensi`
--
ALTER TABLE `mlite_geolocation_presensi`
  ADD KEY `mlite_geolocation_presensi_ibfk_1` (`id`);

--
-- Indexes for table `mlite_jurnal`
--
ALTER TABLE `mlite_jurnal`
  ADD PRIMARY KEY (`no_jurnal`),
  ADD KEY `no_bukti` (`no_bukti`),
  ADD KEY `tgl_jurnal` (`tgl_jurnal`),
  ADD KEY `jenis` (`jenis`),
  ADD KEY `keterangan` (`keterangan`);

--
-- Indexes for table `mlite_modules`
--
ALTER TABLE `mlite_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_notifications`
--
ALTER TABLE `mlite_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_odontogram`
--
ALTER TABLE `mlite_odontogram`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_ohis`
--
ALTER TABLE `mlite_ohis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_pengaduan`
--
ALTER TABLE `mlite_pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`);

--
-- Indexes for table `mlite_pengaduan_detail`
--
ALTER TABLE `mlite_pengaduan_detail`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `pengaduan_detail_ibfk_1` (`pengaduan_id`);

--
-- Indexes for table `mlite_penilaian_awal_keperawatan_gigi`
--
ALTER TABLE `mlite_penilaian_awal_keperawatan_gigi`
  ADD PRIMARY KEY (`no_rawat`) USING BTREE,
  ADD KEY `nip` (`nip`) USING BTREE;

--
-- Indexes for table `mlite_penilaian_awal_keperawatan_ralan`
--
ALTER TABLE `mlite_penilaian_awal_keperawatan_ralan`
  ADD PRIMARY KEY (`no_rawat`) USING BTREE,
  ADD KEY `nip` (`nip`) USING BTREE;

--
-- Indexes for table `mlite_penilaian_awal_keperawatan_ranap`
--
ALTER TABLE `mlite_penilaian_awal_keperawatan_ranap`
  ADD PRIMARY KEY (`no_rawat`) USING BTREE,
  ADD KEY `nip1` (`nip1`) USING BTREE,
  ADD KEY `nip2` (`nip2`) USING BTREE,
  ADD KEY `kd_dokter` (`kd_dokter`) USING BTREE;

--
-- Indexes for table `mlite_penilaian_medis_igd`
--
ALTER TABLE `mlite_penilaian_medis_igd`
  ADD PRIMARY KEY (`no_rawat`) USING BTREE,
  ADD KEY `kd_dokter` (`kd_dokter`) USING BTREE;

--
-- Indexes for table `mlite_penilaian_medis_ralan`
--
ALTER TABLE `mlite_penilaian_medis_ralan`
  ADD PRIMARY KEY (`no_rawat`) USING BTREE,
  ADD KEY `kd_dokter` (`kd_dokter`) USING BTREE;

--
-- Indexes for table `mlite_penilaian_medis_ranap`
--
ALTER TABLE `mlite_penilaian_medis_ranap`
  ADD PRIMARY KEY (`no_rawat`) USING BTREE,
  ADD KEY `kd_dokter` (`kd_dokter`) USING BTREE;

--
-- Indexes for table `mlite_penilaian_ulang_nyeri`
--
ALTER TABLE `mlite_penilaian_ulang_nyeri`
  ADD PRIMARY KEY (`no_rawat`,`tanggal`) USING BTREE,
  ADD KEY `nip` (`nip`) USING BTREE;

--
-- Indexes for table `mlite_penjualan`
--
ALTER TABLE `mlite_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_penjualan_barang`
--
ALTER TABLE `mlite_penjualan_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_penjualan_billing`
--
ALTER TABLE `mlite_penjualan_billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_penjualan_detail`
--
ALTER TABLE `mlite_penjualan_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_peta_mukosa_rongga_mulut`
--
ALTER TABLE `mlite_peta_mukosa_rongga_mulut`
  ADD PRIMARY KEY (`no_rawat`) USING BTREE,
  ADD KEY `nip` (`nip`) USING BTREE;

--
-- Indexes for table `mlite_rekening`
--
ALTER TABLE `mlite_rekening`
  ADD PRIMARY KEY (`kd_rek`),
  ADD KEY `nm_rek` (`nm_rek`),
  ADD KEY `tipe` (`tipe`),
  ADD KEY `balance` (`balance`);

--
-- Indexes for table `mlite_rekeningtahun`
--
ALTER TABLE `mlite_rekeningtahun`
  ADD PRIMARY KEY (`thn`,`kd_rek`),
  ADD KEY `kd_rek` (`kd_rek`),
  ADD KEY `saldo_awal` (`saldo_awal`);

--
-- Indexes for table `mlite_remember_me`
--
ALTER TABLE `mlite_remember_me`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mlite_remember_me_ibfk_1` (`user_id`);

--
-- Indexes for table `mlite_satu_sehat_departemen`
--
ALTER TABLE `mlite_satu_sehat_departemen`
  ADD PRIMARY KEY (`dep_id`),
  ADD UNIQUE KEY `id_organisasi_satusehat` (`id_organisasi_satusehat`);

--
-- Indexes for table `mlite_satu_sehat_lokasi`
--
ALTER TABLE `mlite_satu_sehat_lokasi`
  ADD PRIMARY KEY (`kode`),
  ADD UNIQUE KEY `id_lokasi_satusehat` (`id_lokasi_satusehat`),
  ADD KEY `id_organisasi_satusehat` (`id_organisasi_satusehat`);

--
-- Indexes for table `mlite_satu_sehat_mapping_praktisi`
--
ALTER TABLE `mlite_satu_sehat_mapping_praktisi`
  ADD PRIMARY KEY (`practitioner_id`),
  ADD KEY `kd_dokter` (`kd_dokter`);

--
-- Indexes for table `mlite_satu_sehat_response`
--
ALTER TABLE `mlite_satu_sehat_response`
  ADD PRIMARY KEY (`no_rawat`);

--
-- Indexes for table `mlite_settings`
--
ALTER TABLE `mlite_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module` (`module`,`field`);

--
-- Indexes for table `mlite_subrekening`
--
ALTER TABLE `mlite_subrekening`
  ADD PRIMARY KEY (`kd_rek2`),
  ADD KEY `kd_rek` (`kd_rek`);

--
-- Indexes for table `mlite_surat_rujukan`
--
ALTER TABLE `mlite_surat_rujukan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_surat_sakit`
--
ALTER TABLE `mlite_surat_sakit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_surat_sehat`
--
ALTER TABLE `mlite_surat_sehat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_triase`
--
ALTER TABLE `mlite_triase`
  ADD PRIMARY KEY (`no_rawat`) USING BTREE;

--
-- Indexes for table `mlite_triase_detail`
--
ALTER TABLE `mlite_triase_detail`
  ADD PRIMARY KEY (`no_rawat`,`skala`,`kode_skala`) USING BTREE;

--
-- Indexes for table `mlite_triase_pemeriksaan`
--
ALTER TABLE `mlite_triase_pemeriksaan`
  ADD PRIMARY KEY (`kode_pemeriksaan`) USING BTREE;

--
-- Indexes for table `mlite_triase_skala`
--
ALTER TABLE `mlite_triase_skala`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `kode_pemeriksaan` (`kode_pemeriksaan`) USING BTREE;

--
-- Indexes for table `mlite_users`
--
ALTER TABLE `mlite_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_users_vedika`
--
ALTER TABLE `mlite_users_vedika`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_vedika`
--
ALTER TABLE `mlite_vedika`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_vedika_feedback`
--
ALTER TABLE `mlite_vedika_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_veronisa`
--
ALTER TABLE `mlite_veronisa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_veronisa_feedback`
--
ALTER TABLE `mlite_veronisa_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_berkas`
--
ALTER TABLE `mutasi_berkas`
  ADD PRIMARY KEY (`no_rawat`);

--
-- Indexes for table `obatbhp_ok`
--
ALTER TABLE `obatbhp_ok`
  ADD PRIMARY KEY (`kd_obat`),
  ADD KEY `kode_sat` (`kode_sat`),
  ADD KEY `nm_obat` (`nm_obat`),
  ADD KEY `hargasatuan` (`hargasatuan`);

--
-- Indexes for table `obat_racikan`
--
ALTER TABLE `obat_racikan`
  ADD PRIMARY KEY (`tgl_perawatan`,`jam`,`no_rawat`,`no_racik`),
  ADD KEY `kd_racik` (`kd_racik`),
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `no_racik` (`no_racik`);

--
-- Indexes for table `operasi`
--
ALTER TABLE `operasi`
  ADD PRIMARY KEY (`no_rawat`,`tgl_operasi`,`kode_paket`) USING BTREE,
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `operator1` (`operator1`),
  ADD KEY `operator2` (`operator2`),
  ADD KEY `operator3` (`operator3`),
  ADD KEY `asisten_operator1` (`asisten_operator1`),
  ADD KEY `asisten_operator2` (`asisten_operator2`),
  ADD KEY `dokter_anak` (`dokter_anak`),
  ADD KEY `perawaat_resusitas` (`perawaat_resusitas`),
  ADD KEY `dokter_anestesi` (`dokter_anestesi`),
  ADD KEY `asisten_anestesi` (`asisten_anestesi`),
  ADD KEY `bidan` (`bidan`),
  ADD KEY `perawat_luar` (`perawat_luar`),
  ADD KEY `kode_paket` (`kode_paket`);

--
-- Indexes for table `opname`
--
ALTER TABLE `opname`
  ADD PRIMARY KEY (`kode_brng`,`tanggal`,`kd_bangsal`,`no_batch`,`no_faktur`) USING BTREE,
  ADD KEY `kd_bangsal` (`kd_bangsal`) USING BTREE,
  ADD KEY `stok` (`stok`) USING BTREE,
  ADD KEY `real` (`real`) USING BTREE,
  ADD KEY `selisih` (`selisih`) USING BTREE,
  ADD KEY `nomihilang` (`nomihilang`) USING BTREE,
  ADD KEY `keterangan` (`keterangan`) USING BTREE,
  ADD KEY `kode_brng` (`kode_brng`) USING BTREE;

--
-- Indexes for table `paket_operasi`
--
ALTER TABLE `paket_operasi`
  ADD PRIMARY KEY (`kode_paket`),
  ADD KEY `nm_perawatan` (`nm_perawatan`),
  ADD KEY `operator1` (`operator1`),
  ADD KEY `operator2` (`operator2`),
  ADD KEY `operator3` (`operator3`),
  ADD KEY `asisten_operator1` (`asisten_operator1`),
  ADD KEY `asisten_operator2` (`asisten_operator2`),
  ADD KEY `asisten_operator3` (`instrumen`),
  ADD KEY `dokter_anak` (`dokter_anak`),
  ADD KEY `perawat_resusitas` (`perawaat_resusitas`),
  ADD KEY `dokter_anestasi` (`dokter_anestesi`),
  ADD KEY `asisten_anastesi` (`asisten_anestesi`),
  ADD KEY `bidan` (`bidan`),
  ADD KEY `perawat_luar` (`perawat_luar`),
  ADD KEY `sewa_ok` (`sewa_ok`),
  ADD KEY `alat` (`alat`),
  ADD KEY `sewa_vk` (`akomodasi`),
  ADD KEY `bagian_rs` (`bagian_rs`),
  ADD KEY `omloop` (`omloop`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `asisten_anestesi2` (`asisten_anestesi2`),
  ADD KEY `omloop2` (`omloop2`),
  ADD KEY `omloop3` (`omloop3`),
  ADD KEY `omloop4` (`omloop4`),
  ADD KEY `omloop5` (`omloop5`),
  ADD KEY `status` (`status`),
  ADD KEY `kategori` (`kategori`),
  ADD KEY `bidan2` (`bidan2`),
  ADD KEY `bidan3` (`bidan3`),
  ADD KEY `asisten_operator3_2` (`asisten_operator3`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`no_rkm_medis`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `kd_kec` (`kd_kec`),
  ADD KEY `kd_kab` (`kd_kab`),
  ADD KEY `nm_pasien` (`nm_pasien`),
  ADD KEY `alamat` (`alamat`),
  ADD KEY `kd_kel_2` (`kd_kel`),
  ADD KEY `no_ktp` (`no_ktp`),
  ADD KEY `no_peserta` (`no_peserta`),
  ADD KEY `perusahaan_pasien` (`perusahaan_pasien`) USING BTREE,
  ADD KEY `suku_bangsa` (`suku_bangsa`) USING BTREE,
  ADD KEY `bahasa_pasien` (`bahasa_pasien`) USING BTREE,
  ADD KEY `cacat_fisik` (`cacat_fisik`) USING BTREE,
  ADD KEY `kd_prop` (`kd_prop`) USING BTREE;

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik_2` (`nik`),
  ADD KEY `departemen` (`departemen`),
  ADD KEY `bidang` (`bidang`),
  ADD KEY `stts_wp` (`stts_wp`),
  ADD KEY `stts_kerja` (`stts_kerja`),
  ADD KEY `pendidikan` (`pendidikan`),
  ADD KEY `indexins` (`indexins`),
  ADD KEY `jnj_jabatan` (`jnj_jabatan`),
  ADD KEY `bpd` (`bpd`),
  ADD KEY `nama` (`nama`),
  ADD KEY `jbtn` (`jbtn`),
  ADD KEY `npwp` (`npwp`),
  ADD KEY `dankes` (`dankes`),
  ADD KEY `cuti_diambil` (`cuti_diambil`),
  ADD KEY `mulai_kontrak` (`mulai_kontrak`),
  ADD KEY `stts_aktif` (`stts_aktif`),
  ADD KEY `tmp_lahir` (`tmp_lahir`),
  ADD KEY `alamat` (`alamat`),
  ADD KEY `mulai_kerja` (`mulai_kerja`),
  ADD KEY `gapok` (`gapok`),
  ADD KEY `kota` (`kota`),
  ADD KEY `pengurang` (`pengurang`),
  ADD KEY `indek` (`indek`),
  ADD KEY `jk` (`jk`),
  ADD KEY `ms_kerja` (`ms_kerja`),
  ADD KEY `tgl_lahir` (`tgl_lahir`),
  ADD KEY `rekening` (`rekening`),
  ADD KEY `wajibmasuk` (`wajibmasuk`),
  ADD KEY `kode_emergency` (`kode_emergency`) USING BTREE,
  ADD KEY `kode_kelompok` (`kode_kelompok`) USING BTREE,
  ADD KEY `kode_resiko` (`kode_resiko`) USING BTREE;

--
-- Indexes for table `pemeliharaan_inventaris`
--
ALTER TABLE `pemeliharaan_inventaris`
  ADD PRIMARY KEY (`no_inventaris`,`tanggal`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `pemeriksaan_ralan`
--
ALTER TABLE `pemeriksaan_ralan`
  ADD PRIMARY KEY (`no_rawat`,`tgl_perawatan`,`jam_rawat`) USING BTREE,
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `nip` (`nip`) USING BTREE;

--
-- Indexes for table `pemeriksaan_ranap`
--
ALTER TABLE `pemeriksaan_ranap`
  ADD PRIMARY KEY (`no_rawat`,`tgl_perawatan`,`jam_rawat`),
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD PRIMARY KEY (`tingkat`);

--
-- Indexes for table `penjab`
--
ALTER TABLE `penjab`
  ADD PRIMARY KEY (`kd_pj`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`kd_penyakit`),
  ADD KEY `kd_ktg` (`kd_ktg`),
  ADD KEY `nm_penyakit` (`nm_penyakit`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `perbaikan_inventaris`
--
ALTER TABLE `perbaikan_inventaris`
  ADD PRIMARY KEY (`no_permintaan`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `periksa_lab`
--
ALTER TABLE `periksa_lab`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`tgl_periksa`,`jam`),
  ADD KEY `nip` (`nip`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `dokter_perujuk` (`dokter_perujuk`);

--
-- Indexes for table `periksa_radiologi`
--
ALTER TABLE `periksa_radiologi`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`tgl_periksa`,`jam`),
  ADD KEY `nip` (`nip`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `dokter_perujuk` (`dokter_perujuk`);

--
-- Indexes for table `permintaan_detail_permintaan_lab`
--
ALTER TABLE `permintaan_detail_permintaan_lab`
  ADD PRIMARY KEY (`noorder`,`kd_jenis_prw`,`id_template`) USING BTREE,
  ADD KEY `id_template` (`id_template`) USING BTREE,
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`) USING BTREE;

--
-- Indexes for table `permintaan_lab`
--
ALTER TABLE `permintaan_lab`
  ADD PRIMARY KEY (`noorder`),
  ADD KEY `dokter_perujuk` (`dokter_perujuk`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `permintaan_pemeriksaan_lab`
--
ALTER TABLE `permintaan_pemeriksaan_lab`
  ADD PRIMARY KEY (`noorder`,`kd_jenis_prw`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`);

--
-- Indexes for table `permintaan_pemeriksaan_radiologi`
--
ALTER TABLE `permintaan_pemeriksaan_radiologi`
  ADD PRIMARY KEY (`noorder`,`kd_jenis_prw`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`);

--
-- Indexes for table `permintaan_perbaikan_inventaris`
--
ALTER TABLE `permintaan_perbaikan_inventaris`
  ADD PRIMARY KEY (`no_permintaan`),
  ADD KEY `no_inventaris` (`no_inventaris`),
  ADD KEY `nik` (`nik`);

--
-- Indexes for table `permintaan_radiologi`
--
ALTER TABLE `permintaan_radiologi`
  ADD PRIMARY KEY (`noorder`),
  ADD KEY `dokter_perujuk` (`dokter_perujuk`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `personal_pasien`
--
ALTER TABLE `personal_pasien`
  ADD PRIMARY KEY (`no_rkm_medis`);

--
-- Indexes for table `perusahaan_pasien`
--
ALTER TABLE `perusahaan_pasien`
  ADD PRIMARY KEY (`kode_perusahaan`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `kd_jbtn` (`kd_jbtn`),
  ADD KEY `nama` (`nama`),
  ADD KEY `nip` (`nip`),
  ADD KEY `tmp_lahir` (`tmp_lahir`),
  ADD KEY `tgl_lahir` (`tgl_lahir`),
  ADD KEY `agama` (`agama`),
  ADD KEY `stts_nikah` (`stts_nikah`),
  ADD KEY `alamat` (`alamat`);

--
-- Indexes for table `poliklinik`
--
ALTER TABLE `poliklinik`
  ADD PRIMARY KEY (`kd_poli`),
  ADD KEY `nm_poli` (`nm_poli`),
  ADD KEY `registrasi` (`registrasi`),
  ADD KEY `registrasilama` (`registrasilama`);

--
-- Indexes for table `propinsi`
--
ALTER TABLE `propinsi`
  ADD PRIMARY KEY (`kd_prop`),
  ADD UNIQUE KEY `nm_prop` (`nm_prop`);

--
-- Indexes for table `prosedur_pasien`
--
ALTER TABLE `prosedur_pasien`
  ADD PRIMARY KEY (`no_rawat`,`kode`,`status`),
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `rawat_inap_dr`
--
ALTER TABLE `rawat_inap_dr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`kd_dokter`,`tgl_perawatan`,`jam_rawat`),
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `tgl_perawatan` (`tgl_perawatan`),
  ADD KEY `biaya_rawat` (`biaya_rawat`),
  ADD KEY `jam_rawat` (`jam_rawat`);

--
-- Indexes for table `rawat_inap_drpr`
--
ALTER TABLE `rawat_inap_drpr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`kd_dokter`,`nip`,`tgl_perawatan`,`jam_rawat`),
  ADD KEY `rawat_inap_drpr_ibfk_2` (`kd_jenis_prw`),
  ADD KEY `rawat_inap_drpr_ibfk_3` (`kd_dokter`),
  ADD KEY `rawat_inap_drpr_ibfk_4` (`nip`);

--
-- Indexes for table `rawat_inap_pr`
--
ALTER TABLE `rawat_inap_pr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`nip`,`tgl_perawatan`,`jam_rawat`),
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `nip` (`nip`),
  ADD KEY `biaya_rawat` (`biaya_rawat`);

--
-- Indexes for table `rawat_jl_dr`
--
ALTER TABLE `rawat_jl_dr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`kd_dokter`,`tgl_perawatan`,`jam_rawat`) USING BTREE,
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `biaya_rawat` (`biaya_rawat`);

--
-- Indexes for table `rawat_jl_drpr`
--
ALTER TABLE `rawat_jl_drpr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`kd_dokter`,`nip`,`tgl_perawatan`,`jam_rawat`) USING BTREE,
  ADD KEY `rawat_jl_drpr_ibfk_2` (`kd_jenis_prw`),
  ADD KEY `rawat_jl_drpr_ibfk_3` (`kd_dokter`),
  ADD KEY `rawat_jl_drpr_ibfk_4` (`nip`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `rawat_jl_pr`
--
ALTER TABLE `rawat_jl_pr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`nip`,`tgl_perawatan`,`jam_rawat`) USING BTREE,
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `nip` (`nip`),
  ADD KEY `biaya_rawat` (`biaya_rawat`);

--
-- Indexes for table `reg_periksa`
--
ALTER TABLE `reg_periksa`
  ADD PRIMARY KEY (`no_rawat`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`),
  ADD KEY `kd_poli` (`kd_poli`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `status_lanjut` (`status_lanjut`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `status_bayar` (`status_bayar`) USING BTREE;

--
-- Indexes for table `rekap_presensi`
--
ALTER TABLE `rekap_presensi`
  ADD PRIMARY KEY (`id`,`jam_datang`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `resep_dokter`
--
ALTER TABLE `resep_dokter`
  ADD KEY `no_resep` (`no_resep`),
  ADD KEY `kode_brng` (`kode_brng`);

--
-- Indexes for table `resep_dokter_racikan`
--
ALTER TABLE `resep_dokter_racikan`
  ADD PRIMARY KEY (`no_resep`,`no_racik`),
  ADD KEY `kd_racik` (`kd_racik`);

--
-- Indexes for table `resep_dokter_racikan_detail`
--
ALTER TABLE `resep_dokter_racikan_detail`
  ADD PRIMARY KEY (`no_resep`,`no_racik`,`kode_brng`),
  ADD KEY `kode_brng` (`kode_brng`);

--
-- Indexes for table `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD PRIMARY KEY (`no_resep`),
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_dokter` (`kd_dokter`);

--
-- Indexes for table `resep_pulang`
--
ALTER TABLE `resep_pulang`
  ADD PRIMARY KEY (`no_rawat`,`kode_brng`,`tanggal`,`jam`,`no_batch`,`no_faktur`),
  ADD KEY `kode_brng` (`kode_brng`),
  ADD KEY `kd_bangsal` (`kd_bangsal`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `resiko_kerja`
--
ALTER TABLE `resiko_kerja`
  ADD PRIMARY KEY (`kode_resiko`);

--
-- Indexes for table `resume_pasien`
--
ALTER TABLE `resume_pasien`
  ADD PRIMARY KEY (`no_rawat`),
  ADD KEY `kd_dokter` (`kd_dokter`);

--
-- Indexes for table `resume_pasien_ranap`
--
ALTER TABLE `resume_pasien_ranap`
  ADD PRIMARY KEY (`no_rawat`),
  ADD KEY `kd_dokter` (`kd_dokter`);

--
-- Indexes for table `riwayat_barang_medis`
--
ALTER TABLE `riwayat_barang_medis`
  ADD KEY `riwayat_barang_medis_ibfk_1` (`kode_brng`) USING BTREE,
  ADD KEY `kd_bangsal` (`kd_bangsal`) USING BTREE;

--
-- Indexes for table `ruang_ok`
--
ALTER TABLE `ruang_ok`
  ADD PRIMARY KEY (`kd_ruang_ok`);

--
-- Indexes for table `skdp_bpjs`
--
ALTER TABLE `skdp_bpjs`
  ADD PRIMARY KEY (`tahun`,`no_antrian`) USING BTREE,
  ADD KEY `no_rkm_medis` (`no_rkm_medis`) USING BTREE,
  ADD KEY `kd_dokter` (`kd_dokter`) USING BTREE;

--
-- Indexes for table `spesialis`
--
ALTER TABLE `spesialis`
  ADD PRIMARY KEY (`kd_sps`);

--
-- Indexes for table `stts_kerja`
--
ALTER TABLE `stts_kerja`
  ADD PRIMARY KEY (`stts`);

--
-- Indexes for table `stts_wp`
--
ALTER TABLE `stts_wp`
  ADD PRIMARY KEY (`stts`);

--
-- Indexes for table `suku_bangsa`
--
ALTER TABLE `suku_bangsa`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `nama_suku_bangsa` (`nama_suku_bangsa`) USING BTREE;

--
-- Indexes for table `tambahan_biaya`
--
ALTER TABLE `tambahan_biaya`
  ADD PRIMARY KEY (`no_rawat`,`nama_biaya`);

--
-- Indexes for table `template_laboratorium`
--
ALTER TABLE `template_laboratorium`
  ADD PRIMARY KEY (`id_template`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `Pemeriksaan` (`Pemeriksaan`),
  ADD KEY `satuan` (`satuan`),
  ADD KEY `nilai_rujukan_ld` (`nilai_rujukan_ld`),
  ADD KEY `nilai_rujukan_la` (`nilai_rujukan_la`),
  ADD KEY `nilai_rujukan_pd` (`nilai_rujukan_pd`),
  ADD KEY `nilai_rujukan_pa` (`nilai_rujukan_pa`),
  ADD KEY `bagian_rs` (`bagian_rs`),
  ADD KEY `bhp` (`bhp`),
  ADD KEY `bagian_perujuk` (`bagian_perujuk`),
  ADD KEY `bagian_dokter` (`bagian_dokter`),
  ADD KEY `bagian_laborat` (`bagian_laborat`),
  ADD KEY `kso` (`kso`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `biaya_item` (`biaya_item`),
  ADD KEY `urut` (`urut`);

--
-- Indexes for table `temporary_presensi`
--
ALTER TABLE `temporary_presensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utd_donor`
--
ALTER TABLE `utd_donor`
  ADD PRIMARY KEY (`no_donor`),
  ADD KEY `petugas_aftap` (`petugas_aftap`),
  ADD KEY `petugas_u_saring` (`petugas_u_saring`),
  ADD KEY `no_pendonor` (`no_pendonor`);

--
-- Indexes for table `utd_komponen_darah`
--
ALTER TABLE `utd_komponen_darah`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `utd_pendonor`
--
ALTER TABLE `utd_pendonor`
  ADD PRIMARY KEY (`no_pendonor`),
  ADD KEY `kd_kec` (`kd_kec`),
  ADD KEY `kd_kab` (`kd_kab`),
  ADD KEY `kd_prop` (`kd_prop`),
  ADD KEY `kd_kel` (`kd_kel`) USING BTREE;

--
-- Indexes for table `utd_stok_darah`
--
ALTER TABLE `utd_stok_darah`
  ADD PRIMARY KEY (`no_kantong`),
  ADD KEY `kode_komponen` (`kode_komponen`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahasa_pasien`
--
ALTER TABLE `bahasa_pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cacat_fisik`
--
ALTER TABLE `cacat_fisik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jam_jaga`
--
ALTER TABLE `jam_jaga`
  MODIFY `no_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kabupaten`
--
ALTER TABLE `kabupaten`
  MODIFY `kd_kab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `kd_kec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mlite_akun_kegiatan`
--
ALTER TABLE `mlite_akun_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_antrian_loket`
--
ALTER TABLE `mlite_antrian_loket`
  MODIFY `kd` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_billing`
--
ALTER TABLE `mlite_billing`
  MODIFY `id_billing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mlite_bridging_pcare`
--
ALTER TABLE `mlite_bridging_pcare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_duitku`
--
ALTER TABLE `mlite_duitku`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_fenton`
--
ALTER TABLE `mlite_fenton`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_modules`
--
ALTER TABLE `mlite_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `mlite_notifications`
--
ALTER TABLE `mlite_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_odontogram`
--
ALTER TABLE `mlite_odontogram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_ohis`
--
ALTER TABLE `mlite_ohis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_pengaduan_detail`
--
ALTER TABLE `mlite_pengaduan_detail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_penjualan`
--
ALTER TABLE `mlite_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_penjualan_barang`
--
ALTER TABLE `mlite_penjualan_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_penjualan_billing`
--
ALTER TABLE `mlite_penjualan_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_penjualan_detail`
--
ALTER TABLE `mlite_penjualan_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_remember_me`
--
ALTER TABLE `mlite_remember_me`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_settings`
--
ALTER TABLE `mlite_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `mlite_surat_rujukan`
--
ALTER TABLE `mlite_surat_rujukan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_surat_sakit`
--
ALTER TABLE `mlite_surat_sakit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_surat_sehat`
--
ALTER TABLE `mlite_surat_sehat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_triase_skala`
--
ALTER TABLE `mlite_triase_skala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_users`
--
ALTER TABLE `mlite_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mlite_users_vedika`
--
ALTER TABLE `mlite_users_vedika`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_vedika`
--
ALTER TABLE `mlite_vedika`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_vedika_feedback`
--
ALTER TABLE `mlite_vedika_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_veronisa`
--
ALTER TABLE `mlite_veronisa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_veronisa_feedback`
--
ALTER TABLE `mlite_veronisa_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `propinsi`
--
ALTER TABLE `propinsi`
  MODIFY `kd_prop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suku_bangsa`
--
ALTER TABLE `suku_bangsa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `template_laboratorium`
--
ALTER TABLE `template_laboratorium`
  MODIFY `id_template` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aturan_pakai`
--
ALTER TABLE `aturan_pakai`
  ADD CONSTRAINT `aturan_pakai_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aturan_pakai_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barcode`
--
ALTER TABLE `barcode`
  ADD CONSTRAINT `barcode_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `beri_obat_operasi`
--
ALTER TABLE `beri_obat_operasi`
  ADD CONSTRAINT `beri_obat_operasi_ibfk_2` FOREIGN KEY (`kd_obat`) REFERENCES `obatbhp_ok` (`kd_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `beri_obat_operasi_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `berkas_digital_perawatan`
--
ALTER TABLE `berkas_digital_perawatan`
  ADD CONSTRAINT `berkas_digital_perawatan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `berkas_digital_perawatan_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `master_berkas_digital` (`kode`) ON UPDATE CASCADE;

--
-- Constraints for table `booking_operasi`
--
ALTER TABLE `booking_operasi`
  ADD CONSTRAINT `booking_operasi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_operasi_ibfk_2` FOREIGN KEY (`kode_paket`) REFERENCES `paket_operasi` (`kode_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_operasi_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_operasi_ibfk_4` FOREIGN KEY (`kd_ruang_ok`) REFERENCES `ruang_ok` (`kd_ruang_ok`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_periksa`
--
ALTER TABLE `booking_periksa`
  ADD CONSTRAINT `booking_periksa_ibfk_1` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_periksa_balasan`
--
ALTER TABLE `booking_periksa_balasan`
  ADD CONSTRAINT `booking_periksa_balasan_ibfk_1` FOREIGN KEY (`no_booking`) REFERENCES `booking_periksa` (`no_booking`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_periksa_diterima`
--
ALTER TABLE `booking_periksa_diterima`
  ADD CONSTRAINT `booking_periksa_diterima_ibfk_1` FOREIGN KEY (`no_booking`) REFERENCES `booking_periksa` (`no_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_periksa_diterima_ibfk_2` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_registrasi`
--
ALTER TABLE `booking_registrasi`
  ADD CONSTRAINT `booking_registrasi_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_registrasi_ibfk_2` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_registrasi_ibfk_3` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_registrasi_ibfk_4` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bpjs_prb`
--
ALTER TABLE `bpjs_prb`
  ADD CONSTRAINT `bpjs_prb_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bridging_rujukan_bpjs`
--
ALTER TABLE `bridging_rujukan_bpjs`
  ADD CONSTRAINT `bridging_rujukan_bpjs_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bridging_sep`
--
ALTER TABLE `bridging_sep`
  ADD CONSTRAINT `bridging_sep_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bridging_sep_internal`
--
ALTER TABLE `bridging_sep_internal`
  ADD CONSTRAINT `bridging_sep_internal_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bridging_sep_internal_ibfk_2` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bridging_srb_bpjs`
--
ALTER TABLE `bridging_srb_bpjs`
  ADD CONSTRAINT `bridging_srb_bpjs_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bridging_surat_kontrol_bpjs`
--
ALTER TABLE `bridging_surat_kontrol_bpjs`
  ADD CONSTRAINT `bridging_surat_kontrol_bpjs_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bridging_surat_pri_bpjs`
--
ALTER TABLE `bridging_surat_pri_bpjs`
  ADD CONSTRAINT `bridging_surat_pri_bpjs_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catatan_perawatan`
--
ALTER TABLE `catatan_perawatan`
  ADD CONSTRAINT `catatan_perawatan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catatan_perawatan_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `databarang`
--
ALTER TABLE `databarang`
  ADD CONSTRAINT `databarang_ibfk_2` FOREIGN KEY (`kdjns`) REFERENCES `jenis` (`kdjns`) ON UPDATE CASCADE,
  ADD CONSTRAINT `databarang_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `databarang_ibfk_4` FOREIGN KEY (`kode_industri`) REFERENCES `industrifarmasi` (`kode_industri`) ON UPDATE CASCADE,
  ADD CONSTRAINT `databarang_ibfk_5` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori_barang` (`kode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `databarang_ibfk_6` FOREIGN KEY (`kode_golongan`) REFERENCES `golongan_barang` (`kode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `databarang_ibfk_7` FOREIGN KEY (`kode_satbesar`) REFERENCES `kodesatuan` (`kode_sat`) ON UPDATE CASCADE;

--
-- Constraints for table `detail_pemberian_obat`
--
ALTER TABLE `detail_pemberian_obat`
  ADD CONSTRAINT `detail_pemberian_obat_ibfk_3` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pemberian_obat_ibfk_4` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pemberian_obat_ibfk_5` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON UPDATE CASCADE;

--
-- Constraints for table `detail_periksa_lab`
--
ALTER TABLE `detail_periksa_lab`
  ADD CONSTRAINT `detail_periksa_lab_ibfk_10` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_periksa_lab_ibfk_11` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_periksa_lab_ibfk_12` FOREIGN KEY (`id_template`) REFERENCES `template_laboratorium` (`id_template`) ON UPDATE CASCADE;

--
-- Constraints for table `diagnosa_pasien`
--
ALTER TABLE `diagnosa_pasien`
  ADD CONSTRAINT `diagnosa_pasien_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `diagnosa_pasien_ibfk_2` FOREIGN KEY (`kd_penyakit`) REFERENCES `penyakit` (`kd_penyakit`) ON UPDATE CASCADE;

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_2` FOREIGN KEY (`kd_sps`) REFERENCES `spesialis` (`kd_sps`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dokter_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `pegawai` (`nik`) ON UPDATE CASCADE;

--
-- Constraints for table `dpjp_ranap`
--
ALTER TABLE `dpjp_ranap`
  ADD CONSTRAINT `dpjp_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dpjp_ranap_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gambar_radiologi`
--
ALTER TABLE `gambar_radiologi`
  ADD CONSTRAINT `gambar_radiologi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gudangbarang`
--
ALTER TABLE `gudangbarang`
  ADD CONSTRAINT `gudangbarang_ibfk_1` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gudangbarang_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil_radiologi`
--
ALTER TABLE `hasil_radiologi`
  ADD CONSTRAINT `hasil_radiologi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventaris`
--
ALTER TABLE `inventaris`
  ADD CONSTRAINT `inventaris_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `inventaris_barang` (`kode_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `inventaris_ibfk_2` FOREIGN KEY (`id_ruang`) REFERENCES `inventaris_ruang` (`id_ruang`) ON UPDATE CASCADE;

--
-- Constraints for table `inventaris_barang`
--
ALTER TABLE `inventaris_barang`
  ADD CONSTRAINT `inventaris_barang_ibfk_5` FOREIGN KEY (`kode_produsen`) REFERENCES `inventaris_produsen` (`kode_produsen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `inventaris_barang_ibfk_6` FOREIGN KEY (`id_merk`) REFERENCES `inventaris_merk` (`id_merk`) ON UPDATE CASCADE,
  ADD CONSTRAINT `inventaris_barang_ibfk_7` FOREIGN KEY (`id_kategori`) REFERENCES `inventaris_kategori` (`id_kategori`) ON UPDATE CASCADE,
  ADD CONSTRAINT `inventaris_barang_ibfk_8` FOREIGN KEY (`id_jenis`) REFERENCES `inventaris_jenis` (`id_jenis`) ON UPDATE CASCADE;

--
-- Constraints for table `inventaris_peminjaman`
--
ALTER TABLE `inventaris_peminjaman`
  ADD CONSTRAINT `inventaris_peminjaman_ibfk_1` FOREIGN KEY (`no_inventaris`) REFERENCES `inventaris` (`no_inventaris`) ON UPDATE CASCADE,
  ADD CONSTRAINT `inventaris_peminjaman_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON UPDATE CASCADE;

--
-- Constraints for table `jadwal_pegawai`
--
ALTER TABLE `jadwal_pegawai`
  ADD CONSTRAINT `jadwal_pegawai_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `jadwal_tambahan`
--
ALTER TABLE `jadwal_tambahan`
  ADD CONSTRAINT `jadwal_tambahan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `jam_jaga`
--
ALTER TABLE `jam_jaga`
  ADD CONSTRAINT `jam_jaga_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `departemen` (`dep_id`) ON UPDATE CASCADE;

--
-- Constraints for table `jns_perawatan`
--
ALTER TABLE `jns_perawatan`
  ADD CONSTRAINT `jns_perawatan_ibfk_1` FOREIGN KEY (`kd_kategori`) REFERENCES `kategori_perawatan` (`kd_kategori`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jns_perawatan_ibfk_2` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jns_perawatan_ibfk_3` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON UPDATE CASCADE;

--
-- Constraints for table `jns_perawatan_inap`
--
ALTER TABLE `jns_perawatan_inap`
  ADD CONSTRAINT `jns_perawatan_inap_ibfk_7` FOREIGN KEY (`kd_kategori`) REFERENCES `kategori_perawatan` (`kd_kategori`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jns_perawatan_inap_ibfk_8` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jns_perawatan_inap_ibfk_9` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jns_perawatan_lab`
--
ALTER TABLE `jns_perawatan_lab`
  ADD CONSTRAINT `jns_perawatan_lab_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE;

--
-- Constraints for table `jns_perawatan_radiologi`
--
ALTER TABLE `jns_perawatan_radiologi`
  ADD CONSTRAINT `jns_perawatan_radiologi_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE;

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kamar_inap`
--
ALTER TABLE `kamar_inap`
  ADD CONSTRAINT `kamar_inap_ibfk_2` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kamar_inap_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_operasi`
--
ALTER TABLE `laporan_operasi`
  ADD CONSTRAINT `laporan_operasi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `maping_dokter_dpjpvclaim`
--
ALTER TABLE `maping_dokter_dpjpvclaim`
  ADD CONSTRAINT `maping_dokter_dpjpvclaim_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `maping_dokter_pcare`
--
ALTER TABLE `maping_dokter_pcare`
  ADD CONSTRAINT `maping_dokter_pcare_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `maping_poliklinik_pcare`
--
ALTER TABLE `maping_poliklinik_pcare`
  ADD CONSTRAINT `maping_poliklinik_pcare_ibfk_1` FOREIGN KEY (`kd_poli_rs`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `maping_poli_bpjs`
--
ALTER TABLE `maping_poli_bpjs`
  ADD CONSTRAINT `maping_poli_bpjs_ibfk_1` FOREIGN KEY (`kd_poli_rs`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_detailjurnal`
--
ALTER TABLE `mlite_detailjurnal`
  ADD CONSTRAINT `mlite_detailjurnal_ibfk_1` FOREIGN KEY (`no_jurnal`) REFERENCES `mlite_jurnal` (`no_jurnal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_detailjurnal_ibfk_2` FOREIGN KEY (`kd_rek`) REFERENCES `mlite_rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_duitku`
--
ALTER TABLE `mlite_duitku`
  ADD CONSTRAINT `mlite_duitku_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_geolocation_presensi`
--
ALTER TABLE `mlite_geolocation_presensi`
  ADD CONSTRAINT `mlite_geolocation_presensi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `mlite_pengaduan`
--
ALTER TABLE `mlite_pengaduan`
  ADD CONSTRAINT `mlite_pengaduan_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_pengaduan_detail`
--
ALTER TABLE `mlite_pengaduan_detail`
  ADD CONSTRAINT `mlite_pengaduan_detail_ibfk_1` FOREIGN KEY (`pengaduan_id`) REFERENCES `mlite_pengaduan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_penilaian_awal_keperawatan_gigi`
--
ALTER TABLE `mlite_penilaian_awal_keperawatan_gigi`
  ADD CONSTRAINT `mlite_penilaian_awal_keperawatan_gigi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_penilaian_awal_keperawatan_gigi_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_penilaian_awal_keperawatan_ralan`
--
ALTER TABLE `mlite_penilaian_awal_keperawatan_ralan`
  ADD CONSTRAINT `mlite_penilaian_awal_keperawatan_ralan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_penilaian_awal_keperawatan_ralan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_penilaian_awal_keperawatan_ranap`
--
ALTER TABLE `mlite_penilaian_awal_keperawatan_ranap`
  ADD CONSTRAINT `mlite_penilaian_awal_keperawatan_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_penilaian_awal_keperawatan_ranap_ibfk_2` FOREIGN KEY (`nip1`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_penilaian_awal_keperawatan_ranap_ibfk_3` FOREIGN KEY (`nip2`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_penilaian_awal_keperawatan_ranap_ibfk_4` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_penilaian_medis_igd`
--
ALTER TABLE `mlite_penilaian_medis_igd`
  ADD CONSTRAINT `mlite_penilaian_medis_igd_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_penilaian_medis_igd_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_penilaian_medis_ralan`
--
ALTER TABLE `mlite_penilaian_medis_ralan`
  ADD CONSTRAINT `mlite_penilaian_medis_ralan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_penilaian_medis_ralan_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_penilaian_medis_ranap`
--
ALTER TABLE `mlite_penilaian_medis_ranap`
  ADD CONSTRAINT `mlite_penilaian_medis_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_penilaian_medis_ranap_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_penilaian_ulang_nyeri`
--
ALTER TABLE `mlite_penilaian_ulang_nyeri`
  ADD CONSTRAINT `mlite_penilaian_ulang_nyeri_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_penilaian_ulang_nyeri_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_peta_mukosa_rongga_mulut`
--
ALTER TABLE `mlite_peta_mukosa_rongga_mulut`
  ADD CONSTRAINT `mlite_peta_mukosa_rongga_mulut_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_peta_mukosa_rongga_mulut_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_rekeningtahun`
--
ALTER TABLE `mlite_rekeningtahun`
  ADD CONSTRAINT `mlite_rekeningtahun_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `mlite_rekening` (`kd_rek`) ON UPDATE CASCADE;

--
-- Constraints for table `mlite_satu_sehat_departemen`
--
ALTER TABLE `mlite_satu_sehat_departemen`
  ADD CONSTRAINT `mlite_satu_sehat_departemen_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `departemen` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_satu_sehat_lokasi`
--
ALTER TABLE `mlite_satu_sehat_lokasi`
  ADD CONSTRAINT `mlite_satu_sehat_lokasi_ibfk_2` FOREIGN KEY (`id_organisasi_satusehat`) REFERENCES `mlite_satu_sehat_departemen` (`id_organisasi_satusehat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_satu_sehat_mapping_praktisi`
--
ALTER TABLE `mlite_satu_sehat_mapping_praktisi`
  ADD CONSTRAINT `mlite_satu_sehat_mapping_praktisi_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_satu_sehat_response`
--
ALTER TABLE `mlite_satu_sehat_response`
  ADD CONSTRAINT `mlite_satu_sehat_response_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_subrekening`
--
ALTER TABLE `mlite_subrekening`
  ADD CONSTRAINT `mlite_subrekening_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `mlite_rekening` (`kd_rek`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_subrekening_ibfk_2` FOREIGN KEY (`kd_rek2`) REFERENCES `mlite_rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_triase`
--
ALTER TABLE `mlite_triase`
  ADD CONSTRAINT `mlite_triase_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_triase_detail`
--
ALTER TABLE `mlite_triase_detail`
  ADD CONSTRAINT `mlite_triase_detail_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_triase_skala`
--
ALTER TABLE `mlite_triase_skala`
  ADD CONSTRAINT `mlite_triase_skala_ibfk_1` FOREIGN KEY (`kode_pemeriksaan`) REFERENCES `mlite_triase_pemeriksaan` (`kode_pemeriksaan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mutasi_berkas`
--
ALTER TABLE `mutasi_berkas`
  ADD CONSTRAINT `mutasi_berkas_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `obatbhp_ok`
--
ALTER TABLE `obatbhp_ok`
  ADD CONSTRAINT `obatbhp_ok_ibfk_1` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON UPDATE CASCADE;

--
-- Constraints for table `obat_racikan`
--
ALTER TABLE `obat_racikan`
  ADD CONSTRAINT `obat_racikan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `obat_racikan_ibfk_2` FOREIGN KEY (`kd_racik`) REFERENCES `metode_racik` (`kd_racik`) ON UPDATE CASCADE;

--
-- Constraints for table `operasi`
--
ALTER TABLE `operasi`
  ADD CONSTRAINT `operasi_ibfk_31` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_32` FOREIGN KEY (`operator1`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_33` FOREIGN KEY (`operator2`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_34` FOREIGN KEY (`operator3`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_35` FOREIGN KEY (`asisten_operator1`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_36` FOREIGN KEY (`asisten_operator2`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_38` FOREIGN KEY (`dokter_anak`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_39` FOREIGN KEY (`perawaat_resusitas`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_40` FOREIGN KEY (`dokter_anestesi`) REFERENCES `dokter` (`kd_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_41` FOREIGN KEY (`asisten_anestesi`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_42` FOREIGN KEY (`bidan`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_43` FOREIGN KEY (`perawat_luar`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_44` FOREIGN KEY (`kode_paket`) REFERENCES `paket_operasi` (`kode_paket`) ON UPDATE CASCADE;

--
-- Constraints for table `opname`
--
ALTER TABLE `opname`
  ADD CONSTRAINT `opname_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `opname_ibfk_2` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paket_operasi`
--
ALTER TABLE `paket_operasi`
  ADD CONSTRAINT `paket_operasi_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_3` FOREIGN KEY (`kd_kec`) REFERENCES `kecamatan` (`kd_kec`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_4` FOREIGN KEY (`kd_kab`) REFERENCES `kabupaten` (`kd_kab`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_5` FOREIGN KEY (`perusahaan_pasien`) REFERENCES `perusahaan_pasien` (`kode_perusahaan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_6` FOREIGN KEY (`suku_bangsa`) REFERENCES `suku_bangsa` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_7` FOREIGN KEY (`bahasa_pasien`) REFERENCES `bahasa_pasien` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_8` FOREIGN KEY (`cacat_fisik`) REFERENCES `cacat_fisik` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_9` FOREIGN KEY (`kd_prop`) REFERENCES `propinsi` (`kd_prop`) ON UPDATE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`jnj_jabatan`) REFERENCES `jnj_jabatan` (`kode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_10` FOREIGN KEY (`kode_kelompok`) REFERENCES `kelompok_jabatan` (`kode_kelompok`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_11` FOREIGN KEY (`kode_resiko`) REFERENCES `resiko_kerja` (`kode_resiko`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`dep_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_3` FOREIGN KEY (`bidang`) REFERENCES `bidang` (`nama`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_4` FOREIGN KEY (`stts_wp`) REFERENCES `stts_wp` (`stts`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_5` FOREIGN KEY (`stts_kerja`) REFERENCES `stts_kerja` (`stts`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_6` FOREIGN KEY (`pendidikan`) REFERENCES `pendidikan` (`tingkat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_7` FOREIGN KEY (`indexins`) REFERENCES `departemen` (`dep_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_8` FOREIGN KEY (`bpd`) REFERENCES `bank` (`namabank`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_9` FOREIGN KEY (`kode_emergency`) REFERENCES `emergency_index` (`kode_emergency`) ON UPDATE CASCADE;

--
-- Constraints for table `pemeliharaan_inventaris`
--
ALTER TABLE `pemeliharaan_inventaris`
  ADD CONSTRAINT `pemeliharaan_inventaris_ibfk_1` FOREIGN KEY (`no_inventaris`) REFERENCES `inventaris` (`no_inventaris`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeliharaan_inventaris_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pemeriksaan_ralan`
--
ALTER TABLE `pemeriksaan_ralan`
  ADD CONSTRAINT `pemeriksaan_ralan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_ralan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pemeriksaan_ranap`
--
ALTER TABLE `pemeriksaan_ranap`
  ADD CONSTRAINT `pemeriksaan_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_ranap_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD CONSTRAINT `penyakit_ibfk_1` FOREIGN KEY (`kd_ktg`) REFERENCES `kategori_penyakit` (`kd_ktg`) ON UPDATE CASCADE;

--
-- Constraints for table `perbaikan_inventaris`
--
ALTER TABLE `perbaikan_inventaris`
  ADD CONSTRAINT `perbaikan_inventaris_ibfk_1` FOREIGN KEY (`no_permintaan`) REFERENCES `permintaan_perbaikan_inventaris` (`no_permintaan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perbaikan_inventaris_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `periksa_lab`
--
ALTER TABLE `periksa_lab`
  ADD CONSTRAINT `periksa_lab_ibfk_10` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_lab_ibfk_11` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_lab_ibfk_12` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_lab_ibfk_13` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_lab_ibfk_9` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE;

--
-- Constraints for table `periksa_radiologi`
--
ALTER TABLE `periksa_radiologi`
  ADD CONSTRAINT `periksa_radiologi_ibfk_4` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_radiologi_ibfk_5` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_radiologi_ibfk_6` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_radiologi` (`kd_jenis_prw`) ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_radiologi_ibfk_7` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_radiologi_ibfk_8` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON UPDATE CASCADE;

--
-- Constraints for table `permintaan_detail_permintaan_lab`
--
ALTER TABLE `permintaan_detail_permintaan_lab`
  ADD CONSTRAINT `permintaan_detail_permintaan_lab_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_detail_permintaan_lab_ibfk_3` FOREIGN KEY (`id_template`) REFERENCES `template_laboratorium` (`id_template`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_detail_permintaan_lab_ibfk_4` FOREIGN KEY (`noorder`) REFERENCES `permintaan_lab` (`noorder`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permintaan_lab`
--
ALTER TABLE `permintaan_lab`
  ADD CONSTRAINT `permintaan_lab_ibfk_2` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_lab_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permintaan_pemeriksaan_lab`
--
ALTER TABLE `permintaan_pemeriksaan_lab`
  ADD CONSTRAINT `permintaan_pemeriksaan_lab_ibfk_1` FOREIGN KEY (`noorder`) REFERENCES `permintaan_lab` (`noorder`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_pemeriksaan_lab_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permintaan_pemeriksaan_radiologi`
--
ALTER TABLE `permintaan_pemeriksaan_radiologi`
  ADD CONSTRAINT `permintaan_pemeriksaan_radiologi_ibfk_1` FOREIGN KEY (`noorder`) REFERENCES `permintaan_radiologi` (`noorder`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_pemeriksaan_radiologi_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_radiologi` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permintaan_perbaikan_inventaris`
--
ALTER TABLE `permintaan_perbaikan_inventaris`
  ADD CONSTRAINT `permintaan_perbaikan_inventaris_ibfk_1` FOREIGN KEY (`no_inventaris`) REFERENCES `inventaris` (`no_inventaris`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_perbaikan_inventaris_ibfk_2` FOREIGN KEY (`nik`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permintaan_radiologi`
--
ALTER TABLE `permintaan_radiologi`
  ADD CONSTRAINT `permintaan_radiologi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_radiologi_ibfk_3` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personal_pasien`
--
ALTER TABLE `personal_pasien`
  ADD CONSTRAINT `personal_pasien_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `petugas_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON UPDATE CASCADE,
  ADD CONSTRAINT `petugas_ibfk_5` FOREIGN KEY (`kd_jbtn`) REFERENCES `jabatan` (`kd_jbtn`) ON UPDATE CASCADE;

--
-- Constraints for table `prosedur_pasien`
--
ALTER TABLE `prosedur_pasien`
  ADD CONSTRAINT `prosedur_pasien_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prosedur_pasien_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `icd9` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rawat_inap_dr`
--
ALTER TABLE `rawat_inap_dr`
  ADD CONSTRAINT `rawat_inap_dr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_dr_ibfk_6` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_dr_ibfk_7` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE;

--
-- Constraints for table `rawat_inap_drpr`
--
ALTER TABLE `rawat_inap_drpr`
  ADD CONSTRAINT `rawat_inap_drpr_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_drpr_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_drpr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_drpr_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON UPDATE CASCADE;

--
-- Constraints for table `rawat_inap_pr`
--
ALTER TABLE `rawat_inap_pr`
  ADD CONSTRAINT `rawat_inap_pr_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_pr_ibfk_6` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_pr_ibfk_7` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE;

--
-- Constraints for table `rawat_jl_dr`
--
ALTER TABLE `rawat_jl_dr`
  ADD CONSTRAINT `rawat_jl_dr_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_dr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_dr_ibfk_5` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE;

--
-- Constraints for table `rawat_jl_drpr`
--
ALTER TABLE `rawat_jl_drpr`
  ADD CONSTRAINT `rawat_jl_drpr_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_drpr_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_drpr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_drpr_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON UPDATE CASCADE;

--
-- Constraints for table `rawat_jl_pr`
--
ALTER TABLE `rawat_jl_pr`
  ADD CONSTRAINT `rawat_jl_pr_ibfk_10` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_pr_ibfk_8` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_pr_ibfk_9` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON UPDATE CASCADE;

--
-- Constraints for table `reg_periksa`
--
ALTER TABLE `reg_periksa`
  ADD CONSTRAINT `reg_periksa_ibfk_3` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reg_periksa_ibfk_4` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reg_periksa_ibfk_6` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reg_periksa_ibfk_7` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON UPDATE CASCADE;

--
-- Constraints for table `rekap_presensi`
--
ALTER TABLE `rekap_presensi`
  ADD CONSTRAINT `rekap_presensi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `resep_dokter`
--
ALTER TABLE `resep_dokter`
  ADD CONSTRAINT `resep_dokter_ibfk_1` FOREIGN KEY (`no_resep`) REFERENCES `resep_obat` (`no_resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_dokter_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resep_dokter_racikan`
--
ALTER TABLE `resep_dokter_racikan`
  ADD CONSTRAINT `resep_dokter_racikan_ibfk_1` FOREIGN KEY (`no_resep`) REFERENCES `resep_obat` (`no_resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_dokter_racikan_ibfk_2` FOREIGN KEY (`kd_racik`) REFERENCES `metode_racik` (`kd_racik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resep_dokter_racikan_detail`
--
ALTER TABLE `resep_dokter_racikan_detail`
  ADD CONSTRAINT `resep_dokter_racikan_detail_ibfk_1` FOREIGN KEY (`no_resep`) REFERENCES `resep_obat` (`no_resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_dokter_racikan_detail_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD CONSTRAINT `resep_obat_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_obat_ibfk_4` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resep_pulang`
--
ALTER TABLE `resep_pulang`
  ADD CONSTRAINT `resep_pulang_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_pulang_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_pulang_ibfk_4` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resume_pasien`
--
ALTER TABLE `resume_pasien`
  ADD CONSTRAINT `resume_pasien_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resume_pasien_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resume_pasien_ranap`
--
ALTER TABLE `resume_pasien_ranap`
  ADD CONSTRAINT `resume_pasien_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resume_pasien_ranap_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat_barang_medis`
--
ALTER TABLE `riwayat_barang_medis`
  ADD CONSTRAINT `riwayat_barang_medis_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayat_barang_medis_ibfk_2` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skdp_bpjs`
--
ALTER TABLE `skdp_bpjs`
  ADD CONSTRAINT `skdp_bpjs_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON UPDATE CASCADE,
  ADD CONSTRAINT `skdp_bpjs_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tambahan_biaya`
--
ALTER TABLE `tambahan_biaya`
  ADD CONSTRAINT `tambahan_biaya_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE;

--
-- Constraints for table `template_laboratorium`
--
ALTER TABLE `template_laboratorium`
  ADD CONSTRAINT `template_laboratorium_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temporary_presensi`
--
ALTER TABLE `temporary_presensi`
  ADD CONSTRAINT `temporary_presensi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `utd_donor`
--
ALTER TABLE `utd_donor`
  ADD CONSTRAINT `utd_donor_ibfk_1` FOREIGN KEY (`petugas_aftap`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utd_donor_ibfk_2` FOREIGN KEY (`petugas_u_saring`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utd_donor_ibfk_3` FOREIGN KEY (`no_pendonor`) REFERENCES `utd_pendonor` (`no_pendonor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `utd_pendonor`
--
ALTER TABLE `utd_pendonor`
  ADD CONSTRAINT `utd_pendonor_ibfk_1` FOREIGN KEY (`kd_kec`) REFERENCES `kecamatan` (`kd_kec`) ON UPDATE CASCADE,
  ADD CONSTRAINT `utd_pendonor_ibfk_2` FOREIGN KEY (`kd_kab`) REFERENCES `kabupaten` (`kd_kab`) ON UPDATE CASCADE,
  ADD CONSTRAINT `utd_pendonor_ibfk_3` FOREIGN KEY (`kd_prop`) REFERENCES `propinsi` (`kd_prop`) ON UPDATE CASCADE;

--
-- Constraints for table `utd_stok_darah`
--
ALTER TABLE `utd_stok_darah`
  ADD CONSTRAINT `utd_stok_darah_ibfk_1` FOREIGN KEY (`kode_komponen`) REFERENCES `utd_komponen_darah` (`kode`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
