-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 05, 2024 at 09:42 AM
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
(14, '2024_11_30_145124_create_tb_top_product', 1),
(15, '2024_12_04_154125_add_kode_barang_in_tb_barang_masuk', 1);

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
('9da6ab74-a15d-4edb-9282-7a7fe091984c', 'Sparepart Karet Seal Double Soft Ice Cream', 'ISC-16/ISC-16S', '0.00', '2024-12-05 09:41:06', '2024-12-05 09:41:06');

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
('9da689bb-b55a-4120-b9ad-23bc09a28a31', '9da689bb-aa62-4af9-9b3f-3bcd9f3530a6', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-08-28', 'SO.2024.08.00028', 'Aria, Bpk', '081325256325', 'Beringin Eddy - Riau', '601018004', 'Cup Sealer', 'CPS-959', 1, 'Rak-4', '2024-12-05 08:06:49', '2024-12-05 08:06:49'),
('9da68a6a-c599-4a0d-bf61-350fb13611de', '9da68a6a-b8b2-4f4f-b913-c2125b9f895c', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-08-28', 'SI.2024.08.00030', 'Ajar, Ibu', '081364290613', 'Sungai Pinang - Riau', '601018004', 'Cup Sealer', 'CPS-959', 1, 'Rak-4', '2024-12-05 08:08:43', '2024-12-05 08:08:43'),
('9da6913d-c44b-4dfc-a0af-3af71968e4cf', '9da6913d-b926-4423-bf46-c18d7927651d', '9da68e98-72d0-470e-93f8-226a95c52506', '2024-08-30', 'SO.2024.08.00031', 'Diana Sartika, Ibu', '085262370667', 'Jl.Siak 2 Palas - Pekanbaru', '102229057', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 1, 'Kasir', '2024-12-05 08:27:48', '2024-12-05 08:27:48'),
('9da6924d-0e46-45c5-9c4f-50ee50d9f7bb', '9da6924d-0377-42f3-b2ad-d107a6c54ce4', '9da68ed5-68dc-4210-ac27-39d36e426e9e', '2024-08-30', 'SI.2024.08.0031', 'Diana Sartika, Ibu', '085262370667', 'Jl.Siak 2 Palas - Pekanbaru', '102263010', 'Sparepart Bearing 6205', 'ADT-SM20', 1, 'Kasir', '2024-12-05 08:30:46', '2024-12-05 08:30:46'),
('9da69629-2c35-450b-87d8-263c70eacbc1', '9da69629-20d3-422a-9c7e-a75b5bce0785', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-04', 'SI.2024.09.0002', 'Roy Putra, Bpk', '085265802234', 'Jl.Lintas Timur KM-19 - Pekanbaru', '601018004', 'Cup Sealer', 'CPS-959', 1, 'Rak-4', '2024-12-05 08:41:34', '2024-12-05 08:41:34'),
('9da6a1c9-496e-41ea-8053-046cc2b9d41c', '9da6a1c9-3825-40fc-84d3-516cb8098e9f', '9da65bd1-a4d8-433f-bc65-3db1f41af518', '2024-09-04', 'SI.2024.09.0003', 'Darliansyah, Bpk', '08126814341', 'Jl.Cipta Karya Perum Villa - Pekanbaru', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', 1, 'Kasir', '2024-12-05 09:14:04', '2024-12-05 09:14:04'),
('9da6a4ad-9ccd-4805-9bdd-5e0229e8643e', '9da6a4ad-9042-4784-a25f-870a8b47051e', '9da6529e-76cd-4ccf-a3d6-34d0762285ac', '2024-09-04', 'SI.2024.08.00023', 'Indra Mahira, Bpk', '082173214448', 'Jl.Tanjung Pati Sari Lamak Payakumbuh Sumatra Barat', '102226097', 'Sparepart Pully Kecil Cetak Mie MKS-220SS/MKS-160/MKS-240SS/MKS-200', 'MKS-220SS/MKS-160/MKS-240SS/MKS-200', 1, 'Kasir', '2024-12-05 09:22:09', '2024-12-05 09:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_masuk`
--

CREATE TABLE `tb_barang_masuk` (
  `id_brg_masuk` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_brg_masuk` date NOT NULL,
  `no_warehouse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_barang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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

--
-- Dumping data for table `tb_barang_masuk`
--

INSERT INTO `tb_barang_masuk` (`id_brg_masuk`, `id_barang`, `tgl_brg_masuk`, `no_warehouse`, `kode_barang`, `nama_barang`, `tipe_barang`, `asal_gudang`, `jumlah_barang`, `posisi`, `status`, `nama_konsumen`, `created_at`, `updated_at`) VALUES
('9da69489-7e19-4e6d-aa48-d0f271794dbd', '9da65bd1-a4d8-433f-bc65-3db1f41af518', '2024-08-31', 'DO.2024.08.00331', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Bpk, Darliansyah', '2024-12-05 08:37:01', '2024-12-05 08:37:18'),
('9da6a952-02f2-4024-9c49-89ed3d0b4017', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '2024-09-02', 'DO.2024.09.00009', '601006004', 'Mesin Cetak Mie', 'MKS-140', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Lia Novita Sari, Ibu', '2024-12-05 09:35:08', '2024-12-05 09:35:08'),
('9da6aa0b-b1d5-430c-9610-7ddd939bb0f9', '9da64f65-5a9b-40d7-82f3-cf4253b69d72', '2024-09-02', 'DO.2024.09.00009', '601019016', 'Mesin Gas Deep Fryer', 'MKS-72', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Yosse Rizal, Bpk', '2024-12-05 09:37:10', '2024-12-05 09:37:10');

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
('9da64fa7-7b09-49c4-99d4-95b9478c4217', '9da64f65-e073-43f5-9aed-6228fc9f5cda', '2024-08-28', 'Mesin Penggiling Kopi', 'MKS-600B', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-84d0-4a6e-afe9-a2ce7569f252', '9da64f65-6e1d-4875-90da-1177573918e5', '2024-08-28', 'Ice Crusher', 'MKS-002', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-8cd2-44b8-8676-e992773c427d', '9da64f66-902d-4366-9db8-6de2396004ab', '2024-08-28', 'Ice Cream Buah', 'ICE-01', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-9430-4c6f-b0ac-be107c0bef45', '9da64f65-ca2e-468f-b984-725dd122e928', '2024-08-28', 'Chopper', 'ARD-FC200', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-9bb8-407d-a02d-03bb4a9d3d8d', '9da64f65-c849-41a9-9f22-714fcf50616b', '2024-08-28', 'Chopper', 'ARD-FC300', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-a5b5-4949-84f8-eeac80fbce42', '9da64f66-92ed-4edc-808e-47c576f7be63', '2024-08-28', 'Oven Listrik ', 'ARD-E033', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-b274-401e-ad44-2210cb9be393', '9da64f65-d5e2-459a-8c7e-1059efc57750', '2024-08-28', 'Alat Cetak Long Potato', 'MKS-MER2', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-be25-4dfa-ae87-b8916076035b', '9da64f65-eb1a-477c-a9e9-20350682ec48', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG444', 0, 0, 2, 2, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-c5a0-4fc3-9270-273f813f134a', '9da64f65-9831-44da-b23f-de69962d1c3d', '2024-08-28', 'Bread Maker', 'ARD-BM55X', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-cce3-40d7-bbeb-91d9881418b2', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-08-28', 'Cup Sealer', 'CPS-959', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-d57a-43ad-92b2-88d6fdb78f1e', '9da64f65-d7ef-4fa6-8f65-31d55c1c3d7d', '2024-08-28', 'Alat Cetak Sate Telur Puyuh', 'ARD-TKY16', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-dd3e-4d5d-b1c6-c1c626dbf0a5', '9da64f65-3d73-4c68-9248-050e29db8fc0', '2024-08-28', 'Mesin Pemanggang', 'MKS-111BBQ', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-e53b-4b40-8c57-18ab2c94922c', '9da64f66-948a-4b8e-9ec4-278a4b1d99e7', '2024-08-28', 'Noodle Maker', 'ARD-NM4', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-ecf7-4d73-b2dc-c7ba8bebfdc1', '9da64f65-47df-4e3e-81cc-cdd3f1465b79', '2024-08-28', 'Mesin Pemanggang', 'MKS-222BBQ', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-f590-420f-a0d8-8a2cf2852468', '9da64f65-4f20-40ca-93f6-180df6443d13', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG001', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa7-fd5d-48ce-85b8-b9c23fc1b6fa', '9da64f66-9632-4592-9057-ca2a257acd8d', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG005', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-04ce-4b8a-8536-378225948127', '9da64f66-97ed-4531-9419-a12b0d9be0d4', '2024-08-28', 'Stand Mixer', 'ARD-MR7', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-0cb7-401e-a42f-bdc4d6349860', '9da64f65-e4f2-44dd-9887-97b7602650e3', '2024-08-28', 'Mesin Pembuat Sosis Telur', 'MKS-ERG002', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-144a-4d88-83c7-56c391cbc5ca', '9da64f65-9682-4d01-b07d-c42bf5711c37', '2024-08-28', 'Oven Listrik', 'ARD-EO33', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-1cac-4c61-a8ba-48a670682f14', '9da64f65-9831-44da-b23f-de69962d1c3d', '2024-08-28', 'Bread Maker', 'ARD-BM55X', 0, 0, 3, 3, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-2515-42d7-b95e-3f22929989c3', '9da64f65-9a62-4391-a3fb-41cdbf514cab', '2024-08-28', 'Ice Crusher', 'MKS-CRS30L', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-2c8c-4990-94d1-ff410f8aba3e', '9da64f65-9c53-42b3-9e33-7279816ffbae', '2024-08-28', 'Timbangan Digital', 'TBG-3', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-345b-4c0c-b5bc-6fa351a02bca', '9da64f65-9e3e-4934-92af-4ed939f7875e', '2024-08-28', 'Timbangan Digital', 'TBG-1', 0, 0, 6, 6, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-3f02-4ca1-a30e-22ac13186fe3', '9da64f65-a03a-4d97-bc9e-988fad3729d6', '2024-08-28', 'Timbangan Digital', 'TBG-5', 0, 0, 5, 5, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-4af7-425d-969d-79bc01ae975b', '9da64f65-a30c-47d1-b646-6ef2ecf085c3', '2024-08-28', 'Timbangan Digital', 'TBG-10', 0, 0, 5, 5, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-55c6-4e2d-bfdb-60359cabfd92', '9da64f65-a4cc-41a3-ac8f-85f11b9c58e0', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-404', 0, 0, 10, 10, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-621b-4c86-9f21-a28d87967b33', '9da64f65-a677-4348-8981-529573d60fdf', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-202', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-6e2f-4d1b-b65f-899292c6caea', '9da64f65-a940-4bb9-9bb3-b1015aa5898d', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-303', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-795a-4b2c-a1d3-ed858d3432e9', '9da64f65-aaae-4abd-861b-85ea7bbd527b', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-505', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-8566-489d-b3ff-319e67d74617', '9da64f65-ac83-48f4-aef8-c33f270a67fc', '2024-08-28', 'Cetak Sosis Telur Listrik', 'GRILLO-400', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-91c3-4378-ac70-a22cb4810365', '9da64f66-9a2c-4855-b6c2-28ae777731db', '2024-08-28', 'Pemasak', 'KTl-DBL2', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-9ceb-4198-8ea0-b2b4eb6ee394', '9da64f65-aec7-4d87-bd21-97a593ba397f', '2024-08-28', 'Blender', 'MKS-BLD 1,5L', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-a80b-4b75-ba8d-f6ca0946fa8d', '9da64f65-b026-4b9e-97fd-166a8c3062d0', '2024-08-28', 'Pemanas Air ', 'BT-119', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-b41b-4680-a2da-15c9be00d4ea', '9da64f65-b1af-4c9a-b9a7-32667a5433df', '2024-08-28', 'Peras Jeruk', 'ARD-J22', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-bf49-4b99-b5e6-715a7d883f8d', '9da64f65-b32a-405d-88b5-658b2656421d', '2024-08-28', 'Ice Krim Buah', 'ICE-01', 0, 0, 3, 3, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-ca97-47c2-8372-74a8a42f60b7', '9da64f65-b524-4caa-9bcd-a52363fb6cca', '2024-08-28', 'Long Potato', 'MKS-LPCT50', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-d65b-4b48-ac83-6d235b8cbdf2', '9da64f65-b691-44cd-97e1-5cafc5104ec2', '2024-08-28', 'Giling Daging', 'MHW-G31B', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-e1a9-4eb7-a926-996b46f7397c', '9da64f65-b882-4cd7-8a80-d78e1af3340c', '2024-08-28', 'Giling Daging', 'MHW-G51B', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-05 05:24:25', '2024-12-05 05:24:25'),
('9da64fa8-ecb8-4f8f-a63d-b38ddfcb0478', '9da64f65-bacb-48da-b7ed-2b427e780279', '2024-08-28', 'Mangkok', 'ICE BARREL', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa8-f78a-4612-8392-ebf95ccbae4f', '9da64f66-9bf9-444e-9b4b-e26bb751e690', '2024-08-28', 'Deep Fryer', 'MKS-G20L', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-036b-4f33-9ac8-e710bdda4a8b', '9da64f65-bd28-403e-a5bc-96f83c4bbc95', '2024-08-28', 'Display Warmer', 'MKS-DW66', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-0ead-4730-af41-301599517b7c', '9da64f65-bf8f-498b-8776-62112df3baf2', '2024-08-28', 'Lafira', 'LAFIRA', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-1b0c-4492-b26b-8aab4cf739b3', '9da64f65-c25b-4645-8d04-397190717a31', '2024-08-28', 'Pemotong keripik tempe ', 'MKS-JT04', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-25d8-42e4-8638-fdcac6d36ed3', '9da64f65-c49f-45ac-a5df-fa0291cfc68b', '2024-08-28', 'Mesin Gelas Kesehatan ', 'ARD-CP5', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-3093-4e1d-aeba-18c74e50cd3b', '9da64f65-c626-4aa9-bf89-9bb3f1d17228', '2024-08-28', 'Ice Crusher', 'MKS-CRS20', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-3d78-4760-b962-1a6cfe10fcd7', '9da64f65-6e1d-4875-90da-1177573918e5', '2024-08-28', 'Ice Crusher', 'MKS-002', 0, 0, 0, 0, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-49e1-4754-9407-5aa04490af60', '9da64f65-c849-41a9-9f22-714fcf50616b', '2024-08-28', 'Chopper', 'ARD-FC300', 0, 0, 0, 0, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-560c-44a6-a482-7f0b93c0645e', '9da64f65-ca2e-468f-b984-725dd122e928', '2024-08-28', 'Chopper', 'ARD-FC200', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-6231-4075-8e59-b49063fd5e4d', '9da64f65-cc01-4149-8f2d-022e24bc56c2', '2024-08-28', 'Pemanggang', 'ARD-GRL77', 0, 0, 2, 2, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-6dd0-4f4f-a3a5-ccb5fe26f625', '9da64f65-ce21-4c82-9bc2-62aaf1fb71a6', '2024-08-28', 'Kentang Spiral', 'TP-200', 0, 0, 5, 5, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-78e3-4e08-9989-d11d42e28a9c', '9da64f65-cfcc-483b-adab-9b2910209a6f', '2024-08-28', 'Alat Pengiris Kentang Spiral', 'MKS-PSS44', 0, 0, 2, 2, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-8460-4c67-abcb-21e4b24c7533', '9da64f65-d1b6-4b52-b269-d0fe1255296c', '2024-08-28', 'Alat Pengiris Apel', 'MKS-APL88', 0, 0, 5, 5, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-9072-49eb-9d10-fcb93ba8d60b', '9da64f65-d36d-4d70-8374-21667eb99c71', '2024-08-28', 'Alat Cetak Long Potato', 'MKS-LPCT30', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-9cc0-4588-a355-f9b93ec82dd6', '9da64f65-d5e2-459a-8c7e-1059efc57750', '2024-08-28', 'Alat Cetak Long Potato', 'MKS-MER2', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-a990-46db-99af-cc7b87234e79', '9da64f65-d7ef-4fa6-8f65-31d55c1c3d7d', '2024-08-28', 'Alat Cetak Sate Telur Puyuh', 'ARD-TKY16', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-b5b3-451e-ba67-7a8e4f38335d', '9da64f65-d9c6-49ac-b744-b33ba32cb027', '2024-08-28', 'Mesin penepung Herba, Farmasi dan biji', 'MKS-ML100', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-c167-4c64-ba4d-c3d94d668541', '9da64f65-dc5f-466d-a7bd-9d4f2c417f80', '2024-08-28', 'Mesin Kopi Espresso', 'MKS-MKP50', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-cd45-408e-b9fd-03dc643c87c2', '9da64f65-de84-4cda-b64e-848811a01a4d', '2024-08-28', 'Mesin Grinder kopi', 'MKS-GRD80A', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-d921-4a97-9730-719d858f823b', '9da64f66-5cbb-4446-877c-e10b421e4f67', '2024-08-28', 'Rok Espresso', 'ROK ESPRESSO', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-e574-421a-bf7a-b65a96edad55', '9da64f65-e073-43f5-9aed-6228fc9f5cda', '2024-08-28', 'Mesin Penggiling Kopi', 'MKS-600B', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-f08e-48cd-8abd-051438db7d7a', '9da64f65-e2b6-4233-af2a-c6898c48ab9c', '2024-08-28', 'Mesin Deep Fryer Gas', 'MKS-71', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64fa9-fd09-48e6-a6e3-638f520f7a1a', '9da64f65-e4f2-44dd-9887-97b7602650e3', '2024-08-28', 'Mesin Pembuat Sosis Telur', 'MKS-ERG002', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64faa-0a1f-4270-ade5-f57e6aff7c4e', '9da64f65-e707-455c-9891-612a8ae1ac01', '2024-08-28', 'Mesin Egg Roll', 'GRILLO-GS10', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64faa-159b-4216-a9bb-884ef582cbf9', '9da64f65-e938-45f9-9719-9a0bd2f2156d', '2024-08-28', 'Mesin Egg Roll', 'GRILLO-GS6', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64faa-217f-4b8f-bd6e-592775ae8e69', '9da64f65-eb1a-477c-a9e9-20350682ec48', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG444', 0, 0, 0, 0, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64faa-2dbe-4e6c-b3d4-0b22d25e491a', '9da64f65-4f20-40ca-93f6-180df6443d13', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG001', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64faa-39b9-4a7f-b49f-c4bc001b90c6', '9da64f66-a2a4-4311-883b-1b41d402c560', '2024-08-28', 'Mesin Food Dehydrator', 'ARD-PM99', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64faa-453c-4bfe-ba1a-7b24adac6451', '9da64f65-ed43-4f7d-862d-2b769bf47d47', '2024-08-28', 'Alat Manual Meat Slicer', 'MKS-MSl66', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64faa-5193-4f7f-84bc-b4e128c5577c', '9da64f65-efb3-46e1-b903-4bc61de5c59a', '2024-08-28', 'Mesin Cetakan Donat', 'MKS-DN60', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64faa-5d38-4587-86bd-2df346b2f95b', '9da64f65-f213-48bc-97f3-e2bdaf1d637b', '2024-08-28', 'Mesin Hot Dog Wafel', 'MKS-HDW6', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:26', '2024-12-05 05:24:26'),
('9da64faa-6a30-46a1-931c-0077469e2f98', '9da64f65-f531-4596-9bcf-fbb108022a13', '2024-08-28', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-756b-4d84-9301-7919d4bf7cdf', '9da64f65-f7b9-40c8-afa8-e24f0a1ad4d7', '2024-08-28', 'Mesin Takoyaki Listrik', 'MKS-700E', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-815f-4ca7-9637-b15a02870614', '9da64f65-f99a-4a85-81ad-84c1c7397525', '2024-08-28', 'Mesin Waffle Taiyako', 'MKS-ETYK3', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-8c6a-4e0a-84a3-b419adc2004b', '9da64f65-fb65-4a41-a43e-5e68af2f6564', '2024-08-28', 'Mesin Perajang Sayur dan Buah', 'MKS-VGT65', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-9915-42e4-adfa-58e163bb680d', '9da64f65-fe30-4d1c-a999-3f062054bacc', '2024-08-28', 'Mesin Slot Toaster', 'MKS-D06', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-a52d-46e0-9b43-3b4e823208c0', '9da64f66-0033-4d58-9d7a-8ddc35a1a3be', '2024-08-28', 'Cetak Mie dan Pasta', 'ARD-NM4', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-b17c-4194-bf86-06d0ecc4b4a1', '9da64f66-a449-4b00-87bf-37c1fe5cde9c', '2024-08-28', 'Mesin Giling Daging', 'MHW-G31B', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-bdd4-442c-b506-4111cdf1280e', '9da64f66-01dd-4bf3-8e30-e156793e7eb0', '2024-08-28', 'Mesin Hand Sealer', 'MSP-400A', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-caef-4c88-9554-724b1ae7eefd', '9da64f66-0431-4f56-a29d-0610598a01ff', '2024-08-28', 'Mesin Hand Sealer', 'MSP-300A', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-d610-453c-8ebd-81a03e549e8a', '9da64f66-062c-4a1b-af06-e6bddd6d8e61', '2024-08-28', 'Mesin Hand Sealer', 'MSP-200I', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-e0dd-4717-a1fc-757197d274d0', '9da64f66-085d-4cfe-a12f-f7564a7503d3', '2024-08-28', 'Mesin Hand Sealer', 'MSP-200A', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-ec44-4855-9b38-cde9f9b86bdf', '9da64f66-0b25-42e7-ac89-06e4f3f10867', '2024-08-28', 'Mesin Hand Sealer', 'MSP-300i', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64faa-f6cb-44b8-a002-64a1b97ea45b', '9da64f66-0d6c-4573-a5bb-16fc4ba4fa3b', '2024-08-28', 'Mesin Vacum Sealer', 'MSP-DZ280A', 0, 0, 5, 5, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-0309-4656-9e45-51d39ca3eeef', '9da64f66-1010-4d34-9cdb-7e9960ebb128', '2024-08-28', 'Mesin Vacum Sealer', 'MSP-290E', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-0eea-4a4b-b1f8-dcf7a8cbd210', '9da64f66-1221-43e7-88a5-d017e4dc7e51', '2024-08-28', 'Mesin Vacum Sealer ', 'MSP-VS02', 0, 0, 6, 6, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-1ac4-4560-a1cb-4617eba8798e', '9da64f66-144b-4c81-9909-72a63131981c', '2024-08-28', 'Mesin vakum food sealer', 'ARD-VC85', 0, 0, 5, 5, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-260d-4cc9-b3f7-5aca1db35f22', '9da64f66-16d2-47a8-92d6-a796d065f3ee', '2024-08-28', 'Mesin vakum sealer', 'ARD-VS01', 0, 0, 3, 3, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-3161-4adc-99d9-00aa18342bfe', '9da64f66-1898-4454-892d-b4881aebddd0', '2024-08-28', 'Mesin Hand Printer', 'HP-351', 0, 0, 3, 3, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-3c59-4c80-9458-514d322f91e3', '9da64f66-1a94-4237-ae8d-dc34b8b52e25', '2024-08-28', 'Alat Cetak Sosis Horizontal', 'MKS-3V', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-47dc-4691-bb07-7ccd35ead5a7', '9da64f66-1cc1-4406-81ca-57d53c9e86f1', '2024-08-28', 'Alat Cetak Sosis Vertikal', 'MKS-3H', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-5347-49fb-97c3-5be259ff1419', '9da64f66-1efc-425f-a404-a3061aaa4d09', '2024-08-28', 'Mesin Pengupas Bawang Putih', 'AGR-BWG180', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-5f1f-4709-8dd6-655832933f6d', '9da64f66-20a8-4716-8ceb-d4bbcf8e6ef8', '2024-08-28', 'Mesin Giling Daging', 'MHW-80', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-6b59-45ed-8bc4-8f8c35aa6200', '9da64f66-22e9-417d-80fe-de0b902f0d4f', '2024-08-28', 'Mesin Giling Daging', 'MHW-220', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-7c51-4557-9faf-690ea74d09b8', '9da64f66-255e-4f1d-a142-17099c89de99', '2024-08-28', 'Mesin Pemanggang', 'MKS-PG4', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-8758-482a-be18-e7a094bf9337', '9da64f66-271c-4f51-9b5c-2dbd1592944c', '2024-08-28', 'Mesin Pemanggang', 'MKS-PG2', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-92b5-4916-b097-8aa3dd509178', '9da64f66-28f4-4d22-ba8f-7e0a223238d2', '2024-08-28', 'Mesin Egg Waffle Listrik', 'MKS-EW06', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-9ec1-4a7a-b0ed-6fd91fe7d522', '9da64f66-2bc3-4958-bd3d-d09cf1ace376', '2024-08-28', 'Mesin Egg Waffle Gas', 'MKS-GW07', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-ad33-4ebe-9554-b29d4d3d8b5b', '9da64f66-2d5f-4408-981a-5acb4934a2cf', '2024-08-28', 'Mesin Cone Bakar', 'MKS-CB1', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-b9af-4047-8ed7-8833d2ab02d3', '9da64f66-2f53-49c4-9107-aeee9d9424db', '2024-08-28', 'Mesin Universal Fritter', 'MKS-UV22', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-c5a7-4a13-9426-52a98042ba2c', '9da64f65-127d-4ef5-a543-664425d38e13', '2024-08-28', 'Mesin Universal Fritter', 'MKS-UV44', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-d112-44f4-9fe6-0232c04a7874', '9da64f66-3172-4d2e-9d72-142a9ebaa35b', '2024-08-28', 'Alat Perajang bawang manual', 'PRJ-BM', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-dd64-470d-84ad-3245e42de5ad', '9da64f66-3336-4189-b4d8-d450fc76dc93', '2024-08-28', 'Alat Perajang singkong manual', 'PRJ-M', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-e94a-402e-8fc0-6e68005fad7c', '9da64f66-34f1-4f71-afaa-6a8c07df8406', '2024-08-28', 'Mesin Pembuat Gulali', 'MKS-CT76', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-05 05:24:27', '2024-12-05 05:24:27'),
('9da64fab-f71c-48d3-8634-8906c197d836', '9da64f66-36f5-482b-bf33-d06840ab4105', '2024-08-28', 'Cup Sealer', 'CPS-919', 0, 0, 0, 0, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-04ce-4f40-b4af-13c446e01294', '9da64f66-38d4-4ea4-b8e4-98564077d269', '2024-08-28', 'Cup Sealer', 'CPS-818', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-1132-4cf0-8280-ecc8bdfa0835', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-08-28', 'Cup Sealer', 'CPS-959', 0, 2, 4, 2, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 08:08:43'),
('9da64fac-1dc1-4354-9443-8a630a9ba1b5', '9da64f66-3a93-48d2-a4b4-6e4eba83d6e9', '2024-08-28', 'Hand Sprayer (Semprotan)', 'SPR-16', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-29a5-4114-96fc-3aafa7c52545', '9da64f66-a898-4a6a-8280-8005ee0f4e10', '2024-08-28', 'Mesin Cetak Mie', 'MKS-150B', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-3519-42fa-a403-3875092ebdbf', '9da64f66-3c48-4b1d-a148-0e2c0e1be24b', '2024-08-28', 'Mesin Pemanggang Grill', 'ARD-GRL88', 0, 0, 2, 2, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-4100-4d93-ae27-9b3845aa1f70', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '2024-08-28', 'Mesin Cetak Mie', 'MKS-140', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-4e2f-4ef1-b7b6-6a4997ff3d71', '9da64f66-3ed2-46e2-b39b-2cbfb9e40b95', '2024-08-28', 'Mesin Cetak Mie', 'MKS-160', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-5c14-4f4e-b048-7311b64511b7', '9da64f66-4061-4edb-a562-bf090e10d3d9', '2024-08-28', 'Teko Listrik Stainless', 'ARD-KT11', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-68a7-4ddb-89a7-18f7af5e0aae', '9da64f66-4232-4741-8c6a-c6f9e3a98a3d', '2024-08-28', 'Mesin Water Boiler', 'MKS-D30', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-7ab1-40bf-85e5-a19e021c231f', '9da64f66-a6be-4040-8ff9-4a3097b7c775', '2024-08-28', 'Cup Sealer', 'CPS-10A', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-881c-48ca-b0d3-c8f26566fe2a', '9da64f66-4524-4695-8975-ae5d9471692d', '2024-08-28', 'Dough Mixer', 'MKS-DIMX002', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-94c6-4fbf-ae38-13271dec0425', '9da64f66-aa3e-47fb-99b4-fd0bcbe73ffb', '2024-08-28', 'Mesin Ice Crusher', 'MKS-CRS20', 0, 0, 4, 4, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-a114-4a18-a081-a1de2ae3b3a1', '9da64f65-4289-4c94-858f-6125c22aa4f6', '2024-08-28', 'Mesin Cetak Mie', 'MKS-160SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-ad33-45a7-8cb0-43f188fb3f11', '9da64f65-1dea-43db-b6c7-df589f0ca8db', '2024-08-28', 'Mesin Cetak Mie', 'MKS-180SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-b924-4541-a78b-6563d86a05d7', '9da64f65-2bc4-409b-bc87-3d45db860f84', '2024-08-28', 'Mesin Cetak Mie', 'MKS-200', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-c5d2-49ec-8a2a-d35ec1b12dee', '9da64f66-46a9-4948-a060-4a6336f7964a', '2024-08-28', 'Mesin Cetak Mie', 'MKS-220SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-d3d4-48ab-b300-99935decebda', '9da64f66-4867-47b5-a519-16630946668b', '2024-08-28', 'Mesin Penutup Botol Manual', 'MKS-BT31', 0, 0, 2, 2, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-e20d-4867-af24-7c25a7539b69', '9da64f66-4a91-42af-b79d-1d14c9d57875', '2024-08-28', 'Hand Sealer', 'FS-600', 0, 0, 0, 0, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-eecf-4b82-9d12-2d2f30b0a0e0', '9da64f66-4c60-4148-8827-114010b4c815', '2024-08-28', 'Mesin Cup Sealer', 'CPS-9A', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fac-fbf4-4205-9e57-bc0cedcd1472', '9da64f65-7cbd-4aea-9e9c-77c817fdeaeb', '2024-08-28', 'Oven Roti Gas 1 Loyang', 'MKS-RS11', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fad-09c2-499d-82aa-f483ea0bb725', '9da64f65-7e2b-4b0b-a6a2-ef37a33614f2', '2024-08-28', 'Penetas Telur', 'AGR-INC24', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fad-1785-4850-96b2-f774fa92888c', '9da64f66-ac7b-4cda-97e7-377da9b61d9e', '2024-08-28', 'Penetas Telur', 'AGR-TT32', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fad-25b6-4a5d-8517-df281818c187', '9da64f65-7ff2-4503-9424-193d577c0b14', '2024-08-28', 'Penetas Telur', 'AGR-TT7', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fad-3305-450b-9dda-9d6844077db8', '9da64f65-8255-4f1a-9c7b-153e7da9ad08', '2024-08-28', 'Penetas Telur', 'AGR-TT4', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fad-424e-485a-83a2-455a9eaf48fd', '9da64f65-849b-4e51-97f7-ba6121921735', '2024-08-28', 'Mesin Soft Ice Cream', 'MKS-ICM-119', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fad-4ea1-409b-8617-f88eeacdfbd1', '9da64f65-8792-42e0-b39f-ee32f975e733', '2024-08-28', 'Mesin Dough Mixer', 'MKS-DG15', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fad-5a38-4868-ae9d-fa249b9a4a25', '9da64f65-8a7f-48e3-bf1f-452c973040ad', '2024-08-28', 'Mesin Cetak Mie', 'MKS-350', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fad-63f9-4c29-a13c-07421d197518', '9da64f65-8c78-44d2-b9aa-c34d4d3bb303', '2024-08-28', 'Mesin Serutan Es Salju', 'MKS-ICE28', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fad-6f75-4096-b8c9-5a22b4df8d74', '9da64f65-8f49-44a9-b635-531a2f099e8b', '2024-08-28', 'Mesin Perajang Keripik', 'MKS-CT100 A', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:28', '2024-12-05 05:24:28'),
('9da64fad-7bba-426e-8a8c-da31a27fbfbc', '9da64f65-90e9-4538-b68b-63c2c681fe60', '2024-08-28', 'Pengupas Nanas Industri', 'MKS-PN60', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fad-87a5-4cd7-bad2-4d7aac2fcccf', '9da64f65-928e-4b98-bb6e-a9094feabea4', '2024-08-28', 'Mesin Mixer Planetary', 'MKS-10B', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fad-9388-4d5a-820f-64989e3176d1', '9da64f65-949d-4cce-8467-9a0a9b90ebf1', '2024-08-28', 'Mesin Mixer Planetary', 'MKS-BK20M', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fad-a07b-4760-8a44-abd7352cd688', '9da64f65-127d-4ef5-a543-664425d38e13', '2024-08-28', 'Mesin Universal Fritter', 'MKS-UV44', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fad-ac69-4a11-a2bb-7da77b006bdc', '9da64f65-16a4-455e-b2a9-57127c063b57', '2024-08-28', 'Mesin Cup Sealer', 'CPS-10A', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fad-b531-4cc2-8cf8-38a16ff493c4', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '2024-08-28', 'Mesin Cetak Mie', 'MKS-140', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fad-c235-42a2-acbd-27d2e5393b93', '9da64f65-1ae4-4e3e-a697-40a70beda7b0', '2024-08-28', 'Mesin Pencabut Rumput', 'AGR-PR238', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fad-ce36-4b8b-bd39-bc828d9ae2cd', '9da64f65-1c82-40c8-94d0-415f9e1f57c4', '2024-08-28', 'Mesin Dough Mixer', 'MKS-DMIX002', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fad-da49-4455-8f0f-656e6796e3dd', '9da64f65-1dea-43db-b6c7-df589f0ca8db', '2024-08-28', 'Mesin Cetak Mie', 'MKS-180SS', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fad-e35c-4053-a877-fd683a2bbb67', '9da64f65-2093-4f2b-9b0d-1f75c207c38c', '2024-08-28', 'Mesin Food Dehidrator', 'ARD-PM99', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fad-ebf8-4e7e-88fd-5575f1cb8a7c', '9da64f65-222c-4bd5-b025-11d6c17eec6f', '2024-08-28', 'Mesin Cetak Pelet', 'MKS-PLT25', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fad-f754-469d-9eac-580b0f1ef243', '9da64f65-23a8-4d66-9209-ea88e895339f', '2024-08-28', 'Alat Sauce Pan/Ssauce Dispenser', 'MKS-SU-01', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-0338-4df5-90a5-3ddd2448b587', '9da64f65-2581-4084-9c77-13531affaa17', '2024-08-28', 'Mesin Cetak Mie ', 'MCM-150', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-0f07-4add-a9ea-34638e797399', '9da64f65-26fd-4857-9462-d6158e7681ac', '2024-08-28', 'Mesin Coffe Espresso', 'MKS-MKP60', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-1876-4884-a7c4-d70d975a43c9', '9da64f65-2882-43b7-a164-79d177c8e9f2', '2024-08-28', 'Alat Giling Daging manual', 'MKS-SG10', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-2547-49af-9e5a-66c4864e1b5d', '9da64f65-29ee-48e3-a932-f7dd76be1042', '2024-08-28', 'Mesin cetak Mie Manual', 'MKS-150B', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-3179-4116-b0cc-5eedaad0b791', '9da64f65-2bc4-409b-bc87-3d45db860f84', '2024-08-28', 'Mesin Cetak Mie', 'MKS-200', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-3db8-4abc-bbf8-5f2489645932', '9da64f65-2d8b-4ef9-b911-cccf91a3275d', '2024-08-28', 'Alat Pemotong Kerupuk Lontong manual', 'AGR-LTG22', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-4b29-4b20-b582-468e8b185e9c', '9da64f65-2f2b-48ec-a9df-51ef7e62b850', '2024-08-28', 'Mesin Waffle Maker', 'MKS-WF48', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-5701-4493-a3f8-0081b2e23343', '9da64f65-3093-4a92-befe-37df21acea2d', '2024-08-28', 'Mesin Electric Kettle', 'KTL-DBL2', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-63ae-4f66-90da-c57afa6a240a', '9da64f65-3300-4dd7-acb6-fa63035c9597', '2024-08-28', 'Mesin electric Kettle', 'ARD-KT12', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-6f81-465f-b81f-d14aaed835da', '9da64f65-34ee-422c-b418-430d746b0352', '2024-08-28', 'Mesin Coffe Grinder', 'MKS-GRD60A', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-7a75-476c-a94b-179808660878', '9da64f65-3676-4908-b56a-99dc93975c76', '2024-08-28', 'Mesin Coffe Bean Grinder', 'MKS-CG50', 0, 0, 5, 5, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-82e4-45c8-ac45-87b807a696b3', '9da64f65-3859-418b-aaf1-5a64d8cbc306', '2024-08-28', 'Mesin Pemipil Jagung', 'PPJ-001', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-8cb7-4962-af2e-460a0f22d090', '9da64f65-3a1b-4ad2-b0bc-53a727d423b1', '2024-08-28', 'Alat Cetak Mie dan Pasta', 'CM-2020', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-9621-40c4-8f2a-7e8fe3a95a38', '9da64f65-3c01-4b54-aa38-1828ecf3bad5', '2024-08-28', 'Mesin Giling Daging', 'MHW-120', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-a00b-4033-ab8f-80768eb1577d', '9da64f65-3d73-4c68-9248-050e29db8fc0', '2024-08-28', 'Mesin Pemanggang', 'MKS-111BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-abfd-483a-af1a-b24bbd5ce501', '9da64f65-3f70-44fa-8400-08ed4a8a5295', '2024-08-28', 'Mesin Big Smoker', 'MKS-BLS002', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-b825-4dc8-8b37-236b548fd2da', '9da64f65-4101-4e93-9316-1314992a48ae', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT32', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-c328-4bb9-af9d-b8aaf20082fe', '9da64f65-4289-4c94-858f-6125c22aa4f6', '2024-08-28', 'Mesin Cetak Mie', 'MKS-160SS', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-cdbf-44c9-a8af-949eb2263a90', '9da64f65-440c-4794-a870-b47f829b90bf', '2024-08-28', 'Mesin Stik Wafel', 'MKS-HDW5', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-d689-4808-ae1a-43fd9acda123', '9da64f65-460d-49ca-9bec-4b5f2109f689', '2024-08-28', 'Mesin Pemanggang', 'MKS-369BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-de95-47d3-a08b-e006cd540b57', '9da64f65-47df-4e3e-81cc-cdd3f1465b79', '2024-08-28', 'Mesin Pemanggang', 'MKS-222BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-e6bc-42a9-8cab-046fd8164c49', '9da64f65-4945-47a6-b401-3f52222e887f', '2024-08-28', 'Mesin Mixer Planetary', 'MKS-B5A', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-eed0-4329-ac9f-b59ccd4a0d66', '9da64f65-4b07-4d33-a521-1483ef46b402', '2024-08-28', 'Foot Sealer', 'FRP-600', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-f639-499d-9773-f7fbc8e35e99', '9da64f65-4d9f-4445-a8be-42bf911dfc3b', '2024-08-28', 'Foot Sealer', 'FRP-400', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:29', '2024-12-05 05:24:29'),
('9da64fae-fe25-462c-a541-a04a8d5268b4', '9da64f65-4f20-40ca-93f6-180df6443d13', '2024-08-28', 'Mesin egg Roll', 'MKS-ERG001', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-064c-4e88-b525-2f220a6bb09e', '9da64f65-50ad-4408-a54f-24ef102e5cc5', '2024-08-28', 'Mesin Dough Devider', 'MKS-BA80', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-0ec7-4921-b502-4fc43237b0d4', '9da64f65-5232-43a9-81bc-410bdf09805a', '2024-08-28', 'Mesin Pemipil Jagung', 'AGR-CORN9', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-1715-426f-8af3-77dd09432d83', '9da64f65-5602-4ac5-a8a8-36ab9bf3c408', '2024-08-28', 'Mesin Gas Deep Fryer', 'MKS-G75', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-1f0f-4216-8c23-3167f20deb4a', '9da64f65-588b-4909-b521-fdf210d23d36', '2024-08-28', 'Mesin Gas Deep Fryer', 'MKS-G20L', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-264a-4599-9b71-923d3c23586a', '9da64f65-5a9b-40d7-82f3-cf4253b69d72', '2024-08-28', 'Mesin Gas Deep Fryer', 'MKS-72', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-2e7c-470c-a6c0-cd7319f0df5a', '9da64f65-5bff-488c-b974-c3f8ac72788f', '2024-08-28', 'Mesin Ice Cream', 'ISC-16', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-374d-49e8-8c4d-554a192786f4', '9da64f65-5d89-4ccc-9a44-04b0fb0fbad7', '2024-08-28', 'Mesin Tortiila', 'MKS-TRT11', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-3ef7-49f3-8c34-74c7afc038ff', '9da64f65-5f09-45ca-869b-b18897e74aa7', '2024-08-28', 'Mesin Dough Devider', 'MKS-DD15M', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-467e-41bc-92ed-ca7508f311ed', '9da64f65-619f-4c9e-a34f-d3c0723db188', '2024-08-28', 'Alat Churros', 'MKS-CRS05', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-4e54-4f17-bbd3-adf5b391d295', '9da64f65-6333-4b25-a9d7-8473d6918238', '2024-08-28', 'Mesin Hand Sealer', 'FS-1000', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-569e-4e8e-9c53-ea82cba98b16', '9da64f65-64d8-462d-9a69-e63a433c768f', '2024-08-28', 'Mesin Continious Band Sealer', 'SF-150W', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-5dfa-4ed3-bc56-e4e7b38b4ffd', '9da64f65-675f-4822-a545-7bf8f1b5d23e', '2024-08-28', 'Mesin Pemotong Tulang Manual', 'MKS-PTT38', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-691e-4008-8e7c-2f7369f74eb1', '9da64f65-68f7-4bea-b526-8b662ac76f40', '2024-08-28', 'Mesin Continious Band Sealer', 'FR-900W', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-7607-442a-89b2-9c8032e43c8f', '9da64f65-6a98-4043-b82b-374a494dbefc', '2024-08-28', 'Alat Peras Jeruk Manual', 'MKS-MJ1001', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-82ee-42cf-b440-8f2890a802ca', '9da64f65-6bfc-46b9-96fb-1f40b81217d7', '2024-08-28', 'Meat Slicer Pengiris Daging', 'MKS-70', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-8c71-4457-b8e9-d034c61b31ed', '9da64f65-6e1d-4875-90da-1177573918e5', '2024-08-28', 'Ice Crusher', 'MKS-002', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-92d4-4a56-8277-a74071b3a1f7', '9da64f65-6f89-43f2-96aa-4ff68bb343ca', '2024-08-28', 'Miller', 'MKS-ML200', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-9956-4b29-abfd-eb16294c3a77', '9da64f65-711c-43d9-b081-0b9bdea7b1cb', '2024-08-28', 'Mesin Takoyaki Gas', 'MKS-711B', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-9fe0-4ad3-b992-9fee0d66d7e7', '9da64f65-728b-4172-84e3-06d8759df6dd', '2024-08-28', 'Mini Coffe Roster', 'CRG-400', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-a746-4585-8b4d-120cba483604', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-08-28', 'Cup Sealer', 'CPS-959', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-ae88-46b0-9c77-02dca8a3236b', '9da64f65-75db-41ba-9b37-c7722ad2d2a3', '2024-08-28', 'Ice Crusher', 'MKS-CRS30', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-b532-4851-9b64-d48dd0aa410a', '9da64f65-7767-4c00-93f4-736894467b16', '2024-08-28', 'Mesin Stand Mixer', 'ARD-MR7', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-bbfc-4bb1-98a3-ddf20e65f549', '9da64f65-7b24-4844-addd-2f9fd622f8c5', '2024-08-28', 'Mesin Mixer Spiral ', 'MKS-SP50', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-c2e9-44f0-84ed-5b1739c31b11', '9da64f66-c520-48c9-b160-ff38d5e0d77e', '2024-08-28', 'Mesin Sosis Telur (Listrik)', 'GRILLO-400', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-ca22-4d1e-9f8a-33ddabb89e8c', '9da64f66-c713-4641-8062-a0249147870a', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS6', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-d131-4b46-a0ac-758709b2bdb0', '9da64f66-4e21-4561-a052-46dab2198f55', '2024-08-28', 'Mesin Sosis Telur (Listrik)', 'MKS-ERG005', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-d859-4851-8c23-a4e89f4e670a', '9da64f66-c90a-4537-a61c-5369ecfa9fc6', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'MKS-ERG002', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-e05c-4459-a363-3a7f77f587e1', '9da64f66-caca-4c5f-8306-2fe93b3fc84a', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'MKS-ERG444', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-e716-4a98-b81d-61de75ce1dc4', '9da64f66-4faf-4482-8cc5-2f25e1588669', '2024-08-28', 'Mesin Ice Crusher', 'MKS-003', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-edae-49de-8d3c-e3f82976a78f', '9da64f66-ccfc-4013-8a3e-8ec690d95fd2', '2024-08-28', 'Mesin Ice Crusher', 'MKS-CRS30', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-f4c4-442d-b3be-2f7eca074bd5', '9da64f66-cf4c-45fa-86af-f6770a51f2db', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS10', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64faf-fc0b-4c6e-9f14-9fe70739478d', '9da64f66-5209-40e4-9c35-7cb1436ba98f', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'MKS-ERG007', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-061c-4b2c-9f83-397c1e220b0e', '9da64f66-53c3-46f8-bd0c-e91607637ca2', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT24', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-1244-42df-b564-3d0485bc963d', '9da64f66-55d3-4bbe-9a87-5a00628f292d', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT24A', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-1e3d-4fcb-8e94-c55eb13cf294', '9da64f66-062c-4a1b-af06-e6bddd6d8e61', '2024-08-28', 'Mesin hand Sealer', 'MSP-200I', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-29b4-480c-aaf8-f1d23c969a5b', '9da64f66-5897-43ab-b026-d83a05a61dd9', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT96', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-35d7-4421-b46a-e0de0db7f78f', '9da64f65-dc5f-466d-a7bd-9d4f2c417f80', '2024-08-28', 'Mesin Kopi Espresso', 'MKS-MKP50', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-41f0-4fdc-aa92-370124a6df6e', '9da64f66-5abc-4914-9ede-907e2ca664b9', '2024-08-28', 'Mesin Filling Cairan Otomatis', 'MSP-F50', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-4fec-4b6b-b5f2-79597b2c6279', '9da64f66-5cbb-4446-877c-e10b421e4f67', '2024-08-28', 'Rok Espresso', 'Rok Espresso', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-5c39-4b4f-8f16-ec0deb4a4c4e', '9da64f66-5fc4-402e-9559-8038aee50bd8', '2024-08-28', 'Mesin Standing Mixer', 'MKS-MIX130', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-686a-42fe-b5ce-275aca3d9080', '9da64f66-61a6-438e-968b-536f6dc53069', '2024-08-28', 'Mesin Vacum Sealer', 'ARD-VS02', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-74b0-4c64-9aeb-83d8d644867a', '9da64f66-d18b-417f-bb67-632f99a1e3d4', '2024-08-28', 'Mesin Es Krim Buah', 'ICE-01', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-810e-4d3d-bb70-4f61354d0347', '9da64f66-01dd-4bf3-8e30-e156793e7eb0', '2024-08-28', 'Mesin Hand Sealer', 'MSP-400A', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:30', '2024-12-05 05:24:30'),
('9da64fb0-8c18-4492-8245-23ca8ee521e0', '9da64f66-6353-4e10-a81d-f8b803505e70', '2024-08-28', 'Mesin Hand Sealer', 'MSP-400I', 0, 0, 18, 18, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb0-9910-4aca-b921-db7fec37a1af', '9da64f66-d491-4cd0-8b92-3b697a5b9dba', '2024-08-28', 'Mesin Giling Daging', 'MHW-G51B', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb0-a4ea-48c8-99ea-6864e511610a', '9da64f66-65b6-491d-8165-12de57647ae4', '2024-08-28', 'Mesin Cetak Pelet Manual', 'PLT-10', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb0-b0d3-4493-ad96-f30406a34034', '9da64f66-d6b3-4bb3-9e0d-44261115eacb', '2024-08-28', 'Mesin pencacah Bumbu Dapur', 'MKS-UV22', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb0-bc02-40af-bed8-a9e377258dce', '9da64f66-6785-4578-bf83-6622ddda4453', '2024-08-28', 'Mesin Penepung Herbal, biji', 'MKS-ML300', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb0-c758-481b-8df5-76eac0ab194a', '9da64f66-d882-4eb3-acd2-99274bbad057', '2024-08-28', 'Mesin Penepung Herbal, biji', 'MKS-ML100', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb0-d3d6-48c5-8367-9e4688077f88', '9da64f66-690b-4f40-bb21-073474810257', '2024-08-28', 'Mesin Grinder Kopi', 'GRD-80A', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb0-e0e0-4988-a098-525fe5634ce3', '9da64f66-6b1b-4e84-b2f5-73209f99cfe8', '2024-08-28', 'Mesin Kebab', 'MKS-KB01', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb0-edd1-422c-ba2d-33981a95cee6', '9da64f65-f7b9-40c8-afa8-e24f0a1ad4d7', '2024-08-28', 'Mesin Takoyaki Listrik', 'MKS-700E', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb0-f9ea-4907-bd62-f94e8c15bf32', '9da64f66-6ce4-4386-99a0-1c6cac17bee0', '2024-08-28', 'Mesin Coklat Fountain', 'MKS-CC6', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-05ca-41ac-b05d-84380ad50fba', '9da64f66-6ea6-43c1-a541-776189485660', '2024-08-28', 'Food Dryer', 'MKS-DR6', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-113a-43b8-a64c-d246cffa916e', '9da64f66-7084-47d4-95fc-acbe07bf30b4', '2024-08-28', 'Deep Fryer', 'MKS-82B', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-1a1b-4123-9051-30152431ae5a', '9da64f66-7355-4240-bb84-82710a1b39cb', '2024-08-28', 'Alat Penanam Biji-Bijian', 'ARD-SED01', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-2097-45b2-830f-c4278a733aae', '9da64f66-7502-4077-bf44-63c8fcf492c3', '2024-08-28', 'Alat Penanam Biji-Bijian', 'ARD-SED02', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-2646-4c5d-9e0a-eddb5774a37a', '9da64f66-76e1-4c63-8d7b-be9153015509', '2024-08-28', 'Mesin Bread Maker', 'ARD-BM66X', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-2cf9-4d3b-aa29-8e5d3e0c44ef', '9da64f66-7952-4970-96cb-7a6f77c3eb19', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT56', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-354e-4e10-995b-173bd0b94e9a', '9da64f66-7b12-45ba-80f4-4d3f13fd1152', '2024-08-28', 'Blender Komersial', 'MKS-BL10L', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-418d-47ac-8fc3-733ba5d72df1', '9da64f66-7cf1-4eae-ac4a-8e3e166431dd', '2024-08-28', 'Bread Toaster', 'MKS-D04', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-4d61-4941-a616-faa2206cd41a', '9da64f66-7ef4-4486-9ab0-82393074e426', '2024-08-28', 'Deep Fryer', 'MKS-51B', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-58b3-4c2d-9bad-008141e9d3b4', '9da64f66-810a-4f08-b2c9-4c499462faaa', '2024-08-28', 'Deep Fryer', 'MKS-81', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-64be-46d5-8228-ab6fe35e7723', '9da64f66-82f4-49de-a270-c8c31126d56b', '2024-08-28', 'Deep Fryer', 'MKS-82', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-7150-4d09-9f36-166b9a88a02d', '9da64f66-0033-4d58-9d7a-8ddc35a1a3be', '2024-08-28', 'Cetak Mie dan Pasta', 'ARD-NM4', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-7d36-442c-8aba-948f162267ca', '9da64f66-dae9-4772-9c12-f816219422b1', '2024-08-28', 'Pemanggang 2 Tungku', 'MKS-111BBQ', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-8958-466f-9e8b-e173e3055da8', '9da64f66-850d-4e73-82af-0872a2177a9b', '2024-08-28', 'Food Dryer', 'MKS-DR10', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-9598-4680-85bd-0dbe03215765', '9da64f66-86ff-4e0d-8cf6-0d11de84a2c3', '2024-08-28', 'Deep Fryer', 'MKS-G20L +Keranjang', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-a27f-47bc-b342-194615285d77', '9da64f66-dcb1-4bf9-aec6-1aaecdab2b1a', '2024-08-28', 'Deep Fryer', 'MKS-72', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-aae1-4a2a-ac76-d1ea96f0823a', '9da64f65-f531-4596-9bcf-fbb108022a13', '2024-08-28', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-b3a2-4e21-b546-d781b252f4ad', '9da64f66-dec7-4463-8c79-143fdaf274f0', '2024-08-28', 'Mesin Pemanggang Listrik', 'MKS-PG2', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-c001-4d15-adff-fa5ee72a5eee', '9da64f66-e178-4b89-8e43-de18ca2c6179', '2024-08-28', 'Manual Meat Slicer', 'MKS-MSL66', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31');
INSERT INTO `tb_stok_barang` (`id_stok`, `id_barang`, `tanggal`, `nama_barang`, `tipe_barang`, `barang_masuk`, `barang_keluar`, `stok_awal`, `stok_akhir`, `posisi`, `keterangan`, `created_at`, `updated_at`) VALUES
('9da64fb1-cbca-44c4-b589-5bef30602ed5', '9da64f66-890c-42e0-aac9-c76e65bea1d2', '2024-08-28', 'Mesin Manual Meat Mixer', 'MKS-MM01', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-d6a8-4145-a6cc-1a5477b03654', '9da64f65-78d7-4bd9-9235-3481b2a92716', '2024-08-28', 'Mesin Cetak Mie', 'MKS-145', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-e02e-4da3-8c9f-65064ea86098', '9da64f66-8b11-4f71-86dc-5a3737ae8ed0', '2024-08-28', 'Mesin Ice Tube', 'MKS-IM22', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da64fb1-eb1d-4c96-8754-6b6be785ed29', '9da64f66-8ddf-47c3-872a-a3dab1cdd1ff', '2024-08-28', 'Mesin Takoyaki Gas ', 'MKS-722B', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-05 05:24:31', '2024-12-05 05:24:31'),
('9da6529d-d7bf-4c99-acd8-53c1e6f40bf6', '9da6529d-d0f6-4226-a2c2-94022bb524fd', '2024-08-28', 'Sparepart Baut Saringan Susu Kedalai SKD-100B', 'SKD-100B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529d-de4c-4b28-80e2-22dfacb9aaf9', '9da6529d-da49-49f7-830e-f1801770ce7e', '2024-08-28', 'Sparepart Conveyor Pendek/Atas Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529d-e50b-4c3d-ae45-d131afc7d241', '9da6529d-e100-4209-85bd-fe969f8d7424', '2024-08-28', 'Sparepart Conveyor Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529d-ec83-44c6-8cb8-500df69929cb', '9da6529d-e84c-4647-94e2-072a5dfe4b09', '2024-08-28', 'Sparepart Moulding Ukuran 1 Cm Cetak Tablet MKS-TBL11', 'MKS-TBL11', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529d-f2d8-42b2-b784-61e20735d519', '9da6529d-ef1b-437c-baf2-f374c40929df', '2024-08-28', 'Sparepart PCB Tetas Telur AGR-TT96 Versi Lama', 'AGR-TT96', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529d-f96e-4096-992d-e2cc3c054005', '9da6529d-f556-4fca-8a3f-e3c23275cebe', '2024-08-28', 'Sparepart Pisau Penyerut Tusuk Sate Uk 4 mm ST-103 HS', 'ST-103', 0, 0, 10, 10, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529d-ffc5-46a6-8bb0-1713134376f5', '9da6529d-fbfb-4ace-bc51-a732d94c2792', '2024-08-28', 'Sparepart Roda (Hidup) Per-PCS Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-080a-48d9-a4f3-4b658bae0270', '9da6529e-031e-4eef-8f51-06ff2096616a', '2024-08-28', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-400', 'Grillo-400', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-0e1b-460b-8d26-f31aaccf3214', '9da6529e-0a2c-4cc9-8f3d-ab88cbeb5e9e', '2024-08-28', 'Sparepart Sisir Cetak Mie MKS-220SS', 'MKS-220SS', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-14be-496b-9039-999f44029c99', '9da6529e-1036-494d-9293-82a035d0679b', '2024-08-28', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-GS10', 'Grillo-GS10', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-1c78-4950-a459-92381608ba16', '9da6529e-172d-490d-870b-7cb531df5222', '2024-08-28', 'Sparepart Heating Element MSP-300I', 'MSP-300I', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-228f-49c1-999f-d95f9353dd34', '9da6529e-1ec0-49bf-a79c-5dcb22f378f9', '2024-08-28', 'Sparepart Kain Teflon MSP-300i', 'MSP-300I', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-29a2-497f-bafd-9c4baff6ca3a', '9da6529e-24b0-40a7-9bee-02e59387fd2c', '2024-08-28', 'Sparepart Pisau 4mm Vegetable\nCutter MKS-CT100\n', 'MKS-CT100', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-304f-4de7-873d-8a7412014fea', '9da6529e-2b73-4afb-95d7-c1f9757fb3e0', '2024-08-28', 'Sparepart  Keramik Humidifier Tetas Telur AGR TT360', 'AGR TT360', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-36fe-4ac4-9b53-067fdf863dd1', '9da6529e-325e-40ed-9a5f-f355f68bd4f6', '2024-08-28', 'Sparepart Rak 1 Set Tetas Telur AGR-TT360', 'AGR TT360', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-3d4d-4af8-84da-c8573b0309e2', '9da6529e-3911-4068-bf57-47e4127da124', '2024-08-28', 'Sparepart Screw Giling Daging \nMHW-120\n', 'MHW-120', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-43b4-4074-8726-a24db08218ee', '9da6529e-3f4c-4655-83f2-24181bced320', '2024-08-28', 'Sparepart Penjepit Cetak Bakso MKS-MFC280', 'MKS-MFC280', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-4a1d-4bce-b2b0-8972a5d1119f', '9da6529e-45d3-4869-aa42-6b4bffc42502', '2024-08-28', 'Sparepart Ring Cup Sealer Uk. 88mm 10-16 Oz CPS-959', 'CPS-959', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-5077-4829-9d89-7eeab769c051', '9da6529e-4bff-415a-8c3a-cc57bacc757c', '2024-08-28', 'Sparepat Per Cetak Bakso MKS-MFC280', 'MKS-MFC280', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-56ad-46be-8d28-e6d7c41e2afa', '9da6529e-52d1-41f2-abb7-a76781aa95ac', '2024-08-28', 'Baut pengunci kecil cetak mie', 'CM-123', 0, 0, 4, 4, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-5b89-4c52-ae71-c44c9f965d92', '9da6529e-5852-416d-bb45-f992b3cbd61c', '2024-08-28', 'Sparepart penutup bawah eggroll ERG-001,ARD-202,ARD-404', 'ERG-001,ARD-202,ARD-404', 0, 0, 11, 11, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-6048-443d-9cfc-509342a3782f', '9da6529e-5d3b-4c6b-a1a8-f6cd51502cc9', '2024-08-28', 'Sparepart Ring moulding Uk.66mm 8 oz CPS-959', 'CPS-959', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-656d-4dbd-b519-def8f5cfc6a4', '9da6529e-620e-4426-855d-d73ecaafd7a1', '2024-08-28', 'PCB KZB-1', 'KZB-1', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-6b28-4ab9-8e9f-b8687140cea8', '9da6529e-670d-4ab2-8374-9469ab6e1acd', '2024-08-28', 'Sparepart corong atas perajang rumput AGR-CH400B', 'AGR-CH400B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-7041-48ca-9ba2-d4ad2cb1e2bf', '9da6529e-6cce-4f59-94ea-e5b12365db8b', '2024-08-28', 'Pisau penyerut mesin giling daging MHW-G51B/Kecil', 'MHW-G51B/Kecil', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-74d0-440a-b821-d8364c6f5be4', '9da6529e-71e3-44af-90b2-e97a8d40d649', '2024-08-28', 'Sparepart Tray Food Dehidrator ARD-PM99', 'ARD-PM99', 0, 0, 5, 5, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da6529e-7ff0-4e99-a418-27ebe0b7d769', '9da6529e-7c6b-4ec3-83f4-0641b633333e', '2024-08-28', 'Sparepart Tombol Emergency Mixer Planetary MKS-20B/30B', 'MKS-20B/30B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 05:32:42', '2024-12-05 05:32:42'),
('9da68f23-a48e-4233-87d2-169d58a17eac', '9da68e98-72d0-470e-93f8-226a95c52506', '2024-08-30', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-05 08:21:56', '2024-12-05 08:27:48'),
('9da68f65-f324-4c71-a8b7-15cc63da0bb8', '9da68ed5-68dc-4210-ac27-39d36e426e9e', '2024-08-30', 'Sparepart Bearing 6205', 'ADT-SM20', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-05 08:22:39', '2024-12-05 08:30:46'),
('9da694e0-b9c1-4468-993b-67d4abfc81e7', '9da65bd1-a4d8-433f-bc65-3db1f41af518', '2024-08-31', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', 1, 0, 0, 1, 'Kasir', 'stok', '2024-12-05 08:37:58', '2024-12-05 08:37:58'),
('9da69629-2948-463c-9829-5c41bc8f1e57', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-04', 'Cup Sealer', 'CPS-959', 0, 1, 2, 1, 'Rak-4', 'stok', '2024-12-05 08:41:34', '2024-12-05 08:41:34'),
('9da6a1c9-4586-4d85-9ee9-2cdf985e12f0', '9da65bd1-a4d8-433f-bc65-3db1f41af518', '2024-09-04', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-05 09:14:04', '2024-12-05 09:14:04'),
('9da6a381-9976-45c7-b4b5-972e8c06a352', '9da6529e-76cd-4ccf-a3d6-34d0762285ac', '2024-08-28', 'Sparepart Pully Kecil Cetak Mie MKS-220SS/MKS-160/MKS-240SS/MKS-200', 'MKS-220SS/MKS-160/MKS-240SS/MKS-200', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-05 09:18:53', '2024-12-05 09:18:53'),
('9da6a4ad-9987-4888-89d8-b55916b5c346', '9da6529e-76cd-4ccf-a3d6-34d0762285ac', '2024-09-04', 'Sparepart Pully Kecil Cetak Mie MKS-220SS/MKS-160/MKS-240SS/MKS-200', 'MKS-220SS/MKS-160/MKS-240SS/MKS-200', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-05 09:22:09', '2024-12-05 09:22:09'),
('9da6a952-09ed-4d4c-831f-191decdd01ef', '9da64f65-191e-48f5-a5aa-bbd4253d8a96', '2024-09-02', 'Mesin Cetak Mie', 'MKS-140', 1, 0, 0, 1, 'Kasir', 'stok', '2024-12-05 09:35:08', '2024-12-05 09:35:08'),
('9da6aa0b-bb39-45a3-a9fa-2c8dac09a4c4', '9da64f65-5a9b-40d7-82f3-cf4253b69d72', '2024-09-02', 'Mesin Gas Deep Fryer', 'MKS-72', 1, 0, 0, 1, 'Kasir', 'stok', '2024-12-05 09:37:10', '2024-12-05 09:37:10');

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
('9da689bb-b83d-4872-a649-96a76d031a78', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-08-28', '601018004', 'Cup Sealer', 'CPS-959', 2, '2024-12-05 08:06:49', '2024-12-05 08:08:43'),
('9da6913d-c7b9-45c6-afa9-c50133d237b8', '9da68e98-72d0-470e-93f8-226a95c52506', '2024-08-30', '102229057', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 1, '2024-12-05 08:27:48', '2024-12-05 08:27:48'),
('9da6924d-10d1-4e02-a720-1fccb289975e', '9da68ed5-68dc-4210-ac27-39d36e426e9e', '2024-08-30', '102263010', 'Sparepart Bearing 6205', 'ADT-SM20', 1, '2024-12-05 08:30:46', '2024-12-05 08:30:46'),
('9da69629-2ec6-4ee0-99a8-61b2db16b5a1', '9da64f65-7470-45f3-997c-5b274e63cad6', '2024-09-04', '601018004', 'Cup Sealer', 'CPS-959', 1, '2024-12-05 08:41:34', '2024-12-05 08:41:34'),
('9da6a1c9-4d3b-49c7-9cbf-8eda338b0a4d', '9da65bd1-a4d8-433f-bc65-3db1f41af518', '2024-09-04', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', 1, '2024-12-05 09:14:04', '2024-12-05 09:14:04'),
('9da6a4ad-a0ee-43bb-81b4-793917b9f013', '9da6529e-76cd-4ccf-a3d6-34d0762285ac', '2024-09-04', '102226097', 'Sparepart Pully Kecil Cetak Mie MKS-220SS/MKS-160/MKS-240SS/MKS-200', 'MKS-220SS/MKS-160/MKS-240SS/MKS-200', 1, '2024-12-05 09:22:09', '2024-12-05 09:22:09');

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
('9da689bb-aa62-4af9-9b3f-3bcd9f3530a6', '9da64f65-7470-45f3-997c-5b274e63cad6', '9da64fac-1132-4cf0-8280-ecc8bdfa0835', '2024-08-28', 'SO.2024.08.00028', 'Aria, Bpk', '081325256325', 'Beringin Eddy - Riau', 'Muhammad Reza', '601018004', 'Cup Sealer', 'CPS-959', 1, '1400000.00', 'Rak-4', 'lunas', 'tunai', '0.00', '910000.00', 35, '910000.00', '0.00', '2024-12-05 08:06:49', '2024-12-05 08:06:49'),
('9da68a6a-b8b2-4f4f-b913-c2125b9f895c', '9da64f65-7470-45f3-997c-5b274e63cad6', '9da64fac-1132-4cf0-8280-ecc8bdfa0835', '2024-08-28', 'SI.2024.08.00030', 'Ajar, Ibu', '081364290613', 'Sungai Pinang - Riau', 'Tia Saputri', '601018004', 'Cup Sealer', 'CPS-959', 1, '1400000.00', 'Rak-4', 'lunas', 'tunai', '0.00', '910000.00', 35, '910000.00', '0.00', '2024-12-05 08:08:43', '2024-12-05 08:08:43'),
('9da6913d-b926-4423-bf46-c18d7927651d', '9da68e98-72d0-470e-93f8-226a95c52506', '9da68f23-a48e-4233-87d2-169d58a17eac', '2024-08-30', 'SO.2024.08.00031', 'Diana Sartika, Ibu', '085262370667', 'Jl.Siak 2 Palas - Pekanbaru', 'Tia Saputri', '102229057', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 1, '100000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '100000.00', 0, '100000.00', '0.00', '2024-12-05 08:27:48', '2024-12-05 08:27:48'),
('9da6924d-0377-42f3-b2ad-d107a6c54ce4', '9da68ed5-68dc-4210-ac27-39d36e426e9e', '9da68f65-f324-4c71-a8b7-15cc63da0bb8', '2024-08-30', 'SI.2024.08.0031', 'Diana Sartika, Ibu', '085262370667', 'Jl.Siak 2 Palas - Pekanbaru', 'Tia Saputri', '102263010', 'Sparepart Bearing 6205', 'ADT-SM20', 1, '80000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '80000.00', 0, '80000.00', '0.00', '2024-12-05 08:30:46', '2024-12-05 08:30:46'),
('9da69629-20d3-422a-9c7e-a75b5bce0785', '9da64f65-7470-45f3-997c-5b274e63cad6', '9da64fac-1132-4cf0-8280-ecc8bdfa0835', '2024-09-04', 'SI.2024.09.0002', 'Roy Putra, Bpk', '085265802234', 'Jl.Lintas Timur KM-19 - Pekanbaru', 'Tia Saputri', '601018004', 'Cup Sealer', 'CPS-959', 1, '1400000.00', 'Rak-4', 'lunas', 'non tunai', '0.00', '910000.00', 35, '910000.00', '0.00', '2024-12-05 08:41:34', '2024-12-05 08:41:34'),
('9da6a1c9-3825-40fc-84d3-516cb8098e9f', '9da65bd1-a4d8-433f-bc65-3db1f41af518', '9da694e0-b9c1-4468-993b-67d4abfc81e7', '2024-09-04', 'SI.2024.09.0003', 'Darliansyah, Bpk', '08126814341', 'Jl.Cipta Karya Perum Villa - Pekanbaru', 'Muhammad Reza', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual MKS-3V, MKS-5v, MKS-7v, MKS-10v', 'MKS-3V, MKS-5v, MKS-7v, MKS-10v', 1, '260000.00', 'Kasir', 'lunas', 'tunai', '0.00', '260000.00', 0, '260000.00', '0.00', '2024-12-05 09:14:04', '2024-12-05 09:14:04'),
('9da6a4ad-9042-4784-a25f-870a8b47051e', '9da6529e-76cd-4ccf-a3d6-34d0762285ac', '9da6a381-9976-45c7-b4b5-972e8c06a352', '2024-09-04', 'SI.2024.08.00023', 'Indra Mahira, Bpk', '082173214448', 'Jl.Tanjung Pati Sari Lamak Payakumbuh Sumatra Barat', 'Muhammad Reza', '102226097', 'Sparepart Pully Kecil Cetak Mie MKS-220SS/MKS-160/MKS-240SS/MKS-200', 'MKS-220SS/MKS-160/MKS-240SS/MKS-200', 1, '60000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '60000.00', 0, '60000.00', '0.00', '2024-12-05 09:22:09', '2024-12-05 09:22:09');

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
