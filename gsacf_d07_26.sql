-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2021 年 1 朁E07 日 15:17
-- サーバのバージョン： 10.4.17-MariaDB
-- PHP のバージョン: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gsacf_d07_26`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `brend_table`
--

CREATE TABLE `brend_table` (
  `brend_cd` int(3) NOT NULL,
  `brend_nm` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `brend_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `brend_table`
--

INSERT INTO `brend_table` (`brend_cd`, `brend_nm`, `brend_price`) VALUES
(1, 'ブレンド', 350),
(2, 'アイスコーヒー', 400),
(3, 'カプチーノ', 500),
(4, 'カフェラテ', 480);

-- --------------------------------------------------------

--
-- テーブルの構造 `cafe_table`
--

CREATE TABLE `cafe_table` (
  `id` int(3) NOT NULL,
  `kind_cd` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `kind_nm` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `coffee_cd` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `coffee_nm` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `brend_cd` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `brend_nm` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `hot_cd` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` int(6) NOT NULL,
  `count_c` int(3) NOT NULL,
  `price` int(8) NOT NULL,
  `memo` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `cafe_table`
--

INSERT INTO `cafe_table` (`id`, `kind_cd`, `kind_nm`, `coffee_cd`, `coffee_nm`, `brend_cd`, `brend_nm`, `hot_cd`, `unit_price`, `count_c`, `price`, `memo`) VALUES
(1, '1', '', '1', '', '1', '', '1', 0, 2, 0, ''),
(2, '3', '0', '3', '0', '3', '0', '2', 0, 3, 0, ''),
(3, '3', '0', '2', '0', '3', '0', '1', 0, 4, 0, ''),
(5, '1', '0', '1', '0', '4', '0', '2', 0, 1, 0, '');

-- --------------------------------------------------------

--
-- テーブルの構造 `coffee_table`
--

CREATE TABLE `coffee_table` (
  `coffee_cd` int(3) NOT NULL,
  `coffee_nm` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `coffee_table`
--

INSERT INTO `coffee_table` (`coffee_cd`, `coffee_nm`) VALUES
(1, '珈琲'),
(2, '紅茶'),
(3, 'フレッシュジュース'),
(4, 'ミルク');

-- --------------------------------------------------------

--
-- テーブルの構造 `hot_table`
--

CREATE TABLE `hot_table` (
  `hot_cd` int(1) NOT NULL,
  `hot_nm` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `hot_table`
--

INSERT INTO `hot_table` (`hot_cd`, `hot_nm`) VALUES
(1, 'hot'),
(2, 'ice');

-- --------------------------------------------------------

--
-- テーブルの構造 `kind_table`
--

CREATE TABLE `kind_table` (
  `kind_cd` int(3) NOT NULL,
  `kind_nm` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `kind_table`
--

INSERT INTO `kind_table` (`kind_cd`, `kind_nm`) VALUES
(1, 'ドリンク'),
(2, 'フード'),
(3, 'デザート');

-- --------------------------------------------------------

--
-- テーブルの構造 `todo_table`
--

CREATE TABLE `todo_table` (
  `id` int(12) NOT NULL,
  `todo` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `todo_table`
--

INSERT INTO `todo_table` (`id`, `todo`, `deadline`, `created_at`, `updated_at`) VALUES
(1, '課題１', '2020-12-19', '2020-12-19 15:51:31', '0000-00-00 00:00:00'),
(2, '課題２', '2020-12-20', '2020-12-19 15:57:12', '2020-12-19 15:57:12'),
(3, '課題２', '2020-12-21', '2020-12-19 16:00:22', '2020-12-19 16:00:22'),
(4, '課題３１１', '2020-12-31', '2020-12-19 16:02:30', '2020-12-26 16:07:21'),
(5, '課題４', '2020-12-24', '2020-12-19 16:02:31', '2020-12-19 16:02:31'),
(6, '課題５', '2020-12-25', '2020-12-19 16:02:31', '2020-12-19 16:02:31'),
(7, '課題６', '2020-12-26', '2020-12-19 16:02:31', '2020-12-19 16:02:31'),
(8, '課題７', '2020-12-27', '2020-12-19 16:02:31', '2020-12-19 16:02:31'),
(9, '課題８', '2020-12-28', '2020-12-19 16:02:31', '2020-12-19 16:02:31'),
(10, '課題９', '2020-12-29', '2020-12-19 16:02:31', '2020-12-19 16:02:31'),
(11, '課題１０', '2020-12-30', '2020-12-19 16:02:31', '2020-12-19 16:02:31'),
(12, 'test1', '2020-12-17', '2020-12-19 16:42:57', '2020-12-19 16:42:57'),
(14, '課題１３', '2020-12-01', '2020-12-19 16:47:27', '2020-12-19 16:47:27'),
(15, 'test2', '2020-12-04', '2020-12-26 15:02:39', '2020-12-26 15:02:39'),
(16, 'test3', '2020-12-29', '2020-12-26 15:02:54', '2020-12-26 15:02:54');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `brend_table`
--
ALTER TABLE `brend_table`
  ADD PRIMARY KEY (`brend_cd`);

--
-- テーブルのインデックス `cafe_table`
--
ALTER TABLE `cafe_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `coffee_table`
--
ALTER TABLE `coffee_table`
  ADD PRIMARY KEY (`coffee_cd`);

--
-- テーブルのインデックス `kind_table`
--
ALTER TABLE `kind_table`
  ADD PRIMARY KEY (`kind_cd`);

--
-- テーブルのインデックス `todo_table`
--
ALTER TABLE `todo_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `cafe_table`
--
ALTER TABLE `cafe_table`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `todo_table`
--
ALTER TABLE `todo_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
