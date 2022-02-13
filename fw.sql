-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Лют 13 2022 р., 21:58
-- Версія сервера: 5.7.33
-- Версія PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `fw`
--

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL,
  `alias` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`id`, `title`, `parent`, `alias`) VALUES
(685, 'Комплектующие к Apple', 0, 'komplektuyuschie-k-apple'),
(691, 'Запчасти iPad', 685, 'zapchasti-ipad'),
(692, 'Запчасти iPhone', 685, 'zapchasti-iphone'),
(693, 'Запчасти iPod', 685, 'zapchasti-ipod'),
(694, 'Запчасти Mac', 685, 'zapchasti-mac'),
(695, 'iPad', 691, 'ipad'),
(696, 'iPad 2', 691, 'ipad-2'),
(697, 'iPad NEW (iPad 3)', 691, 'ipad-new-ipad-3'),
(698, 'iPad 4', 691, 'ipad-4'),
(699, 'iPad mini', 691, 'ipad-mini'),
(700, 'iPhone', 692, 'iphone'),
(701, 'iPhone 3G/3GS', 692, 'iphone-3g-3gs'),
(702, 'iPhone 4', 692, 'iphone-4'),
(703, 'iPhone 4S', 692, 'iphone-4s'),
(704, 'iPhone 5', 692, 'iphone-5'),
(705, 'Микросхемы Apple', 685, 'mikroshemy-apple'),
(836, 'Защитные плёнки на Apple', 0, 'zaschitnye-plenki-na-apple'),
(840, 'iPad', 836, 'ipad-840'),
(841, 'iPhone', 836, 'iphone-841'),
(842, 'iPod', 836, 'ipod'),
(843, 'Mac', 836, 'mac'),
(853, 'Оборудование для ремонта Apple', 0, 'oborudovanie-dlya-remonta-apple'),
(876, 'Аксессуары для Apple', 0, 'aksessuary-dlya-apple'),
(877, 'Аксессуары iPad', 876, 'aksessuary-ipad'),
(878, 'Аксессуары iPhone', 876, 'aksessuary-iphone'),
(879, 'Аксессуары iPod', 876, 'aksessuary-ipod'),
(880, 'Аксессуары Mac', 876, 'aksessuary-mac'),
(881, 'iPad', 877, 'ipad-881'),
(882, 'iPad 2', 877, 'ipad-2-882'),
(883, 'iPad NEW 3 / iPad 4', 877, 'ipad-new-3-ipad-4'),
(884, 'iPad mini', 877, 'ipad-mini-884'),
(885, 'iPhone 3G / 3GS', 878, 'iphone-3g-3gs-885'),
(886, 'iPhone 4 / 4S', 878, 'iphone-4-4s'),
(887, 'iPhone 5', 878, 'iphone-5-887'),
(888, 'Аксессуары для Apple', 876, 'aksessuary-dlya-apple-888'),
(895, 'iPhone 5 Lamborghini', 878, 'iphone-5-lamborghini');

-- --------------------------------------------------------

--
-- Структура таблиці `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Категорія 1'),
(2, 'Category 2'),
(3, 'Категорія 2'),
(4, 'Category 3'),
(5, 'Категорія 3'),
(6, 'Категорія 4');

-- --------------------------------------------------------

--
-- Структура таблиці `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `base` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `languages`
--

INSERT INTO `languages` (`id`, `code`, `title`, `base`) VALUES
(1, 'ua', 'Українська', '1'),
(2, 'en', 'English', '0'),
(3, 'pl', 'Polska', '0');

-- --------------------------------------------------------

