-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 24 Jun 2025 pada 08.55
-- Versi server: 8.4.3
-- Versi PHP: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `produksi_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `departments`
--

INSERT INTO `departments` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Produksi', 'PROD', 'Departemen yang bertanggung jawab atas proses produksi', '2025-06-23 10:20:48', '2025-06-23 10:20:48'),
(2, 'Quality Control', 'QC', 'Departemen yang bertanggung jawab atas kualitas produk', '2025-06-23 10:20:48', '2025-06-23 10:20:48'),
(3, 'Maintenance', 'MAINT', 'Departemen yang bertanggung jawab atas pemeliharaan mesin dan peralatan', '2025-06-23 10:20:48', '2025-06-23 10:20:48'),
(4, 'Logistik', 'LOG', 'Departemen yang bertanggung jawab atas pengadaan dan distribusi material', '2025-06-23 10:20:48', '2025-06-23 10:20:48'),
(5, 'Teknik', 'ENG', 'Departemen yang bertanggung jawab atas desain dan pengembangan produk', '2025-06-23 10:20:48', '2025-06-23 10:20:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2025_06_22_172639_create_roles_table', 1),
(7, '2025_06_22_172644_create_production_schedules_table', 1),
(8, '2025_06_22_172651_create_tasks_table', 1),
(9, '2025_06_22_172657_create_departments_table', 1),
(10, '2025_06_22_172703_create_reports_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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
-- Struktur dari tabel `production_schedules`
--

CREATE TABLE `production_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `production_line` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_quantity` int NOT NULL,
  `completed_quantity` int NOT NULL DEFAULT '0',
  `created_by` bigint UNSIGNED NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `production_schedules`
--

INSERT INTO `production_schedules` (`id`, `title`, `description`, `start_time`, `end_time`, `status`, `production_line`, `target_quantity`, `completed_quantity`, `created_by`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'Produksi Bumper Depan Avanza', 'Produksi bumper depan untuk Toyota Avanza', '2025-06-18 17:20:51', '2025-06-20 17:20:51', 'completed', 'Line A', 500, 500, 2, 'Produksi selesai tepat waktu', '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(2, 'Produksi Bumper Belakang Avanza', 'Produksi bumper belakang untuk Toyota Avanza', '2025-06-21 17:20:51', '2025-06-24 17:20:51', 'active', 'Line B', 500, 350, 2, 'Produksi berjalan lancar', '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(3, 'Produksi Dashboard Xenia', 'Produksi dashboard untuk Daihatsu Xenia', '2025-06-25 17:20:00', '2025-06-28 17:20:00', 'pending', 'Line C', 300, 0, 2, 'Menunggu material dari supplier', '2025-06-23 10:20:51', '2025-06-23 10:59:09'),
(4, 'Produksi Spion Yaris', 'Produksi spion untuk Toyota Yaris', '2025-06-22 17:20:51', '2025-06-25 17:20:51', 'active', 'Line D', 1000, 400, 3, 'Prioritas tinggi untuk memenuhi target ekspor', '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(6, 'Produksi Pintu Depan Terios', 'Produksi pintu depan untuk Daihatsu Terios', '2025-06-13 17:20:51', '2025-06-17 17:20:51', 'completed', 'Line A', 400, 400, 2, 'Produksi selesai dengan kualitas baik', '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(17, 'Produksi Kaca Mobil', 'untuk kaca mobil', '2025-06-24 15:38:00', '2025-06-30 15:38:00', 'pending', 'Line A', 200, 0, 1, 'harus sampai target sblm tenggat', '2025-06-24 01:39:08', '2025-06-24 01:39:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reports`
--

CREATE TABLE `reports` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `production_schedule_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `report_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `reports`
--

