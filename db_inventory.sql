-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 25, 2024 at 07:57 AM
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
-- Database: `db_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_10_14_080715_create_table_barang', 1),
(7, '2024_10_17_035856_create_tb_barang_masuk', 1),
(8, '2024_10_20_071933_create_tb_stok_barang', 1),
(9, '2024_10_22_133434_create_tb_transaksi_penjualan', 1),
(10, '2024_10_26_042108_change_tb_stok_barang_id', 1),
(11, '2024_11_01_125025_create_tb_barang_keluar', 1),
(12, '2024_11_05_204345_change_atribute_transaksi', 1),
(13, '2024_11_18_163349_change_table_stok_barang', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_barang` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `tipe_barang`, `harga_barang`, `created_at`, `updated_at`) VALUES
('9d9220dc-daf9-4023-8cd4-8b9e2c298f1c', 'Mesin Universal Fritter', 'MKS-UV44', '2090000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-ddec-4b98-a36e-61b37b329f23', 'Mesin Cup Sealer', 'CPS-10A', '4980000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-def1-4135-90b3-280924e35a9f', 'Mesin Cetak Mie', 'MKS-140', '1780000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-dfcb-4d31-b71a-ad09a1aba6d4', 'Mesin Pencabut Rumput', 'AGR-PR238', '4420000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-e103-4d86-afdc-1d40aacf116b', 'Mesin Dough Mixer', 'MKS-DMIX002', '2650000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-e1f5-45c9-9958-a48eafeaf385', 'Mesin Cetak Mie', 'MKS-180SS', '4370000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-e2cf-44f1-bfac-c122d4f3f840', 'Mesin Food Dehidrator', 'ARD-PM99', '820000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-e3a2-4abd-88d2-740dbbf588a3', 'Mesin Cetak Pelet', 'MKS-PLT25', '6490000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-e475-4185-ad0a-2cf6f17b805b', 'Alat Sauce Pan/Ssauce Dispenser', 'MKS-SU-01', '1490000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-e548-4392-87f7-35091983bae5', 'Mesin Cetak Mie', 'MCM-150', '330000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-e61c-442d-9e4a-37ad0190761c', 'Mesin Coffe Espresso', 'MKS-MKP60', '10930000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-e743-4efa-93c6-e095bfdc0da2', 'Alat Giling Daging manual', 'MKS-SG10', '1450000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-e874-4a80-9093-e5dcfd3350a2', 'Mesin cetak Mie Manual', 'MKS-150B', '1010000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-e96c-435b-8ea7-465e149527b8', 'Mesin Cetak Mie', 'MKS-200', '3090000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-ea59-4e38-9ce4-a836651374df', 'Alat Pemotong Kerupuk Lontong manual', 'AGR-LTG22', '2430000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-eb3c-4a7c-b1c3-7c1461e5fba6', 'Mesin Waffle Maker', 'MKS-WF48', '7610000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-ec20-44c2-8409-9747ba09702b', 'Mesin Electric Kettle', 'KTL-DBL2', '330000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-ed13-490e-aeb4-4a0d1051eab4', 'Mesin electric Kettle', 'ARD-KT12', '540000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-ee59-4d79-888a-755876775a91', 'Mesin Coffe Grinder', 'MKS-GRD60A', '5610000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-ef3a-49ed-b03c-4520c4fdd309', 'Mesin Coffe Bean Grinder', 'MKS-CG50', '180000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-f00b-4cd6-9aa3-f3f71b8ecba5', 'Mesin Pemipil Jagung', 'PPJ-001', '1880000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-f0db-450a-867b-0485403c0b17', 'Alat Cetak Mie dan Pasta', 'CM-2020', '190000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-f1ac-4899-9060-21e1627dff87', 'Mesin Giling Daging', 'MHW-120', '4180000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-f27d-433b-8898-f6f54a68c7b1', 'Mesin Pemanggang', 'MKS-111BBQ', '1010000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-f352-4ea9-83ab-19484256daa3', 'Mesin Big Smoker', 'MKS-BLS002', '1900000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-f485-465d-a78c-1502d297e04b', 'Mesin Tetas Telur', 'AGR-TT32', '2170000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-f5be-4410-a635-cd5de75f8719', 'Mesin Cetak Mie', 'MKS-160SS', '4370000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-f6d2-42a9-82c6-37e2dbb4742a', 'Mesin Stik Wafel', 'MKS-HDW5', '2050000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-f7ca-460f-94ed-c8bf4f7ee59e', 'Mesin Pemanggang', 'MKS-369BBQ', '1130000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-f8ab-4e8e-8187-16b00589c725', 'Mesin Pemanggang', 'MKS-222BBQ', '1440000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-f984-476b-9a30-d885f5c130ea', 'Mesin Mixer Planetary', 'MKS-B5A', '6980000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-fa7e-4970-a3c3-2a156349eda8', 'Foot Sealer', 'FRP-600', '1300000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-fb6f-44a0-9ae0-38bddc8e991b', 'Foot Sealer', 'FRP-400', '1110000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-fc4f-4a1f-8b14-b260dad5114b', 'Mesin egg Roll', 'MKS-ERG001', '2070000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-fd2e-4b65-be4c-008796205b7d', 'Mesin Dough Devider', 'MKS-BA80', '19240000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-fe18-4449-83db-415f5e4ebceb', 'Mesin Pemipil Jagung', 'AGR-CORN9', '390000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dc-ff30-4704-92c9-8ef3ccd604ee', 'Mesin Gas Deep Fryer', 'MKS-G75', '6780000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-004e-4060-90ce-ea6df57c756d', 'Mesin Gas Deep Fryer', 'MKS-G20L', '4500000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0195-4892-a68f-6a4afd9b1eb4', 'Mesin Gas Deep Fryer', 'MKS-72', '2810000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-02a9-4d69-a660-6935be042bf2', 'Mesin Ice Cream', 'ISC-16', '15470000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-038c-44e9-8c4e-41dad621cb7f', 'Mesin Tortiila', 'MKS-TRT11', '7230000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0468-4265-abe9-e29bf3d1c991', 'Mesin Dough Devider', 'MKS-DD15M', '1130000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0546-47e9-93c2-7caee6414161', 'Alat Churros', 'MKS-CRS05', '6880000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0623-4003-ad73-5ab26cbc93f2', 'Mesin Hand Sealer', 'FS-1000', '1640000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0706-464a-af60-eed8529201b0', 'Mesin Continious Band Sealer', 'SF-150W', '6180000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0876-49db-bdf4-e7c6d9ac44df', 'Mesin Pemotong Tulang Manual', 'MKS-PTT38', '6520000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0964-4453-a330-ad5f3eafc6c3', 'Mesin Continious Band Sealer', 'FR-900W', '4980000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0a44-49c6-8918-0b71ee33306a', 'Alat Peras Jeruk Manual', 'MKS-MJ1001', '670000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0b21-4d65-a4fe-9c37054e159f', 'Meat Slicer Pengiris Daging', 'MKS-70', '1850000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0c00-4a50-8d6b-be9fd29f77ca', 'Ice Crusher', 'MKS-002', '970000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0cde-4feb-8cd5-9ae90c303aa9', 'Miller', 'MKS-ML200', '1330000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0dbb-43c8-92dc-ff84f0a31032', 'Mesin Takoyaki Gas', 'MKS-711B', '1370000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0eec-436d-b1c0-668b03503ec1', 'Mini Coffe Roster', 'CRG-400', '3100000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-0fd2-4c8b-83a7-fef7afd7b815', 'Cup Sealer', 'CPS-959', '1400000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-10b2-4f06-87dc-9f8a619656bb', 'Ice Crusher', 'MKS-CRS30', '1550000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-1192-45ac-843a-0d9018adb83c', 'Mesin Stand Mixer', 'ARD-MR7', '6100000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-1273-40ee-b512-25fbd26b4374', 'Mesin Cetak Mie', 'MKS-145', '2010000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-1353-40d9-847f-73ab8adc3bc4', 'Mesin Mixer Spiral', 'MKS-SP50', '16860000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-1446-4fa5-8f23-cff12b3f9368', 'Oven Roti Gas 1 Loyang', 'MKS-RS11', '8280000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-1590-4978-b8c1-3f8b4ccb7f4e', 'Penetas Telur', 'AGR-INC24', '3500000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-16bf-45c7-8a2b-119b5a28bdcd', 'Penetas Telur', 'AGR-TT7', '540000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-17de-4a7a-8372-094701bc2145', 'Penetas Telur', 'AGR-TT4', '480000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-1903-41df-b055-d9e00b3e9b4f', 'Mesin Soft Ice Cream', 'MKS-ICM-119', '15680000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-19f6-4527-8b47-d3c4b746a388', 'Mesin Dough Mixer', 'MKS-DG15', '8070000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-1adf-48f4-b3fe-7244876ad99b', 'Mesin Cetak Mie', 'MKS-350', '7740000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-1cbd-4b25-8773-aed842a60f57', 'Mesin Serutan Es Salju', 'MKS-ICE28', '5680000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-1e41-417e-b3c0-5e8783707ae1', 'Mesin Perajang Keripik', 'MKS-CT100 A', '8960000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-1f63-45a2-b0cc-c21be551325d', 'Pengupas Nanas Industri', 'MKS-PN60', '5600000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2054-447b-8f1c-471664925e36', 'Mesin Mixer Planetary', 'MKS-10B', '8110000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2144-4008-b6a7-113f3ed6967b', 'Mesin Mixer Planetary', 'MKS-BK20M', '10310000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-22a2-4dee-80ba-9c13432a3366', 'Oven Listrik', 'ARD-EO33', '1380000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-239a-4e1c-84b7-0745bb219a77', 'Bread Maker', 'ARD-BM55X', '1850000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2472-4490-801a-aec36527870b', 'Ice Crusher', 'MKS-CRS30L', '1530000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-254d-49f4-ad01-f93ab55eac14', 'Timbangan Digital', 'TBG-3', '200000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2627-4977-8263-f31ded0e22ca', 'Timbangan Digital', 'TBG-1', '110000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2705-4f5c-85fc-c8828725c5eb', 'Timbangan Digital', 'TBG-5', '200000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-27e5-45a9-b271-5e13fc9928d8', 'Timbangan Digital', 'TBG-10', '170000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2991-483c-8a70-d8716cbe0d4b', 'Cetak Sosis Telur Listrik', 'ARD-404', '300000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2a90-4808-91bf-440c9d0e5839', 'Cetak Sosis Telur Listrik', 'ARD-202', '170000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2bc9-433f-81ce-43e673eccb3d', 'Cetak Sosis Telur Listrik', 'ARD-303', '180000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2cb7-4750-8d4a-75576b9efc83', 'Cetak Sosis Telur Listrik', 'ARD-505', '490000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2d9a-4aa8-b633-3b52b76eb9ba', 'Cetak Sosis Telur Listrik', 'GRILLO-400', '1090000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2ed2-4e3a-bddb-c8f2a2f65f9d', 'Blender', 'MKS-BLD 1,5L', '470000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-2fd7-45ed-8b50-e95bfb73fe25', 'Pemanas Air', 'BT-119', '170000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-30b4-47cb-8c1f-cfc2430e8df7', 'Peras Jeruk', 'ARD-J22', '240000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-3192-4035-9a50-cf7331d1fdcc', 'Ice Krim Buah', 'ICE-01', '540000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-3270-45e4-8253-faba49a4d1af', 'Long Potato', 'MKS-LPCT50', '1590000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-3353-4c3c-bdc6-0b70d909934a', 'Giling Daging', 'MHW-G31B', '960000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-3435-4841-8e62-6f718bf13f27', 'Giling Daging', 'MHW-G51B', '1110000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-3540-4eda-b8cf-8b4930d3897c', 'Mangkok', 'ICE BARREL', '390000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-3693-4e21-b7b3-b2fddf8da455', 'Display Warmer', 'MKS-DW66', '5450000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-37bb-44fc-9c37-36724c2662d5', 'Lafira', 'LAFIRA', '7410000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-38cd-469f-a05c-e26ab0933197', 'Pemotong keripik tempe', 'MKS-JT04', '460000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-39b9-4946-90d1-af532c516a30', 'Mesin Gelas Kesehatan', 'ARD-CP5', '550000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-3a96-4275-b7c5-a5ace817c0a7', 'Ice Crusher', 'MKS-CRS20', '1100000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-3b8c-47f7-851c-24ac50d8bea4', 'Chopper', 'ARD-FC300', '690000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-3d41-4d6c-bd7b-a94a8cb1ebba', 'Chopper', 'ARD-FC200', '500000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-3e70-453f-a7cb-13020ad6f880', 'Pemanggang', 'ARD-GRL77', '710000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-3f64-4af1-95f7-6bdaa0438c63', 'Kentang Spiral', 'TP-200', '530000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-4042-40af-9e26-416e17edba7a', 'Alat Pengiris Kentang Spiral', 'MKS-PSS44', '150000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-4120-4159-832b-8e7454376ba4', 'Alat Pengiris Apel', 'MKS-APL88', '190000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-4236-4087-b6f7-ffc8eafd9397', 'Alat Cetak Long Potato', 'MKS-LPCT30', '790000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-440f-4a6a-a735-d84cedd28606', 'Alat Cetak Long Potato', 'MKS-MER2', '310000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-45c6-488b-af6f-37ca27cfbf1d', 'Alat Cetak Sate Telur Puyuh', 'ARD-TKY16', '230000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-46b8-4b82-92ee-1d060a8748c9', 'Mesin penepung Herba, Farmasi dan biji', 'MKS-ML100', '790000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-4792-427a-b3fe-0386ef0609bd', 'Mesin Kopi Espresso', 'MKS-MKP50', '2450000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-486f-493a-8adc-1c774cc2eeb7', 'Mesin Grinder kopi', 'MKS-GRD80A', '3850000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-497e-4332-8ffd-2185b235eaa8', 'Mesin Penggiling Kopi', 'MKS-600B', '1250000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-4a5e-4702-a395-ac34706956eb', 'Mesin Deep Fryer Gas', 'MKS-71', '1540000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-4b37-4505-83d2-86b42c22edca', 'Mesin Pembuat Sosis Telur', 'MKS-ERG002', '2930000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-4c19-4bef-8e98-d57df778730d', 'Mesin Egg Roll', 'GRILLO-GS10', '2570000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-4cfa-4c43-b0ae-6b5e493d36d2', 'Mesin Egg Roll', 'GRILLO-GS6', '2120000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-4dd8-41f2-9f9f-851e2d3f1830', 'Mesin Egg Roll', 'MKS-ERG444', '1550000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-4eb8-4045-a906-7bf3ec936cee', 'Alat Manual Meat Slicer', 'MKS-MSl66', '850000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-5025-4faf-aa89-a85ad656f6f2', 'Mesin Cetakan Donat', 'MKS-DN60', '3160000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-51ae-4bbf-86c5-f8cf66b276a0', 'Mesin Hot Dog Wafel', 'MKS-HDW6', '2510000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-5363-41d1-ad3b-0f321d5e1a18', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', '2280000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-546a-4872-9c33-64f2349ca44d', 'Mesin Takoyaki Listrik', 'MKS-700E', '1480000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-5569-429c-b058-0d9c38b3b26d', 'Mesin Waffle Taiyako', 'MKS-ETYK3', '4750000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-56df-4ed1-91d3-64927836b8f0', 'Mesin Perajang Sayur dan Buah', 'MKS-VGT65', '880000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-57d0-4b3d-94a9-5a2f0d176f64', 'Mesin Slot Toaster', 'MKS-D06', '1680000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-58bb-4e89-b61e-82d4b150f7d5', 'Cetak Mie dan Pasta', 'ARD-NM4', '2000000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-59d1-4ac2-aacd-be662fa80c66', 'Mesin Hand Sealer', 'MSP-400A', '880000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-5ac2-4d8c-b41f-bdeb785a2ffc', 'Mesin Hand Sealer', 'MSP-300A', '700000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-5bb4-4cea-a8fe-da75e9b50cd6', 'Mesin Hand Sealer', 'MSP-200I', '370000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-5cfa-4567-b420-fd7335c17e54', 'Mesin Hand Sealer', 'MSP-200A', '490000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-5e35-4f34-884d-c4be9e270142', 'Mesin Hand Sealer', 'MSP-300i', '600000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-5f3a-4e15-b119-40aadf11cbb3', 'Mesin Vacum Sealer', 'MSP-DZ280A', '1410000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-602a-4918-a55e-e662c0315d95', 'Mesin Vacum Sealer', 'MSP-290E', '1430000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-6107-4fb4-aec2-6e011198ac23', 'Mesin Vacum Sealer', 'MSP-VS02', '1190000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-61dc-4f08-8c47-c80d971e7733', 'Mesin vakum food sealer', 'ARD-VC85', '310000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-62d8-41a8-a77a-4d122ca0dce0', 'Mesin vakum sealer', 'ARD-VS01', '1760000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-63de-4980-b10a-4cc9345341b6', 'Mesin Hand Printer', 'HP-351', '1620000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-64cd-46a5-815d-20011961a849', 'Alat Cetak Sosis Horizontal', 'MKS-3V', '2490000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-65b4-47ee-be87-717f389ecb34', 'Alat Cetak Sosis Vertikal', 'MKS-3H', '2270000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-669a-499b-a206-67929656fbd5', 'Mesin Pengupas Bawang Putih', 'AGR-BWG180', '2550000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-6781-4a35-b9d3-aeb9cbd0dc20', 'Mesin Giling Daging', 'MHW-80', '3820000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-6874-4c32-8a3c-ebb29db6544e', 'Mesin Giling Daging', 'MHW-220', '5720000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-69b2-4985-8787-af6ddf50c31f', 'Mesin Pemanggang', 'MKS-PG4', '2180000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-6ad5-4efb-97f6-3c7f23a5c0b4', 'Mesin Pemanggang', 'MKS-PG2', '1700000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-6c08-4d48-95bf-4832c5af8676', 'Mesin Egg Waffle Listrik', 'MKS-EW06', '1730000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-6d0f-4e53-bc48-6dffb23c0af7', 'Mesin Egg Waffle Gas', 'MKS-GW07', '1750000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-6e09-46c3-afd9-0a5fd7e6925d', 'Mesin Cone Bakar', 'MKS-CB1', '2080000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-6efd-4d90-bc99-60c7adebaf88', 'Mesin Universal Fritter', 'MKS-UV22', '1370000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-704d-48aa-b1db-e15fbf9255a3', 'Alat Perajang bawang manual', 'PRJ-BM', '510000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-715e-469b-88d2-f6ffc597b29f', 'Alat Perajang singkong manual', 'PRJ-M', '540000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-725c-4ee7-a7b5-9dbaa2a1a0c8', 'Mesin Pembuat Gulali', 'MKS-CT76', '4630000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-7347-4ab7-a8f7-04d3839f8796', 'Cup Sealer', 'CPS-919', '1400000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-7428-49d7-b028-69db7eebc69b', 'Cup Sealer', 'CPS-818', '1180000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-7506-48c6-9fe8-c4389bcebf21', 'Hand Sprayer (Semprotan)', 'SPR-16', '610000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-75e6-41b4-bac9-6fded11d7a7c', 'Mesin Pemanggang Grill', 'ARD-GRL88', '530000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-77cd-40f5-a320-bf551847950c', 'Mesin Cetak Mie', 'MKS-160', '2590000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-78b4-48f9-bfc3-dac5b2a3c2e4', 'Teko Listrik Stainless', 'ARD-KT11', '530000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-79ae-475c-95c4-21ad641cfd16', 'Mesin Water Boiler', 'MKS-D30', '2540000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-7b96-4748-b7e5-4fbf6d4ac96b', 'Dough Mixer', 'MKS-DIMX002', '3650000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-7c93-434d-a6d2-5ad4116b2dce', 'Mesin Cetak Mie', 'MKS-220SS', '3390000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-7d9d-4e8a-97c6-da13cb3f83a0', 'Mesin Penutup Botol Manual', 'MKS-BT31', '2740000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-7e8f-4245-b9ee-ed5c59d81afb', 'Hand Sealer', 'FS-600', '1290000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-7f80-4797-a460-27a2dd0ba65e', 'Mesin Cup Sealer', 'CPS-9A', '1710000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-806b-427c-87df-ce5e0d10fd7e', 'Mesin Sosis Telur (Listrik)', 'MKS-ERG005', '3140000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-8157-47e1-a046-99915d4c36b2', 'Mesin Ice Crusher', 'MKS-003', '1730000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-8245-41ef-a765-2da748bd358b', 'Mesin Sosis Telur (Gas)', 'MKS-ERG007', '3420000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-8392-4079-a9ed-04768ef09fb1', 'Mesin Tetas Telur', 'AGR-TT24', '2010000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-84b5-4e2f-9832-d82df67321c5', 'Mesin Tetas Telur', 'AGR-TT24A', '1970000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-85b3-4ac7-bac5-f9406b52fed0', 'Mesin Tetas Telur', 'AGR-TT96', '2350000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-86b1-41f9-af1e-e2204db5de82', 'Mesin Filling Cairan Otomatis', 'MSP-F50', '2180000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-87a4-4417-ac6d-1291ce3a3433', 'Rok Espresso', 'Rok Espresso', '3580000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-889e-474b-893c-cf303b92cda4', 'Mesin Standing Mixer', 'MKS-MIX130', '3340000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-89de-4c43-98bc-8fc8d3f88af3', 'Mesin Vacum Sealer', 'ARD-VS02', '1190000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-8b21-4bdc-989c-a3c00ac423c7', 'Mesin Hand Sealer', 'MSP-400I', '880000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-8c16-4cb5-a31e-7cdc50e43659', 'Mesin Cetak Pelet Manual', 'PLT-10', '2140000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-8d09-43a0-a7d5-7ba6d59224d8', 'Mesin Penepung Herbal, biji', 'MKS-ML300', '1870000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-8df4-4862-8717-bb6565501738', 'Mesin Grinder Kopi', 'GRD-80A', '3850000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-8ee4-4c63-abd0-a45271b20945', 'Mesin Kebab', 'MKS-KB01', '2600000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-8fd3-4028-bb94-3c18e2990171', 'Mesin Coklat Fountain', 'MKS-CC6', '6000000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-9122-4e6c-b4f2-30dcbf41f95f', 'Food Dryer', 'MKS-DR6', '2710000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-921f-4606-b924-dac162e889e8', 'Deep Fryer', 'MKS-82B', '2360000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-9315-42eb-8cec-87be183846bc', 'Alat Penanam Biji-Bijian', 'ARD-SED01', '730000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-941f-44f0-8339-fb84a35834c5', 'Alat Penanam Biji-Bijian', 'ARD-SED02', '830000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-9523-49ef-99e7-bc1d689b8eae', 'Mesin Bread Maker', 'ARD-BM66X', '2170000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-9626-4823-b598-1e72c4e3dad6', 'Mesin Tetas Telur', 'AGR-TT56', '2660000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-972c-4995-ad96-eb69a6fe23aa', 'Blender Komersial', 'MKS-BL10L', '3250000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-982d-4ab2-a9fb-38b78b31526b', 'Bread Toaster', 'MKS-D04', '1300000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-9926-4544-ab70-5f3a49741a36', 'Deep Fryer', 'MKS-51B', '1950000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-9a1e-42c7-b4fb-f4b7bb223de5', 'Deep Fryer', 'MKS-81', '800000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-9b1b-4a72-aa92-c4bcef9f5a3c', 'Deep Fryer', 'MKS-82', '1550000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-9c20-4934-8eab-9eddb267035b', 'Food Dryer', 'MKS-DR10', '4590000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-9d26-4ae3-9184-5d7acae4f82f', 'Deep Fryer', 'MKS-G20L +Keranjang', '4750000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-9e5f-41b3-a931-e5fc686652d2', 'Mesin Manual Meat Mixer', 'MKS-MM01', '2830000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-9f53-4366-a399-0f6b20909100', 'Mesin Ice Tube', 'MKS-IM22', '3270000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01'),
('9d9220dd-a04b-4c7f-8b04-d63a0f105dfb', 'Mesin Takoyaki Gas', 'MKS-722B', '2120000.00', '2024-11-25 04:37:01', '2024-11-25 04:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_keluar`
--

CREATE TABLE `tb_barang_keluar` (
  `id_barang_keluar` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_transaksi` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_barang` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date NOT NULL,
  `kode_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_konsumen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_handphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` int NOT NULL,
  `posisi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_masuk`
--

CREATE TABLE `tb_barang_masuk` (
  `id_brg_masuk` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `no_warehouse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asal_gudang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` int NOT NULL,
  `posisi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_konsumen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_stok_barang`
--

CREATE TABLE `tb_stok_barang` (
  `id_stok` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_masuk` int NOT NULL DEFAULT '0',
  `barang_keluar` int NOT NULL DEFAULT '0',
  `stok_awal` int NOT NULL DEFAULT '0',
  `stok_akhir` int NOT NULL DEFAULT '0',
  `posisi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_penjualan`
--

CREATE TABLE `tb_transaksi_penjualan` (
  `id_transaksi` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_stok` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_transaksi` date NOT NULL,
  `kode_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_konsumen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_handphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_sales` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_barang` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` int NOT NULL,
  `harga_barang` decimal(10,2) NOT NULL,
  `posisi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pembayaran` enum('belum lunas','lunas') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'belum lunas',
  `status_transaksi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dana_pertama` decimal(10,2) NOT NULL,
  `pembayaran` decimal(10,2) NOT NULL,
  `diskon` int NOT NULL,
  `total_pembayaran` decimal(10,2) NOT NULL,
  `selisih_pembayaran` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
('9d921f45-a551-4fdd-9b36-f51b4371f2fa', 'admin', 'admin@gmail.com', '2024-11-25 04:32:34', '$2y$12$sHOkkqWGGbZ9q5GPrhAopucZ92x481TAPTG4e334rxVfVWCs6R/.y', 'admin', NULL, 'gAf7WJJMir', '2024-11-25 04:32:34', '2024-11-25 04:32:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_barang_keluar`
--
ALTER TABLE `tb_barang_keluar`
  ADD PRIMARY KEY (`id_barang_keluar`),
  ADD KEY `tb_barang_keluar_id_transaksi_foreign` (`id_transaksi`),
  ADD KEY `tb_barang_keluar_id_barang_foreign` (`id_barang`);

--
-- Indexes for table `tb_barang_masuk`
--
ALTER TABLE `tb_barang_masuk`
  ADD PRIMARY KEY (`id_brg_masuk`),
  ADD KEY `tb_barang_masuk_id_barang_foreign` (`id_barang`);

--
-- Indexes for table `tb_stok_barang`
--
ALTER TABLE `tb_stok_barang`
  ADD PRIMARY KEY (`id_stok`),
  ADD KEY `tb_stok_barang_id_barang_foreign` (`id_barang`);

--
-- Indexes for table `tb_transaksi_penjualan`
--
ALTER TABLE `tb_transaksi_penjualan`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `tb_transaksi_penjualan_id_barang_foreign` (`id_barang`),
  ADD KEY `tb_transaksi_penjualan_id_stok_foreign` (`id_stok`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang_keluar`
--
ALTER TABLE `tb_barang_keluar`
  ADD CONSTRAINT `tb_barang_keluar_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_barang_keluar_id_transaksi_foreign` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_transaksi_penjualan` (`id_transaksi`) ON DELETE CASCADE;

--
-- Constraints for table `tb_barang_masuk`
--
ALTER TABLE `tb_barang_masuk`
  ADD CONSTRAINT `tb_barang_masuk_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE;

--
-- Constraints for table `tb_stok_barang`
--
ALTER TABLE `tb_stok_barang`
  ADD CONSTRAINT `tb_stok_barang_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE;

--
-- Constraints for table `tb_transaksi_penjualan`
--
ALTER TABLE `tb_transaksi_penjualan`
  ADD CONSTRAINT `tb_transaksi_penjualan_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_transaksi_penjualan_id_stok_foreign` FOREIGN KEY (`id_stok`) REFERENCES `tb_stok_barang` (`id_stok`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
