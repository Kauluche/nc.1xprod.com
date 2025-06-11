-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 11 juin 2025 à 14:07
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ka3zhy_naturacorp_luka`
--

-- --------------------------------------------------------

--
-- Structure de la table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `published_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('naturacorp_cache_admin@admin.com|127.0.0.1', 'i:1;', 1749030882),
('naturacorp_cache_admin@admin.com|127.0.0.1:timer', 'i:1749030882;', 1749030882),
('naturacorp_cache_admin@admin.com|2a01:e0a:113:1730:b0c0:6902:b93c:1530', 'i:2;', 1747148151),
('naturacorp_cache_admin@admin.com|2a01:e0a:113:1730:b0c0:6902:b93c:1530:timer', 'i:1747148151;', 1747148151),
('naturacorp_cache_admin@naturacopr.com|93.27.116.95', 'i:2;', 1745390836),
('naturacorp_cache_admin@naturacopr.com|93.27.116.95:timer', 'i:1745390836;', 1745390836);

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contact_submissions`
--

CREATE TABLE `contact_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `rgpd_consent` tinyint(1) NOT NULL DEFAULT 0,
  `rgpd_consent_date` timestamp NULL DEFAULT NULL,
  `data_retention_until` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `commercial_id` bigint(20) UNSIGNED NOT NULL,
  `pharmacy_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `documents`
--

INSERT INTO `documents` (`id`, `title`, `description`, `type`, `file_path`, `commercial_id`, `pharmacy_id`, `created_at`, `updated_at`, `order_id`) VALUES
(11, 'Document 1', 'Description du document 1', 'devis', 'documents/6/document1.pdf', 5, 6, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(12, 'Document 2', 'Description du document 2', 'devis', 'documents/6/document2.pdf', 5, 6, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(13, 'Document 3', 'Description du document 3', 'facture', 'documents/6/document3.pdf', 5, 6, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(14, 'Document 1', 'Description du document 1', 'devis', 'documents/7/document1.pdf', 5, 7, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(15, 'Document 2', 'Description du document 2', 'facture', 'documents/7/document2.pdf', 5, 7, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(16, 'Document 1', 'Description du document 1', 'devis', 'documents/8/document1.pdf', 5, 8, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(17, 'Document 1', 'Description du document 1', 'facture', 'documents/9/document1.pdf', 5, 9, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(18, 'Document 2', 'Description du document 2', 'facture', 'documents/9/document2.pdf', 5, 9, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(19, 'Document 3', 'Description du document 3', 'devis', 'documents/9/document3.pdf', 5, 9, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(20, 'Document 1', 'Description du document 1', 'devis', 'documents/10/document1.pdf', 5, 10, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(21, 'Document 2', 'Description du document 2', 'devis', 'documents/10/document2.pdf', 5, 10, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(22, 'Document 1', 'Description du document 1', 'facture', 'documents/11/document1.pdf', 6, 11, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(23, 'Document 2', 'Description du document 2', 'facture', 'documents/11/document2.pdf', 6, 11, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(24, 'Document 1', 'Description du document 1', 'facture', 'documents/12/document1.pdf', 6, 12, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(25, 'Document 2', 'Description du document 2', 'devis', 'documents/12/document2.pdf', 6, 12, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(26, 'Document 1', 'Description du document 1', 'facture', 'documents/13/document1.pdf', 6, 13, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(27, 'Document 1', 'Description du document 1', 'facture', 'documents/14/document1.pdf', 6, 14, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(28, 'Document 2', 'Description du document 2', 'devis', 'documents/14/document2.pdf', 6, 14, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(29, 'Document 1', 'Description du document 1', 'devis', 'documents/15/document1.pdf', 6, 15, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(30, 'Document 1', 'Description du document 1', 'facture', 'documents/16/document1.pdf', 7, 16, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(31, 'Document 2', 'Description du document 2', 'devis', 'documents/16/document2.pdf', 7, 16, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(32, 'Document 1', 'Description du document 1', 'facture', 'documents/17/document1.pdf', 7, 17, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(33, 'Document 2', 'Description du document 2', 'facture', 'documents/17/document2.pdf', 7, 17, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(34, 'Document 1', 'Description du document 1', 'devis', 'documents/18/document1.pdf', 7, 18, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(35, 'Document 1', 'Description du document 1', 'devis', 'documents/19/document1.pdf', 7, 19, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(36, 'Document 2', 'Description du document 2', 'facture', 'documents/19/document2.pdf', 7, 19, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(37, 'Document 3', 'Description du document 3', 'devis', 'documents/19/document3.pdf', 7, 19, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(38, 'Document 1', 'Description du document 1', 'facture', 'documents/20/document1.pdf', 7, 20, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(39, 'Document 1', 'Description du document 1', 'devis', 'documents/21/document1.pdf', 8, 21, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(40, 'Document 1', 'Description du document 1', 'facture', 'documents/22/document1.pdf', 8, 22, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(41, 'Document 1', 'Description du document 1', 'facture', 'documents/23/document1.pdf', 8, 23, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(42, 'Document 1', 'Description du document 1', 'devis', 'documents/24/document1.pdf', 8, 24, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(43, 'Document 1', 'Description du document 1', 'facture', 'documents/25/document1.pdf', 8, 25, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(44, 'Document 2', 'Description du document 2', 'devis', 'documents/25/document2.pdf', 8, 25, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(45, 'Document 1', 'Description du document 1', 'devis', 'documents/26/document1.pdf', 9, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(46, 'Document 2', 'Description du document 2', 'devis', 'documents/26/document2.pdf', 9, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(47, 'Document 1', 'Description du document 1', 'devis', 'documents/27/document1.pdf', 9, 27, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(48, 'Document 2', 'Description du document 2', 'devis', 'documents/27/document2.pdf', 9, 27, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(49, 'Document 3', 'Description du document 3', 'facture', 'documents/27/document3.pdf', 9, 27, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(50, 'Document 1', 'Description du document 1', 'facture', 'documents/28/document1.pdf', 9, 28, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(51, 'Document 2', 'Description du document 2', 'facture', 'documents/28/document2.pdf', 9, 28, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(52, 'Document 3', 'Description du document 3', 'devis', 'documents/28/document3.pdf', 9, 28, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(53, 'Document 1', 'Description du document 1', 'devis', 'documents/29/document1.pdf', 9, 29, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(54, 'Document 2', 'Description du document 2', 'devis', 'documents/29/document2.pdf', 9, 29, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(55, 'Document 3', 'Description du document 3', 'devis', 'documents/29/document3.pdf', 9, 29, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(56, 'Document 1', 'Description du document 1', 'devis', 'documents/30/document1.pdf', 9, 30, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(57, 'Document 1', 'Description du document 1', 'facture', 'documents/31/document1.pdf', 10, 31, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(58, 'Document 1', 'Description du document 1', 'facture', 'documents/32/document1.pdf', 10, 32, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(59, 'Document 2', 'Description du document 2', 'devis', 'documents/32/document2.pdf', 10, 32, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(60, 'Document 3', 'Description du document 3', 'devis', 'documents/32/document3.pdf', 10, 32, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(61, 'Document 1', 'Description du document 1', 'facture', 'documents/33/document1.pdf', 10, 33, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(62, 'Document 1', 'Description du document 1', 'facture', 'documents/34/document1.pdf', 10, 34, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(63, 'Document 2', 'Description du document 2', 'devis', 'documents/34/document2.pdf', 10, 34, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(64, 'Document 3', 'Description du document 3', 'facture', 'documents/34/document3.pdf', 10, 34, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(65, 'Document 1', 'Description du document 1', 'facture', 'documents/35/document1.pdf', 10, 35, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(66, 'Document 2', 'Description du document 2', 'facture', 'documents/35/document2.pdf', 10, 35, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(67, 'Document 3', 'Description du document 3', 'facture', 'documents/35/document3.pdf', 10, 35, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(68, 'Document 1', 'Description du document 1', 'facture', 'documents/36/document1.pdf', 11, 36, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(69, 'Document 1', 'Description du document 1', 'devis', 'documents/37/document1.pdf', 11, 37, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(70, 'Document 1', 'Description du document 1', 'devis', 'documents/38/document1.pdf', 11, 38, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(71, 'Document 2', 'Description du document 2', 'devis', 'documents/38/document2.pdf', 11, 38, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(72, 'Document 1', 'Description du document 1', 'devis', 'documents/39/document1.pdf', 11, 39, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(73, 'Document 1', 'Description du document 1', 'devis', 'documents/40/document1.pdf', 11, 40, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(74, 'Document 1', 'Description du document 1', 'facture', 'documents/41/document1.pdf', 12, 41, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(75, 'Document 1', 'Description du document 1', 'facture', 'documents/42/document1.pdf', 12, 42, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(76, 'Document 1', 'Description du document 1', 'facture', 'documents/43/document1.pdf', 12, 43, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(77, 'Document 2', 'Description du document 2', 'devis', 'documents/43/document2.pdf', 12, 43, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(78, 'Document 1', 'Description du document 1', 'facture', 'documents/44/document1.pdf', 12, 44, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(79, 'Document 2', 'Description du document 2', 'facture', 'documents/44/document2.pdf', 12, 44, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(80, 'Document 3', 'Description du document 3', 'devis', 'documents/44/document3.pdf', 12, 44, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(81, 'Document 1', 'Description du document 1', 'facture', 'documents/45/document1.pdf', 12, 45, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(82, 'Document 2', 'Description du document 2', 'devis', 'documents/45/document2.pdf', 12, 45, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(83, 'Document 3', 'Description du document 3', 'facture', 'documents/45/document3.pdf', 12, 45, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(84, 'Document 1', 'Description du document 1', 'facture', 'documents/46/document1.pdf', 13, 46, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(85, 'Document 2', 'Description du document 2', 'devis', 'documents/46/document2.pdf', 13, 46, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(86, 'Document 1', 'Description du document 1', 'devis', 'documents/47/document1.pdf', 13, 47, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(87, 'Document 2', 'Description du document 2', 'facture', 'documents/47/document2.pdf', 13, 47, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(88, 'Document 3', 'Description du document 3', 'facture', 'documents/47/document3.pdf', 13, 47, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(89, 'Document 1', 'Description du document 1', 'devis', 'documents/48/document1.pdf', 13, 48, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(90, 'Document 1', 'Description du document 1', 'facture', 'documents/49/document1.pdf', 13, 49, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(91, 'Document 1', 'Description du document 1', 'devis', 'documents/50/document1.pdf', 13, 50, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(92, 'Document 1', 'Description du document 1', 'facture', 'documents/51/document1.pdf', 14, 51, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(93, 'Document 1', 'Description du document 1', 'devis', 'documents/52/document1.pdf', 14, 52, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(94, 'Document 1', 'Description du document 1', 'devis', 'documents/53/document1.pdf', 14, 53, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(95, 'Document 1', 'Description du document 1', 'facture', 'documents/54/document1.pdf', 14, 54, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(96, 'Document 1', 'Description du document 1', 'facture', 'documents/55/document1.pdf', 14, 55, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(97, 'Document 1', 'Description du document 1', 'devis', 'documents/56/document1.pdf', 15, 56, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(98, 'Document 2', 'Description du document 2', 'devis', 'documents/56/document2.pdf', 15, 56, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(99, 'Document 1', 'Description du document 1', 'devis', 'documents/57/document1.pdf', 15, 57, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(100, 'Document 2', 'Description du document 2', 'devis', 'documents/57/document2.pdf', 15, 57, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(101, 'Document 1', 'Description du document 1', 'facture', 'documents/58/document1.pdf', 15, 58, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(102, 'Document 2', 'Description du document 2', 'devis', 'documents/58/document2.pdf', 15, 58, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(103, 'Document 3', 'Description du document 3', 'facture', 'documents/58/document3.pdf', 15, 58, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(104, 'Document 1', 'Description du document 1', 'facture', 'documents/59/document1.pdf', 15, 59, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(105, 'Document 1', 'Description du document 1', 'devis', 'documents/60/document1.pdf', 15, 60, '2025-04-14 13:59:14', '2025-04-14 13:59:14', NULL),
(106, 'Facture #1', NULL, 'invoice', 'documents/facture-1-2025-04-18.pdf', 4, 1, '2025-04-18 19:26:53', '2025-04-18 19:26:53', 1),
(107, 'Test_compteCalorie.pdf', NULL, 'other', 'documents/1745011638_Test_compteCalorie.pdf', 4, 1, '2025-04-18 19:27:18', '2025-04-18 19:27:18', NULL),
(108, 'Facture #17', NULL, 'invoice', 'documents/facture-17-2025-04-19.pdf', 4, 4, '2025-04-19 09:55:38', '2025-04-19 09:55:38', NULL),
(109, 'Facture #227', NULL, 'invoice', 'documents/facture-227-2025-04-19.pdf', 4, NULL, '2025-04-19 09:56:32', '2025-04-19 09:56:32', NULL),
(110, 'Bon de livraison #227', NULL, 'delivery_note', 'documents/bon-livraison-227-2025-04-19.pdf', 4, NULL, '2025-04-19 09:56:41', '2025-04-19 09:56:41', NULL),
(112, 'Facture #1', NULL, 'invoice', 'documents/facture-1-2025-04-20.pdf', 4, 1, '2025-04-20 16:04:49', '2025-04-20 16:04:49', 1),
(113, 'Bon de livraison #1', NULL, 'delivery_note', 'documents/bon-livraison-1-2025-04-20.pdf', 4, 1, '2025-04-20 16:04:56', '2025-04-20 16:04:56', 1),
(114, 'Facture #1', NULL, 'invoice', 'documents/facture-1-2025-04-23.pdf', 4, 1, '2025-04-23 04:47:33', '2025-04-23 04:47:33', 1),
(115, 'Facture #1', NULL, 'invoice', 'documents/facture-1-2025-04-25.pdf', 4, 1, '2025-04-25 14:41:32', '2025-04-25 14:41:32', 1);

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `faq_items`
--

CREATE TABLE `faq_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pharmacy_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_26_000001_create_zones_table', 1),
(5, '2024_03_26_000002_create_pharmacies_table', 1),
(6, '2024_03_26_000003_create_documents_table', 1),
(7, '2024_03_26_000003_create_notifications_table', 1),
(8, '2024_03_29_000001_create_orders_table', 1),
(9, '2024_03_29_000002_create_order_items_table', 1),
(10, '2024_03_29_000002_create_products_table', 1),
(11, '2025_03_26_133005_create_files_table', 1),
(12, '2025_03_26_133113_create_audit_logs_table', 1),
(13, '2025_03_26_133231_create_contact_submissions_table', 1),
(14, '2025_03_26_133400_create_blog_posts_table', 1),
(15, '2025_03_26_133500_create_faq_items_table', 1),
(16, '2025_03_26_133700_add_indexes_for_search', 1),
(17, '2025_03_26_184349_create_personal_access_tokens_table', 1),
(18, '2025_03_27_115617_add_zone_id_to_users_table', 1),
(19, '2025_03_27_120801_modify_commercial_id_in_zones_table', 1),
(20, '2025_03_27_143136_add_fields_to_users_table', 1),
(21, '2025_03_27_170000_add_birth_date_to_users_table', 2),
(22, '2025_04_18_133903_create_newsletter_subscribers_table', 2),
(23, '2025_04_19_000000_add_finess_to_pharmacies_table', 2),
(24, '2025_04_18_203722_add_order_id_to_documents_table', 3);

