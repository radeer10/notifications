-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 29 2018 г., 07:48
-- Версия сервера: 5.6.38
-- Версия PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE `notifications`;
--
-- База данных: `notifications`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '2', 1522141234),
('manager', '7', 1523004166);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Администратор', NULL, NULL, 1522141107, 1522141107),
('manager', 1, 'Менеджер', NULL, NULL, 1522141107, 1522141107);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `addressname` text,
  `client_name` varchar(255) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `organization_id` int(11) NOT NULL,
  `birthday` date DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `contacts`
--

-- --------------------------------------------------------

--
-- Структура таблицы `filters`
--

CREATE TABLE `filters` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT 'Название фильтра',
  `description` text COMMENT 'Описание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `filters`
--

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1516619894),
('m140506_102106_rbac_init', 1522140820),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1522140820),
('m180118_120015_create_filters_table', 1516619896),
('m180118_121043_create_notifications_table', 1516619896),
('m180118_121813_create_notifications_filters_table', 1516619896),
('m180118_122557_create_contacts_table', 1516619896),
('m180118_123128_create_contacts_filters_table', 1516619896),
('m180326_095844_create_user_table', 1522058371);

-- --------------------------------------------------------

--
-- Структура таблицы `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `id_template` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT 'Название рассылки',
  `heading` varchar(255) DEFAULT NULL COMMENT 'Заголовок сообщения',
  `content` text COMMENT 'Тело сообщения',
  `email` tinyint(1) DEFAULT '1',
  `sms` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `notifications`
--

-- --------------------------------------------------------

--
-- Структура таблицы `notifications_filters`
--

CREATE TABLE `notifications_filters` (
  `id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `notifications_filters`
--

-- --------------------------------------------------------

--
-- Структура таблицы `organization`
--

CREATE TABLE `organization` (
  `id` int(11) NOT NULL,
  `Match_Code` varchar(255) DEFAULT NULL,
  `mainaddress_adressname` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `clerk_staffId` varchar(255) DEFAULT NULL,
  `clerk_name` varchar(255) DEFAULT NULL,
  `associationnumber` int(11) DEFAULT NULL,
  `mainassociationnumber` int(11) DEFAULT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  `isoCode` varchar(255) DEFAULT NULL,
  `top_customer` tinyint(1) DEFAULT NULL,
  `Accounting_clerk_staffId` varchar(255) DEFAULT NULL,
  `Accounting_clerk_name` varchar(255) DEFAULT NULL,
  `Common_Match_Code` varchar(255) DEFAULT NULL,
  `mainaddress_addressname2` varchar(255) DEFAULT NULL,
  `deliveryaddress_addressname` varchar(255) DEFAULT NULL,
  `deliveryaddress_city` varchar(255) DEFAULT NULL,
  `deliveryaddress_phone` varchar(255) DEFAULT NULL,
  `deliveryaddress_fax` varchar(255) DEFAULT NULL,
  `deliveryaddress_mobilephone` varchar(255) DEFAULT NULL,
  `deliveryaddress_email` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `organization`
--

-- --------------------------------------------------------

--
-- Структура таблицы `organization_filters`
--

CREATE TABLE `organization_filters` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `organization_filters`
--


-- --------------------------------------------------------

--
-- Структура таблицы `organization_notes`
--

CREATE TABLE `organization_notes` (
  `id` int(11) NOT NULL,
  `note` text NOT NULL,
  `organization_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `organization_notes`
--

-- --------------------------------------------------------

--
-- Структура таблицы `templates`
--

CREATE TABLE `templates` (
  `id` int(11) NOT NULL,
  `template` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `t_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `templates`
--

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_ibfk_1` (`organization_id`);

--
-- Индексы таблицы `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `id_template` (`id_template`);

--
-- Индексы таблицы `notifications_filters`
--
ALTER TABLE `notifications_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notifs_filters_notifications` (`notification_id`),
  ADD KEY `fk_notifs_filters_filters` (`filter_id`);

--
-- Индексы таблицы `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mainaddress_adressname` (`mainaddress_adressname`);

--
-- Индексы таблицы `organization_filters`
--
ALTER TABLE `organization_filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_organization_id_filter_id` (`organization_id`,`filter_id`) USING BTREE,
  ADD KEY `fk_organization_filters_filters` (`filter_id`) USING BTREE;

--
-- Индексы таблицы `organization_notes`
--
ALTER TABLE `organization_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_id` (`organization_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT для таблицы `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `notifications_filters`
--
ALTER TABLE `notifications_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `organization`
--
ALTER TABLE `organization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=605;

--
-- AUTO_INCREMENT для таблицы `organization_filters`
--
ALTER TABLE `organization_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `organization_notes`
--
ALTER TABLE `organization_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`);

--
-- Ограничения внешнего ключа таблицы `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`id_template`) REFERENCES `templates` (`id`);

--
-- Ограничения внешнего ключа таблицы `notifications_filters`
--
ALTER TABLE `notifications_filters`
  ADD CONSTRAINT `fk_notifs_filters_filters` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_notifs_filters_notifications` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `organization_filters`
--
ALTER TABLE `organization_filters`
  ADD CONSTRAINT `fk_contacts_filters_contacts` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_contacts_filters_filters` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `organization_notes`
--
ALTER TABLE `organization_notes`
  ADD CONSTRAINT `organization_notes_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  ADD CONSTRAINT `organization_notes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