--
-- Структура таблиці `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `posts`
--

INSERT INTO `posts` (`id`, `lang_code`, `category_id`, `title`, `excerpt`, `text`, `keywords`, `description`) VALUES
(1, 'ua', 2, 'Садок вишневий коло хати', 'UA.Садок вишневий коло хати,\nхрущі над вишнями гудуть,\nплугатарі з плугами йдуть...', '<p>UA. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia optio odit unde quam dolore vel vitae in! Obcaecati velit rem alias exercitationem error eveniet autem, voluptatibus esse ab placeat blanditiis omnis! Necessitatibus, officia velit, laboriosam deleniti quis aperiam? Nesciunt inventore consequuntur dolores, excepturi magnam illum modi unde quis sit deserunt.</p>', 'садок', 'Садок вишневий коло хати,\nХрущі над вишнями гудуть,\nПлугатарі з плугами йдуть,\nСпівають ідучи дівчата,\nА матері вечерять ждуть.\n\nСім\\\'я вечеря коло хати,\nВечірня зіронька встає.\nДочка вечерять подає,\nА мати хоче научати,\nТак соловейко не дає.'),
(2, 'ua', 2, 'Hiч яка мiсячна', 'UA. Hiч яка мiсячна, зоряна, ясная, Видно, хоч голки збирай.\nВийди коханая, працею зморена\nХоч на хвилиночку в гай.\nТи ж не лякайся, що нiженьки босії\nТопчуть холодну росу.', '<p>UA. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia optio odit unde quam dolore vel vitae in! Obcaecati velit rem alias exercitationem error eveniet autem, voluptatibus esse ab placeat blanditiis omnis! Necessitatibus, officia velit, laboriosam deleniti quis aperiam? Nesciunt inventore consequuntur dolores, excepturi magnam illum modi unde quis sit deserunt.</p>', 'ніч', 'Hiч яка мiсячна, зоряна, ясная, Видно, хоч голки збирай.\nВийди коханая, працею зморена\nХоч на хвилиночку в гай.\nТи ж не лякайся, що нiженьки босії\nТопчуть холодну росу.\nЯ ж тебе вiрная аж до хатиноньки\nСам на руках однесу.\nСядемо вкупочцi бiля хатиноньки'),
(3, 'ua', 1, 'Коти нас розуміють', 'UA. Японські вчені Ацуко Сайто та Казутака Шінозука довели, що кішки не просто розрізняють інтонацію, але й розуміють людську мову.\n\nСередньостатистичний кіт може запам’ятати до 100 слів, які зазвичай говорить господар.', '<p>UA. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia optio odit unde quam dolore vel vitae in! Obcaecati velit rem alias exercitationem error eveniet autem, voluptatibus esse ab placeat blanditiis omnis! Necessitatibus, officia velit, laboriosam deleniti quis aperiam? Nesciunt inventore consequuntur dolores, excepturi magnam illum modi unde quis sit deserunt.</p>', NULL, 'Японські вчені Ацуко Сайто та Казутака Шінозука довели, що кішки не просто розрізняють інтонацію, але й розуміють людську мову.\n\nСередньостатистичний кіт може запам’ятати до 100 слів, які зазвичай говорить господар'),
(4, 'ua', 4, 'Тестовий пост', 'UA. Lorem ipsum.......', '<p>UA. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia optio odit unde quam dolore vel vitae in! Obcaecati velit rem alias exercitationem error eveniet autem, voluptatibus esse ab placeat blanditiis omnis! Necessitatibus, officia velit, laboriosam deleniti quis aperiam? Nesciunt inventore consequuntur dolores, excepturi magnam illum modi unde quis sit deserunt.</p>', '', ''),
(5, 'ua', 4, 'Дуже цікава стаття', 'UA. Заголовок цікавої статті', 'А ви знаєте як когось зацікавити?', '', NULL),
(6, 'en', 2, 'Adaptive site design and basic strategies for its implementation', 'EN. Адаптивный дизайн сайта — это совершенно новый подход к дизайну, который привлекает к себе все больше внимания, но, учитывая, насколько сильно он отличается от традиционных методов разработки, вначале он может показаться заоблачно сложным для начинающ', '<p>EN. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia optio odit unde quam dolore vel vitae in! Obcaecati velit rem alias exercitationem error eveniet autem, voluptatibus esse ab placeat blanditiis omnis! Necessitatibus, officia velit, laboriosam deleniti quis aperiam? Nesciunt inventore consequuntur dolores, excepturi magnam illum modi unde quis sit deserunt.</p>', 'adaptive design', 'Adaptive site design and basic strategies for its implementation');

-- --------------------------------------------------------

--
-- Структура таблиці `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Індекси таблиці `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Індекси таблиці `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=896;

--
-- AUTO_INCREMENT для таблиці `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