-- --------------------------------------------------------

--
-- Structure de la table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `newsletter_subscribers`
--

INSERT INTO `newsletter_subscribers` (`id`, `email`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'reda.mazguit@yahoo.com', 1, '2025-04-18 14:18:02', '2025-04-18 14:18:02'),
(2, 'topreda123@gmail.com', 1, '2025-04-18 14:18:22', '2025-04-18 14:18:22'),
(3, 'marieadvg@gmail.com', 1, '2025-04-19 09:50:52', '2025-04-19 09:50:52');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('01964a11-7aca-720a-9963-be351d9d5ec8', 'pharmacy_deletion_rejected', 'App\\Models\\User', 4, '{\"pharmacy_name\":\"REDA MAZGUIT\",\"message\":\"Votre demande de suppression de la pharmacie REDA MAZGUIT a \\u00e9t\\u00e9 rejet\\u00e9e.\"}', NULL, '2025-04-18 16:03:01', '2025-04-18 16:03:01'),
('01964a11-ffe3-7283-a31c-5d0c18ccb968', 'pharmacy_deletion_approved', 'App\\Models\\User', 4, '{\"pharmacy_name\":\"REDA MAZGUIT\",\"message\":\"Votre demande de suppression de la pharmacie REDA MAZGUIT a \\u00e9t\\u00e9 approuv\\u00e9e.\"}', '2025-04-18 16:03:50', '2025-04-18 16:03:35', '2025-04-18 16:03:50'),
('01964a12-e34a-710f-b6f6-1185c7353a72', 'pharmacy_deletion_approved', 'App\\Models\\User', 4, '{\"pharmacy_name\":\"rrrr\",\"message\":\"Votre demande de suppression de la pharmacie rrrr a \\u00e9t\\u00e9 approuv\\u00e9e.\"}', '2025-04-18 18:28:23', '2025-04-18 16:04:33', '2025-04-18 18:28:23'),
('01964a12-eca3-7165-ba09-00009aa4e554', 'pharmacy_deletion_approved', 'App\\Models\\User', 4, '{\"pharmacy_name\":\"REDA MAZGUIT\",\"message\":\"Votre demande de suppression de la pharmacie REDA MAZGUIT a \\u00e9t\\u00e9 approuv\\u00e9e.\"}', '2025-04-18 18:28:21', '2025-04-18 16:04:36', '2025-04-18 18:28:21'),
('01964a12-f05f-72a7-a216-9dea37747c69', 'pharmacy_deletion_approved', 'App\\Models\\User', 4, '{\"pharmacy_name\":\"REDA MAZGUIT\",\"message\":\"Votre demande de suppression de la pharmacie REDA MAZGUIT a \\u00e9t\\u00e9 approuv\\u00e9e.\"}', NULL, '2025-04-18 16:04:37', '2025-04-18 16:04:37'),
('01964a16-dcb4-7154-92fe-2977e1006f4b', 'pharmacy_deletion_request', 'App\\Models\\User', 1, '{\"pharmacy_id\":1,\"pharmacy_name\":\"Pharmacie Dupont 1\",\"commercial_id\":4,\"commercial_first_name\":\"Jean\",\"commercial_last_name\":\"Dupont\",\"message\":\"Le commercial Jean Dupont demande la suppression de la pharmacie Pharmacie Dupont 1\"}', '2025-04-18 16:09:06', '2025-04-18 16:08:54', '2025-04-18 16:09:06'),
('01964a19-b5a5-70bb-beb6-a2d56f1fbacf', 'pharmacy_deletion_request', 'App\\Models\\User', 1, '{\"pharmacy_id\":9,\"pharmacy_name\":\"Pharmacie Martin 4\",\"commercial_id\":5,\"commercial_first_name\":\"Marie\",\"commercial_last_name\":\"Martin\",\"message\":\"Le commercial Marie Martin demande la suppression de la pharmacie Pharmacie Martin 4\"}', '2025-04-18 16:12:45', '2025-04-18 16:12:01', '2025-04-18 16:12:45'),
('01964a7e-a0fa-708b-8cf8-bb8b1af86ce4', 'pharmacy_deletion_approved', 'App\\Models\\User', 4, '{\"pharmacy_name\":\"PHARMACIE LECOCQ\",\"message\":\"Votre demande de suppression de la pharmacie PHARMACIE LECOCQ a \\u00e9t\\u00e9 approuv\\u00e9e.\"}', NULL, '2025-04-18 18:02:14', '2025-04-18 18:02:14'),
('01964a96-3b4c-709f-95b2-fb8021bfcba6', 'pharmacy_deletion_approved', 'App\\Models\\User', 4, '{\"pharmacy_name\":\"PHARM AKBARALY\",\"message\":\"Votre demande de suppression de la pharmacie PHARM AKBARALY a \\u00e9t\\u00e9 approuv\\u00e9e.\"}', '2025-04-19 09:57:59', '2025-04-18 18:28:01', '2025-04-19 09:57:59'),
('01964a96-3e40-70f8-a0ca-456625c79010', 'pharmacy_deletion_approved', 'App\\Models\\User', 4, '{\"pharmacy_name\":\"PHARM S.N.C. COUQUET-CHOPLIN\",\"message\":\"Votre demande de suppression de la pharmacie PHARM S.N.C. COUQUET-CHOPLIN a \\u00e9t\\u00e9 approuv\\u00e9e.\"}', '2025-04-18 19:27:45', '2025-04-18 18:28:02', '2025-04-18 19:27:45'),
('01964de9-f8e0-72c1-ba70-d17a2ff9bed2', 'pharmacy_deletion_approved', 'App\\Models\\User', 4, '{\"pharmacy_name\":\"Pharmacie Dupont 2\",\"message\":\"Votre demande de suppression de la pharmacie Pharmacie Dupont 2 a \\u00e9t\\u00e9 approuv\\u00e9e.\"}', NULL, '2025-04-19 09:58:21', '2025-04-19 09:58:21'),
('01964df6-1ed8-73e4-b525-f92a37fb9a88', 'pharmacy_deletion_approved', 'App\\Models\\User', 5, '{\"pharmacy_name\":\"REDA MAZGUIT\",\"message\":\"Votre demande de suppression de la pharmacie REDA MAZGUIT a \\u00e9t\\u00e9 approuv\\u00e9e.\"}', NULL, '2025-04-19 10:11:37', '2025-04-19 10:11:37'),
('01964df6-21f2-709e-af6f-fc72748f186b', 'pharmacy_deletion_approved', 'App\\Models\\User', 5, '{\"pharmacy_name\":\"Pharmacie Richard 1\",\"message\":\"Votre demande de suppression de la pharmacie Pharmacie Richard 1 a \\u00e9t\\u00e9 approuv\\u00e9e.\"}', NULL, '2025-04-19 10:11:38', '2025-04-19 10:11:38'),
('01966146-2b59-72bf-88fe-5d8393e10860', 'pharmacy_deletion_approved', 'App\\Models\\User', 4, '{\"pharmacy_name\":\"rrr\",\"message\":\"Votre demande de suppression de la pharmacie rrr a \\u00e9t\\u00e9 approuv\\u00e9e.\"}', '2025-04-23 08:03:03', '2025-04-23 04:11:50', '2025-04-23 08:03:03');

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pharmacy_id` bigint(20) UNSIGNED NOT NULL,
  `commercial_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `pharmacy_id`, `commercial_id`, `status`, `total`, `discount`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'completed', 523.00, 61.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(2, 1, 4, 'pending', 815.00, 9.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(3, 1, 4, 'completed', 906.00, 91.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(4, 1, 4, 'completed', 773.00, 18.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(5, 1, 4, 'completed', 865.00, 1.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(11, 3, 4, 'pending', 292.00, 83.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(12, 3, 4, 'pending', 979.00, 30.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(13, 3, 4, 'completed', 231.00, 87.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(14, 3, 4, 'pending', 709.00, 69.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(15, 3, 4, 'completed', 429.00, 69.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(16, 4, 4, 'completed', 320.00, 14.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(21, 5, 4, 'completed', 226.00, 75.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(22, 5, 4, 'completed', 850.00, 32.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-18 16:48:11'),
(23, 5, 4, 'completed', 277.00, 69.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(25, 5, 4, 'completed', 534.00, 66.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 16:58:52'),
(26, 6, 5, 'completed', 600.00, 49.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(27, 6, 5, 'completed', 708.00, 83.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(28, 6, 5, 'completed', 753.00, 75.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(29, 6, 5, 'pending', 155.00, 76.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(30, 6, 5, 'pending', 650.00, 54.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(31, 7, 5, 'completed', 317.00, 61.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(32, 7, 5, 'completed', 331.00, 37.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(33, 7, 5, 'pending', 208.00, 72.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(34, 7, 5, 'completed', 905.00, 12.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(35, 8, 5, 'completed', 704.00, 21.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(36, 8, 5, 'completed', 429.00, 2.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(37, 9, 5, 'completed', 703.00, 29.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(38, 9, 5, 'pending', 975.00, 21.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(39, 9, 5, 'completed', 994.00, 41.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(40, 9, 5, 'pending', 819.00, 99.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(41, 10, 5, 'pending', 911.00, 25.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(42, 10, 5, 'pending', 502.00, 81.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(43, 10, 5, 'completed', 890.00, 48.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(44, 10, 5, 'pending', 609.00, 9.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(45, 10, 5, 'completed', 263.00, 43.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(46, 11, 6, 'pending', 442.00, 15.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(47, 11, 6, 'completed', 523.00, 61.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(48, 11, 6, 'completed', 814.00, 34.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(49, 11, 6, 'pending', 553.00, 79.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(50, 12, 6, 'completed', 613.00, 39.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(51, 12, 6, 'pending', 110.00, 46.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(52, 13, 6, 'completed', 302.00, 81.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(53, 13, 6, 'pending', 942.00, 62.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(54, 13, 6, 'pending', 926.00, 81.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(55, 14, 6, 'pending', 852.00, 82.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(56, 14, 6, 'pending', 797.00, 73.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(57, 15, 6, 'pending', 682.00, 49.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(58, 15, 6, 'completed', 328.00, 100.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(59, 16, 7, 'completed', 505.00, 77.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(60, 16, 7, 'completed', 603.00, 53.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(61, 16, 7, 'pending', 852.00, 36.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(62, 16, 7, 'completed', 375.00, 90.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(63, 17, 7, 'completed', 880.00, 75.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(64, 17, 7, 'pending', 659.00, 50.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(65, 17, 7, 'pending', 601.00, 66.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(66, 18, 7, 'pending', 803.00, 18.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(67, 18, 7, 'pending', 944.00, 40.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(68, 18, 7, 'pending', 735.00, 42.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(69, 18, 7, 'completed', 826.00, 73.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(70, 19, 7, 'pending', 868.00, 79.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(71, 19, 7, 'completed', 580.00, 7.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(72, 19, 7, 'pending', 255.00, 68.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(73, 20, 7, 'completed', 651.00, 68.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(74, 20, 7, 'completed', 577.00, 80.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(75, 20, 7, 'pending', 239.00, 50.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(76, 20, 7, 'pending', 163.00, 84.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(77, 21, 8, 'pending', 277.00, 69.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(78, 21, 8, 'completed', 835.00, 25.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(79, 21, 8, 'completed', 805.00, 89.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(80, 22, 8, 'completed', 376.00, 23.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(81, 22, 8, 'completed', 214.00, 14.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(82, 22, 8, 'completed', 262.00, 36.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(83, 23, 8, 'completed', 803.00, 56.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(84, 23, 8, 'completed', 520.00, 34.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(85, 23, 8, 'completed', 541.00, 15.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(86, 23, 8, 'pending', 960.00, 89.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(87, 23, 8, 'completed', 997.00, 82.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(88, 24, 8, 'pending', 764.00, 67.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(89, 24, 8, 'pending', 709.00, 34.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(90, 25, 8, 'pending', 230.00, 75.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(91, 25, 8, 'pending', 665.00, 86.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(92, 25, 8, 'pending', 946.00, 57.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(93, 25, 8, 'completed', 668.00, 99.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(94, 25, 8, 'pending', 463.00, 93.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(100, 27, 9, 'completed', 394.00, 4.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(101, 27, 9, 'completed', 526.00, 41.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(102, 27, 9, 'completed', 305.00, 98.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(103, 27, 9, 'completed', 408.00, 0.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(104, 27, 9, 'pending', 677.00, 22.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(105, 28, 9, 'pending', 922.00, 69.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(106, 28, 9, 'pending', 441.00, 18.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(107, 28, 9, 'pending', 480.00, 47.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(108, 29, 9, 'completed', 696.00, 48.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(109, 29, 9, 'pending', 388.00, 83.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(110, 30, 9, 'pending', 952.00, 20.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(111, 30, 9, 'pending', 862.00, 35.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(112, 30, 9, 'pending', 207.00, 85.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(113, 30, 9, 'pending', 247.00, 5.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(114, 30, 9, 'pending', 964.00, 72.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(115, 31, 10, 'completed', 905.00, 68.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(116, 31, 10, 'completed', 366.00, 38.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(117, 31, 10, 'completed', 439.00, 40.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(118, 31, 10, 'pending', 410.00, 62.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(119, 32, 10, 'completed', 902.00, 45.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(120, 32, 10, 'pending', 267.00, 89.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(121, 33, 10, 'completed', 975.00, 34.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(122, 33, 10, 'completed', 629.00, 44.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(123, 34, 10, 'completed', 976.00, 22.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(124, 34, 10, 'pending', 532.00, 81.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(125, 34, 10, 'pending', 664.00, 55.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(126, 34, 10, 'completed', 153.00, 18.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(127, 34, 10, 'completed', 739.00, 71.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(128, 35, 10, 'completed', 525.00, 85.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(129, 35, 10, 'completed', 370.00, 56.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(130, 35, 10, 'completed', 807.00, 47.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(131, 35, 10, 'pending', 730.00, 74.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(132, 35, 10, 'completed', 186.00, 57.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(133, 36, 11, 'completed', 485.00, 39.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(134, 36, 11, 'pending', 533.00, 64.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(135, 36, 11, 'completed', 539.00, 7.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(136, 36, 11, 'pending', 276.00, 17.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(137, 37, 11, 'pending', 162.00, 30.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(138, 37, 11, 'pending', 555.00, 82.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(139, 38, 11, 'pending', 263.00, 73.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(140, 38, 11, 'pending', 290.00, 73.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(141, 38, 11, 'pending', 368.00, 61.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(142, 38, 11, 'pending', 198.00, 27.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(143, 38, 11, 'completed', 589.00, 64.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(144, 39, 11, 'pending', 474.00, 45.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(145, 39, 11, 'completed', 675.00, 76.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(146, 39, 11, 'completed', 198.00, 87.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(147, 40, 11, 'completed', 376.00, 27.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(148, 40, 11, 'completed', 975.00, 43.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(149, 40, 11, 'pending', 261.00, 5.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(150, 41, 12, 'completed', 472.00, 98.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(151, 41, 12, 'pending', 975.00, 84.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(152, 41, 12, 'completed', 762.00, 71.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(153, 41, 12, 'completed', 492.00, 53.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(154, 42, 12, 'pending', 446.00, 70.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(155, 42, 12, 'completed', 253.00, 13.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(156, 43, 12, 'pending', 206.00, 60.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(157, 43, 12, 'completed', 608.00, 77.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(158, 43, 12, 'pending', 354.00, 0.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(159, 44, 12, 'pending', 568.00, 49.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(160, 44, 12, 'pending', 423.00, 1.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(161, 44, 12, 'completed', 931.00, 4.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(162, 44, 12, 'pending', 714.00, 46.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(163, 45, 12, 'pending', 153.00, 96.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(164, 45, 12, 'pending', 384.00, 37.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(165, 45, 12, 'pending', 139.00, 83.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(166, 45, 12, 'completed', 888.00, 34.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(167, 45, 12, 'pending', 373.00, 61.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(168, 46, 13, 'completed', 810.00, 39.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(169, 46, 13, 'pending', 160.00, 67.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(170, 46, 13, 'pending', 482.00, 58.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(171, 46, 13, 'pending', 347.00, 13.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(172, 46, 13, 'completed', 389.00, 58.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(173, 47, 13, 'completed', 270.00, 19.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(174, 47, 13, 'completed', 958.00, 52.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(175, 47, 13, 'completed', 912.00, 62.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(176, 47, 13, 'completed', 393.00, 31.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(177, 48, 13, 'pending', 783.00, 83.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(178, 48, 13, 'pending', 190.00, 81.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(179, 49, 13, 'pending', 771.00, 15.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(180, 49, 13, 'completed', 661.00, 62.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(181, 49, 13, 'completed', 617.00, 29.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(182, 49, 13, 'completed', 949.00, 79.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(183, 49, 13, 'completed', 127.00, 85.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(184, 50, 13, 'pending', 566.00, 13.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(185, 50, 13, 'completed', 660.00, 64.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(186, 50, 13, 'pending', 593.00, 42.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(187, 50, 13, 'pending', 331.00, 48.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(188, 51, 14, 'pending', 993.00, 13.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(189, 51, 14, 'pending', 104.00, 31.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(190, 51, 14, 'pending', 186.00, 78.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(191, 51, 14, 'pending', 971.00, 81.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(192, 51, 14, 'completed', 948.00, 81.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(193, 52, 14, 'pending', 338.00, 69.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(194, 52, 14, 'pending', 136.00, 16.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(195, 52, 14, 'completed', 279.00, 11.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(196, 52, 14, 'pending', 957.00, 43.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(197, 53, 14, 'completed', 836.00, 31.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(198, 53, 14, 'pending', 462.00, 7.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(199, 53, 14, 'completed', 546.00, 37.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(200, 53, 14, 'completed', 281.00, 16.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(201, 54, 14, 'pending', 499.00, 7.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(202, 54, 14, 'pending', 934.00, 56.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(203, 54, 14, 'pending', 851.00, 31.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(204, 54, 14, 'completed', 367.00, 97.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(205, 55, 14, 'pending', 880.00, 68.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(206, 55, 14, 'pending', 109.00, 53.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(207, 56, 15, 'pending', 369.00, 41.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(208, 56, 15, 'completed', 801.00, 18.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(209, 57, 15, 'pending', 388.00, 76.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(210, 57, 15, 'pending', 584.00, 49.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(211, 57, 15, 'completed', 634.00, 67.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(212, 57, 15, 'pending', 910.00, 1.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(213, 57, 15, 'completed', 524.00, 76.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(214, 58, 15, 'pending', 480.00, 95.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(215, 58, 15, 'pending', 735.00, 50.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(216, 58, 15, 'pending', 473.00, 32.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(217, 59, 15, 'pending', 592.00, 31.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(218, 59, 15, 'pending', 944.00, 5.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(219, 60, 15, 'pending', 212.00, 49.00, 'Note pour la commande 1', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(220, 60, 15, 'completed', 258.00, 47.00, 'Note pour la commande 2', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(221, 60, 15, 'pending', 166.00, 62.00, 'Note pour la commande 3', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(222, 60, 15, 'pending', 556.00, 84.00, 'Note pour la commande 4', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(223, 60, 15, 'completed', 874.00, 14.00, 'Note pour la commande 5', '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(228, 3, 4, 'completed', 15000.00, 0.00, NULL, '2025-04-19 10:10:31', '2025-04-19 10:10:31'),
(232, 3, 4, 'completed', 18000.00, 0.00, '1000', '2025-06-11 06:01:06', '2025-06-11 06:01:06');

-- --------------------------------------------------------

--
-- Structure de la table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_reference` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `discount_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_name`, `product_reference`, `quantity`, `unit_price`, `discount_percentage`, `total`, `notes`, `created_at`, `updated_at`) VALUES
(5, 228, 'Mush Blue', 'MB-001', 1000, 15.00, 0.00, 15000.00, NULL, '2025-04-19 10:10:31', '2025-04-19 10:10:31'),
(9, 232, 'Mush Blue', 'MB-001', 1200, 15.00, 0.00, 18000.00, NULL, '2025-06-11 06:01:06', '2025-06-11 06:01:06');

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pharmacies`
--

CREATE TABLE `pharmacies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `finess` varchar(255) DEFAULT NULL,
  `status` enum('prospect','client') NOT NULL DEFAULT 'prospect',
  `commercial_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `monthly_goal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pharmacies`
--

INSERT INTO `pharmacies` (`id`, `name`, `address`, `city`, `postal_code`, `phone`, `email`, `finess`, `status`, `commercial_id`, `zone_id`, `monthly_goal`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'Pharmacie Dupont 1', '139 Rue de la Marne', 'Éragny', '95610', '0123456781', 'pharmacie1@example.com', NULL, 'client', 4, 1, 8000.00, 49.01586200, 2.10931000, '2025-04-14 13:59:14', '2025-04-18 18:12:29'),
(3, 'Pharmacie Dupont 3', '90 Boulevard Félix Faure', 'Aubervilliers', '93300', '0123456783', 'pharmacie3@example.com', NULL, 'client', 4, 1, 1000.00, 48.90586500, 2.38093900, '2025-04-14 13:59:14', '2025-04-18 16:45:17'),
(4, 'Pharmacie Dupont 4', 'Sarcelles', 'Sarcelles', '95200', '0123456784', 'pharmacie4@example.com', NULL, 'client', 4, 1, 0.00, 48.99131900, 2.38241200, '2025-04-14 13:59:14', '2025-04-18 16:46:08'),
(5, 'Pharmacie Dupont 5', 'Eaubonne', 'Eaubonne', '95600', '0123456785', 'pharmacie5@example.com', NULL, 'client', 4, 1, 10000.00, 48.98471800, 2.27714800, '2025-04-14 13:59:14', '2025-04-18 16:47:16'),
(6, 'Pharmacie Martin 1', 'Adresse 1', 'Ville 1', '75001', '0123456781', 'pharmacie1@example.com', NULL, 'prospect', 5, 2, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(7, 'Pharmacie Martin 2', 'Adresse 2', 'Ville 2', '75002', '0123456782', 'pharmacie2@example.com', NULL, 'prospect', 5, 2, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(8, 'Pharmacie Martin 3', 'Adresse 3', 'Ville 3', '75003', '0123456783', 'pharmacie3@example.com', NULL, 'prospect', 5, 2, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(9, 'Pharmacie Martin 4', 'Adresse 4', 'Ville 4', '75004', '0123456784', 'pharmacie4@example.com', NULL, 'prospect', 5, 2, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(10, 'Pharmacie Martin 5', 'Adresse 5', 'Ville 5', '75005', '0123456785', 'pharmacie5@example.com', NULL, 'prospect', 5, 2, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(11, 'Pharmacie Bernard 1', 'Adresse 1', 'Ville 1', '75001', '0123456781', 'pharmacie1@example.com', NULL, 'prospect', 6, 3, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(12, 'Pharmacie Bernard 2', 'Adresse 2', 'Ville 2', '75002', '0123456782', 'pharmacie2@example.com', NULL, 'prospect', 6, 3, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(13, 'Pharmacie Bernard 3', 'Adresse 3', 'Ville 3', '75003', '0123456783', 'pharmacie3@example.com', NULL, 'prospect', 6, 3, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(14, 'Pharmacie Bernard 4', 'Adresse 4', 'Ville 4', '75004', '0123456784', 'pharmacie4@example.com', NULL, 'prospect', 6, 3, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(15, 'Pharmacie Bernard 5', 'Adresse 5', 'Ville 5', '75005', '0123456785', 'pharmacie5@example.com', NULL, 'prospect', 6, 3, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(16, 'Pharmacie Petit 1', 'Adresse 1', 'Ville 1', '75001', '0123456781', 'pharmacie1@example.com', NULL, 'prospect', 7, 4, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(17, 'Pharmacie Petit 2', 'Adresse 2', 'Ville 2', '75002', '0123456782', 'pharmacie2@example.com', NULL, 'prospect', 7, 4, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(18, 'Pharmacie Petit 3', 'Adresse 3', 'Ville 3', '75003', '0123456783', 'pharmacie3@example.com', NULL, 'prospect', 7, 4, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(19, 'Pharmacie Petit 4', 'Adresse 4', 'Ville 4', '75004', '0123456784', 'pharmacie4@example.com', NULL, 'prospect', 7, 4, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(20, 'Pharmacie Petit 5', 'Adresse 5', 'Ville 5', '75005', '0123456785', 'pharmacie5@example.com', NULL, 'prospect', 7, 4, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(21, 'Pharmacie Robert 1', 'Adresse 1', 'Ville 1', '75001', '0123456781', 'pharmacie1@example.com', NULL, 'prospect', 8, 5, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(22, 'Pharmacie Robert 2', 'Adresse 2', 'Ville 2', '75002', '0123456782', 'pharmacie2@example.com', NULL, 'prospect', 8, 5, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(23, 'Pharmacie Robert 3', 'Adresse 3', 'Ville 3', '75003', '0123456783', 'pharmacie3@example.com', NULL, 'prospect', 8, 5, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(24, 'Pharmacie Robert 4', 'Adresse 4', 'Ville 4', '75004', '0123456784', 'pharmacie4@example.com', NULL, 'prospect', 8, 5, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(25, 'Pharmacie Robert 5', 'Adresse 5', 'Ville 5', '75005', '0123456785', 'pharmacie5@example.com', NULL, 'prospect', 8, 5, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(27, 'Pharmacie Richard 2', 'Adresse 2', 'Ville 2', '75002', '0123456782', 'pharmacie2@example.com', NULL, 'prospect', 9, 6, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(28, 'Pharmacie Richard 3', '1 Rue Judaïque', 'Bordeaux', '33000', '0123456783', 'pharmacie3@example.com', NULL, 'prospect', 9, 6, 0.00, 44.84167300, -0.58128700, '2025-04-14 13:59:14', '2025-04-19 10:05:51'),
(29, 'Pharmacie Richard 4', 'Adresse 4', 'Ville 4', '75004', '0123456784', 'pharmacie4@example.com', NULL, 'prospect', 9, 6, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(30, 'Pharmacie Richard 5', 'Adresse 5', 'Ville 5', '75005', '0123456785', 'pharmacie5@example.com', NULL, 'prospect', 9, 6, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(31, 'Pharmacie Dubois 1', 'Adresse 1', 'Ville 1', '75001', '0123456781', 'pharmacie1@example.com', NULL, 'prospect', 10, 7, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(32, 'Pharmacie Dubois 2', 'Adresse 2', 'Ville 2', '75002', '0123456782', 'pharmacie2@example.com', NULL, 'prospect', 10, 7, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(33, 'Pharmacie Dubois 3', 'Adresse 3', 'Ville 3', '75003', '0123456783', 'pharmacie3@example.com', NULL, 'prospect', 10, 7, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(34, 'Pharmacie Dubois 4', 'Adresse 4', 'Ville 4', '75004', '0123456784', 'pharmacie4@example.com', NULL, 'prospect', 10, 7, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(35, 'Pharmacie Dubois 5', 'Adresse 5', 'Ville 5', '75005', '0123456785', 'pharmacie5@example.com', NULL, 'prospect', 10, 7, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(36, 'Pharmacie Moreau 1', 'Adresse 1', 'Ville 1', '75001', '0123456781', 'pharmacie1@example.com', NULL, 'prospect', 11, 8, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(37, 'Pharmacie Moreau 2', 'Adresse 2', 'Ville 2', '75002', '0123456782', 'pharmacie2@example.com', NULL, 'prospect', 11, 8, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(38, 'Pharmacie Moreau 3', 'Adresse 3', 'Ville 3', '75003', '0123456783', 'pharmacie3@example.com', NULL, 'prospect', 11, 8, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(39, 'Pharmacie Moreau 4', 'Adresse 4', 'Ville 4', '75004', '0123456784', 'pharmacie4@example.com', NULL, 'prospect', 11, 8, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(40, 'Pharmacie Moreau 5', 'Adresse 5', 'Ville 5', '75005', '0123456785', 'pharmacie5@example.com', NULL, 'prospect', 11, 8, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(41, 'Pharmacie Laurent 1', 'Adresse 1', 'Ville 1', '75001', '0123456781', 'pharmacie1@example.com', NULL, 'prospect', 12, 9, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(42, 'Pharmacie Laurent 2', 'Adresse 2', 'Ville 2', '75002', '0123456782', 'pharmacie2@example.com', NULL, 'prospect', 12, 9, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(43, 'Pharmacie Laurent 3', 'Adresse 3', 'Ville 3', '75003', '0123456783', 'pharmacie3@example.com', NULL, 'prospect', 12, 9, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(44, 'Pharmacie Laurent 4', 'Adresse 4', 'Ville 4', '75004', '0123456784', 'pharmacie4@example.com', NULL, 'prospect', 12, 9, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(45, 'Pharmacie Laurent 5', 'Adresse 5', 'Ville 5', '75005', '0123456785', 'pharmacie5@example.com', NULL, 'prospect', 12, 9, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(46, 'Pharmacie Simon 1', 'Adresse 1', 'Ville 1', '75001', '0123456781', 'pharmacie1@example.com', NULL, 'prospect', 13, 10, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(47, 'Pharmacie Simon 2', 'Adresse 2', 'Ville 2', '75002', '0123456782', 'pharmacie2@example.com', NULL, 'prospect', 13, 10, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(48, 'Pharmacie Simon 3', 'Adresse 3', 'Ville 3', '75003', '0123456783', 'pharmacie3@example.com', NULL, 'prospect', 13, 10, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(49, 'Pharmacie Simon 4', 'Adresse 4', 'Ville 4', '75004', '0123456784', 'pharmacie4@example.com', NULL, 'prospect', 13, 10, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(50, 'Pharmacie Simon 5', 'Adresse 5', 'Ville 5', '75005', '0123456785', 'pharmacie5@example.com', NULL, 'prospect', 13, 10, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(51, 'Pharmacie Michel 1', 'Adresse 1', 'Ville 1', '75001', '0123456781', 'pharmacie1@example.com', NULL, 'prospect', 14, 11, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(52, 'Pharmacie Michel 2', 'Adresse 2', 'Ville 2', '75002', '0123456782', 'pharmacie2@example.com', NULL, 'prospect', 14, 11, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(53, 'Pharmacie Michel 3', 'Adresse 3', 'Ville 3', '75003', '0123456783', 'pharmacie3@example.com', NULL, 'prospect', 14, 11, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(54, 'Pharmacie Michel 4', 'Adresse 4', 'Ville 4', '75004', '0123456784', 'pharmacie4@example.com', NULL, 'prospect', 14, 11, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(55, 'Pharmacie Michel 5', 'Adresse 5', 'Ville 5', '75005', '0123456785', 'pharmacie5@example.com', NULL, 'prospect', 14, 11, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(56, 'Pharmacie Leroy 1', 'Adresse 1', 'Ville 1', '75001', '0123456781', 'pharmacie1@example.com', NULL, 'prospect', 15, 12, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(57, 'Pharmacie Leroy 2', 'Adresse 2', 'Ville 2', '75002', '0123456782', 'pharmacie2@example.com', NULL, 'prospect', 15, 12, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(58, 'Pharmacie Leroy 3', 'Adresse 3', 'Ville 3', '75003', '0123456783', 'pharmacie3@example.com', NULL, 'prospect', 15, 12, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(59, 'Pharmacie Leroy 4', 'Adresse 4', 'Ville 4', '75004', '0123456784', 'pharmacie4@example.com', NULL, 'prospect', 15, 12, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(60, 'Pharmacie Leroy 5', 'Adresse 5', 'Ville 5', '75005', '0123456785', 'pharmacie5@example.com', NULL, 'prospect', 15, 12, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14'),
(64, 'Pharmacie du coin', '1 Rue Sainte Marie', 'Saint-Denis', '97400', '099876543', '87654@HGf.vom', NULL, 'client', 5, 2, 7654.00, -20.88474200, 55.44735000, '2025-04-18 14:55:19', '2025-04-18 14:55:19'),
(66, 'REDA MAZGUIT', '48bis Avenue de Verdun', 'Cestas', '33610', '0764026875', 'reda.mazguit@yahoo.com', NULL, 'client', 5, 2, 4444.00, 44.77523400, -0.69511800, '2025-04-18 16:41:28', '2025-04-18 16:41:28'),
(70, 'PHARM VAUTHIER M A', '50 AVENUE DU MARECHAL FOCH', 'ARGENTEUIL CEDEX', '95813', '01 39 61 02 06', '', NULL, 'prospect', 4, 1, 0.00, 48.94400000, 2.25407000, '2025-04-18 18:21:33', '2025-04-18 18:21:33'),
(71, 'PHARM POMMIER THEULIER', '4 AVENUE HENRI BARBUSSE', 'GAGNY', '93220', '01 43 81 09 96', '', NULL, 'prospect', 4, 1, 0.00, 48.88460000, 2.53357000, '2025-04-18 18:28:47', '2025-04-18 18:28:47'),
(72, 'PHARM VIDAL VERONIQUE', '42 AVENUE D ALIGRE', 'AULNAY SOUS BOIS', '93600', '01 48 79 23 97', '', NULL, 'prospect', 4, 1, 0.00, 48.92270000, 2.49726000, '2025-04-19 09:55:08', '2025-04-19 09:55:08'),
(73, 'Pharmacie Saint-Anne', '43 Rue de Louvois', 'Reims', '51100', '01 45 67 89 00', '', NULL, 'prospect', 5, 6, 0.00, NULL, NULL, '2025-04-19 10:02:35', '2025-04-19 10:02:35'),
(75, 'PHARMACIE DU MARCHE', '2 AVENUE GALLIENI', 'BOIS LE ROI', '77590', '01 60 69 12 65', '', NULL, 'prospect', 5, 6, 0.00, 48.47440000, 2.69274000, '2025-04-19 10:08:01', '2025-04-19 10:08:01'),
(76, 'PHARM GARAT RABAIN & GOMBEAU', '5 RUE DE L HOTEL DIEU', 'GONESSE', '95500', '01 39 85 66 67', '', NULL, 'prospect', 5, 6, 0.00, 48.98670000, 2.44862000, '2025-04-19 10:08:15', '2025-04-19 10:08:15');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','commercial') NOT NULL DEFAULT 'commercial',
  `hire_date` date DEFAULT NULL,
  `monthly_goal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gender` enum('M','F','O') DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `birth_date`, `email_verified_at`, `password`, `role`, `hire_date`, `monthly_goal`, `last_login_at`, `remember_token`, `created_at`, `updated_at`, `zone_id`, `gender`, `address`, `city`, `postal_code`, `department`, `position`, `two_factor_enabled`) VALUES
(1, 'Admin', 'Principal', 'admin@naturacorp.com', NULL, NULL, NULL, '$2y$12$AIOu2zxKUbVoH7ieajyFkOmNLwhaOopGMiuMDYxGWwWTARgC2IQIu', 'admin', NULL, 0.00, NULL, 'sz1fQmPCtC0cTbI25uLqqP82x1P4iorr0VxOKdlKqcrCYUxrM0OuXIwUmiXO', '2025-04-14 13:59:12', '2025-04-14 13:59:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 'Admin', 'Support', 'support@naturacorp.com', NULL, NULL, NULL, '$2y$12$yEhmxyOBHZ/1ChKh7gukJuqFunGvwxwTOvSX8tcvDbNwcOVpDuzKm', 'admin', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:12', '2025-04-14 13:59:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 'Admin', 'Technique', 'tech@naturacorp.com', NULL, NULL, NULL, '$2y$12$pK4Dl/psvwO8ZBJVhyovou/5JTEQxsSj1tIKTQLRASRxKycDnhXrW', 'admin', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:12', '2025-04-14 13:59:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 'Jean', 'Dupont', 'jean.dupont@naturacorp.com', NULL, NULL, NULL, '$2y$12$96uKTOdQhwYduTHlHsWdZeI62C2Lc3X7evFPRdQkfA/jLgS3cXt8O', 'commercial', NULL, 0.00, NULL, 'kTFIy4y3iPZiEy9E5elS54ftZx6TbdAB4VpAMYoPeToL8VapAUL9eBGYld8E', '2025-04-14 13:59:12', '2025-04-14 13:59:12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'Marie', 'Martin', 'marie.martin@naturacorp.com', NULL, NULL, NULL, '$2y$12$42XiVZZxMzA5pXtoCl2btu9Dx1kfjfmCary41cKFwPd1u7RNrH64u', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:12', '2025-04-19 10:00:21', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 'Pierre', 'Bernard', 'pierre.bernard@naturacorp.com', NULL, NULL, NULL, '$2y$12$WV9ngezuORacgrS/ftkMvekv7tDQdsifroo5HUaXu6321Vq0W/Rra', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:12', '2025-04-14 13:59:12', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 'Sophie', 'Petit', 'sophie.petit@naturacorp.com', NULL, NULL, NULL, '$2y$12$E6aPCYEOl.YVJ1frD/2FPeCMkEBscQsVxBSiEbPvT2alJZQNXo6Iu', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:13', '2025-04-14 13:59:13', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 'Lucas', 'Robert', 'lucas.robert@naturacorp.com', NULL, NULL, NULL, '$2y$12$oEZ7xG23lquwPKGD1zDgb.WdaxJYCV.4pezUV/hxsGkufsO9eswYC', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:13', '2025-04-14 13:59:13', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 'Emma', 'Richard', 'emma.richard@naturacorp.com', NULL, NULL, NULL, '$2y$12$NFQb3ldbhwzWH89uXAUUterrLcnneBLYwboOduvSF.YOQaAuM8WOy', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:13', '2025-04-19 10:00:21', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 'Thomas', 'Dubois', 'thomas.dubois@naturacorp.com', NULL, NULL, NULL, '$2y$12$ErjgchBK6FcTl.h6r2z.Ee9U9kzgcbz4GgfDUOGjLAiCCczXzFfO6', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:13', '2025-04-14 13:59:13', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 'Julie', 'Moreau', 'julie.moreau@naturacorp.com', NULL, NULL, NULL, '$2y$12$fr4OymdpABhg.IvBnUZUp.xCMLENM9oJlrv4ttg6ihCRPRc3co6yi', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:13', '2025-04-14 13:59:13', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(12, 'Antoine', 'Laurent', 'antoine.laurent@naturacorp.com', NULL, NULL, NULL, '$2y$12$htRiV0PWO5HNXAxPnaSzfeHYsBSkmyZdNEiuXXbBADtflsJ/GFppy', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(13, 'Clara', 'Simon', 'clara.simon@naturacorp.com', NULL, NULL, NULL, '$2y$12$lGcQB11f7v74xeZrXl34G.cuuofx86cz3/JobV.wcC6JKmErLcCt6', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14', 10, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(14, 'Hugo', 'Michel', 'hugo.michel@naturacorp.com', NULL, NULL, NULL, '$2y$12$ssalUoF8Mj00kSaXgZy1Uu2qm1uNNBYUelR/y/oPOUhJFFKTp0gfa', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14', 11, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(15, 'Léa', 'Leroy', 'léa.leroy@naturacorp.com', NULL, NULL, NULL, '$2y$12$yw1HhbPsH15retbxfZpmP.yBAeLlspai8aB/eOZpSeCQSvAovg5Ey', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-14 13:59:14', '2025-04-14 13:59:14', 12, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(16, 'test', 'user', 'test.user@naturacorp.com', NULL, NULL, NULL, '$2y$12$DUquZrHggFAivBa0liIlBuh3VPmn8pWn7AHOKUGRNhKpRWA4Cz88O', 'commercial', NULL, 0.00, NULL, NULL, '2025-04-22 15:31:04', '2025-04-22 15:31:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `commercial_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `zones`
--

INSERT INTO `zones` (`id`, `name`, `description`, `commercial_id`, `created_at`, `updated_at`) VALUES
(1, 'Paris Nord', 'Zone couvrant le nord de Paris', 4, '2025-04-14 13:59:11', '2025-04-14 13:59:12'),
(2, 'Paris Sud', 'Zone couvrant le sud de Paris', 9, '2025-04-14 13:59:11', '2025-04-19 10:00:21'),
(3, 'Lyon Centre', 'Zone couvrant le centre de Lyon', 6, '2025-04-14 13:59:11', '2025-04-14 13:59:12'),
(4, 'Lyon Est', 'Zone couvrant l\'est de Lyon', 7, '2025-04-14 13:59:11', '2025-04-14 13:59:13'),
(5, 'Marseille Nord', 'Zone couvrant le nord de Marseille', 8, '2025-04-14 13:59:11', '2025-04-14 13:59:13'),
(6, 'Marseille Sud', 'Zone couvrant le sud de Marseille', 5, '2025-04-14 13:59:11', '2025-04-19 10:00:21'),
(7, 'Bordeaux Centre', 'Zone couvrant le centre de Bordeaux', 10, '2025-04-14 13:59:11', '2025-04-14 13:59:13'),
(8, 'Bordeaux Ouest', 'Zone couvrant l\'ouest de Bordeaux', 11, '2025-04-14 13:59:11', '2025-04-14 13:59:13'),
(9, 'Toulouse Est', 'Zone couvrant l\'est de Toulouse', 12, '2025-04-14 13:59:11', '2025-04-14 13:59:14'),
(10, 'Toulouse Ouest', 'Zone couvrant l\'ouest de Toulouse', 13, '2025-04-14 13:59:11', '2025-04-14 13:59:14'),
(11, 'Nantes Centre', 'Zone couvrant le centre de Nantes', 14, '2025-04-14 13:59:11', '2025-04-14 13:59:14'),
(12, 'Nantes Sud', 'Zone couvrant le sud de Nantes', 15, '2025-04-14 13:59:11', '2025-04-14 13:59:14'),
(13, 'Zone test', NULL, NULL, '2025-04-22 15:29:50', '2025-04-22 15:29:50');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_logs_user_id_foreign` (`user_id`);

--
-- Index pour la table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_posts_slug_unique` (`slug`),
  ADD KEY `blog_posts_author_id_foreign` (`author_id`);

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_commercial_id_foreign` (`commercial_id`),
  ADD KEY `documents_pharmacy_id_foreign` (`pharmacy_id`),
  ADD KEY `documents_type_created_at_index` (`type`,`created_at`),
  ADD KEY `documents_title_index` (`title`),
  ADD KEY `documents_order_id_foreign` (`order_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `faq_items`
--
ALTER TABLE `faq_items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_pharmacy_id_foreign` (`pharmacy_id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletter_subscribers_email_unique` (`email`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_pharmacy_id_foreign` (`pharmacy_id`),
  ADD KEY `orders_commercial_id_foreign` (`commercial_id`),
  ADD KEY `orders_created_at_status_index` (`created_at`,`status`),
  ADD KEY `orders_total_index` (`total`);

--
-- Index pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharmacies_commercial_id_foreign` (`commercial_id`),
  ADD KEY `pharmacies_zone_id_foreign` (`zone_id`),
  ADD KEY `pharmacies_status_city_index` (`status`,`city`),
  ADD KEY `pharmacies_name_index` (`name`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_reference_unique` (`reference`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_email_index` (`role`,`email`),
  ADD KEY `users_last_name_index` (`last_name`),
  ADD KEY `users_zone_id_foreign` (`zone_id`);

--
-- Index pour la table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zones_commercial_id_foreign` (`commercial_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `faq_items`
--
ALTER TABLE `faq_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT pour la table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pharmacies`
--
ALTER TABLE `pharmacies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_commercial_id_foreign` FOREIGN KEY (`commercial_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `documents_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `documents_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_commercial_id_foreign` FOREIGN KEY (`commercial_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_pharmacy_id_foreign` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD CONSTRAINT `pharmacies_commercial_id_foreign` FOREIGN KEY (`commercial_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pharmacies_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `zones`
--
ALTER TABLE `zones`
  ADD CONSTRAINT `zones_commercial_id_foreign` FOREIGN KEY (`commercial_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