INSERT INTO `reports` (`id`, `title`, `content`, `production_schedule_id`, `created_by`, `report_type`, `created_at`, `updated_at`) VALUES
(1, 'Laporan Harian Produksi 18 Juni 2025', 'Produksi hari ini berjalan lancar. Target harian tercapai 100%.\n\nDetail Produksi:\n- Bumper Depan Avanza: 100 unit\n- Bumper Belakang Avanza: 95 unit\n- Spion Yaris: 150 unit\n\nCatatan: Tidak ada kendala signifikan.', NULL, 2, 'daily', '2025-06-19 10:20:51', '2025-06-23 10:20:51'),
(2, 'Laporan Harian Produksi 19 Juni 2025', 'Produksi hari ini mencapai 95% dari target harian.\n\nDetail Produksi:\n- Bumper Depan Avanza: 95 unit\n- Bumper Belakang Avanza: 90 unit\n- Spion Yaris: 140 unit\n\nCatatan: Terjadi penundaan 30 menit karena masalah pada mesin injection molding. Masalah sudah diatasi oleh tim maintenance.', NULL, 2, 'daily', '2025-06-20 10:20:51', '2025-06-23 10:20:51'),
(3, 'Laporan Insiden: Kerusakan Mesin Injection Molding', 'Pada tanggal 19 Juni 2025 pukul 10:30, mesin injection molding di Line A mengalami kerusakan. Mesin berhenti beroperasi selama 30 menit.\n\nPenyebab: Kelebihan beban pada sistem hidrolik\n\nTindakan yang diambil: Tim maintenance melakukan perbaikan darurat dan menormalkan tekanan hidrolik.\n\nRekomendasi: Perlu dilakukan pemeriksaan rutin pada sistem hidrolik setiap minggu untuk mencegah kejadian serupa.', 1, 6, 'incident', '2025-06-20 10:20:51', '2025-06-23 10:20:51'),
(4, 'Laporan Kualitas: Bumper Depan Avanza', 'Hasil inspeksi kualitas bumper depan Avanza batch #A2506:\n\n- Total produksi: 500 unit\n- Lolos QC: 485 unit (97%)\n- Defect: 15 unit (3%)\n\nJenis defect:\n1. Permukaan tidak rata: 8 unit\n2. Warna tidak sesuai: 4 unit\n3. Dimensi tidak sesuai: 3 unit\n\nTindakan: 15 unit defect telah dipisahkan untuk diproses ulang. Penyesuaian pada parameter mesin telah dilakukan untuk batch berikutnya.', 1, 7, 'quality', '2025-06-20 10:20:51', '2025-06-23 10:20:51'),
(5, 'Laporan Pemeliharaan Rutin: Line A', 'Pemeliharaan rutin Line A dilakukan pada tanggal 20 Juni 2025.\n\nKegiatan yang dilakukan:\n1. Penggantian oli hidrolik\n2. Kalibrasi sensor\n3. Pembersihan nozzle injection\n4. Pemeriksaan sistem kelistrikan\n\nHasil: Semua sistem berfungsi normal. Penggantian beberapa komponen wear and tear dilakukan sesuai jadwal preventive maintenance.\n\nRekomendasi: Jadwalkan penggantian belt conveyor dalam 2 bulan ke depan.', NULL, 6, 'maintenance', '2025-06-21 10:20:51', '2025-06-23 10:20:51'),
(6, 'Laporan Harian Produksi 20 Juni 2025', 'Produksi hari ini mencapai 105% dari target harian.\n\nDetail Produksi:\n- Bumper Belakang Avanza: 110 unit\n- Spion Yaris: 160 unit\n\nCatatan: Produktivitas meningkat setelah perbaikan dan pemeliharaan mesin.', NULL, 3, 'daily', '2025-06-21 10:20:51', '2025-06-23 10:20:51'),
(7, 'Laporan Harian Produksi 21 Juni 2025', 'Produksi hari ini mencapai 100% dari target harian.\n\nDetail Produksi:\n- Bumper Belakang Avanza: 100 unit\n- Spion Yaris: 150 unit\n\nCatatan: Produksi berjalan normal tanpa kendala.', NULL, 3, 'daily', '2025-06-22 10:20:51', '2025-06-23 10:20:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '\"[\\\"all\\\"]\"', '2025-06-23 10:20:48', '2025-06-23 10:20:48'),
(2, 'Production Manager', 'manager', '\"[\\\"create-schedule\\\",\\\"edit-schedule\\\",\\\"view-schedule\\\",\\\"create-task\\\",\\\"assign-task\\\",\\\"view-reports\\\",\\\"create-reports\\\"]\"', '2025-06-23 10:20:48', '2025-06-23 10:20:48'),
(3, 'Factory Worker', 'worker', '\"[\\\"view-schedule\\\",\\\"view-task\\\",\\\"update-task\\\",\\\"create-reports\\\"]\"', '2025-06-23 10:20:48', '2025-06-23 10:20:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `production_schedule_id` bigint UNSIGNED NOT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `due_date` datetime NOT NULL,
  `priority` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `production_schedule_id`, `assigned_to`, `status`, `due_date`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Persiapan Material Bumper Depan', 'Menyiapkan semua material untuk produksi bumper depan Avanza', 1, 5, 'completed', '2025-06-18 17:20:51', 3, '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(2, 'Pengoperasian Mesin Injection Molding', 'Mengoperasikan mesin injection molding untuk bumper depan', 1, 4, 'completed', '2025-06-19 17:20:51', 4, '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(3, 'QC Bumper Depan', 'Melakukan pemeriksaan kualitas pada bumper depan yang sudah diproduksi', 1, 7, 'completed', '2025-06-20 17:20:51', 5, '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(4, 'Persiapan Material Bumper Belakang', 'Menyiapkan semua material untuk produksi bumper belakang Avanza', 2, 5, 'completed', '2025-06-21 17:20:51', 3, '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(5, 'Pengoperasian Mesin Injection Molding', 'Mengoperasikan mesin injection molding untuk bumper belakang', 2, 5, 'completed', '2025-06-24 17:20:51', 4, '2025-06-23 10:20:51', '2025-06-24 01:42:49'),
(6, 'QC Bumper Belakang', 'Melakukan pemeriksaan kualitas pada bumper belakang yang sudah diproduksi', 2, 7, 'pending', '2025-06-24 17:20:00', 5, '2025-06-23 10:20:51', '2025-06-24 01:37:45'),
(7, 'Persiapan Material Dashboard', 'Menyiapkan semua material untuk produksi dashboard Xenia', 3, 5, 'pending', '2025-06-25 17:20:51', 3, '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(8, 'Setup Mesin Produksi Dashboard', 'Melakukan setup mesin untuk produksi dashboard', 3, 6, 'pending', '2025-06-25 17:20:51', 4, '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(9, 'Produksi Casing Spion', 'Memproduksi casing spion untuk Toyota Yaris', 4, 9, 'in-progress', '2025-06-24 17:20:51', 3, '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(12, 'Inspeksi Akhir Pintu Depan', 'Melakukan inspeksi akhir pada pintu depan Terios yang sudah selesai', 6, 7, 'completed', '2025-06-17 17:20:51', 4, '2025-06-23 10:20:51', '2025-06-23 10:20:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `department`, `employee_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@mmid.com', NULL, '$2y$12$le3y6icndBW55qRg0oxea.EGKYXarnUOtCjIrOOZ7dX2zJ3844vCG', 1, NULL, 'ADM001', NULL, '2025-06-23 10:20:49', '2025-06-23 10:20:49'),
(2, 'Budi Santoso', 'budi.manager@mmid.com', NULL, '$2y$12$u516MG4R.MEN3Yk4gYBKEewcZfifwmtSoM4XzJNM2of9hSg4PBTvu', 2, 'Produksi', 'MGR001', NULL, '2025-06-23 10:20:49', '2025-06-23 10:20:49'),
(3, 'Dewi Lestari', 'dewi.manager@mmid.com', NULL, '$2y$12$9yNWS1rSq3D9nzu9mFx6uutFqgFcsyVd6XqMOy90rLa4TI3F1Wxly', 2, 'Quality Control', 'MGR002', NULL, '2025-06-23 10:20:49', '2025-06-23 10:20:49'),
(4, 'Agus Pratama', 'agus.worker@mmid.com', NULL, '$2y$12$rfVZmt5p3Xltgkyq2bIMx.stKHshxiEKqrpzYA2fHaRCz9f656Tc.', 3, 'Produksi', 'WRK001', NULL, '2025-06-23 10:20:49', '2025-06-23 10:20:49'),
(5, 'Siti Rahayu', 'siti.worker@mmid.com', NULL, '$2y$12$uKHIZ0m5G9T7AX7JMKlMCenNVZxoD11uWKG1igAlUbKVKHNodJLd6', 3, 'Produksi', 'WRK002', NULL, '2025-06-23 10:20:50', '2025-06-23 10:20:50'),
(6, 'Rudi Hartono', 'rudi.worker@mmid.com', NULL, '$2y$12$X1vhfRs5wHLTdAODz7j93O67akqTTrmiDMj7bAb9ICYrQ3dz./oT2', 3, 'Maintenance', 'WRK003', NULL, '2025-06-23 10:20:50', '2025-06-23 10:20:50'),
(7, 'Nina Wijaya', 'nina.worker@mmid.com', NULL, '$2y$12$hXN8NFebsPSAbg.gVZS/UeMwA7F9h7PCT6GlVE2GZCSMc3ssifL0K', 3, 'Quality Control', 'WRK004', NULL, '2025-06-23 10:20:50', '2025-06-23 10:20:50'),
(8, 'Eko Saputra', 'eko.worker@mmid.com', NULL, '$2y$12$Aq0ryWHenIcAgB1nc4D8UuqJNTRHZm.To3vZaB38DZvjmzAN06Awq', 3, 'Logistik', 'WRK005', NULL, '2025-06-23 10:20:50', '2025-06-23 10:20:50'),
(9, 'Rina Fitriani', 'rina.worker@mmid.com', NULL, '$2y$12$K83keiG.7BpGbRO.mnFkpugqVJfGYZj5XFk2SAjK7Hkzh11gyy8JG', 3, 'Produksi', 'WRK006', NULL, '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(10, 'Doni Kusuma', 'doni.worker@mmid.com', NULL, '$2y$12$kR4mhTFT/6HLO2N87MTF2ueXvWhTldPEDePTFr9FhlXYX2gdUBY.e', 3, 'Teknik', 'WRK007', NULL, '2025-06-23 10:20:51', '2025-06-23 10:20:51'),
(11, 'Maya Indah', 'maya.worker@mmid.com', NULL, '$2y$12$xTsqYxKrZXwRsx3wc09APunBgHFfP2mj/U4BpVDMBRKXuIGhuqE5O', 3, 'Produksi', 'WRK008', NULL, '2025-06-23 10:20:51', '2025-06-23 10:20:51');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `production_schedules`
--
ALTER TABLE `production_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_production_schedule_id_foreign` (`production_schedule_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_production_schedule_id_foreign` (`production_schedule_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `production_schedules`
--
ALTER TABLE `production_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_production_schedule_id_foreign` FOREIGN KEY (`production_schedule_id`) REFERENCES `production_schedules` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_production_schedule_id_foreign` FOREIGN KEY (`production_schedule_id`) REFERENCES `production_schedules` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
