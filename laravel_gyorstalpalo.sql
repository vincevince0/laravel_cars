-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2023. Jún 07. 15:36
-- Kiszolgáló verziója: 10.11.2-MariaDB
-- PHP verzió: 8.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `laravel_gyorstalpalo`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aitools`
--

CREATE TABLE `aitools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `hasFreePlan` tinyint(1) NOT NULL DEFAULT 0,
  `price` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `aitools`
--

INSERT INTO `aitools` (`id`, `category_id`, `name`, `description`, `link`, `hasFreePlan`, `price`, `created_at`, `updated_at`) VALUES
(1, 6, 'Lexica', 'Szövegből kép generálás', 'https://lexica.art/', 1, NULL, '2023-04-23 13:07:47', '2023-04-23 13:07:47'),
(6, 6, 'MidJourney', 'Szövegből kép generálás', 'https://www.midjourney.com/', 1, NULL, '2023-04-30 13:58:18', '2023-04-30 13:58:18'),
(7, 6, 'Dall-E', 'Szövegből grafika generálása', 'https://labs.openai.com/', 1, NULL, '2023-04-30 14:13:29', '2023-04-30 14:13:29'),
(8, 7, 'Fliki AI', 'Create high-quality videos without compromising on speed and quality. With Fliki, you’ll be able to quickly create videos from blog articles using realistic human-like voices in 75+ languages and 100+ dialects with branded subtitles', 'https://fliki.ai/', 1, NULL, '2023-04-30 14:35:38', '2023-04-30 14:35:38'),
(9, 7, 'Runway ML', 'Gen-1 is a new video generation technique that uses composition and style to create compelling footage out of existing videos. Generate new videos that mimic the structure of your original video', 'https://research.runwayml.com/gen2', 1, NULL, '2023-04-30 14:36:35', '2023-04-30 14:36:35'),
(10, 5, 'Synthesia', 'AI video creation platform that lets you turn documents, PowerPoints, and PDFs into engaging videos', 'https://www.synthesia.io/', 0, NULL, '2023-04-30 14:37:31', '2023-04-30 14:37:31'),
(11, 6, 'Craiyon', 'Craiyon, formerly DALL·E mini, is an AI model that can draw images from any text prompt!', 'https://www.craiyon.com/', 1, NULL, '2023-04-30 14:41:04', '2023-04-30 14:41:04'),
(12, 6, 'dream.ai', '200 karaketeres kép generátor', 'https://dream.ai/create', 0, NULL, '2023-04-30 14:42:33', '2023-04-30 14:42:33'),
(13, 6, 'Dreamstudio', 'Szöveg alapú kép generálás', 'https://dreamstudio.ai/generate', 0, NULL, '2023-04-30 14:43:56', '2023-04-30 14:43:56'),
(14, 5, 'Copilot', 'vscdoe-ba épülő kód generátor', 'https://github.com/features/copilot', 1, 10.00, '2023-04-30 14:45:39', '2023-04-30 14:45:39'),
(15, 5, 'CodeWhisperer', 'CodeWhisperer is trained on billions of lines of code and can generate code suggestions ranging from snippets to full functions in real time based on your comments and existing code. Bypass time-consuming coding tasks and accelerate building with unfamiliar APIs.', 'https://aws.amazon.com/codewhisperer/', 1, 50.00, '2023-04-30 14:46:30', '2023-04-30 14:46:30'),
(16, 5, 'teszt', 'teszt leírás, teszt leírás, teszt leírás, teszt leírás, teszt leírás, teszt leírás,', 'https://teszt.hu', 1, NULL, '2023-05-23 10:40:04', '2023-05-23 10:40:04');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aitool_tag`
--

CREATE TABLE `aitool_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `aitool_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `aitool_tag`
--

INSERT INTO `aitool_tag` (`id`, `aitool_id`, `tag_id`) VALUES
(5, 6, 3),
(6, 6, 4),
(7, 7, 2),
(8, 7, 4),
(9, 8, 3),
(10, 9, 3),
(11, 10, 3),
(12, 14, 4),
(13, 16, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(5, 'Programozás', '2023-04-23 11:57:20', '2023-04-23 11:57:20'),
(6, 'Kép', '2023-04-23 11:57:27', '2023-05-23 10:42:39'),
(7, 'Videó', '2023-04-23 11:57:33', '2023-04-23 11:57:33');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
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
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_22_092508_create_categories_table', 2),
(6, '2023_04_22_092819_create_tags_table', 3),
(7, '2023_04_22_092933_create_aitools_table', 4),
(8, '2023_04_30_145528_create_aitool_tag_table', 5),
(9, '2023_04_30_161828_add_index_to_aitools_name', 6);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
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
-- Tábla szerkezet ehhez a táblához `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(2, 'open-source'),
(3, 'closed-source'),
(4, 'has-api'),
(5, 'new');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'rrd', 'rrd@webmania.cc', NULL, '$2y$10$IsNTwkv1kxEPDH4rvi1sf.JdlbjI47MuxgjzZ.Ck4DJL13ohXqiNu', '0BAY9jIRLXK6N8CgPyxZwb42MrDmSNNJy9x63Yi3BTrVOBh5J5y7Dx9bTlld', '2023-05-14 12:33:55', '2023-05-14 12:33:55');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `aitools`
--
ALTER TABLE `aitools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aitools_category_id_foreign` (`category_id`),
  ADD KEY `aitools_name_index` (`name`);

--
-- A tábla indexei `aitool_tag`
--
ALTER TABLE `aitool_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aitool_tag_aitool_id_foreign` (`aitool_id`),
  ADD KEY `aitool_tag_tag_id_foreign` (`tag_id`);

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `aitools`
--
ALTER TABLE `aitools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT a táblához `aitool_tag`
--
ALTER TABLE `aitool_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `aitools`
--
ALTER TABLE `aitools`
  ADD CONSTRAINT `aitools_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Megkötések a táblához `aitool_tag`
--
ALTER TABLE `aitool_tag`
  ADD CONSTRAINT `aitool_tag_aitool_id_foreign` FOREIGN KEY (`aitool_id`) REFERENCES `aitools` (`id`),
  ADD CONSTRAINT `aitool_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
