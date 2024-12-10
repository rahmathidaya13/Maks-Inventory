-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 10, 2024 at 05:01 PM
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
('9db0d1c8-e3ff-4111-97db-ffdd56410428', 'Mesin Universal Fritter', 'MKS-UV44', '2090000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-e5d0-4817-8530-318b8b979f47', 'Mesin Cup Sealer', 'CPS-10A', '4980000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-e6d6-4dbf-a7a0-8e78c2d4dd36', 'Mesin Cetak Mie', 'MKS-140', '1780000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-e7a3-4414-bb83-d5c1d1633e57', 'Mesin Pencabut Rumput', 'AGR-PR238', '4420000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-e845-4dbe-b459-ddd40d60f423', 'Mesin Dough Mixer', 'MKS-DMIX002', '2650000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-e8e8-468b-af83-4b98e4d59fd4', 'Mesin Cetak Mie', 'MKS-180SS', '4370000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-e976-4f3b-8359-29c08e5681c6', 'Mesin Food Dehidrator', 'ARD-PM99', '820000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-ea1b-40c8-830f-206c1c4daa7a', 'Mesin Cetak Pelet', 'MKS-PLT25', '6490000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-ea9e-4cc6-9d66-c40e3487737a', 'Alat Sauce Pan/Ssauce Dispenser', 'MKS-SU-01', '1490000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-eb1b-4053-a530-022cce858aba', 'Mesin Cetak Mie', 'MCM-150', '330000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-eb98-4842-ab36-5387c8e61035', 'Mesin Coffe Espresso', 'MKS-MKP60', '10930000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-ec19-4432-82ae-7b76b7adca54', 'Alat Giling Daging manual', 'MKS-SG10', '1450000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-eca5-45e2-8659-2d0dd6186901', 'Mesin cetak Mie Manual', 'MKS-150B', '1010000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-ed25-47b0-b184-9ec340b633ce', 'Mesin Cetak Mie', 'MKS-200', '3090000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-eda1-410e-93f6-6b3af23d3816', 'Alat Pemotong Kerupuk Lontong manual', 'AGR-LTG22', '2430000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-ee21-4977-a3fb-d454e936a3e4', 'Mesin Waffle Maker', 'MKS-WF48', '7610000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-ee9e-4951-af4a-6519fa0a5ef8', 'Mesin Electric Kettle', 'KTL-DBL2', '330000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-ef1b-448d-95dd-c341f062f25e', 'Mesin electric Kettle', 'ARD-KT12', '540000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-efa3-496f-8dcf-1a9002320651', 'Mesin Coffe Grinder', 'MKS-GRD60A', '5610000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f02d-48e9-babd-af421f2b335c', 'Mesin Coffe Bean Grinder', 'MKS-CG50', '180000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f0d5-43a0-a1dd-606588e95e73', 'Mesin Pemipil Jagung', 'PPJ-001', '1880000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f15d-452b-b232-68ff5707a05d', 'Alat Cetak Mie dan Pasta', 'CM-2020', '190000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f1d9-4f4d-9390-d155e46f8dde', 'Mesin Giling Daging', 'MHW-120', '4180000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f259-442f-af94-039ecca1f362', 'Mesin Pemanggang', 'MKS-111BBQ', '1010000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f2eb-4a61-8459-b20ed0189f3f', 'Mesin Big Smoker', 'MKS-BLS002', '1900000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f37d-42e9-a8cd-8a9832be2b31', 'Mesin Tetas Telur', 'AGR-TT32', '2170000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f406-48ca-975b-cdfcebe910cc', 'Mesin Cetak Mie', 'MKS-160SS', '4370000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f48c-4bc1-be1d-208238486cda', 'Mesin Stik Wafel', 'MKS-HDW5', '2050000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f50f-4629-be70-109c995f4c8c', 'Mesin Pemanggang', 'MKS-369BBQ', '1130000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f591-4336-a491-f8f4256048a2', 'Mesin Pemanggang', 'MKS-222BBQ', '1440000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f615-4e5c-b401-ddab001b58f8', 'Mesin Mixer Planetary', 'MKS-B5A', '6980000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f694-4442-96e1-f90aa3af3b15', 'Foot Sealer', 'FRP-600', '1300000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f747-4a73-b0c9-aea019d48098', 'Foot Sealer', 'FRP-400', '1110000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f7d1-454e-87cf-1d534671058d', 'Mesin egg Roll', 'MKS-ERG001', '2070000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f84e-4a34-861e-bdad9bf75d6e', 'Mesin Dough Devider', 'MKS-BA80', '19240000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f8d4-4f5a-8b8a-0bdbdbe8ac8c', 'Mesin Pemipil Jagung', 'AGR-CORN9', '390000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f95e-4c38-987b-348bd1ba6599', 'Mesin Gas Deep Fryer', 'MKS-G75', '6780000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-f9e2-4011-bc0d-be8a7cca1d65', 'Mesin Gas Deep Fryer', 'MKS-G20L', '4500000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-fa5f-4cdf-8bd2-6934783ad5d1', 'Mesin Gas Deep Fryer', 'MKS-72', '2810000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-fada-4d24-956a-45af9e3a4672', 'Mesin Ice Cream', 'ISC-16', '15470000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-fb55-4b78-90a2-281ca243294f', 'Mesin Tortiila', 'MKS-TRT11', '7230000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-fbd6-4085-bc94-5700943ae16c', 'Mesin Dough Devider', 'MKS-DD15M', '1130000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-fc59-4880-98a2-af839f5bfd0b', 'Alat Churros', 'MKS-CRS05', '6880000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-fcd5-4a96-9c61-17391b701bb4', 'Mesin Hand Sealer', 'FS-1000', '1640000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-fd6d-4e22-b25b-f058c3d01b68', 'Mesin Continious Band Sealer', 'SF-150W', '6180000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-fdf9-48cd-97d6-f161f9fd9991', 'Mesin Pemotong Tulang Manual', 'MKS-PTT38', '6520000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-fe75-4665-8070-7ab55d3462ec', 'Mesin Continious Band Sealer', 'FR-900W', '4980000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-fef6-4fb7-b041-943e66919789', 'Alat Peras Jeruk Manual', 'MKS-MJ1001', '670000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-ff7f-41ca-94f7-2b44a5995189', 'Meat Slicer Pengiris Daging', 'MKS-70', '1850000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c8-ffff-4167-b027-5cc20a4c89f6', 'Ice Crusher', 'MKS-002', '970000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-007b-4491-90b4-a353d5b0550b', 'Miller', 'MKS-ML200', '1330000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-00f8-4d71-a9ba-4c3d45c1b5a7', 'Mesin Takoyaki Gas', 'MKS-711B', '1370000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0175-49a2-831b-0c8da8e5b1e7', 'Mini Coffe Roster', 'CRG-400', '3100000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-01f3-4291-a5d4-a0be0922579e', 'Cup Sealer', 'CPS-959', '1400000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-027d-40c9-ace2-7607979e6d9d', 'Ice Crusher', 'MKS-CRS30', '1550000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-02f9-4e03-a5d9-3f8fe027679e', 'Mesin Stand Mixer', 'ARD-MR7', '6100000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0376-44a7-9b64-4398dbea5d4d', 'Mesin Cetak Mie', 'MKS-145', '2010000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0409-4835-8b56-f02017e466fc', 'Mesin Mixer Spiral', 'MKS-SP50', '16860000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0492-4f52-a824-7119e5753718', 'Oven Roti Gas 1 Loyang', 'MKS-RS11', '8280000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0511-45ba-89c7-3f93cc6fc18d', 'Penetas Telur', 'AGR-INC24', '3500000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-05ac-4223-9abe-098d3c3ee180', 'Penetas Telur', 'AGR-TT7', '540000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-063c-4b7b-b5c7-e886d77c85a1', 'Penetas Telur', 'AGR-TT4', '480000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-06ba-4bf6-b4cb-065b45f8ab64', 'Mesin Soft Ice Cream', 'MKS-ICM-119', '15680000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0736-4823-aaa1-3909246b64fc', 'Mesin Dough Mixer', 'MKS-DG15', '8070000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-07b1-48ee-8240-9f9870967309', 'Mesin Cetak Mie', 'MKS-350', '7740000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-082f-445d-a92e-12a02c857ef2', 'Mesin Serutan Es Salju', 'MKS-ICE28', '5680000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-08b9-4453-ac61-dbca84343db8', 'Mesin Perajang Keripik', 'MKS-CT100 A', '8960000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0935-4c08-a035-501e849052c3', 'Pengupas Nanas Industri', 'MKS-PN60', '5600000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-09b0-4132-b340-517a3df8f349', 'Mesin Mixer Planetary', 'MKS-10B', '8110000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0a30-4375-bd78-ec17abd53b18', 'Mesin Mixer Planetary', 'MKS-BK20M', '10310000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0adc-4b4f-9318-56ac30771412', 'Oven Listrik', 'ARD-EO33', '1380000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0b6a-46f8-8ed8-a294e2357e06', 'Bread Maker', 'ARD-BM55X', '1850000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0bf3-4b47-ab2e-c95caf71d3d7', 'Ice Crusher', 'MKS-CRS30L', '1530000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0c77-4c84-97e6-dac5d33db673', 'Timbangan Digital', 'TBG-3', '200000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0cf4-4a98-b2d0-ef9ac36070af', 'Timbangan Digital', 'TBG-1', '110000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0d6f-4c3b-9ce7-9a4aafa54efe', 'Timbangan Digital', 'TBG-5', '200000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0dec-415a-8dcb-596f7d644c24', 'Timbangan Digital', 'TBG-10', '170000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0e69-4868-9599-c87a445757b1', 'Cetak Sosis Telur Listrik', 'ARD-404', '300000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0eee-4328-90d7-9f6db2e39927', 'Cetak Sosis Telur Listrik', 'ARD-202', '170000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0f69-4989-a4ed-3524d147057a', 'Cetak Sosis Telur Listrik', 'ARD-303', '180000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-0fe5-4445-8204-ae9576f3ae28', 'Cetak Sosis Telur Listrik', 'ARD-505', '490000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1061-4d8d-a0f3-5edcc28f8756', 'Cetak Sosis Telur Listrik', 'GRILLO-400', '1090000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-10fc-4a45-ac9b-313fc194bc67', 'Blender', 'MKS-BLD 1,5L', '470000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-11ac-47b6-9c46-f600f6862ecd', 'Pemanas Air', 'BT-119', '170000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1237-4334-8418-36dbb395c097', 'Peras Jeruk', 'ARD-J22', '240000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-12b5-4604-bf4d-db1ad98f88ec', 'Ice Krim Buah', 'ICE-01', '540000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1330-4953-ab9b-97c6af645d1e', 'Long Potato', 'MKS-LPCT50', '1590000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-13ac-497b-a0f8-e74aacf168de', 'Giling Daging', 'MHW-G31B', '960000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-142a-446a-a98d-314066524b88', 'Giling Daging', 'MHW-G51B', '1110000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-14a7-4abc-af0d-7ecfc203164a', 'Mangkok', 'ICE BARREL', '390000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-152d-4f99-b9a7-b9d62af47f91', 'Display Warmer', 'MKS-DW66', '5450000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-15aa-4ea8-abed-306427809890', 'Lafira', 'LAFIRA', '7410000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1626-499f-a8b0-316b23536cc3', 'Pemotong keripik tempe', 'MKS-JT04', '460000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-16a1-41eb-a8d8-7c1238a27b2f', 'Mesin Gelas Kesehatan', 'ARD-CP5', '550000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-171f-482f-a047-f6532407d6ee', 'Ice Crusher', 'MKS-CRS20', '1100000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-17d2-42db-a153-d7f3ef4e600b', 'Chopper', 'ARD-FC300', '690000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1867-4c17-b053-fe3f227c8260', 'Chopper', 'ARD-FC200', '500000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-18e7-4a50-955f-7818d4068d24', 'Pemanggang', 'ARD-GRL77', '710000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1963-4d59-bba6-2a8690f075d2', 'Kentang Spiral', 'TP-200', '530000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-19e1-44ec-8cb9-f1595b015a6c', 'Alat Pengiris Kentang Spiral', 'MKS-PSS44', '150000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1a5e-4a81-a7b4-6c40502fa0f8', 'Alat Pengiris Apel', 'MKS-APL88', '190000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1ada-4ab1-bb30-a2617426512d', 'Alat Cetak Long Potato', 'MKS-LPCT30', '790000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1b58-493e-985f-e296589aebc5', 'Alat Cetak Long Potato', 'MKS-MER2', '310000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1bd5-45db-ac64-9a1513c5303f', 'Alat Cetak Sate Telur Puyuh', 'ARD-TKY16', '230000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1c50-45a2-b99c-a2630de5d39d', 'Mesin penepung Herba, Farmasi dan biji', 'MKS-ML100', '790000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1ccd-4316-bd82-f6c48e2c5c41', 'Mesin Kopi Espresso', 'MKS-MKP50', '2450000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1d4a-4195-9a65-893fbcee3f5f', 'Mesin Grinder kopi', 'MKS-GRD80A', '3850000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1dca-427b-917a-4cae88a73e5c', 'Mesin Penggiling Kopi', 'MKS-600B', '1250000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1ea2-4093-b54d-e98905f1f449', 'Mesin Deep Fryer Gas', 'MKS-71', '1540000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1f2f-4023-b3d1-f791f537e83e', 'Mesin Pembuat Sosis Telur', 'MKS-ERG002', '2930000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-1fac-4f01-9bec-d9b49b7b2e33', 'Mesin Egg Roll', 'GRILLO-GS10', '2570000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2028-494d-8481-65adba7eb325', 'Mesin Egg Roll', 'GRILLO-GS6', '2120000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-20a4-479b-921c-04419bd390c9', 'Mesin Egg Roll', 'MKS-ERG444', '1550000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2124-43db-987e-41fb6b941194', 'Alat Manual Meat Slicer', 'MKS-MSl66', '850000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-21ab-4a96-b099-2890a9ec9773', 'Mesin Cetakan Donat', 'MKS-DN60', '3160000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-222a-4171-8fff-eddccfe94289', 'Mesin Hot Dog Wafel', 'MKS-HDW6', '2510000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-22e1-462e-8368-134cbbfe8810', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', '2280000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2364-436f-8cc2-72376a9f4275', 'Mesin Takoyaki Listrik', 'MKS-700E', '1480000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-23e0-4f85-a1a8-a5ffae12a728', 'Mesin Waffle Taiyako', 'MKS-ETYK3', '4750000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2472-41e8-9f57-fdfd7931ddb9', 'Mesin Perajang Sayur dan Buah', 'MKS-VGT65', '880000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2510-4357-97ed-49305b7a82f8', 'Mesin Slot Toaster', 'MKS-D06', '1680000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-258e-4821-9b80-27c13e0b506f', 'Cetak Mie dan Pasta', 'ARD-NM4', '2000000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2609-4446-96b8-9c2d1af27aa3', 'Mesin Hand Sealer', 'MSP-400A', '880000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2686-4a5a-9996-691439b1593c', 'Mesin Hand Sealer', 'MSP-300A', '700000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2702-4b3f-9287-44cdd24dd891', 'Mesin Hand Sealer', 'MSP-200I', '370000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-277d-4d8e-949c-ba2f77d5b9bf', 'Mesin Hand Sealer', 'MSP-200A', '490000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-27f9-42a1-aea2-bc2a8d68d78c', 'Mesin Hand Sealer', 'MSP-300i', '600000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2879-48bf-9d96-2a6167ab1ffd', 'Mesin Vacum Sealer', 'MSP-DZ280A', '1410000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-28f7-47bc-a2a4-4d12c569403f', 'Mesin Vacum Sealer', 'MSP-290E', '1430000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2974-404a-8717-ac51b2e2e2ee', 'Mesin Vacum Sealer', 'MSP-VS02', '1190000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-29f0-4c3b-b8fb-e906f9728cb1', 'Mesin vakum food sealer', 'ARD-VC85', '310000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2a6e-4d61-873c-b01906f6adb0', 'Mesin vakum sealer', 'ARD-VS01', '1760000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2af6-410a-a750-737bb8993492', 'Mesin Hand Printer', 'HP-351', '1620000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2b8a-48c8-94c4-984c1f2d39e4', 'Alat Cetak Sosis Horizontal', 'MKS-3V', '2490000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2c08-45d8-aaa1-58970271bfa2', 'Alat Cetak Sosis Vertikal', 'MKS-3H', '2270000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2c85-4c71-800d-399abdf195cd', 'Mesin Pengupas Bawang Putih', 'AGR-BWG180', '2550000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2d01-4cc1-83a1-01007fac536a', 'Mesin Giling Daging', 'MHW-80', '3820000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2d7e-44f8-a44b-24c75388e9d9', 'Mesin Giling Daging', 'MHW-220', '5720000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2dfc-4768-8988-c9d9fe33109f', 'Mesin Pemanggang', 'MKS-PG4', '2180000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2e79-4907-aa69-6eb564185cf5', 'Mesin Pemanggang', 'MKS-PG2', '1700000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2ef7-4298-bf77-992ea18887a3', 'Mesin Egg Waffle Listrik', 'MKS-EW06', '1730000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2f73-45e1-84c8-563b2258658d', 'Mesin Egg Waffle Gas', 'MKS-GW07', '1750000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-2fef-44b1-a249-1a0ed8733f4b', 'Mesin Cone Bakar', 'MKS-CB1', '2080000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-306b-49a9-bbd7-e3995e1a7d27', 'Mesin Universal Fritter', 'MKS-UV22', '1370000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-30e8-4e55-a293-f137c17a125d', 'Alat Perajang bawang manual', 'PRJ-BM', '510000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3198-4ce8-b192-5f59b113de24', 'Alat Perajang singkong manual', 'PRJ-M', '540000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3242-4b1a-8dd2-38c4e22896f8', 'Mesin Pembuat Gulali', 'MKS-CT76', '4630000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-32ce-4ace-968b-1fb1c9a06390', 'Cup Sealer', 'CPS-919', '1400000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-334e-44b4-80d1-d7bc9a5cd880', 'Cup Sealer', 'CPS-818', '1180000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-33cc-41d7-9c8e-68956e88b138', 'Hand Sprayer (Semprotan)', 'SPR-16', '610000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-344a-44b4-a88b-1cc2680ce449', 'Mesin Pemanggang Grill', 'ARD-GRL88', '530000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-34c7-468a-acff-b66593b494d6', 'Mesin Cetak Mie', 'MKS-160', '2590000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3545-4d72-85b8-b2f61e439017', 'Teko Listrik Stainless', 'ARD-KT11', '530000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-35c1-409c-864c-c8fbf0ff03e4', 'Mesin Water Boiler', 'MKS-D30', '2540000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3864-49e1-86f3-66e0d3617167', 'Dough Mixer', 'MKS-DIMX002', '3650000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3905-47dc-b49a-fa81feffc93e', 'Mesin Cetak Mie', 'MKS-220SS', '3390000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3990-4fd4-9913-085c5b8e7042', 'Mesin Penutup Botol Manual', 'MKS-BT31', '2740000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3a18-40ba-bb87-90a2ecb3af2d', 'Hand Sealer', 'FS-600', '1290000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3a9a-48d3-95dd-2627e86fe308', 'Mesin Cup Sealer', 'CPS-9A', '1710000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3b18-430e-b3a1-1c109a193ba7', 'Mesin Sosis Telur (Listrik)', 'MKS-ERG005', '3140000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3b94-4942-a30a-faabe598c54a', 'Mesin Ice Crusher', 'MKS-003', '1730000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3c11-44d0-a518-83487a51387a', 'Mesin Sosis Telur (Gas)', 'MKS-ERG007', '3420000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3c8e-40d1-938c-6a9674b9d134', 'Mesin Tetas Telur', 'AGR-TT24', '2010000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3d0b-4dc3-8c68-761e593e21a8', 'Mesin Tetas Telur', 'AGR-TT24A', '1970000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3d8b-4b67-986c-999f408019f7', 'Mesin Tetas Telur', 'AGR-TT96', '2350000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3e11-477e-b44e-ba2d9a388fe2', 'Mesin Filling Cairan Otomatis', 'MSP-F50', '2180000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3e9c-4805-8dc0-c83de629ce44', 'Rok Espresso', 'Rok Espresso', '3580000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3f2b-491e-b22a-bed96b604550', 'Mesin Standing Mixer', 'MKS-MIX130', '3340000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-3fa8-46ae-a524-8ae6fb5ee7ef', 'Mesin Vacum Sealer', 'ARD-VS02', '1190000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-402c-40e7-a310-1bb8fcb612bc', 'Mesin Hand Sealer', 'MSP-400I', '880000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-40aa-4b08-afeb-aaacfeaa089e', 'Mesin Cetak Pelet Manual', 'PLT-10', '2140000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4127-455e-95f2-07592fe5fdf7', 'Mesin Penepung Herbal, biji', 'MKS-ML300', '1870000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-41a4-400a-ae53-7de29f459e5c', 'Mesin Grinder Kopi', 'GRD-80A', '3850000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4221-4292-ad51-be3264ce7f23', 'Mesin Kebab', 'MKS-KB01', '2600000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-429e-486a-8d84-01ceb4259338', 'Mesin Coklat Fountain', 'MKS-CC6', '6000000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4319-45cb-be34-c61b2b321cfa', 'Food Dryer', 'MKS-DR6', '2710000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4397-435c-b377-f7d93284f942', 'Deep Fryer', 'MKS-82B', '2360000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-442b-42e2-926a-fa7043d086c1', 'Alat Penanam Biji-Bijian', 'ARD-SED01', '730000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-44b6-414b-bf78-6cf607191750', 'Alat Penanam Biji-Bijian', 'ARD-SED02', '830000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4541-4af4-848d-9be042a08725', 'Mesin Bread Maker', 'ARD-BM66X', '2170000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-45cd-4936-b46e-c39ba34e3de2', 'Mesin Tetas Telur', 'AGR-TT56', '2660000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-464c-49db-a05e-a030b88a525e', 'Blender Komersial', 'MKS-BL10L', '3250000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-46c8-4b75-b1e6-c468624a24c2', 'Bread Toaster', 'MKS-D04', '1300000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4744-465a-bb5b-66ffc9742022', 'Deep Fryer', 'MKS-51B', '1950000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-47c1-460e-8e19-e1654bba6fa3', 'Deep Fryer', 'MKS-81', '800000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-483e-4579-9476-dfadf51d31eb', 'Deep Fryer', 'MKS-82', '1550000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-48bb-420b-ae54-aa8e7bb5b7bc', 'Food Dryer', 'MKS-DR10', '4590000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4938-4805-860e-a5744814a750', 'Deep Fryer', 'MKS-G20L +Keranjang', '4750000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-49b5-4ab7-8daf-bb5d9e144a4e', 'Mesin Manual Meat Mixer', 'MKS-MM01', '2830000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4a33-44e2-9210-4fac33c5726c', 'Mesin Ice Tube', 'MKS-IM22', '3270000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4ab0-48c9-ab41-a4ca2fe04278', 'Mesin Takoyaki Gas', 'MKS-722B', '2120000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4b2e-4c28-946d-2ffb232d4e99', 'Ice Cream Buah', 'ICE-01', '540000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4bb7-4c27-a457-276ef6f0889c', 'Oven Listrik', 'ARD-E033', '1380000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4c5c-4fa7-9cfc-0bbec1de6502', 'Noodle Maker', 'ARD-NM4', '2000000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4ce1-4a64-8272-61b08a1a0d75', 'Mesin Egg Roll', 'MKS-ERG005', '3140000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4d5d-42d8-9475-15cbc8376bb2', 'Stand Mixer', 'ARD-MR7', '6100000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4dda-4ce3-ac74-1f5971ba815f', 'Pemasak', 'KTl-DBL2', '330000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4e58-4106-9cea-efca01afb316', 'Deep Fryer', 'MKS-G20L', '4500000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4ed4-47af-9246-177521878576', 'Pemanggang', 'ARD-GRL88', '530000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4f51-416f-8ada-b0ef74c61486', 'Mesin Pembuat Kulit Pangsit', 'MKS-TRT11', '7230000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-4fcd-40ad-9619-84c0e99f545e', 'Mesin Food Dehydrator', 'ARD-PM99', '820000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5050-41bd-a744-af2ebba86fdc', 'Mesin Giling Daging', 'MHW-G31B', '960000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-50cc-4473-8826-74ab886e01a8', 'Cup Sealer', 'CPS-10A', '4980000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5147-4ada-b66e-f3599304230a', 'Mesin Cetak Mie', 'MKS-150B', '1010000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-51c5-44ca-9354-852a3f3ff6b7', 'Mesin Ice Crusher', 'MKS-CRS20', '1100000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5257-46a4-a162-f87c4d5f5d54', 'Penetas Telur', 'AGR-TT32', '2170000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-52f6-45fc-8945-2350a3d3993c', 'Mesin Mixer Dodol', 'MDL-10', '14400000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5377-4b43-a9ad-fb334a680829', 'Mesin Pemarut Kelapa', 'PRT-50', '2540000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-53f5-4c76-a1c4-74f0c2b1f6d1', 'Mesin Pemeras Santan', 'PS-15', '4280000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5473-43c4-8433-49ec73b46ef1', 'Mesin Food Dehidrator', 'MKS-DR10', '4590000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-54f0-4823-b26e-6144d1c54fbc', 'Mesin Perajang 3 Bentuk', 'MKS-PRJ33', '2630000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-556d-4fd7-b76f-df3105054536', 'Mesin Cetak Mie', 'MKS-CM180', '2020000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-55ea-4ff8-aebd-f42f97e2302f', 'Mesin Cetak Mie Stainless', 'MKS-160SS', '4370000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-566d-4745-b66f-a288952f518a', 'Mesin Cetak Mie Stainless', 'MKS-240SS', '4010000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-56ec-4081-8093-ba58e87694f7', 'Mesin Cetak Mie', 'ARD-125', '1880000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-576b-43a9-baeb-64839c1cb224', 'Mesin Parut Kelapa', 'PRT-25', '340000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-57e7-4a84-b4d0-a8e9c7634277', 'Mesin Ice Tube', 'MKS-IM100', '26970000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5864-4bea-b8d6-9237a7063a5e', 'Mesin Sosis Telur (Listrik)', 'GRILLO-400', '1090000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-58f2-45a5-9021-097ec057293a', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS6', '2120000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-597b-44dd-a0e7-d65c08cf2f10', 'Mesin Sosis Telur (Gas)', 'MKS-ERG002', '2930000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-59f9-4a24-b78d-c139293ff84b', 'Mesin Sosis Telur (Gas)', 'MKS-ERG444', '1550000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5a77-40f1-aab6-1ae5165f1f72', 'Mesin Ice Crusher', 'MKS-CRS30', '1550000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5af4-4ed8-90f9-ddb8a84a1a21', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS10', '2570000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5b70-4658-8b91-baab174ff842', 'Mesin Es Krim Buah', 'ICE-01', '540000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5bec-43b8-aeed-a3972041f1b6', 'Mesin Giling Daging', 'MHW-G51B', '1110000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5c74-409c-a691-517701ef5a28', 'Mesin pencacah Bumbu Dapur', 'MKS-UV22', '1370000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5cfc-498d-a733-ec40bc999225', 'Mesin Penepung Herbal, biji', 'MKS-ML100', '790000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5d7a-495a-9583-d9edefd87824', 'Pemanggang 2 Tungku', 'MKS-111BBQ', '1010000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5df8-4b09-8680-41be050ea0aa', 'Deep Fryer', 'MKS-72', '2810000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5e74-4e69-ace6-9d6edf5ae1cb', 'Mesin Pemanggang Listrik', 'MKS-PG2', '1700000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db0d1c9-5ef0-41fd-9fb1-69b01499c7ab', 'Manual Meat Slicer', 'MKS-MSL66', '850000.00', '2024-12-10 10:46:34', '2024-12-10 10:46:34'),
('9db10eeb-506e-4abe-b08f-b35eb2af647a', 'Sparepart Baut Saringan Susu Kedalai SKD-100B', 'SKD-100B', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-5416-42be-a742-42cfc5e175d8', 'Sparepart Conveyor Pendek/Atas Pemipih Adonan MKS-DS88', 'MKS-DS88', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-5655-4256-991f-ec2c9d6f8d4a', 'Sparepart Conveyor Pemipih Adonan MKS-DS88', 'MKS-DS88', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-583e-476b-ae5b-1ff22635ebe6', 'Sparepart Moulding Ukuran 1 Cm Cetak Tablet MKS-TBL11', 'MKS-TBL11', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-5a6e-4717-818d-4d189824da1a', 'Sparepart PCB Tetas Telur AGR-TT96 Versi Lama', 'AGR-TT96', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-5cdd-49fb-805b-a413346fa914', 'Sparepart Pisau Penyerut Tusuk Sate Uk 4 mm ST-103 HS', 'ST-103', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-5e86-417e-8ddd-a7a70bd7d2e1', 'Sparepart Roda (Hidup) Per-PCS Pemipih Adonan MKS-DS88', 'MKS-DS88', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-602b-40a8-8a33-d264998d60ce', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-400', 'Grillo-400', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-6225-473e-979f-a82475786d53', 'Sparepart Sisir Cetak Mie MKS-220SS', 'MKS-220SS', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-63cc-4b20-8e36-e5bcf1e03366', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-GS10', 'Grillo-GS10', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-657a-407c-ab30-98e241f25502', 'Sparepart Heating Element MSP-300I', 'MSP-300I', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-6721-42a8-8cfc-58cfa54492b9', 'Sparepart Kain Teflon MSP-300i', 'MSP-300I', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-68e3-41f4-94d4-dc50da97e0b8', 'Sparepart Pisau 4mm Vegetable\nCutter MKS-CT100\n', 'MKS-CT100', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-6a86-4a4e-9eae-171405837a87', 'Sparepart  Keramik Humidifier Tetas Telur AGR TT360', 'AGR TT360', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-6c2c-488e-a910-66657da495fd', 'Sparepart Rak 1 Set Tetas Telur AGR-TT360', 'AGR TT360', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-6dea-4214-bb91-748f6428a755', 'Sparepart Screw Giling Daging \nMHW-120\n', 'MHW-120', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-6fa8-4679-8024-a69447190ea6', 'Sparepart Penjepit Cetak Bakso MKS-MFC280', 'MKS-MFC280', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-714d-47f8-9e59-ba826c0f52bb', 'Sparepart Ring Cup Sealer Uk. 88mm 10-16 Oz CPS-959', 'CPS-959', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-72f3-4e2f-9b00-ba8245f19a17', 'Sparepat Per Cetak Bakso MKS-MFC280', 'MKS-MFC280', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-74cb-4f12-8ee3-ee7206d549c5', 'Baut pengunci kecil cetak mie', 'CM-123', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-7687-4d2e-ae79-b18a71053cb3', 'Sparepart penutup bawah eggroll ERG-001,ARD-202,ARD-404', 'ERG-001,ARD-202,ARD-404', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-7832-4f61-b1bd-c4b3e1aa54b5', 'Sparepart Ring moulding Uk.66mm 8 oz CPS-959', 'CPS-959', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-79db-4fcd-85e5-902c4cd428fc', 'PCB KZB-1', 'KZB-1', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-7bb6-4d6b-86ce-fd193946bac3', 'Sparepart corong atas perajang rumput AGR-CH400B', 'AGR-CH400B', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-7d63-4203-bd3a-cb4d7177ee79', 'Pisau penyerut mesin giling daging MHW-G51B/Kecil', 'MHW-G51B/Kecil', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-7f0c-4d8d-b472-fbb85c2ef7ca', 'Sparepart Tray Food Dehidrator ARD-PM99', 'ARD-PM99', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-80c3-4064-9104-afe5bcace912', 'Sparepart Pully Kecil Cetak Mie MKS-220SS', 'MKS-220SS', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-828d-4497-94b6-385802ca75e4', 'Sparepart Tombol Emergency Mixer Planetary MKS-20B/30B', 'MKS-20B/30B', '0.00', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10f99-75fa-44b7-8bd2-e33fb60e7815', 'Sparepart Termostat Cup Sealer Manual', 'CPS-919, CPS-818,CPS-959', '110000.00', '2024-12-10 13:39:24', '2024-12-10 13:39:24'),
('9db11005-7583-43f7-9e9b-5751d0f1b4d1', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', '100000.00', '2024-12-10 13:40:35', '2024-12-10 13:40:35'),
('9db11069-9f9c-49f6-ac10-99900d54e76d', 'Sparepart Bearing 6205', 'ALL-Type', '80000.00', '2024-12-10 13:41:41', '2024-12-10 13:56:48'),
('9db110af-a460-4606-b764-0379f3b75330', 'Sparepart Tombol ON/OFF Rotating Waffle Maker', 'MKS-RTW01', '10000.00', '2024-12-10 13:42:27', '2024-12-10 13:42:27'),
('9db110de-9ea1-4be5-9f44-40bddc2bdf09', 'Alat Pemotong & Penusuk Daging Sate', 'MKS-089', '500000.00', '2024-12-10 13:42:57', '2024-12-10 13:42:57'),
('9db11105-c9e8-412d-b229-d1b445c48416', 'Sparepart Karet Seal Double Soft Ice Cream', 'ISC-16/ISC-16S', '80000.00', '2024-12-10 13:43:23', '2024-12-10 13:43:23'),
('9db11158-56ae-423f-8a44-5ffb5d0b39c5', 'Mesin Pengupas Kelapa Manual', 'MKS-KLP01', '2980000.00', '2024-12-10 13:44:17', '2024-12-10 13:44:17'),
('9db11192-4b94-4284-a368-9a0bfab7db85', 'Sparepart Kabel Eterna NYY HYO 2x0.75 Mixer Spiral', 'MKS-SP20', '20000.00', '2024-12-10 13:44:55', '2024-12-10 13:45:26'),
('9db1120c-6783-4f96-ad0f-b655eea26f47', 'Sparepart kabel HYO 2x0.75 Mixer Spiral', 'MKS-SP20', '20000.00', '2024-12-10 13:46:15', '2024-12-10 13:46:15'),
('9db11263-2d95-4474-a4e0-86712b64b4f9', 'Sparepart Kapasitor 200 UF/250 VAC Mixer Spiral', 'MKS-SP20', '190000.00', '2024-12-10 13:47:12', '2024-12-10 13:47:12'),
('9db112ae-a993-4be0-b8c3-94854eb33ec5', 'Sparepart Kapasitor 30 UF/450VAC Mixer  Spiral', 'MKS-SP20', '170000.00', '2024-12-10 13:48:02', '2024-12-10 13:48:02'),
('9db11340-423c-4f99-8b83-1b6938811e94', 'Sparepart Heater Lurus Roti Tortila', 'MKS-TRT44', '65000.00', '2024-12-10 13:49:37', '2024-12-10 13:49:37'),
('9db1139b-bf9b-4640-9cc4-2e880a10099a', 'Sparepart Heater U Roti Tortila', 'MKS-TRT44', '92500.00', '2024-12-10 13:50:37', '2024-12-10 13:50:37'),
('9db113e5-d66f-44c2-b44d-c42a8aed8c6a', 'Mesin Juice Extractor', 'MKS-MK3000', '4760000.00', '2024-12-10 13:51:26', '2024-12-10 13:51:26'),
('9db1143a-5685-4962-9534-50b99dcb46d1', 'Mesin Cetak Pelet', 'AGR-PLT15', '3340000.00', '2024-12-10 13:52:21', '2024-12-10 13:52:21'),
('9db1146d-d24f-4bae-9901-ee4b786a5927', 'Mesin Gas Noodle Cooker', 'MKS-PC6', '4760000.00', '2024-12-10 13:52:55', '2024-12-10 13:52:55'),
('9db114b2-7651-425a-87f0-643f2bc49738', 'Mesin Vacum Frying', 'PV-10', '33290000.00', '2024-12-10 13:53:40', '2024-12-10 13:53:40'),
('9db11526-0199-44d4-9182-badf3286e3ba', 'Sparepart Kabel Anti Panas Cone Baker', 'MKS-CIC21', '10000.00', '2024-12-10 13:54:55', '2024-12-10 13:54:55'),
('9db1156f-c7db-42da-a125-23b456716da3', 'Sparepart Selongsong Anti Panas Pemanggang Ayam', 'GRILL-GR6', '10000.00', '2024-12-10 13:55:44', '2024-12-10 13:55:44'),
('9db115bf-fbe9-4a00-812f-2c96c7a74186', 'Sparepart Bearing 6204', 'ALL-Type', '110000.00', '2024-12-10 13:56:36', '2024-12-10 13:56:36'),
('9db11627-256d-4d1a-acb0-b766200c7ce2', 'Sparepart Seal Oli 20.35.7 Blender Buah', 'MKS-BLD99', '130000.00', '2024-12-10 13:57:44', '2024-12-10 13:57:44'),
('9db123b1-4d94-4614-90b9-cb4ddac5e6f4', 'Sparepart Gear Hidrolik Cetak Sosis Manual', 'MKS-3V,MKS-5V,MKS-7V,MKS-10V', '260000.00', '2024-12-10 14:35:35', '2024-12-10 14:35:35'),
('9db127b9-7ec3-4d9d-9074-6b095b6bee6e', 'Sparepart Pully Kecil Cetak Mie', 'MKS-200,MKS-160,MKS-220SS,MKS-240SS', '60000.00', '2024-12-10 14:46:52', '2024-12-10 14:51:10'),
('9db149e4-57e8-44bf-b2bf-eadc88ee3786', 'Sparepart Gear Kecil Besi 2 cm Cetak Mie', 'MKS-145', '0.00', '2024-12-10 16:22:24', '2024-12-10 16:22:24');

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
('9db11c58-536d-4263-970c-940b199b4a3c', '9db11c58-4e95-42e4-9f29-7e1ed94563f4', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-08-28', 'SI.2024.08.00029', 'Bpk.Aria', '081325256325', 'Beringin Eddy - Riau', '601018004', 'Cup Sealer', 'CPS-959', 1, 'Rak-4', '2024-12-10 14:15:03', '2024-12-10 14:15:03'),
('9db11d29-9764-4ac0-8806-76d5f5391c58', '9db11d29-9316-4dfe-8377-b15e0a4de931', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-08-28', 'SI.2024.08.00030', 'Ibu.Ajar', '081364290613', 'Sungai Pinang - Riau', '601018004', 'Cup Sealer', 'CPS-959', 1, 'Rak-4', '2024-12-10 14:17:20', '2024-12-10 14:17:20'),
('9db11ff1-e866-40b4-8921-abc49429dc5e', '9db11ff1-e439-4deb-bba5-4f16276644e7', '9db11005-7583-43f7-9e9b-5751d0f1b4d1', '2024-08-30', 'SO.2024.08.00031', 'Ibu.Diana Sartika', '085262370667', 'Jl.Siak 2 Palas , Pekanbaru - Riau', '102229057', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 1, 'Kasir', '2024-12-10 14:25:07', '2024-12-10 14:25:07'),
('9db12077-cbb4-435e-a332-ba7264cc0b66', '9db12077-c819-4c49-8638-5f262cbe2300', '9db11069-9f9c-49f6-ac10-99900d54e76d', '2024-08-30', 'SI.2024.08.00031', 'Ibu.Diana Sartika', '085262370667', 'Jl.Siak 2 Palas , Pekanbaru - Riau', '102263010', 'Sparepart Bearing 6205', 'ALL-Type', 1, 'Kasir', '2024-12-10 14:26:34', '2024-12-10 14:26:34'),
('9db121aa-40d3-41ed-a340-fe04645ec5c7', '9db121aa-3c26-4e75-99a2-139754d22a8b', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-09-04', 'SI.2024.09.00002', 'Bpk.Roy Putra', '085265802234', 'Jl.Lintas Timur KM-19  - Riau', '601018004', 'Cup Sealer', 'CPS-959', 1, 'Rak-4', '2024-12-10 14:29:55', '2024-12-10 14:29:55'),
('9db1265c-9936-4bef-a881-668973a50ec5', '9db1265c-943a-4c22-881c-4c5a7f6e0be1', '9db123b1-4d94-4614-90b9-cb4ddac5e6f4', '2024-09-04', 'SI.2024.09.00003', 'Bpk.Darliansyah', '08126814341', 'Jl.Cipta Karya Perum Villa - Pekanbaru - Riau', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual', 'MKS-3V,MKS-5V,MKS-7V,MKS-10V', 1, 'Kasir', '2024-12-10 14:43:03', '2024-12-10 14:43:03'),
('9db12ad0-58c4-434c-8ba3-fe6977baa326', '9db12ad0-5461-44ea-985a-7bcaa87cb588', '9db127b9-7ec3-4d9d-9074-6b095b6bee6e', '2024-09-04', 'SI.2024.08.00023', 'Bpk.Indra Mahira', '082173214448', 'Jl.Tanjung Pati Sari Lamak Payakumbuh Sumatra Barat', '102226097', 'Sparepart Pully Kecil Cetak Mie', 'MKS-200,MKS-160,MKS-220SS,MKS-240SS', 1, 'Kasir', '2024-12-10 14:55:30', '2024-12-10 14:55:30'),
('9db12cca-628e-45db-b02d-82b515694398', '9db12cca-5e43-4057-a2bb-c1210c346f11', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-09-05', 'SI.2024.09.2024', 'Ibu.Rita Agustina', '085182067297', 'Jl.Kruing No.450, Pekanbaru - Riau', '601018004', 'Cup Sealer', 'CPS-959', 1, 'Rak-4', '2024-12-10 15:01:02', '2024-12-10 15:01:02'),
('9db13368-2fea-431c-ac35-5ceb9aa4e92b', '9db13368-2b9a-4046-9158-859a977fdad8', '9db10f99-75fa-44b7-8bd2-e33fb60e7815', '2024-09-06', 'SO.2024.09.00003', 'Bpk.Aria', '081325256325', 'Beringin Eddy - Pekanbaru - Riau', '302052003', 'Sparepart Termostat Cup Sealer Manual', 'CPS-919, CPS-818,CPS-959', 1, 'Kasir', '2024-12-10 15:19:32', '2024-12-10 15:19:32');

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
('9db12440-5225-43cd-a4a8-8a8fbe546607', '9db123b1-4d94-4614-90b9-cb4ddac5e6f4', '2024-09-04', 'DO.2024.08.00331', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual', 'MKS-3V,MKS-5V,MKS-7V,MKS-10V', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Bpk. Darliansyah', '2024-12-10 14:37:09', '2024-12-10 14:37:09'),
('9db14dff-eec7-4479-b571-9f5d0b11a3ae', '9db149e4-57e8-44bf-b2bf-eadc88ee3786', '2024-09-07', 'DO.2024.09.00009', '102226052', 'Sparepart Gear Kecil Besi 2 cm Cetak Mie', 'MKS-145', 'Gudang Pusat', 8, 'Kasir', 'stok', '-', '2024-12-10 16:33:53', '2024-12-10 16:33:53'),
('9db14ebc-f815-49a8-b83a-e1a8b013feb4', '9db0d1c8-e6d6-4dbf-a7a0-8e78c2d4dd36', '2024-09-07', 'DO.2024.09.00009', '601006004', 'Mesin Cetak Mie', 'MKS-140', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Ibu Lili Nopita Sari', '2024-12-10 16:35:57', '2024-12-10 16:35:57'),
('9db14f50-84f1-4028-bc1c-f956ab9be8c1', '9db0d1c8-fa5f-4cdf-8bd2-6934783ad5d1', '2024-09-07', 'DO.2024.09.00009', '601019016', 'Mesin Gas Deep Fryer', 'MKS-72', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Bpk. Yosse Rizal', '2024-12-10 16:37:34', '2024-12-10 16:37:34'),
('9db14fd8-33b7-48c7-bee0-76c6715ca016', '9db11105-c9e8-412d-b229-d1b445c48416', '2024-09-07', 'DO.2024.09.00009', '102238213', 'Sparepart Karet Seal Double Soft Ice Cream', 'ISC-16/ISC-16S', 'Gudang Pusat', 1, 'Kasir', 'customer', 'Ibu Riski Andini Septiyani', '2024-12-10 16:39:03', '2024-12-10 16:39:03');

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
('9db0d1df-70b7-45b5-b594-b7d2537b1e48', '9db0d1c9-1dca-427b-917a-4cae88a73e5c', '2024-08-28', 'Mesin Penggiling Kopi', 'MKS-600B', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-7390-4b09-b29e-040f7ab8ff8c', '9db0d1c8-ffff-4167-b027-5cc20a4c89f6', '2024-08-28', 'Ice Crusher', 'MKS-002', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-7567-4d11-8be5-8393005a6633', '9db0d1c9-4b2e-4c28-946d-2ffb232d4e99', '2024-08-28', 'Ice Cream Buah', 'ICE-01', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-773e-4ef6-8f4a-12e733fe1569', '9db0d1c9-1867-4c17-b053-fe3f227c8260', '2024-08-28', 'Chopper', 'ARD-FC200', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-7922-4ead-884d-cbdb7fa3dcff', '9db0d1c9-17d2-42db-a153-d7f3ef4e600b', '2024-08-28', 'Chopper', 'ARD-FC300', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-7af6-4782-8eba-7a9f1c651e45', '9db0d1c9-4bb7-4c27-a457-276ef6f0889c', '2024-08-28', 'Oven Listrik ', 'ARD-E033', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-7ce5-4c16-8902-4c7404c2632d', '9db0d1c9-1b58-493e-985f-e296589aebc5', '2024-08-28', 'Alat Cetak Long Potato', 'MKS-MER2', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-7eab-4285-b63b-035037000d7b', '9db0d1c9-20a4-479b-921c-04419bd390c9', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG444', 0, 0, 2, 2, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-80ac-4b11-9b31-d2e1bc2f7dae', '9db0d1c9-0b6a-46f8-8ed8-a294e2357e06', '2024-08-28', 'Bread Maker', 'ARD-BM55X', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-8291-4797-89cb-3fa46192d504', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-08-28', 'Cup Sealer', 'CPS-959', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-8477-4c8a-b0ff-fdd66ee067ee', '9db0d1c9-1bd5-45db-ac64-9a1513c5303f', '2024-08-28', 'Alat Cetak Sate Telur Puyuh', 'ARD-TKY16', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-8673-4ffd-abba-16bfa5af3ed9', '9db0d1c8-f259-442f-af94-039ecca1f362', '2024-08-28', 'Mesin Pemanggang', 'MKS-111BBQ', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-8851-4422-ac2a-3cbff97f7373', '9db0d1c9-4c5c-4fa7-9cfc-0bbec1de6502', '2024-08-28', 'Noodle Maker', 'ARD-NM4', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-8a13-4b11-9ac4-9b815aeae236', '9db0d1c8-f591-4336-a491-f8f4256048a2', '2024-08-28', 'Mesin Pemanggang', 'MKS-222BBQ', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-8bd5-4d4e-9156-84adb1639c8b', '9db0d1c8-f7d1-454e-87cf-1d534671058d', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG001', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-8ddd-4fad-8b3a-7bb6e87babd8', '9db0d1c9-4ce1-4a64-8272-61b08a1a0d75', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG005', 0, 0, 1, 1, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-8fbc-49eb-98d1-ec3908677953', '9db0d1c9-4d5d-42d8-9475-15cbc8376bb2', '2024-08-28', 'Stand Mixer', 'ARD-MR7', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-9188-47c9-90f8-41c5d367fe4e', '9db0d1c9-1f2f-4023-b3d1-f791f537e83e', '2024-08-28', 'Mesin Pembuat Sosis Telur', 'MKS-ERG002', 0, 0, 0, 0, 'Promo-Lt1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-9370-4ebd-ba65-410e06d2d21b', '9db0d1c9-0adc-4b4f-9318-56ac30771412', '2024-08-28', 'Oven Listrik', 'ARD-EO33', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-962d-4537-bfee-d71d4becc6d6', '9db0d1c9-0b6a-46f8-8ed8-a294e2357e06', '2024-08-28', 'Bread Maker', 'ARD-BM55X', 0, 0, 3, 3, 'Rak-1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-97fb-4342-a3d6-9a24e83aa5ec', '9db0d1c9-0bf3-4b47-ab2e-c95caf71d3d7', '2024-08-28', 'Ice Crusher', 'MKS-CRS30L', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-99e4-4cac-b7cf-fc2cbfb66915', '9db0d1c9-0c77-4c84-97e6-dac5d33db673', '2024-08-28', 'Timbangan Digital', 'TBG-3', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-9bc8-467f-b6c1-7af7ae2432b4', '9db0d1c9-0cf4-4a98-b2d0-ef9ac36070af', '2024-08-28', 'Timbangan Digital', 'TBG-1', 0, 0, 6, 6, 'Rak-1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-9d8f-4e55-8716-31d1a3b1ff8a', '9db0d1c9-0d6f-4c3b-9ce7-9a4aafa54efe', '2024-08-28', 'Timbangan Digital', 'TBG-5', 0, 0, 5, 5, 'Rak-1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-9f50-4d24-873f-c18aaac26839', '9db0d1c9-0dec-415a-8dcb-596f7d644c24', '2024-08-28', 'Timbangan Digital', 'TBG-10', 0, 0, 5, 5, 'Rak-1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-a16a-4431-b2d1-99f5e9cb293e', '9db0d1c9-0e69-4868-9599-c87a445757b1', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-404', 0, 0, 10, 10, 'Rak-1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-a336-43be-a9ef-d6a904983b77', '9db0d1c9-0eee-4328-90d7-9f6db2e39927', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-202', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-a4f9-4f40-b3f3-9af69a42f25d', '9db0d1c9-0f69-4989-a4ed-3524d147057a', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-303', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-10 10:46:48', '2024-12-10 10:46:48'),
('9db0d1df-a6dd-45f6-9537-d3e68c17c62c', '9db0d1c9-0fe5-4445-8204-ae9576f3ae28', '2024-08-28', 'Cetak Sosis Telur Listrik', 'ARD-505', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-a8b4-4c28-aecf-a67f98dfe5b7', '9db0d1c9-1061-4d8d-a0f3-5edcc28f8756', '2024-08-28', 'Cetak Sosis Telur Listrik', 'GRILLO-400', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-aa7e-49ad-a901-452156a20741', '9db0d1c9-4dda-4ce3-ac74-1f5971ba815f', '2024-08-28', 'Pemasak', 'KTl-DBL2', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-ac40-4f12-8e57-8c8df83d6ae3', '9db0d1c9-10fc-4a45-ac9b-313fc194bc67', '2024-08-28', 'Blender', 'MKS-BLD 1,5L', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-ae2f-414b-9ed8-b4d656fd6f25', '9db0d1c9-11ac-47b6-9c46-f600f6862ecd', '2024-08-28', 'Pemanas Air ', 'BT-119', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-aff8-4ca0-b773-5b8e3ad92ebf', '9db0d1c9-1237-4334-8418-36dbb395c097', '2024-08-28', 'Peras Jeruk', 'ARD-J22', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-b1bd-4703-91d1-1dceea8a4086', '9db0d1c9-12b5-4604-bf4d-db1ad98f88ec', '2024-08-28', 'Ice Krim Buah', 'ICE-01', 0, 0, 3, 3, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-b380-457d-a672-3687cf672df6', '9db0d1c9-1330-4953-ab9b-97c6af645d1e', '2024-08-28', 'Long Potato', 'MKS-LPCT50', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-b5a5-4d14-b69c-b138eb613e2c', '9db0d1c9-13ac-497b-a0f8-e74aacf168de', '2024-08-28', 'Giling Daging', 'MHW-G31B', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-b779-44fa-8558-ee5a7bf3dc48', '9db0d1c9-142a-446a-a98d-314066524b88', '2024-08-28', 'Giling Daging', 'MHW-G51B', 0, 0, 0, 0, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-b93f-402d-99cb-9ec9cf34ce72', '9db0d1c9-14a7-4abc-af0d-7ecfc203164a', '2024-08-28', 'Mangkok', 'ICE BARREL', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-bb79-482f-9a31-e81cd7e1f1aa', '9db0d1c9-4e58-4106-9cea-efca01afb316', '2024-08-28', 'Deep Fryer', 'MKS-G20L', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-bd42-45d2-8d26-dc1f6040b756', '9db0d1c9-152d-4f99-b9a7-b9d62af47f91', '2024-08-28', 'Display Warmer', 'MKS-DW66', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-bf05-4262-9a58-d03087a922f9', '9db0d1c9-15aa-4ea8-abed-306427809890', '2024-08-28', 'Lafira', 'LAFIRA', 0, 0, 1, 1, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-c0e5-4b99-8cb8-e5b2721652f2', '9db0d1c9-1626-499f-a8b0-316b23536cc3', '2024-08-28', 'Pemotong keripik tempe ', 'MKS-JT04', 0, 0, 2, 2, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-c2c2-44a6-9a05-c347c7ed5d0e', '9db0d1c9-16a1-41eb-a8d8-7c1238a27b2f', '2024-08-28', 'Mesin Gelas Kesehatan ', 'ARD-CP5', 0, 0, 4, 4, 'Rak-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-c487-4fe1-8dfe-aa611aece0ad', '9db0d1c9-171f-482f-a047-f6532407d6ee', '2024-08-28', 'Ice Crusher', 'MKS-CRS20', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-c658-48a9-b93f-ca1a2c8f0bc1', '9db0d1c8-ffff-4167-b027-5cc20a4c89f6', '2024-08-28', 'Ice Crusher', 'MKS-002', 0, 0, 0, 0, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-c87b-4cba-9e89-78a800649cc1', '9db0d1c9-17d2-42db-a153-d7f3ef4e600b', '2024-08-28', 'Chopper', 'ARD-FC300', 0, 0, 0, 0, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-ca54-4116-9e02-32c2ffe425e0', '9db0d1c9-1867-4c17-b053-fe3f227c8260', '2024-08-28', 'Chopper', 'ARD-FC200', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-cc1b-408d-9507-50f7966041a5', '9db0d1c9-18e7-4a50-955f-7818d4068d24', '2024-08-28', 'Pemanggang', 'ARD-GRL77', 0, 0, 2, 2, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-cdfa-445a-8d8e-e33a18adf8a2', '9db0d1c9-1963-4d59-bba6-2a8690f075d2', '2024-08-28', 'Kentang Spiral', 'TP-200', 0, 0, 5, 5, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-cfe8-425a-8f7c-1baf4f0dc80d', '9db0d1c9-19e1-44ec-8cb9-f1595b015a6c', '2024-08-28', 'Alat Pengiris Kentang Spiral', 'MKS-PSS44', 0, 0, 2, 2, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-d3da-471e-b247-1d82540358e0', '9db0d1c9-1a5e-4a81-a7b4-6c40502fa0f8', '2024-08-28', 'Alat Pengiris Apel', 'MKS-APL88', 0, 0, 5, 5, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-d5eb-455a-bad1-2cf7c79c9adb', '9db0d1c9-1ada-4ab1-bb30-a2617426512d', '2024-08-28', 'Alat Cetak Long Potato', 'MKS-LPCT30', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-d7c7-4959-b80a-7b0a2591730a', '9db0d1c9-1b58-493e-985f-e296589aebc5', '2024-08-28', 'Alat Cetak Long Potato', 'MKS-MER2', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-d9a4-4ed4-aa7e-fe23dcd457bb', '9db0d1c9-1bd5-45db-ac64-9a1513c5303f', '2024-08-28', 'Alat Cetak Sate Telur Puyuh', 'ARD-TKY16', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-db96-4238-8790-2133df9f277f', '9db0d1c9-1c50-45a2-b99c-a2630de5d39d', '2024-08-28', 'Mesin penepung Herba, Farmasi dan biji', 'MKS-ML100', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-dd62-45c4-93d2-03c68c31ab30', '9db0d1c9-1ccd-4316-bd82-f6c48e2c5c41', '2024-08-28', 'Mesin Kopi Espresso', 'MKS-MKP50', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-df25-4687-8e13-ef2a969b3912', '9db0d1c9-1d4a-4195-9a65-893fbcee3f5f', '2024-08-28', 'Mesin Grinder kopi', 'MKS-GRD80A', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-e0ee-4876-9de7-3cebb6807013', '9db0d1c9-3e9c-4805-8dc0-c83de629ce44', '2024-08-28', 'Rok Espresso', 'ROK ESPRESSO', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-e2e6-40fa-8ec2-bf54c3472c3b', '9db0d1c9-1dca-427b-917a-4cae88a73e5c', '2024-08-28', 'Mesin Penggiling Kopi', 'MKS-600B', 0, 0, 3, 3, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-e4af-438a-a97b-02f44c7c1bd7', '9db0d1c9-1ea2-4093-b54d-e98905f1f449', '2024-08-28', 'Mesin Deep Fryer Gas', 'MKS-71', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-e688-4552-bb35-c6cabf9a8b59', '9db0d1c9-1f2f-4023-b3d1-f791f537e83e', '2024-08-28', 'Mesin Pembuat Sosis Telur', 'MKS-ERG002', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-e882-43cc-8b07-a7be46423b9c', '9db0d1c9-1fac-4f01-9bec-d9b49b7b2e33', '2024-08-28', 'Mesin Egg Roll', 'GRILLO-GS10', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-ea56-4793-9d01-1ec42471bccd', '9db0d1c9-2028-494d-8481-65adba7eb325', '2024-08-28', 'Mesin Egg Roll', 'GRILLO-GS6', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-ec3b-4623-9f63-6ed30ed5ccb3', '9db0d1c9-20a4-479b-921c-04419bd390c9', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG444', 0, 0, 0, 0, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-ee15-44c3-97e5-73bc985a71ce', '9db0d1c8-f7d1-454e-87cf-1d534671058d', '2024-08-28', 'Mesin Egg Roll', 'MKS-ERG001', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-f020-4424-986e-7214236df925', '9db0d1c9-4fcd-40ad-9619-84c0e99f545e', '2024-08-28', 'Mesin Food Dehydrator', 'ARD-PM99', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-f1ef-4ac4-bf49-f5d07fb354b7', '9db0d1c9-2124-43db-987e-41fb6b941194', '2024-08-28', 'Alat Manual Meat Slicer', 'MKS-MSl66', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-f3bf-487e-8155-c571239dd6b7', '9db0d1c9-21ab-4a96-b099-2890a9ec9773', '2024-08-28', 'Mesin Cetakan Donat', 'MKS-DN60', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-f5b7-492e-b7a7-57c375fd0c45', '9db0d1c9-222a-4171-8fff-eddccfe94289', '2024-08-28', 'Mesin Hot Dog Wafel', 'MKS-HDW6', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-f783-41d1-a5fa-9ee84451aa35', '9db0d1c9-22e1-462e-8368-134cbbfe8810', '2024-08-28', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-f952-40f5-b96d-6d860f579a4c', '9db0d1c9-2364-436f-8cc2-72376a9f4275', '2024-08-28', 'Mesin Takoyaki Listrik', 'MKS-700E', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-fb1b-430d-af2c-5fd3817db3ff', '9db0d1c9-23e0-4f85-a1a8-a5ffae12a728', '2024-08-28', 'Mesin Waffle Taiyako', 'MKS-ETYK3', 0, 0, 1, 1, 'Rak-2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-fd01-45f5-8fe2-865c052f1b4f', '9db0d1c9-2472-41e8-9f57-fdfd7931ddb9', '2024-08-28', 'Mesin Perajang Sayur dan Buah', 'MKS-VGT65', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1df-fed2-4814-9ca4-c6ae3f4168bd', '9db0d1c9-2510-4357-97ed-49305b7a82f8', '2024-08-28', 'Mesin Slot Toaster', 'MKS-D06', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-009e-4a2c-b83b-3037ff114cc6', '9db0d1c9-258e-4821-9b80-27c13e0b506f', '2024-08-28', 'Cetak Mie dan Pasta', 'ARD-NM4', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-02a3-4bac-92d5-d27efe5ac003', '9db0d1c9-5050-41bd-a744-af2ebba86fdc', '2024-08-28', 'Mesin Giling Daging', 'MHW-G31B', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-0479-4bc9-b2de-9bfedf231ed0', '9db0d1c9-2609-4446-96b8-9c2d1af27aa3', '2024-08-28', 'Mesin Hand Sealer', 'MSP-400A', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-0648-4ac9-bed9-2521560f5454', '9db0d1c9-2686-4a5a-9996-691439b1593c', '2024-08-28', 'Mesin Hand Sealer', 'MSP-300A', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-0813-4b4e-bb11-d8da2e500fb4', '9db0d1c9-2702-4b3f-9287-44cdd24dd891', '2024-08-28', 'Mesin Hand Sealer', 'MSP-200I', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-0a1d-4c5a-8737-9a358698cca8', '9db0d1c9-277d-4d8e-949c-ba2f77d5b9bf', '2024-08-28', 'Mesin Hand Sealer', 'MSP-200A', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-0bf1-40a5-abd8-ce6a7f815889', '9db0d1c9-27f9-42a1-aea2-bc2a8d68d78c', '2024-08-28', 'Mesin Hand Sealer', 'MSP-300i', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-0db9-4b19-911b-40e8b67f8b32', '9db0d1c9-2879-48bf-9d96-2a6167ab1ffd', '2024-08-28', 'Mesin Vacum Sealer', 'MSP-DZ280A', 0, 0, 5, 5, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-0fa3-4e31-afb1-ca422b1aa71b', '9db0d1c9-28f7-47bc-a2a4-4d12c569403f', '2024-08-28', 'Mesin Vacum Sealer', 'MSP-290E', 0, 0, 0, 0, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-1182-42e9-a16e-9ad8a693070e', '9db0d1c9-2974-404a-8717-ac51b2e2e2ee', '2024-08-28', 'Mesin Vacum Sealer ', 'MSP-VS02', 0, 0, 6, 6, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-1351-466c-949e-86b3515ddfcc', '9db0d1c9-29f0-4c3b-b8fb-e906f9728cb1', '2024-08-28', 'Mesin vakum food sealer', 'ARD-VC85', 0, 0, 5, 5, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-1518-46b4-aea8-68caf961bc6d', '9db0d1c9-2a6e-4d61-873c-b01906f6adb0', '2024-08-28', 'Mesin vakum sealer', 'ARD-VS01', 0, 0, 3, 3, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-1705-4504-84fa-08a2c88f769d', '9db0d1c9-2af6-410a-a750-737bb8993492', '2024-08-28', 'Mesin Hand Printer', 'HP-351', 0, 0, 3, 3, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-18d9-4882-a6d2-548c8ebe1164', '9db0d1c9-2b8a-48c8-94c4-984c1f2d39e4', '2024-08-28', 'Alat Cetak Sosis Horizontal', 'MKS-3V', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-1aa1-4573-8c4f-3a9a2ccf26cb', '9db0d1c9-2c08-45d8-aaa1-58970271bfa2', '2024-08-28', 'Alat Cetak Sosis Vertikal', 'MKS-3H', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-1ca4-4de8-b576-ecb06f8f72fd', '9db0d1c9-2c85-4c71-800d-399abdf195cd', '2024-08-28', 'Mesin Pengupas Bawang Putih', 'AGR-BWG180', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-1e9e-4ea2-832c-2d96f294a775', '9db0d1c9-2d01-4cc1-83a1-01007fac536a', '2024-08-28', 'Mesin Giling Daging', 'MHW-80', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-2067-46e4-b8ce-7af2b08c8dec', '9db0d1c9-2d7e-44f8-a44b-24c75388e9d9', '2024-08-28', 'Mesin Giling Daging', 'MHW-220', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-222e-4466-823b-410a2d4c7779', '9db0d1c9-2dfc-4768-8988-c9d9fe33109f', '2024-08-28', 'Mesin Pemanggang', 'MKS-PG4', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-2468-427f-9964-b4b642556106', '9db0d1c9-2e79-4907-aa69-6eb564185cf5', '2024-08-28', 'Mesin Pemanggang', 'MKS-PG2', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-266c-4430-883b-4f938dd0b066', '9db0d1c9-2ef7-4298-bf77-992ea18887a3', '2024-08-28', 'Mesin Egg Waffle Listrik', 'MKS-EW06', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-28b6-4496-9761-71cd7c05ca96', '9db0d1c9-2f73-45e1-84c8-563b2258658d', '2024-08-28', 'Mesin Egg Waffle Gas', 'MKS-GW07', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-2abd-450e-9e00-596b9ab14131', '9db0d1c9-2fef-44b1-a249-1a0ed8733f4b', '2024-08-28', 'Mesin Cone Bakar', 'MKS-CB1', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-2c8b-4d5f-af18-db51daa20d29', '9db0d1c9-306b-49a9-bbd7-e3995e1a7d27', '2024-08-28', 'Mesin Universal Fritter', 'MKS-UV22', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-2e4a-45ac-b4dc-4fd79ffa1250', '9db0d1c8-e3ff-4111-97db-ffdd56410428', '2024-08-28', 'Mesin Universal Fritter', 'MKS-UV44', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-3030-4d98-970e-9b741b7cfec2', '9db0d1c9-30e8-4e55-a293-f137c17a125d', '2024-08-28', 'Alat Perajang bawang manual', 'PRJ-BM', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-3203-441c-9fad-6c98399b3845', '9db0d1c9-3198-4ce8-b192-5f59b113de24', '2024-08-28', 'Alat Perajang singkong manual', 'PRJ-M', 0, 0, 2, 2, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-33cd-45c1-bab3-c5c22902a0d2', '9db0d1c9-3242-4b1a-8dd2-38c4e22896f8', '2024-08-28', 'Mesin Pembuat Gulali', 'MKS-CT76', 0, 0, 1, 1, 'Rak-3', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-3596-4839-a3a5-c28b1a8f1e0b', '9db0d1c9-32ce-4ace-968b-1fb1c9a06390', '2024-08-28', 'Cup Sealer', 'CPS-919', 0, 0, 0, 0, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-37b3-4e40-b78a-d4d08bcce9af', '9db0d1c9-334e-44b4-80d1-d7bc9a5cd880', '2024-08-28', 'Cup Sealer', 'CPS-818', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-398d-4d94-84b7-319820aa45a8', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-08-28', 'Cup Sealer', 'CPS-959', 0, 2, 4, 2, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 14:17:20'),
('9db0d1e0-3b5e-4e6c-969b-10da0138b15f', '9db0d1c9-33cc-41d7-9c8e-68956e88b138', '2024-08-28', 'Hand Sprayer (Semprotan)', 'SPR-16', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-3d77-4a13-a9d3-27342a1d3b68', '9db0d1c9-5147-4ada-b66e-f3599304230a', '2024-08-28', 'Mesin Cetak Mie', 'MKS-150B', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-3f4f-410d-b4eb-78b46c1be301', '9db0d1c9-344a-44b4-a88b-1cc2680ce449', '2024-08-28', 'Mesin Pemanggang Grill', 'ARD-GRL88', 0, 0, 2, 2, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-4118-488d-a495-799d8f5ffa66', '9db0d1c8-e6d6-4dbf-a7a0-8e78c2d4dd36', '2024-08-28', 'Mesin Cetak Mie', 'MKS-140', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-42e2-48cc-acb2-1d80be083c55', '9db0d1c9-34c7-468a-acff-b66593b494d6', '2024-08-28', 'Mesin Cetak Mie', 'MKS-160', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-44da-4bf3-95d5-74683bd5f767', '9db0d1c9-3545-4d72-85b8-b2f61e439017', '2024-08-28', 'Teko Listrik Stainless', 'ARD-KT11', 0, 0, 3, 3, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-46a5-4f4a-a5a1-2f754c77f3dc', '9db0d1c9-35c1-409c-864c-c8fbf0ff03e4', '2024-08-28', 'Mesin Water Boiler', 'MKS-D30', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-486f-4a82-9529-814769d49e41', '9db0d1c9-50cc-4473-8826-74ab886e01a8', '2024-08-28', 'Cup Sealer', 'CPS-10A', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-4a80-45a0-bcea-f7624e92481a', '9db0d1c9-3864-49e1-86f3-66e0d3617167', '2024-08-28', 'Dough Mixer', 'MKS-DIMX002', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-4c5d-4f4c-bde5-32d3ac8d69c5', '9db0d1c9-51c5-44ca-9354-852a3f3ff6b7', '2024-08-28', 'Mesin Ice Crusher', 'MKS-CRS20', 0, 0, 4, 4, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-4e20-453f-b38e-9870a133261b', '9db0d1c8-f406-48ca-975b-cdfcebe910cc', '2024-08-28', 'Mesin Cetak Mie', 'MKS-160SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-4fe5-4c2a-abab-b13dcd5fbbee', '9db0d1c8-e8e8-468b-af83-4b98e4d59fd4', '2024-08-28', 'Mesin Cetak Mie', 'MKS-180SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-51cc-4a05-90d2-9b30936f8dd8', '9db0d1c8-ed25-47b0-b184-9ec340b633ce', '2024-08-28', 'Mesin Cetak Mie', 'MKS-200', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-539c-4d7b-918a-0cf7410a8473', '9db0d1c9-3905-47dc-b49a-fa81feffc93e', '2024-08-28', 'Mesin Cetak Mie', 'MKS-220SS', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-5566-41b9-8e37-db0e79c0bf55', '9db0d1c9-3990-4fd4-9913-085c5b8e7042', '2024-08-28', 'Mesin Penutup Botol Manual', 'MKS-BT31', 0, 0, 2, 2, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-57b0-429a-88f8-d7e259ab671f', '9db0d1c9-3a18-40ba-bb87-90a2ecb3af2d', '2024-08-28', 'Hand Sealer', 'FS-600', 0, 0, 0, 0, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-5984-4152-8ba5-74419f4d1231', '9db0d1c9-3a9a-48d3-95dd-2627e86fe308', '2024-08-28', 'Mesin Cup Sealer', 'CPS-9A', 0, 0, 1, 1, 'Rak-4', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-5b47-4326-9ee6-c96147e9354e', '9db0d1c9-0492-4f52-a824-7119e5753718', '2024-08-28', 'Oven Roti Gas 1 Loyang', 'MKS-RS11', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-5d1a-433a-95ae-8d3f378c5e37', '9db0d1c9-0511-45ba-89c7-3f93cc6fc18d', '2024-08-28', 'Penetas Telur', 'AGR-INC24', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-5f26-4fc3-8140-17d5f0306d0f', '9db0d1c9-5257-46a4-a162-f87c4d5f5d54', '2024-08-28', 'Penetas Telur', 'AGR-TT32', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-60ef-4fe6-a3d9-17da0798d0dd', '9db0d1c9-05ac-4223-9abe-098d3c3ee180', '2024-08-28', 'Penetas Telur', 'AGR-TT7', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-62b5-4018-a243-2981131ed485', '9db0d1c9-063c-4b7b-b5c7-e886d77c85a1', '2024-08-28', 'Penetas Telur', 'AGR-TT4', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-64bf-44dd-90ef-877abebe7e35', '9db0d1c9-06ba-4bf6-b4cb-065b45f8ab64', '2024-08-28', 'Mesin Soft Ice Cream', 'MKS-ICM-119', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-668f-43a7-816d-a52259cc4593', '9db0d1c9-0736-4823-aaa1-3909246b64fc', '2024-08-28', 'Mesin Dough Mixer', 'MKS-DG15', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-6855-44bc-82d7-59dccbd713c4', '9db0d1c9-07b1-48ee-8240-9f9870967309', '2024-08-28', 'Mesin Cetak Mie', 'MKS-350', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-6a2f-4e19-8752-d60fed6bd786', '9db0d1c9-082f-445d-a92e-12a02c857ef2', '2024-08-28', 'Mesin Serutan Es Salju', 'MKS-ICE28', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-6c18-4c51-89e4-d10ef01026b9', '9db0d1c9-08b9-4453-ac61-dbca84343db8', '2024-08-28', 'Mesin Perajang Keripik', 'MKS-CT100 A', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-6de0-4727-95bc-e99b3b99c40a', '9db0d1c9-0935-4c08-a035-501e849052c3', '2024-08-28', 'Pengupas Nanas Industri', 'MKS-PN60', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-6faa-413c-aac4-b15f49444ed8', '9db0d1c9-09b0-4132-b340-517a3df8f349', '2024-08-28', 'Mesin Mixer Planetary', 'MKS-10B', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-71ae-4fa7-95ee-21aa61f60904', '9db0d1c9-0a30-4375-bd78-ec17abd53b18', '2024-08-28', 'Mesin Mixer Planetary', 'MKS-BK20M', 0, 0, 1, 1, 'Lantai-1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-7386-45c4-83d8-6904d7b8c089', '9db0d1c8-e3ff-4111-97db-ffdd56410428', '2024-08-28', 'Mesin Universal Fritter', 'MKS-UV44', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-7553-4c36-9316-5fd9a1b26a8e', '9db0d1c8-e5d0-4817-8530-318b8b979f47', '2024-08-28', 'Mesin Cup Sealer', 'CPS-10A', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-7771-4990-b07c-6119fb23ce2f', '9db0d1c8-e6d6-4dbf-a7a0-8e78c2d4dd36', '2024-08-28', 'Mesin Cetak Mie', 'MKS-140', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-7971-49bb-bd6b-531eed53454c', '9db0d1c8-e7a3-4414-bb83-d5c1d1633e57', '2024-08-28', 'Mesin Pencabut Rumput', 'AGR-PR238', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-7b37-41e0-ae1b-af6126643bf8', '9db0d1c8-e845-4dbe-b459-ddd40d60f423', '2024-08-28', 'Mesin Dough Mixer', 'MKS-DMIX002', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-7d0c-4a89-9c61-bec343fbbd41', '9db0d1c8-e8e8-468b-af83-4b98e4d59fd4', '2024-08-28', 'Mesin Cetak Mie', 'MKS-180SS', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-7f79-4242-9c23-1e7ab6e5f60e', '9db0d1c8-e976-4f3b-8359-29c08e5681c6', '2024-08-28', 'Mesin Food Dehidrator', 'ARD-PM99', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-83e0-48d7-b87d-3039a13dba5a', '9db0d1c8-ea1b-40c8-830f-206c1c4daa7a', '2024-08-28', 'Mesin Cetak Pelet', 'MKS-PLT25', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-85e6-415e-9753-2fb536c66950', '9db0d1c8-ea9e-4cc6-9d66-c40e3487737a', '2024-08-28', 'Alat Sauce Pan/Ssauce Dispenser', 'MKS-SU-01', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-87b4-4652-ba7c-c7bc0933c583', '9db0d1c8-eb1b-4053-a530-022cce858aba', '2024-08-28', 'Mesin Cetak Mie ', 'MCM-150', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-8980-4c46-9239-a457b7d0250f', '9db0d1c8-eb98-4842-ab36-5387c8e61035', '2024-08-28', 'Mesin Coffe Espresso', 'MKS-MKP60', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-8b4c-476a-9cd3-7f808ea58cd0', '9db0d1c8-ec19-4432-82ae-7b76b7adca54', '2024-08-28', 'Alat Giling Daging manual', 'MKS-SG10', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-8d29-4f16-8369-53b9b832a2e2', '9db0d1c8-eca5-45e2-8659-2d0dd6186901', '2024-08-28', 'Mesin cetak Mie Manual', 'MKS-150B', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-8f13-49cb-a44e-64d824933b4b', '9db0d1c8-ed25-47b0-b184-9ec340b633ce', '2024-08-28', 'Mesin Cetak Mie', 'MKS-200', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-90dc-474a-a29f-1978a1c8b381', '9db0d1c8-eda1-410e-93f6-6b3af23d3816', '2024-08-28', 'Alat Pemotong Kerupuk Lontong manual', 'AGR-LTG22', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-92d9-49b1-b90e-c5acf08e137b', '9db0d1c8-ee21-4977-a3fb-d454e936a3e4', '2024-08-28', 'Mesin Waffle Maker', 'MKS-WF48', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-94ad-4006-9afa-d9c81020d207', '9db0d1c8-ee9e-4951-af4a-6519fa0a5ef8', '2024-08-28', 'Mesin Electric Kettle', 'KTL-DBL2', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-967a-4c30-adba-c67b1fb91799', '9db0d1c8-ef1b-448d-95dd-c341f062f25e', '2024-08-28', 'Mesin electric Kettle', 'ARD-KT12', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-9840-4831-939e-7e2ffbf95190', '9db0d1c8-efa3-496f-8dcf-1a9002320651', '2024-08-28', 'Mesin Coffe Grinder', 'MKS-GRD60A', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-9a4a-47ef-8156-5ca2fc5c163f', '9db0d1c8-f02d-48e9-babd-af421f2b335c', '2024-08-28', 'Mesin Coffe Bean Grinder', 'MKS-CG50', 0, 0, 5, 5, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-9c26-425b-b39c-570dd2d5a8a7', '9db0d1c8-f0d5-43a0-a1dd-606588e95e73', '2024-08-28', 'Mesin Pemipil Jagung', 'PPJ-001', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-9ded-4df9-a7da-28f1cbb8b004', '9db0d1c8-f15d-452b-b232-68ff5707a05d', '2024-08-28', 'Alat Cetak Mie dan Pasta', 'CM-2020', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-9fd9-4b39-97ea-98ebab6fc438', '9db0d1c8-f1d9-4f4d-9390-d155e46f8dde', '2024-08-28', 'Mesin Giling Daging', 'MHW-120', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-a1bf-4890-a236-fd62e849ab1d', '9db0d1c8-f259-442f-af94-039ecca1f362', '2024-08-28', 'Mesin Pemanggang', 'MKS-111BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-a384-4879-a3ce-0c152d9451c4', '9db0d1c8-f2eb-4a61-8459-b20ed0189f3f', '2024-08-28', 'Mesin Big Smoker', 'MKS-BLS002', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-a54a-4724-851e-e3fd2717b78f', '9db0d1c8-f37d-42e9-a8cd-8a9832be2b31', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT32', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-a75c-4aff-ac5c-c60a391caa52', '9db0d1c8-f406-48ca-975b-cdfcebe910cc', '2024-08-28', 'Mesin Cetak Mie', 'MKS-160SS', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-a928-4c49-a617-405e3bc3f664', '9db0d1c8-f48c-4bc1-be1d-208238486cda', '2024-08-28', 'Mesin Stik Wafel', 'MKS-HDW5', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-aaef-456c-8c63-2a0a0d9183f1', '9db0d1c8-f50f-4629-be70-109c995f4c8c', '2024-08-28', 'Mesin Pemanggang', 'MKS-369BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-acf2-41b0-9006-4ecc15b6fc27', '9db0d1c8-f591-4336-a491-f8f4256048a2', '2024-08-28', 'Mesin Pemanggang', 'MKS-222BBQ', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-af8d-4f98-af76-9c27455a7c49', '9db0d1c8-f615-4e5c-b401-ddab001b58f8', '2024-08-28', 'Mesin Mixer Planetary', 'MKS-B5A', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-b162-41c3-a3c9-0c48dfb30140', '9db0d1c8-f694-4442-96e1-f90aa3af3b15', '2024-08-28', 'Foot Sealer', 'FRP-600', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-b34b-4b6a-97ca-a59694a6b8c3', '9db0d1c8-f747-4a73-b0c9-aea019d48098', '2024-08-28', 'Foot Sealer', 'FRP-400', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-b532-4ae7-81d5-29ee7c4acf71', '9db0d1c8-f7d1-454e-87cf-1d534671058d', '2024-08-28', 'Mesin egg Roll', 'MKS-ERG001', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-b6f9-423b-b512-7238aa9ebb6b', '9db0d1c8-f84e-4a34-861e-bdad9bf75d6e', '2024-08-28', 'Mesin Dough Devider', 'MKS-BA80', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-b8be-44ce-bf38-52ac4b4da955', '9db0d1c8-f8d4-4f5a-8b8a-0bdbdbe8ac8c', '2024-08-28', 'Mesin Pemipil Jagung', 'AGR-CORN9', 0, 0, 3, 3, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-bac8-42bc-9a19-9a0223260b93', '9db0d1c8-f95e-4c38-987b-348bd1ba6599', '2024-08-28', 'Mesin Gas Deep Fryer', 'MKS-G75', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-bc94-4ec1-8b4a-0b4393dd6b2b', '9db0d1c8-f9e2-4011-bc0d-be8a7cca1d65', '2024-08-28', 'Mesin Gas Deep Fryer', 'MKS-G20L', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-be5b-4c5f-9b7a-6fa7f4bc1fa7', '9db0d1c8-fa5f-4cdf-8bd2-6934783ad5d1', '2024-08-28', 'Mesin Gas Deep Fryer', 'MKS-72', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-c06c-4b37-8c0b-e72d24e0f18b', '9db0d1c8-fada-4d24-956a-45af9e3a4672', '2024-08-28', 'Mesin Ice Cream', 'ISC-16', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-c23d-498f-9661-6730cd00061c', '9db0d1c8-fb55-4b78-90a2-281ca243294f', '2024-08-28', 'Mesin Tortiila', 'MKS-TRT11', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-c402-4ffd-9d28-ee5df7411957', '9db0d1c8-fbd6-4085-bc94-5700943ae16c', '2024-08-28', 'Mesin Dough Devider', 'MKS-DD15M', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-c5c6-43c3-8c30-bd0c7d6299a1', '9db0d1c8-fc59-4880-98a2-af839f5bfd0b', '2024-08-28', 'Alat Churros', 'MKS-CRS05', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-c7b5-46e1-8710-496a9ddb18ba', '9db0d1c8-fcd5-4a96-9c61-17391b701bb4', '2024-08-28', 'Mesin Hand Sealer', 'FS-1000', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-c97b-4224-9c4e-1adf58f84091', '9db0d1c8-fd6d-4e22-b25b-f058c3d01b68', '2024-08-28', 'Mesin Continious Band Sealer', 'SF-150W', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-cb3e-4ae2-a8ab-3a90cba79c89', '9db0d1c8-fdf9-48cd-97d6-f161f9fd9991', '2024-08-28', 'Mesin Pemotong Tulang Manual', 'MKS-PTT38', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-cd21-4eb3-834f-48fcaf76d5a7', '9db0d1c8-fe75-4665-8070-7ab55d3462ec', '2024-08-28', 'Mesin Continious Band Sealer', 'FR-900W', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-cef3-4c94-9d8a-ad17f7a52ac4', '9db0d1c8-fef6-4fb7-b041-943e66919789', '2024-08-28', 'Alat Peras Jeruk Manual', 'MKS-MJ1001', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-d0b9-4aed-b48b-601d7f5a9ac4', '9db0d1c8-ff7f-41ca-94f7-2b44a5995189', '2024-08-28', 'Meat Slicer Pengiris Daging', 'MKS-70', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-d293-4db2-9cd5-0b48ed2baa1a', '9db0d1c8-ffff-4167-b027-5cc20a4c89f6', '2024-08-28', 'Ice Crusher', 'MKS-002', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-d4bb-4639-8936-1a2ec6342f89', '9db0d1c9-007b-4491-90b4-a353d5b0550b', '2024-08-28', 'Miller', 'MKS-ML200', 0, 0, 2, 2, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-d768-4218-8797-71ab9ffbc7aa', '9db0d1c9-00f8-4d71-a9ba-4c3d45c1b5a7', '2024-08-28', 'Mesin Takoyaki Gas', 'MKS-711B', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-d932-447b-a590-284413bbd12e', '9db0d1c9-0175-49a2-831b-0c8da8e5b1e7', '2024-08-28', 'Mini Coffe Roster', 'CRG-400', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-db70-45a2-a22a-3f2c9ed9179f', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-08-28', 'Cup Sealer', 'CPS-959', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-dd39-4b2b-a873-4d6a2f093585', '9db0d1c9-027d-40c9-ace2-7607979e6d9d', '2024-08-28', 'Ice Crusher', 'MKS-CRS30', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-defd-408c-9ffc-e2dd759f2e15', '9db0d1c9-02f9-4e03-a5d9-3f8fe027679e', '2024-08-28', 'Mesin Stand Mixer', 'ARD-MR7', 0, 0, 0, 0, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-e0ea-42cb-a3c0-b4a82c7f458a', '9db0d1c9-0409-4835-8b56-f02017e466fc', '2024-08-28', 'Mesin Mixer Spiral ', 'MKS-SP50', 0, 0, 1, 1, 'Gudang-Lt1', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-e2ba-40b0-bcf3-41f2c7ca9a38', '9db0d1c9-5864-4bea-b8d6-9237a7063a5e', '2024-08-28', 'Mesin Sosis Telur (Listrik)', 'GRILLO-400', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-e484-4021-a3e7-a33c06c4ef77', '9db0d1c9-58f2-45a5-9021-097ec057293a', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS6', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-e651-40b1-b2e3-d4e564741be2', '9db0d1c9-3b18-430e-b3a1-1c109a193ba7', '2024-08-28', 'Mesin Sosis Telur (Listrik)', 'MKS-ERG005', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-e83f-4982-9495-57a1dc4d9002', '9db0d1c9-597b-44dd-a0e7-d65c08cf2f10', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'MKS-ERG002', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-ea0e-43e6-893a-9e48b80b4daf', '9db0d1c9-59f9-4a24-b78d-c139293ff84b', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'MKS-ERG444', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-ebd6-4fb9-802e-6f2b0f94ed95', '9db0d1c9-3b94-4942-a30a-faabe598c54a', '2024-08-28', 'Mesin Ice Crusher', 'MKS-003', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-ede5-4fa2-be41-3cf7460d9d07', '9db0d1c9-5a77-40f1-aab6-1ae5165f1f72', '2024-08-28', 'Mesin Ice Crusher', 'MKS-CRS30', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-efc4-4667-a6a5-2522fbd97653', '9db0d1c9-5af4-4ed8-90f9-ddb8a84a1a21', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'GRILLO-GS10', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-f18f-43d5-bca2-7bad85f78ce1', '9db0d1c9-3c11-44d0-a518-83487a51387a', '2024-08-28', 'Mesin Sosis Telur (Gas)', 'MKS-ERG007', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-f41e-41fa-a9f4-59c84ea5071c', '9db0d1c9-3c8e-40d1-938c-6a9674b9d134', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT24', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-f608-4a25-ac19-32e396483d20', '9db0d1c9-3d0b-4dc3-8c68-761e593e21a8', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT24A', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-f7e4-4976-9fc2-f72ad5418a63', '9db0d1c9-2702-4b3f-9287-44cdd24dd891', '2024-08-28', 'Mesin hand Sealer', 'MSP-200I', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-f9bc-439f-adae-af2b8fec191e', '9db0d1c9-3d8b-4b67-986c-999f408019f7', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT96', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-fbc6-4784-83b6-e04fbb652a88', '9db0d1c9-1ccd-4316-bd82-f6c48e2c5c41', '2024-08-28', 'Mesin Kopi Espresso', 'MKS-MKP50', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-fd93-4a56-aa30-8f0af9c6dc55', '9db0d1c9-3e11-477e-b44e-ba2d9a388fe2', '2024-08-28', 'Mesin Filling Cairan Otomatis', 'MSP-F50', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e0-ff8c-422d-94eb-889a55016eee', '9db0d1c9-3e9c-4805-8dc0-c83de629ce44', '2024-08-28', 'Rok Espresso', 'Rok Espresso', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-019c-434d-9fce-ce15d685efb8', '9db0d1c9-3f2b-491e-b22a-bed96b604550', '2024-08-28', 'Mesin Standing Mixer', 'MKS-MIX130', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-036c-4b60-b11c-a8be61ef44b6', '9db0d1c9-3fa8-46ae-a524-8ae6fb5ee7ef', '2024-08-28', 'Mesin Vacum Sealer', 'ARD-VS02', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-0539-4094-8cdd-45c2fa660341', '9db0d1c9-5b70-4658-8b91-baab174ff842', '2024-08-28', 'Mesin Es Krim Buah', 'ICE-01', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-0714-4cd9-a594-1b4bd997f3a1', '9db0d1c9-2609-4446-96b8-9c2d1af27aa3', '2024-08-28', 'Mesin Hand Sealer', 'MSP-400A', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-0916-44e8-af88-e0fdcee734af', '9db0d1c9-402c-40e7-a310-1bb8fcb612bc', '2024-08-28', 'Mesin Hand Sealer', 'MSP-400I', 0, 0, 18, 18, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-0ae7-48d0-9f6a-f9fca8472761', '9db0d1c9-5bec-43b8-aeed-a3972041f1b6', '2024-08-28', 'Mesin Giling Daging', 'MHW-G51B', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-0cc7-4052-b544-ee3a68042acb', '9db0d1c9-40aa-4b08-afeb-aaacfeaa089e', '2024-08-28', 'Mesin Cetak Pelet Manual', 'PLT-10', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-0ee9-41c6-8f89-ec8b8046ea79', '9db0d1c9-5c74-409c-a691-517701ef5a28', '2024-08-28', 'Mesin pencacah Bumbu Dapur', 'MKS-UV22', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-10ba-429c-91e0-246c3ac3d45d', '9db0d1c9-4127-455e-95f2-07592fe5fdf7', '2024-08-28', 'Mesin Penepung Herbal, biji', 'MKS-ML300', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-128c-4a7c-b784-92ea2f54b47c', '9db0d1c9-5cfc-498d-a733-ec40bc999225', '2024-08-28', 'Mesin Penepung Herbal, biji', 'MKS-ML100', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-145a-4292-9ce4-fb7e9426dcbb', '9db0d1c9-41a4-400a-ae53-7de29f459e5c', '2024-08-28', 'Mesin Grinder Kopi', 'GRD-80A', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-1647-4069-9617-285469f81eae', '9db0d1c9-4221-4292-ad51-be3264ce7f23', '2024-08-28', 'Mesin Kebab', 'MKS-KB01', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-1824-48fc-8a4c-dfbac8690c55', '9db0d1c9-2364-436f-8cc2-72376a9f4275', '2024-08-28', 'Mesin Takoyaki Listrik', 'MKS-700E', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-19f3-479d-8fb4-97f4dab28090', '9db0d1c9-429e-486a-8d84-01ceb4259338', '2024-08-28', 'Mesin Coklat Fountain', 'MKS-CC6', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-1bed-4436-be0d-9a4a30b6665e', '9db0d1c9-4319-45cb-be34-c61b2b321cfa', '2024-08-28', 'Food Dryer', 'MKS-DR6', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-1dbc-45d8-90dd-2ba8a0ee1936', '9db0d1c9-4397-435c-b377-f7d93284f942', '2024-08-28', 'Deep Fryer', 'MKS-82B', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-1fab-46fa-92d8-8973d7173e9b', '9db0d1c9-442b-42e2-926a-fa7043d086c1', '2024-08-28', 'Alat Penanam Biji-Bijian', 'ARD-SED01', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-217a-4044-bd8f-6ae2d1538466', '9db0d1c9-44b6-414b-bf78-6cf607191750', '2024-08-28', 'Alat Penanam Biji-Bijian', 'ARD-SED02', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-2377-40af-903b-eca614a28dfc', '9db0d1c9-4541-4af4-848d-9be042a08725', '2024-08-28', 'Mesin Bread Maker', 'ARD-BM66X', 0, 0, 3, 3, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-2551-4ea9-a6a1-ab3f848bc7ed', '9db0d1c9-45cd-4936-b46e-c39ba34e3de2', '2024-08-28', 'Mesin Tetas Telur', 'AGR-TT56', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-271d-450f-b917-48e6d2ecf086', '9db0d1c9-464c-49db-a05e-a030b88a525e', '2024-08-28', 'Blender Komersial', 'MKS-BL10L', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-292c-4e24-8e0b-aef91f92caf5', '9db0d1c9-46c8-4b75-b1e6-c468624a24c2', '2024-08-28', 'Bread Toaster', 'MKS-D04', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-2b18-4ca3-8742-2e5bc2598f83', '9db0d1c9-4744-465a-bb5b-66ffc9742022', '2024-08-28', 'Deep Fryer', 'MKS-51B', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:49', '2024-12-10 10:46:49'),
('9db0d1e1-2ce8-46ae-8bdd-47ad696fec99', '9db0d1c9-47c1-460e-8e19-e1654bba6fa3', '2024-08-28', 'Deep Fryer', 'MKS-81', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-2f4c-4290-b14b-c4d5352ae8fa', '9db0d1c9-483e-4579-9476-dfadf51d31eb', '2024-08-28', 'Deep Fryer', 'MKS-82', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-3494-4ca0-ae69-3b4a2f6c853c', '9db0d1c9-258e-4821-9b80-27c13e0b506f', '2024-08-28', 'Cetak Mie dan Pasta', 'ARD-NM4', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-368f-45f0-8dc8-a1c86fc3d1a8', '9db0d1c9-5d7a-495a-9583-d9edefd87824', '2024-08-28', 'Pemanggang 2 Tungku', 'MKS-111BBQ', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-3867-49ff-a72d-6e148215476c', '9db0d1c9-48bb-420b-ae54-aa8e7bb5b7bc', '2024-08-28', 'Food Dryer', 'MKS-DR10', 0, 0, 2, 2, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-3a35-4bea-87e7-d94ef4346669', '9db0d1c9-4938-4805-860e-a5744814a750', '2024-08-28', 'Deep Fryer', 'MKS-G20L +Keranjang', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-3c3a-4d77-a8bf-b597ba4ae0ba', '9db0d1c9-5df8-4b09-8680-41be050ea0aa', '2024-08-28', 'Deep Fryer', 'MKS-72', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-3e34-4255-b3c2-a4addba90409', '9db0d1c9-22e1-462e-8368-134cbbfe8810', '2024-08-28', 'Mesin Kue Telur Puyuh', 'MKS-QEG11', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-4006-4db3-bcaf-7959b0cb3104', '9db0d1c9-5e74-4e69-ace6-9d6edf5ae1cb', '2024-08-28', 'Mesin Pemanggang Listrik', 'MKS-PG2', 0, 0, 4, 4, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-41d3-41c4-859f-9ca08c384e6c', '9db0d1c9-5ef0-41fd-9fb1-69b01499c7ab', '2024-08-28', 'Manual Meat Slicer', 'MKS-MSL66', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50');
INSERT INTO `tb_stok_barang` (`id_stok`, `id_barang`, `tanggal`, `nama_barang`, `tipe_barang`, `barang_masuk`, `barang_keluar`, `stok_awal`, `stok_akhir`, `posisi`, `keterangan`, `created_at`, `updated_at`) VALUES
('9db0d1e1-43e7-4f6f-8a2f-f2598d6da9c7', '9db0d1c9-49b5-4ab7-8daf-bb5d9e144a4e', '2024-08-28', 'Mesin Manual Meat Mixer', 'MKS-MM01', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-45b1-4e04-8a40-4c62d638a83a', '9db0d1c9-0376-44a7-9b64-4398dbea5d4d', '2024-08-28', 'Mesin Cetak Mie', 'MKS-145', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-477f-44ca-b91a-8520883bad55', '9db0d1c9-4a33-44e2-9210-4fac33c5726c', '2024-08-28', 'Mesin Ice Tube', 'MKS-IM22', 0, 0, 1, 1, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db0d1e1-4973-4142-823d-e002e82a5b27', '9db0d1c9-4ab0-48c9-ab41-a4ca2fe04278', '2024-08-28', 'Mesin Takoyaki Gas ', 'MKS-722B', 0, 0, 0, 0, 'Gudang-Lt2', 'stok', '2024-12-10 10:46:50', '2024-12-10 10:46:50'),
('9db10eeb-5313-4558-be69-1a508702e46b', '9db10eeb-506e-4abe-b08f-b35eb2af647a', '2024-08-28', 'Sparepart Baut Saringan Susu Kedalai SKD-100B', 'SKD-100B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-5565-4a38-8639-6366a42ce5c1', '9db10eeb-5416-42be-a742-42cfc5e175d8', '2024-08-28', 'Sparepart Conveyor Pendek/Atas Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-5771-419a-988b-986e62d4cb9c', '9db10eeb-5655-4256-991f-ec2c9d6f8d4a', '2024-08-28', 'Sparepart Conveyor Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-598d-4efa-b92e-740f94a39219', '9db10eeb-583e-476b-ae5b-1ff22635ebe6', '2024-08-28', 'Sparepart Moulding Ukuran 1 Cm Cetak Tablet MKS-TBL11', 'MKS-TBL11', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-5c05-4881-8499-1a8b7b2f0211', '9db10eeb-5a6e-4717-818d-4d189824da1a', '2024-08-28', 'Sparepart PCB Tetas Telur AGR-TT96 Versi Lama', 'AGR-TT96', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-5dd7-4976-b023-c25912bf67ce', '9db10eeb-5cdd-49fb-805b-a413346fa914', '2024-08-28', 'Sparepart Pisau Penyerut Tusuk Sate Uk 4 mm ST-103 HS', 'ST-103', 0, 0, 10, 10, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-5f7c-4b87-b85a-dc290de033f2', '9db10eeb-5e86-417e-8ddd-a7a70bd7d2e1', '2024-08-28', 'Sparepart Roda (Hidup) Per-PCS Pemipih Adonan MKS-DS88', 'MKS-DS88', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-616b-4942-8b5a-590364fba68f', '9db10eeb-602b-40a8-8a33-d264998d60ce', '2024-08-28', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-400', 'Grillo-400', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-631e-4216-b800-8e07b540b681', '9db10eeb-6225-473e-979f-a82475786d53', '2024-08-28', 'Sparepart Sisir Cetak Mie MKS-220SS', 'MKS-220SS', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-64ca-4372-8f68-3bba01be918a', '9db10eeb-63cc-4b20-8e36-e5bcf1e03366', '2024-08-28', 'Sparepart Roll Pan/Slonsong Egg Roll Listrik Grillo-GS10', 'Grillo-GS10', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-6671-4608-8201-906e052b792e', '9db10eeb-657a-407c-ab30-98e241f25502', '2024-08-28', 'Sparepart Heating Element MSP-300I', 'MSP-300I', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-6831-47f0-9c5d-b41c3cb17658', '9db10eeb-6721-42a8-8cfc-58cfa54492b9', '2024-08-28', 'Sparepart Kain Teflon MSP-300i', 'MSP-300I', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-69d8-4ccd-b363-a55cd626b490', '9db10eeb-68e3-41f4-94d4-dc50da97e0b8', '2024-08-28', 'Sparepart Pisau 4mm Vegetable\nCutter MKS-CT100\n', 'MKS-CT100', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-6b7c-4c68-a64e-e75b84979ddb', '9db10eeb-6a86-4a4e-9eae-171405837a87', '2024-08-28', 'Sparepart  Keramik Humidifier Tetas Telur AGR TT360', 'AGR TT360', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-6d24-43a9-b130-49b16c9d969b', '9db10eeb-6c2c-488e-a910-66657da495fd', '2024-08-28', 'Sparepart Rak 1 Set Tetas Telur AGR-TT360', 'AGR TT360', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-6ef4-4b96-aca3-b3e787a50a27', '9db10eeb-6dea-4214-bb91-748f6428a755', '2024-08-28', 'Sparepart Screw Giling Daging \nMHW-120\n', 'MHW-120', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-709e-4ec5-a6f4-0d9ae54d48c0', '9db10eeb-6fa8-4679-8024-a69447190ea6', '2024-08-28', 'Sparepart Penjepit Cetak Bakso MKS-MFC280', 'MKS-MFC280', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-7243-4a4b-90df-91b734d62669', '9db10eeb-714d-47f8-9e59-ba826c0f52bb', '2024-08-28', 'Sparepart Ring Cup Sealer Uk. 88mm 10-16 Oz CPS-959', 'CPS-959', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-73eb-4c5f-84bb-96f41d9002e0', '9db10eeb-72f3-4e2f-9b00-ba8245f19a17', '2024-08-28', 'Sparepat Per Cetak Bakso MKS-MFC280', 'MKS-MFC280', 0, 0, 2, 2, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-75d4-4121-a6a4-8763ef1f5a7e', '9db10eeb-74cb-4f12-8ee3-ee7206d549c5', '2024-08-28', 'Baut pengunci kecil cetak mie', 'CM-123', 0, 0, 4, 4, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-7780-4877-9e0a-e50c9214d0ca', '9db10eeb-7687-4d2e-ae79-b18a71053cb3', '2024-08-28', 'Sparepart penutup bawah eggroll ERG-001,ARD-202,ARD-404', 'ERG-001,ARD-202,ARD-404', 0, 0, 11, 11, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-792b-49e9-add6-0e6799ea556d', '9db10eeb-7832-4f61-b1bd-c4b3e1aa54b5', '2024-08-28', 'Sparepart Ring moulding Uk.66mm 8 oz CPS-959', 'CPS-959', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-7ade-4d62-b6e2-9049e41f12be', '9db10eeb-79db-4fcd-85e5-902c4cd428fc', '2024-08-28', 'PCB KZB-1', 'KZB-1', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-7cb3-4636-8667-902960e942d7', '9db10eeb-7bb6-4d6b-86ce-fd193946bac3', '2024-08-28', 'Sparepart corong atas perajang rumput AGR-CH400B', 'AGR-CH400B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-7e5d-4686-9f8e-d35ddfb28504', '9db10eeb-7d63-4203-bd3a-cb4d7177ee79', '2024-08-28', 'Pisau penyerut mesin giling daging MHW-G51B/Kecil', 'MHW-G51B/Kecil', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-8002-4613-b92f-7a2e13b718f2', '9db10eeb-7f0c-4d8d-b472-fbb85c2ef7ca', '2024-08-28', 'Sparepart Tray Food Dehidrator ARD-PM99', 'ARD-PM99', 0, 0, 5, 5, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-81d8-4ba4-a013-d03fe8497824', '9db10eeb-80c3-4064-9104-afe5bcace912', '2024-08-28', 'Sparepart Pully Kecil Cetak Mie MKS-220SS', 'MKS-220SS', 0, 0, 0, 0, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db10eeb-8382-41a1-9495-8f8df252a5f3', '9db10eeb-828d-4497-94b6-385802ca75e4', '2024-08-28', 'Sparepart Tombol Emergency Mixer Planetary MKS-20B/30B', 'MKS-20B/30B', 0, 0, 1, 1, 'Kasir', 'stok', '2024-12-10 13:37:30', '2024-12-10 13:37:30'),
('9db11eed-a26e-4ef7-ad67-216eab4d17bc', '9db11005-7583-43f7-9e9b-5751d0f1b4d1', '2024-08-30', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-10 14:22:16', '2024-12-10 14:25:07'),
('9db11f48-8694-4b95-891a-ff4edfc87b27', '9db11069-9f9c-49f6-ac10-99900d54e76d', '2024-08-30', 'Sparepart Bearing 6205', 'ALL-Type', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-10 14:23:16', '2024-12-10 14:26:34'),
('9db121aa-3fa2-4660-b1e5-c101199476ac', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-09-04', 'Cup Sealer', 'CPS-959', 0, 1, 2, 1, 'Rak-4', 'stok', '2024-12-10 14:29:55', '2024-12-10 14:29:55'),
('9db12440-5462-480e-9ed6-83382e848e13', '9db123b1-4d94-4614-90b9-cb4ddac5e6f4', '2024-09-04', 'Sparepart Gear Hidrolik Cetak Sosis Manual', 'MKS-3V,MKS-5V,MKS-7V,MKS-10V', 1, 1, 0, 0, 'Kasir', 'stok', '2024-12-10 14:37:09', '2024-12-10 14:43:03'),
('9db129c2-487d-4506-bee8-19f86d370531', '9db127b9-7ec3-4d9d-9074-6b095b6bee6e', '2024-09-04', 'Sparepart Pully Kecil Cetak Mie', 'MKS-200,MKS-160,MKS-220SS,MKS-240SS', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-10 14:52:33', '2024-12-10 14:55:30'),
('9db12cca-6152-4ca5-a64c-945008435c78', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-09-05', 'Cup Sealer', 'CPS-959', 0, 1, 1, 0, 'Rak-4', 'stok', '2024-12-10 15:01:02', '2024-12-10 15:01:02'),
('9db13235-7d57-41a6-af93-628caf2f3122', '9db10f99-75fa-44b7-8bd2-e33fb60e7815', '2024-09-06', 'Sparepart Termostat Cup Sealer Manual', 'CPS-919, CPS-818,CPS-959', 0, 1, 1, 0, 'Kasir', 'stok', '2024-12-10 15:16:11', '2024-12-10 15:19:32'),
('9db14dff-f150-4efa-ba0c-8055097674bf', '9db149e4-57e8-44bf-b2bf-eadc88ee3786', '2024-09-07', 'Sparepart Gear Kecil Besi 2 cm Cetak Mie', 'MKS-145', 8, 0, 0, 8, 'Kasir', 'stok', '2024-12-10 16:33:53', '2024-12-10 16:33:53'),
('9db14ebc-fa9a-4b50-a57e-151d876b1992', '9db0d1c8-e6d6-4dbf-a7a0-8e78c2d4dd36', '2024-09-07', 'Mesin Cetak Mie', 'MKS-140', 1, 0, 0, 1, 'Kasir', 'stok', '2024-12-10 16:35:57', '2024-12-10 16:35:57'),
('9db14f50-8760-44c0-9673-90a483e0a38a', '9db0d1c8-fa5f-4cdf-8bd2-6934783ad5d1', '2024-09-07', 'Mesin Gas Deep Fryer', 'MKS-72', 1, 0, 0, 1, 'Kasir', 'stok', '2024-12-10 16:37:34', '2024-12-10 16:37:34'),
('9db14fd8-369f-4a9d-a8a5-2c09eccdb9ea', '9db11105-c9e8-412d-b229-d1b445c48416', '2024-09-07', 'Sparepart Karet Seal Double Soft Ice Cream', 'ISC-16/ISC-16S', 1, 0, 0, 1, 'Kasir', 'stok', '2024-12-10 16:39:03', '2024-12-10 16:39:03');

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
('9db11c58-5497-4d1d-9ab7-6cc44740b477', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-08-28', '601018004', 'Cup Sealer', 'CPS-959', 2, '2024-12-10 14:15:03', '2024-12-10 14:17:20'),
('9db11ff1-e997-4e65-a881-f2cd9e570569', '9db11005-7583-43f7-9e9b-5751d0f1b4d1', '2024-08-30', '102229057', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 1, '2024-12-10 14:25:07', '2024-12-10 14:25:07'),
('9db12077-cd06-43d5-a698-0125dbc7f03d', '9db11069-9f9c-49f6-ac10-99900d54e76d', '2024-08-30', '102263010', 'Sparepart Bearing 6205', 'ALL-Type', 1, '2024-12-10 14:26:34', '2024-12-10 14:26:34'),
('9db121aa-41f6-4332-907f-01b183c4377a', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-09-04', '601018004', 'Cup Sealer', 'CPS-959', 1, '2024-12-10 14:29:55', '2024-12-10 14:29:55'),
('9db1265c-9a76-4aa9-8d73-3938ae5e7706', '9db123b1-4d94-4614-90b9-cb4ddac5e6f4', '2024-09-04', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual', 'MKS-3V,MKS-5V,MKS-7V,MKS-10V', 1, '2024-12-10 14:43:03', '2024-12-10 14:43:03'),
('9db12ad0-59f0-4bea-910c-44a7160371d8', '9db127b9-7ec3-4d9d-9074-6b095b6bee6e', '2024-09-04', '102226097', 'Sparepart Pully Kecil Cetak Mie', 'MKS-200,MKS-160,MKS-220SS,MKS-240SS', 1, '2024-12-10 14:55:30', '2024-12-10 14:55:30'),
('9db12cca-63af-4044-8ebe-66dd29cc974c', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '2024-09-05', '601018004', 'Cup Sealer', 'CPS-959', 1, '2024-12-10 15:01:02', '2024-12-10 15:01:02'),
('9db13368-311a-4f48-af35-4b786d78c9d4', '9db10f99-75fa-44b7-8bd2-e33fb60e7815', '2024-09-06', '302052003', 'Sparepart Termostat Cup Sealer Manual', 'CPS-919, CPS-818,CPS-959', 1, '2024-12-10 15:19:32', '2024-12-10 15:19:32');

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
  `status_pembayaran` enum('dana pertama - belum lunas','dana pertama - lunas','lunas') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dana pertama - belum lunas',
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
('9db11c58-4e95-42e4-9f29-7e1ed94563f4', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '9db0d1e0-398d-4d94-84b7-319820aa45a8', '2024-08-28', 'SI.2024.08.00029', 'Bpk.Aria', '081325256325', 'Beringin Eddy - Riau', 'Muhammad Reza', '601018004', 'Cup Sealer', 'CPS-959', 1, '1400000.00', 'Rak-4', 'lunas', 'tunai', '0.00', '910000.00', 35, '910000.00', '0.00', '2024-12-10 14:15:03', '2024-12-10 14:15:03'),
('9db11d29-9316-4dfe-8377-b15e0a4de931', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '9db0d1e0-398d-4d94-84b7-319820aa45a8', '2024-08-28', 'SI.2024.08.00030', 'Ibu.Ajar', '081364290613', 'Sungai Pinang - Riau', 'Tia Saputri', '601018004', 'Cup Sealer', 'CPS-959', 1, '1400000.00', 'Rak-4', 'lunas', 'tunai', '0.00', '910000.00', 35, '910000.00', '0.00', '2024-12-10 14:17:20', '2024-12-10 14:17:20'),
('9db11ff1-e439-4deb-bba5-4f16276644e7', '9db11005-7583-43f7-9e9b-5751d0f1b4d1', '9db11eed-a26e-4ef7-ad67-216eab4d17bc', '2024-08-30', 'SO.2024.08.00031', 'Ibu.Diana Sartika', '085262370667', 'Jl.Siak 2 Palas , Pekanbaru - Riau', 'Tia Saputri', '102229057', 'Sparepart Seal Oli 30.45.10 Food Mixer', 'ADT-SM20', 1, '100000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '100000.00', 0, '100000.00', '0.00', '2024-12-10 14:25:07', '2024-12-10 14:25:07'),
('9db12077-c819-4c49-8638-5f262cbe2300', '9db11069-9f9c-49f6-ac10-99900d54e76d', '9db11f48-8694-4b95-891a-ff4edfc87b27', '2024-08-30', 'SO.2024.08.00031', 'Ibu.Diana Sartika', '085262370667', 'Jl.Siak 2 Palas , Pekanbaru - Riau', 'Tia Saputri', '102263010', 'Sparepart Bearing 6205', 'ALL-Type', 1, '80000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '80000.00', 0, '80000.00', '0.00', '2024-12-10 14:26:34', '2024-12-10 14:26:34'),
('9db121aa-3c26-4e75-99a2-139754d22a8b', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '9db0d1e0-398d-4d94-84b7-319820aa45a8', '2024-09-04', 'SI.2024.09.00002', 'Bpk.Roy Putra', '085265802234', 'Jl.Lintas Timur KM-19  - Riau', 'Tia Saputri', '601018004', 'Cup Sealer', 'CPS-959', 1, '1400000.00', 'Rak-4', 'lunas', 'non tunai', '0.00', '910000.00', 35, '910000.00', '0.00', '2024-12-10 14:29:55', '2024-12-10 14:29:55'),
('9db1265c-943a-4c22-881c-4c5a7f6e0be1', '9db123b1-4d94-4614-90b9-cb4ddac5e6f4', '9db12440-5462-480e-9ed6-83382e848e13', '2024-09-04', 'SI.2024.09.00003', 'Bpk.Darliansyah', '08126814341', 'Jl.Cipta Karya Perum Villa - Pekanbaru - Riau', 'Muhammad Reza', '102268020', 'Sparepart Gear Hidrolik Cetak Sosis Manual', 'MKS-3V,MKS-5V,MKS-7V,MKS-10V', 1, '260000.00', 'Kasir', 'lunas', 'tunai', '0.00', '260000.00', 0, '260000.00', '0.00', '2024-12-10 14:43:03', '2024-12-10 14:43:03'),
('9db12ad0-5461-44ea-985a-7bcaa87cb588', '9db127b9-7ec3-4d9d-9074-6b095b6bee6e', '9db129c2-487d-4506-bee8-19f86d370531', '2024-09-04', 'SI.2024.08.00023', 'Bpk.Indra Mahira', '082173214448', 'Jl.Tanjung Pati Sari Lamak Payakumbuh Sumatra Barat', 'Muhammad Reza', '102226097', 'Sparepart Pully Kecil Cetak Mie', 'MKS-200,MKS-160,MKS-220SS,MKS-240SS', 1, '60000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '60000.00', 0, '60000.00', '0.00', '2024-12-10 14:55:30', '2024-12-10 14:55:30'),
('9db12cca-5e43-4057-a2bb-c1210c346f11', '9db0d1c9-01f3-4291-a5d4-a0be0922579e', '9db121aa-3fa2-4660-b1e5-c101199476ac', '2024-09-05', 'SI.2024.09.00004', 'Ibu.Rita Agustina', '085182067297', 'Jl.Kruing No.450, Pekanbaru - Riau', 'Tia Saputri', '601018004', 'Cup Sealer', 'CPS-959', 1, '1400000.00', 'Rak-4', 'lunas', 'tunai', '0.00', '910000.00', 35, '910000.00', '0.00', '2024-12-10 15:01:02', '2024-12-10 15:01:02'),
('9db13368-2b9a-4046-9158-859a977fdad8', '9db10f99-75fa-44b7-8bd2-e33fb60e7815', '9db13235-7d57-41a6-af93-628caf2f3122', '2024-09-06', 'SO.2024.09.00003', 'Bpk.Aria', '081325256325', 'Beringin Eddy - Pekanbaru - Riau', 'Muhammad Reza', '302052003', 'Sparepart Termostat Cup Sealer Manual', 'CPS-919, CPS-818,CPS-959', 1, '110000.00', 'Kasir', 'lunas', 'non tunai', '0.00', '110000.00', 0, '110000.00', '0.00', '2024-12-10 15:19:32', '2024-12-10 15:19:32');

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
('9db0d17e-31d8-4dc6-bcde-c07bd4df4f51', 'admin', 'admin@gmail.com', '2024-12-10 10:45:44', '$2y$12$tClle4YNKgSTPmo7R5IaRud1aEgAW7oj5TYUBrmf/2KIUAoVV2fyq', 'admin', NULL, 'k9Qd8M6mSh', '2024-12-10 10:45:45', '2024-12-10 10:45:45'),
('9db0d17e-3673-4cf1-9b0f-a06fa99a1651', 'admin2', 'admin2@example.com', '2024-12-10 10:45:45', '$2y$12$/FmR86qCm5TnkD6yLTds0e/sU/NhlmWJDGFZiZACKELGfbtCuhl2u', 'admin', NULL, 'sEXHUTbpiZ', '2024-12-10 10:45:45', '2024-12-10 10:45:45');

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
