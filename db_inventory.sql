-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 30, 2024 at 03:30 PM
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
(13, '2024_11_18_163349_change_table_stok_barang', 1),
(14, '2024_11_30_145124_create_tb_top_product', 1);

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
('9d9ccbf2-ab35-40f1-93c6-44133844ab59', 'Mesin Universal Fritter', 'MKS-UV44', '2090000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-acfb-4bc8-b76a-b8399a549b4d', 'Mesin Cup Sealer', 'CPS-10A', '4980000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ad8b-4563-8434-8a665e9b5ce5', 'Mesin Cetak Mie', 'MKS-140', '1780000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ae08-47f7-9d3e-5887d7450f5a', 'Mesin Pencabut Rumput', 'AGR-PR238', '4420000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ae98-4d92-b37b-480dc18c571f', 'Mesin Dough Mixer', 'MKS-DMIX002', '2650000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-af16-4505-9ac8-0e4e5c396c9b', 'Mesin Cetak Mie', 'MKS-180SS', '4370000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-af91-4844-8563-195d0b59cdd2', 'Mesin Food Dehidrator', 'ARD-PM99', '820000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b00a-4ab4-8475-575fe342dec4', 'Mesin Cetak Pelet', 'MKS-PLT25', '6490000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b083-4143-a3bc-302726efaac2', 'Alat Sauce Pan/Ssauce Dispenser', 'MKS-SU-01', '1490000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b0fc-44f4-a488-077c624e0e7b', 'Mesin Cetak Mie', 'MCM-150', '330000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b176-45a0-b74f-3c48d233681d', 'Mesin Coffe Espresso', 'MKS-MKP60', '10930000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b1ef-4192-91b6-baff1d8644bb', 'Alat Giling Daging manual', 'MKS-SG10', '1450000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b26d-4c3b-9bae-b77b779fb19c', 'Mesin cetak Mie Manual', 'MKS-150B', '1010000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b2ed-4826-b8eb-0de89cd109b2', 'Mesin Cetak Mie', 'MKS-200', '3090000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b37e-4a1a-a9a7-edd68b14e1b0', 'Alat Pemotong Kerupuk Lontong manual', 'AGR-LTG22', '2430000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b400-4bca-b162-12b37d1e610e', 'Mesin Waffle Maker', 'MKS-WF48', '7610000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b479-4de8-a49c-707b3d4783be', 'Mesin Electric Kettle', 'KTL-DBL2', '330000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b4fe-4f1f-a765-1b4e35ba874b', 'Mesin electric Kettle', 'ARD-KT12', '540000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b580-4e05-a036-0e47ec618fff', 'Mesin Coffe Grinder', 'MKS-GRD60A', '5610000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b5fa-420a-8560-63e97ea20e95', 'Mesin Coffe Bean Grinder', 'MKS-CG50', '180000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b672-4d24-9119-18f559ccb9f5', 'Mesin Pemipil Jagung', 'PPJ-001', '1880000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b6eb-4088-b31b-c6a4c727fc91', 'Alat Cetak Mie dan Pasta', 'CM-2020', '190000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b764-4d37-b7b1-a775668239ef', 'Mesin Giling Daging', 'MHW-120', '4180000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b7dd-439e-8df2-303e6079728e', 'Mesin Pemanggang', 'MKS-111BBQ', '1010000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b857-4740-b08f-9681c2bc309b', 'Mesin Big Smoker', 'MKS-BLS002', '1900000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b8ce-4e84-9297-18be9f2f29b9', 'Mesin Tetas Telur', 'AGR-TT32', '2170000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b958-4525-a754-b18ade542685', 'Mesin Cetak Mie', 'MKS-160SS', '4370000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-b9dc-4390-8432-9ca2b42d1a6f', 'Mesin Stik Wafel', 'MKS-HDW5', '2050000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ba58-4fa4-b452-f0ff85b1424d', 'Mesin Pemanggang', 'MKS-369BBQ', '1130000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-bad1-407d-ae95-3142f8bb72f0', 'Mesin Pemanggang', 'MKS-222BBQ', '1440000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-bb4e-4aee-a3b6-0a5de3d463dc', 'Mesin Mixer Planetary', 'MKS-B5A', '6980000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-bbe9-46d5-a580-ec68ae66d179', 'Foot Sealer', 'FRP-600', '1300000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-bc6d-40cd-b70e-3939e6347e3e', 'Foot Sealer', 'FRP-400', '1110000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-bce6-4258-9103-6b0fecad3e21', 'Mesin egg Roll', 'MKS-ERG001', '2070000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-bd5f-42c0-89c0-1333d4c58444', 'Mesin Dough Devider', 'MKS-BA80', '19240000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-bdd8-4aab-b7aa-6ec02142d535', 'Mesin Pemipil Jagung', 'AGR-CORN9', '390000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-be50-45f5-959a-f2454bea4961', 'Mesin Gas Deep Fryer', 'MKS-G75', '6780000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-beca-4e88-a696-e1ffc4efa876', 'Mesin Gas Deep Fryer', 'MKS-G20L', '4500000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-bf42-43de-b0a8-e06d9346a421', 'Mesin Gas Deep Fryer', 'MKS-72', '2810000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-bfca-41d6-ac2d-4ba69962b15a', 'Mesin Ice Cream', 'ISC-16', '15470000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c045-454c-ad2d-849295b83bba', 'Mesin Tortiila', 'MKS-TRT11', '7230000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c0bf-4fec-bd05-06794e24ae01', 'Mesin Dough Devider', 'MKS-DD15M', '1130000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c13a-48bb-9f5e-4ef11b901168', 'Alat Churros', 'MKS-CRS05', '6880000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c1b4-4554-b214-15d057884bd0', 'Mesin Hand Sealer', 'FS-1000', '1640000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c25d-433d-a792-ec36dc165310', 'Mesin Continious Band Sealer', 'SF-150W', '6180000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c2e6-48a2-8bf8-d575fb743a29', 'Mesin Pemotong Tulang Manual', 'MKS-PTT38', '6520000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c35f-4ed9-997e-b17f19dfa255', 'Mesin Continious Band Sealer', 'FR-900W', '4980000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c3d8-4903-a35a-c67e61d92606', 'Alat Peras Jeruk Manual', 'MKS-MJ1001', '670000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c451-45a8-a864-01c51860ea10', 'Meat Slicer Pengiris Daging', 'MKS-70', '1850000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c4c9-4d02-b372-577862df6bef', 'Ice Crusher', 'MKS-002', '970000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c542-45bb-b80a-a8eb00fc5b66', 'Miller', 'MKS-ML200', '1330000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c5d6-405b-995f-a02fe01eead7', 'Mesin Takoyaki Gas', 'MKS-711B', '1370000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c67b-44f9-8edb-9c2e5404d5be', 'Mini Coffe Roster', 'CRG-400', '3100000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c6f8-4624-b50b-0bee12e88251', 'Cup Sealer', 'CPS-959', '1400000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c771-463c-bb94-0fb7472ef76c', 'Ice Crusher', 'MKS-CRS30', '1550000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c7e9-4d6d-a7f7-29192f288d3f', 'Mesin Stand Mixer', 'ARD-MR7', '6100000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c86a-4c26-8ad2-a897d0863fa0', 'Mesin Cetak Mie', 'MKS-145', '2010000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c8ee-4e8e-bb45-1c42bbeaeaa5', 'Mesin Mixer Spiral', 'MKS-SP50', '16860000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c96b-4185-a5a7-72fffeb774b6', 'Oven Roti Gas 1 Loyang', 'MKS-RS11', '8280000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-c9f0-498c-954b-d942a3dc37fc', 'Penetas Telur', 'AGR-INC24', '3500000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ca73-4bec-9c6f-9461613d6be6', 'Penetas Telur', 'AGR-TT7', '540000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-caf5-410e-830c-ec43f2026eb3', 'Penetas Telur', 'AGR-TT4', '480000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-cb76-492a-aed0-c798623fff26', 'Mesin Soft Ice Cream', 'MKS-ICM-119', '15680000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-cbfa-4b2b-8a9d-a7f4e699ad9f', 'Mesin Dough Mixer', 'MKS-DG15', '8070000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-cc82-4f52-8911-14c020d96700', 'Mesin Cetak Mie', 'MKS-350', '7740000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-cd05-4260-bec0-0d42a0f4f5b1', 'Mesin Serutan Es Salju', 'MKS-ICE28', '5680000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-cd87-4136-a0ed-6d926447dc47', 'Mesin Perajang Keripik', 'MKS-CT100 A', '8960000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ce08-4d69-97cc-6a1bf8dea371', 'Pengupas Nanas Industri', 'MKS-PN60', '5600000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ce88-4d60-bd05-f7af01d9f579', 'Mesin Mixer Planetary', 'MKS-10B', '8110000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-cf15-4d30-977a-d0e7f859f323', 'Mesin Mixer Planetary', 'MKS-BK20M', '10310000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-cf9c-4c7b-b48e-af5c1efd6a3c', 'Oven Listrik', 'ARD-EO33', '1380000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d01c-40a6-a545-6f45368763b7', 'Bread Maker', 'ARD-BM55X', '1850000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d09d-4d20-b64c-65ff1dfe0026', 'Ice Crusher', 'MKS-CRS30L', '1530000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d11c-4628-963f-ddd9a69da89b', 'Timbangan Digital', 'TBG-3', '200000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d19e-4875-afbf-ad819c914a1c', 'Timbangan Digital', 'TBG-1', '110000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d220-40fc-9881-d8f27626decd', 'Timbangan Digital', 'TBG-5', '200000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d2c6-4e4b-b950-6219acb848f9', 'Timbangan Digital', 'TBG-10', '170000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d35c-4db7-ae38-fe2fa7c299a4', 'Cetak Sosis Telur Listrik', 'ARD-404', '300000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d3e0-4c9e-887d-3a42d6c0542d', 'Cetak Sosis Telur Listrik', 'ARD-202', '170000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d465-4be8-b98b-3d322c686feb', 'Cetak Sosis Telur Listrik', 'ARD-303', '180000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d4ed-4b24-9db0-d19badda9842', 'Cetak Sosis Telur Listrik', 'ARD-505', '490000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d573-4740-9eb7-f9902668413e', 'Cetak Sosis Telur Listrik', 'GRILLO-400', '1090000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d60d-493b-bcb5-51cef7b0a78a', 'Blender', 'MKS-BLD 1,5L', '470000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d691-4e1a-b054-de4673c85e86', 'Pemanas Air', 'BT-119', '170000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d70a-49dd-aff5-12205d9d49e8', 'Peras Jeruk', 'ARD-J22', '240000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d783-476c-a084-5368e3de4037', 'Ice Krim Buah', 'ICE-01', '540000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d7fc-480f-9bab-65ca2d7b2912', 'Long Potato', 'MKS-LPCT50', '1590000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d87b-4dcf-a869-b13c97af3fa7', 'Giling Daging', 'MHW-G31B', '960000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d90c-4ccf-9dc2-bedb8eaa05fe', 'Giling Daging', 'MHW-G51B', '1110000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-d98f-4338-9965-21cf7314cb77', 'Mangkok', 'ICE BARREL', '390000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-da07-45bc-bbff-4cb83d8eef98', 'Display Warmer', 'MKS-DW66', '5450000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-da7f-41cb-95df-1e6b5a049c0b', 'Lafira', 'LAFIRA', '7410000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-daf9-4a99-a1da-1f7cd1c50501', 'Pemotong keripik tempe', 'MKS-JT04', '460000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-db73-4386-bad0-e6a6d81ac706', 'Mesin Gelas Kesehatan', 'ARD-CP5', '550000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-dbf5-4129-ad3a-3c3371d6021c', 'Ice Crusher', 'MKS-CRS20', '1100000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-dc90-4dd8-9e09-df71c69969a3', 'Chopper', 'ARD-FC300', '690000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-dd17-4cf6-99e3-1a0667dd0a50', 'Chopper', 'ARD-FC200', '500000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-dd92-461b-b5d7-570365d52347', 'Pemanggang', 'ARD-GRL77', '710000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-de0c-4e38-8d57-ed8519d7e975', 'Kentang Spiral', 'TP-200', '530000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-de85-4c49-9624-b66d400f8dc9', 'Alat Pengiris Kentang Spiral', 'MKS-PSS44', '150000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-df0a-450d-8c2b-87bc77c16494', 'Alat Pengiris Apel', 'MKS-APL88', '190000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-df88-497f-a6b7-5f21697eacdf', 'Alat Cetak Long Potato', 'MKS-LPCT30', '790000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e001-4c06-ac6f-5d1154fb5b13', 'Alat Cetak Long Potato', 'MKS-MER2', '310000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e07a-4191-8de8-8d07bd78c9e9', 'Alat Cetak Sate Telur Puyuh', 'ARD-TKY16', '230000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e0f3-46d1-a1fd-8259a3fc1cb1', 'Mesin penepung Herba, Farmasi dan biji', 'MKS-ML100', '790000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e16c-4fb2-8072-e1a132526e9b', 'Mesin Kopi Espresso', 'MKS-MKP50', '2450000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e1e5-4e9c-9950-0a914828466b', 'Mesin Grinder kopi', 'MKS-GRD80A', '3850000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e25e-41f2-96ea-8236f0d8a928', 'Mesin Penggiling Kopi', 'MKS-600B', '1250000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e2ea-47bb-90a9-10a97b1c4f5a', 'Mesin Deep Fryer Gas', 'MKS-71', '1540000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e366-4734-9691-c6a58b865c2d', 'Mesin Pembuat Sosis Telur', 'MKS-ERG002', '2930000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e3e0-47d9-b62c-b34c957a92f9', 'Mesin Egg Roll', 'GRILLO-GS10', '2570000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e459-49e1-8c27-cc6e46c090de', 'Mesin Egg Roll', 'GRILLO-GS6', '2120000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e4d1-498c-b09d-fcf292fd556c', 'Mesin Egg Roll', 'MKS-ERG444', '1550000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e562-492a-b452-746fab5ea095', 'Alat Manual Meat Slicer', 'MKS-MSl66', '850000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e5df-4839-8e81-1aff6a4f5f09', 'Mesin Cetakan Donat', 'MKS-DN60', '3160000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e658-4fe7-bb9a-579663658678', 'Mesin Hot Dog Wafel', 'MKS-HDW6', '2510000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e70f-469e-a03a-656726303ce9', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', '2280000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e78e-4437-b96a-f2ad2cc7912e', 'Mesin Takoyaki Listrik', 'MKS-700E', '1480000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e808-4c24-a969-04a6b141dcd0', 'Mesin Waffle Taiyako', 'MKS-ETYK3', '4750000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e882-4a4e-8b08-356eeb738b50', 'Mesin Perajang Sayur dan Buah', 'MKS-VGT65', '880000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e903-431b-bb5b-21f472a33919', 'Mesin Slot Toaster', 'MKS-D06', '1680000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-e985-4ddb-a1e0-646a70643352', 'Cetak Mie dan Pasta', 'ARD-NM4', '2000000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ea00-48a1-8179-794dd19efbfe', 'Mesin Hand Sealer', 'MSP-400A', '880000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ea7a-4a79-a8d8-7e056365ebad', 'Mesin Hand Sealer', 'MSP-300A', '700000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-eaf8-440f-a657-ef230ccce99a', 'Mesin Hand Sealer', 'MSP-200I', '370000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-eb75-4c9f-ae08-b2a664c189b2', 'Mesin Hand Sealer', 'MSP-200A', '490000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ebef-45c1-b86f-c666a86b8f2e', 'Mesin Hand Sealer', 'MSP-300i', '600000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ec69-40fa-a5fa-f17ac56118d7', 'Mesin Vacum Sealer', 'MSP-DZ280A', '1410000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ece2-41e3-83ab-2021deb9b7bb', 'Mesin Vacum Sealer', 'MSP-290E', '1430000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ed5c-44fc-b2dd-db275d407ad8', 'Mesin Vacum Sealer', 'MSP-VS02', '1190000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-edd7-45ea-9bea-749aac068b73', 'Mesin vakum food sealer', 'ARD-VC85', '310000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ee50-4fa1-aaf8-3b46ad83463f', 'Mesin vakum sealer', 'ARD-VS01', '1760000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-eec9-4339-a6d4-19dc6ea27cad', 'Mesin Hand Printer', 'HP-351', '1620000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ef42-4b1e-8f81-0a5e81125438', 'Alat Cetak Sosis Horizontal', 'MKS-3V', '2490000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-efd0-49d2-9138-03040621bfa0', 'Alat Cetak Sosis Vertikal', 'MKS-3H', '2270000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f064-4fbb-8543-86926c0d867c', 'Mesin Pengupas Bawang Putih', 'AGR-BWG180', '2550000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f0e0-4618-9298-0442b9b07c7e', 'Mesin Giling Daging', 'MHW-80', '3820000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f16a-4f38-95b6-60b59b20b18c', 'Mesin Giling Daging', 'MHW-220', '5720000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f1ff-451d-94f6-76ca9347560b', 'Mesin Pemanggang', 'MKS-PG4', '2180000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f293-4eee-a6af-b3f89cefc85f', 'Mesin Pemanggang', 'MKS-PG2', '1700000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f328-4784-a1e8-ffd296bb7186', 'Mesin Egg Waffle Listrik', 'MKS-EW06', '1730000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f3bd-476e-b8f4-afebaa6c88ac', 'Mesin Egg Waffle Gas', 'MKS-GW07', '1750000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f450-4374-b95e-7c8835bf2377', 'Mesin Cone Bakar', 'MKS-CB1', '2080000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f4e1-4967-a91a-f42d06150134', 'Mesin Universal Fritter', 'MKS-UV22', '1370000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f569-45e9-9e6f-c98a8d4ffa5d', 'Alat Perajang bawang manual', 'PRJ-BM', '510000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f5ee-4033-b6ac-9e3c8d7abd45', 'Alat Perajang singkong manual', 'PRJ-M', '540000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f69c-4530-aaf0-970be10891dc', 'Mesin Pembuat Gulali', 'MKS-CT76', '4630000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f731-435b-920f-16b2ef40fa4b', 'Cup Sealer', 'CPS-919', '1400000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f7cb-4d88-8be6-c58c0c1be59e', 'Cup Sealer', 'CPS-818', '1180000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f852-4c5d-974e-a5f784b35504', 'Hand Sprayer (Semprotan)', 'SPR-16', '610000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f8de-41a3-bb4c-f072eb1c3376', 'Mesin Pemanggang Grill', 'ARD-GRL88', '530000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-f972-4659-bfd8-971e23b9027f', 'Mesin Cetak Mie', 'MKS-160', '2590000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-fa14-47fd-b32b-c760d193965b', 'Teko Listrik Stainless', 'ARD-KT11', '530000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-faa8-4a7e-b543-308955c33caf', 'Mesin Water Boiler', 'MKS-D30', '2540000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-fbac-4288-b850-09a969a8d8b3', 'Dough Mixer', 'MKS-DIMX002', '3650000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-fc2e-44fb-8d76-17df7fdd2af5', 'Mesin Cetak Mie', 'MKS-220SS', '3390000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-fcb4-4e26-9ee6-2041fd15dbc3', 'Mesin Penutup Botol Manual', 'MKS-BT31', '2740000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-fd39-4c47-9a01-6b34bf405609', 'Hand Sealer', 'FS-600', '1290000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-fdba-4122-a9e7-ee93a631cb08', 'Mesin Cup Sealer', 'CPS-9A', '1710000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-fe39-44c8-8ebb-84d26ccdbd83', 'Mesin Sosis Telur (Listrik)', 'MKS-ERG005', '3140000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-feb3-4f0f-a9dc-91d0094ae059', 'Mesin Ice Crusher', 'MKS-003', '1730000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ff2e-46ec-adf1-cfd4247c6a79', 'Mesin Sosis Telur (Gas)', 'MKS-ERG007', '3420000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf2-ffad-4fbd-a2b0-6bc9e0dbab62', 'Mesin Tetas Telur', 'AGR-TT24', '2010000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-003b-4168-a570-621b62bcbb5e', 'Mesin Tetas Telur', 'AGR-TT24A', '1970000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-00d5-49b0-b2a5-9d7d67a16832', 'Mesin Tetas Telur', 'AGR-TT96', '2350000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-016d-4592-b546-44a21a37d79a', 'Mesin Filling Cairan Otomatis', 'MSP-F50', '2180000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-01ff-4526-b743-590a986aed07', 'Rok Espresso', 'Rok Espresso', '3580000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-028f-4814-9557-bc32b9f02580', 'Mesin Standing Mixer', 'MKS-MIX130', '3340000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-032d-4731-a619-642451edbf11', 'Mesin Vacum Sealer', 'ARD-VS02', '1190000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-03e2-4950-bfcc-70b6fba20c7d', 'Mesin Hand Sealer', 'MSP-400I', '880000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0475-4fa4-8bd2-bdf04f782b65', 'Mesin Cetak Pelet Manual', 'PLT-10', '2140000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-04f8-44e2-b29e-4b898e3be881', 'Mesin Penepung Herbal, biji', 'MKS-ML300', '1870000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0573-4e23-b76b-fe601422a7c8', 'Mesin Grinder Kopi', 'GRD-80A', '3850000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-05ec-414f-9e59-7bb8bfaf8945', 'Mesin Kebab', 'MKS-KB01', '2600000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0666-4e6c-a848-eb522e3b601c', 'Mesin Coklat Fountain', 'MKS-CC6', '6000000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-06e0-4cad-9d48-2a7bf2307a54', 'Food Dryer', 'MKS-DR6', '2710000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-075b-4ed3-bdf4-b9a3d778b053', 'Deep Fryer', 'MKS-82B', '2360000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-07d6-4179-bff5-ff84d8841cd0', 'Alat Penanam Biji-Bijian', 'ARD-SED01', '730000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0872-4b11-90a5-c3feb23e7658', 'Alat Penanam Biji-Bijian', 'ARD-SED02', '830000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0900-4614-a2e1-d6818dba43a4', 'Mesin Bread Maker', 'ARD-BM66X', '2170000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0981-4232-ac94-7c213e4d17b9', 'Mesin Tetas Telur', 'AGR-TT56', '2660000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0a2a-4702-9bb5-1d9ddc98f71c', 'Blender Komersial', 'MKS-BL10L', '3250000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0ac6-4ca1-a750-a6c42e61a3dc', 'Bread Toaster', 'MKS-D04', '1300000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0b5b-4459-853a-194b573a78f0', 'Deep Fryer', 'MKS-51B', '1950000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0be9-485c-a005-683a07e4274b', 'Deep Fryer', 'MKS-81', '800000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0c6d-4496-a6db-431ef2d5747a', 'Deep Fryer', 'MKS-82', '1550000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0cee-4c40-b34f-eca5470224a0', 'Food Dryer', 'MKS-DR10', '4590000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0d70-40a8-ab3d-14266976f80c', 'Deep Fryer', 'MKS-G20L +Keranjang', '4750000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0df0-4903-a881-e092faf05d45', 'Mesin Manual Meat Mixer', 'MKS-MM01', '2830000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0e7c-4aba-b6d6-19d15debea84', 'Mesin Ice Tube', 'MKS-IM22', '3270000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0f07-4e0a-9c79-aba49b560e84', 'Mesin Takoyaki Gas', 'MKS-722B', '2120000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-0f89-49c6-85f2-543d31ca65b4', 'Pemasak', 'KTl-DBL2', '330000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-100e-4ded-9f98-4587ac1bbc00', 'Deep Fryer', 'MKS-G20L', '4500000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-10fb-4514-856c-c8cbea1a2f4f', 'Mesin Food Dehydrator', 'ARD-PM99', '820000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-11de-466b-b65e-fe834222475e', 'Mesin Giling Daging', 'MHW-G31B', '960000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-12c8-439b-8b57-177512582d08', 'Mesin Cetak Mie', 'MKS-150B', '1010000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1365-46e6-a4fe-85bab81a0c46', 'Cup Sealer', 'CPS-10A', '4980000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-13f5-4a5e-9ebc-ed307868fa52', 'Mesin Ice Crusher', 'MKS-CRS20', '1100000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1488-4e11-854d-4d2872892785', 'Penetas Telur', 'AGR-TT32', '2170000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1521-4be3-aff1-c380af0632f8', 'Mesin Sosis Telur (Listrik)', 'GRILLO-400', '1090000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-15ae-4e71-b3e7-12262b433af2', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS6', '2120000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-163d-4b1b-8977-fbbd2c84b36a', 'Mesin Sosis Telur (Gas)', 'MKS-ERG002', '2930000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-16f4-4059-8e17-713dceaf9bf0', 'Mesin Sosis Telur (Gas)', 'MKS-ERG444', '1550000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-17be-4084-9489-d49bd1a636f7', 'Mesin Ice Crusher', 'MKS-CRS30', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-185b-4849-ae4c-d307266b8382', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS10', '2570000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-18ec-4f3e-ba22-6af1b90906e9', 'Mesin Es Krim Buah', 'ICE-01', '540000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1979-4491-ab07-7d9d72820304', 'Mesin Giling Daging', 'MHW-G51B', '1110000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1a08-4d01-b87b-06bed5f21ff8', 'Mesin pencacah Bumbu Dapur', 'MKS-UV22', '1370000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1a9e-4650-81c2-0f4361013013', 'Mesin Penepung Herbal, biji', 'MKS-ML100', '790000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1b31-4811-902e-536d9dd8bf17', 'Pemanggang 2 Tungku', 'MKS-111BBQ', '1010000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1bc0-4945-81a6-1e3bb5132aec', 'Deep Fryer', 'MKS-72', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1c4d-463e-8104-69f1108d0e4a', 'Mesin Pemanggang Listrik', 'MKS-PG2', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1cde-4f7b-a2d3-e3564741e3b3', 'Manual Meat Slicer', 'MKS-MSL66', '850000.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1d88-4669-bb5e-3b22366f5be0', 'Sparepart Baut Saringan Susu Kedalai SKD-100B', 'SKD-100B', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1e30-48a1-bca4-6e738137b10b', 'Sparepart Conveyor Pendek/Atas Pemipih Adonan MKS-DS88', 'MKS-DS88', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1ec9-4c70-a06c-344466de0f18', 'Sparepart Conveyor Pemipih Adonan MKS-DS88', 'MKS-DS88', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1f59-4e02-8e50-cc652906d02e', 'Sparepart Moulding Ukuran 1 Cm Cetak Tablet MKS-TBL11', 'MKS-TBL11', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-1fe7-4159-8df3-ceb05d522a5c', 'Sparepart PCB Tetas Telur AGR-TT96 Versi Lama', 'AGR-TT96', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2071-4a4e-b9e3-b66648eaa8a1', 'Sparepart Pisau Penyerut Tusuk Sate Uk 4 mm ST-103 HS', 'ST-103', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2105-4bfc-b606-f6afc4d762e5', 'Sparepart Roda (Hidup) Per-PCS Pemipih Adonan MKS-DS88', 'MKS-DS88', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-21a1-4f95-8bd2-108596253e2a', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-400', 'GRILLO-400', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2231-4ae6-9eae-7126a2c0294c', 'Sparepart Sisir Cetak Mie MKS-220SS', 'MKS-220SS', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-22bd-42c2-9747-285f6cb7552c', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-GS10', 'Grillo-GS10', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-234c-4db9-b9f4-b4730198822e', 'Sparepart Heating Element MSP-300I', 'MSP-300i', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-23f9-43b1-8169-c6184057dc56', 'Sparepart Kain Teflon MSP-300i', 'MSP-300i', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-249f-472b-9db7-1537faa12804', 'Sparepart Pisau 4mm Vegetable Cutter MKS-CT100', 'MKS-CT100', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2531-4ef3-b5a5-92c3c2242045', 'Sparepart Keramik Humidifier Tetas Telur AGR TT360', 'AGR-TT360', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2611-4a69-8cda-b46acb0f6d84', 'Sparepart Rak 1 Set Tetas Telur AGR-TT360', 'AGR-TT360', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-26a2-4f23-aa96-a4634b5d0615', 'Sparepart Screw Giling Daging MHW-120', 'MHW-120', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2738-4932-a8f0-1a5b51853ff7', 'Sparepart Penjepit Cetak Bakso MKS-MFC280', 'MKS-MFC280', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-27d3-4e1a-9afd-c6ff4a7b966b', 'Sparepart Ring Cup Sealer Uk. 88mm 10-16 Oz CPS-959', 'CPS-959', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-286d-4b19-aa29-51ce904801c1', 'Sparepat Per Cetak Bakso MKS-MFC280', 'MKS-MFC280', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-28f8-4c6d-bbed-187c12ed4dde', 'Baut pengunci kecil cetak mie', 'MKS-150B', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2988-4354-82fa-6b2cfcd7c721', 'Sparepart penutup bawah eggroll ERG-001,ARD-202,ARD-404', 'ERG-001', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2a19-433e-a5bc-b9ef8a195117', 'Sparepart Ring moulding Uk.66mm 8 oz CPS-959', 'CPS-959', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2acf-4658-a8e6-7a5ea8508054', 'PCB KZB-1', 'PCB KZB-1', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2b64-4402-9efe-32d140fffc67', 'Sparepart corong atas perajang rumput AGR-CH400B', 'AGR-CH400B', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2bf2-48bb-b174-2742b23d512f', 'Pisau penyerut mesin giling daging MHW-G51B/Kecil', 'MHW-G51B/Kecil', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2c7e-4a5d-b5bc-6ce3cbb67439', 'Sparepart Tray Food Dehidrator ARD-PM99', 'ARD-PM99', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2d0b-4e85-807e-fa6f89d485be', 'Sparepart Pully Kecil Cetak Mie MKS-220SS', 'MKS-220SS', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41'),
('9d9ccbf3-2da1-4def-84be-2d23cf7f2d81', 'Sparepart Tombol Emergency Mixer Planetary MKS-20B/30B', 'MKS-20B/30B', '0.00', '2024-11-30 11:53:41', '2024-11-30 11:53:41');

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

--
-- Dumping data for table `tb_barang_keluar`
--

INSERT INTO `tb_barang_keluar` (`id_barang_keluar`, `id_transaksi`, `id_barang`, `tanggal`, `kode_transaksi`, `nama_konsumen`, `no_handphone`, `alamat`, `kode_barang`, `nama_barang`, `tipe_barang`, `jumlah_barang`, `posisi`, `created_at`, `updated_at`) VALUES
('9d9ccca1-e634-4fde-b844-f259485a39ff', '9d9ccca1-e20c-4f42-8133-283c53114f99', '9d9ccbf2-ab35-40f1-93c6-44133844ab59', '2024-11-30', 'Do.090.898dddss', 'Randi', '081270160332', 'Jl.Sumatera. RT 05. RW 12. Kec.Tenayan Raya. Kel.Sialangsakt', '654654', 'Mesin Universal Fritter', 'MKS-UV44', 15, 'Rak-1', '2024-11-30 11:55:36', '2024-11-30 11:55:36'),
('9d9cccff-3c91-4907-af24-1bc8ded5b462', '9d9cccff-381f-4225-9d20-ec5d2a43a43a', '9d9ccbf2-ae08-47f7-9d3e-5887d7450f5a', '2024-11-30', 'Do.090.89811', 'tiadss', '081270160332', 'Jl.Sumatera. RT 05. RW 12. Kec.Tenayan Raya. Kel.Sialangsakt', '654654', 'Mesin Pencabut Rumput', 'AGR-PR238', 25, 'Rak-1', '2024-11-30 11:56:37', '2024-11-30 11:56:37'),
('9d9ccd89-0d96-4dbf-82fe-dd081f6cf54d', '9d9ccd89-09de-4245-aacd-a8c772567eb6', '9d9ccbf2-ae98-4d92-b37b-480dc18c571f', '2024-11-30', 'Do.090.898dddss', 'Randi', '081270160332', 'Jl.Sumatera. RT 05. RW 12. Kec.Tenayan Raya. Kel.Sialangsakt', '654', 'Mesin Dough Mixer', 'MKS-DMIX002', 35, 'Rak-1', '2024-11-30 11:58:07', '2024-11-30 11:58:07'),
('9d9ce24a-2abe-4b62-b043-6992f18add54', '9d9ce24a-24f1-4baa-b8dd-89a6f34eb89c', '9d9ccbf2-b0fc-44f4-a488-077c624e0e7b', '2024-11-30', 'Do.090.89811', 'loki', '081270160332', 'Jl.Sumatera. RT 05. RW 12. Kec.Tenayan Raya. Kel.Sialangsakt', '654', 'Mesin Cetak Mie', 'MCM-150', 1, 'Gudang-Lt1', '2024-11-30 12:56:09', '2024-11-30 12:56:09'),
('9d9ce923-8741-439a-b77e-73d33187b841', '9d9ce923-82cc-476c-8ea4-7ed517c09223', '9d9ccbf2-b176-45a0-b74f-3c48d233681d', '2024-11-30', 'Do.090.898dddss', 'xse', '081270160332', 'Jl.Sumatera. RT 05. RW 12. Kec.Tenayan Raya. Kel.Sialangsakt', '654654', 'Mesin Coffe Espresso', 'MKS-MKP60', 1, 'Gudang-Lt1', '2024-11-30 13:15:18', '2024-11-30 13:15:18');

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

--
-- Dumping data for table `tb_stok_barang`
--

INSERT INTO `tb_stok_barang` (`id_stok`, `id_barang`, `tanggal`, `nama_barang`, `tipe_barang`, `barang_masuk`, `barang_keluar`, `stok_awal`, `stok_akhir`, `posisi`, `keterangan`, `created_at`, `updated_at`) VALUES
('9d9ccc04-b3ca-428a-aac1-dff5a9d39080', '9d9ccbf2-cf9c-4c7b-b48e-af5c1efd6a3c', '2024-09-12', 'Oven Listrik', 'ARD-EO33', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-b708-4f43-a2b8-015b01b74d39', '9d9ccbf2-d01c-40a6-a545-6f45368763b7', '2024-09-12', 'Bread Maker', 'ARD-BM55X', 0, 0, 3, 3, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-b9cd-4c6b-b899-05d8588e42e4', '9d9ccbf2-d11c-4628-963f-ddd9a69da89b', '2024-09-12', 'Timbangan Digital', 'TBG-3', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-bc1f-4124-990c-63bf0c34ddbc', '9d9ccbf2-d19e-4875-afbf-ad819c914a1c', '2024-09-12', 'Timbangan Digital', 'TBG-1', 0, 0, 6, 6, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-be6b-44e9-8234-4557de39b2b3', '9d9ccbf2-d220-40fc-9881-d8f27626decd', '2024-09-12', 'Timbangan Digital', 'TBG-5', 0, 0, 5, 5, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-c0cf-46da-b027-58c7ab79d235', '9d9ccbf2-d2c6-4e4b-b950-6219acb848f9', '2024-09-12', 'Timbangan Digital', 'TBG-10', 0, 0, 5, 5, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-c31c-4dc1-bbed-86842642111d', '9d9ccbf2-d35c-4db7-ae38-fe2fa7c299a4', '2024-09-12', 'Cetak Sosis Telur Listrik', 'ARD-404', 0, 0, 10, 10, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-c58a-4c3a-b22c-b1738c7b3295', '9d9ccbf2-d3e0-4c9e-887d-3a42d6c0542d', '2024-09-12', 'Cetak Sosis Telur Listrik', 'ARD-202', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-c7f7-4d49-a5bf-68d73575525f', '9d9ccbf2-d465-4be8-b98b-3d322c686feb', '2024-09-12', 'Cetak Sosis Telur Listrik', 'ARD-303', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-ca56-4a4d-a2a6-7b45e7fd30a8', '9d9ccbf2-d4ed-4b24-9db0-d19badda9842', '2024-09-12', 'Cetak Sosis Telur Listrik', 'ARD-505', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-ccc4-4ecd-bfdd-6ddbfac3a0a8', '9d9ccbf2-d573-4740-9eb7-f9902668413e', '2024-09-12', 'Cetak Sosis Telur Listrik', 'GRILLO-400', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-cf43-4139-bcb2-412ac4b3736b', '9d9ccbf3-0f89-49c6-85f2-543d31ca65b4', '2024-09-12', 'Pemasak', 'KTl-DBL2', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-d1a4-478e-9688-df2d6acf7603', '9d9ccbf2-d60d-493b-bcb5-51cef7b0a78a', '2024-09-12', 'Blender', 'MKS-BLD 1,5L', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-d443-4d25-8119-281044394823', '9d9ccbf2-d783-476c-a084-5368e3de4037', '2024-09-12', 'Ice Krim Buah', 'ICE-01', 0, 0, 3, 3, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-d6aa-4de0-9dc2-73eb5b017cdf', '9d9ccbf2-d7fc-480f-9bab-65ca2d7b2912', '2024-09-12', 'Long Potato', 'MKS-LPCT50', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-d8f4-4a69-947c-a143374e538e', '9d9ccbf2-d87b-4dcf-a869-b13c97af3fa7', '2024-09-12', 'Giling Daging', 'MHW-G31B', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-db78-445e-8095-705b2364052c', '9d9ccbf2-d98f-4338-9965-21cf7314cb77', '2024-09-12', 'Mangkok', 'ICE BARREL', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-ddd7-4ba5-94e0-56aa5f250a37', '9d9ccbf3-100e-4ded-9f98-4587ac1bbc00', '2024-09-12', 'Deep Fryer', 'MKS-G20L', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-e00d-4819-86de-70dd0f6c07d2', '9d9ccbf2-da07-45bc-bbff-4cb83d8eef98', '2024-09-12', 'Display Warmer', 'MKS-DW66', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-e2aa-4729-82ea-fbaf8588ed31', '9d9ccbf2-da7f-41cb-95df-1e6b5a049c0b', '2024-09-12', 'Lafira', 'LAFIRA', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-e4fa-421b-b91f-2b8067e54d0d', '9d9ccbf2-daf9-4a99-a1da-1f7cd1c50501', '2024-09-12', 'Pemotong keripik tempe', 'MKS-JT04', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-e75a-49fb-b916-ca5e799f5bb8', '9d9ccbf2-db73-4386-bad0-e6a6d81ac706', '2024-09-12', 'Mesin Gelas Kesehatan', 'ARD-CP5', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-e9a1-4486-ba21-7cf81a533289', '9d9ccbf2-dbf5-4129-ad3a-3c3371d6021c', '2024-09-12', 'Ice Crusher', 'MKS-CRS20', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-ebf9-46c0-9f45-2a501dc79a81', '9d9ccbf2-dd17-4cf6-99e3-1a0667dd0a50', '2024-09-12', 'Chopper', 'ARD-FC200', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-ee43-4cc4-857a-7912d0092058', '9d9ccbf2-dd92-461b-b5d7-570365d52347', '2024-09-12', 'Pemanggang', 'ARD-GRL77', 0, 0, 2, 2, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-f0a8-4501-aef7-e257b54228dc', '9d9ccbf2-de0c-4e38-8d57-ed8519d7e975', '2024-09-12', 'Kentang Spiral', 'TP-200', 0, 0, 5, 5, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-f2e8-42c6-8c86-e17fdf6059cf', '9d9ccbf2-de85-4c49-9624-b66d400f8dc9', '2024-09-12', 'Alat Pengiris Kentang Spiral', 'MKS-PSS44', 0, 0, 2, 2, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-f572-4c4d-b598-ffa5aa4ad6ad', '9d9ccbf2-df0a-450d-8c2b-87bc77c16494', '2024-09-12', 'Alat Pengiris Apel', 'MKS-APL88', 0, 0, 5, 5, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-f7f1-48d6-81a2-0a9107fdc7bf', '9d9ccbf2-df88-497f-a6b7-5f21697eacdf', '2024-09-12', 'Alat Cetak Long Potato', 'MKS-LPCT30', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-fa16-4a28-8726-0bf136b0ea1b', '9d9ccbf2-e001-4c06-ac6f-5d1154fb5b13', '2024-09-12', 'Alat Cetak Long Potato', 'MKS-MER2', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-fc52-489e-8e28-782c7c4fd179', '9d9ccbf2-e07a-4191-8de8-8d07bd78c9e9', '2024-09-12', 'Alat Cetak Sate Telur Puyuh', 'ARD-TKY16', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc04-fe59-49ef-ad76-c38e38873e31', '9d9ccbf2-e0f3-46d1-a1fd-8259a3fc1cb1', '2024-09-12', 'Mesin penepung Herba, Farmasi dan biji', 'MKS-ML100', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-0051-4f38-a949-bd9413049cf7', '9d9ccbf2-e16c-4fb2-8072-e1a132526e9b', '2024-09-12', 'Mesin Kopi Espresso', 'MKS-MKP50', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-025a-4dba-881c-f540790312f9', '9d9ccbf2-e1e5-4e9c-9950-0a914828466b', '2024-09-12', 'Mesin Grinder kopi', 'MKS-GRD80A', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-046e-42f1-9317-dd6e955c6c8f', '9d9ccbf3-01ff-4526-b743-590a986aed07', '2024-09-12', 'Rok Espresso', 'ROK ESPRESSO', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-0674-4c36-8f16-0a44f8939117', '9d9ccbf2-e25e-41f2-96ea-8236f0d8a928', '2024-09-12', 'Mesin Penggiling Kopi', 'MKS-600B', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-088d-447f-8bd8-fb4869e9e425', '9d9ccbf2-e2ea-47bb-90a9-10a97b1c4f5a', '2024-09-12', 'Mesin Deep Fryer Gas', 'MKS-71', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-0b18-4710-98f2-5c1c5f575bb1', '9d9ccbf2-e366-4734-9691-c6a58b865c2d', '2024-09-12', 'Mesin Pembuat Sosis Telur', 'MKS-ERG002', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-0fb1-4cf6-bdad-030977958573', '9d9ccbf2-e3e0-47d9-b62c-b34c957a92f9', '2024-09-12', 'Mesin Egg Roll', 'GRILLO-GS10', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-1227-4405-9522-0dd65ef74dc8', '9d9ccbf2-e459-49e1-8c27-cc6e46c090de', '2024-09-12', 'Mesin Egg Roll', 'GRILLO-GS6', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-1456-4f2d-a266-78a42073841c', '9d9ccbf2-bce6-4258-9103-6b0fecad3e21', '2024-09-12', 'Mesin Egg Roll', 'MKS-ERG001', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-16e0-44da-a0e9-31b437ba9959', '9d9ccbf3-10fb-4514-856c-c8cbea1a2f4f', '2024-09-12', 'Mesin Food Dehydrator', 'ARD-PM99', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-193c-4de3-ad96-c1b256bf1a94', '9d9ccbf2-e562-492a-b452-746fab5ea095', '2024-09-12', 'Alat Manual Meat Slicer', 'MKS-MSl66', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-1be2-4a60-bcf6-4884fd73ffd2', '9d9ccbf2-e5df-4839-8e81-1aff6a4f5f09', '2024-09-12', 'Mesin Cetakan Donat', 'MKS-DN60', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-1e20-45be-b9bb-e7abcb0f603e', '9d9ccbf2-e658-4fe7-bb9a-579663658678', '2024-09-12', 'Mesin Hot Dog Wafel', 'MKS-HDW6', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-2023-40aa-ba20-ba78626bea03', '9d9ccbf2-e70f-469e-a03a-656726303ce9', '2024-09-12', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-22bc-4402-9437-818fb4cfe40d', '9d9ccbf2-e78e-4437-b96a-f2ad2cc7912e', '2024-09-12', 'Mesin Takoyaki Listrik', 'MKS-700E', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-24f3-49ba-a820-a6b7ac424f28', '9d9ccbf2-e808-4c24-a969-04a6b141dcd0', '2024-09-12', 'Mesin Waffle Taiyako', 'MKS-ETYK3', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-2711-42b2-8ee7-142d25be31d5', '9d9ccbf2-e882-4a4e-8b08-356eeb738b50', '2024-09-12', 'Mesin Perajang Sayur dan Buah', 'MKS-VGT65', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-298e-40fd-b549-7e070527b9b4', '9d9ccbf2-e903-431b-bb5b-21f472a33919', '2024-09-12', 'Mesin Slot Toaster', 'MKS-D06', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-2bca-453c-9c54-6bfb18f256cd', '9d9ccbf2-e985-4ddb-a1e0-646a70643352', '2024-09-12', 'Cetak Mie dan Pasta', 'ARD-NM4', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-2e11-4bbb-8591-894e9ce13712', '9d9ccbf3-11de-466b-b65e-fe834222475e', '2024-09-12', 'Mesin Giling Daging', 'MHW-G31B', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-30e9-4984-b78b-123b92dd3c5c', '9d9ccbf2-ea00-48a1-8179-794dd19efbfe', '2024-09-12', 'Mesin Hand Sealer', 'MSP-400A', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-3337-4110-ae1b-110d7b846abf', '9d9ccbf2-ea7a-4a79-a8d8-7e056365ebad', '2024-09-12', 'Mesin Hand Sealer', 'MSP-300A', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-35b7-4ad6-962c-d95ccd3e216e', '9d9ccbf2-eaf8-440f-a657-ef230ccce99a', '2024-09-12', 'Mesin Hand Sealer', 'MSP-200I', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-37e6-456e-aa11-a33bd9875bac', '9d9ccbf2-eb75-4c9f-ae08-b2a664c189b2', '2024-09-12', 'Mesin Hand Sealer', 'MSP-200A', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-3a0f-46c9-b494-47dd9b6f1b57', '9d9ccbf2-ebef-45c1-b86f-c666a86b8f2e', '2024-09-12', 'Mesin Hand Sealer', 'MSP-300i', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-3c4c-4053-9531-299496914af5', '9d9ccbf2-ec69-40fa-a5fa-f17ac56118d7', '2024-09-12', 'Mesin Vacum Sealer', 'MSP-DZ280A', 0, 0, 5, 5, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-3e78-4aea-a90f-1941e8ffcf4b', '9d9ccbf2-ece2-41e3-83ab-2021deb9b7bb', '2024-09-12', 'Mesin Vacum Sealer', 'MSP-290E', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-40a3-4899-aaf2-81c7f5472d7a', '9d9ccbf2-ed5c-44fc-b2dd-db275d407ad8', '2024-09-12', 'Mesin Vacum Sealer', 'MSP-VS02', 0, 0, 4, 4, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-4315-4ce9-b77a-1a61cd9b758d', '9d9ccbf2-edd7-45ea-9bea-749aac068b73', '2024-09-12', 'Mesin vakum food sealer', 'ARD-VC85', 0, 0, 5, 5, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-455b-477e-a204-2b8df6caf237', '9d9ccbf2-ee50-4fa1-aaf8-3b46ad83463f', '2024-09-12', 'Mesin vakum sealer', 'ARD-VS01', 0, 0, 3, 3, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-47bb-44d2-8c26-1ba2ee69097e', '9d9ccbf2-eec9-4339-a6d4-19dc6ea27cad', '2024-09-12', 'Mesin Hand Printer', 'HP-351', 0, 0, 3, 3, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-4a54-4f3c-b624-afde6f96cf6f', '9d9ccbf2-ef42-4b1e-8f81-0a5e81125438', '2024-09-12', 'Alat Cetak Sosis Horizontal', 'MKS-3V', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-4cad-44f0-9b3c-81cb4bacc52d', '9d9ccbf2-efd0-49d2-9138-03040621bfa0', '2024-09-12', 'Alat Cetak Sosis Vertikal', 'MKS-3H', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-4f05-49f0-9345-94302739c266', '9d9ccbf2-f064-4fbb-8543-86926c0d867c', '2024-09-12', 'Mesin Pengupas Bawang Putih', 'AGR-BWG180', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-5184-4c5f-ba98-fe947af8938a', '9d9ccbf2-f0e0-4618-9298-0442b9b07c7e', '2024-09-12', 'Mesin Giling Daging', 'MHW-80', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-53f2-4a93-9492-d4ece1313719', '9d9ccbf2-f16a-4f38-95b6-60b59b20b18c', '2024-09-12', 'Mesin Giling Daging', 'MHW-220', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-5671-4e56-8d53-f9df2409c34f', '9d9ccbf2-f1ff-451d-94f6-76ca9347560b', '2024-09-12', 'Mesin Pemanggang', 'MKS-PG4', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-58d0-4784-a3b0-d0fd97e6841d', '9d9ccbf2-f293-4eee-a6af-b3f89cefc85f', '2024-09-12', 'Mesin Pemanggang', 'MKS-PG2', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-5b35-40a5-a0b6-d37e81c07456', '9d9ccbf2-f328-4784-a1e8-ffd296bb7186', '2024-09-12', 'Mesin Egg Waffle Listrik', 'MKS-EW06', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-5dcf-4dcc-bfdf-88523eba644f', '9d9ccbf2-f3bd-476e-b8f4-afebaa6c88ac', '2024-09-12', 'Mesin Egg Waffle Gas', 'MKS-GW07', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-602c-4240-a650-91b5bff17884', '9d9ccbf2-f450-4374-b95e-7c8835bf2377', '2024-09-12', 'Mesin Cone Bakar', 'MKS-CB1', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-62a2-4697-aafd-40195fde1b9b', '9d9ccbf2-f4e1-4967-a91a-f42d06150134', '2024-09-12', 'Mesin Universal Fritter', 'MKS-UV22', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-6525-40e2-83b9-ae8950628f9a', '9d9ccbf2-ab35-40f1-93c6-44133844ab59', '2024-09-12', 'Mesin Universal Fritter', 'MKS-UV44', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-679e-4ac5-ab69-12529ab72c1d', '9d9ccbf2-f569-45e9-9e6f-c98a8d4ffa5d', '2024-09-12', 'Alat Perajang bawang manual', 'PRJ-BM', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-6a14-47f5-a535-b173588ecadd', '9d9ccbf2-f5ee-4033-b6ac-9e3c8d7abd45', '2024-09-12', 'Alat Perajang singkong manual', 'PRJ-M', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-6ca2-453d-b164-0b97a0edc937', '9d9ccbf2-f69c-4530-aaf0-970be10891dc', '2024-09-12', 'Mesin Pembuat Gulali', 'MKS-CT76', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-6eb8-4349-899e-7240c6938453', '9d9ccbf2-f731-435b-920f-16b2ef40fa4b', '2024-09-12', 'Cup Sealer', 'CPS-919', 0, 0, 0, 0, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-70c4-4ee0-93c5-a850d1666375', '9d9ccbf2-f7cb-4d88-8be6-c58c0c1be59e', '2024-09-12', 'Cup Sealer', 'CPS-818', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-72e1-44ed-8a04-84ffd308de53', '9d9ccbf2-c6f8-4624-b50b-0bee12e88251', '2024-09-12', 'Cup Sealer', 'CPS-959', 0, 0, 0, 0, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-7555-4b5e-a47b-b8ea1cf71b51', '9d9ccbf2-f852-4c5d-974e-a5f784b35504', '2024-09-12', 'Hand Sprayer (Semprotan)', 'SPR-16', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-7801-483b-82a5-981f8ee90595', '9d9ccbf3-12c8-439b-8b57-177512582d08', '2024-09-12', 'Mesin Cetak Mie', 'MKS-150B', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-7a61-4e3e-a1b8-1d6ecce824c8', '9d9ccbf2-f8de-41a3-bb4c-f072eb1c3376', '2024-09-12', 'Mesin Pemanggang Grill', 'ARD-GRL88', 0, 0, 2, 2, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-7c9b-4a84-b073-999786b5220a', '9d9ccbf2-ad8b-4563-8434-8a665e9b5ce5', '2024-09-12', 'Mesin Cetak Mie', 'MKS-140', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-7f49-48d3-991c-d20b4f606040', '9d9ccbf2-f972-4659-bfd8-971e23b9027f', '2024-09-12', 'Mesin Cetak Mie', 'MKS-160', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-8196-4201-85d4-2c4a06661b1c', '9d9ccbf2-fa14-47fd-b32b-c760d193965b', '2024-09-12', 'Teko Listrik Stainless', 'ARD-KT11', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-83f6-4a14-93c4-04a994208398', '9d9ccbf2-faa8-4a7e-b543-308955c33caf', '2024-09-12', 'Mesin Water Boiler', 'MKS-D30', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-8653-46e3-b6bf-9be92a19f5c3', '9d9ccbf3-1365-46e6-a4fe-85bab81a0c46', '2024-09-12', 'Cup Sealer', 'CPS-10A', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-8892-4a01-903e-d9627b50cafe', '9d9ccbf2-fbac-4288-b850-09a969a8d8b3', '2024-09-12', 'Dough Mixer', 'MKS-DIMX002', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-8b2d-47d7-b8b4-72046a2eb717', '9d9ccbf3-13f5-4a5e-9ebc-ed307868fa52', '2024-09-12', 'Mesin Ice Crusher', 'MKS-CRS20', 0, 0, 4, 4, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-8d81-43f4-8edb-2642b5447eff', '9d9ccbf2-b958-4525-a754-b18ade542685', '2024-09-12', 'Mesin Cetak Mie', 'MKS-160SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-8f9d-4591-9997-ae884472f40e', '9d9ccbf2-af16-4505-9ac8-0e4e5c396c9b', '2024-09-12', 'Mesin Cetak Mie', 'MKS-180SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-91ad-4c58-8881-de782c20187e', '9d9ccbf2-b2ed-4826-b8eb-0de89cd109b2', '2024-09-12', 'Mesin Cetak Mie', 'MKS-200', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-93ac-47c0-9abd-28dda11d9725', '9d9ccbf2-fc2e-44fb-8d76-17df7fdd2af5', '2024-09-12', 'Mesin Cetak Mie', 'MKS-220SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-95a4-4f51-bfec-2f48a7f92176', '9d9ccbf2-fcb4-4e26-9ee6-2041fd15dbc3', '2024-09-12', 'Mesin Penutup Botol Manual', 'MKS-BT31', 0, 0, 2, 2, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-9823-4ff9-82a8-d178b927f207', '9d9ccbf2-fd39-4c47-9a01-6b34bf405609', '2024-09-12', 'Hand Sealer', 'FS-600', 0, 0, 0, 0, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-9a1f-4bc7-8691-4ee5e7e59a92', '9d9ccbf2-fdba-4122-a9e7-ee93a631cb08', '2024-09-12', 'Mesin Cup Sealer', 'CPS-9A', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-9c11-4bdb-91e8-56015e31836f', '9d9ccbf2-c96b-4185-a5a7-72fffeb774b6', '2024-09-12', 'Oven Roti Gas 1 Loyang', 'MKS-RS11', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-9e18-4e5d-bc31-cdf031d2b58f', '9d9ccbf2-c9f0-498c-954b-d942a3dc37fc', '2024-09-12', 'Penetas Telur', 'AGR-INC24', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-a02e-4f66-8a08-eb04eedc5eb7', '9d9ccbf3-1488-4e11-854d-4d2872892785', '2024-09-12', 'Penetas Telur', 'AGR-TT32', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-a222-4e42-a925-a34763651c94', '9d9ccbf2-ca73-4bec-9c6f-9461613d6be6', '2024-09-12', 'Penetas Telur', 'AGR-TT7', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-a420-4392-ac6b-6fff6feee152', '9d9ccbf2-caf5-410e-830c-ec43f2026eb3', '2024-09-12', 'Penetas Telur', 'AGR-TT4', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-a655-48d4-8bab-844cc25e3149', '9d9ccbf2-cb76-492a-aed0-c798623fff26', '2024-09-12', 'Mesin Soft Ice Cream', 'MKS-ICM-119', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-a84a-4640-a7ce-99a14c98f8d6', '9d9ccbf2-cbfa-4b2b-8a9d-a7f4e699ad9f', '2024-09-12', 'Mesin Dough Mixer', 'MKS-DG15', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-aa3b-47ba-810e-dad4e472f64d', '9d9ccbf2-cc82-4f52-8911-14c020d96700', '2024-09-12', 'Mesin Cetak Mie', 'MKS-350', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-ac62-4fe0-9e81-ff7b6bbaa277', '9d9ccbf2-cd05-4260-bec0-0d42a0f4f5b1', '2024-09-12', 'Mesin Serutan Es Salju', 'MKS-ICE28', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-ae58-4c24-888d-c2838e1efede', '9d9ccbf2-cd87-4136-a0ed-6d926447dc47', '2024-09-12', 'Mesin Perajang Keripik', 'MKS-CT100 A', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-b04b-411f-a095-c20a8004522c', '9d9ccbf2-ce08-4d69-97cc-6a1bf8dea371', '2024-09-12', 'Pengupas Nanas Industri', 'MKS-PN60', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-b256-49e4-9f00-72e15c033eec', '9d9ccbf2-ce88-4d60-bd05-f7af01d9f579', '2024-09-12', 'Mesin Mixer Planetary', 'MKS-10B', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-b6d0-431d-a8ca-bbd0b2974882', '9d9ccbf2-cf15-4d30-977a-d0e7f859f323', '2024-09-12', 'Mesin Mixer Planetary', 'MKS-BK20M', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-b9a2-4f4a-a078-937b8b5c23e8', '9d9ccbf2-ab35-40f1-93c6-44133844ab59', '2024-09-12', 'Mesin Universal Fritter', 'MKS-UV44', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-bb9f-4da5-a5e1-cbe157a109a6', '9d9ccbf2-acfb-4bc8-b76a-b8399a549b4d', '2024-09-12', 'Mesin Cup Sealer', 'CPS-10A', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-bdb7-404d-968c-e6925dd485e8', '9d9ccbf2-ad8b-4563-8434-8a665e9b5ce5', '2024-09-12', 'Mesin Cetak Mie', 'MKS-140', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-bfe7-4866-b9bf-7f1d8b3157a6', '9d9ccbf2-ae08-47f7-9d3e-5887d7450f5a', '2024-09-12', 'Mesin Pencabut Rumput', 'AGR-PR238', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-c1df-41dd-96fa-b29c14b81518', '9d9ccbf2-ae98-4d92-b37b-480dc18c571f', '2024-09-12', 'Mesin Dough Mixer', 'MKS-DMIX002', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-c417-4f5a-9891-8b1e557fe474', '9d9ccbf2-af16-4505-9ac8-0e4e5c396c9b', '2024-09-12', 'Mesin Cetak Mie', 'MKS-180SS', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-c622-4b1d-aa77-2f454bda0e89', '9d9ccbf2-af91-4844-8563-195d0b59cdd2', '2024-09-12', 'Mesin Food Dehidrator', 'ARD-PM99', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-c817-44ff-bf92-fca5f6987a96', '9d9ccbf2-b00a-4ab4-8475-575fe342dec4', '2024-09-12', 'Mesin Cetak Pelet', 'MKS-PLT25', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-ca2d-4b3b-8a9d-296256a46ac8', '9d9ccbf2-b083-4143-a3bc-302726efaac2', '2024-09-12', 'Alat Sauce Pan/Ssauce Dispenser', 'MKS-SU-01', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-cd10-4d9f-93e6-9f4994f0510f', '9d9ccbf2-b0fc-44f4-a488-077c624e0e7b', '2024-09-12', 'Mesin Cetak Mie', 'MCM-150', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-cf05-4832-878d-2b583b6a7d22', '9d9ccbf2-b176-45a0-b74f-3c48d233681d', '2024-09-12', 'Mesin Coffe Espresso', 'MKS-MKP60', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-d101-479c-8dd0-27982c7cba4a', '9d9ccbf2-b1ef-4192-91b6-baff1d8644bb', '2024-09-12', 'Alat Giling Daging manual', 'MKS-SG10', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-d30b-4b6d-93b5-fe45ece7225a', '9d9ccbf2-b26d-4c3b-9bae-b77b779fb19c', '2024-09-12', 'Mesin cetak Mie Manual', 'MKS-150B', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-d514-42f9-aa88-5b1bbd709a46', '9d9ccbf2-b2ed-4826-b8eb-0de89cd109b2', '2024-09-12', 'Mesin Cetak Mie', 'MKS-200', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-d74f-4f5a-8086-e695b696d665', '9d9ccbf2-b37e-4a1a-a9a7-edd68b14e1b0', '2024-09-12', 'Alat Pemotong Kerupuk Lontong manual', 'AGR-LTG22', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-d9bf-4336-995f-df3b8565919f', '9d9ccbf2-b400-4bca-b162-12b37d1e610e', '2024-09-12', 'Mesin Waffle Maker', 'MKS-WF48', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-dbd5-4dc0-87db-704a13eb3649', '9d9ccbf2-b479-4de8-a49c-707b3d4783be', '2024-09-12', 'Mesin Electric Kettle', 'KTL-DBL2', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-de32-4d57-a4a0-4e89143594ea', '9d9ccbf2-b4fe-4f1f-a765-1b4e35ba874b', '2024-09-12', 'Mesin electric Kettle', 'ARD-KT12', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-e0bb-4c67-9b48-fd51520e6d50', '9d9ccbf2-b580-4e05-a036-0e47ec618fff', '2024-09-12', 'Mesin Coffe Grinder', 'MKS-GRD60A', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-e2bb-477c-89d1-dfa07f70b853', '9d9ccbf2-b5fa-420a-8560-63e97ea20e95', '2024-09-12', 'Mesin Coffe Bean Grinder', 'MKS-CG50', 0, 0, 5, 5, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-e4cc-45cf-93aa-664e0718566b', '9d9ccbf2-b672-4d24-9119-18f559ccb9f5', '2024-09-12', 'Mesin Pemipil Jagung', 'PPJ-001', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-e798-441d-bbff-8e076e536527', '9d9ccbf2-b6eb-4088-b31b-c6a4c727fc91', '2024-09-12', 'Alat Cetak Mie dan Pasta', 'CM-2020', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-e9fd-4a8e-a657-ccd8dba31c03', '9d9ccbf2-b764-4d37-b7b1-a775668239ef', '2024-09-12', 'Mesin Giling Daging', 'MHW-120', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-ec17-4fb0-a9d4-93096f9508d2', '9d9ccbf2-b7dd-439e-8df2-303e6079728e', '2024-09-12', 'Mesin Pemanggang', 'MKS-111BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-ee43-4dc1-9459-cccdf4b16f64', '9d9ccbf2-b857-4740-b08f-9681c2bc309b', '2024-09-12', 'Mesin Big Smoker', 'MKS-BLS002', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:53', '2024-11-30 11:53:53'),
('9d9ccc05-f0ab-4760-bffa-fef0b0daf47f', '9d9ccbf2-b8ce-4e84-9297-18be9f2f29b9', '2024-09-12', 'Mesin Tetas Telur', 'AGR-TT32', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc05-f32f-4348-830d-96b6d2321057', '9d9ccbf2-b958-4525-a754-b18ade542685', '2024-09-12', 'Mesin Cetak Mie', 'MKS-160SS', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc05-f5a7-465b-b391-8e13324b2740', '9d9ccbf2-b9dc-4390-8432-9ca2b42d1a6f', '2024-09-12', 'Mesin Stik Wafel', 'MKS-HDW5', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc05-f81c-4304-8a86-da24dcb76bb1', '9d9ccbf2-ba58-4fa4-b452-f0ff85b1424d', '2024-09-12', 'Mesin Pemanggang', 'MKS-369BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc05-fac5-4e8a-bc8a-3354b8f4da27', '9d9ccbf2-bad1-407d-ae95-3142f8bb72f0', '2024-09-12', 'Mesin Pemanggang', 'MKS-222BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc05-fdd7-45da-936b-dd9e615d2d68', '9d9ccbf2-bb4e-4aee-a3b6-0a5de3d463dc', '2024-09-12', 'Mesin Mixer Planetary', 'MKS-B5A', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-0078-46f5-8890-9bc6e40a8e61', '9d9ccbf2-bbe9-46d5-a580-ec68ae66d179', '2024-09-12', 'Foot Sealer', 'FRP-600', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-02e3-4754-8005-c1de7667cd7b', '9d9ccbf2-bc6d-40cd-b70e-3939e6347e3e', '2024-09-12', 'Foot Sealer', 'FRP-400', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-0554-4122-98f5-e893e2bf3712', '9d9ccbf2-bce6-4258-9103-6b0fecad3e21', '2024-09-12', 'Mesin egg Roll', 'MKS-ERG001', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-07ca-42c1-8ada-1a7973dc7c0f', '9d9ccbf2-bd5f-42c0-89c0-1333d4c58444', '2024-09-12', 'Mesin Dough Devider', 'MKS-BA80', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-0a2e-4351-8cf5-4390e9083446', '9d9ccbf2-bdd8-4aab-b7aa-6ec02142d535', '2024-09-12', 'Mesin Pemipil Jagung', 'AGR-CORN9', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-0c84-433f-b98e-bdd733bbefa7', '9d9ccbf2-be50-45f5-959a-f2454bea4961', '2024-09-12', 'Mesin Gas Deep Fryer', 'MKS-G75', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-0f02-46c5-a922-2cecdca0d42a', '9d9ccbf2-beca-4e88-a696-e1ffc4efa876', '2024-09-12', 'Mesin Gas Deep Fryer', 'MKS-G20L', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-115a-4932-9dad-7f246a21a3fa', '9d9ccbf2-bf42-43de-b0a8-e06d9346a421', '2024-09-12', 'Mesin Gas Deep Fryer', 'MKS-72', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-13f1-436e-82a2-e20cb6b4396c', '9d9ccbf2-bfca-41d6-ac2d-4ba69962b15a', '2024-09-12', 'Mesin Ice Cream', 'ISC-16', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-166f-464a-9562-f1730dce2de8', '9d9ccbf2-c045-454c-ad2d-849295b83bba', '2024-09-12', 'Mesin Tortiila', 'MKS-TRT11', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-18e3-472c-ad7d-88fcf9d1d085', '9d9ccbf2-c0bf-4fec-bd05-06794e24ae01', '2024-09-12', 'Mesin Dough Devider', 'MKS-DD15M', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-1b7a-44e9-9a24-9dfa681d1296', '9d9ccbf2-c13a-48bb-9f5e-4ef11b901168', '2024-09-12', 'Alat Churros', 'MKS-CRS05', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-1de6-43ca-a677-9bcae58afafa', '9d9ccbf2-c1b4-4554-b214-15d057884bd0', '2024-09-12', 'Mesin Hand Sealer', 'FS-1000', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-205d-494c-9342-8c4b85a6dce2', '9d9ccbf2-c25d-433d-a792-ec36dc165310', '2024-09-12', 'Mesin Continious Band Sealer', 'SF-150W', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-22e0-41ef-a1e6-17b1a7e5016b', '9d9ccbf2-c2e6-48a2-8bf8-d575fb743a29', '2024-09-12', 'Mesin Pemotong Tulang Manual', 'MKS-PTT38', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-254a-4d7b-84d5-44c34dfb6897', '9d9ccbf2-c35f-4ed9-997e-b17f19dfa255', '2024-09-12', 'Mesin Continious Band Sealer', 'FR-900W', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-27cd-47d2-b823-2f08375c505a', '9d9ccbf2-c3d8-4903-a35a-c67e61d92606', '2024-09-12', 'Alat Peras Jeruk Manual', 'MKS-MJ1001', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-2a38-427e-afc7-aa63bf503675', '9d9ccbf2-c451-45a8-a864-01c51860ea10', '2024-09-12', 'Meat Slicer Pengiris Daging', 'MKS-70', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-2ca1-4d24-85d6-507a9d8db2ef', '9d9ccbf2-c4c9-4d02-b372-577862df6bef', '2024-09-12', 'Ice Crusher', 'MKS-002', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-2f40-473e-ab2c-89913eb0db7a', '9d9ccbf2-c542-45bb-b80a-a8eb00fc5b66', '2024-09-12', 'Miller', 'MKS-ML200', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-31a4-43ad-9ca4-9753f7a3c6ea', '9d9ccbf2-c5d6-405b-995f-a02fe01eead7', '2024-09-12', 'Mesin Takoyaki Gas', 'MKS-711B', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-33dd-4e8e-960d-4d547b0a6f82', '9d9ccbf2-c67b-44f9-8edb-9c2e5404d5be', '2024-09-12', 'Mini Coffe Roster', 'CRG-400', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-36ad-477d-aae1-bca4ff7500b5', '9d9ccbf2-c6f8-4624-b50b-0bee12e88251', '2024-09-12', 'Cup Sealer', 'CPS-959', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-390d-496a-9c13-6d03c6524dcb', '9d9ccbf2-c771-463c-bb94-0fb7472ef76c', '2024-09-12', 'Ice Crusher', 'MKS-CRS30', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-3b7d-42cc-a6d2-be8f77c92588', '9d9ccbf2-c7e9-4d6d-a7f7-29192f288d3f', '2024-09-12', 'Mesin Stand Mixer', 'ARD-MR7', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-3e0c-432f-b0f4-07076b13f311', '9d9ccbf2-c8ee-4e8e-bb45-1c42bbeaeaa5', '2024-09-12', 'Mesin Mixer Spiral', 'MKS-SP50', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-406b-4c7d-831a-9821ee33dc1d', '9d9ccbf3-1521-4be3-aff1-c380af0632f8', '2024-09-12', 'Mesin Sosis Telur (Listrik)', 'GRILLO-400', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-42e8-4e23-aa4a-0a1925eda4da', '9d9ccbf3-15ae-4e71-b3e7-12262b433af2', '2024-09-12', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS6', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-4516-40b4-8e79-3835547a92d4', '9d9ccbf2-fe39-44c8-8ebb-84d26ccdbd83', '2024-09-12', 'Mesin Sosis Telur (Listrik)', 'MKS-ERG005', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-47db-4319-9aac-3a44eb434ce7', '9d9ccbf3-163d-4b1b-8977-fbbd2c84b36a', '2024-09-12', 'Mesin Sosis Telur (Gas)', 'MKS-ERG002', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-4a40-4bc1-9d7f-ce6239e6a2f4', '9d9ccbf3-16f4-4059-8e17-713dceaf9bf0', '2024-09-12', 'Mesin Sosis Telur (Gas)', 'MKS-ERG444', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-4c83-4410-bb8a-fbb400772f9e', '9d9ccbf2-feb3-4f0f-a9dc-91d0094ae059', '2024-09-12', 'Mesin Ice Crusher', 'MKS-003', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-50a7-4c58-8f2d-b36dfb5959b5', '9d9ccbf3-17be-4084-9489-d49bd1a636f7', '2024-09-12', 'Mesin Ice Crusher', 'MKS-CRS30', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-544c-497e-b776-240e8f50b60b', '9d9ccbf3-185b-4849-ae4c-d307266b8382', '2024-09-12', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS10', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-56f1-4de4-863d-45afc7b119e6', '9d9ccbf2-ff2e-46ec-adf1-cfd4247c6a79', '2024-09-12', 'Mesin Sosis Telur (Gas)', 'MKS-ERG007', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-5944-489c-a434-706323e05240', '9d9ccbf2-ffad-4fbd-a2b0-6bc9e0dbab62', '2024-09-12', 'Mesin Tetas Telur', 'AGR-TT24', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-5b5b-49d7-8fb1-4adccf459edd', '9d9ccbf3-003b-4168-a570-621b62bcbb5e', '2024-09-12', 'Mesin Tetas Telur', 'AGR-TT24A', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-5d71-4151-a0f4-7932e15f191b', '9d9ccbf2-eaf8-440f-a657-ef230ccce99a', '2024-09-12', 'Mesin hand Sealer', 'MSP-200I', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-62c0-4a66-9f88-aa49bb1b989c', '9d9ccbf3-00d5-49b0-b2a5-9d7d67a16832', '2024-09-12', 'Mesin Tetas Telur', 'AGR-TT96', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-64f7-4b7a-bc93-13c3d7a200ce', '9d9ccbf2-e16c-4fb2-8072-e1a132526e9b', '2024-09-12', 'Mesin Kopi Espresso', 'MKS-MKP50', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-66fd-4a94-8110-90ff6f8edd1c', '9d9ccbf3-016d-4592-b546-44a21a37d79a', '2024-09-12', 'Mesin Filling Cairan Otomatis', 'MSP-F50', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-694b-4fc1-a6a2-acee5a644911', '9d9ccbf3-01ff-4526-b743-590a986aed07', '2024-09-12', 'Rok Espresso', 'Rok Espresso', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-6b4b-40c8-a653-03d376afce03', '9d9ccbf3-028f-4814-9557-bc32b9f02580', '2024-09-12', 'Mesin Standing Mixer', 'MKS-MIX130', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-6d50-4d15-bc13-2c4793cd6a5b', '9d9ccbf3-032d-4731-a619-642451edbf11', '2024-09-12', 'Mesin Vacum Sealer', 'ARD-VS02', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-6f64-4d1c-be9f-5038a13a1a29', '9d9ccbf3-18ec-4f3e-ba22-6af1b90906e9', '2024-09-12', 'Mesin Es Krim Buah', 'ICE-01', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-7175-4729-990e-8af92fd2eb52', '9d9ccbf2-ea00-48a1-8179-794dd19efbfe', '2024-09-12', 'Mesin Hand Sealer', 'MSP-400A', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-7376-444d-9ca2-85777996e3c0', '9d9ccbf3-03e2-4950-bfcc-70b6fba20c7d', '2024-09-12', 'Mesin Hand Sealer', 'MSP-400I', 0, 0, 18, 18, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-7582-4b76-bdc8-df617a8c65a1', '9d9ccbf3-1979-4491-ab07-7d9d72820304', '2024-09-12', 'Mesin Giling Daging', 'MHW-G51B', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-77a6-4460-a3a8-b309af325e51', '9d9ccbf3-0475-4fa4-8bd2-bdf04f782b65', '2024-09-12', 'Mesin Cetak Pelet Manual', 'PLT-10', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-79f1-4286-9f47-2235ccf9dcfa', '9d9ccbf3-1a08-4d01-b87b-06bed5f21ff8', '2024-09-12', 'Mesin pencacah Bumbu Dapur', 'MKS-UV22', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-7c82-46d9-a850-293d167a0b46', '9d9ccbf3-04f8-44e2-b29e-4b898e3be881', '2024-09-12', 'Mesin Penepung Herbal, biji', 'MKS-ML300', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-7eab-4ac1-a5dd-48f106faf922', '9d9ccbf3-1a9e-4650-81c2-0f4361013013', '2024-09-12', 'Mesin Penepung Herbal, biji', 'MKS-ML100', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-80f0-44ba-ace4-a58e9c867bc6', '9d9ccbf3-0573-4e23-b76b-fe601422a7c8', '2024-09-12', 'Mesin Grinder Kopi', 'GRD-80A', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-833a-49ff-8b0a-4c400a249c22', '9d9ccbf3-05ec-414f-9e59-7bb8bfaf8945', '2024-09-12', 'Mesin Kebab', 'MKS-KB01', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-8540-463a-badc-17bb8335b309', '9d9ccbf2-e78e-4437-b96a-f2ad2cc7912e', '2024-09-12', 'Mesin Takoyaki Listrik', 'MKS-700E', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-8738-4a70-b488-c57c0fdecb02', '9d9ccbf3-0666-4e6c-a848-eb522e3b601c', '2024-09-12', 'Mesin Coklat Fountain', 'MKS-CC6', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-89f1-463e-a4e9-5aff8736579c', '9d9ccbf3-06e0-4cad-9d48-2a7bf2307a54', '2024-09-12', 'Food Dryer', 'MKS-DR6', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-8c1b-49e4-8c49-135bc8f1eec1', '9d9ccbf3-075b-4ed3-bdf4-b9a3d778b053', '2024-09-12', 'Deep Fryer', 'MKS-82B', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-8e1b-4cdf-805b-743d7750a064', '9d9ccbf3-07d6-4179-bff5-ff84d8841cd0', '2024-09-12', 'Alat Penanam Biji-Bijian', 'ARD-SED01', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-907e-446b-a462-b8f02d0ab1fb', '9d9ccbf3-0872-4b11-90a5-c3feb23e7658', '2024-09-12', 'Alat Penanam Biji-Bijian', 'ARD-SED02', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-9397-435b-b605-1f76824f0f60', '9d9ccbf3-0900-4614-a2e1-d6818dba43a4', '2024-09-12', 'Mesin Bread Maker', 'ARD-BM66X', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-9617-4bd8-a0f2-9fb08c49eafe', '9d9ccbf3-0981-4232-ac94-7c213e4d17b9', '2024-09-12', 'Mesin Tetas Telur', 'AGR-TT56', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-98aa-45c5-9ecd-4817c4c98796', '9d9ccbf3-0a2a-4702-9bb5-1d9ddc98f71c', '2024-09-12', 'Blender Komersial', 'MKS-BL10L', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-9b22-4a08-9efc-d483869ac951', '9d9ccbf3-0ac6-4ca1-a750-a6c42e61a3dc', '2024-09-12', 'Bread Toaster', 'MKS-D04', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-9da7-4704-8e18-07dbdf9a23fe', '9d9ccbf3-0b5b-4459-853a-194b573a78f0', '2024-09-12', 'Deep Fryer', 'MKS-51B', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-a029-445a-aa30-2da7ad0cc56f', '9d9ccbf3-0be9-485c-a005-683a07e4274b', '2024-09-12', 'Deep Fryer', 'MKS-81', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-a29d-4f67-9e85-89442298e0b9', '9d9ccbf3-0c6d-4496-a6db-431ef2d5747a', '2024-09-12', 'Deep Fryer', 'MKS-82', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-a518-4567-9cbb-ae068a986d8f', '9d9ccbf2-e985-4ddb-a1e0-646a70643352', '2024-09-12', 'Cetak Mie dan Pasta', 'ARD-NM4', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-a72c-4504-b5b0-3b5293bd4cd5', '9d9ccbf3-1b31-4811-902e-536d9dd8bf17', '2024-09-12', 'Pemanggang 2 Tungku', 'MKS-111BBQ', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-a93c-43b1-b27f-adec96756b2b', '9d9ccbf3-0cee-4c40-b34f-eca5470224a0', '2024-09-12', 'Food Dryer', 'MKS-DR10', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-ab93-41e3-8c35-c81842c8ae80', '9d9ccbf3-0d70-40a8-ab3d-14266976f80c', '2024-09-12', 'Deep Fryer', 'MKS-G20L +Keranjang', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-adab-4d4d-9c82-8e3b5094ba36', '9d9ccbf3-1bc0-4945-81a6-1e3bb5132aec', '2024-09-12', 'Deep Fryer', 'MKS-72', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-afcd-462c-a8b0-8706f2637d86', '9d9ccbf2-e70f-469e-a03a-656726303ce9', '2024-09-12', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-b201-4c50-8dea-7b0ba5c0f78c', '9d9ccbf3-1c4d-463e-8104-69f1108d0e4a', '2024-09-12', 'Mesin Pemanggang Listrik', 'MKS-PG2', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-b41b-4ea2-9309-aaf43f6eedfe', '9d9ccbf3-1cde-4f7b-a2d3-e3564741e3b3', '2024-09-12', 'Manual Meat Slicer', 'MKS-MSL66', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-b632-46b1-a0d5-4881cf62541b', '9d9ccbf3-0df0-4903-a881-e092faf05d45', '2024-09-12', 'Mesin Manual Meat Mixer', 'MKS-MM01', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-b862-4331-84f2-f7c55d21a3ef', '9d9ccbf2-c86a-4c26-8ad2-a897d0863fa0', '2024-09-12', 'Mesin Cetak Mie', 'MKS-145', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-ba7c-4762-89f3-6e74f92649ea', '9d9ccbf3-0e7c-4aba-b6d6-19d15debea84', '2024-09-12', 'Mesin Ice Tube', 'MKS-IM22', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-bc92-4bac-a635-a07119196cbe', '9d9ccbf3-0f07-4e0a-9c79-aba49b560e84', '2024-09-12', 'Mesin Takoyaki Gas', 'MKS-722B', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-bf0b-4dae-ae97-be029c6501fd', '9d9ccbf3-1d88-4669-bb5e-3b22366f5be0', '2024-09-12', 'Sparepart Baut Saringan Susu Kedalai SKD-100B', 'SKD-100B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-c17b-426d-ba59-6d27319a5abc', '9d9ccbf3-1e30-48a1-bca4-6e738137b10b', '2024-09-12', 'Sparepart Conveyor Pendek/Atas Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-c3e6-4935-8a2b-eec29ea4f964', '9d9ccbf3-1ec9-4c70-a06c-344466de0f18', '2024-09-12', 'Sparepart Conveyor Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-c663-4091-9bbf-f18dc3bdd686', '9d9ccbf3-1f59-4e02-8e50-cc652906d02e', '2024-09-12', 'Sparepart Moulding Ukuran 1 Cm Cetak Tablet MKS-TBL11', 'MKS-TBL11', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-c8c8-479a-aa68-dbc0194a4be4', '9d9ccbf3-1fe7-4159-8df3-ceb05d522a5c', '2024-09-12', 'Sparepart PCB Tetas Telur AGR-TT96 Versi Lama', 'AGR-TT96', 0, 0, 2, 2, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-cb58-4f61-a52a-3e5c82004818', '9d9ccbf3-2071-4a4e-b9e3-b66648eaa8a1', '2024-09-12', 'Sparepart Pisau Penyerut Tusuk Sate Uk 4 mm ST-103 HS', 'ST-103', 0, 0, 10, 10, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-cdc1-458c-866a-455725aecee2', '9d9ccbf3-2105-4bfc-b606-f6afc4d762e5', '2024-09-12', 'Sparepart Roda (Hidup) Per-PCS Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-d038-49cf-bdf6-60ef73b7ca0c', '9d9ccbf3-21a1-4f95-8bd2-108596253e2a', '2024-09-12', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-400', 'GRILLO-400', 0, 0, 2, 2, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-d2e2-4d56-81f8-387fda1d859d', '9d9ccbf3-2231-4ae6-9eae-7126a2c0294c', '2024-09-12', 'Sparepart Sisir Cetak Mie MKS-220SS', 'MKS-220SS', 0, 0, 2, 2, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-d553-444f-9c39-92f67d3ae96d', '9d9ccbf3-22bd-42c2-9747-285f6cb7552c', '2024-09-12', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-GS10', 'Grillo-GS10', 0, 0, 2, 2, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-d872-461d-9bef-e9157fd9933f', '9d9ccbf3-234c-4db9-b9f4-b4730198822e', '2024-09-12', 'Sparepart Heating Element MSP-300I', 'MSP-300i', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-dae3-4ef4-a7ce-0cabb2a923bf', '9d9ccbf3-23f9-43b1-8169-c6184057dc56', '2024-09-12', 'Sparepart Kain Teflon MSP-300i', 'MSP-300i', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-dd2d-4629-9b7c-7ef9786f1f28', '9d9ccbf3-249f-472b-9db7-1537faa12804', '2024-09-12', 'Sparepart Pisau 4mm Vegetable Cutter MKS-CT100', 'MKS-CT100', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-dfb0-4b3f-beca-897c441ec258', '9d9ccbf3-2531-4ef3-b5a5-92c3c2242045', '2024-09-12', 'Sparepart Keramik Humidifier Tetas Telur AGR TT360', 'AGR-TT360', 0, 0, 2, 2, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-e1ff-48cf-bfdd-18688886880f', '9d9ccbf3-2611-4a69-8cda-b46acb0f6d84', '2024-09-12', 'Sparepart Rak 1 Set Tetas Telur AGR-TT360', 'AGR-TT360', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-e428-46e1-804a-7f3b96e84e1e', '9d9ccbf3-26a2-4f23-aa96-a4634b5d0615', '2024-09-12', 'Sparepart Screw Giling Daging MHW-120', 'MHW-120', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-e691-4c22-8d1c-a5a5ef57fa2c', '9d9ccbf3-2738-4932-a8f0-1a5b51853ff7', '2024-09-12', 'Sparepart Penjepit Cetak Bakso MKS-MFC280', 'MKS-MFC280', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-e8cc-4d78-b5b3-76c857e36577', '9d9ccbf3-27d3-4e1a-9afd-c6ff4a7b966b', '2024-09-12', 'Sparepart Ring Cup Sealer Uk. 88mm 10-16 Oz CPS-959', 'CPS-959', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54');
INSERT INTO `tb_stok_barang` (`id_stok`, `id_barang`, `tanggal`, `nama_barang`, `tipe_barang`, `barang_masuk`, `barang_keluar`, `stok_awal`, `stok_akhir`, `posisi`, `keterangan`, `created_at`, `updated_at`) VALUES
('9d9ccc06-eb4a-421f-bc7d-4e8dfb6173d6', '9d9ccbf3-286d-4b19-aa29-51ce904801c1', '2024-09-12', 'Sparepat Per Cetak Bakso MKS-MFC280', 'MKS-MFC280', 0, 0, 2, 2, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-edaf-4b96-b7ff-44543097bc6c', '9d9ccbf3-28f8-4c6d-bbed-187c12ed4dde', '2024-09-12', 'Baut pengunci kecil cetak mie', 'MKS-150B', 0, 0, 4, 4, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-f008-4228-83c4-3a21d6ea991b', '9d9ccbf3-2988-4354-82fa-6b2cfcd7c721', '2024-09-12', 'Sparepart penutup bawah eggroll ERG-001,ARD-202,ARD-404', 'ERG-001', 0, 0, 11, 11, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-f27b-4c58-91c1-b41c83c9520a', '9d9ccbf3-2a19-433e-a5bc-b9ef8a195117', '2024-09-12', 'Sparepart Ring moulding Uk.66mm 8 oz CPS-959', 'CPS-959', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-f4f1-413c-ba6d-4f610d6b7617', '9d9ccbf3-2acf-4658-a8e6-7a5ea8508054', '2024-09-12', 'PCB KZB-1', 'PCB KZB-1', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-f791-4283-869f-8ad63ef50e23', '9d9ccbf3-2b64-4402-9efe-32d140fffc67', '2024-09-12', 'Sparepart corong atas perajang rumput AGR-CH400B', 'AGR-CH400B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-f9b1-4a69-bd68-07c3b4e198a0', '9d9ccbf3-2bf2-48bb-b174-2742b23d512f', '2024-09-12', 'Pisau penyerut mesin giling daging MHW-G51B/Kecil', 'MHW-G51B/Kecil', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-fbb7-4572-9452-6724d78f11d5', '9d9ccbf3-2c7e-4a5d-b5bc-6ce3cbb67439', '2024-09-12', 'Sparepart Tray Food Dehidrator ARD-PM99', 'ARD-PM99', 0, 0, 5, 5, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-fdb9-4d75-a6b5-1dbe607d8056', '9d9ccbf3-2d0b-4e85-807e-fa6f89d485be', '2024-09-12', 'Sparepart Pully Kecil Cetak Mie MKS-220SS', 'MKS-220SS', 0, 0, 0, 0, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc06-ffe3-4e24-a5ef-7a9bff6f9271', '9d9ccbf3-2da1-4def-84be-2d23cf7f2d81', '2024-09-12', 'Sparepart Tombol Emergency Mixer Planetary MKS-20B/30B', 'MKS-20B/30B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc07-020a-4255-b314-c9c5b602e2b5', '9d9ccbf2-ab35-40f1-93c6-44133844ab59', '2024-11-25', 'Mesin Universal Fritter', 'MKS-UV44', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc07-042c-4c53-b2e3-6ed4ace8d5e4', '9d9ccbf2-ab35-40f1-93c6-44133844ab59', '2024-11-25', 'Mesin Universal Fritter', 'MKS-UV44', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-11-30 11:53:54', '2024-11-30 11:53:54'),
('9d9ccc34-b164-44a4-9cdb-4e5fc7585b5f', '9d9ccbf2-ab35-40f1-93c6-44133844ab59', '2024-11-30', 'Mesin Universal Fritter', 'MKS-UV44', 0, 15, 50, 35, 'Rak-1', 'stok', '2024-11-30 11:54:24', '2024-11-30 11:55:36'),
('9d9ccc4c-4089-464a-8542-c55c6b3277fc', '9d9ccbf2-ae08-47f7-9d3e-5887d7450f5a', '2024-11-30', 'Mesin Pencabut Rumput', 'AGR-PR238', 0, 25, 50, 25, 'Rak-1', 'stok', '2024-11-30 11:54:40', '2024-11-30 11:56:37'),
('9d9ccc63-83db-4b8a-b876-e9392b9e2f1c', '9d9ccbf2-ae98-4d92-b37b-480dc18c571f', '2024-11-30', 'Mesin Dough Mixer', 'MKS-DMIX002', 0, 35, 50, 15, 'Rak-1', 'stok', '2024-11-30 11:54:55', '2024-11-30 11:58:07'),
('9d9ce24a-296c-44b6-b4ed-ec71d860e27f', '9d9ccbf2-b0fc-44f4-a488-077c624e0e7b', '2024-11-30', 'Mesin Cetak Mie', 'MCM-150', 0, 1, 2, 1, 'Gudang-Lt1', 'stok', '2024-11-30 12:56:09', '2024-11-30 12:56:09'),
('9d9ce923-861a-4fca-8350-0b86ad418011', '9d9ccbf2-b176-45a0-b74f-3c48d233681d', '2024-11-30', 'Mesin Coffe Espresso', 'MKS-MKP60', 0, 1, 1, 0, 'Gudang-Lt1', 'stok', '2024-11-30 13:15:18', '2024-11-30 13:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `tb_top_product`
--

CREATE TABLE `tb_top_product` (
  `id_top_product` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_barang` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_top_product`
--

INSERT INTO `tb_top_product` (`id_top_product`, `id_barang`, `tanggal`, `kode_barang`, `nama_barang`, `tipe_barang`, `total_barang`, `created_at`, `updated_at`) VALUES
('9d9ccca1-e777-47b5-86e9-57f05b35c710', '9d9ccbf2-ab35-40f1-93c6-44133844ab59', '2024-11-30', '654654', 'Mesin Universal Fritter', 'MKS-UV44', 15, '2024-11-30 11:55:36', '2024-11-30 11:55:36'),
('9d9cccff-3dab-4a4d-ac7f-1340af106f04', '9d9ccbf2-ae08-47f7-9d3e-5887d7450f5a', '2024-11-30', '654654', 'Mesin Pencabut Rumput', 'AGR-PR238', 25, '2024-11-30 11:56:37', '2024-11-30 11:56:37'),
('9d9ccd89-0ead-418b-bd54-7c4e9dcac3cb', '9d9ccbf2-ae98-4d92-b37b-480dc18c571f', '2024-11-30', '654', 'Mesin Dough Mixer', 'MKS-DMIX002', 35, '2024-11-30 11:58:07', '2024-11-30 11:58:07'),
('9d9ce24a-2bfa-47f6-9a3b-effce1f2ea55', '9d9ccbf2-b0fc-44f4-a488-077c624e0e7b', '2024-11-30', '654', 'Mesin Cetak Mie', 'MCM-150', 1, '2024-11-30 12:56:09', '2024-11-30 12:56:09'),
('9d9ce923-885d-4a78-8827-fc3b2c86fcd3', '9d9ccbf2-b176-45a0-b74f-3c48d233681d', '2024-11-30', '654654', 'Mesin Coffe Espresso', 'MKS-MKP60', 1, '2024-11-30 13:15:18', '2024-11-30 13:15:18');

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
  `harga_barang` decimal(12,2) NOT NULL,
  `posisi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pembayaran` enum('belum lunas','lunas') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'belum lunas',
  `status_transaksi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dana_pertama` decimal(12,2) NOT NULL,
  `pembayaran` decimal(12,2) NOT NULL,
  `diskon` int NOT NULL,
  `total_pembayaran` decimal(12,2) NOT NULL,
  `selisih_pembayaran` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_transaksi_penjualan`
--

INSERT INTO `tb_transaksi_penjualan` (`id_transaksi`, `id_barang`, `id_stok`, `tgl_transaksi`, `kode_transaksi`, `nama_konsumen`, `no_handphone`, `alamat`, `nama_sales`, `kode_barang`, `nama_barang`, `tipe_barang`, `jumlah_barang`, `harga_barang`, `posisi`, `status_pembayaran`, `status_transaksi`, `dana_pertama`, `pembayaran`, `diskon`, `total_pembayaran`, `selisih_pembayaran`, `created_at`, `updated_at`) VALUES
('9d9ccca1-e20c-4f42-8133-283c53114f99', '9d9ccbf2-ab35-40f1-93c6-44133844ab59', '9d9ccc34-b164-44a4-9cdb-4e5fc7585b5f', '2024-11-30', 'Do.090.898dddss', 'Randi', '081270160332', 'Jl.Sumatera. RT 05. RW 12. Kec.Tenayan Raya. Kel.Sialangsakt', 'Tia Saputri', '654654', 'Mesin Universal Fritter', 'MKS-UV44', 15, '2090000.00', 'Rak-1', 'lunas', 'tunai', '0.00', '31350000.00', 0, '31350000.00', '0.00', '2024-11-30 11:55:36', '2024-11-30 11:55:36'),
('9d9cccff-381f-4225-9d20-ec5d2a43a43a', '9d9ccbf2-ae08-47f7-9d3e-5887d7450f5a', '9d9ccc4c-4089-464a-8542-c55c6b3277fc', '2024-11-30', 'Do.090.89811', 'tiadss', '081270160332', 'Jl.Sumatera. RT 05. RW 12. Kec.Tenayan Raya. Kel.Sialangsakt', 'Ade Yolanda', '654654', 'Mesin Pencabut Rumput', 'AGR-PR238', 25, '4420000.00', 'Rak-1', 'lunas', 'tunai', '0.00', '110500000.00', 0, '110500000.00', '0.00', '2024-11-30 11:56:37', '2024-11-30 11:56:37'),
('9d9ccd89-09de-4245-aacd-a8c772567eb6', '9d9ccbf2-ae98-4d92-b37b-480dc18c571f', '9d9ccc63-83db-4b8a-b876-e9392b9e2f1c', '2024-11-30', 'Do.090.898dddss', 'Randi', '081270160332', 'Jl.Sumatera. RT 05. RW 12. Kec.Tenayan Raya. Kel.Sialangsakt', 'Rahmat Hidaya', '654', 'Mesin Dough Mixer', 'MKS-DMIX002', 35, '2650000.00', 'Rak-1', 'lunas', 'tunai', '0.00', '92750000.00', 0, '92750000.00', '0.00', '2024-11-30 11:58:07', '2024-11-30 11:58:07'),
('9d9ce24a-24f1-4baa-b8dd-89a6f34eb89c', '9d9ccbf2-b0fc-44f4-a488-077c624e0e7b', '9d9ccc05-cd10-4d9f-93e6-9f4994f0510f', '2024-11-30', 'Do.090.89811', 'loki', '081270160332', 'Jl.Sumatera. RT 05. RW 12. Kec.Tenayan Raya. Kel.Sialangsakt', 'Rahmat Hidaya', '654', 'Mesin Cetak Mie', 'MCM-150', 1, '330000.00', 'Gudang-Lt1', 'lunas', 'tunai', '0.00', '330000.00', 0, '330000.00', '0.00', '2024-11-30 12:56:09', '2024-11-30 12:56:09'),
('9d9ce923-82cc-476c-8ea4-7ed517c09223', '9d9ccbf2-b176-45a0-b74f-3c48d233681d', '9d9ccc05-cf05-4832-878d-2b583b6a7d22', '2024-11-30', 'Do.090.898dddss', 'xse', '081270160332', 'Jl.Sumatera. RT 05. RW 12. Kec.Tenayan Raya. Kel.Sialangsakt', 'Rahmat Hidaya', '654654', 'Mesin Coffe Espresso', 'MKS-MKP60', 1, '10930000.00', 'Gudang-Lt1', 'lunas', 'tunai', '0.00', '10930000.00', 0, '10930000.00', '0.00', '2024-11-30 13:15:18', '2024-11-30 13:15:18');

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
('9d9ccbda-1c66-481f-a35c-19b84d1200d3', 'admin', 'admin@gmail.com', '2024-11-30 11:53:25', '$2y$12$wUlqXBaWO/Y5Z6oEA5iglOlcpu0.GQFZsL3vjjs9MsvrJcVme.UpO', 'admin', NULL, 'HtczljED7N', '2024-11-30 11:53:25', '2024-11-30 11:53:25');

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
-- Indexes for table `tb_top_product`
--
ALTER TABLE `tb_top_product`
  ADD PRIMARY KEY (`id_top_product`),
  ADD KEY `tb_top_product_id_barang_foreign` (`id_barang`);

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
-- Constraints for table `tb_top_product`
--
ALTER TABLE `tb_top_product`
  ADD CONSTRAINT `tb_top_product_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE;

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
