-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 06, 2024 at 12:34 AM
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
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(14, '2024_11_30_145124_create_tb_top_product', 1),
(15, '2024_12_04_154125_add_kode_barang_in_tb_barang_masuk', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `id_barang` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_barang` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `tipe_barang`, `harga_barang`, `created_at`, `updated_at`) VALUES
('9da64f65-127d-4ef5-a543-664425d38e13', 'Mesin Universal Fritter', 'MKS-UV44', '2090000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-16a4-455e-b2a9-57127c063b57', 'Mesin Cup Sealer', 'CPS-10A', '4980000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-191e-48f5-a5aa-bbd4253d8a96', 'Mesin Cetak Mie', 'MKS-140', '1780000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-1ae4-4e3e-a697-40a70beda7b0', 'Mesin Pencabut Rumput', 'AGR-PR238', '4420000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-1c82-40c8-94d0-415f9e1f57c4', 'Mesin Dough Mixer', 'MKS-DMIX002', '2650000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-1dea-43db-b6c7-df589f0ca8db', 'Mesin Cetak Mie', 'MKS-180SS', '4370000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-2093-4f2b-9b0d-1f75c207c38c', 'Mesin Food Dehidrator', 'ARD-PM99', '820000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-222c-4bd5-b025-11d6c17eec6f', 'Mesin Cetak Pelet', 'MKS-PLT25', '6490000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-23a8-4d66-9209-ea88e895339f', 'Alat Sauce Pan/Ssauce Dispenser', 'MKS-SU-01', '1490000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-2581-4084-9c77-13531affaa17', 'Mesin Cetak Mie', 'MCM-150', '330000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-26fd-4857-9462-d6158e7681ac', 'Mesin Coffe Espresso', 'MKS-MKP60', '10930000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-2882-43b7-a164-79d177c8e9f2', 'Alat Giling Daging manual', 'MKS-SG10', '1450000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-29ee-48e3-a932-f7dd76be1042', 'Mesin cetak Mie Manual', 'MKS-150B', '1010000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-2bc4-409b-bc87-3d45db860f84', 'Mesin Cetak Mie', 'MKS-200', '3090000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-2d8b-4ef9-b911-cccf91a3275d', 'Alat Pemotong Kerupuk Lontong manual', 'AGR-LTG22', '2430000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-2f2b-48ec-a9df-51ef7e62b850', 'Mesin Waffle Maker', 'MKS-WF48', '7610000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-3093-4a92-befe-37df21acea2d', 'Mesin Electric Kettle', 'KTL-DBL2', '330000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-3300-4dd7-acb6-fa63035c9597', 'Mesin electric Kettle', 'ARD-KT12', '540000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-34ee-422c-b418-430d746b0352', 'Mesin Coffe Grinder', 'MKS-GRD60A', '5610000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-3676-4908-b56a-99dc93975c76', 'Mesin Coffe Bean Grinder', 'MKS-CG50', '180000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-3859-418b-aaf1-5a64d8cbc306', 'Mesin Pemipil Jagung', 'PPJ-001', '1880000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-3a1b-4ad2-b0bc-53a727d423b1', 'Alat Cetak Mie dan Pasta', 'CM-2020', '190000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-3c01-4b54-aa38-1828ecf3bad5', 'Mesin Giling Daging', 'MHW-120', '4180000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-3d73-4c68-9248-050e29db8fc0', 'Mesin Pemanggang', 'MKS-111BBQ', '1010000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-3f70-44fa-8400-08ed4a8a5295', 'Mesin Big Smoker', 'MKS-BLS002', '1900000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-4101-4e93-9316-1314992a48ae', 'Mesin Tetas Telur', 'AGR-TT32', '2170000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-4289-4c94-858f-6125c22aa4f6', 'Mesin Cetak Mie', 'MKS-160SS', '4370000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-440c-4794-a870-b47f829b90bf', 'Mesin Stik Wafel', 'MKS-HDW5', '2050000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-460d-49ca-9bec-4b5f2109f689', 'Mesin Pemanggang', 'MKS-369BBQ', '1130000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-47df-4e3e-81cc-cdd3f1465b79', 'Mesin Pemanggang', 'MKS-222BBQ', '1440000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-4945-47a6-b401-3f52222e887f', 'Mesin Mixer Planetary', 'MKS-B5A', '6980000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-4b07-4d33-a521-1483ef46b402', 'Foot Sealer', 'FRP-600', '1300000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-4d9f-4445-a8be-42bf911dfc3b', 'Foot Sealer', 'FRP-400', '1110000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-4f20-40ca-93f6-180df6443d13', 'Mesin egg Roll', 'MKS-ERG001', '2070000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-50ad-4408-a54f-24ef102e5cc5', 'Mesin Dough Devider', 'MKS-BA80', '19240000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-5232-43a9-81bc-410bdf09805a', 'Mesin Pemipil Jagung', 'AGR-CORN9', '390000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-5602-4ac5-a8a8-36ab9bf3c408', 'Mesin Gas Deep Fryer', 'MKS-G75', '6780000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-588b-4909-b521-fdf210d23d36', 'Mesin Gas Deep Fryer', 'MKS-G20L', '4500000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-5a9b-40d7-82f3-cf4253b69d72', 'Mesin Gas Deep Fryer', 'MKS-72', '2810000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-5bff-488c-b974-c3f8ac72788f', 'Mesin Ice Cream', 'ISC-16', '15470000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-5d89-4ccc-9a44-04b0fb0fbad7', 'Mesin Tortiila', 'MKS-TRT11', '7230000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-5f09-45ca-869b-b18897e74aa7', 'Mesin Dough Devider', 'MKS-DD15M', '1130000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-619f-4c9e-a34f-d3c0723db188', 'Alat Churros', 'MKS-CRS05', '6880000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-6333-4b25-a9d7-8473d6918238', 'Mesin Hand Sealer', 'FS-1000', '1640000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-64d8-462d-9a69-e63a433c768f', 'Mesin Continious Band Sealer', 'SF-150W', '6180000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-675f-4822-a545-7bf8f1b5d23e', 'Mesin Pemotong Tulang Manual', 'MKS-PTT38', '6520000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-68f7-4bea-b526-8b662ac76f40', 'Mesin Continious Band Sealer', 'FR-900W', '4980000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-6a98-4043-b82b-374a494dbefc', 'Alat Peras Jeruk Manual', 'MKS-MJ1001', '670000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-6bfc-46b9-96fb-1f40b81217d7', 'Meat Slicer Pengiris Daging', 'MKS-70', '1850000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-6e1d-4875-90da-1177573918e5', 'Ice Crusher', 'MKS-002', '970000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-6f89-43f2-96aa-4ff68bb343ca', 'Miller', 'MKS-ML200', '1330000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-711c-43d9-b081-0b9bdea7b1cb', 'Mesin Takoyaki Gas', 'MKS-711B', '1370000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-728b-4172-84e3-06d8759df6dd', 'Mini Coffe Roster', 'CRG-400', '3100000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-7470-45f3-997c-5b274e63cad6', 'Cup Sealer', 'CPS-959', '1400000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-75db-41ba-9b37-c7722ad2d2a3', 'Ice Crusher', 'MKS-CRS30', '1550000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-7767-4c00-93f4-736894467b16', 'Mesin Stand Mixer', 'ARD-MR7', '6100000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-78d7-4bd9-9235-3481b2a92716', 'Mesin Cetak Mie', 'MKS-145', '2010000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-7b24-4844-addd-2f9fd622f8c5', 'Mesin Mixer Spiral', 'MKS-SP50', '16860000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-7cbd-4aea-9e9c-77c817fdeaeb', 'Oven Roti Gas 1 Loyang', 'MKS-RS11', '8280000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-7e2b-4b0b-a6a2-ef37a33614f2', 'Penetas Telur', 'AGR-INC24', '3500000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-7ff2-4503-9424-193d577c0b14', 'Penetas Telur', 'AGR-TT7', '540000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-8255-4f1a-9c7b-153e7da9ad08', 'Penetas Telur', 'AGR-TT4', '480000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-849b-4e51-97f7-ba6121921735', 'Mesin Soft Ice Cream', 'MKS-ICM-119', '15680000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-8792-42e0-b39f-ee32f975e733', 'Mesin Dough Mixer', 'MKS-DG15', '8070000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-8a7f-48e3-bf1f-452c973040ad', 'Mesin Cetak Mie', 'MKS-350', '7740000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-8c78-44d2-b9aa-c34d4d3bb303', 'Mesin Serutan Es Salju', 'MKS-ICE28', '5680000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-8f49-44a9-b635-531a2f099e8b', 'Mesin Perajang Keripik', 'MKS-CT100 A', '8960000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-90e9-4538-b68b-63c2c681fe60', 'Pengupas Nanas Industri', 'MKS-PN60', '5600000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-928e-4b98-bb6e-a9094feabea4', 'Mesin Mixer Planetary', 'MKS-10B', '8110000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-949d-4cce-8467-9a0a9b90ebf1', 'Mesin Mixer Planetary', 'MKS-BK20M', '10310000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-9682-4d01-b07d-c42bf5711c37', 'Oven Listrik', 'ARD-EO33', '1380000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-9831-44da-b23f-de69962d1c3d', 'Bread Maker', 'ARD-BM55X', '1850000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-9a62-4391-a3fb-41cdbf514cab', 'Ice Crusher', 'MKS-CRS30L', '1530000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-9c53-42b3-9e33-7279816ffbae', 'Timbangan Digital', 'TBG-3', '200000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-9e3e-4934-92af-4ed939f7875e', 'Timbangan Digital', 'TBG-1', '110000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-a03a-4d97-bc9e-988fad3729d6', 'Timbangan Digital', 'TBG-5', '200000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-a30c-47d1-b646-6ef2ecf085c3', 'Timbangan Digital', 'TBG-10', '170000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-a4cc-41a3-ac8f-85f11b9c58e0', 'Cetak Sosis Telur Listrik', 'ARD-404', '300000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-a677-4348-8981-529573d60fdf', 'Cetak Sosis Telur Listrik', 'ARD-202', '170000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-a940-4bb9-9bb3-b1015aa5898d', 'Cetak Sosis Telur Listrik', 'ARD-303', '180000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-aaae-4abd-861b-85ea7bbd527b', 'Cetak Sosis Telur Listrik', 'ARD-505', '490000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-ac83-48f4-aef8-c33f270a67fc', 'Cetak Sosis Telur Listrik', 'GRILLO-400', '1090000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-aec7-4d87-bd21-97a593ba397f', 'Blender', 'MKS-BLD 1,5L', '470000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-b026-4b9e-97fd-166a8c3062d0', 'Pemanas Air', 'BT-119', '170000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-b1af-4c9a-b9a7-32667a5433df', 'Peras Jeruk', 'ARD-J22', '240000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-b32a-405d-88b5-658b2656421d', 'Ice Krim Buah', 'ICE-01', '540000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-b524-4caa-9bcd-a52363fb6cca', 'Long Potato', 'MKS-LPCT50', '1590000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-b691-44cd-97e1-5cafc5104ec2', 'Giling Daging', 'MHW-G31B', '960000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-b882-4cd7-8a80-d78e1af3340c', 'Giling Daging', 'MHW-G51B', '1110000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-bacb-48da-b7ed-2b427e780279', 'Mangkok', 'ICE BARREL', '390000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-bd28-403e-a5bc-96f83c4bbc95', 'Display Warmer', 'MKS-DW66', '5450000.00', '2024-12-05 05:23:41', '2024-12-05 05:23:41'),
('9da64f65-bf8f-498b-8776-62112df3baf2', 'Lafira', 'LAFIRA', '7410000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-c25b-4645-8d04-397190717a31', 'Pemotong keripik tempe', 'MKS-JT04', '460000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-c49f-45ac-a5df-fa0291cfc68b', 'Mesin Gelas Kesehatan', 'ARD-CP5', '550000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-c626-4aa9-bf89-9bb3f1d17228', 'Ice Crusher', 'MKS-CRS20', '1100000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-c849-41a9-9f22-714fcf50616b', 'Chopper', 'ARD-FC300', '690000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-ca2e-468f-b984-725dd122e928', 'Chopper', 'ARD-FC200', '500000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-cc01-4149-8f2d-022e24bc56c2', 'Pemanggang', 'ARD-GRL77', '710000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-ce21-4c82-9bc2-62aaf1fb71a6', 'Kentang Spiral', 'TP-200', '530000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-cfcc-483b-adab-9b2910209a6f', 'Alat Pengiris Kentang Spiral', 'MKS-PSS44', '150000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-d1b6-4b52-b269-d0fe1255296c', 'Alat Pengiris Apel', 'MKS-APL88', '190000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-d36d-4d70-8374-21667eb99c71', 'Alat Cetak Long Potato', 'MKS-LPCT30', '790000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-d5e2-459a-8c7e-1059efc57750', 'Alat Cetak Long Potato', 'MKS-MER2', '310000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-d7ef-4fa6-8f65-31d55c1c3d7d', 'Alat Cetak Sate Telur Puyuh', 'ARD-TKY16', '230000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-d9c6-49ac-b744-b33ba32cb027', 'Mesin penepung Herba, Farmasi dan biji', 'MKS-ML100', '790000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-dc5f-466d-a7bd-9d4f2c417f80', 'Mesin Kopi Espresso', 'MKS-MKP50', '2450000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-de84-4cda-b64e-848811a01a4d', 'Mesin Grinder kopi', 'MKS-GRD80A', '3850000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-e073-43f5-9aed-6228fc9f5cda', 'Mesin Penggiling Kopi', 'MKS-600B', '1250000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-e2b6-4233-af2a-c6898c48ab9c', 'Mesin Deep Fryer Gas', 'MKS-71', '1540000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-e4f2-44dd-9887-97b7602650e3', 'Mesin Pembuat Sosis Telur', 'MKS-ERG002', '2930000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-e707-455c-9891-612a8ae1ac01', 'Mesin Egg Roll', 'GRILLO-GS10', '2570000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-e938-45f9-9719-9a0bd2f2156d', 'Mesin Egg Roll', 'GRILLO-GS6', '2120000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-eb1a-477c-a9e9-20350682ec48', 'Mesin Egg Roll', 'MKS-ERG444', '1550000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-ed43-4f7d-862d-2b769bf47d47', 'Alat Manual Meat Slicer', 'MKS-MSl66', '850000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-efb3-46e1-b903-4bc61de5c59a', 'Mesin Cetakan Donat', 'MKS-DN60', '3160000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-f213-48bc-97f3-e2bdaf1d637b', 'Mesin Hot Dog Wafel', 'MKS-HDW6', '2510000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-f531-4596-9bcf-fbb108022a13', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', '2280000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-f7b9-40c8-afa8-e24f0a1ad4d7', 'Mesin Takoyaki Listrik', 'MKS-700E', '1480000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-f99a-4a85-81ad-84c1c7397525', 'Mesin Waffle Taiyako', 'MKS-ETYK3', '4750000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-fb65-4a41-a43e-5e68af2f6564', 'Mesin Perajang Sayur dan Buah', 'MKS-VGT65', '880000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f65-fe30-4d1c-a999-3f062054bacc', 'Mesin Slot Toaster', 'MKS-D06', '1680000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-0033-4d58-9d7a-8ddc35a1a3be', 'Cetak Mie dan Pasta', 'ARD-NM4', '2000000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-01dd-4bf3-8e30-e156793e7eb0', 'Mesin Hand Sealer', 'MSP-400A', '880000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-0431-4f56-a29d-0610598a01ff', 'Mesin Hand Sealer', 'MSP-300A', '700000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-062c-4a1b-af06-e6bddd6d8e61', 'Mesin Hand Sealer', 'MSP-200I', '370000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-085d-4cfe-a12f-f7564a7503d3', 'Mesin Hand Sealer', 'MSP-200A', '490000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-0b25-42e7-ac89-06e4f3f10867', 'Mesin Hand Sealer', 'MSP-300i', '600000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-0d6c-4573-a5bb-16fc4ba4fa3b', 'Mesin Vacum Sealer', 'MSP-DZ280A', '1410000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-1010-4d34-9cdb-7e9960ebb128', 'Mesin Vacum Sealer', 'MSP-290E', '1430000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-1221-43e7-88a5-d017e4dc7e51', 'Mesin Vacum Sealer', 'MSP-VS02', '1190000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-144b-4c81-9909-72a63131981c', 'Mesin vakum food sealer', 'ARD-VC85', '310000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-16d2-47a8-92d6-a796d065f3ee', 'Mesin vakum sealer', 'ARD-VS01', '1760000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-1898-4454-892d-b4881aebddd0', 'Mesin Hand Printer', 'HP-351', '1620000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-1a94-4237-ae8d-dc34b8b52e25', 'Alat Cetak Sosis Horizontal', 'MKS-3V', '2490000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-1cc1-4406-81ca-57d53c9e86f1', 'Alat Cetak Sosis Vertikal', 'MKS-3H', '2270000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-1efc-425f-a404-a3061aaa4d09', 'Mesin Pengupas Bawang Putih', 'AGR-BWG180', '2550000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-20a8-4716-8ceb-d4bbcf8e6ef8', 'Mesin Giling Daging', 'MHW-80', '3820000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-22e9-417d-80fe-de0b902f0d4f', 'Mesin Giling Daging', 'MHW-220', '5720000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-255e-4f1d-a142-17099c89de99', 'Mesin Pemanggang', 'MKS-PG4', '2180000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-271c-4f51-9b5c-2dbd1592944c', 'Mesin Pemanggang', 'MKS-PG2', '1700000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-28f4-4d22-ba8f-7e0a223238d2', 'Mesin Egg Waffle Listrik', 'MKS-EW06', '1730000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-2bc3-4958-bd3d-d09cf1ace376', 'Mesin Egg Waffle Gas', 'MKS-GW07', '1750000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-2d5f-4408-981a-5acb4934a2cf', 'Mesin Cone Bakar', 'MKS-CB1', '2080000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-2f53-49c4-9107-aeee9d9424db', 'Mesin Universal Fritter', 'MKS-UV22', '1370000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-3172-4d2e-9d72-142a9ebaa35b', 'Alat Perajang bawang manual', 'PRJ-BM', '510000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-3336-4189-b4d8-d450fc76dc93', 'Alat Perajang singkong manual', 'PRJ-M', '540000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-34f1-4f71-afaa-6a8c07df8406', 'Mesin Pembuat Gulali', 'MKS-CT76', '4630000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-36f5-482b-bf33-d06840ab4105', 'Cup Sealer', 'CPS-919', '1400000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-38d4-4ea4-b8e4-98564077d269', 'Cup Sealer', 'CPS-818', '1180000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-3a93-48d2-a4b4-6e4eba83d6e9', 'Hand Sprayer (Semprotan)', 'SPR-16', '610000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-3c48-4b1d-a148-0e2c0e1be24b', 'Mesin Pemanggang Grill', 'ARD-GRL88', '530000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-3ed2-46e2-b39b-2cbfb9e40b95', 'Mesin Cetak Mie', 'MKS-160', '2590000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-4061-4edb-a562-bf090e10d3d9', 'Teko Listrik Stainless', 'ARD-KT11', '530000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-4232-4741-8c6a-c6f9e3a98a3d', 'Mesin Water Boiler', 'MKS-D30', '2540000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-4524-4695-8975-ae5d9471692d', 'Dough Mixer', 'MKS-DIMX002', '3650000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-46a9-4948-a060-4a6336f7964a', 'Mesin Cetak Mie', 'MKS-220SS', '3390000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-4867-47b5-a519-16630946668b', 'Mesin Penutup Botol Manual', 'MKS-BT31', '2740000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-4a91-42af-b79d-1d14c9d57875', 'Hand Sealer', 'FS-600', '1290000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-4c60-4148-8827-114010b4c815', 'Mesin Cup Sealer', 'CPS-9A', '1710000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-4e21-4561-a052-46dab2198f55', 'Mesin Sosis Telur (Listrik)', 'MKS-ERG005', '3140000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-4faf-4482-8cc5-2f25e1588669', 'Mesin Ice Crusher', 'MKS-003', '1730000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-5209-40e4-9c35-7cb1436ba98f', 'Mesin Sosis Telur (Gas)', 'MKS-ERG007', '3420000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-53c3-46f8-bd0c-e91607637ca2', 'Mesin Tetas Telur', 'AGR-TT24', '2010000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-55d3-4bbe-9a87-5a00628f292d', 'Mesin Tetas Telur', 'AGR-TT24A', '1970000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-5897-43ab-b026-d83a05a61dd9', 'Mesin Tetas Telur', 'AGR-TT96', '2350000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-5abc-4914-9ede-907e2ca664b9', 'Mesin Filling Cairan Otomatis', 'MSP-F50', '2180000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-5cbb-4446-877c-e10b421e4f67', 'Rok Espresso', 'Rok Espresso', '3580000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-5fc4-402e-9559-8038aee50bd8', 'Mesin Standing Mixer', 'MKS-MIX130', '3340000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-61a6-438e-968b-536f6dc53069', 'Mesin Vacum Sealer', 'ARD-VS02', '1190000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-6353-4e10-a81d-f8b803505e70', 'Mesin Hand Sealer', 'MSP-400I', '880000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-65b6-491d-8165-12de57647ae4', 'Mesin Cetak Pelet Manual', 'PLT-10', '2140000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-6785-4578-bf83-6622ddda4453', 'Mesin Penepung Herbal, biji', 'MKS-ML300', '1870000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-690b-4f40-bb21-073474810257', 'Mesin Grinder Kopi', 'GRD-80A', '3850000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-6b1b-4e84-b2f5-73209f99cfe8', 'Mesin Kebab', 'MKS-KB01', '2600000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-6ce4-4386-99a0-1c6cac17bee0', 'Mesin Coklat Fountain', 'MKS-CC6', '6000000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-6ea6-43c1-a541-776189485660', 'Food Dryer', 'MKS-DR6', '2710000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-7084-47d4-95fc-acbe07bf30b4', 'Deep Fryer', 'MKS-82B', '2360000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-7355-4240-bb84-82710a1b39cb', 'Alat Penanam Biji-Bijian', 'ARD-SED01', '730000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-7502-4077-bf44-63c8fcf492c3', 'Alat Penanam Biji-Bijian', 'ARD-SED02', '830000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-76e1-4c63-8d7b-be9153015509', 'Mesin Bread Maker', 'ARD-BM66X', '2170000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-7952-4970-96cb-7a6f77c3eb19', 'Mesin Tetas Telur', 'AGR-TT56', '2660000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-7b12-45ba-80f4-4d3f13fd1152', 'Blender Komersial', 'MKS-BL10L', '3250000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-7cf1-4eae-ac4a-8e3e166431dd', 'Bread Toaster', 'MKS-D04', '1300000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-7ef4-4486-9ab0-82393074e426', 'Deep Fryer', 'MKS-51B', '1950000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-810a-4f08-b2c9-4c499462faaa', 'Deep Fryer', 'MKS-81', '800000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-82f4-49de-a270-c8c31126d56b', 'Deep Fryer', 'MKS-82', '1550000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-850d-4e73-82af-0872a2177a9b', 'Food Dryer', 'MKS-DR10', '4590000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-86ff-4e0d-8cf6-0d11de84a2c3', 'Deep Fryer', 'MKS-G20L +Keranjang', '4750000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-890c-42e0-aac9-c76e65bea1d2', 'Mesin Manual Meat Mixer', 'MKS-MM01', '2830000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-8b11-4f71-86dc-5a3737ae8ed0', 'Mesin Ice Tube', 'MKS-IM22', '3270000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-8ddf-47c3-872a-a3dab1cdd1ff', 'Mesin Takoyaki Gas', 'MKS-722B', '2120000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-902d-4366-9db8-6de2396004ab', 'Ice Cream Buah', 'ICE-01', '540000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-92ed-4edc-808e-47c576f7be63', 'Oven Listrik', 'ARD-E033', '1380000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-948a-4b8e-9ec4-278a4b1d99e7', 'Noodle Maker', 'ARD-NM4', '2000000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-9632-4592-9057-ca2a257acd8d', 'Mesin Egg Roll', 'MKS-ERG005', '3140000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-97ed-4531-9419-a12b0d9be0d4', 'Stand Mixer', 'ARD-MR7', '6100000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-9a2c-4855-b6c2-28ae777731db', 'Pemasak', 'KTl-DBL2', '330000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-9bf9-444e-9b4b-e26bb751e690', 'Deep Fryer', 'MKS-G20L', '4500000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-9daf-43eb-afaa-7dc01209fa37', 'Pemanggang', 'ARD-GRL88', '530000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-a075-40f7-8fc6-f13d1b8ee05a', 'Mesin Pembuat Kulit Pangsit', 'MKS-TRT11', '7230000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-a2a4-4311-883b-1b41d402c560', 'Mesin Food Dehydrator', 'ARD-PM99', '820000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-a449-4b00-87bf-37c1fe5cde9c', 'Mesin Giling Daging', 'MHW-G31B', '960000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-a6be-4040-8ff9-4a3097b7c775', 'Cup Sealer', 'CPS-10A', '4980000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-a898-4a6a-8280-8005ee0f4e10', 'Mesin Cetak Mie', 'MKS-150B', '1010000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-aa3e-47fb-99b4-fd0bcbe73ffb', 'Mesin Ice Crusher', 'MKS-CRS20', '1100000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-ac7b-4cda-97e7-377da9b61d9e', 'Penetas Telur', 'AGR-TT32', '2170000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-ae27-499c-87a3-655830e9e675', 'Mesin Mixer Dodol', 'MDL-10', '14400000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-afef-48e9-b97a-215998f6cd00', 'Mesin Pemarut Kelapa', 'PRT-50', '2540000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-b1bb-4996-968d-3e4c63e332be', 'Mesin Pemeras Santan', 'PS-15', '4280000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-b43d-4f1c-a403-161927257449', 'Mesin Food Dehidrator', 'MKS-DR10', '4590000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-b618-4802-9b86-4bb00ce0d562', 'Mesin Perajang 3 Bentuk', 'MKS-PRJ33', '2630000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-b807-4ba6-a3df-f31d88c898b7', 'Mesin Cetak Mie', 'MKS-CM180', '2020000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-bb0f-4044-9eae-1da919b23287', 'Mesin Cetak Mie Stainless', 'MKS-160SS', '4370000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-bd1b-4beb-b685-ac5b7c8cc4a6', 'Mesin Cetak Mie Stainless', 'MKS-240SS', '4010000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-bfa5-4e3a-9b32-cb8ac415a232', 'Mesin Cetak Mie', 'ARD-125', '1880000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-c1ae-405f-951a-3ef27b039329', 'Mesin Parut Kelapa', 'PRT-25', '340000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-c359-475a-98a2-8ca88212f2d0', 'Mesin Ice Tube', 'MKS-IM100', '26970000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-c520-48c9-b160-ff38d5e0d77e', 'Mesin Sosis Telur (Listrik)', 'GRILLO-400', '1090000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-c713-4641-8062-a0249147870a', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS6', '2120000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-c90a-4537-a61c-5369ecfa9fc6', 'Mesin Sosis Telur (Gas)', 'MKS-ERG002', '2930000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-caca-4c5f-8306-2fe93b3fc84a', 'Mesin Sosis Telur (Gas)', 'MKS-ERG444', '1550000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-ccfc-4013-8a3e-8ec690d95fd2', 'Mesin Ice Crusher', 'MKS-CRS30', '1550000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-cf4c-45fa-86af-f6770a51f2db', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS10', '2570000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-d18b-417f-bb67-632f99a1e3d4', 'Mesin Es Krim Buah', 'ICE-01', '540000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-d491-4cd0-8b92-3b697a5b9dba', 'Mesin Giling Daging', 'MHW-G51B', '1110000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-d6b3-4bb3-9e0d-44261115eacb', 'Mesin pencacah Bumbu Dapur', 'MKS-UV22', '1370000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-d882-4eb3-acd2-99274bbad057', 'Mesin Penepung Herbal, biji', 'MKS-ML100', '790000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-dae9-4772-9c12-f816219422b1', 'Pemanggang 2 Tungku', 'MKS-111BBQ', '1010000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-dcb1-4bf9-aec6-1aaecdab2b1a', 'Deep Fryer', 'MKS-72', '2810000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-dec7-4463-8c79-143fdaf274f0', 'Mesin Pemanggang Listrik', 'MKS-PG2', '1700000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da64f66-e178-4b89-8e43-de18ca2c6179', 'Manual Meat Slicer', 'MKS-MSL66', '850000.00', '2024-12-05 05:23:42', '2024-12-05 05:23:42'),
('9da6529d-d0f6-4226-a2c2-94022bb524fd', 'Sparepart Baut Saringan Susu Kedalai SKD-100B', 'SKD-100B', '25000.00', '2024-12-05 05:32:42', '2024-12-05 06:01:37'),
('9da6529d-da49-49f7-830e-f1801770ce7e', 'Sparepart Conveyor Pendek/Atas Pemipih Adonan MKS-DS88', 'MKS-DS88', '435000.00', '2024-12-05 05:32:42', '2024-12-05 06:00:34'),
('9da6529d-e100-4209-85bd-fe969f8d7424', 'Sparepart Conveyor Pemipih Adonan MKS-DS88', 'MKS-DS88', '435000.00', '2024-12-05 05:32:42', '2024-12-05 06:02:17'),
('9da6529d-e84c-4647-94e2-072a5dfe4b09', 'Sparepart Moulding Ukuran 1 Cm Cetak Tablet MKS-TBL11', 'MKS-TBL11', '1555000.00', '2024-12-05 05:32:42', '2024-12-05 06:09:10'),
('9da6529d-ef1b-437c-baf2-f374c40929df', 'Sparepart PCB Tetas Telur AGR-TT96 Versi Lama', 'AGR-TT96', '370000.00', '2024-12-05 05:32:42', '2024-12-05 06:03:57'),
('9da6529d-f556-4fca-8a3f-e3c23275cebe', 'Sparepart Pisau Penyerut Tusuk Sate Uk 4 mm ST-103 HS', 'ST-103', '80000.00', '2024-12-05 05:32:42', '2024-12-05 06:23:05'),
('9da6529d-fbfb-4ace-bc51-a732d94c2792', 'Sparepart Roda (Hidup) Per-PCS Pemipih Adonan MKS-DS88', 'MKS-DS88', '60000.00', '2024-12-05 05:32:42', '2024-12-05 06:19:27'),
('9da6529e-031e-4eef-8f51-06ff2096616a', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-400', 'Grillo-400', '90000.00', '2024-12-05 05:32:42', '2024-12-05 06:01:09'),
('9da6529e-0a2c-4cc9-8f3d-ab88cbeb5e9e', 'Sparepart Sisir Cetak Mie MKS-220SS', 'MKS-220SS', '80000.00', '2024-12-05 05:32:42', '2024-12-05 05:59:58'),
('9da6529e-1036-494d-9293-82a035d0679b', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-GS10', 'Grillo-GS10', '90000.00', '2024-12-05 05:32:42', '2024-12-05 06:02:43'),
('9da6529e-172d-490d-870b-7cb531df5222', 'Sparepart Heating Element MSP-300I', 'MSP-300I', '50000.00', '2024-12-05 05:32:42', '2024-12-05 06:10:13'),
('9da6529e-1ec0-49bf-a79c-5dcb22f378f9', 'Sparepart Kain Teflon MSP-300i', 'MSP-300I', '50000.00', '2024-12-05 05:32:42', '2024-12-05 06:22:39'),
('9da6529e-24b0-40a7-9bee-02e59387fd2c', 'Sparepart Pisau 4mm VegetableCutter MKS-CT100', 'MKS-CT100', '135000.00', '2024-12-05 05:32:42', '2024-12-05 06:08:04'),
('9da6529e-2b73-4afb-95d7-c1f9757fb3e0', 'Sparepart  Keramik Humidifier Tetas Telur AGR TT360', 'AGR TT360', '65000.00', '2024-12-05 05:32:42', '2024-12-05 06:09:45'),
('9da6529e-325e-40ed-9a5f-f355f68bd4f6', 'Sparepart Rak 1 Set Tetas Telur AGR-TT360', 'AGR TT360', '1000000.00', '2024-12-05 05:32:42', '2024-12-05 06:22:17'),
('9da6529e-3911-4068-bf57-47e4127da124', 'Sparepart Screw Giling Daging MHW-120', 'MHW-120', '330000.00', '2024-12-05 05:32:42', '2024-12-05 06:05:41'),
('9da6529e-3f4c-4655-83f2-24181bced320', 'Sparepart Penjepit Cetak Bakso MKS-MFC280', 'MKS-MFC280', '330000.00', '2024-12-05 05:32:42', '2024-12-05 06:20:37'),
('9da6529e-45d3-4869-aa42-6b4bffc42502', 'Sparepart Ring Cup Sealer Uk. 88mm 10-16 Oz CPS-959', 'CPS-959', '150000.00', '2024-12-05 05:32:42', '2024-12-05 06:07:18'),
('9da6529e-4bff-415a-8c3a-cc57bacc757c', 'Sparepat Per Cetak Bakso MKS-MFC280', 'MKS-MFC280', '330000.00', '2024-12-05 05:32:42', '2024-12-05 06:06:30'),
('9da6529e-52d1-41f2-abb7-a76781aa95ac', 'Baut pengunci kecil cetak mie', 'CM-180ss', '50000.00', '2024-12-05 05:32:42', '2024-12-05 06:16:53'),
('9da6529e-5852-416d-bb45-f992b3cbd61c', 'Sparepart penutup bawah eggroll ERG-001,ARD-202,ARD-404', 'ERG-001,ARD-202,ARD-404', '40000.00', '2024-12-05 05:32:42', '2024-12-05 06:13:47'),
('9da6529e-5d3b-4c6b-a1a8-f6cd51502cc9', 'Sparepart Ring moulding Uk.66mm 8 oz CPS-959', 'CPS-959', '150000.00', '2024-12-05 05:32:42', '2024-12-05 06:21:55'),
('9da6529e-620e-4426-855d-d73ecaafd7a1', 'PCB KZB-1', 'KZB-1', '1100000.00', '2024-12-05 05:32:42', '2024-12-05 06:21:12'),
('9da6529e-670d-4ab2-8374-9469ab6e1acd', 'Sparepart corong atas perajang rumput AGR-CH400B', 'AGR-CH400B', '80000.00', '2024-12-05 05:32:42', '2024-12-05 06:21:33'),
('9da6529e-6cce-4f59-94ea-e5b12365db8b', 'Pisau penyerut mesin giling daging MHW-G51B/Kecil', 'MHW-G51B/Kecil', '80000.00', '2024-12-05 05:32:42', '2024-12-05 06:11:37'),
('9da6529e-71e3-44af-90b2-e97a8d40d649', 'Sparepart Tray Food Dehidrator ARD-PM99', 'ARD-PM99', '80000.00', '2024-12-05 05:32:42', '2024-12-05 06:13:08'),
('9da6529e-76cd-4ccf-a3d6-34d0762285ac', 'Sparepart Pully Kecil Cetak Mie MKS-220SS/MKS-160/MKS-240SS/MKS-200', 'MKS-220SS/MKS-160/MKS-240SS/MKS-200', '60000.00', '2024-12-05 05:32:42', '2024-12-05 09:09:41'),
('9da6529e-7c6b-4ec3-83f4-0641b633333e', 'Sparepart Tombol Emergency Mixer Planetary MKS-20B/30B', 'MKS-20B/30B', '90000.00', '2024-12-05 05:32:42', '2024-12-05 06:04:52'),
('9da65bd1-a4d8-433f-bc65-3db1f41af518', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', '260000.00', '2024-12-05 05:58:25', '2024-12-05 05:59:06'),
('9da68e98-72d0-470e-93f8-226a95c52506', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', '100000.00', '2024-12-05 08:20:24', '2024-12-05 08:20:24'),
('9da68ed5-68dc-4210-ac27-39d36e426e9e', 'Sparepart Bearing 6205', 'ADT-SM20', '80000.00', '2024-12-05 08:21:04', '2024-12-05 08:21:04'),
('9da6ab0f-a6f3-4e68-bf7f-27dd55b0ed93', 'Sparepart Gear Kecil Besi 2CM Cetak Mie', 'MKS-135/MKS-140/MKS-145', '0.00', '2024-12-05 09:40:00', '2024-12-05 09:40:00'),
('9da6ab74-a15d-4edb-9282-7a7fe091984c', 'Sparepart Karet Seal Double Soft Ice Cream', 'ISC-16/ISC-16S', '80000.00', '2024-12-05 09:41:06', '2024-12-05 13:40:07'),
('9da6f138-381a-4abb-986f-73a9f2408150', 'Sparepart Pisau 4mm Vegetable\nCutter MKS-CT100\n', 'MKS-CT100', '0.00', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-3f23-47e9-8eb6-e8758896e454', 'Sparepart Screw Giling Daging \nMHW-120\n', 'MHW-120', '0.00', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-4819-4caa-be6e-f63709ab2142', 'Baut pengunci kecil cetak mie', 'CM-123', '0.00', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-58f8-4d11-8f4a-049137413704', 'Sparepart Pully Kecil Cetak Mie MKS-220SS', 'MKS-220SS', '60000.00', '2024-12-05 12:56:11', '2024-12-05 13:21:54'),
('9da6fde0-40e9-4c67-b738-4c8701164da3', 'Sparepart Termostat Cup Sealer Manual CPS-919, CPS-818, CPS-959', 'CPS-919/CPS-818/CPS-959', '110000.00', '2024-12-05 13:31:34', '2024-12-05 13:31:34'),
('9da701e1-a78a-45ae-b394-4993fc56562c', 'Sparepart Kabel Eterna NYY HYO 2x0.75 Mixer Spiral', 'MKS-SP20', '20000.00', '2024-12-05 13:42:46', '2024-12-05 13:42:46'),
('9da7026c-4172-451d-92f2-c91c356ff41f', 'Sparepart Kapasitor 220uf /250 VAC Mixer Spiral', 'MKS-SP20', '190000.00', '2024-12-05 13:44:17', '2024-12-05 13:44:17'),
('9da702d4-6c03-449f-9482-e90985cf3d48', 'Sparepart Kapasitor 30uf /450 VAC Mixer Spiral', 'MKS-SP20', '170000.00', '2024-12-05 13:45:25', '2024-12-05 13:45:25'),
('9da70f5b-c019-4418-b2ac-b6dc40056624', 'Mesin Pengupas Kelapa Manual', 'MKS-KLP01', '2980000.00', '2024-12-05 14:20:27', '2024-12-05 14:20:27'),
('9da72e3a-d7bf-46cd-ac7b-b5cd3f4ad0d4', 'Mesin Ice Tube', 'MKS-IM120', '29140000.00', '2024-12-05 15:46:47', '2024-12-05 15:46:47'),
('9da7336e-5dcc-43f5-94e7-933ba1984122', 'Mesin Tortila  (Diameter 30 CM)', 'MKS-TRT4430', '23330000.00', '2024-12-05 16:01:19', '2024-12-05 16:04:29'),
('9da7d00b-f2cc-4cc5-8128-84edc2e06d89', 'Sparepart Tombol ON/OFF Rotating Waffle Maker', 'MKS-RTW01', '10000.00', '2024-12-05 23:19:15', '2024-12-05 23:19:15'),
('9da7d2aa-bf59-4163-a8f5-1e588cda1bad', 'Alat Pemotong & Penusuk Daging Sate', 'MKS-089', '250000.00', '2024-12-05 23:26:35', '2024-12-05 23:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_keluar`
--

CREATE TABLE `tb_barang_keluar` (
  `id_barang_keluar` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_transaksi` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_barang` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date NOT NULL,
  `kode_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_konsumen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_handphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` int NOT NULL,
  `posisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_barang_keluar`
--

INSERT INTO `tb_barang_keluar` (`id_barang_keluar`, `id_transaksi`, `id_barang`, `tanggal`, `kode_transaksi`, `nama_konsumen`, `no_handphone`, `alamat`, `kode_barang`, `nama_barang`, `tipe_barang`, `jumlah_barang`, `posisi`, `created_at`, `updated_at`) VALUES
('9da6f391-5944-448f-948b-0ea030f990ab', '9da6f391-5377-40f7-9463-6a59d5e982b8', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-04', 'SI.2024.09.00002', 'Roy Putra, Bpk', '085265802234', 'Jl.Lintas Timur KM-19  - Riau', '601018004', 'Cup Sealer', 'CPS-959', 1, 'Rak-4', '2024-12-05 13:02:45', '2024-12-05 13:02:45'),
('9da6f736-751b-46d4-a249-8519c3e1a9da', '9da6f736-6b87-44ca-9b8c-33febf39cad0', '9da65bd1-a4d8-433f-bc65-3db1f41af518', '2024-09-04', 'SI.2024.09.00003', 'Bpk Darliansyah', '08126814341', 'Jl.Cipta Karya Perum Villa - Pekanbaru - Riau', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', 1, 'Kasir', '2024-12-05 13:12:56', '2024-12-05 13:12:56'),
('9da6faf9-ae7e-433c-b2a7-d1a64f51633e', '9da6faf9-a9c4-4280-b3a0-7214b6b416e8', '9da6f138-58f8-4d11-8f4a-049137413704', '2024-09-04', 'SI.2024.09.00023', 'Bpk Indra Mahira', '082173214448', 'Jl.Tanjung Pati Sari Lamak Payakumbuh Sumatra Barat', '102226097', 'Sparepart Pully Kecil Cetak Mie MKS-220SS', 'MKS-220SS', 1, 'Kasir', '2024-12-05 13:23:27', '2024-12-05 13:23:27'),
('9da6fc2a-5668-45cb-9ca1-c03eb4303942', '9da6fc2a-5152-40ea-9b4f-27606441d49d', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-05', 'SI.2024.09.00004', 'Ibu Rita Agustina', '085182067297', 'Jl.Kruing No.450, Pekanbaru - Riau', '601018004', 'Cup Sealer', 'CPS-959', 1, 'Rak-4', '2024-12-05 13:26:47', '2024-12-05 13:26:47'),
('9da6ff32-3eef-4352-91da-e34990b06487', '9da6ff32-3952-4675-8ac4-633f81edd575', '9da6fde0-40e9-4c67-b738-4c8701164da3', '2024-09-06', 'SO.2024.09.00003', 'Bpk Aria', '081325256325', 'Beringin Eddy - Pekanbaru - Riau', '302052003', 'Sparepart Termostat Cup Sealer Manual CPS-919, CPS-818, CPS-959', 'CPS-919/CPS-818/CPS-959', 1, 'Kasir', '2024-12-05 13:35:16', '2024-12-05 13:35:16'),
('9da708af-dacc-413c-8add-205b0a8ccc49', '9da708af-d623-49a9-bde8-a736f774af5c', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-07', 'SI.2024.09.00006', 'Bpk Aria', '081325256325', 'Beringin Eddy - Pekanbaru - Riau', '601018004', 'Cup Sealer', 'CPS-959', 2, 'Rak-4', '2024-12-05 14:01:48', '2024-12-05 14:01:48'),
('9da709a1-df35-40fd-a21b-727176df3d4d', '9da709a1-d9f9-4090-850b-5f0078c7dc04', '9da64f66-3336-4189-b4d8-d450fc76dc93', '2024-09-07', 'SI.2024.09.00008', 'Ibu weni', '085263513605', 'Kubang - Riau', '201011001', 'Alat Perajang singkong manual', 'PRJ-M', 1, 'Rak-3', '2024-12-05 14:04:27', '2024-12-05 14:04:27'),
('9da70af9-87fa-4883-955c-970cf8c14fb9', '9da70af9-8347-4d42-8ea5-e7f9fe25514c', '9da64f66-61a6-438e-968b-536f6dc53069', '2024-09-07', 'SI.2024.09.00009', 'Koperasi Batobo Korpri Kampar', '082173062405', 'Prof M.Yamin No.278, Langgini, Bangkinang Kota, Kab.Kampar, Riau', '301015027', 'Mesin Vacum Sealer', 'ARD-VS02', 2, 'Gudang-Lt2', '2024-12-05 14:08:12', '2024-12-05 14:08:12'),
('9da70ca2-4733-4dcc-a181-aa732f7d61f1', '9da70ca2-426c-4256-8a2d-d444b49a7289', '9da64f65-5a9b-40d7-82f3-cf4253b69d72', '2024-09-07', 'SI.2024.09.00010', 'Bpk Yosse Rizal', '081270160332', 'Jl. uji coba', '601019016', 'Mesin Gas Deep Fryer', 'MKS-72', 1, 'Kasir', '2024-12-05 14:12:50', '2024-12-05 14:12:50'),
('9da70e30-07b7-4f3c-8517-8b3cda074ac1', '9da70e30-0237-4cfb-9644-53f5015b85e7', '9da64f66-2f53-49c4-9107-aeee9d9424db', '2024-09-09', 'SI.2024.09.00011', 'Bpk Islan', '082299114774', 'Lubuk Terap, Bandar Petalangan, Kab.Pelalawan - Riau', '101042007', 'Mesin Universal Fritter', 'MKS-UV22', 1, 'Rak-3', '2024-12-05 14:17:11', '2024-12-05 14:17:11'),
('9da711bf-d10a-4a10-ae12-7547a48f3bd1', '9da711bf-cbd4-4e4a-8dd6-17c13523c4bb', '9da64f65-127d-4ef5-a543-664425d38e13', '2024-09-09', 'SI.2024.09.00012', 'Bpk Eggy Cahyana. S.', '082169975677', 'Jl.Gading Marpoyan, Pekanbaru - Riau', '101042008', 'Mesin Universal Fritter', 'MKS-UV44', 1, 'Rak-3', '2024-12-05 14:27:08', '2024-12-05 14:27:08'),
('9da731b4-1acd-4464-acbc-c091ed66cb2c', '9da731b4-1619-485d-a3a9-896fd875c373', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '2024-09-10', 'SI.2024.09.00013', 'Ibu Lili Nopita Sari', '081275361165', 'Koto Ranah, Kec.kabun, Kab.Rokan Hulu - Riau', '601006004', 'Mesin Cetak Mie', 'MKS-140', 1, 'Kasir', '2024-12-05 15:56:29', '2024-12-05 15:56:29'),
('9da7ca65-d596-4531-8706-697e0c9b2730', '9da7ca65-cdd0-43b9-84f4-ea6c7774da6d', '9da68e98-72d0-470e-93f8-226a95c52506', '2024-09-10', 'SI.2024.09.00001', 'Ibu Diana Sartika', '085262370667', 'Jl.Siak 2 Palas , Pekanbaru - Riau', '102229057', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 1, 'Kasir', '2024-12-05 23:03:27', '2024-12-05 23:03:27'),
('9da7cae9-b27c-4712-8a73-fa09bd936586', '9da7cae9-adaa-4393-b001-0a41802d5b80', '9da68ed5-68dc-4210-ac27-39d36e426e9e', '2024-09-10', 'SI.2024.09.00001', 'Ibu Diana Sartika', '085262370667', 'Jl.Siak 2 Palas , Pekanbaru - Riau', '102263010', 'Sparepart Bearing 6205', 'ADT-SM20', 1, 'Kasir', '2024-12-05 23:04:54', '2024-12-05 23:04:54'),
('9da7ccae-958a-42a1-b4f0-08fa5d398bad', '9da7ccae-90e0-42b7-9d58-0b273bc01846', '9da64f65-4f20-40ca-93f6-180df6443d13', '2024-09-11', 'SI.2024.09.00014', 'Ibu Ulya Auliani', '082385148005', 'Tapung Hilir -  Riau', '101063008', 'Mesin egg Roll', 'MKS-ERG001', 1, 'Gudang-Lt1', '2024-12-05 23:09:50', '2024-12-05 23:09:50'),
('9da7d15f-0db3-47c1-b85f-218e8fca4fa7', '9da7d15f-0957-42a8-8760-3ba730c0df38', '9da7d00b-f2cc-4cc5-8128-84edc2e06d89', '2024-09-12', 'SI.2024.09.00015', 'Ibu Gladies', '082169820505', 'Jln.Marsan Sejahtera, Panam, Pekanbaru - Riau', '102225079', 'Sparepart Tombol ON/OFF Rotating Waffle Maker', 'MKS-RTW01', 1, 'Kasir', '2024-12-05 23:22:57', '2024-12-05 23:22:57'),
('9da7d5f8-9477-4ab0-888f-ca0bd090b779', '9da7d5f8-9033-440f-8a91-cba404faf541', '9da6ab74-a15d-4edb-9282-7a7fe091984c', '2024-09-13', 'SI.2024.09.00007', 'Ibu. Riski Andini Septiyani', '085355399016', 'Jl.Hangtuah X Sp6 Desa Makmur, Kec.Pangakalan Kerinci, Kab.Pelalawan - Riau', '102238213', 'Sparepart Karet Seal Double Soft Ice Cream', 'ISC-16/ISC-16S', 1, 'Kasir', '2024-12-05 23:35:49', '2024-12-05 23:35:49'),
('9da7deb2-bf58-4192-9f5a-90977a8bd853', '9da7deb2-baab-41d7-8d70-c0c5e013e7f8', '9da64f66-062c-4a1b-af06-e6bddd6d8e61', '2024-09-14', 'SI.2024.09.00016', 'Bpk. Marsuanto', '0811753678', 'Jl. Garuda Taskurun', '301007001', 'Mesin Hand Sealer', 'MSP-200I', 1, 'Rak-3', '2024-12-06 00:00:13', '2024-12-06 00:00:13'),
('9da7e297-eefc-4a0b-a2fb-28d8e8067327', '9da7e297-e9f5-4a16-afc3-520bc5016628', '9da70f5b-c019-4418-b2ac-b6dc40056624', '2024-09-14', 'SI.2024.09.00017', 'Bpk Islan', '82299114774', 'Lubuk Terap, Bandar Petalangan, Kab.Pelalawan - Riau', '101297008', 'Mesin Pengupas Kelapa Manual', 'MKS-KLP01', 1, 'Kasir', '2024-12-06 00:11:07', '2024-12-06 00:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_masuk`
--

CREATE TABLE `tb_barang_masuk` (
  `id_brg_masuk` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `no_warehouse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_barang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `asal_gudang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` int NOT NULL,
  `posisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_konsumen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_barang_masuk`
--

INSERT INTO `tb_barang_masuk` (`id_brg_masuk`, `id_barang`, `tgl_brg_masuk`, `no_warehouse`, `kode_barang`, `nama_barang`, `tipe_barang`, `asal_gudang`, `jumlah_barang`, `posisi`, `status`, `nama_konsumen`, `created_at`, `updated_at`) VALUES
('9da6f546-8bb2-405c-bae4-0b7d98d6e789', '9da65bd1-a4d8-433f-bc65-3db1f41af518', '2024-09-04', 'DO.2024.08.00331', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Bpk. Darliansyah', '2024-12-05 13:07:31', '2024-12-05 13:07:31'),
('9da70645-69e9-4703-a6e1-3a8e5d0d0589', '9da6ab0f-a6f3-4e68-bf7f-27dd55b0ed93', '2024-09-07', 'DO.2024.09.00009', '102226052', 'Sparepart Gear Kecil Besi 2CM Cetak Mie', 'MKS-135/MKS-140/MKS-145', 'Gudang Pusat', 8, 'Kasir', 'stok', '-', '2024-12-05 13:55:03', '2024-12-05 13:55:03'),
('9da706de-76a9-40c0-af35-16725e775546', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '2024-09-07', 'DO.2024.09.00009', '601006004', 'Mesin Cetak Mie', 'MKS-140', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Ibu Lili Nopita Sari', '2024-12-05 13:56:43', '2024-12-05 13:56:43'),
('9da7074b-74d4-4fa7-9302-2f10e35eb705', '9da64f65-5a9b-40d7-82f3-cf4253b69d72', '2024-09-07', 'DO.2024.09.00009', '601019016', 'Mesin Gas Deep Fryer', 'MKS-72', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Bpk Yosse Rizal', '2024-12-05 13:57:54', '2024-12-05 13:57:54'),
('9da707bf-d814-4878-b3fc-08c196f24232', '9da6ab74-a15d-4edb-9282-7a7fe091984c', '2024-09-07', 'DO.2024.09.00009', '102238213', 'Sparepart Karet Seal Double Soft Ice Cream', 'ISC-16/ISC-16S', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Ibu Riski Andini Septiyani', '2024-12-05 13:59:11', '2024-12-05 13:59:11'),
('9da7d76f-de48-4e21-821f-578be9235cbe', '9da72e3a-d7bf-46cd-ac7b-b5cd3f4ad0d4', '2024-09-14', 'DO.2024.09.00106', '101158014', 'Mesin Ice Tube', 'MKS-IM120', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Bpk. Mokhroni', '2024-12-05 23:39:55', '2024-12-05 23:39:55'),
('9da7d7dd-2f7c-4bcd-95ba-7f9a059294c6', '9da64f66-c359-475a-98a2-8ca88212f2d0', '2024-09-14', 'DO.2024.09.00106', '101158013', 'Mesin Ice Tube', 'MKS-IM100', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Bpk. Rama Aji Anggoro', '2024-12-05 23:41:06', '2024-12-05 23:41:06'),
('9da7d859-61ff-482e-948d-8a5bead67de6', '9da70f5b-c019-4418-b2ac-b6dc40056624', '2024-09-14', 'DO.2024.09.00103', '101297008', 'Mesin Pengupas Kelapa Manual', 'MKS-KLP01', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Bpk Islan', '2024-12-05 23:42:28', '2024-12-05 23:42:28'),
('9da7dcf8-9ba8-4351-bdb8-e475aa69fa22', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-14', 'DO.2024.09.00103', '601006004', 'Cup Sealer', 'CPS-959', 'Gudang Pusat', 6, 'Rak-4', 'stok', '-', '2024-12-05 23:55:23', '2024-12-06 00:25:49'),
('9da7dd95-b1c2-4125-8dd0-e65e48ff9678', '9da64f65-7767-4c00-93f4-736894467b16', '2024-09-14', 'DO.2024.09.00103', '601005019', 'Mesin Stand Mixer', 'ARD-MR7', 'Gudang Pusat', 3, 'Gudang-Lt1', 'stok', '-', '2024-12-05 23:57:06', '2024-12-05 23:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `tb_stok_barang`
--

CREATE TABLE `tb_stok_barang` (
  `id_stok` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_masuk` int NOT NULL DEFAULT '0',
  `barang_keluar` int NOT NULL DEFAULT '0',
  `stok_awal` int NOT NULL DEFAULT '0',
  `stok_akhir` int NOT NULL DEFAULT '0',
  `posisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_stok_barang`
--

INSERT INTO `tb_stok_barang` (`id_stok`, `id_barang`, `tanggal`, `nama_barang`, `tipe_barang`, `barang_masuk`, `barang_keluar`, `stok_awal`, `stok_akhir`, `posisi`, `keterangan`, `created_at`, `updated_at`) VALUES
('9da6f129-64db-4a0b-a282-744899c303e8', '9da64f65-e073-43f5-9aed-6228fc9f5cda', '2024-08-28', 'Mesin Penggiling Kopi', 'MKS-600B', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-6884-4e3f-ad31-139dcd32267f', '9da64f65-6e1d-4875-90da-1177573918e5', '2024-08-28', 'Ice Crusher', 'MKS-002', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-6ae3-4666-99a6-d0da0023ba9c', '9da64f66-902d-4366-9db8-6de2396004ab', '2024-08-28', 'Ice Cream Buah', 'ICE-01', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-6d23-467c-a521-a6fe0e5a8c47', '9da64f65-ca2e-468f-b984-725dd122e928', '2024-08-28', 'Chopper', 'ARD-FC200', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-6f40-438b-b8a4-6aa8eb01fce4', '9da64f65-c849-41a9-9f22-714fcf50616b', '2024-08-28', 'Chopper', 'ARD-FC300', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-7175-4996-9008-6629fb0b7f67', '9da64f66-92ed-4edc-808e-47c576f7be63', '2024-08-28', 'Oven Listrik ', 'ARD-E033', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-73b6-43f5-af3c-ca1edc47f985', '9da64f65-d5e2-459a-8c7e-1059efc57750', '2024-08-28', 'Alat Cetak Long Potato', 'MKS-MER2', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-7615-4b49-aa83-38294f071891', '9da64f65-eb1a-477c-a9e9-20350682ec48', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG444', 0, 0, 2, 2, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-781c-4e20-8cd8-e7cfd280d59d', '9da64f65-9831-44da-b23f-de69962d1c3d', '2024-08-28', 'Bread Maker', 'ARD-BM55X', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-7a1d-41fb-9d06-11b06fb6c7ab', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-08-28', 'Cup Sealer', 'CPS-959', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-7c47-402c-921d-2eba73d152bc', '9da64f65-d7ef-4fa6-8f65-31d55c1c3d7d', '2024-08-28', 'Alat Cetak Sate Telur Puyuh', 'ARD-TKY16', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-7e81-47c5-bc37-22cb162c9d38', '9da64f65-3d73-4c68-9248-050e29db8fc0', '2024-08-28', 'Mesin Pemanggang', 'MKS-111BBQ', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-80b0-40c9-b85d-b6fbe6003f6a', '9da64f66-948a-4b8e-9ec4-278a4b1d99e7', '2024-08-28', 'Noodle Maker', 'ARD-NM4', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-8318-4519-8004-36b62e260643', '9da64f65-47df-4e3e-81cc-cdd3f1465b79', '2024-08-28', 'Mesin Pemanggang', 'MKS-222BBQ', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-854d-43ad-84fb-ea96e605e32d', '9da64f65-4f20-40ca-93f6-180df6443d13', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG001', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-8789-453d-a9f0-8fdedf058186', '9da64f66-9632-4592-9057-ca2a257acd8d', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG005', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-89b0-461a-80dd-817c6e554303', '9da64f66-97ed-4531-9419-a12b0d9be0d4', '2024-08-28', 'Stand Mixer', 'ARD-MR7', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-8b6e-4fda-ad09-eb681c204284', '9da64f65-e4f2-44dd-9887-97b7602650e3', '2024-08-28', 'Mesin Pembuat Sosis Telur', 'MKS-ERG002', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-8dc6-4170-9ff0-acd6dd3fe093', '9da64f65-9682-4d01-b07d-c42bf5711c37', '2024-08-28', 'Oven Listrik', 'ARD-EO33', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-9062-40df-bed5-035894628498', '9da64f65-9831-44da-b23f-de69962d1c3d', '2024-08-28', 'Bread Maker', 'ARD-BM55X', 0, 0, 3, 3, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-9291-46cc-a65b-e0abcf285575', '9da64f65-9a62-4391-a3fb-41cdbf514cab', '2024-08-28', 'Ice Crusher', 'MKS-CRS30L', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-94b9-408a-9df6-eb0caafbe1d0', '9da64f65-9c53-42b3-9e33-7279816ffbae', '2024-08-28', 'Timbangan Digital', 'TBG-3', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-96f8-4511-9640-355c4ca14c5b', '9da64f65-9e3e-4934-92af-4ed939f7875e', '2024-08-28', 'Timbangan Digital', 'TBG-1', 0, 0, 6, 6, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-9911-48dc-8673-ddc9c1309639', '9da64f65-a03a-4d97-bc9e-988fad3729d6', '2024-08-28', 'Timbangan Digital', 'TBG-5', 0, 0, 5, 5, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-9b62-43a4-8a5c-746533b18c90', '9da64f65-a30c-47d1-b646-6ef2ecf085c3', '2024-08-28', 'Timbangan Digital', 'TBG-10', 0, 0, 5, 5, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-9de1-4ba0-b8e1-b0d7e3b20ede', '9da64f65-a4cc-41a3-ac8f-85f11b9c58e0', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-404', 0, 0, 10, 10, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-a035-432a-a908-83bc06871987', '9da64f65-a677-4348-8981-529573d60fdf', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-202', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-a27d-4d9e-a24c-b89bb3a039e9', '9da64f65-a940-4bb9-9bb3-b1015aa5898d', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-303', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-a4fb-4c2c-9148-98f62412f455', '9da64f65-aaae-4abd-861b-85ea7bbd527b', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-505', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-a723-42f2-a799-1a54c19eb48b', '9da64f65-ac83-48f4-aef8-c33f270a67fc', '2024-08-28', 'Cetak Sosis Telur Listrik', 'GRILLO-400', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-a982-4fa4-9c6b-0b4a06f3af58', '9da64f66-9a2c-4855-b6c2-28ae777731db', '2024-08-28', 'Pemasak', 'KTl-DBL2', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-abd6-47dc-a797-5a93c9b4745a', '9da64f65-aec7-4d87-bd21-97a593ba397f', '2024-08-28', 'Blender', 'MKS-BLD 1,5L', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-ae1c-4351-a1f1-32f1cc4e99c9', '9da64f65-b026-4b9e-97fd-166a8c3062d0', '2024-08-28', 'Pemanas Air ', 'BT-119', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-b03e-4c65-ab60-65bc7b1a7d02', '9da64f65-b1af-4c9a-b9a7-32667a5433df', '2024-08-28', 'Peras Jeruk', 'ARD-J22', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-b296-4b5a-abfa-951120d49f91', '9da64f65-b32a-405d-88b5-658b2656421d', '2024-08-28', 'Ice Krim Buah', 'ICE-01', 0, 0, 3, 3, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-b4eb-48a2-9d5b-8b6d4eb4d17e', '9da64f65-b524-4caa-9bcd-a52363fb6cca', '2024-08-28', 'Long Potato', 'MKS-LPCT50', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-b77e-43fe-964d-3c2d9f438be7', '9da64f65-b691-44cd-97e1-5cafc5104ec2', '2024-08-28', 'Giling Daging', 'MHW-G31B', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-b9bd-4b04-8388-dacfeda99999', '9da64f65-b882-4cd7-8a80-d78e1af3340c', '2024-08-28', 'Giling Daging', 'MHW-G51B', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-bbfd-4aec-ade4-85cec88036e0', '9da64f65-bacb-48da-b7ed-2b427e780279', '2024-08-28', 'Mangkok', 'ICE BARREL', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-bea0-4c3b-9f44-fdd3d0dfa399', '9da64f66-9bf9-444e-9b4b-e26bb751e690', '2024-08-28', 'Deep Fryer', 'MKS-G20L', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-c138-4872-876a-2f60d849216e', '9da64f65-bd28-403e-a5bc-96f83c4bbc95', '2024-08-28', 'Display Warmer', 'MKS-DW66', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-c3fc-4e31-8cdb-f81913c7ac11', '9da64f65-bf8f-498b-8776-62112df3baf2', '2024-08-28', 'Lafira', 'LAFIRA', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-c690-4590-a587-fb38f0ed437e', '9da64f65-c25b-4645-8d04-397190717a31', '2024-08-28', 'Pemotong keripik tempe ', 'MKS-JT04', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-c8ef-4bd8-b3a9-ee1c9bd1f5c0', '9da64f65-c49f-45ac-a5df-fa0291cfc68b', '2024-08-28', 'Mesin Gelas Kesehatan ', 'ARD-CP5', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-cb39-4a7e-847f-6a84328506d8', '9da64f65-c626-4aa9-bf89-9bb3f1d17228', '2024-08-28', 'Ice Crusher', 'MKS-CRS20', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-cd56-4b81-a5dd-7900e9ccc0ac', '9da64f65-6e1d-4875-90da-1177573918e5', '2024-08-28', 'Ice Crusher', 'MKS-002', 0, 0, 0, 0, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-cf64-453b-8dd4-88582aef0f7a', '9da64f65-c849-41a9-9f22-714fcf50616b', '2024-08-28', 'Chopper', 'ARD-FC300', 0, 0, 0, 0, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-d193-4a51-aaaa-7a7db7e966d8', '9da64f65-ca2e-468f-b984-725dd122e928', '2024-08-28', 'Chopper', 'ARD-FC200', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-d39a-40d1-8a7d-dc843a8ade2c', '9da64f65-cc01-4149-8f2d-022e24bc56c2', '2024-08-28', 'Pemanggang', 'ARD-GRL77', 0, 0, 2, 2, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-d5a4-4928-ab4f-fb273b177401', '9da64f65-ce21-4c82-9bc2-62aaf1fb71a6', '2024-08-28', 'Kentang Spiral', 'TP-200', 0, 0, 5, 5, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-d825-4111-b109-b565ac508716', '9da64f65-cfcc-483b-adab-9b2910209a6f', '2024-08-28', 'Alat Pengiris Kentang Spiral', 'MKS-PSS44', 0, 0, 2, 2, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-dc8c-409f-a8ac-5fe0c40d8a34', '9da64f65-d1b6-4b52-b269-d0fe1255296c', '2024-08-28', 'Alat Pengiris Apel', 'MKS-APL88', 0, 0, 5, 5, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-def0-4d82-b633-78b16190afb2', '9da64f65-d36d-4d70-8374-21667eb99c71', '2024-08-28', 'Alat Cetak Long Potato', 'MKS-LPCT30', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-e116-4993-98ed-c7fab7f2672d', '9da64f65-d5e2-459a-8c7e-1059efc57750', '2024-08-28', 'Alat Cetak Long Potato', 'MKS-MER2', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-e35e-414e-86e0-00edf678e71b', '9da64f65-d7ef-4fa6-8f65-31d55c1c3d7d', '2024-08-28', 'Alat Cetak Sate Telur Puyuh', 'ARD-TKY16', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-e610-4112-a3b7-ec81a82b8859', '9da64f65-d9c6-49ac-b744-b33ba32cb027', '2024-08-28', 'Mesin penepung Herba, Farmasi dan biji', 'MKS-ML100', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-e8b7-4744-acdd-a561071a9f3c', '9da64f65-dc5f-466d-a7bd-9d4f2c417f80', '2024-08-28', 'Mesin Kopi Espresso', 'MKS-MKP50', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-eb5e-4dd4-8348-fa1b8a41442d', '9da64f65-de84-4cda-b64e-848811a01a4d', '2024-08-28', 'Mesin Grinder kopi', 'MKS-GRD80A', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-ed66-4cb7-9fee-4740f611dd1f', '9da64f66-5cbb-4446-877c-e10b421e4f67', '2024-08-28', 'Rok Espresso', 'ROK ESPRESSO', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-effc-491b-a61a-e75ae99cf199', '9da64f65-e073-43f5-9aed-6228fc9f5cda', '2024-08-28', 'Mesin Penggiling Kopi', 'MKS-600B', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-f236-4349-9b0a-c23d76242ba6', '9da64f65-e2b6-4233-af2a-c6898c48ab9c', '2024-08-28', 'Mesin Deep Fryer Gas', 'MKS-71', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-f41f-416a-9fc5-9f468ca98294', '9da64f65-e4f2-44dd-9887-97b7602650e3', '2024-08-28', 'Mesin Pembuat Sosis Telur', 'MKS-ERG002', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-f672-414a-b467-c4931803b022', '9da64f65-e707-455c-9891-612a8ae1ac01', '2024-08-28', 'Mesin Egg Roll', 'GRILLO-GS10', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-f927-4e4d-b3c4-75b12f5e5ab9', '9da64f65-e938-45f9-9719-9a0bd2f2156d', '2024-08-28', 'Mesin Egg Roll', 'GRILLO-GS6', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-fb8d-4888-af69-2bdefaceaeb5', '9da64f65-eb1a-477c-a9e9-20350682ec48', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG444', 0, 0, 0, 0, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f129-fddc-428a-bcb8-b10df8ffdd1b', '9da64f65-4f20-40ca-93f6-180df6443d13', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG001', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-0026-4641-ae6f-41b1b04c45c8', '9da64f66-a2a4-4311-883b-1b41d402c560', '2024-08-28', 'Mesin Food Dehydrator', 'ARD-PM99', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-0260-476a-ae67-32588fd057f6', '9da64f65-ed43-4f7d-862d-2b769bf47d47', '2024-08-28', 'Alat Manual Meat Slicer', 'MKS-MSl66', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-0496-45fb-a8e0-e45885d6358e', '9da64f65-efb3-46e1-b903-4bc61de5c59a', '2024-08-28', 'Mesin Cetakan Donat', 'MKS-DN60', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-06f1-42c0-986a-c34b6cb0c1c5', '9da64f65-f213-48bc-97f3-e2bdaf1d637b', '2024-08-28', 'Mesin Hot Dog Wafel', 'MKS-HDW6', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-094e-4733-aff9-07a5a1d41138', '9da64f65-f531-4596-9bcf-fbb108022a13', '2024-08-28', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-0ba4-42a5-8eec-ac827bf86ab7', '9da64f65-f7b9-40c8-afa8-e24f0a1ad4d7', '2024-08-28', 'Mesin Takoyaki Listrik', 'MKS-700E', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-0dda-4c16-889f-60a33af7ace2', '9da64f65-f99a-4a85-81ad-84c1c7397525', '2024-08-28', 'Mesin Waffle Taiyako', 'MKS-ETYK3', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-10f4-4a16-a54f-a9501392ea17', '9da64f65-fb65-4a41-a43e-5e68af2f6564', '2024-08-28', 'Mesin Perajang Sayur dan Buah', 'MKS-VGT65', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-1350-4b18-9126-0d7789ade0c4', '9da64f65-fe30-4d1c-a999-3f062054bacc', '2024-08-28', 'Mesin Slot Toaster', 'MKS-D06', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-1561-4c88-83a9-72cfcd9dc963', '9da64f66-0033-4d58-9d7a-8ddc35a1a3be', '2024-08-28', 'Cetak Mie dan Pasta', 'ARD-NM4', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-1722-46f5-ba8a-1bb1b528a19c', '9da64f66-a449-4b00-87bf-37c1fe5cde9c', '2024-08-28', 'Mesin Giling Daging', 'MHW-G31B', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-05 12:56:01', '2024-12-05 12:56:01'),
('9da6f12a-1944-4bf1-b16f-55a23eddd7f7', '9da64f66-01dd-4bf3-8e30-e156793e7eb0', '2024-08-28', 'Mesin Hand Sealer', 'MSP-400A', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-1b77-4ac7-9258-185563490c97', '9da64f66-0431-4f56-a29d-0610598a01ff', '2024-08-28', 'Mesin Hand Sealer', 'MSP-300A', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-1d46-4f36-9c94-498b061751d4', '9da64f66-062c-4a1b-af06-e6bddd6d8e61', '2024-08-28', 'Mesin Hand Sealer', 'MSP-200I', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-1f4d-419c-92de-79768f10edcb', '9da64f66-085d-4cfe-a12f-f7564a7503d3', '2024-08-28', 'Mesin Hand Sealer', 'MSP-200A', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-217b-448c-8706-cdc61fde7a3e', '9da64f66-0b25-42e7-ac89-06e4f3f10867', '2024-08-28', 'Mesin Hand Sealer', 'MSP-300i', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-2350-4813-991f-e0035337cba9', '9da64f66-0d6c-4573-a5bb-16fc4ba4fa3b', '2024-08-28', 'Mesin Vacum Sealer', 'MSP-DZ280A', 0, 0, 5, 5, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-2513-4707-9684-a1e31d3ceb11', '9da64f66-1010-4d34-9cdb-7e9960ebb128', '2024-08-28', 'Mesin Vacum Sealer', 'MSP-290E', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-2720-4d74-a5de-6f407b58c3ce', '9da64f66-1221-43e7-88a5-d017e4dc7e51', '2024-08-28', 'Mesin Vacum Sealer ', 'MSP-VS02', 0, 0, 6, 6, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-294c-494e-8cfd-e849fc9287a4', '9da64f66-144b-4c81-9909-72a63131981c', '2024-08-28', 'Mesin vakum food sealer', 'ARD-VC85', 0, 0, 5, 5, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-2b8b-43d9-bc14-30cd84e2d32e', '9da64f66-16d2-47a8-92d6-a796d065f3ee', '2024-08-28', 'Mesin vakum sealer', 'ARD-VS01', 0, 0, 3, 3, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-2ddb-497a-b34d-0981c52b6d4b', '9da64f66-1898-4454-892d-b4881aebddd0', '2024-08-28', 'Mesin Hand Printer', 'HP-351', 0, 0, 3, 3, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-3006-491d-a28d-6b6e9d08123d', '9da64f66-1a94-4237-ae8d-dc34b8b52e25', '2024-08-28', 'Alat Cetak Sosis Horizontal', 'MKS-3V', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-3244-4424-ad5f-02fed4c57be9', '9da64f66-1cc1-4406-81ca-57d53c9e86f1', '2024-08-28', 'Alat Cetak Sosis Vertikal', 'MKS-3H', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-349c-43ca-9e58-14331c207ded', '9da64f66-1efc-425f-a404-a3061aaa4d09', '2024-08-28', 'Mesin Pengupas Bawang Putih', 'AGR-BWG180', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-36d1-40a6-9332-e66b12ae88bf', '9da64f66-20a8-4716-8ceb-d4bbcf8e6ef8', '2024-08-28', 'Mesin Giling Daging', 'MHW-80', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-390a-4288-b7e6-89cae9648bd2', '9da64f66-22e9-417d-80fe-de0b902f0d4f', '2024-08-28', 'Mesin Giling Daging', 'MHW-220', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-3b05-4f71-a1ee-ba73b0e5bb1f', '9da64f66-255e-4f1d-a142-17099c89de99', '2024-08-28', 'Mesin Pemanggang', 'MKS-PG4', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-3cba-492c-9a97-1aa064ceb7c3', '9da64f66-271c-4f51-9b5c-2dbd1592944c', '2024-08-28', 'Mesin Pemanggang', 'MKS-PG2', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-3e70-4f08-882e-84fedcac98a6', '9da64f66-28f4-4d22-ba8f-7e0a223238d2', '2024-08-28', 'Mesin Egg Waffle Listrik', 'MKS-EW06', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-404b-4f6f-ad1d-829fd9b3c814', '9da64f66-2bc3-4958-bd3d-d09cf1ace376', '2024-08-28', 'Mesin Egg Waffle Gas', 'MKS-GW07', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-4284-4e25-99b9-29e47c3dd134', '9da64f66-2d5f-4408-981a-5acb4934a2cf', '2024-08-28', 'Mesin Cone Bakar', 'MKS-CB1', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-44b2-492a-9e89-2f6759abea6a', '9da64f66-2f53-49c4-9107-aeee9d9424db', '2024-08-28', 'Mesin Universal Fritter', 'MKS-UV22', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-46ed-4caa-8ed5-fd352e3e4b2c', '9da64f65-127d-4ef5-a543-664425d38e13', '2024-08-28', 'Mesin Universal Fritter', 'MKS-UV44', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-491b-4fd7-9a3a-294e9e09a7be', '9da64f66-3172-4d2e-9d72-142a9ebaa35b', '2024-08-28', 'Alat Perajang bawang manual', 'PRJ-BM', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-4ae5-4e0b-b0b3-5b3a32fdaa51', '9da64f66-3336-4189-b4d8-d450fc76dc93', '2024-08-28', 'Alat Perajang singkong manual', 'PRJ-M', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-4cd1-43bb-9831-f7a79e7ad5f7', '9da64f66-34f1-4f71-afaa-6a8c07df8406', '2024-08-28', 'Mesin Pembuat Gulali', 'MKS-CT76', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-4f30-47f6-b55d-a9f8624d7dd7', '9da64f66-36f5-482b-bf33-d06840ab4105', '2024-08-28', 'Cup Sealer', 'CPS-919', 0, 0, 0, 0, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-5165-4d6d-8b4d-ed00e2f7fddd', '9da64f66-38d4-4ea4-b8e4-98564077d269', '2024-08-28', 'Cup Sealer', 'CPS-818', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-53d1-4686-a216-dfd45736d573', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-08-28', 'Cup Sealer', 'CPS-959', 0, 0, 4, 4, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-5608-43bc-bf6f-ed32e890d64c', '9da64f66-3a93-48d2-a4b4-6e4eba83d6e9', '2024-08-28', 'Hand Sprayer (Semprotan)', 'SPR-16', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-583c-4256-bf5b-602cdb3e8d86', '9da64f66-a898-4a6a-8280-8005ee0f4e10', '2024-08-28', 'Mesin Cetak Mie', 'MKS-150B', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-5ab7-4cd9-bdb0-b271d682c6f7', '9da64f66-3c48-4b1d-a148-0e2c0e1be24b', '2024-08-28', 'Mesin Pemanggang Grill', 'ARD-GRL88', 0, 0, 2, 2, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-5ce6-4f73-8025-023c16c6dd02', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '2024-08-28', 'Mesin Cetak Mie', 'MKS-140', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-5f0d-4361-8e37-b0d1ab7ac967', '9da64f66-3ed2-46e2-b39b-2cbfb9e40b95', '2024-08-28', 'Mesin Cetak Mie', 'MKS-160', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-612d-4337-8501-3bbb6e074ac1', '9da64f66-4061-4edb-a562-bf090e10d3d9', '2024-08-28', 'Teko Listrik Stainless', 'ARD-KT11', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-62f4-4a19-8841-82cbc231a956', '9da64f66-4232-4741-8c6a-c6f9e3a98a3d', '2024-08-28', 'Mesin Water Boiler', 'MKS-D30', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-64bc-4e8a-bc00-1a6c463cfa0e', '9da64f66-a6be-4040-8ff9-4a3097b7c775', '2024-08-28', 'Cup Sealer', 'CPS-10A', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-668a-46a7-83a8-ff5fcd5fc4b6', '9da64f66-4524-4695-8975-ae5d9471692d', '2024-08-28', 'Dough Mixer', 'MKS-DIMX002', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-68f3-45ad-b23f-ed540f5ec0bd', '9da64f66-aa3e-47fb-99b4-fd0bcbe73ffb', '2024-08-28', 'Mesin Ice Crusher', 'MKS-CRS20', 0, 0, 4, 4, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-6b19-4175-a5a7-041e52e97e50', '9da64f65-4289-4c94-858f-6125c22aa4f6', '2024-08-28', 'Mesin Cetak Mie', 'MKS-160SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-6d7f-42eb-ae7c-ead17e19d6a1', '9da64f65-1dea-43db-b6c7-df589f0ca8db', '2024-08-28', 'Mesin Cetak Mie', 'MKS-180SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-6f60-481f-baaa-0c10c7796fc3', '9da64f65-2bc4-409b-bc87-3d45db860f84', '2024-08-28', 'Mesin Cetak Mie', 'MKS-200', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-7137-473c-a76f-d2823d8a8131', '9da64f66-46a9-4948-a060-4a6336f7964a', '2024-08-28', 'Mesin Cetak Mie', 'MKS-220SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-7332-4223-917c-bd9787e7fa16', '9da64f66-4867-47b5-a519-16630946668b', '2024-08-28', 'Mesin Penutup Botol Manual', 'MKS-BT31', 0, 0, 2, 2, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-75ac-4eb1-af10-17379538449d', '9da64f66-4a91-42af-b79d-1d14c9d57875', '2024-08-28', 'Hand Sealer', 'FS-600', 0, 0, 0, 0, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-77e9-49da-86b8-6972f287e2e0', '9da64f66-4c60-4148-8827-114010b4c815', '2024-08-28', 'Mesin Cup Sealer', 'CPS-9A', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-7a1d-47b8-b124-9e839c7dca70', '9da64f65-7cbd-4aea-9e9c-77c817fdeaeb', '2024-08-28', 'Oven Roti Gas 1 Loyang', 'MKS-RS11', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-7c5d-424b-a930-57fe5cf44cb4', '9da64f65-7e2b-4b0b-a6a2-ef37a33614f2', '2024-08-28', 'Penetas Telur', 'AGR-INC24', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-7e88-4e2e-88ac-41dbc56d2597', '9da64f66-ac7b-4cda-97e7-377da9b61d9e', '2024-08-28', 'Penetas Telur', 'AGR-TT32', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-80cd-4710-bca6-61915b9c9c78', '9da64f65-7ff2-4503-9424-193d577c0b14', '2024-08-28', 'Penetas Telur', 'AGR-TT7', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-8312-450b-aace-dd7764bcdb5f', '9da64f65-8255-4f1a-9c7b-153e7da9ad08', '2024-08-28', 'Penetas Telur', 'AGR-TT4', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-854e-4bfb-897f-b462a3b64b66', '9da64f65-849b-4e51-97f7-ba6121921735', '2024-08-28', 'Mesin Soft Ice Cream', 'MKS-ICM-119', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-87a9-44db-8de2-8b4a0c5f551e', '9da64f65-8792-42e0-b39f-ee32f975e733', '2024-08-28', 'Mesin Dough Mixer', 'MKS-DG15', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-89e9-44da-8ebb-b29bf209ba18', '9da64f65-8a7f-48e3-bf1f-452c973040ad', '2024-08-28', 'Mesin Cetak Mie', 'MKS-350', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-8c2c-423e-95b3-89b4e824e6a9', '9da64f65-8c78-44d2-b9aa-c34d4d3bb303', '2024-08-28', 'Mesin Serutan Es Salju', 'MKS-ICE28', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-8e6b-4097-8e95-d22f5e555af6', '9da64f65-8f49-44a9-b635-531a2f099e8b', '2024-08-28', 'Mesin Perajang Keripik', 'MKS-CT100 A', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-909f-4052-9006-f74aa1d1c376', '9da64f65-90e9-4538-b68b-63c2c681fe60', '2024-08-28', 'Pengupas Nanas Industri', 'MKS-PN60', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-92d2-4284-bb3a-cb75238f6d96', '9da64f65-928e-4b98-bb6e-a9094feabea4', '2024-08-28', 'Mesin Mixer Planetary', 'MKS-10B', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-9505-4354-bf41-d8d463815ef5', '9da64f65-949d-4cce-8467-9a0a9b90ebf1', '2024-08-28', 'Mesin Mixer Planetary', 'MKS-BK20M', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-96da-48e4-a053-24e954424b43', '9da64f65-127d-4ef5-a543-664425d38e13', '2024-08-28', 'Mesin Universal Fritter', 'MKS-UV44', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-98e3-4e6f-8dfa-9897a54a2b0c', '9da64f65-16a4-455e-b2a9-57127c063b57', '2024-08-28', 'Mesin Cup Sealer', 'CPS-10A', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-9b59-4ab7-81fa-72265943dd7e', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '2024-08-28', 'Mesin Cetak Mie', 'MKS-140', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-9d39-4927-81b5-120be982be49', '9da64f65-1ae4-4e3e-a697-40a70beda7b0', '2024-08-28', 'Mesin Pencabut Rumput', 'AGR-PR238', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-9f4f-4c26-8528-c3b1227d0cac', '9da64f65-1c82-40c8-94d0-415f9e1f57c4', '2024-08-28', 'Mesin Dough Mixer', 'MKS-DMIX002', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-a1a0-4454-99d9-ad6288d52948', '9da64f65-1dea-43db-b6c7-df589f0ca8db', '2024-08-28', 'Mesin Cetak Mie', 'MKS-180SS', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-a3e9-4e5b-af8a-255f4e97ee89', '9da64f65-2093-4f2b-9b0d-1f75c207c38c', '2024-08-28', 'Mesin Food Dehidrator', 'ARD-PM99', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-a8d4-4ca6-a0da-8760d49a4529', '9da64f65-222c-4bd5-b025-11d6c17eec6f', '2024-08-28', 'Mesin Cetak Pelet', 'MKS-PLT25', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-ab1b-4267-994a-484ec87b4820', '9da64f65-23a8-4d66-9209-ea88e895339f', '2024-08-28', 'Alat Sauce Pan/Ssauce Dispenser', 'MKS-SU-01', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-ad46-481c-80d0-836090230ef8', '9da64f65-2581-4084-9c77-13531affaa17', '2024-08-28', 'Mesin Cetak Mie ', 'MCM-150', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-af96-4733-80b3-7a308a110f68', '9da64f65-26fd-4857-9462-d6158e7681ac', '2024-08-28', 'Mesin Coffe Espresso', 'MKS-MKP60', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-b1cd-49d6-a4ad-64aae34bf318', '9da64f65-2882-43b7-a164-79d177c8e9f2', '2024-08-28', 'Alat Giling Daging manual', 'MKS-SG10', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-b3fd-4a25-a036-8fcc5e8f7579', '9da64f65-29ee-48e3-a932-f7dd76be1042', '2024-08-28', 'Mesin cetak Mie Manual', 'MKS-150B', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-b67e-4fe1-9590-0992c6e67905', '9da64f65-2bc4-409b-bc87-3d45db860f84', '2024-08-28', 'Mesin Cetak Mie', 'MKS-200', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-b8ba-44d3-b5a7-7ba02b8c3db1', '9da64f65-2d8b-4ef9-b911-cccf91a3275d', '2024-08-28', 'Alat Pemotong Kerupuk Lontong manual', 'AGR-LTG22', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-baee-4875-8af4-361a5d8ab8d3', '9da64f65-2f2b-48ec-a9df-51ef7e62b850', '2024-08-28', 'Mesin Waffle Maker', 'MKS-WF48', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-bd43-47c5-afbc-af6a5aabfba7', '9da64f65-3093-4a92-befe-37df21acea2d', '2024-08-28', 'Mesin Electric Kettle', 'KTL-DBL2', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-bf8c-40b3-83a5-a8277a2098c8', '9da64f65-3300-4dd7-acb6-fa63035c9597', '2024-08-28', 'Mesin electric Kettle', 'ARD-KT12', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-c1b4-4aca-b240-efea82ca4002', '9da64f65-34ee-422c-b418-430d746b0352', '2024-08-28', 'Mesin Coffe Grinder', 'MKS-GRD60A', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-c3fa-4b4b-b021-6ad10994d481', '9da64f65-3676-4908-b56a-99dc93975c76', '2024-08-28', 'Mesin Coffe Bean Grinder', 'MKS-CG50', 0, 0, 5, 5, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-c5c6-4476-8f4a-21a28c398859', '9da64f65-3859-418b-aaf1-5a64d8cbc306', '2024-08-28', 'Mesin Pemipil Jagung', 'PPJ-001', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-c7f1-4b17-9065-90ccdacee415', '9da64f65-3a1b-4ad2-b0bc-53a727d423b1', '2024-08-28', 'Alat Cetak Mie dan Pasta', 'CM-2020', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-ca38-452a-bf80-968ceef17bab', '9da64f65-3c01-4b54-aa38-1828ecf3bad5', '2024-08-28', 'Mesin Giling Daging', 'MHW-120', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-cc80-45bd-81dd-46e4f4ddc865', '9da64f65-3d73-4c68-9248-050e29db8fc0', '2024-08-28', 'Mesin Pemanggang', 'MKS-111BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-cebe-470a-8d36-2f63daaa13d8', '9da64f65-3f70-44fa-8400-08ed4a8a5295', '2024-08-28', 'Mesin Big Smoker', 'MKS-BLS002', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-d117-4117-a09e-6aa523825774', '9da64f65-4101-4e93-9316-1314992a48ae', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT32', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-d393-4224-8005-4fc63b920216', '9da64f65-4289-4c94-858f-6125c22aa4f6', '2024-08-28', 'Mesin Cetak Mie', 'MKS-160SS', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-d5fd-4888-8bdd-bb3257988840', '9da64f65-440c-4794-a870-b47f829b90bf', '2024-08-28', 'Mesin Stik Wafel', 'MKS-HDW5', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-d827-498c-b255-cb76542face0', '9da64f65-460d-49ca-9bec-4b5f2109f689', '2024-08-28', 'Mesin Pemanggang', 'MKS-369BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-da81-4c5b-aab9-5d80caf78813', '9da64f65-47df-4e3e-81cc-cdd3f1465b79', '2024-08-28', 'Mesin Pemanggang', 'MKS-222BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-dc4a-4791-9b01-cf2f5e084bb7', '9da64f65-4945-47a6-b401-3f52222e887f', '2024-08-28', 'Mesin Mixer Planetary', 'MKS-B5A', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-de5f-42f8-9e09-3e65c3f3b4a7', '9da64f65-4b07-4d33-a521-1483ef46b402', '2024-08-28', 'Foot Sealer', 'FRP-600', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-e09a-42e3-ad49-a08731a8d00b', '9da64f65-4d9f-4445-a8be-42bf911dfc3b', '2024-08-28', 'Foot Sealer', 'FRP-400', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-e299-4f25-999d-586fa355a5f0', '9da64f65-4f20-40ca-93f6-180df6443d13', '2024-08-28', 'Mesin egg Roll', 'MKS-ERG001', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-e4e4-415e-b3d0-83301e39f064', '9da64f65-50ad-4408-a54f-24ef102e5cc5', '2024-08-28', 'Mesin Dough Devider', 'MKS-BA80', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-e6cc-46b8-97c5-c85e6a043209', '9da64f65-5232-43a9-81bc-410bdf09805a', '2024-08-28', 'Mesin Pemipil Jagung', 'AGR-CORN9', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-e8b6-4cfa-842b-f23f88750ffa', '9da64f65-5602-4ac5-a8a8-36ab9bf3c408', '2024-08-28', 'Mesin Gas Deep Fryer', 'MKS-G75', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-eaef-4db0-bf8d-24678749822e', '9da64f65-588b-4909-b521-fdf210d23d36', '2024-08-28', 'Mesin Gas Deep Fryer', 'MKS-G20L', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-ed0d-41aa-bcd9-de4d8a4d3a03', '9da64f65-5a9b-40d7-82f3-cf4253b69d72', '2024-08-28', 'Mesin Gas Deep Fryer', 'MKS-72', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-ef21-43f7-8771-7f17d34462c9', '9da64f65-5bff-488c-b974-c3f8ac72788f', '2024-08-28', 'Mesin Ice Cream', 'ISC-16', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-f1a2-47d4-8dfe-a2646009f0f6', '9da64f65-5d89-4ccc-9a44-04b0fb0fbad7', '2024-08-28', 'Mesin Tortiila', 'MKS-TRT11', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-f3ac-4cdf-8502-658e7acf92ad', '9da64f65-5f09-45ca-869b-b18897e74aa7', '2024-08-28', 'Mesin Dough Devider', 'MKS-DD15M', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-f5cf-4381-bbe8-fbb409143063', '9da64f65-619f-4c9e-a34f-d3c0723db188', '2024-08-28', 'Alat Churros', 'MKS-CRS05', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-f878-445e-829d-33f8fc88e2b5', '9da64f65-6333-4b25-a9d7-8473d6918238', '2024-08-28', 'Mesin Hand Sealer', 'FS-1000', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-fb15-43cc-ac98-b0c3a5134ec8', '9da64f65-64d8-462d-9a69-e63a433c768f', '2024-08-28', 'Mesin Continious Band Sealer', 'SF-150W', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-fd66-4d7f-9aaa-8b21345f4127', '9da64f65-675f-4822-a545-7bf8f1b5d23e', '2024-08-28', 'Mesin Pemotong Tulang Manual', 'MKS-PTT38', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12a-ff8c-4b43-a4f3-56fe73176afc', '9da64f65-68f7-4bea-b526-8b662ac76f40', '2024-08-28', 'Mesin Continious Band Sealer', 'FR-900W', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-0179-4998-be6e-cc87bf2e058d', '9da64f65-6a98-4043-b82b-374a494dbefc', '2024-08-28', 'Alat Peras Jeruk Manual', 'MKS-MJ1001', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-03ae-4a62-ab71-0aad10fef957', '9da64f65-6bfc-46b9-96fb-1f40b81217d7', '2024-08-28', 'Meat Slicer Pengiris Daging', 'MKS-70', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-05ed-4541-9875-b30afa60a6e5', '9da64f65-6e1d-4875-90da-1177573918e5', '2024-08-28', 'Ice Crusher', 'MKS-002', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-0808-4990-ab48-005c2ed4fd7d', '9da64f65-6f89-43f2-96aa-4ff68bb343ca', '2024-08-28', 'Miller', 'MKS-ML200', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-0a2c-48e0-bf52-c9a2038d1160', '9da64f65-711c-43d9-b081-0b9bdea7b1cb', '2024-08-28', 'Mesin Takoyaki Gas', 'MKS-711B', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-0c61-4bcc-9ca4-d212be1c1849', '9da64f65-728b-4172-84e3-06d8759df6dd', '2024-08-28', 'Mini Coffe Roster', 'CRG-400', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-0eb3-472c-ba10-6531facf8d2a', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-08-28', 'Cup Sealer', 'CPS-959', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-1123-4d3d-8aae-aa6dfe7de078', '9da64f65-75db-41ba-9b37-c7722ad2d2a3', '2024-08-28', 'Ice Crusher', 'MKS-CRS30', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-134d-482d-a2f9-b953c080c847', '9da64f65-7767-4c00-93f4-736894467b16', '2024-08-28', 'Mesin Stand Mixer', 'ARD-MR7', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-15bb-40fa-8ef7-cf6283fcbe1f', '9da64f65-7b24-4844-addd-2f9fd622f8c5', '2024-08-28', 'Mesin Mixer Spiral ', 'MKS-SP50', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-1831-48f5-8892-19af2b8171fc', '9da64f66-c520-48c9-b160-ff38d5e0d77e', '2024-08-28', 'Mesin Sosis Telur (Listrik)', 'GRILLO-400', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-1a68-45b0-809e-a75c4f2dda83', '9da64f66-c713-4641-8062-a0249147870a', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS6', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-1cb1-41d7-88f1-240322e8d344', '9da64f66-4e21-4561-a052-46dab2198f55', '2024-08-28', 'Mesin Sosis Telur (Listrik)', 'MKS-ERG005', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-1ee7-486b-ab35-aaed8f4df619', '9da64f66-c90a-4537-a61c-5369ecfa9fc6', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'MKS-ERG002', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-2127-4971-93b1-5ea81d937e47', '9da64f66-caca-4c5f-8306-2fe93b3fc84a', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'MKS-ERG444', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-2384-4609-9b40-a68f606c20e7', '9da64f66-4faf-4482-8cc5-2f25e1588669', '2024-08-28', 'Mesin Ice Crusher', 'MKS-003', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-25e2-406e-969b-3e121d1429c9', '9da64f66-ccfc-4013-8a3e-8ec690d95fd2', '2024-08-28', 'Mesin Ice Crusher', 'MKS-CRS30', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-2848-4dc7-9c1f-4ff51fa7a0f9', '9da64f66-cf4c-45fa-86af-f6770a51f2db', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS10', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-2a7d-4048-8d63-d2da51d4496b', '9da64f66-5209-40e4-9c35-7cb1436ba98f', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'MKS-ERG007', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-2cf4-4e65-aae6-d656e45d0900', '9da64f66-53c3-46f8-bd0c-e91607637ca2', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT24', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-2f6d-41af-8581-0a2c1a73c21c', '9da64f66-55d3-4bbe-9a87-5a00628f292d', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT24A', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-323b-44e8-8591-fb56d744e3fe', '9da64f66-062c-4a1b-af06-e6bddd6d8e61', '2024-08-28', 'Mesin hand Sealer', 'MSP-200I', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-351e-469f-9df3-0cbfee707eef', '9da64f66-5897-43ab-b026-d83a05a61dd9', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT96', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-3772-4b60-9720-5e0cf1677496', '9da64f65-dc5f-466d-a7bd-9d4f2c417f80', '2024-08-28', 'Mesin Kopi Espresso', 'MKS-MKP50', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-39af-4670-b02b-36125d96cddd', '9da64f66-5abc-4914-9ede-907e2ca664b9', '2024-08-28', 'Mesin Filling Cairan Otomatis', 'MSP-F50', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-3c35-435a-ae4e-0b01627c101d', '9da64f66-5cbb-4446-877c-e10b421e4f67', '2024-08-28', 'Rok Espresso', 'Rok Espresso', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-3ee8-43cd-8790-a51bb83ab3a9', '9da64f66-5fc4-402e-9559-8038aee50bd8', '2024-08-28', 'Mesin Standing Mixer', 'MKS-MIX130', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-4151-4a58-bf97-13c296452866', '9da64f66-61a6-438e-968b-536f6dc53069', '2024-08-28', 'Mesin Vacum Sealer', 'ARD-VS02', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-43a2-46dc-93db-5c075dbdd3ad', '9da64f66-d18b-417f-bb67-632f99a1e3d4', '2024-08-28', 'Mesin Es Krim Buah', 'ICE-01', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-4644-4e29-b925-4473744f5efe', '9da64f66-01dd-4bf3-8e30-e156793e7eb0', '2024-08-28', 'Mesin Hand Sealer', 'MSP-400A', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-4886-42fb-8f2d-092708c4d4e4', '9da64f66-6353-4e10-a81d-f8b803505e70', '2024-08-28', 'Mesin Hand Sealer', 'MSP-400I', 0, 0, 18, 18, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-4aa3-44a3-b5e7-0b3185bdf6de', '9da64f66-d491-4cd0-8b92-3b697a5b9dba', '2024-08-28', 'Mesin Giling Daging', 'MHW-G51B', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-4d1c-4e6e-859c-fc7ac2d50e98', '9da64f66-65b6-491d-8165-12de57647ae4', '2024-08-28', 'Mesin Cetak Pelet Manual', 'PLT-10', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-4f59-4d86-a972-54acd59e8bc5', '9da64f66-d6b3-4bb3-9e0d-44261115eacb', '2024-08-28', 'Mesin pencacah Bumbu Dapur', 'MKS-UV22', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-51ac-4a20-a097-008205f68006', '9da64f66-6785-4578-bf83-6622ddda4453', '2024-08-28', 'Mesin Penepung Herbal, biji', 'MKS-ML300', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-545b-44b6-984e-8b12b142f18e', '9da64f66-d882-4eb3-acd2-99274bbad057', '2024-08-28', 'Mesin Penepung Herbal, biji', 'MKS-ML100', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-56bb-4dee-9e5a-5e61ba08743e', '9da64f66-690b-4f40-bb21-073474810257', '2024-08-28', 'Mesin Grinder Kopi', 'GRD-80A', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-5916-4174-b65a-477c6d900cb0', '9da64f66-6b1b-4e84-b2f5-73209f99cfe8', '2024-08-28', 'Mesin Kebab', 'MKS-KB01', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-5bd5-432a-8820-c057a71ad2c1', '9da64f65-f7b9-40c8-afa8-e24f0a1ad4d7', '2024-08-28', 'Mesin Takoyaki Listrik', 'MKS-700E', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-5ddc-49b0-ab3a-d4ce10b56605', '9da64f66-6ce4-4386-99a0-1c6cac17bee0', '2024-08-28', 'Mesin Coklat Fountain', 'MKS-CC6', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-6051-45d6-8db3-8a6222db0b76', '9da64f66-6ea6-43c1-a541-776189485660', '2024-08-28', 'Food Dryer', 'MKS-DR6', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-628f-4f87-bc7b-93029ac77083', '9da64f66-7084-47d4-95fc-acbe07bf30b4', '2024-08-28', 'Deep Fryer', 'MKS-82B', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-6467-47eb-bee0-22d9ca3e3a0a', '9da64f66-7355-4240-bb84-82710a1b39cb', '2024-08-28', 'Alat Penanam Biji-Bijian', 'ARD-SED01', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-66a6-42d8-9700-608280374b34', '9da64f66-7502-4077-bf44-63c8fcf492c3', '2024-08-28', 'Alat Penanam Biji-Bijian', 'ARD-SED02', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-68e1-471f-b26f-e6f6923401c8', '9da64f66-76e1-4c63-8d7b-be9153015509', '2024-08-28', 'Mesin Bread Maker', 'ARD-BM66X', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-6b3e-4f47-8b66-388ebd8a12ba', '9da64f66-7952-4970-96cb-7a6f77c3eb19', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT56', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-6dc3-4761-881a-1ba1191c31dc', '9da64f66-7b12-45ba-80f4-4d3f13fd1152', '2024-08-28', 'Blender Komersial', 'MKS-BL10L', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-7001-4735-84aa-ba38826ef99d', '9da64f66-7cf1-4eae-ac4a-8e3e166431dd', '2024-08-28', 'Bread Toaster', 'MKS-D04', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-726b-4c7f-b134-fe9532739320', '9da64f66-7ef4-4486-9ab0-82393074e426', '2024-08-28', 'Deep Fryer', 'MKS-51B', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-74a9-4ba9-a7d3-f245843ec1be', '9da64f66-810a-4f08-b2c9-4c499462faaa', '2024-08-28', 'Deep Fryer', 'MKS-81', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-76ea-4675-b827-eb4ec0e7329d', '9da64f66-82f4-49de-a270-c8c31126d56b', '2024-08-28', 'Deep Fryer', 'MKS-82', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-7ce0-4229-9055-e422d82e51c2', '9da64f66-0033-4d58-9d7a-8ddc35a1a3be', '2024-08-28', 'Cetak Mie dan Pasta', 'ARD-NM4', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-7f3d-44a2-a275-1b4d8e7d44f0', '9da64f66-dae9-4772-9c12-f816219422b1', '2024-08-28', 'Pemanggang 2 Tungku', 'MKS-111BBQ', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-81b1-4671-9eaa-fa13f1e7fddb', '9da64f66-850d-4e73-82af-0872a2177a9b', '2024-08-28', 'Food Dryer', 'MKS-DR10', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-83e7-4d11-85ce-638cada12261', '9da64f66-86ff-4e0d-8cf6-0d11de84a2c3', '2024-08-28', 'Deep Fryer', 'MKS-G20L +Keranjang', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-864b-4ec5-b82c-556f8d536ccd', '9da64f66-dcb1-4bf9-aec6-1aaecdab2b1a', '2024-08-28', 'Deep Fryer', 'MKS-72', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-88a9-4060-a380-a8b4bde5dea4', '9da64f65-f531-4596-9bcf-fbb108022a13', '2024-08-28', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-8afd-4fad-bcc9-9185b9a84978', '9da64f66-dec7-4463-8c79-143fdaf274f0', '2024-08-28', 'Mesin Pemanggang Listrik', 'MKS-PG2', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-8d78-4833-b744-32e911e466ab', '9da64f66-e178-4b89-8e43-de18ca2c6179', '2024-08-28', 'Manual Meat Slicer', 'MKS-MSL66', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02');
INSERT INTO `tb_stok_barang` (`id_stok`, `id_barang`, `tanggal`, `nama_barang`, `tipe_barang`, `barang_masuk`, `barang_keluar`, `stok_awal`, `stok_akhir`, `posisi`, `keterangan`, `created_at`, `updated_at`) VALUES
('9da6f12b-8faf-4234-8585-fb3d2cb9613f', '9da64f66-890c-42e0-aac9-c76e65bea1d2', '2024-08-28', 'Mesin Manual Meat Mixer', 'MKS-MM01', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-9207-4b28-90e1-5956ff18f635', '9da64f65-78d7-4bd9-9235-3481b2a92716', '2024-08-28', 'Mesin Cetak Mie', 'MKS-145', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-9455-4d0f-9e14-c938cb6f16a7', '9da64f66-8b11-4f71-86dc-5a3737ae8ed0', '2024-08-28', 'Mesin Ice Tube', 'MKS-IM22', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f12b-9696-4f4f-94d2-4a89c94db4bc', '9da64f66-8ddf-47c3-872a-a3dab1cdd1ff', '2024-08-28', 'Mesin Takoyaki Gas ', 'MKS-722B', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 12:56:02', '2024-12-05 12:56:02'),
('9da6f138-1cb1-414c-9226-f2264166971c', '9da6529d-d0f6-4226-a2c2-94022bb524fd', '2024-08-28', 'Sparepart Baut Saringan Susu Kedalai SKD-100B', 'SKD-100B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-1fe8-4ab5-b3da-d64236b598cd', '9da6529d-da49-49f7-830e-f1801770ce7e', '2024-08-28', 'Sparepart Conveyor Pendek/Atas Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-2230-4210-a6a5-d49d659c5855', '9da6529d-e100-4209-85bd-fe969f8d7424', '2024-08-28', 'Sparepart Conveyor Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-24b3-4308-a2eb-1d4c184bc450', '9da6529d-e84c-4647-94e2-072a5dfe4b09', '2024-08-28', 'Sparepart Moulding Ukuran 1 Cm Cetak Tablet MKS-TBL11', 'MKS-TBL11', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-26cd-4168-8d99-7ee3e3cd950b', '9da6529d-ef1b-437c-baf2-f374c40929df', '2024-08-28', 'Sparepart PCB Tetas Telur AGR-TT96 Versi Lama', 'AGR-TT96', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-2929-45d1-a9f6-8b15b8d41079', '9da6529d-f556-4fca-8a3f-e3c23275cebe', '2024-08-28', 'Sparepart Pisau Penyerut Tusuk Sate Uk 4 mm ST-103 HS', 'ST-103', 0, 0, 10, 10, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-2b8c-4086-85a1-bfd750fd4657', '9da6529d-fbfb-4ace-bc51-a732d94c2792', '2024-08-28', 'Sparepart Roda (Hidup) Per-PCS Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-2dc4-4242-8293-286cc2331ddf', '9da6529e-031e-4eef-8f51-06ff2096616a', '2024-08-28', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-400', 'Grillo-400', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-3047-43c0-873a-acb0242f2d0c', '9da6529e-0a2c-4cc9-8f3d-ab88cbeb5e9e', '2024-08-28', 'Sparepart Sisir Cetak Mie MKS-220SS', 'MKS-220SS', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-3289-4328-a855-ed146d3e0cdc', '9da6529e-1036-494d-9293-82a035d0679b', '2024-08-28', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-GS10', 'Grillo-GS10', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-34e0-46c3-ad00-001c4ef5cc7e', '9da6529e-172d-490d-870b-7cb531df5222', '2024-08-28', 'Sparepart Heating Element MSP-300I', 'MSP-300I', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-3730-4888-8691-303d62775efe', '9da6529e-1ec0-49bf-a79c-5dcb22f378f9', '2024-08-28', 'Sparepart Kain Teflon MSP-300i', 'MSP-300I', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-3954-4382-8569-7a1b51a1fbb2', '9da6f138-381a-4abb-986f-73a9f2408150', '2024-08-28', 'Sparepart Pisau 4mm Vegetable\nCutter MKS-CT100\n', 'MKS-CT100', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-3bb5-47f5-8d5f-b48dd8a383bf', '9da6529e-2b73-4afb-95d7-c1f9757fb3e0', '2024-08-28', 'Sparepart  Keramik Humidifier Tetas Telur AGR TT360', 'AGR TT360', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-3e42-4c67-8687-93c289c223d2', '9da6529e-325e-40ed-9a5f-f355f68bd4f6', '2024-08-28', 'Sparepart Rak 1 Set Tetas Telur AGR-TT360', 'AGR TT360', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-404d-4f0c-a871-b17257e77180', '9da6f138-3f23-47e9-8eb6-e8758896e454', '2024-08-28', 'Sparepart Screw Giling Daging \nMHW-120\n', 'MHW-120', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-42a1-4147-97da-caa0d67bd2dd', '9da6529e-3f4c-4655-83f2-24181bced320', '2024-08-28', 'Sparepart Penjepit Cetak Bakso MKS-MFC280', 'MKS-MFC280', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-4502-40e5-be01-051f6920e3fc', '9da6529e-45d3-4869-aa42-6b4bffc42502', '2024-08-28', 'Sparepart Ring Cup Sealer Uk. 88mm 10-16 Oz CPS-959', 'CPS-959', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-4736-4206-bd42-0c54ede1e004', '9da6529e-4bff-415a-8c3a-cc57bacc757c', '2024-08-28', 'Sparepat Per Cetak Bakso MKS-MFC280', 'MKS-MFC280', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-498f-47ee-bb16-cb29c24c4dc3', '9da6f138-4819-4caa-be6e-f63709ab2142', '2024-08-28', 'Baut pengunci kecil cetak mie', 'CM-123', 0, 0, 4, 4, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-4beb-4b9b-85c4-a559ffef6c19', '9da6529e-5852-416d-bb45-f992b3cbd61c', '2024-08-28', 'Sparepart penutup bawah eggroll ERG-001,ARD-202,ARD-404', 'ERG-001,ARD-202,ARD-404', 0, 0, 11, 11, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-4e2f-475a-8731-554bf40e1eba', '9da6529e-5d3b-4c6b-a1a8-f6cd51502cc9', '2024-08-28', 'Sparepart Ring moulding Uk.66mm 8 oz CPS-959', 'CPS-959', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-5099-4c6e-93ba-862229949f53', '9da6529e-620e-4426-855d-d73ecaafd7a1', '2024-08-28', 'PCB KZB-1', 'KZB-1', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-52ec-48b2-83a2-fc580616db03', '9da6529e-670d-4ab2-8374-9469ab6e1acd', '2024-08-28', 'Sparepart corong atas perajang rumput AGR-CH400B', 'AGR-CH400B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-5542-4a13-9298-6387fb20844e', '9da6529e-6cce-4f59-94ea-e5b12365db8b', '2024-08-28', 'Pisau penyerut mesin giling daging MHW-G51B/Kecil', 'MHW-G51B/Kecil', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-5802-42c7-afe1-e37e174c917c', '9da6529e-71e3-44af-90b2-e97a8d40d649', '2024-08-28', 'Sparepart Tray Food Dehidrator ARD-PM99', 'ARD-PM99', 0, 0, 5, 5, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f138-5a71-43e3-ac15-e9007728780e', '9da6f138-58f8-4d11-8f4a-049137413704', '2024-08-28', 'Sparepart Pully Kecil Cetak Mie MKS-220SS', 'MKS-220SS', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 13:19:04'),
('9da6f138-5d00-49f9-b361-db5f112497ee', '9da6529e-7c6b-4ec3-83f4-0641b633333e', '2024-08-28', 'Sparepart Tombol Emergency Mixer Planetary MKS-20B/30B', 'MKS-20B/30B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 12:56:11', '2024-12-05 12:56:11'),
('9da6f391-57b8-474c-93c4-f7bca8a36abc', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-04', 'Cup Sealer', 'CPS-959', 0, 1, 4, 3, 'Rak-4', 'stok', '2024-12-05 13:02:45', '2024-12-05 13:02:45'),
('9da6f546-8e7b-40e6-969d-824202489e60', '9da65bd1-a4d8-433f-bc65-3db1f41af518', '2024-09-04', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', 1, 1, 0, 0, 'Kasir', 'stok', '2024-12-05 13:07:31', '2024-12-05 13:12:56'),
('9da6faf9-ad13-4edc-a726-53cde7842737', '9da6f138-58f8-4d11-8f4a-049137413704', '2024-09-04', 'Sparepart Pully Kecil Cetak Mie MKS-220SS', 'MKS-220SS', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-05 13:23:27', '2024-12-05 13:23:27'),
('9da6fc2a-5524-4b9a-9092-071d51da4879', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-05', 'Cup Sealer', 'CPS-959', 0, 1, 3, 2, 'Rak-4', 'stok', '2024-12-05 13:26:47', '2024-12-05 13:26:47'),
('9da6fe6c-1cf1-43e0-8eb7-f997c121a092', '9da6fde0-40e9-4c67-b738-4c8701164da3', '2024-09-06', 'Sparepart Termostat Cup Sealer Manual CPS-919, CPS-818, CPS-959', 'CPS-919/CPS-818/CPS-959', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-05 13:33:06', '2024-12-05 13:35:16'),
('9da70645-6ca8-40c3-94f7-027ba3d10e9c', '9da6ab0f-a6f3-4e68-bf7f-27dd55b0ed93', '2024-09-07', 'Sparepart Gear Kecil Besi 2CM Cetak Mie', 'MKS-135/MKS-140/MKS-145', 8, 0, 0, 8, 'Kasir', 'stok', '2024-12-05 13:55:03', '2024-12-05 13:55:03'),
('9da706de-79a4-40bf-939d-5ec71e7945b8', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '2024-09-07', 'Mesin Cetak Mie', 'MKS-140', 1, 0, 0, 1, 'Kasir', 'stok', '2024-12-05 13:56:43', '2024-12-05 13:56:43'),
('9da7074b-77ab-427c-88af-032a36d09768', '9da64f65-5a9b-40d7-82f3-cf4253b69d72', '2024-09-07', 'Mesin Gas Deep Fryer', 'MKS-72', 1, 1, 0, 0, 'Kasir', 'stok', '2024-12-05 13:57:54', '2024-12-05 14:12:50'),
('9da707bf-dab1-4eb5-a539-aaf5c260387d', '9da6ab74-a15d-4edb-9282-7a7fe091984c', '2024-09-07', 'Sparepart Karet Seal Double Soft Ice Cream', 'ISC-16/ISC-16S', 1, 0, 0, 1, 'Kasir', 'stok', '2024-12-05 13:59:11', '2024-12-05 13:59:11'),
('9da708af-d980-41cd-b690-608ff97f1866', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-07', 'Cup Sealer', 'CPS-959', 0, 2, 2, 0, 'Rak-4', 'stok', '2024-12-05 14:01:48', '2024-12-05 14:01:48'),
('9da709a1-dd81-465a-83ee-0bfa4e5a6d51', '9da64f66-3336-4189-b4d8-d450fc76dc93', '2024-09-07', 'Alat Perajang singkong manual', 'PRJ-M', 0, 1, 2, 1, 'Rak-3', 'stok', '2024-12-05 14:04:27', '2024-12-05 14:04:27'),
('9da70af9-86b9-4c03-be14-0daf7f15df03', '9da64f66-61a6-438e-968b-536f6dc53069', '2024-09-07', 'Mesin Vacum Sealer', 'ARD-VS02', 0, 2, 2, 0, 'Gudang-Lt2', 'stok', '2024-12-05 14:08:12', '2024-12-05 14:08:12'),
('9da70e30-0671-4507-8e4f-570f4ba1da26', '9da64f66-2f53-49c4-9107-aeee9d9424db', '2024-09-09', 'Mesin Universal Fritter', 'MKS-UV22', 0, 1, 1, 0, 'Rak-3', 'stok', '2024-12-05 14:17:11', '2024-12-05 14:17:11'),
('9da711bf-cf71-47cc-9200-9af58b1eef15', '9da64f65-127d-4ef5-a543-664425d38e13', '2024-09-09', 'Mesin Universal Fritter', 'MKS-UV44', 0, 1, 1, 0, 'Rak-3', 'stok', '2024-12-05 14:27:08', '2024-12-05 14:27:08'),
('9da731b4-197a-4dc3-af95-c724fffead07', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '2024-09-10', 'Mesin Cetak Mie', 'MKS-140', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-05 15:56:29', '2024-12-05 15:56:29'),
('9da7450c-9884-4653-ba93-f2e15137e426', '9da68e98-72d0-470e-93f8-226a95c52506', '2024-09-10', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-05 16:50:35', '2024-12-05 23:03:27'),
('9da74530-75c8-49cf-b832-f0449d69b6cc', '9da68ed5-68dc-4210-ac27-39d36e426e9e', '2024-09-10', 'Sparepart Bearing 6205', 'ADT-SM20', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-05 16:50:59', '2024-12-05 23:04:54'),
('9da7ccae-9462-495f-9e67-11a63b8ef651', '9da64f65-4f20-40ca-93f6-180df6443d13', '2024-09-11', 'Mesin egg Roll', 'MKS-ERG001', 0, 1, 3, 2, 'Gudang-Lt1', 'stok', '2024-12-05 23:09:50', '2024-12-05 23:09:50'),
('9da7d06a-ea1b-41f6-8d26-90889ff66459', '9da7d00b-f2cc-4cc5-8128-84edc2e06d89', '2024-09-12', 'Sparepart Tombol ON/OFF Rotating Waffle Maker', 'MKS-RTW01', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-05 23:20:17', '2024-12-05 23:22:57'),
('9da7d5f8-9355-4c6f-a7c0-6bcd690c5176', '9da6ab74-a15d-4edb-9282-7a7fe091984c', '2024-09-13', 'Sparepart Karet Seal Double Soft Ice Cream', 'ISC-16/ISC-16S', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-05 23:35:49', '2024-12-05 23:35:49'),
('9da7d76f-e0f2-4396-a760-d1b4aa049fd6', '9da72e3a-d7bf-46cd-ac7b-b5cd3f4ad0d4', '2024-09-14', 'Mesin Ice Tube', 'MKS-IM120', 1, 0, 0, 1, 'Kasir', 'stok', '2024-12-05 23:39:55', '2024-12-05 23:39:55'),
('9da7d7dd-31d1-4a0c-ba7a-dfc4b6289d58', '9da64f66-c359-475a-98a2-8ca88212f2d0', '2024-09-14', 'Mesin Ice Tube', 'MKS-IM100', 1, 0, 0, 1, 'Kasir', 'stok', '2024-12-05 23:41:06', '2024-12-05 23:41:06'),
('9da7d859-64d5-4702-9091-7dbbaaf41296', '9da70f5b-c019-4418-b2ac-b6dc40056624', '2024-09-14', 'Mesin Pengupas Kelapa Manual', 'MKS-KLP01', 1, 1, 0, 0, 'Kasir', 'stok', '2024-12-05 23:42:28', '2024-12-06 00:11:07'),
('9da7dcf8-9e6e-4b44-807c-9481238b619f', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-14', 'Cup Sealer', 'CPS-959', 6, 0, 0, 6, 'Rak-4', 'stok', '2024-12-05 23:55:23', '2024-12-06 00:25:49'),
('9da7dd95-b502-4566-b675-871bc942ba9c', '9da64f65-7767-4c00-93f4-736894467b16', '2024-09-14', 'Mesin Stand Mixer', 'ARD-MR7', 3, 0, 0, 3, 'Gudang-Lt1', 'stok', '2024-12-05 23:57:06', '2024-12-05 23:57:06'),
('9da7deb2-bdeb-4407-919d-65b31256b673', '9da64f66-062c-4a1b-af06-e6bddd6d8e61', '2024-09-14', 'Mesin Hand Sealer', 'MSP-200I', 0, 1, 1, 0, 'Rak-3', 'stok', '2024-12-06 00:00:13', '2024-12-06 00:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `tb_top_product`
--

CREATE TABLE `tb_top_product` (
  `id_top_product` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `kode_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_barang` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_top_product`
--

INSERT INTO `tb_top_product` (`id_top_product`, `id_barang`, `tanggal`, `kode_barang`, `nama_barang`, `tipe_barang`, `total_barang`, `created_at`, `updated_at`) VALUES
('9da689bb-b83d-4872-a649-96a76d031a78', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-08-28', '601018004', 'Cup Sealer', 'CPS-959', 2, '2024-12-05 08:06:49', '2024-12-05 08:08:43'),
('9da6913d-c7b9-45c6-afa9-c50133d237b8', '9da68e98-72d0-470e-93f8-226a95c52506', '2024-08-30', '102229057', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 1, '2024-12-05 08:27:48', '2024-12-05 08:27:48'),
('9da6924d-10d1-4e02-a720-1fccb289975e', '9da68ed5-68dc-4210-ac27-39d36e426e9e', '2024-08-30', '102263010', 'Sparepart Bearing 6205', 'ADT-SM20', 1, '2024-12-05 08:30:46', '2024-12-05 08:30:46'),
('9da69629-2ec6-4ee0-99a8-61b2db16b5a1', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-04', '601018004', 'Cup Sealer', 'CPS-959', 2, '2024-12-05 08:41:34', '2024-12-05 13:02:45'),
('9da6a1c9-4d3b-49c7-9cbf-8eda338b0a4d', '9da65bd1-a4d8-433f-bc65-3db1f41af518', '2024-09-04', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', 2, '2024-12-05 09:14:04', '2024-12-05 13:12:56'),
('9da6a4ad-a0ee-43bb-81b4-793917b9f013', '9da6529e-76cd-4ccf-a3d6-34d0762285ac', '2024-09-04', '102226097', 'Sparepart Pully Kecil Cetak Mie MKS-220SS/MKS-160/MKS-240SS/MKS-200', 'MKS-220SS/MKS-160/MKS-240SS/MKS-200', 1, '2024-12-05 09:22:09', '2024-12-05 09:22:09'),
('9da6faf9-afce-4099-ab9d-095dd372c32c', '9da6f138-58f8-4d11-8f4a-049137413704', '2024-09-04', '102226097', 'Sparepart Pully Kecil Cetak Mie MKS-220SS', 'MKS-220SS', 1, '2024-12-05 13:23:27', '2024-12-05 13:23:27'),
('9da6fc2a-581b-4d4d-8aaf-8aaf06e54ecb', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-05', '601018004', 'Cup Sealer', 'CPS-959', 1, '2024-12-05 13:26:47', '2024-12-05 13:26:47'),
('9da6ff32-403d-494b-b44f-503ee7419c85', '9da6fde0-40e9-4c67-b738-4c8701164da3', '2024-09-06', '302052003', 'Sparepart Termostat Cup Sealer Manual CPS-919, CPS-818, CPS-959', 'CPS-919/CPS-818/CPS-959', 1, '2024-12-05 13:35:16', '2024-12-05 13:35:16'),
('9da708af-dc07-438b-b57f-1b801c7885a4', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-07', '601018004', 'Cup Sealer', 'CPS-959', 2, '2024-12-05 14:01:48', '2024-12-05 14:01:48'),
('9da709a1-e101-40f0-960b-a433d080a78b', '9da64f66-3336-4189-b4d8-d450fc76dc93', '2024-09-07', '201011001', 'Alat Perajang singkong manual', 'PRJ-M', 1, '2024-12-05 14:04:27', '2024-12-05 14:04:27'),
('9da70af9-8952-4e23-895c-c8ec964f7d90', '9da64f66-61a6-438e-968b-536f6dc53069', '2024-09-07', '301015027', 'Mesin Vacum Sealer', 'ARD-VS02', 2, '2024-12-05 14:08:12', '2024-12-05 14:08:12'),
('9da70ca2-48ae-4a6f-911c-52bb885748aa', '9da64f65-5a9b-40d7-82f3-cf4253b69d72', '2024-09-07', '601019016', 'Mesin Gas Deep Fryer', 'MKS-72', 1, '2024-12-05 14:12:50', '2024-12-05 14:12:50'),
('9da70e30-090a-4398-949b-3c50a1fc9853', '9da64f66-2f53-49c4-9107-aeee9d9424db', '2024-09-09', '101042007', 'Mesin Universal Fritter', 'MKS-UV22', 1, '2024-12-05 14:17:11', '2024-12-05 14:17:11'),
('9da711bf-d260-4f18-8689-8a8f4bb56251', '9da64f65-127d-4ef5-a543-664425d38e13', '2024-09-09', '101042008', 'Mesin Universal Fritter', 'MKS-UV44', 1, '2024-12-05 14:27:08', '2024-12-05 14:27:08'),
('9da731b4-1c0f-46c5-9845-1970a6309e9b', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '2024-09-10', '601006004', 'Mesin Cetak Mie', 'MKS-140', 1, '2024-12-05 15:56:29', '2024-12-05 15:56:29'),
('9da7ca65-d708-4a11-9183-6ab5238c9f6b', '9da68e98-72d0-470e-93f8-226a95c52506', '2024-09-10', '102229057', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 1, '2024-12-05 23:03:27', '2024-12-05 23:03:27'),
('9da7cae9-b3cd-491c-ad1d-6a86db8a2b5d', '9da68ed5-68dc-4210-ac27-39d36e426e9e', '2024-09-10', '102263010', 'Sparepart Bearing 6205', 'ADT-SM20', 1, '2024-12-05 23:04:54', '2024-12-05 23:04:54'),
('9da7ccae-96b8-4174-bb74-707ec9de1ea8', '9da64f65-4f20-40ca-93f6-180df6443d13', '2024-09-11', '101063008', 'Mesin egg Roll', 'MKS-ERG001', 1, '2024-12-05 23:09:50', '2024-12-05 23:09:50'),
('9da7d15f-0ed8-4184-bb2c-ad27b83c7ab4', '9da7d00b-f2cc-4cc5-8128-84edc2e06d89', '2024-09-12', '102225079', 'Sparepart Tombol ON/OFF Rotating Waffle Maker', 'MKS-RTW01', 1, '2024-12-05 23:22:57', '2024-12-05 23:22:57'),
('9da7d5f8-95e0-4774-bbd7-54384ff924f2', '9da6ab74-a15d-4edb-9282-7a7fe091984c', '2024-09-13', '102238213', 'Sparepart Karet Seal Double Soft Ice Cream', 'ISC-16/ISC-16S', 1, '2024-12-05 23:35:49', '2024-12-05 23:35:49'),
('9da7deb2-c0c5-4f6a-a916-7e91764e33cc', '9da64f66-062c-4a1b-af06-e6bddd6d8e61', '2024-09-14', '301007001', 'Mesin Hand Sealer', 'MSP-200I', 1, '2024-12-06 00:00:13', '2024-12-06 00:00:13'),
('9da7e297-f054-4553-b7be-88e1663370c9', '9da70f5b-c019-4418-b2ac-b6dc40056624', '2024-09-14', '101297008', 'Mesin Pengupas Kelapa Manual', 'MKS-KLP01', 1, '2024-12-06 00:11:07', '2024-12-06 00:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_penjualan`
--

CREATE TABLE `tb_transaksi_penjualan` (
  `id_transaksi` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_stok` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_transaksi` date NOT NULL,
  `kode_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_konsumen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_handphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_sales` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_barang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` int NOT NULL,
  `harga_barang` decimal(12,2) NOT NULL,
  `posisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pembayaran` enum('belum lunas','lunas') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'belum lunas',
  `status_transaksi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
('9da6f391-5377-40f7-9463-6a59d5e982b8', '9da64f65-7470-45f3-997c-5b274e63cad6', '9da6f12a-53d1-4686-a216-dfd45736d573', '2024-09-04', 'SI.2024.09.00002', 'Roy Putra, Bpk', '085265802234', 'Jl.Lintas Timur KM-19  - Riau', 'Tia Saputri', '601018004', 'Cup Sealer', 'CPS-959', 1, '1400000.00', 'Rak-4', 'lunas', 'non tunai', '0.00', '910000.00', 35, '910000.00', '0.00', '2024-12-05 13:02:45', '2024-12-05 13:02:45'),
('9da6f736-6b87-44ca-9b8c-33febf39cad0', '9da65bd1-a4d8-433f-bc65-3db1f41af518', '9da6f546-8e7b-40e6-969d-824202489e60', '2024-09-04', 'SI.2024.09.00003', 'Bpk Darliansyah', '08126814341', 'Jl.Cipta Karya Perum Villa - Pekanbaru - Riau', 'Muhammad Reza', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', 1, '260000.00', 'Kasir', 'lunas', 'tunai', '0.00', '260000.00', 0, '260000.00', '0.00', '2024-12-05 13:12:56', '2024-12-05 13:12:56'),
('9da6faf9-a9c4-4280-b3a0-7214b6b416e8', '9da6f138-58f8-4d11-8f4a-049137413704', '9da6f138-5a71-43e3-ac15-e9007728780e', '2024-09-04', 'SI.2024.09.00023', 'Bpk Indra Mahira', '082173214448', 'Jl.Tanjung Pati Sari Lamak Payakumbuh Sumatra Barat', 'Muhammad Reza', '102226097', 'Sparepart Pully Kecil Cetak Mie MKS-220SS', 'MKS-220SS', 1, '60000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '60000.00', 0, '60000.00', '0.00', '2024-12-05 13:23:27', '2024-12-05 13:23:27'),
('9da6fc2a-5152-40ea-9b4f-27606441d49d', '9da64f65-7470-45f3-997c-5b274e63cad6', '9da6f391-57b8-474c-93c4-f7bca8a36abc', '2024-09-05', 'SI.2024.09.00004', 'Ibu Rita Agustina', '085182067297', 'Jl.Kruing No.450, Pekanbaru - Riau', 'Tia Saputri', '601018004', 'Cup Sealer', 'CPS-959', 1, '1400000.00', 'Rak-4', 'lunas', 'tunai', '0.00', '910000.00', 35, '910000.00', '0.00', '2024-12-05 13:26:47', '2024-12-05 13:26:47'),
('9da6ff32-3952-4675-8ac4-633f81edd575', '9da6fde0-40e9-4c67-b738-4c8701164da3', '9da6fe6c-1cf1-43e0-8eb7-f997c121a092', '2024-09-06', 'SO.2024.09.00003', 'Bpk Aria', '081325256325', 'Beringin Eddy - Pekanbaru - Riau', 'Muhammad Reza', '302052003', 'Sparepart Termostat Cup Sealer Manual CPS-919, CPS-818, CPS-959', 'CPS-919/CPS-818/CPS-959', 1, '110000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '110000.00', 0, '110000.00', '0.00', '2024-12-05 13:35:16', '2024-12-05 13:35:16'),
('9da708af-d623-49a9-bde8-a736f774af5c', '9da64f65-7470-45f3-997c-5b274e63cad6', '9da6fc2a-5524-4b9a-9092-071d51da4879', '2024-09-07', 'SI.2024.09.00006', 'Bpk Aria', '081325256325', 'Beringin Eddy - Pekanbaru - Riau', 'Muhammad Reza', '601018004', 'Cup Sealer', 'CPS-959', 2, '1400000.00', 'Rak-4', 'lunas', 'tunai', '0.00', '1820000.00', 35, '1820000.00', '0.00', '2024-12-05 14:01:48', '2024-12-05 14:01:48'),
('9da709a1-d9f9-4090-850b-5f0078c7dc04', '9da64f66-3336-4189-b4d8-d450fc76dc93', '9da6f12a-4ae5-4e0b-b0b3-5b3a32fdaa51', '2024-09-07', 'SI.2024.09.00008', 'Ibu weni', '085263513605', 'Kubang - Riau', 'Tia Saputri', '201011001', 'Alat Perajang singkong manual', 'PRJ-M', 1, '540000.00', 'Rak-3', 'lunas', 'tunai', '0.00', '540000.00', 0, '540000.00', '0.00', '2024-12-05 14:04:27', '2024-12-05 14:04:27'),
('9da70af9-8347-4d42-8ea5-e7f9fe25514c', '9da64f66-61a6-438e-968b-536f6dc53069', '9da6f12b-4151-4a58-bf97-13c296452866', '2024-09-07', 'SI.2024.09.00009', 'Koperasi Batobo Korpri Kampar', '082173062405', 'Prof M.Yamin No.278, Langgini, Bangkinang Kota, Kab.Kampar, Riau', 'Tia Saputri', '301015027', 'Mesin Vacum Sealer', 'ARD-VS02', 2, '1190000.00', 'Gudang-Lt2', 'lunas', 'non tunai', '0.00', '2380000.00', 0, '2380000.00', '0.00', '2024-12-05 14:08:12', '2024-12-05 14:08:12'),
('9da70ca2-426c-4256-8a2d-d444b49a7289', '9da64f65-5a9b-40d7-82f3-cf4253b69d72', '9da7074b-77ab-427c-88af-032a36d09768', '2024-09-07', 'SI.2024.09.00010', 'Bpk Yosse Rizal', '081270160332', 'Jl. uji coba', 'Ade Yolanda', '601019016', 'Mesin Gas Deep Fryer', 'MKS-72', 1, '2810000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '2810000.00', 0, '2810000.00', '0.00', '2024-12-05 14:12:50', '2024-12-05 14:12:50'),
('9da70e30-0237-4cfb-9644-53f5015b85e7', '9da64f66-2f53-49c4-9107-aeee9d9424db', '9da6f12a-44b2-492a-9e89-2f6759abea6a', '2024-09-09', 'SI.2024.09.00011', 'Bpk Islan', '082299114774', 'Lubuk Terap, Bandar Petalangan, Kab.Pelalawan - Riau', 'Tia Saputri', '101042007', 'Mesin Universal Fritter', 'MKS-UV22', 1, '1370000.00', 'Rak-3', 'lunas', 'non tunai', '0.00', '1370000.00', 0, '1370000.00', '0.00', '2024-12-05 14:17:11', '2024-12-05 14:17:11'),
('9da7108f-95a5-4959-b621-b2f788fad93f', '9da70f5b-c019-4418-b2ac-b6dc40056624', NULL, '2024-09-09', 'SO.2024.09.00009', 'Bpk Islan', '082299114774', 'Lubuk Terap, Bandar Petalangan, Kab.Pelalawan - Riau', 'Tia Saputri', '101297008', 'Mesin Pengupas Kelapa Manual', 'MKS-KLP01', 1, '2980000.00', 'Kasir', 'belum lunas', 'non tunai', '2980000.00', '2980000.00', 0, '2980000.00', '0.00', '2024-12-05 14:23:49', '2024-12-05 14:23:49'),
('9da711bf-cbd4-4e4a-8dd6-17c13523c4bb', '9da64f65-127d-4ef5-a543-664425d38e13', '9da6f12a-46ed-4caa-8ed5-fd352e3e4b2c', '2024-09-09', 'SI.2024.09.00012', 'Bpk Eggy Cahyana. S.', '082169975677', 'Jl.Gading Marpoyan, Pekanbaru - Riau', 'Tia Saputri', '101042008', 'Mesin Universal Fritter', 'MKS-UV44', 1, '2090000.00', 'Rak-3', 'lunas', 'non tunai', '0.00', '2090000.00', 0, '2090000.00', '0.00', '2024-12-05 14:27:08', '2024-12-05 14:27:08'),
('9da72c81-268e-4e67-b4b7-d08ea2fdd1a1', '9da64f66-c359-475a-98a2-8ca88212f2d0', NULL, '2024-09-09', 'SO.2024.07.00028', 'Bpk Rama Aji Anggoro', '085175074336', 'Jalan Poros SP 1 - SP 2 Desa SP1 Kota Baru, Kec.Kunto Darussalam, Kab.Rokan Hulu, Riau 28556', 'Muhammad Reza', '101158013', 'Mesin Ice Tube', 'MKS-IM100', 1, '26970000.00', 'Kasir', 'belum lunas', 'non tunai', '13485000.00', '13485000.00', 0, '26970000.00', '13485000.00', '2024-12-05 15:41:57', '2024-12-05 15:41:57'),
('9da72f0f-015e-4b03-abae-f322ddf81578', '9da72e3a-d7bf-46cd-ac7b-b5cd3f4ad0d4', NULL, '2024-09-10', 'SI.2024.06.00014', 'Bpk Mokhroni', '082386360093', 'Sungai Alam RT/RW03, Jl.Lesing Kec.Bengkalis - Riau', 'Tia Saputri', '101158014', 'Mesin Ice Tube', 'MKS-IM120', 1, '29140000.00', 'Kasir', 'belum lunas', 'tunai', '20000000.00', '20000000.00', 0, '29140000.00', '9140000.00', '2024-12-05 15:49:06', '2024-12-05 15:49:06'),
('9da731b4-1619-485d-a3a9-896fd875c373', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '9da706de-79a4-40bf-939d-5ec71e7945b8', '2024-09-10', 'SI.2024.09.00013', 'Ibu Lili Nopita Sari', '081275361165', 'Koto Ranah, Kec.kabun, Kab.Rokan Hulu - Riau', 'Tia Saputri', '601006004', 'Mesin Cetak Mie', 'MKS-140', 1, '1780000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '1780000.00', 0, '1780000.00', '0.00', '2024-12-05 15:56:29', '2024-12-05 15:56:29'),
('9da73533-db70-4881-b29f-ec5f4e1a0bd4', '9da7336e-5dcc-43f5-94e7-933ba1984122', NULL, '2024-09-10', 'SO.2024.09.00011', 'Bpk M.Nur', '081276347234', 'Jl.Ronggowarsito', 'Muhammad Reza', '101029009', 'Mesin Tortila  (Diameter 30 CM)', 'MKS-TRT4430', 1, '23330000.00', 'Kasir', 'belum lunas', 'non tunai', '11665000.00', '11665000.00', 0, '23330000.00', '11665000.00', '2024-12-05 16:06:16', '2024-12-05 16:06:16'),
('9da7ca65-cdd0-43b9-84f4-ea6c7774da6d', '9da68e98-72d0-470e-93f8-226a95c52506', '9da7450c-9884-4653-ba93-f2e15137e426', '2024-09-10', 'SI.2024.09.00001', 'Ibu Diana Sartika', '085262370667', 'Jl.Siak 2 Palas , Pekanbaru - Riau', 'Tia Saputri', '102229057', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 1, '100000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '100000.00', 0, '100000.00', '0.00', '2024-12-05 23:03:27', '2024-12-05 23:03:27'),
('9da7cae9-adaa-4393-b001-0a41802d5b80', '9da68ed5-68dc-4210-ac27-39d36e426e9e', '9da74530-75c8-49cf-b832-f0449d69b6cc', '2024-09-10', 'SI.2024.09.00001', 'Ibu Diana Sartika', '085262370667', 'Jl.Siak 2 Palas , Pekanbaru - Riau', 'Tia Saputri', '102263010', 'Sparepart Bearing 6205', 'ADT-SM20', 1, '80000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '80000.00', 0, '80000.00', '0.00', '2024-12-05 23:04:54', '2024-12-05 23:04:54'),
('9da7ccae-90e0-42b7-9d58-0b273bc01846', '9da64f65-4f20-40ca-93f6-180df6443d13', '9da6f12a-e299-4f25-999d-586fa355a5f0', '2024-09-11', 'SI.2024.09.00014', 'Ibu Ulya Auliani', '082385148005', 'Tapung Hilir -  Riau', 'Tia Saputri', '101063008', 'Mesin egg Roll', 'MKS-ERG001', 1, '2070000.00', 'Gudang-Lt1', 'lunas', 'tunai', '0.00', '952200.00', 54, '952200.00', '0.00', '2024-12-05 23:09:50', '2024-12-05 23:09:50'),
('9da7cf24-27d8-4405-b18d-e5d5df88b9b7', '9da7336e-5dcc-43f5-94e7-933ba1984122', NULL, '2024-09-11', 'SO.2024.09.00012', 'Bpk M.Nur', '81276347234', 'Jl.Ronggowarsito No.53, Kel.Cinta Raja , Kec.Sail, Pekanbaru - Riau', 'Muhammad Reza', '101029009', 'Mesin Tortila  (Diameter 30 CM)', 'MKS-TRT4430', 1, '23330000.00', 'Kasir', 'belum lunas', 'non tunai', '11665000.00', '11665000.00', 0, '23330000.00', '11665000.00', '2024-12-05 23:16:43', '2024-12-05 23:17:35'),
('9da7d15f-0957-42a8-8760-3ba730c0df38', '9da7d00b-f2cc-4cc5-8128-84edc2e06d89', '9da7d06a-ea1b-41f6-8d26-90889ff66459', '2024-09-12', 'SI.2024.09.00015', 'Ibu Gladies', '082169820505', 'Jln.Marsan Sejahtera, Panam, Pekanbaru - Riau', 'Ade Yolanda', '102225079', 'Sparepart Tombol ON/OFF Rotating Waffle Maker', 'MKS-RTW01', 1, '10000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '10000.00', 0, '10000.00', '0.00', '2024-12-05 23:22:57', '2024-12-05 23:22:57'),
('9da7d38b-0539-4550-ac96-b28a5fd2ad2c', '9da7d2aa-bf59-4163-a8f5-1e588cda1bad', NULL, '2024-09-13', 'SO.2024.09.00015', 'Bpk. Erwin Tandiawan', '082160815789', 'Jl.Teuku Umar No.95, Pekanbaru - Riau', 'Tia Saputri', '101289001', 'Alat Pemotong & Penusuk Daging Sate', 'MKS-089', 2, '250000.00', 'Kasir', 'belum lunas', 'non tunai', '500000.00', '500000.00', 0, '500000.00', '0.00', '2024-12-05 23:29:02', '2024-12-05 23:29:02'),
('9da7d5f8-9033-440f-8a91-cba404faf541', '9da6ab74-a15d-4edb-9282-7a7fe091984c', '9da707bf-dab1-4eb5-a539-aaf5c260387d', '2024-09-13', 'SI.2024.09.00007', 'Ibu. Riski Andini Septiyani', '085355399016', 'Jl.Hangtuah X Sp6 Desa Makmur, Kec.Pangakalan Kerinci, Kab.Pelalawan - Riau', 'Ade Yolanda', '102238213', 'Sparepart Karet Seal Double Soft Ice Cream', 'ISC-16/ISC-16S', 1, '80000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '80000.00', 0, '80000.00', '0.00', '2024-12-05 23:35:49', '2024-12-05 23:35:49'),
('9da7deb2-baab-41d7-8d70-c0c5e013e7f8', '9da64f66-062c-4a1b-af06-e6bddd6d8e61', '9da6f12a-1d46-4f36-9c94-498b061751d4', '2024-09-14', 'SI.2024.09.00016', 'Bpk. Marsuanto', '0811753678', 'Jl. Garuda Taskurun', 'Ade Yolanda', '301007001', 'Mesin Hand Sealer', 'MSP-200I', 1, '370000.00', 'Rak-3', 'lunas', 'non tunai', '0.00', '370000.00', 0, '370000.00', '0.00', '2024-12-06 00:00:13', '2024-12-06 00:00:13'),
('9da7e297-e9f5-4a16-afc3-520bc5016628', '9da70f5b-c019-4418-b2ac-b6dc40056624', NULL, '2024-09-14', 'SI.2024.09.00017', 'Bpk Islan', '82299114774', 'Lubuk Terap, Bandar Petalangan, Kab.Pelalawan - Riau', 'Tia Saputri', '101297008', 'Mesin Pengupas Kelapa Manual', 'MKS-KLP01', 1, '2980000.00', 'Kasir', 'lunas', 'non tunai', '2980000.00', '2980000.00', 0, '2980000.00', '0.00', '2024-12-06 00:11:07', '2024-12-06 00:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
('9da493ff-798a-45f1-ae93-9ca2c12f7b52', 'admin', 'admin@gmail.com', '2024-12-04 08:43:51', '$2y$12$J6drt95C4AYeNvKa0FB62Ou9XzjLYLhwHiK5ldDJyxZSCAGMdmLK6', 'admin', NULL, 'Vfxu4sgd2r', '2024-12-04 08:43:51', '2024-12-04 08:43:51');

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
