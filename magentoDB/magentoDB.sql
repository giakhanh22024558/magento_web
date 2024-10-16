-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 28, 2024 at 02:35 PM
-- Server version: 8.0.39-0ubuntu0.24.04.2
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magentoDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminnotification_inbox`
--

CREATE TABLE `adminnotification_inbox` (
  `notification_id` int UNSIGNED NOT NULL COMMENT 'Notification ID',
  `severity` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adminnotification Inbox';

--
-- Dumping data for table `adminnotification_inbox`
--

INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES
(1, 4, '2024-09-09 13:55:50', 'Disable Notice', 'To improve performance, collecting statistics for the Magento Report module is disabled by default. \nYou can enable it in System Config.', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_adobe_ims_webapi`
--

CREATE TABLE `admin_adobe_ims_webapi` (
  `id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `admin_user_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Admin User Id',
  `access_token_hash` varchar(255) DEFAULT NULL COMMENT 'Access Token Hash',
  `access_token` text COMMENT 'Access Token',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `last_check_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Last check time',
  `access_token_expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Access Token Expires At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin Adobe IMS Webapi';

-- --------------------------------------------------------

--
-- Table structure for table `admin_analytics_usage_version_log`
--

CREATE TABLE `admin_analytics_usage_version_log` (
  `id` int UNSIGNED NOT NULL COMMENT 'Log ID',
  `last_viewed_in_version` varchar(50) NOT NULL COMMENT 'Viewer last viewed on product version'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin Notification Viewer Log Table';

--
-- Dumping data for table `admin_analytics_usage_version_log`
--

INSERT INTO `admin_analytics_usage_version_log` (`id`, `last_viewed_in_version`) VALUES
(1, '2.4.7-p2');

-- --------------------------------------------------------

--
-- Table structure for table `admin_passwords`
--

CREATE TABLE `admin_passwords` (
  `password_id` int UNSIGNED NOT NULL COMMENT 'Password ID',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User ID',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Deprecated',
  `last_updated` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Last Updated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin Passwords';

--
-- Dumping data for table `admin_passwords`
--

INSERT INTO `admin_passwords` (`password_id`, `user_id`, `password_hash`, `expires`, `last_updated`) VALUES
(1, 1, '38de70e59291b918ef3c1693255f048666101e6eda11231eb163c36af4f06c7e:a0niO7DQaPK0OLFZcRLrmX1ANLMw9x3X:3_32_2_67108864', 0, 1725890793),
(2, 1, '81a3e466386b27ee83d4f995b63f6d60183ea3300d61bd32ba540aba4e0b298a:5trGwvKfQPZxhyXdC8nSFykh57GATc4D:3_32_2_67108864', 0, 1727509968),
(3, 1, 'e43010dee78b672dbb2a97b0b2a3365f7fd393abc1c8237b0755bf319cc3c871:XGdw9trKzGNRxElhc6Vsw4k00DqYaxdL:3_32_2_67108864', 0, 1727532354),
(4, 1, '0705b5515789e5bcb139745d822d369ce1a835360007c999c5cb533da18b6221:IdOxk1JJVywiBbfeKgiV5BZYca3IA218:3_32_2_67108864', 0, 1727533390),
(5, 2, '04e89fe4c3bd0fe0d31c6938b6faa44fea7bf24519b58da66583a0ca1d043d6b:LjRMIBDg5yN8MVawSs4KiDzmeOoJ6xYM:3_32_2_67108864', 0, 1727533968);

-- --------------------------------------------------------

--
-- Table structure for table `admin_system_messages`
--

CREATE TABLE `admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message ID',
  `severity` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin System Messages';

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `user_id` int UNSIGNED NOT NULL COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin User Table';

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `created`, `modified`, `logdate`, `lognum`, `reload_acl_flag`, `is_active`, `extra`, `rp_token`, `rp_token_created_at`, `interface_locale`, `failures_num`, `first_failure`, `lock_expires`) VALUES
(1, 'Khanh', 'Luong', 'hotmashmallow@gmail.com', 'khanh13admin', '0705b5515789e5bcb139745d822d369ce1a835360007c999c5cb533da18b6221:IdOxk1JJVywiBbfeKgiV5BZYca3IA218:3_32_2_67108864', '2024-09-09 14:06:33', '2024-09-28 14:26:07', '2024-09-28 14:23:58', 11, 0, 1, '{\"configState\":{\"general_country\":\"0\",\"general_region\":\"0\",\"general_locale\":\"0\",\"general_store_information\":\"0\",\"general_single_store_mode\":\"0\",\"admin_emails\":\"0\",\"admin_startup\":\"0\",\"admin_url\":\"0\",\"admin_security\":\"0\",\"admin_dashboard\":\"1\",\"admin_grid\":\"0\",\"admin_captcha\":\"0\",\"admin_usage\":\"0\",\"catalog_review\":\"0\"}}', NULL, NULL, 'en_US', 0, NULL, NULL),
(2, 'Admin', 'Admin', 'admin@admin.com', 'admin', '04e89fe4c3bd0fe0d31c6938b6faa44fea7bf24519b58da66583a0ca1d043d6b:LjRMIBDg5yN8MVawSs4KiDzmeOoJ6xYM:3_32_2_67108864', '2024-09-28 14:32:48', '2024-09-28 14:34:11', '2024-09-28 14:33:24', 1, 0, 1, '{\"configState\":{\"catalog_layered_navigation\":\"0\",\"catalog_search\":\"0\"}}', NULL, NULL, 'en_US', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_expiration`
--

CREATE TABLE `admin_user_expiration` (
  `user_id` int UNSIGNED NOT NULL COMMENT 'User ID',
  `expires_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'User Expiration Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin User expiration dates table';

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_session`
--

CREATE TABLE `admin_user_session` (
  `id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `session_id` varchar(1) DEFAULT NULL COMMENT 'Deprecated: Session ID value no longer used',
  `user_id` int UNSIGNED DEFAULT NULL COMMENT 'Admin User ID',
  `status` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Current Session status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin User sessions table';

--
-- Dumping data for table `admin_user_session`
--

INSERT INTO `admin_user_session` (`id`, `session_id`, `user_id`, `status`, `created_at`, `updated_at`, `ip`) VALUES
(1, NULL, 1, 0, '2024-09-10 01:15:09', '2024-09-10 01:15:27', '127.0.0.1'),
(2, NULL, 1, 0, '2024-09-10 01:16:32', '2024-09-10 01:17:38', '127.0.0.1'),
(3, NULL, NULL, 0, '2024-09-10 01:17:43', '2024-09-10 01:17:43', '127.0.0.1'),
(4, NULL, 1, 1, '2024-09-10 01:18:05', '2024-09-10 01:18:36', '127.0.0.1'),
(5, NULL, 1, 1, '2024-09-15 15:13:14', '2024-09-15 15:13:42', '127.0.0.1'),
(6, NULL, 1, 1, '2024-09-24 09:38:48', '2024-09-24 09:40:18', '127.0.0.1'),
(7, NULL, 1, 1, '2024-09-28 06:56:20', '2024-09-28 06:56:20', '127.0.0.1'),
(8, NULL, 1, 2, '2024-09-28 07:25:49', '2024-09-28 07:53:26', '127.0.0.1'),
(9, NULL, 1, 1, '2024-09-28 07:53:26', '2024-09-28 08:04:38', '127.0.0.1'),
(10, NULL, 1, 1, '2024-09-28 08:25:16', '2024-09-28 08:52:42', '127.0.0.1'),
(11, NULL, 1, 1, '2024-09-28 13:48:11', '2024-09-28 13:49:14', '127.0.0.1'),
(12, NULL, 1, 1, '2024-09-28 14:23:58', '2024-09-28 14:26:07', '127.0.0.1'),
(13, NULL, 2, 1, '2024-09-28 14:33:25', '2024-09-28 14:34:02', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `adobe_stock_asset`
--

CREATE TABLE `adobe_stock_asset` (
  `id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `media_gallery_id` int UNSIGNED DEFAULT NULL COMMENT 'Media gallery ID',
  `category_id` int UNSIGNED DEFAULT NULL COMMENT 'Category ID',
  `creator_id` int UNSIGNED DEFAULT NULL COMMENT 'Creator ID',
  `is_licensed` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Licensed',
  `creation_date` varchar(255) DEFAULT NULL COMMENT 'Creation Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe Stock Asset';

-- --------------------------------------------------------

--
-- Table structure for table `adobe_stock_category`
--

CREATE TABLE `adobe_stock_category` (
  `id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe Stock Category';

-- --------------------------------------------------------

--
-- Table structure for table `adobe_stock_creator`
--

CREATE TABLE `adobe_stock_creator` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Asset creator''s name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe Stock Creator';

-- --------------------------------------------------------

--
-- Table structure for table `adobe_user_profile`
--

CREATE TABLE `adobe_user_profile` (
  `id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `admin_user_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Admin User Id',
  `name` varchar(255) NOT NULL COMMENT 'Display Name',
  `email` varchar(255) NOT NULL COMMENT 'user profile email',
  `image` varchar(255) NOT NULL COMMENT 'user profile avatar',
  `account_type` varchar(255) DEFAULT NULL COMMENT 'Account Type',
  `access_token` text COMMENT 'Access Token',
  `refresh_token` text COMMENT 'Refresh Token',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `access_token_expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Access Token Expires At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe IMS User Profile';

-- --------------------------------------------------------

--
-- Table structure for table `authorization_role`
--

CREATE TABLE `authorization_role` (
  `role_id` int UNSIGNED NOT NULL COMMENT 'Role ID',
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin Role Table';

--
-- Dumping data for table `authorization_role`
--

INSERT INTO `authorization_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `user_type`, `role_name`) VALUES
(1, 0, 1, 1, 'G', 0, '2', 'Administrators'),
(2, 1, 2, 0, 'U', 1, '2', 'khanh13admin'),
(3, 1, 2, 0, 'U', 2, '2', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `authorization_rule`
--

CREATE TABLE `authorization_rule` (
  `rule_id` int UNSIGNED NOT NULL COMMENT 'Rule ID',
  `role_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin Rule Table';

--
-- Dumping data for table `authorization_rule`
--

INSERT INTO `authorization_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `permission`) VALUES
(1, 1, 'Magento_Backend::all', NULL, 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `braintree_credit_prices`
--

CREATE TABLE `braintree_credit_prices` (
  `id` int UNSIGNED NOT NULL COMMENT 'Row ID',
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product Id',
  `term` int NOT NULL COMMENT 'Credit Term',
  `monthly_payment` decimal(12,2) NOT NULL COMMENT 'Monthly Payment',
  `instalment_rate` decimal(12,2) NOT NULL COMMENT 'Instalment Rate',
  `cost_of_purchase` decimal(12,2) NOT NULL COMMENT 'Cost of purchase',
  `total_inc_interest` decimal(12,2) NOT NULL COMMENT 'Total Inc Interest'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Braintree credit rates';

-- --------------------------------------------------------

--
-- Table structure for table `braintree_transaction_details`
--

CREATE TABLE `braintree_transaction_details` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order Id',
  `transaction_source` varchar(12) DEFAULT NULL COMMENT 'Transaction Source'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Braintree transaction details table';

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int DEFAULT NULL COMMENT 'Cache Expiration Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Caches';

-- --------------------------------------------------------

--
-- Table structure for table `cache_tag`
--

CREATE TABLE `cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tag Caches';

-- --------------------------------------------------------

--
-- Table structure for table `captcha_log`
--

CREATE TABLE `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  `count` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Count Login Attempts';

--
-- Dumping data for table `captcha_log`
--

INSERT INTO `captcha_log` (`type`, `value`, `count`, `updated_at`) VALUES
('2', 'khanh13', 1, '2024-09-15 15:12:58');

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock`
--

CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint UNSIGNED NOT NULL COMMENT 'Stock ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock';

--
-- Dumping data for table `cataloginventory_stock`
--

INSERT INTO `cataloginventory_stock` (`stock_id`, `website_id`, `stock_name`) VALUES
(1, 0, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_item`
--

CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int UNSIGNED NOT NULL COMMENT 'Item ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `stock_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Stock ID',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Item';

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status`
--

CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `stock_id` smallint UNSIGNED NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint UNSIGNED NOT NULL COMMENT 'Stock Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status';

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `stock_id` smallint UNSIGNED NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint UNSIGNED NOT NULL COMMENT 'Stock Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status Indexer Idx';

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_replica`
--

CREATE TABLE `cataloginventory_stock_status_replica` (
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `stock_id` smallint UNSIGNED NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint UNSIGNED NOT NULL COMMENT 'Stock Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status';

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `stock_id` smallint UNSIGNED NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint UNSIGNED NOT NULL COMMENT 'Stock Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status Indexer Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule`
--

CREATE TABLE `catalogrule` (
  `rule_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Discount Amount'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_customer_group`
--

CREATE TABLE `catalogrule_customer_group` (
  `rule_id` int UNSIGNED NOT NULL COMMENT 'Rule ID',
  `customer_group_id` int UNSIGNED NOT NULL COMMENT 'Customer Group ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Rules To Customer Groups Relations';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_group_website`
--

CREATE TABLE `catalogrule_group_website` (
  `rule_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Group Website';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_group_website_replica`
--

CREATE TABLE `catalogrule_group_website_replica` (
  `rule_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Group Website';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product`
--

CREATE TABLE `catalogrule_product` (
  `rule_product_id` int UNSIGNED NOT NULL COMMENT 'Rule Product ID',
  `rule_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `from_time` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Action Amount',
  `action_stop` smallint NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product_price`
--

CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int UNSIGNED NOT NULL COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `rule_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Rule Price',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product Price';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product_price_replica`
--

CREATE TABLE `catalogrule_product_price_replica` (
  `rule_product_price_id` int UNSIGNED NOT NULL COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `rule_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Rule Price',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product Price';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product_replica`
--

CREATE TABLE `catalogrule_product_replica` (
  `rule_product_id` int UNSIGNED NOT NULL COMMENT 'Rule Product ID',
  `rule_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `from_time` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Action Amount',
  `action_stop` smallint NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_website`
--

CREATE TABLE `catalogrule_website` (
  `rule_id` int UNSIGNED NOT NULL COMMENT 'Rule ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Rules To Websites Relations';

-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_recommendations`
--

CREATE TABLE `catalogsearch_recommendations` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `query_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Query ID',
  `relation_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Relation ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Advanced Search Recommendations';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity`
--

CREATE TABLE `catalog_category_entity` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_set_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int NOT NULL COMMENT 'Position',
  `level` int NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int NOT NULL COMMENT 'Child Count'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Table';

--
-- Dumping data for table `catalog_category_entity`
--

INSERT INTO `catalog_category_entity` (`entity_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`) VALUES
(1, 3, 0, '2024-09-09 13:55:49', '2024-09-09 13:55:49', '1', 0, 0, 1),
(2, 3, 1, '2024-09-09 13:55:49', '2024-09-09 13:55:49', '1/2', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_datetime`
--

CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Datetime Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_decimal`
--

CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(20,6) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Decimal Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_int`
--

CREATE TABLE `catalog_category_entity_int` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Integer Attribute Backend Table';

--
-- Dumping data for table `catalog_category_entity_int`
--

INSERT INTO `catalog_category_entity_int` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 69, 0, 1, 1),
(2, 69, 0, 2, 1),
(3, 46, 0, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_text`
--

CREATE TABLE `catalog_category_entity_text` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` mediumtext COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Text Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_varchar`
--

CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Varchar Attribute Backend Table';

--
-- Dumping data for table `catalog_category_entity_varchar`
--

INSERT INTO `catalog_category_entity_varchar` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 45, 0, 1, 'Root Catalog'),
(2, 52, 0, 2, 'PRODUCTS'),
(3, 45, 0, 2, 'Default Category');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product`
--

CREATE TABLE `catalog_category_product` (
  `entity_id` int NOT NULL COMMENT 'Entity ID',
  `category_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product To Category Linkage Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_cl`
--

CREATE TABLE `catalog_category_product_cl` (
  `version_id` int UNSIGNED NOT NULL COMMENT 'Version ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='catalog_category_product_cl';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index`
--

CREATE TABLE `catalog_category_product_index` (
  `category_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint UNSIGNED NOT NULL COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_replica`
--

CREATE TABLE `catalog_category_product_index_replica` (
  `category_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint UNSIGNED NOT NULL COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_store1`
--

CREATE TABLE `catalog_category_product_index_store1` (
  `category_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint UNSIGNED NOT NULL COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index Store1';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_store1_replica`
--

CREATE TABLE `catalog_category_product_index_store1_replica` (
  `category_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint UNSIGNED NOT NULL COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index Store1 Replica';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_tmp`
--

CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint UNSIGNED NOT NULL COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Indexer temporary table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_compare_item`
--

CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int UNSIGNED NOT NULL COMMENT 'Compare Item ID',
  `visitor_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `list_id` int UNSIGNED DEFAULT NULL COMMENT 'List ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Compare Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_compare_list`
--

CREATE TABLE `catalog_compare_list` (
  `list_id` int UNSIGNED NOT NULL COMMENT 'Compare List ID',
  `list_id_mask` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Compare List with hash Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_eav_attribute`
--

CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT '1' COMMENT 'Search Weight',
  `is_pagebuilder_enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is PageBuilder Enabled',
  `additional_data` text COMMENT 'Additional swatch attributes data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog EAV Attribute Table';

--
-- Dumping data for table `catalog_eav_attribute`
--

INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`, `is_required_in_admin_store`, `is_used_in_grid`, `is_visible_in_grid`, `is_filterable_in_grid`, `search_weight`, `is_pagebuilder_enabled`, `additional_data`) VALUES
(45, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(46, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(47, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, NULL),
(48, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(49, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(50, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(51, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(52, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(53, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(54, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(55, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(56, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(57, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(58, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(59, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(60, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(61, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(62, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(63, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(64, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(65, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(66, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(67, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(68, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(69, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(70, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(71, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(72, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(73, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 5, 0, NULL),
(74, NULL, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 6, 0, NULL),
(75, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, NULL),
(76, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, NULL, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, NULL),
(77, NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 'simple,virtual,downloadable,bundle,configurable', 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(78, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(79, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, NULL),
(80, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, NULL),
(81, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,downloadable', 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(82, 'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(83, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 'simple,configurable', 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(84, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(85, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(86, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(87, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(88, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(89, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(90, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(91, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(92, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,downloadable,bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(93, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 'simple,virtual,configurable', 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(94, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, NULL),
(95, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, NULL),
(96, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(97, 'Magento\\Framework\\Data\\Form\\Element\\Hidden', 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, NULL),
(98, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(99, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, NULL),
(100, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(101, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, NULL),
(102, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, NULL),
(103, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(104, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, NULL),
(105, 'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(106, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(107, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(108, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(109, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(110, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(111, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(112, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(113, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(114, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,bundle,grouped,configurable', 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(115, 'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(116, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, NULL),
(117, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(118, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(119, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(120, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(121, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(122, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(123, 'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type', 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL),
(124, 'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(125, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(126, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(127, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(128, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(129, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(130, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(131, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(132, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(133, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(134, 'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, NULL),
(135, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL),
(136, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option`
--

CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int UNSIGNED NOT NULL COMMENT 'Option ID',
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `required` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Option';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option_value`
--

CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int UNSIGNED NOT NULL COMMENT 'Value ID',
  `option_id` int UNSIGNED NOT NULL COMMENT 'Option ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `parent_product_id` int UNSIGNED NOT NULL COMMENT 'Parent Product ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Option Value';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_price_index`
--

CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `customer_group_id` int UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `min_price` decimal(20,6) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) NOT NULL COMMENT 'Max Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Price Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_selection`
--

CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int UNSIGNED NOT NULL COMMENT 'Selection ID',
  `option_id` int UNSIGNED NOT NULL COMMENT 'Option ID',
  `parent_product_id` int UNSIGNED NOT NULL COMMENT 'Parent Product ID',
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `position` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Selection';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int UNSIGNED NOT NULL COMMENT 'Selection ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `selection_price_type` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Selection Price Value',
  `parent_product_id` int UNSIGNED NOT NULL COMMENT 'Parent Product ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Selection Price';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `stock_id` smallint UNSIGNED NOT NULL COMMENT 'Stock ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `stock_status` smallint DEFAULT '0' COMMENT 'Stock Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Stock Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity`
--

CREATE TABLE `catalog_product_entity` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_set_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) NOT NULL COMMENT 'SKU',
  `has_options` smallint NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_datetime`
--

CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Datetime Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_decimal`
--

CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(20,6) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Decimal Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_gallery`
--

CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Gallery Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_int`
--

CREATE TABLE `catalog_product_entity_int` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Integer Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int UNSIGNED NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Visibility status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Media Gallery Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int UNSIGNED DEFAULT NULL COMMENT 'Position',
  `disabled` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  `record_id` int UNSIGNED NOT NULL COMMENT 'Record ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Media Gallery Attribute Value Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery_value_to_entity`
--

CREATE TABLE `catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int UNSIGNED NOT NULL COMMENT 'Value media Entry ID',
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Product Entity ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Link Media value to Product entity table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery_value_video`
--

CREATE TABLE `catalog_product_entity_media_gallery_value_video` (
  `value_id` int UNSIGNED NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Page Meta Description',
  `metadata` text COMMENT 'Video meta data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Video Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_text`
--

CREATE TABLE `catalog_product_entity_text` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` mediumtext COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Text Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_tier_price`
--

CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Value',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `percentage_value` decimal(5,2) DEFAULT NULL COMMENT 'Percentage value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Tier Price Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_varchar`
--

CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Varchar Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_frontend_action`
--

CREATE TABLE `catalog_product_frontend_action` (
  `action_id` bigint UNSIGNED NOT NULL COMMENT 'Product Action ID',
  `type_id` varchar(64) NOT NULL COMMENT 'Type of product action',
  `visitor_id` int UNSIGNED DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `added_at` bigint NOT NULL COMMENT 'Added At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Frontend Action Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav`
--

CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int UNSIGNED NOT NULL COMMENT 'Value',
  `source_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_replica`
--

CREATE TABLE `catalog_product_index_eav_decimal_replica` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_idx`
--

CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int UNSIGNED NOT NULL COMMENT 'Value',
  `source_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_replica`
--

CREATE TABLE `catalog_product_index_eav_replica` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int UNSIGNED NOT NULL COMMENT 'Value',
  `source_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int UNSIGNED NOT NULL COMMENT 'Value',
  `source_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price`
--

CREATE TABLE `catalog_product_index_price` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price_type` smallint UNSIGNED NOT NULL COMMENT 'Price Type',
  `special_price` decimal(20,6) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(20,6) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Opt Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Opt Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `selection_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection ID',
  `group_type` smallint UNSIGNED DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint UNSIGNED DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Sel Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `selection_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection ID',
  `group_type` smallint UNSIGNED DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint UNSIGNED DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Sel Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price_type` smallint UNSIGNED NOT NULL COMMENT 'Price Type',
  `special_price` decimal(20,6) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(20,6) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int UNSIGNED NOT NULL COMMENT 'Child ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int UNSIGNED NOT NULL COMMENT 'Child ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Minimum price',
  `max_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Maximum price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Minimum price',
  `max_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Maximum price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Final Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Final Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_idx`
--

CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_replica`
--

CREATE TABLE `catalog_product_index_price_replica` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_tmp`
--

CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `customer_group_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `id` int UNSIGNED NOT NULL COMMENT 'ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_tier_price`
--

CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Tier Price Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_website`
--

CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `default_store_id` smallint UNSIGNED NOT NULL COMMENT 'Default store ID for website',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Website Index Table';

--
-- Dumping data for table `catalog_product_index_website`
--

INSERT INTO `catalog_product_index_website` (`website_id`, `default_store_id`, `website_date`, `rate`) VALUES
(1, 1, '2024-09-28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link`
--

CREATE TABLE `catalog_product_link` (
  `link_id` int UNSIGNED NOT NULL COMMENT 'Link ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link Type ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product To Product Linkage Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute`
--

CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Attribute Table';

--
-- Dumping data for table `catalog_product_link_attribute`
--

INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES
(1, 1, 'position', 'int'),
(2, 4, 'position', 'int'),
(3, 5, 'position', 'int'),
(4, 3, 'position', 'int'),
(5, 3, 'qty', 'decimal');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_link_attribute_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Decimal Attribute Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_int`
--

CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_link_attribute_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Integer Attribute Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_link_attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Varchar Attribute Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_type`
--

CREATE TABLE `catalog_product_link_type` (
  `link_type_id` smallint UNSIGNED NOT NULL COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Type Table';

--
-- Dumping data for table `catalog_product_link_type`
--

INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES
(1, 'relation'),
(3, 'super'),
(4, 'up_sell'),
(5, 'cross_sell');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option`
--

CREATE TABLE `catalog_product_option` (
  `option_id` int UNSIGNED NOT NULL COMMENT 'Option ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int UNSIGNED DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint UNSIGNED DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint UNSIGNED DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_price`
--

CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int UNSIGNED NOT NULL COMMENT 'Option Price ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Price Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_title`
--

CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int UNSIGNED NOT NULL COMMENT 'Option Title ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Title Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_price`
--

CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int UNSIGNED NOT NULL COMMENT 'Option Type Price ID',
  `option_type_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Type Price Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_title`
--

CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int UNSIGNED NOT NULL COMMENT 'Option Type Title ID',
  `option_type_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Type Title Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_value`
--

CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int UNSIGNED NOT NULL COMMENT 'Option Type ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Type Value Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_relation`
--

CREATE TABLE `catalog_product_relation` (
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int UNSIGNED NOT NULL COMMENT 'Child ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Relation Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute`
--

CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int UNSIGNED NOT NULL COMMENT 'Product Super Attribute ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Position'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Super Attribute Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute_label`
--

CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_super_attribute_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint UNSIGNED DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Super Attribute Label Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_link`
--

CREATE TABLE `catalog_product_super_link` (
  `link_id` int UNSIGNED NOT NULL COMMENT 'Link ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Super Link Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_website`
--

CREATE TABLE `catalog_product_website` (
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product To Website Linkage Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_url_rewrite_product_category`
--

CREATE TABLE `catalog_url_rewrite_product_category` (
  `url_rewrite_id` int UNSIGNED NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int UNSIGNED NOT NULL COMMENT 'category_id',
  `product_id` int UNSIGNED NOT NULL COMMENT 'product_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='url_rewrite_relation';

-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement`
--

CREATE TABLE `checkout_agreement` (
  `agreement_id` int UNSIGNED NOT NULL COMMENT 'Agreement ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint NOT NULL DEFAULT '0' COMMENT 'Is Html',
  `mode` smallint NOT NULL DEFAULT '0' COMMENT 'Applied mode'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Checkout Agreement';

-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement_store`
--

CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int UNSIGNED NOT NULL COMMENT 'Agreement ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Checkout Agreement Store';

-- --------------------------------------------------------

--
-- Table structure for table `cms_block`
--

CREATE TABLE `cms_block` (
  `block_id` smallint NOT NULL COMMENT 'Entity ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Block Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Block Modification Time',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'Is Block Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CMS Block Table';

-- --------------------------------------------------------

--
-- Table structure for table `cms_block_store`
--

CREATE TABLE `cms_block_store` (
  `block_id` smallint NOT NULL,
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CMS Block To Store Linkage Table';

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

CREATE TABLE `cms_page` (
  `page_id` smallint NOT NULL COMMENT 'Entity ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Page Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Page Modification Time',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `layout_update_selected` varchar(128) DEFAULT NULL COMMENT 'Page Custom Layout File',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Meta Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CMS Page Table';

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`page_id`, `title`, `page_layout`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `layout_update_selected`, `custom_theme_from`, `custom_theme_to`, `meta_title`) VALUES
(1, '404 Not Found', '2columns-right', 'Page keywords', 'Page description', 'no-route', 'Whoops, our bad...', '<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n', '2024-09-09 13:55:49', '2024-09-09 13:55:49', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Home page', '1column', NULL, NULL, 'home', 'Home Page', '<p>CMS homepage content goes here.</p>\r\n', '2024-09-09 13:55:49', '2024-09-09 13:55:50', 1, 0, '<!--\n    <referenceContainer name=\"right\">\n        <referenceBlock name=\"catalog.compare.sidebar\" remove=\"true\" />\n    </referenceContainer>-->', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Enable Cookies', '1column', NULL, NULL, 'enable-cookies', 'What are Cookies?', '<div class=\"enable-cookies cms-content\">\r\n<p>\"Cookies\" are little pieces of data we send when you visit our store. Cookies help us get to know you better and personalize your experience. Plus they help protect you and other shoppers from fraud.</p>\r\n<p style=\"margin-bottom: 20px;\">Set your browser to accept cookies so you can buy items, save items, and receive customized recommendations. Here’s how:</p>\r\n<ul>\r\n<li><a href=\"https://support.google.com/accounts/answer/61416?hl=en\" target=\"_blank\">Google Chrome</a></li>\r\n<li><a href=\"http://windows.microsoft.com/en-us/internet-explorer/delete-manage-cookies\" target=\"_blank\">Internet Explorer</a></li>\r\n<li><a href=\"http://support.apple.com/kb/PH19214\" target=\"_blank\">Safari</a></li>\r\n<li><a href=\"https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences\" target=\"_blank\">Mozilla/Firefox</a></li>\r\n</ul>\r\n</div>', '2024-09-09 13:55:49', '2024-09-09 13:55:49', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Privacy and Cookie Policy', '1column', NULL, NULL, 'privacy-policy-cookie-restriction-mode', 'Privacy and Cookie Policy', '<div class=\"privacy-policy cms-content\">\n    <div class=\"message info\">\n        <span>\n            Please replace this text with you Privacy Policy.\n            Please add any additional cookies your website uses below (e.g. Google Analytics).\n        </span>\n    </div>\n    <p>\n        This privacy policy sets out how this website (hereafter \"the Store\") uses and protects any information that\n        you give the Store while using this website. The Store is committed to ensuring that your privacy is protected.\n        Should we ask you to provide certain information by which you can be identified when using this website, then\n        you can be assured that it will only be used in accordance with this privacy statement. The Store may change\n        this policy from time to time by updating this page. You should check this page from time to time to ensure\n        that you are happy with any changes.\n    </p>\n    <h2>What we collect</h2>\n    <p>We may collect the following information:</p>\n    <ul>\n        <li>name</li>\n        <li>contact information including email address</li>\n        <li>demographic information such as postcode, preferences and interests</li>\n        <li>other information relevant to customer surveys and/or offers</li>\n    </ul>\n    <p>\n        For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n    </p>\n    <h2>What we do with the information we gather</h2>\n    <p>\n        We require this information to understand your needs and provide you with a better service,\n        and in particular for the following reasons:\n    </p>\n    <ul>\n        <li>Internal record keeping.</li>\n        <li>We may use the information to improve our products and services.</li>\n        <li>\n            We may periodically send promotional emails about new products, special offers or other information which we\n            think you may find interesting using the email address which you have provided.\n        </li>\n        <li>\n            From time to time, we may also use your information to contact you for market research purposes.\n            We may contact you by email, phone, fax or mail. We may use the information to customise the website\n            according to your interests.\n        </li>\n    </ul>\n    <h2>Security</h2>\n    <p>\n        We are committed to ensuring that your information is secure. In order to prevent unauthorised access or\n        disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and\n        secure the information we collect online.\n    </p>\n    <h2>How we use cookies</h2>\n    <p>\n        A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n        Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n        a particular site. Cookies allow web applications to respond to you as an individual. The web application\n        can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n        your preferences.\n    </p>\n    <p>\n        We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page\n        traffic and improve our website in order to tailor it to customer needs. We only use this information for\n        statistical analysis purposes and then the data is removed from the system.\n    </p>\n    <p>\n        Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find\n        useful and which you do not. A cookie in no way gives us access to your computer or any information about you,\n        other than the data you choose to share with us. You can choose to accept or decline cookies.\n        Most web browsers automatically accept cookies, but you can usually modify your browser setting\n        to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n    </p>\n    <h2>Links to other websites</h2>\n    <p>\n        Our website may contain links to other websites of interest. However, once you have used these links\n        to leave our site, you should note that we do not have any control over that other website.\n        Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n        visiting such sites and such sites are not governed by this privacy statement.\n        You should exercise caution and look at the privacy statement applicable to the website in question.\n    </p>\n    <h2>Controlling your personal information</h2>\n    <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n    <ul>\n        <li>\n            whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n            that you do not want the information to be used by anybody for direct marketing purposes\n        </li>\n        <li>\n            if you have previously agreed to us using your personal information for direct marketing purposes,\n            you may change your mind at any time by letting us know using our Contact Us information\n        </li>\n    </ul>\n    <p>\n        We will not sell, distribute or lease your personal information to third parties unless we have your permission\n        or are required by law to do so. We may use your personal information to send you promotional information\n        about third parties which we think you may find interesting if you tell us that you wish this to happen.\n    </p>\n    <p>\n        You may request details of personal information which we hold about you under the Data Protection Act 1998.\n        A small fee will be payable. If you would like a copy of the information held on you please email us this\n        request using our Contact Us information.\n    </p>\n    <p>\n        If you believe that any information we are holding on you is incorrect or incomplete,\n        please write to or email us as soon as possible, at the above address.\n        We will promptly correct any information found to be incorrect.\n    </p>\n    <h2><a name=\"list\"></a>List of cookies we collect</h2>\n    <p>The table below lists the cookies we collect and what information they store.</p>\n    <table class=\"data-table data-table-definition-list\">\n        <thead>\n        <tr>\n            <th>Cookie Name</th>\n            <th>Cookie Description</th>\n        </tr>\n        </thead>\n        <tbody>\n            <tr>\n                <th>FORM_KEY</th>\n                <td>Stores randomly generated key used to prevent forged requests.</td>\n            </tr>\n            <tr>\n                <th>PHPSESSID</th>\n                <td>Your session ID on the server.</td>\n            </tr>\n            <tr>\n                <th>GUEST-VIEW</th>\n                <td>Allows guests to view and edit their orders.</td>\n            </tr>\n            <tr>\n                <th>PERSISTENT_SHOPPING_CART</th>\n                <td>A link to information about your cart and viewing history, if you have asked for this.</td>\n            </tr>\n            <tr>\n                <th>STF</th>\n                <td>Information on products you have emailed to friends.</td>\n            </tr>\n            <tr>\n                <th>STORE</th>\n                <td>The store view or language you have selected.</td>\n            </tr>\n            <tr>\n                <th>USER_ALLOWED_SAVE_COOKIE</th>\n                <td>Indicates whether a customer allowed to use cookies.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-SESSID</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE-SECTION-INVALIDATION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-TIMEOUT</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>SECTION-DATA-IDS</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>PRIVATE_CONTENT_VERSION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>X-MAGENTO-VARY</th>\n                <td>Facilitates caching of content on the server to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-FILE-VERSION</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-STORAGE</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n        </tbody>\n    </table>\n</div>', '2024-09-09 13:55:49', '2024-09-09 13:55:49', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_store`
--

CREATE TABLE `cms_page_store` (
  `page_id` smallint NOT NULL COMMENT 'Entity ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CMS Page To Store Linkage Table';

--
-- Dumping data for table `cms_page_store`
--

INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_config_data`
--

CREATE TABLE `core_config_data` (
  `config_id` int UNSIGNED NOT NULL COMMENT 'Config ID',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int NOT NULL DEFAULT '0' COMMENT 'Config Scope ID',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Config Data';

--
-- Dumping data for table `core_config_data`
--

INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`, `updated_at`) VALUES
(1, 'default', 0, 'general/region/display_all', '1', '2024-09-09 13:55:46'),
(2, 'default', 0, 'general/region/state_required', 'AL,AR,AU,BG,BO,BR,BY,CA,CH,CL,CN,CO,CR,CZ,DK,EC,EE,ES,GR,GY,HR,IN,IS,IT,LT,LV,MX,PE,PL,PT,PY,RO,SE,SR,UA,US,UY,VE', '2024-09-09 13:55:48'),
(3, 'default', 0, 'catalog/category/root_id', '2', '2024-09-09 13:55:49'),
(4, 'default', 0, 'twofactorauth/duo/application_key', 'PkuVVXXdNuZxVBFG3AWICGJSmNBg4bGW7LyMpWfagBfHMIhRg3GQk3DLb9XJfU1K', '2024-09-09 13:55:49'),
(5, 'default', 0, 'analytics/subscription/enabled', '1', '2024-09-09 13:55:50'),
(6, 'default', 0, 'crontab/default/jobs/analytics_subscribe/schedule/cron_expr', '0 * * * *', '2024-09-09 13:55:50'),
(7, 'default', 0, 'crontab/default/jobs/analytics_collect_data/schedule/cron_expr', '00 02 * * *', '2024-09-09 13:55:50'),
(8, 'default', 0, 'msp_securitysuite_recaptcha/frontend/enabled', '0', '2024-09-09 13:55:50'),
(9, 'default', 0, 'msp_securitysuite_recaptcha/backend/enabled', '0', '2024-09-09 13:55:50'),
(10, 'default', 0, 'catalog/search/engine', 'elasticsearch7', '2024-09-28 14:23:09'),
(11, 'default', 0, 'web/seo/use_rewrites', '1', '2024-09-09 14:06:33'),
(12, 'default', 0, 'web/unsecure/base_url', 'http://webtest.docker.net/', '2024-09-28 14:32:47'),
(13, 'default', 0, 'general/locale/code', 'en_US', '2024-09-09 14:06:33'),
(14, 'default', 0, 'general/locale/timezone', 'Asia/Jakarta', '2024-09-28 13:46:15'),
(15, 'default', 0, 'currency/options/base', 'VND', '2024-09-28 13:46:15'),
(16, 'default', 0, 'currency/options/default', 'VND', '2024-09-28 13:46:16'),
(17, 'default', 0, 'currency/options/allow', 'VND', '2024-09-28 13:46:17'),
(18, 'default', 0, 'admin/usage/enabled', '0', '2024-09-10 01:18:12'),
(19, 'default', 0, 'admin/dashboard/enable_charts', '1', '2024-09-28 08:25:35'),
(20, 'default', 0, 'catalog/search/elasticsearch7_server_hostname', 'localhost', '2024-09-28 14:23:09'),
(21, 'default', 0, 'catalog/search/elasticsearch7_server_port', '9200', '2024-09-28 14:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `cron_schedule`
--

CREATE TABLE `cron_schedule` (
  `schedule_id` int UNSIGNED NOT NULL COMMENT 'Schedule ID',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cron Schedule';

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity`
--

CREATE TABLE `customer_address_entity` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `parent_id` int UNSIGNED DEFAULT NULL COMMENT 'Parent ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `country_id` varchar(255) NOT NULL COMMENT 'Country',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `firstname` varchar(255) NOT NULL COMMENT 'First Name',
  `lastname` varchar(255) NOT NULL COMMENT 'Last Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Zip/Postal Code',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `region` varchar(255) DEFAULT NULL COMMENT 'State/Province',
  `region_id` int UNSIGNED DEFAULT NULL COMMENT 'State/Province',
  `street` text NOT NULL COMMENT 'Street Address',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `telephone` varchar(255) NOT NULL COMMENT 'Phone Number',
  `vat_id` varchar(255) DEFAULT NULL COMMENT 'VAT number',
  `vat_is_valid` int UNSIGNED DEFAULT NULL COMMENT 'VAT number validity',
  `vat_request_date` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request date',
  `vat_request_id` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request ID',
  `vat_request_success` int UNSIGNED DEFAULT NULL COMMENT 'VAT number validation request success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity';

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_datetime`
--

CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Datetime';

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_decimal`
--

CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Decimal';

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_int`
--

CREATE TABLE `customer_address_entity_int` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Int';

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_text`
--

CREATE TABLE `customer_address_entity_text` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Text';

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_varchar`
--

CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Varchar';

-- --------------------------------------------------------

--
-- Table structure for table `customer_dummy_cl`
--

CREATE TABLE `customer_dummy_cl` (
  `version_id` int UNSIGNED NOT NULL COMMENT 'Version ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='customer_dummy_cl';

-- --------------------------------------------------------

--
-- Table structure for table `customer_eav_attribute`
--

CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `is_visible` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  `is_used_in_grid` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `is_searchable_in_grid` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Searchable in Grid',
  `grid_filter_condition_type` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Grid Filter Condition Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Eav Attribute';

--
-- Dumping data for table `customer_eav_attribute`
--

INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`, `is_used_in_grid`, `is_visible_in_grid`, `is_filterable_in_grid`, `is_searchable_in_grid`, `grid_filter_condition_type`) VALUES
(1, 1, NULL, 0, NULL, 1, 10, NULL, 1, 1, 1, 0, 0),
(2, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0),
(3, 1, NULL, 0, NULL, 1, 20, NULL, 1, 1, 0, 1, 0),
(4, 0, NULL, 0, NULL, 0, 30, NULL, 0, 0, 0, 0, 0),
(5, 1, 'trim', 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 40, NULL, 0, 0, 0, 0, 0),
(6, 0, 'trim', 0, NULL, 0, 50, NULL, 0, 0, 0, 0, 0),
(7, 1, 'trim', 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 60, NULL, 0, 0, 0, 0, 0),
(8, 0, NULL, 0, NULL, 0, 70, NULL, 0, 0, 0, 0, 0),
(9, 1, NULL, 0, '{\"input_validation\":\"email\"}', 1, 80, NULL, 1, 1, 1, 1, 0),
(10, 1, NULL, 0, NULL, 1, 25, NULL, 1, 1, 1, 0, 0),
(11, 0, 'date', 0, '{\"input_validation\":\"date\"}', 0, 90, NULL, 1, 1, 1, 0, 0),
(12, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0),
(13, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0),
(14, 0, NULL, 0, '{\"input_validation\":\"date\"}', 1, 0, NULL, 0, 0, 0, 0, 0),
(15, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0),
(16, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0),
(17, 0, NULL, 0, '{\"max_text_length\":255}', 0, 100, NULL, 1, 1, 0, 1, 0),
(18, 0, NULL, 0, NULL, 1, 0, NULL, 1, 1, 1, 0, 0),
(19, 0, NULL, 0, NULL, 0, 0, NULL, 1, 1, 1, 0, 0),
(20, 0, NULL, 0, '[]', 0, 110, NULL, 1, 1, 1, 0, 0),
(21, 1, NULL, 0, NULL, 1, 28, NULL, 0, 0, 0, 0, 0),
(22, 0, NULL, 0, NULL, 0, 10, NULL, 0, 0, 0, 0, 0),
(23, 1, 'trim', 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 20, NULL, 1, 0, 0, 1, 0),
(24, 0, 'trim', 0, NULL, 0, 30, NULL, 0, 0, 0, 0, 0),
(25, 1, 'trim', 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 40, NULL, 1, 0, 0, 1, 0),
(26, 0, NULL, 0, NULL, 0, 50, NULL, 0, 0, 0, 0, 0),
(27, 1, NULL, 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 60, NULL, 1, 0, 0, 1, 0),
(28, 1, NULL, 2, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 70, NULL, 1, 0, 0, 1, 0),
(29, 1, NULL, 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 100, NULL, 1, 0, 0, 1, 0),
(30, 1, NULL, 0, NULL, 1, 80, NULL, 1, 1, 1, 0, 0),
(31, 1, NULL, 0, NULL, 1, 90, NULL, 1, 1, 0, 1, 0),
(32, 1, NULL, 0, NULL, 1, 90, NULL, 0, 0, 0, 0, 0),
(33, 1, NULL, 0, '[]', 1, 110, 'Magento\\Customer\\Model\\Attribute\\Data\\Postcode', 1, 1, 1, 1, 0),
(34, 1, NULL, 0, '{\"max_text_length\":255,\"min_text_length\":1}', 1, 120, NULL, 1, 1, 1, 1, 0),
(35, 0, NULL, 0, '{\"max_text_length\":255,\"min_text_length\":1}', 0, 130, NULL, 1, 0, 0, 1, 0),
(36, 1, NULL, 0, NULL, 1, 140, NULL, 0, 0, 0, 0, 0),
(37, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0),
(38, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0),
(39, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0),
(40, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0),
(41, 0, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0),
(42, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0),
(43, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0),
(44, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_eav_attribute_website`
--

CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `is_visible` smallint UNSIGNED DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint UNSIGNED DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint UNSIGNED DEFAULT NULL COMMENT 'Multiline Count'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Eav Attribute Website';

--
-- Dumping data for table `customer_eav_attribute_website`
--

INSERT INTO `customer_eav_attribute_website` (`attribute_id`, `website_id`, `is_visible`, `is_required`, `default_value`, `multiline_count`) VALUES
(1, 1, NULL, NULL, NULL, NULL),
(3, 1, NULL, NULL, NULL, NULL),
(5, 1, NULL, NULL, NULL, NULL),
(6, 1, NULL, NULL, NULL, NULL),
(7, 1, NULL, NULL, NULL, NULL),
(9, 1, NULL, NULL, NULL, NULL),
(10, 1, NULL, NULL, NULL, NULL),
(11, 1, NULL, NULL, NULL, NULL),
(17, 1, NULL, NULL, NULL, NULL),
(18, 1, NULL, NULL, NULL, NULL),
(19, 1, NULL, NULL, NULL, NULL),
(20, 1, NULL, NULL, NULL, NULL),
(21, 1, NULL, NULL, NULL, NULL),
(23, 1, NULL, NULL, NULL, NULL),
(24, 1, NULL, NULL, NULL, NULL),
(25, 1, NULL, NULL, NULL, NULL),
(27, 1, NULL, NULL, NULL, NULL),
(28, 1, NULL, NULL, NULL, NULL),
(29, 1, NULL, NULL, NULL, NULL),
(30, 1, NULL, NULL, NULL, NULL),
(31, 1, NULL, NULL, NULL, NULL),
(32, 1, NULL, NULL, NULL, NULL),
(33, 1, NULL, NULL, NULL, NULL),
(34, 1, NULL, NULL, NULL, NULL),
(35, 1, NULL, NULL, NULL, NULL),
(36, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity`
--

CREATE TABLE `customer_entity` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `website_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Website ID',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Group ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `store_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  `created_in` varchar(255) DEFAULT NULL COMMENT 'Created From',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name/Initial',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last Name',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `password_hash` varchar(128) DEFAULT NULL COMMENT 'Password_hash',
  `rp_token` varchar(128) DEFAULT NULL COMMENT 'Reset password token',
  `rp_token_created_at` datetime DEFAULT NULL COMMENT 'Reset password token creation time',
  `default_billing` int UNSIGNED DEFAULT NULL COMMENT 'Default Billing Address',
  `default_shipping` int UNSIGNED DEFAULT NULL COMMENT 'Default Shipping Address',
  `taxvat` varchar(50) DEFAULT NULL COMMENT 'Tax/VAT Number',
  `confirmation` varchar(64) DEFAULT NULL COMMENT 'Is Confirmed',
  `gender` smallint UNSIGNED DEFAULT NULL COMMENT 'Gender',
  `failures_num` smallint DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock Expiration Date',
  `session_cutoff` timestamp NULL DEFAULT NULL COMMENT 'Session Cutoff Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity';

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_datetime`
--

CREATE TABLE `customer_entity_datetime` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Datetime';

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_decimal`
--

CREATE TABLE `customer_entity_decimal` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Decimal';

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_int`
--

CREATE TABLE `customer_entity_int` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Int';

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_text`
--

CREATE TABLE `customer_entity_text` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Text';

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_varchar`
--

CREATE TABLE `customer_entity_varchar` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Varchar';

-- --------------------------------------------------------

--
-- Table structure for table `customer_form_attribute`
--

CREATE TABLE `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Form Attribute';

--
-- Dumping data for table `customer_form_attribute`
--

INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES
('adminhtml_customer', 1),
('adminhtml_customer', 3),
('adminhtml_customer', 4),
('customer_account_create', 4),
('customer_account_edit', 4),
('adminhtml_customer', 5),
('customer_account_create', 5),
('customer_account_edit', 5),
('adminhtml_customer', 6),
('customer_account_create', 6),
('customer_account_edit', 6),
('adminhtml_customer', 7),
('customer_account_create', 7),
('customer_account_edit', 7),
('adminhtml_customer', 8),
('customer_account_create', 8),
('customer_account_edit', 8),
('adminhtml_checkout', 9),
('adminhtml_customer', 9),
('customer_account_create', 9),
('customer_account_edit', 9),
('adminhtml_checkout', 10),
('adminhtml_customer', 10),
('adminhtml_checkout', 11),
('adminhtml_customer', 11),
('customer_account_create', 11),
('customer_account_edit', 11),
('adminhtml_checkout', 17),
('adminhtml_customer', 17),
('customer_account_create', 17),
('customer_account_edit', 17),
('adminhtml_customer', 19),
('customer_account_create', 19),
('customer_account_edit', 19),
('adminhtml_checkout', 20),
('adminhtml_customer', 20),
('customer_account_create', 20),
('customer_account_edit', 20),
('adminhtml_customer', 21),
('adminhtml_customer_address', 22),
('customer_address_edit', 22),
('customer_register_address', 22),
('adminhtml_customer_address', 23),
('customer_address_edit', 23),
('customer_register_address', 23),
('adminhtml_customer_address', 24),
('customer_address_edit', 24),
('customer_register_address', 24),
('adminhtml_customer_address', 25),
('customer_address_edit', 25),
('customer_register_address', 25),
('adminhtml_customer_address', 26),
('customer_address_edit', 26),
('customer_register_address', 26),
('adminhtml_customer_address', 27),
('customer_address_edit', 27),
('customer_register_address', 27),
('adminhtml_customer_address', 28),
('customer_address_edit', 28),
('customer_register_address', 28),
('adminhtml_customer_address', 29),
('customer_address_edit', 29),
('customer_register_address', 29),
('adminhtml_customer_address', 30),
('customer_address_edit', 30),
('customer_register_address', 30),
('adminhtml_customer_address', 31),
('customer_address_edit', 31),
('customer_register_address', 31),
('adminhtml_customer_address', 32),
('customer_address_edit', 32),
('customer_register_address', 32),
('adminhtml_customer_address', 33),
('customer_address_edit', 33),
('customer_register_address', 33),
('adminhtml_customer_address', 34),
('customer_address_edit', 34),
('customer_register_address', 34),
('adminhtml_customer_address', 35),
('customer_address_edit', 35),
('customer_register_address', 35),
('adminhtml_customer_address', 36),
('customer_address_edit', 36),
('customer_register_address', 36);

-- --------------------------------------------------------

--
-- Table structure for table `customer_grid_flat`
--

CREATE TABLE `customer_grid_flat` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `name` text COMMENT 'Name',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` int DEFAULT NULL COMMENT 'Group_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `website_id` int DEFAULT NULL COMMENT 'Website_id',
  `confirmation` varchar(255) DEFAULT NULL COMMENT 'Confirmation',
  `created_in` text COMMENT 'Created_in',
  `dob` date DEFAULT NULL COMMENT 'Dob',
  `gender` int DEFAULT NULL COMMENT 'Gender',
  `taxvat` varchar(255) DEFAULT NULL COMMENT 'Taxvat',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock_expires',
  `shipping_full` text COMMENT 'Shipping_full',
  `billing_full` text COMMENT 'Billing_full',
  `billing_firstname` varchar(255) DEFAULT NULL COMMENT 'Billing_firstname',
  `billing_lastname` varchar(255) DEFAULT NULL COMMENT 'Billing_lastname',
  `billing_telephone` varchar(255) DEFAULT NULL COMMENT 'Billing_telephone',
  `billing_postcode` varchar(255) DEFAULT NULL COMMENT 'Billing_postcode',
  `billing_country_id` varchar(255) DEFAULT NULL COMMENT 'Billing_country_id',
  `billing_region` varchar(255) DEFAULT NULL COMMENT 'Billing_region',
  `billing_region_id` int DEFAULT NULL COMMENT 'Billing_region_id',
  `billing_street` varchar(255) DEFAULT NULL COMMENT 'Billing_street',
  `billing_city` varchar(255) DEFAULT NULL COMMENT 'Billing_city',
  `billing_fax` varchar(255) DEFAULT NULL COMMENT 'Billing_fax',
  `billing_vat_id` varchar(255) DEFAULT NULL COMMENT 'Billing_vat_id',
  `billing_company` varchar(255) DEFAULT NULL COMMENT 'Billing_company'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='customer_grid_flat';

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE `customer_group` (
  `customer_group_id` int UNSIGNED NOT NULL,
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Tax Class ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Group';

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES
(0, 'NOT LOGGED IN', 3),
(1, 'General', 3),
(2, 'Wholesale', 3),
(3, 'Retailer', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer_group_excluded_website`
--

CREATE TABLE `customer_group_excluded_website` (
  `entity_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Excluded Website ID from Customer Group'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Excluded Websites From Customer Group';

-- --------------------------------------------------------

--
-- Table structure for table `customer_log`
--

CREATE TABLE `customer_log` (
  `log_id` int NOT NULL COMMENT 'Log ID',
  `customer_id` int NOT NULL COMMENT 'Customer ID',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'Last Login Time',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'Last Logout Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Log Table';

-- --------------------------------------------------------

--
-- Table structure for table `customer_visitor`
--

CREATE TABLE `customer_visitor` (
  `visitor_id` bigint UNSIGNED NOT NULL COMMENT 'Visitor ID',
  `customer_id` int DEFAULT NULL COMMENT 'Customer ID',
  `session_id` varchar(1) DEFAULT NULL COMMENT 'Deprecated: Session ID value no longer used',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `last_visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Visit Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Visitor Table';

-- --------------------------------------------------------

--
-- Table structure for table `data_exporter_uuid`
--

CREATE TABLE `data_exporter_uuid` (
  `uuid` varchar(36) NOT NULL COMMENT 'Entity UUID',
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `type` varchar(36) NOT NULL COMMENT 'Entity type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Data Export Items UUID References Table';

-- --------------------------------------------------------

--
-- Table structure for table `design_change`
--

CREATE TABLE `design_change` (
  `design_change_id` int NOT NULL COMMENT 'Design Change ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Design Changes';

-- --------------------------------------------------------

--
-- Table structure for table `design_config_dummy_cl`
--

CREATE TABLE `design_config_dummy_cl` (
  `version_id` int UNSIGNED NOT NULL COMMENT 'Version ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='design_config_dummy_cl';

-- --------------------------------------------------------

--
-- Table structure for table `design_config_grid_flat`
--

CREATE TABLE `design_config_grid_flat` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `store_website_id` int DEFAULT NULL COMMENT 'Store_website_id',
  `store_group_id` int DEFAULT NULL COMMENT 'Store_group_id',
  `store_id` int DEFAULT NULL COMMENT 'Store_id',
  `theme_theme_id` varchar(255) DEFAULT NULL COMMENT 'Theme_theme_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='design_config_grid_flat';

--
-- Dumping data for table `design_config_grid_flat`
--

INSERT INTO `design_config_grid_flat` (`entity_id`, `store_website_id`, `store_group_id`, `store_id`, `theme_theme_id`) VALUES
(0, NULL, NULL, NULL, ''),
(1, 1, NULL, NULL, ''),
(2, 1, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country`
--

CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country ID in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country';

--
-- Dumping data for table `directory_country`
--

INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES
('AD', 'AD', 'AND'),
('AE', 'AE', 'ARE'),
('AF', 'AF', 'AFG'),
('AG', 'AG', 'ATG'),
('AI', 'AI', 'AIA'),
('AL', 'AL', 'ALB'),
('AM', 'AM', 'ARM'),
('AN', 'AN', 'ANT'),
('AO', 'AO', 'AGO'),
('AQ', 'AQ', 'ATA'),
('AR', 'AR', 'ARG'),
('AS', 'AS', 'ASM'),
('AT', 'AT', 'AUT'),
('AU', 'AU', 'AUS'),
('AW', 'AW', 'ABW'),
('AX', 'AX', 'ALA'),
('AZ', 'AZ', 'AZE'),
('BA', 'BA', 'BIH'),
('BB', 'BB', 'BRB'),
('BD', 'BD', 'BGD'),
('BE', 'BE', 'BEL'),
('BF', 'BF', 'BFA'),
('BG', 'BG', 'BGR'),
('BH', 'BH', 'BHR'),
('BI', 'BI', 'BDI'),
('BJ', 'BJ', 'BEN'),
('BL', 'BL', 'BLM'),
('BM', 'BM', 'BMU'),
('BN', 'BN', 'BRN'),
('BO', 'BO', 'BOL'),
('BQ', 'BQ', 'BES'),
('BR', 'BR', 'BRA'),
('BS', 'BS', 'BHS'),
('BT', 'BT', 'BTN'),
('BV', 'BV', 'BVT'),
('BW', 'BW', 'BWA'),
('BY', 'BY', 'BLR'),
('BZ', 'BZ', 'BLZ'),
('CA', 'CA', 'CAN'),
('CC', 'CC', 'CCK'),
('CD', 'CD', 'COD'),
('CF', 'CF', 'CAF'),
('CG', 'CG', 'COG'),
('CH', 'CH', 'CHE'),
('CI', 'CI', 'CIV'),
('CK', 'CK', 'COK'),
('CL', 'CL', 'CHL'),
('CM', 'CM', 'CMR'),
('CN', 'CN', 'CHN'),
('CO', 'CO', 'COL'),
('CR', 'CR', 'CRI'),
('CU', 'CU', 'CUB'),
('CV', 'CV', 'CPV'),
('CW', 'CW', 'CUW'),
('CX', 'CX', 'CXR'),
('CY', 'CY', 'CYP'),
('CZ', 'CZ', 'CZE'),
('DE', 'DE', 'DEU'),
('DJ', 'DJ', 'DJI'),
('DK', 'DK', 'DNK'),
('DM', 'DM', 'DMA'),
('DO', 'DO', 'DOM'),
('DZ', 'DZ', 'DZA'),
('EC', 'EC', 'ECU'),
('EE', 'EE', 'EST'),
('EG', 'EG', 'EGY'),
('EH', 'EH', 'ESH'),
('ER', 'ER', 'ERI'),
('ES', 'ES', 'ESP'),
('ET', 'ET', 'ETH'),
('FI', 'FI', 'FIN'),
('FJ', 'FJ', 'FJI'),
('FK', 'FK', 'FLK'),
('FM', 'FM', 'FSM'),
('FO', 'FO', 'FRO'),
('FR', 'FR', 'FRA'),
('GA', 'GA', 'GAB'),
('GB', 'GB', 'GBR'),
('GD', 'GD', 'GRD'),
('GE', 'GE', 'GEO'),
('GF', 'GF', 'GUF'),
('GG', 'GG', 'GGY'),
('GH', 'GH', 'GHA'),
('GI', 'GI', 'GIB'),
('GL', 'GL', 'GRL'),
('GM', 'GM', 'GMB'),
('GN', 'GN', 'GIN'),
('GP', 'GP', 'GLP'),
('GQ', 'GQ', 'GNQ'),
('GR', 'GR', 'GRC'),
('GS', 'GS', 'SGS'),
('GT', 'GT', 'GTM'),
('GU', 'GU', 'GUM'),
('GW', 'GW', 'GNB'),
('GY', 'GY', 'GUY'),
('HK', 'HK', 'HKG'),
('HM', 'HM', 'HMD'),
('HN', 'HN', 'HND'),
('HR', 'HR', 'HRV'),
('HT', 'HT', 'HTI'),
('HU', 'HU', 'HUN'),
('ID', 'ID', 'IDN'),
('IE', 'IE', 'IRL'),
('IL', 'IL', 'ISR'),
('IM', 'IM', 'IMN'),
('IN', 'IN', 'IND'),
('IO', 'IO', 'IOT'),
('IQ', 'IQ', 'IRQ'),
('IR', 'IR', 'IRN'),
('IS', 'IS', 'ISL'),
('IT', 'IT', 'ITA'),
('JE', 'JE', 'JEY'),
('JM', 'JM', 'JAM'),
('JO', 'JO', 'JOR'),
('JP', 'JP', 'JPN'),
('KE', 'KE', 'KEN'),
('KG', 'KG', 'KGZ'),
('KH', 'KH', 'KHM'),
('KI', 'KI', 'KIR'),
('KM', 'KM', 'COM'),
('KN', 'KN', 'KNA'),
('KP', 'KP', 'PRK'),
('KR', 'KR', 'KOR'),
('KW', 'KW', 'KWT'),
('KY', 'KY', 'CYM'),
('KZ', 'KZ', 'KAZ'),
('LA', 'LA', 'LAO'),
('LB', 'LB', 'LBN'),
('LC', 'LC', 'LCA'),
('LI', 'LI', 'LIE'),
('LK', 'LK', 'LKA'),
('LR', 'LR', 'LBR'),
('LS', 'LS', 'LSO'),
('LT', 'LT', 'LTU'),
('LU', 'LU', 'LUX'),
('LV', 'LV', 'LVA'),
('LY', 'LY', 'LBY'),
('MA', 'MA', 'MAR'),
('MC', 'MC', 'MCO'),
('MD', 'MD', 'MDA'),
('ME', 'ME', 'MNE'),
('MF', 'MF', 'MAF'),
('MG', 'MG', 'MDG'),
('MH', 'MH', 'MHL'),
('MK', 'MK', 'MKD'),
('ML', 'ML', 'MLI'),
('MM', 'MM', 'MMR'),
('MN', 'MN', 'MNG'),
('MO', 'MO', 'MAC'),
('MP', 'MP', 'MNP'),
('MQ', 'MQ', 'MTQ'),
('MR', 'MR', 'MRT'),
('MS', 'MS', 'MSR'),
('MT', 'MT', 'MLT'),
('MU', 'MU', 'MUS'),
('MV', 'MV', 'MDV'),
('MW', 'MW', 'MWI'),
('MX', 'MX', 'MEX'),
('MY', 'MY', 'MYS'),
('MZ', 'MZ', 'MOZ'),
('NA', 'NA', 'NAM'),
('NC', 'NC', 'NCL'),
('NE', 'NE', 'NER'),
('NF', 'NF', 'NFK'),
('NG', 'NG', 'NGA'),
('NI', 'NI', 'NIC'),
('NL', 'NL', 'NLD'),
('NO', 'NO', 'NOR'),
('NP', 'NP', 'NPL'),
('NR', 'NR', 'NRU'),
('NU', 'NU', 'NIU'),
('NZ', 'NZ', 'NZL'),
('OM', 'OM', 'OMN'),
('PA', 'PA', 'PAN'),
('PE', 'PE', 'PER'),
('PF', 'PF', 'PYF'),
('PG', 'PG', 'PNG'),
('PH', 'PH', 'PHL'),
('PK', 'PK', 'PAK'),
('PL', 'PL', 'POL'),
('PM', 'PM', 'SPM'),
('PN', 'PN', 'PCN'),
('PS', 'PS', 'PSE'),
('PT', 'PT', 'PRT'),
('PW', 'PW', 'PLW'),
('PY', 'PY', 'PRY'),
('QA', 'QA', 'QAT'),
('RE', 'RE', 'REU'),
('RO', 'RO', 'ROU'),
('RS', 'RS', 'SRB'),
('RU', 'RU', 'RUS'),
('RW', 'RW', 'RWA'),
('SA', 'SA', 'SAU'),
('SB', 'SB', 'SLB'),
('SC', 'SC', 'SYC'),
('SD', 'SD', 'SDN'),
('SE', 'SE', 'SWE'),
('SG', 'SG', 'SGP'),
('SH', 'SH', 'SHN'),
('SI', 'SI', 'SVN'),
('SJ', 'SJ', 'SJM'),
('SK', 'SK', 'SVK'),
('SL', 'SL', 'SLE'),
('SM', 'SM', 'SMR'),
('SN', 'SN', 'SEN'),
('SO', 'SO', 'SOM'),
('SR', 'SR', 'SUR'),
('ST', 'ST', 'STP'),
('SV', 'SV', 'SLV'),
('SX', 'SX', 'SXM'),
('SY', 'SY', 'SYR'),
('SZ', 'SZ', 'SWZ'),
('TC', 'TC', 'TCA'),
('TD', 'TD', 'TCD'),
('TF', 'TF', 'ATF'),
('TG', 'TG', 'TGO'),
('TH', 'TH', 'THA'),
('TJ', 'TJ', 'TJK'),
('TK', 'TK', 'TKL'),
('TL', 'TL', 'TLS'),
('TM', 'TM', 'TKM'),
('TN', 'TN', 'TUN'),
('TO', 'TO', 'TON'),
('TR', 'TR', 'TUR'),
('TT', 'TT', 'TTO'),
('TV', 'TV', 'TUV'),
('TW', 'TW', 'TWN'),
('TZ', 'TZ', 'TZA'),
('UA', 'UA', 'UKR'),
('UG', 'UG', 'UGA'),
('UM', 'UM', 'UMI'),
('US', 'US', 'USA'),
('UY', 'UY', 'URY'),
('UZ', 'UZ', 'UZB'),
('VA', 'VA', 'VAT'),
('VC', 'VC', 'VCT'),
('VE', 'VE', 'VEN'),
('VG', 'VG', 'VGB'),
('VI', 'VI', 'VIR'),
('VN', 'VN', 'VNM'),
('VU', 'VU', 'VUT'),
('WF', 'WF', 'WLF'),
('WS', 'WS', 'WSM'),
('XK', 'XK', 'XKX'),
('YE', 'YE', 'YEM'),
('YT', 'YT', 'MYT'),
('ZA', 'ZA', 'ZAF'),
('ZM', 'ZM', 'ZMB'),
('ZW', 'ZW', 'ZWE');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_format`
--

CREATE TABLE `directory_country_format` (
  `country_format_id` int UNSIGNED NOT NULL COMMENT 'Country Format ID',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country ID in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country Format';

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region`
--

CREATE TABLE `directory_country_region` (
  `region_id` int UNSIGNED NOT NULL COMMENT 'Region ID',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country ID in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country Region';

--
-- Dumping data for table `directory_country_region`
--

INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES
(1, 'US', 'AL', 'Alabama'),
(2, 'US', 'AK', 'Alaska'),
(3, 'US', 'AS', 'American Samoa'),
(4, 'US', 'AZ', 'Arizona'),
(5, 'US', 'AR', 'Arkansas'),
(6, 'US', 'AE', 'Armed Forces Africa'),
(7, 'US', 'AA', 'Armed Forces Americas'),
(8, 'US', 'AE', 'Armed Forces Canada'),
(9, 'US', 'AE', 'Armed Forces Europe'),
(10, 'US', 'AE', 'Armed Forces Middle East'),
(11, 'US', 'AP', 'Armed Forces Pacific'),
(12, 'US', 'CA', 'California'),
(13, 'US', 'CO', 'Colorado'),
(14, 'US', 'CT', 'Connecticut'),
(15, 'US', 'DE', 'Delaware'),
(16, 'US', 'DC', 'District of Columbia'),
(17, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 'US', 'FL', 'Florida'),
(19, 'US', 'GA', 'Georgia'),
(20, 'US', 'GU', 'Guam'),
(21, 'US', 'HI', 'Hawaii'),
(22, 'US', 'ID', 'Idaho'),
(23, 'US', 'IL', 'Illinois'),
(24, 'US', 'IN', 'Indiana'),
(25, 'US', 'IA', 'Iowa'),
(26, 'US', 'KS', 'Kansas'),
(27, 'US', 'KY', 'Kentucky'),
(28, 'US', 'LA', 'Louisiana'),
(29, 'US', 'ME', 'Maine'),
(30, 'US', 'MH', 'Marshall Islands'),
(31, 'US', 'MD', 'Maryland'),
(32, 'US', 'MA', 'Massachusetts'),
(33, 'US', 'MI', 'Michigan'),
(34, 'US', 'MN', 'Minnesota'),
(35, 'US', 'MS', 'Mississippi'),
(36, 'US', 'MO', 'Missouri'),
(37, 'US', 'MT', 'Montana'),
(38, 'US', 'NE', 'Nebraska'),
(39, 'US', 'NV', 'Nevada'),
(40, 'US', 'NH', 'New Hampshire'),
(41, 'US', 'NJ', 'New Jersey'),
(42, 'US', 'NM', 'New Mexico'),
(43, 'US', 'NY', 'New York'),
(44, 'US', 'NC', 'North Carolina'),
(45, 'US', 'ND', 'North Dakota'),
(46, 'US', 'MP', 'Northern Mariana Islands'),
(47, 'US', 'OH', 'Ohio'),
(48, 'US', 'OK', 'Oklahoma'),
(49, 'US', 'OR', 'Oregon'),
(50, 'US', 'PW', 'Palau'),
(51, 'US', 'PA', 'Pennsylvania'),
(52, 'US', 'PR', 'Puerto Rico'),
(53, 'US', 'RI', 'Rhode Island'),
(54, 'US', 'SC', 'South Carolina'),
(55, 'US', 'SD', 'South Dakota'),
(56, 'US', 'TN', 'Tennessee'),
(57, 'US', 'TX', 'Texas'),
(58, 'US', 'UT', 'Utah'),
(59, 'US', 'VT', 'Vermont'),
(60, 'US', 'VI', 'Virgin Islands'),
(61, 'US', 'VA', 'Virginia'),
(62, 'US', 'WA', 'Washington'),
(63, 'US', 'WV', 'West Virginia'),
(64, 'US', 'WI', 'Wisconsin'),
(65, 'US', 'WY', 'Wyoming'),
(66, 'CA', 'AB', 'Alberta'),
(67, 'CA', 'BC', 'British Columbia'),
(68, 'CA', 'MB', 'Manitoba'),
(69, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 'CA', 'NB', 'New Brunswick'),
(71, 'CA', 'NS', 'Nova Scotia'),
(72, 'CA', 'NT', 'Northwest Territories'),
(73, 'CA', 'NU', 'Nunavut'),
(74, 'CA', 'ON', 'Ontario'),
(75, 'CA', 'PE', 'Prince Edward Island'),
(76, 'CA', 'QC', 'Quebec'),
(77, 'CA', 'SK', 'Saskatchewan'),
(78, 'CA', 'YT', 'Yukon Territory'),
(79, 'DE', 'NDS', 'Niedersachsen'),
(80, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 'DE', 'BAY', 'Bayern'),
(82, 'DE', 'BER', 'Berlin'),
(83, 'DE', 'BRG', 'Brandenburg'),
(84, 'DE', 'BRE', 'Bremen'),
(85, 'DE', 'HAM', 'Hamburg'),
(86, 'DE', 'HES', 'Hessen'),
(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 'DE', 'SAR', 'Saarland'),
(91, 'DE', 'SAS', 'Sachsen'),
(92, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 'DE', 'THE', 'Thüringen'),
(95, 'AT', 'WI', 'Wien'),
(96, 'AT', 'NO', 'Niederösterreich'),
(97, 'AT', 'OO', 'Oberösterreich'),
(98, 'AT', 'SB', 'Salzburg'),
(99, 'AT', 'KN', 'Kärnten'),
(100, 'AT', 'ST', 'Steiermark'),
(101, 'AT', 'TI', 'Tirol'),
(102, 'AT', 'BL', 'Burgenland'),
(103, 'AT', 'VB', 'Vorarlberg'),
(104, 'CH', 'AG', 'Aargau'),
(105, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 'CH', 'BE', 'Bern'),
(108, 'CH', 'BL', 'Basel-Landschaft'),
(109, 'CH', 'BS', 'Basel-Stadt'),
(110, 'CH', 'FR', 'Friburg'),
(111, 'CH', 'GE', 'Geneva'),
(112, 'CH', 'GL', 'Glarus'),
(113, 'CH', 'GR', 'Graubünden'),
(114, 'CH', 'JU', 'Jura'),
(115, 'CH', 'LU', 'Lucerne'),
(116, 'CH', 'NE', 'Neuchâtel'),
(117, 'CH', 'NW', 'Nidwalden'),
(118, 'CH', 'OW', 'Obwalden'),
(119, 'CH', 'SG', 'St. Gallen'),
(120, 'CH', 'SH', 'Schaffhausen'),
(121, 'CH', 'SO', 'Solothurn'),
(122, 'CH', 'SZ', 'Schwyz'),
(123, 'CH', 'TG', 'Thurgau'),
(124, 'CH', 'TI', 'Ticino'),
(125, 'CH', 'UR', 'Uri'),
(126, 'CH', 'VD', 'Vaud'),
(127, 'CH', 'VS', 'Wallis'),
(128, 'CH', 'ZG', 'Zug'),
(129, 'CH', 'ZH', 'Zürich'),
(130, 'ES', 'A Coruсa', 'A Coruña'),
(131, 'ES', 'Alava', 'Alava'),
(132, 'ES', 'Albacete', 'Albacete'),
(133, 'ES', 'Alicante', 'Alicante'),
(134, 'ES', 'Almeria', 'Almeria'),
(135, 'ES', 'Asturias', 'Asturias'),
(136, 'ES', 'Avila', 'Avila'),
(137, 'ES', 'Badajoz', 'Badajoz'),
(138, 'ES', 'Baleares', 'Baleares'),
(139, 'ES', 'Barcelona', 'Barcelona'),
(140, 'ES', 'Burgos', 'Burgos'),
(141, 'ES', 'Caceres', 'Caceres'),
(142, 'ES', 'Cadiz', 'Cadiz'),
(143, 'ES', 'Cantabria', 'Cantabria'),
(144, 'ES', 'Castellon', 'Castellon'),
(145, 'ES', 'Ceuta', 'Ceuta'),
(146, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 'ES', 'Cordoba', 'Cordoba'),
(148, 'ES', 'Cuenca', 'Cuenca'),
(149, 'ES', 'Girona', 'Girona'),
(150, 'ES', 'Granada', 'Granada'),
(151, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 'ES', 'Huelva', 'Huelva'),
(154, 'ES', 'Huesca', 'Huesca'),
(155, 'ES', 'Jaen', 'Jaen'),
(156, 'ES', 'La Rioja', 'La Rioja'),
(157, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 'ES', 'Leon', 'Leon'),
(159, 'ES', 'Lleida', 'Lleida'),
(160, 'ES', 'Lugo', 'Lugo'),
(161, 'ES', 'Madrid', 'Madrid'),
(162, 'ES', 'Malaga', 'Malaga'),
(163, 'ES', 'Melilla', 'Melilla'),
(164, 'ES', 'Murcia', 'Murcia'),
(165, 'ES', 'Navarra', 'Navarra'),
(166, 'ES', 'Ourense', 'Ourense'),
(167, 'ES', 'Palencia', 'Palencia'),
(168, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 'ES', 'Salamanca', 'Salamanca'),
(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 'ES', 'Segovia', 'Segovia'),
(172, 'ES', 'Sevilla', 'Sevilla'),
(173, 'ES', 'Soria', 'Soria'),
(174, 'ES', 'Tarragona', 'Tarragona'),
(175, 'ES', 'Teruel', 'Teruel'),
(176, 'ES', 'Toledo', 'Toledo'),
(177, 'ES', 'Valencia', 'Valencia'),
(178, 'ES', 'Valladolid', 'Valladolid'),
(179, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 'ES', 'Zamora', 'Zamora'),
(181, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 'FR', '1', 'Ain'),
(183, 'FR', '2', 'Aisne'),
(184, 'FR', '3', 'Allier'),
(185, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 'FR', '5', 'Hautes-Alpes'),
(187, 'FR', '6', 'Alpes-Maritimes'),
(188, 'FR', '7', 'Ardèche'),
(189, 'FR', '8', 'Ardennes'),
(190, 'FR', '9', 'Ariège'),
(191, 'FR', '10', 'Aube'),
(192, 'FR', '11', 'Aude'),
(193, 'FR', '12', 'Aveyron'),
(194, 'FR', '13', 'Bouches-du-Rhône'),
(195, 'FR', '14', 'Calvados'),
(196, 'FR', '15', 'Cantal'),
(197, 'FR', '16', 'Charente'),
(198, 'FR', '17', 'Charente-Maritime'),
(199, 'FR', '18', 'Cher'),
(200, 'FR', '19', 'Corrèze'),
(201, 'FR', '2A', 'Corse-du-Sud'),
(202, 'FR', '2B', 'Haute-Corse'),
(203, 'FR', '21', 'Côte-d\'Or'),
(204, 'FR', '22', 'Côtes-d\'Armor'),
(205, 'FR', '23', 'Creuse'),
(206, 'FR', '24', 'Dordogne'),
(207, 'FR', '25', 'Doubs'),
(208, 'FR', '26', 'Drôme'),
(209, 'FR', '27', 'Eure'),
(210, 'FR', '28', 'Eure-et-Loir'),
(211, 'FR', '29', 'Finistère'),
(212, 'FR', '30', 'Gard'),
(213, 'FR', '31', 'Haute-Garonne'),
(214, 'FR', '32', 'Gers'),
(215, 'FR', '33', 'Gironde'),
(216, 'FR', '34', 'Hérault'),
(217, 'FR', '35', 'Ille-et-Vilaine'),
(218, 'FR', '36', 'Indre'),
(219, 'FR', '37', 'Indre-et-Loire'),
(220, 'FR', '38', 'Isère'),
(221, 'FR', '39', 'Jura'),
(222, 'FR', '40', 'Landes'),
(223, 'FR', '41', 'Loir-et-Cher'),
(224, 'FR', '42', 'Loire'),
(225, 'FR', '43', 'Haute-Loire'),
(226, 'FR', '44', 'Loire-Atlantique'),
(227, 'FR', '45', 'Loiret'),
(228, 'FR', '46', 'Lot'),
(229, 'FR', '47', 'Lot-et-Garonne'),
(230, 'FR', '48', 'Lozère'),
(231, 'FR', '49', 'Maine-et-Loire'),
(232, 'FR', '50', 'Manche'),
(233, 'FR', '51', 'Marne'),
(234, 'FR', '52', 'Haute-Marne'),
(235, 'FR', '53', 'Mayenne'),
(236, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 'FR', '55', 'Meuse'),
(238, 'FR', '56', 'Morbihan'),
(239, 'FR', '57', 'Moselle'),
(240, 'FR', '58', 'Nièvre'),
(241, 'FR', '59', 'Nord'),
(242, 'FR', '60', 'Oise'),
(243, 'FR', '61', 'Orne'),
(244, 'FR', '62', 'Pas-de-Calais'),
(245, 'FR', '63', 'Puy-de-Dôme'),
(246, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 'FR', '65', 'Hautes-Pyrénées'),
(248, 'FR', '66', 'Pyrénées-Orientales'),
(249, 'FR', '67', 'Bas-Rhin'),
(250, 'FR', '68', 'Haut-Rhin'),
(251, 'FR', '69', 'Rhône'),
(252, 'FR', '70', 'Haute-Saône'),
(253, 'FR', '71', 'Saône-et-Loire'),
(254, 'FR', '72', 'Sarthe'),
(255, 'FR', '73', 'Savoie'),
(256, 'FR', '74', 'Haute-Savoie'),
(257, 'FR', '75', 'Paris'),
(258, 'FR', '76', 'Seine-Maritime'),
(259, 'FR', '77', 'Seine-et-Marne'),
(260, 'FR', '78', 'Yvelines'),
(261, 'FR', '79', 'Deux-Sèvres'),
(262, 'FR', '80', 'Somme'),
(263, 'FR', '81', 'Tarn'),
(264, 'FR', '82', 'Tarn-et-Garonne'),
(265, 'FR', '83', 'Var'),
(266, 'FR', '84', 'Vaucluse'),
(267, 'FR', '85', 'Vendée'),
(268, 'FR', '86', 'Vienne'),
(269, 'FR', '87', 'Haute-Vienne'),
(270, 'FR', '88', 'Vosges'),
(271, 'FR', '89', 'Yonne'),
(272, 'FR', '90', 'Territoire-de-Belfort'),
(273, 'FR', '91', 'Essonne'),
(274, 'FR', '92', 'Hauts-de-Seine'),
(275, 'FR', '93', 'Seine-Saint-Denis'),
(276, 'FR', '94', 'Val-de-Marne'),
(277, 'FR', '95', 'Val-d\'Oise'),
(278, 'RO', 'AB', 'Alba'),
(279, 'RO', 'AR', 'Arad'),
(280, 'RO', 'AG', 'Argeş'),
(281, 'RO', 'BC', 'Bacău'),
(282, 'RO', 'BH', 'Bihor'),
(283, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 'RO', 'BT', 'Botoşani'),
(285, 'RO', 'BV', 'Braşov'),
(286, 'RO', 'BR', 'Brăila'),
(287, 'RO', 'B', 'Bucureşti'),
(288, 'RO', 'BZ', 'Buzău'),
(289, 'RO', 'CS', 'Caraş-Severin'),
(290, 'RO', 'CL', 'Călăraşi'),
(291, 'RO', 'CJ', 'Cluj'),
(292, 'RO', 'CT', 'Constanţa'),
(293, 'RO', 'CV', 'Covasna'),
(294, 'RO', 'DB', 'Dâmboviţa'),
(295, 'RO', 'DJ', 'Dolj'),
(296, 'RO', 'GL', 'Galaţi'),
(297, 'RO', 'GR', 'Giurgiu'),
(298, 'RO', 'GJ', 'Gorj'),
(299, 'RO', 'HR', 'Harghita'),
(300, 'RO', 'HD', 'Hunedoara'),
(301, 'RO', 'IL', 'Ialomiţa'),
(302, 'RO', 'IS', 'Iaşi'),
(303, 'RO', 'IF', 'Ilfov'),
(304, 'RO', 'MM', 'Maramureş'),
(305, 'RO', 'MH', 'Mehedinţi'),
(306, 'RO', 'MS', 'Mureş'),
(307, 'RO', 'NT', 'Neamţ'),
(308, 'RO', 'OT', 'Olt'),
(309, 'RO', 'PH', 'Prahova'),
(310, 'RO', 'SM', 'Satu-Mare'),
(311, 'RO', 'SJ', 'Sălaj'),
(312, 'RO', 'SB', 'Sibiu'),
(313, 'RO', 'SV', 'Suceava'),
(314, 'RO', 'TR', 'Teleorman'),
(315, 'RO', 'TM', 'Timiş'),
(316, 'RO', 'TL', 'Tulcea'),
(317, 'RO', 'VS', 'Vaslui'),
(318, 'RO', 'VL', 'Vâlcea'),
(319, 'RO', 'VN', 'Vrancea'),
(320, 'FI', 'Lappi', 'Lappi'),
(321, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 'FI', 'Kainuu', 'Kainuu'),
(323, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
(326, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
(327, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 'FI', 'Satakunta', 'Satakunta'),
(330, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
(334, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
(335, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
(336, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
(338, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 'EE', 'EE-37', 'Harjumaa'),
(341, 'EE', 'EE-39', 'Hiiumaa'),
(342, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 'EE', 'EE-49', 'Jõgevamaa'),
(344, 'EE', 'EE-51', 'Järvamaa'),
(345, 'EE', 'EE-57', 'Läänemaa'),
(346, 'EE', 'EE-59', 'Lääne-Virumaa'),
(347, 'EE', 'EE-65', 'Põlvamaa'),
(348, 'EE', 'EE-67', 'Pärnumaa'),
(349, 'EE', 'EE-70', 'Raplamaa'),
(350, 'EE', 'EE-74', 'Saaremaa'),
(351, 'EE', 'EE-78', 'Tartumaa'),
(352, 'EE', 'EE-82', 'Valgamaa'),
(353, 'EE', 'EE-84', 'Viljandimaa'),
(354, 'EE', 'EE-86', 'Võrumaa'),
(355, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 'LV', 'LV-JEL', 'Jelgava'),
(357, 'LV', 'Jēkabpils', 'Jēkabpils'),
(358, 'LV', 'LV-JUR', 'Jūrmala'),
(359, 'LV', 'LV-LPX', 'Liepāja'),
(360, 'LV', 'LV-LE', 'Liepājas novads'),
(361, 'LV', 'LV-REZ', 'Rēzekne'),
(362, 'LV', 'LV-RIX', 'Rīga'),
(363, 'LV', 'LV-RI', 'Rīgas novads'),
(364, 'LV', 'Valmiera', 'Valmiera'),
(365, 'LV', 'LV-VEN', 'Ventspils'),
(366, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
(370, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 'LV', 'LV-AL', 'Alūksnes novads'),
(373, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 'LV', 'Apes novads', 'Apes novads'),
(375, 'LV', 'Auces novads', 'Auces novads'),
(376, 'LV', 'Babītes novads', 'Babītes novads'),
(377, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 'LV', 'LV-BL', 'Balvu novads'),
(380, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
(382, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
(383, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 'LV', 'LV-CE', 'Cēsu novads'),
(388, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 'LV', 'Engures novads', 'Engures novads'),
(394, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
(396, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
(399, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
(400, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
(401, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 'LV', 'LV-JK', 'Jēkabpils novads'),
(406, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 'LV', 'LV-KR', 'Krāslavas novads'),
(411, 'LV', 'LV-KU', 'Kuldīgas novads'),
(412, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
(413, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
(414, 'LV', 'LV-LM', 'Limbažu novads'),
(415, 'LV', 'Lubānas novads', 'Lubānas novads'),
(416, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
(418, 'LV', 'Līvānu novads', 'Līvānu novads'),
(419, 'LV', 'LV-MA', 'Madonas novads'),
(420, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 'LV', 'Mālpils novads', 'Mālpils novads'),
(422, 'LV', 'Mārupes novads', 'Mārupes novads'),
(423, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
(424, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 'LV', 'Nīcas novads', 'Nīcas novads'),
(426, 'LV', 'LV-OG', 'Ogres novads'),
(427, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 'LV', 'LV-PR', 'Preiļu novads'),
(430, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
(432, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
(433, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
(434, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
(435, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
(437, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 'LV', 'Ropažu novads', 'Ropažu novads'),
(439, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 'LV', 'Rugāju novads', 'Rugāju novads'),
(441, 'LV', 'Rundāles novads', 'Rundāles novads'),
(442, 'LV', 'LV-RE', 'Rēzeknes novads'),
(443, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
(444, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
(445, 'LV', 'Salas novads', 'Salas novads'),
(446, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 'LV', 'LV-SA', 'Saldus novads'),
(448, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
(452, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
(454, 'LV', 'Strenču novads', 'Strenču novads'),
(455, 'LV', 'Sējas novads', 'Sējas novads'),
(456, 'LV', 'LV-TA', 'Talsu novads'),
(457, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
(459, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
(460, 'LV', 'LV-VK', 'Valkas novads'),
(461, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
(463, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 'LV', 'Viesītes novads', 'Viesītes novads'),
(467, 'LV', 'Viļakas novads', 'Viļakas novads'),
(468, 'LV', 'Viļānu novads', 'Viļānu novads'),
(469, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
(470, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 'LV', 'Ādažu novads', 'Ādažu novads'),
(472, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
(473, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
(474, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
(475, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
(478, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
(479, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
(480, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
(481, 'LT', 'LT-TA', 'Tauragės Apskritis'),
(482, 'LT', 'LT-TE', 'Telšių Apskritis'),
(483, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
(485, 'BR', 'AC', 'Acre'),
(486, 'BR', 'AL', 'Alagoas'),
(487, 'BR', 'AP', 'Amapá'),
(488, 'BR', 'AM', 'Amazonas'),
(489, 'BR', 'BA', 'Bahia'),
(490, 'BR', 'CE', 'Ceará'),
(491, 'BR', 'ES', 'Espírito Santo'),
(492, 'BR', 'GO', 'Goiás'),
(493, 'BR', 'MA', 'Maranhão'),
(494, 'BR', 'MT', 'Mato Grosso'),
(495, 'BR', 'MS', 'Mato Grosso do Sul'),
(496, 'BR', 'MG', 'Minas Gerais'),
(497, 'BR', 'PA', 'Pará'),
(498, 'BR', 'PB', 'Paraíba'),
(499, 'BR', 'PR', 'Paraná'),
(500, 'BR', 'PE', 'Pernambuco'),
(501, 'BR', 'PI', 'Piauí'),
(502, 'BR', 'RJ', 'Rio de Janeiro'),
(503, 'BR', 'RN', 'Rio Grande do Norte'),
(504, 'BR', 'RS', 'Rio Grande do Sul'),
(505, 'BR', 'RO', 'Rondônia'),
(506, 'BR', 'RR', 'Roraima'),
(507, 'BR', 'SC', 'Santa Catarina'),
(508, 'BR', 'SP', 'São Paulo'),
(509, 'BR', 'SE', 'Sergipe'),
(510, 'BR', 'TO', 'Tocantins'),
(511, 'BR', 'DF', 'Distrito Federal'),
(512, 'AL', 'AL-01', 'Berat'),
(513, 'AL', 'AL-09', 'Dibër'),
(514, 'AL', 'AL-02', 'Durrës'),
(515, 'AL', 'AL-03', 'Elbasan'),
(516, 'AL', 'AL-04', 'Fier'),
(517, 'AL', 'AL-05', 'Gjirokastër'),
(518, 'AL', 'AL-06', 'Korçë'),
(519, 'AL', 'AL-07', 'Kukës'),
(520, 'AL', 'AL-08', 'Lezhë'),
(521, 'AL', 'AL-10', 'Shkodër'),
(522, 'AL', 'AL-11', 'Tiranë'),
(523, 'AL', 'AL-12', 'Vlorë'),
(524, 'AR', 'AR-C', 'Ciudad Autónoma de Buenos Aires'),
(525, 'AR', 'AR-B', 'Buenos Aires'),
(526, 'AR', 'AR-K', 'Catamarca'),
(527, 'AR', 'AR-H', 'Chaco'),
(528, 'AR', 'AR-U', 'Chubut'),
(529, 'AR', 'AR-X', 'Córdoba'),
(530, 'AR', 'AR-W', 'Corrientes'),
(531, 'AR', 'AR-E', 'Entre Ríos'),
(532, 'AR', 'AR-P', 'Formosa'),
(533, 'AR', 'AR-Y', 'Jujuy'),
(534, 'AR', 'AR-L', 'La Pampa'),
(535, 'AR', 'AR-F', 'La Rioja'),
(536, 'AR', 'AR-M', 'Mendoza'),
(537, 'AR', 'AR-N', 'Misiones'),
(538, 'AR', 'AR-Q', 'Neuquén'),
(539, 'AR', 'AR-R', 'Río Negro'),
(540, 'AR', 'AR-A', 'Salta'),
(541, 'AR', 'AR-J', 'San Juan'),
(542, 'AR', 'AR-D', 'San Luis'),
(543, 'AR', 'AR-Z', 'Santa Cruz'),
(544, 'AR', 'AR-S', 'Santa Fe'),
(545, 'AR', 'AR-G', 'Santiago del Estero'),
(546, 'AR', 'AR-V', 'Tierra del Fuego'),
(547, 'AR', 'AR-T', 'Tucumán'),
(548, 'HR', 'HR-01', 'Zagrebačka županija'),
(549, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
(550, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
(551, 'HR', 'HR-04', 'Karlovačka županija'),
(552, 'HR', 'HR-05', 'Varaždinska županija'),
(553, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
(554, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
(555, 'HR', 'HR-08', 'Primorsko-goranska županija'),
(556, 'HR', 'HR-09', 'Ličko-senjska županija'),
(557, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
(558, 'HR', 'HR-11', 'Požeško-slavonska županija'),
(559, 'HR', 'HR-12', 'Brodsko-posavska županija'),
(560, 'HR', 'HR-13', 'Zadarska županija'),
(561, 'HR', 'HR-14', 'Osječko-baranjska županija'),
(562, 'HR', 'HR-15', 'Šibensko-kninska županija'),
(563, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
(564, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
(565, 'HR', 'HR-18', 'Istarska županija'),
(566, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
(567, 'HR', 'HR-20', 'Međimurska županija'),
(568, 'HR', 'HR-21', 'Grad Zagreb'),
(569, 'IN', 'AN', 'Andaman and Nicobar Islands'),
(570, 'IN', 'AP', 'Andhra Pradesh'),
(571, 'IN', 'AR', 'Arunachal Pradesh'),
(572, 'IN', 'AS', 'Assam'),
(573, 'IN', 'BR', 'Bihar'),
(574, 'IN', 'CH', 'Chandigarh'),
(575, 'IN', 'CT', 'Chhattisgarh'),
(576, 'IN', 'DN', 'Dadra and Nagar Haveli'),
(577, 'IN', 'DD', 'Daman and Diu'),
(578, 'IN', 'DL', 'Delhi'),
(579, 'IN', 'GA', 'Goa'),
(580, 'IN', 'GJ', 'Gujarat'),
(581, 'IN', 'HR', 'Haryana'),
(582, 'IN', 'HP', 'Himachal Pradesh'),
(583, 'IN', 'JK', 'Jammu and Kashmir'),
(584, 'IN', 'JH', 'Jharkhand'),
(585, 'IN', 'KA', 'Karnataka'),
(586, 'IN', 'KL', 'Kerala'),
(587, 'IN', 'LD', 'Lakshadweep'),
(588, 'IN', 'MP', 'Madhya Pradesh'),
(589, 'IN', 'MH', 'Maharashtra'),
(590, 'IN', 'MN', 'Manipur'),
(591, 'IN', 'ML', 'Meghalaya'),
(592, 'IN', 'MZ', 'Mizoram'),
(593, 'IN', 'NL', 'Nagaland'),
(594, 'IN', 'OR', 'Odisha'),
(595, 'IN', 'PY', 'Puducherry'),
(596, 'IN', 'PB', 'Punjab'),
(597, 'IN', 'RJ', 'Rajasthan'),
(598, 'IN', 'SK', 'Sikkim'),
(599, 'IN', 'TN', 'Tamil Nadu'),
(600, 'IN', 'TG', 'Telangana'),
(601, 'IN', 'TR', 'Tripura'),
(602, 'IN', 'UP', 'Uttar Pradesh'),
(603, 'IN', 'UT', 'Uttarakhand'),
(604, 'IN', 'WB', 'West Bengal'),
(605, 'AU', 'ACT', 'Australian Capital Territory'),
(606, 'AU', 'NSW', 'New South Wales'),
(607, 'AU', 'VIC', 'Victoria'),
(608, 'AU', 'QLD', 'Queensland'),
(609, 'AU', 'SA', 'South Australia'),
(610, 'AU', 'TAS', 'Tasmania'),
(611, 'AU', 'WA', 'Western Australia'),
(612, 'AU', 'NT', 'Northern Territory'),
(613, 'BY', 'BY-BR', 'Bresckaja voblasć'),
(614, 'BY', 'BY-HO', 'Homieĺskaja voblasć'),
(615, 'BY', 'BY-HM', 'Horad Minsk'),
(616, 'BY', 'BY-HR', 'Hrodzienskaja voblasć'),
(617, 'BY', 'BY-MA', 'Mahilioŭskaja voblasć'),
(618, 'BY', 'BY-MI', 'Minskaja voblasć'),
(619, 'BY', 'BY-VI', 'Viciebskaja voblasć'),
(620, 'BE', 'VAN', 'Antwerpen'),
(621, 'BE', 'WBR', 'Brabant wallon'),
(622, 'BE', 'BRU', 'Brussels-Capital Region'),
(623, 'BE', 'WHT', 'Hainaut'),
(624, 'BE', 'VLI', 'Limburg'),
(625, 'BE', 'WLG', 'Liège'),
(626, 'BE', 'WLX', 'Luxembourg'),
(627, 'BE', 'WNA', 'Namur'),
(628, 'BE', 'VOV', 'Oost-Vlaanderen'),
(629, 'BE', 'VBR', 'Vlaams-Brabant'),
(630, 'BE', 'VWV', 'West-Vlaanderen'),
(631, 'BO', 'BO-C', 'Cochabamba'),
(632, 'BO', 'BO-H', 'Chuquisaca'),
(633, 'BO', 'BO-B', 'El Beni'),
(634, 'BO', 'BO-L', 'La Paz'),
(635, 'BO', 'BO-O', 'Oruro'),
(636, 'BO', 'BO-N', 'Pando'),
(637, 'BO', 'BO-P', 'Potosí'),
(638, 'BO', 'BO-S', 'Santa Cruz'),
(639, 'BO', 'BO-T', 'Tarija'),
(640, 'BG', 'BG-01', 'Blagoevgrad'),
(641, 'BG', 'BG-02', 'Burgas'),
(642, 'BG', 'BG-03', 'Varna'),
(643, 'BG', 'BG-04', 'Veliko Tarnovo'),
(644, 'BG', 'BG-05', 'Vidin'),
(645, 'BG', 'BG-06', 'Vratsa'),
(646, 'BG', 'BG-07', 'Gabrovo'),
(647, 'BG', 'BG-08', 'Dobrich'),
(648, 'BG', 'BG-09', 'Kardzhali'),
(649, 'BG', 'BG-10', 'Kyustendil'),
(650, 'BG', 'BG-11', 'Lovech'),
(651, 'BG', 'BG-12', 'Montana'),
(652, 'BG', 'BG-13', 'Pazardzhik'),
(653, 'BG', 'BG-14', 'Pernik'),
(654, 'BG', 'BG-15', 'Pleven'),
(655, 'BG', 'BG-16', 'Plovdiv'),
(656, 'BG', 'BG-17', 'Razgrad'),
(657, 'BG', 'BG-18', 'Ruse'),
(658, 'BG', 'BG-19', 'Silistra'),
(659, 'BG', 'BG-20', 'Sliven'),
(660, 'BG', 'BG-21', 'Smolyan'),
(661, 'BG', 'BG-22', 'Sofia City'),
(662, 'BG', 'BG-23', 'Sofia Province'),
(663, 'BG', 'BG-24', 'Stara Zagora'),
(664, 'BG', 'BG-25', 'Targovishte'),
(665, 'BG', 'BG-26', 'Haskovo'),
(666, 'BG', 'BG-27', 'Shumen'),
(667, 'BG', 'BG-28', 'Yambol'),
(668, 'CL', 'CL-AI', 'Aisén del General Carlos Ibañez del Campo'),
(669, 'CL', 'CL-AN', 'Antofagasta'),
(670, 'CL', 'CL-AP', 'Arica y Parinacota'),
(671, 'CL', 'CL-AR', 'La Araucanía'),
(672, 'CL', 'CL-AT', 'Atacama'),
(673, 'CL', 'CL-BI', 'Biobío'),
(674, 'CL', 'CL-CO', 'Coquimbo'),
(675, 'CL', 'CL-LI', 'Libertador General Bernardo O\'Higgins'),
(676, 'CL', 'CL-LL', 'Los Lagos'),
(677, 'CL', 'CL-LR', 'Los Ríos'),
(678, 'CL', 'CL-MA', 'Magallanes'),
(679, 'CL', 'CL-ML', 'Maule'),
(680, 'CL', 'CL-NB', 'Ñuble'),
(681, 'CL', 'CL-RM', 'Región Metropolitana de Santiago'),
(682, 'CL', 'CL-TA', 'Tarapacá'),
(683, 'CL', 'CL-VS', 'Valparaíso'),
(684, 'CN', 'CN-AH', 'Anhui Sheng'),
(685, 'CN', 'CN-BJ', 'Beijing Shi'),
(686, 'CN', 'CN-CQ', 'Chongqing Shi'),
(687, 'CN', 'CN-FJ', 'Fujian Sheng'),
(688, 'CN', 'CN-GS', 'Gansu Sheng'),
(689, 'CN', 'CN-GD', 'Guangdong Sheng'),
(690, 'CN', 'CN-GX', 'Guangxi Zhuangzu Zizhiqu'),
(691, 'CN', 'CN-GZ', 'Guizhou Sheng'),
(692, 'CN', 'CN-HI', 'Hainan Sheng'),
(693, 'CN', 'CN-HE', 'Hebei Sheng'),
(694, 'CN', 'CN-HL', 'Heilongjiang Sheng'),
(695, 'CN', 'CN-HA', 'Henan Sheng'),
(696, 'CN', 'CN-HK', 'Hong Kong SAR'),
(697, 'CN', 'CN-HB', 'Hubei Sheng'),
(698, 'CN', 'CN-HN', 'Hunan Sheng'),
(699, 'CN', 'CN-JS', 'Jiangsu Sheng'),
(700, 'CN', 'CN-JX', 'Jiangxi Sheng'),
(701, 'CN', 'CN-JL', 'Jilin Sheng'),
(702, 'CN', 'CN-LN', 'Liaoning Sheng'),
(703, 'CN', 'CN-MO', 'Macao SAR'),
(704, 'CN', 'CN-NM', 'Nei Mongol Zizhiqu'),
(705, 'CN', 'CN-NX', 'Ningxia Huizi Zizhiqu'),
(706, 'CN', 'CN-QH', 'Qinghai Sheng'),
(707, 'CN', 'CN-SN', 'Shaanxi Sheng'),
(708, 'CN', 'CN-SD', 'Shandong Sheng'),
(709, 'CN', 'CN-SH', 'Shanghai Shi'),
(710, 'CN', 'CN-SX', 'Shanxi Sheng'),
(711, 'CN', 'CN-SC', 'Sichuan Sheng'),
(712, 'CN', 'CN-TW', 'Taiwan Sheng'),
(713, 'CN', 'CN-TJ', 'Tianjin Shi'),
(714, 'CN', 'CN-XJ', 'Xinjiang Uygur Zizhiqu'),
(715, 'CN', 'CN-XZ', 'Xizang Zizhiqu'),
(716, 'CN', 'CN-YN', 'Yunnan Sheng'),
(717, 'CN', 'CN-ZJ', 'Zhejiang Sheng'),
(718, 'CO', 'CO-AMA', 'Amazonas'),
(719, 'CO', 'CO-ANT', 'Antioquia'),
(720, 'CO', 'CO-ARA', 'Arauca'),
(721, 'CO', 'CO-ATL', 'Atlántico'),
(722, 'CO', 'CO-BOL', 'Bolívar'),
(723, 'CO', 'CO-BOY', 'Boyacá'),
(724, 'CO', 'CO-CAL', 'Caldas'),
(725, 'CO', 'CO-CAQ', 'Caquetá'),
(726, 'CO', 'CO-CAS', 'Casanare'),
(727, 'CO', 'CO-CAU', 'Cauca'),
(728, 'CO', 'CO-CES', 'Cesar'),
(729, 'CO', 'CO-CHO', 'Chocó'),
(730, 'CO', 'CO-COR', 'Córdoba'),
(731, 'CO', 'CO-CUN', 'Cundinamarca'),
(732, 'CO', 'CO-GUA', 'Guainía'),
(733, 'CO', 'CO-GUV', 'Guaviare'),
(734, 'CO', 'CO-HUL', 'Huila'),
(735, 'CO', 'CO-LAG', 'La Guajira'),
(736, 'CO', 'CO-MAG', 'Magdalena'),
(737, 'CO', 'CO-MET', 'Meta'),
(738, 'CO', 'CO-NAR', 'Nariño'),
(739, 'CO', 'CO-NSA', 'Norte de Santander'),
(740, 'CO', 'CO-PUT', 'Putumayo'),
(741, 'CO', 'CO-QUI', 'Quindío'),
(742, 'CO', 'CO-RIS', 'Risaralda'),
(743, 'CO', 'CO-SAP', 'San Andrés y Providencia'),
(744, 'CO', 'CO-SAN', 'Santander'),
(745, 'CO', 'CO-SUC', 'Sucre'),
(746, 'CO', 'CO-TOL', 'Tolima'),
(747, 'CO', 'CO-VAC', 'Valle del Cauca'),
(748, 'CO', 'CO-VAU', 'Vaupés'),
(749, 'CO', 'CO-VID', 'Vichada'),
(750, 'CR', 'CR-SJ', 'San José'),
(751, 'CR', 'CR-AL', 'Alajuela'),
(752, 'CR', 'CR-CA', 'Cartago'),
(753, 'CR', 'CR-HE', 'Heredia'),
(754, 'CR', 'CR-GU', 'Guanacaste'),
(755, 'CR', 'CR-PU', 'Puntarenas'),
(756, 'CR', 'CR-LI', 'Limón'),
(757, 'CZ', 'CZ-10', 'Praha, Hlavní město'),
(758, 'CZ', 'CZ-20', 'Středočeský kraj'),
(759, 'CZ', 'CZ-31', 'Jihočeský kraj'),
(760, 'CZ', 'CZ-32', 'Plzeňský kraj'),
(761, 'CZ', 'CZ-41', 'Karlovarský kraj'),
(762, 'CZ', 'CZ-42', 'Ústecký kraj'),
(763, 'CZ', 'CZ-51', 'Liberecký kraj'),
(764, 'CZ', 'CZ-52', 'Královéhradecký kraj'),
(765, 'CZ', 'CZ-53', 'Pardubický kraj'),
(766, 'CZ', 'CZ-63', 'Kraj Vysočina'),
(767, 'CZ', 'CZ-64', 'Jihomoravský kraj'),
(768, 'CZ', 'CZ-71', 'Olomoucký kraj'),
(769, 'CZ', 'CZ-72', 'Zlínský kraj'),
(770, 'CZ', 'CZ-80', 'Moravskoslezský kraj'),
(771, 'DK', 'DK-84', 'Hovedstaden'),
(772, 'DK', 'DK-82', 'Midtjylland'),
(773, 'DK', 'DK-81', 'Nordjylland'),
(774, 'DK', 'DK-85', 'Sjælland'),
(775, 'DK', 'DK-83', 'Syddanmark'),
(776, 'EC', 'EC-A', 'Azuay'),
(777, 'EC', 'EC-B', 'Bolívar'),
(778, 'EC', 'EC-F', 'Cañar'),
(779, 'EC', 'EC-C', 'Carchi'),
(780, 'EC', 'EC-H', 'Chimborazo'),
(781, 'EC', 'EC-X', 'Cotopaxi'),
(782, 'EC', 'EC-O', 'El Oro'),
(783, 'EC', 'EC-E', 'Esmeraldas'),
(784, 'EC', 'EC-W', 'Galápagos'),
(785, 'EC', 'EC-G', 'Guayas'),
(786, 'EC', 'EC-I', 'Imbabura'),
(787, 'EC', 'EC-L', 'Loja'),
(788, 'EC', 'EC-R', 'Los Ríos'),
(789, 'EC', 'EC-M', 'Manabí'),
(790, 'EC', 'EC-S', 'Morona Santiago'),
(791, 'EC', 'EC-N', 'Napo'),
(792, 'EC', 'EC-D', 'Orellana'),
(793, 'EC', 'EC-Y', 'Pastaza'),
(794, 'EC', 'EC-P', 'Pichincha'),
(795, 'EC', 'EC-SE', 'Santa Elena'),
(796, 'EC', 'EC-SD', 'Santo Domingo de los Tsáchilas'),
(797, 'EC', 'EC-U', 'Sucumbíos'),
(798, 'EC', 'EC-T', 'Tungurahua'),
(799, 'EC', 'EC-Z', 'Zamora Chinchipe'),
(800, 'GR', 'GR-A', 'Anatolikí Makedonía kai Thráki'),
(801, 'GR', 'GR-I', 'Attikí'),
(802, 'GR', 'GR-G', 'Dytikí Elláda'),
(803, 'GR', 'GR-C', 'Dytikí Makedonía'),
(804, 'GR', 'GR-F', 'Ionía Nísia'),
(805, 'GR', 'GR-D', 'Ípeiros'),
(806, 'GR', 'GR-B', 'Kentrikí Makedonía'),
(807, 'GR', 'GR-M', 'Kríti'),
(808, 'GR', 'GR-L', 'Nótio Aigaío'),
(809, 'GR', 'GR-J', 'Pelopónnisos'),
(810, 'GR', 'GR-H', 'Stereá Elláda'),
(811, 'GR', 'GR-E', 'Thessalía'),
(812, 'GR', 'GR-K', 'Vóreio Aigaío'),
(813, 'GR', 'GR-69', 'Ágion Óros'),
(814, 'GY', 'GY-BA', 'Barima-Waini'),
(815, 'GY', 'GY-CU', 'Cuyuni-Mazaruni'),
(816, 'GY', 'GY-DE', 'Demerara-Mahaica'),
(817, 'GY', 'GY-EB', 'East Berbice-Corentyne'),
(818, 'GY', 'GY-ES', 'Essequibo Islands-West Demerara'),
(819, 'GY', 'GY-MA', 'Mahaica-Berbice'),
(820, 'GY', 'GY-PM', 'Pomeroon-Supenaam'),
(821, 'GY', 'GY-PT', 'Potaro-Siparuni'),
(822, 'GY', 'GY-UD', 'Upper Demerara-Berbice'),
(823, 'GY', 'GY-UT', 'Upper Takutu-Upper Essequibo'),
(824, 'IS', 'IS-01', 'Höfuðborgarsvæði'),
(825, 'IS', 'IS-02', 'Suðurnes'),
(826, 'IS', 'IS-03', 'Vesturland'),
(827, 'IS', 'IS-04', 'Vestfirðir'),
(828, 'IS', 'IS-05', 'Norðurland vestra'),
(829, 'IS', 'IS-06', 'Norðurland eystra'),
(830, 'IS', 'IS-07', 'Austurland'),
(831, 'IS', 'IS-08', 'Suðurland'),
(832, 'IT', 'AG', 'Agrigento'),
(833, 'IT', 'AL', 'Alessandria'),
(834, 'IT', 'AN', 'Ancona'),
(835, 'IT', 'AO', 'Aosta'),
(836, 'IT', 'AQ', 'L\'Aquila'),
(837, 'IT', 'AR', 'Arezzo'),
(838, 'IT', 'AP', 'Ascoli-Piceno'),
(839, 'IT', 'AT', 'Asti'),
(840, 'IT', 'AV', 'Avellino'),
(841, 'IT', 'BA', 'Bari'),
(842, 'IT', 'BT', 'Barletta-Andria-Trani'),
(843, 'IT', 'BL', 'Belluno'),
(844, 'IT', 'BN', 'Benevento'),
(845, 'IT', 'BG', 'Bergamo'),
(846, 'IT', 'BI', 'Biella'),
(847, 'IT', 'BO', 'Bologna'),
(848, 'IT', 'BZ', 'Bolzano'),
(849, 'IT', 'BS', 'Brescia'),
(850, 'IT', 'BR', 'Brindisi'),
(851, 'IT', 'CA', 'Cagliari'),
(852, 'IT', 'CL', 'Caltanissetta'),
(853, 'IT', 'CB', 'Campobasso'),
(854, 'IT', 'CI', 'Carbonia Iglesias'),
(855, 'IT', 'CE', 'Caserta'),
(856, 'IT', 'CT', 'Catania'),
(857, 'IT', 'CZ', 'Catanzaro'),
(858, 'IT', 'CH', 'Chieti'),
(859, 'IT', 'CO', 'Como'),
(860, 'IT', 'CS', 'Cosenza'),
(861, 'IT', 'CR', 'Cremona'),
(862, 'IT', 'KR', 'Crotone'),
(863, 'IT', 'CN', 'Cuneo'),
(864, 'IT', 'EN', 'Enna'),
(865, 'IT', 'FM', 'Fermo'),
(866, 'IT', 'FE', 'Ferrara'),
(867, 'IT', 'FI', 'Firenze'),
(868, 'IT', 'FG', 'Foggia'),
(869, 'IT', 'FC', 'Forli-Cesena'),
(870, 'IT', 'FR', 'Frosinone'),
(871, 'IT', 'GE', 'Genova'),
(872, 'IT', 'GO', 'Gorizia'),
(873, 'IT', 'GR', 'Grosseto'),
(874, 'IT', 'IM', 'Imperia'),
(875, 'IT', 'IS', 'Isernia'),
(876, 'IT', 'SP', 'La-Spezia'),
(877, 'IT', 'LT', 'Latina'),
(878, 'IT', 'LE', 'Lecce'),
(879, 'IT', 'LC', 'Lecco'),
(880, 'IT', 'LI', 'Livorno'),
(881, 'IT', 'LO', 'Lodi'),
(882, 'IT', 'LU', 'Lucca'),
(883, 'IT', 'MC', 'Macerata'),
(884, 'IT', 'MN', 'Mantova'),
(885, 'IT', 'MS', 'Massa-Carrara'),
(886, 'IT', 'MT', 'Matera'),
(887, 'IT', 'VS', 'Medio Campidano'),
(888, 'IT', 'ME', 'Messina'),
(889, 'IT', 'MI', 'Milano'),
(890, 'IT', 'MO', 'Modena'),
(891, 'IT', 'MB', 'Monza-Brianza'),
(892, 'IT', 'NA', 'Napoli'),
(893, 'IT', 'NO', 'Novara'),
(894, 'IT', 'NU', 'Nuoro'),
(895, 'IT', 'OG', 'Ogliastra'),
(896, 'IT', 'OT', 'Olbia Tempio'),
(897, 'IT', 'OR', 'Oristano'),
(898, 'IT', 'PD', 'Padova'),
(899, 'IT', 'PA', 'Palermo'),
(900, 'IT', 'PR', 'Parma'),
(901, 'IT', 'PV', 'Pavia'),
(902, 'IT', 'PG', 'Perugia'),
(903, 'IT', 'PU', 'Pesaro-Urbino'),
(904, 'IT', 'PE', 'Pescara'),
(905, 'IT', 'PC', 'Piacenza'),
(906, 'IT', 'PI', 'Pisa'),
(907, 'IT', 'PT', 'Pistoia'),
(908, 'IT', 'PN', 'Pordenone'),
(909, 'IT', 'PZ', 'Potenza'),
(910, 'IT', 'PO', 'Prato'),
(911, 'IT', 'RG', 'Ragusa'),
(912, 'IT', 'RA', 'Ravenna'),
(913, 'IT', 'RC', 'Reggio-Calabria'),
(914, 'IT', 'RE', 'Reggio-Emilia'),
(915, 'IT', 'RI', 'Rieti'),
(916, 'IT', 'RN', 'Rimini'),
(917, 'IT', 'RM', 'Roma'),
(918, 'IT', 'RO', 'Rovigo'),
(919, 'IT', 'SA', 'Salerno'),
(920, 'IT', 'SS', 'Sassari'),
(921, 'IT', 'SV', 'Savona'),
(922, 'IT', 'SI', 'Siena'),
(923, 'IT', 'SR', 'Siracusa'),
(924, 'IT', 'SO', 'Sondrio'),
(925, 'IT', 'TA', 'Taranto'),
(926, 'IT', 'TE', 'Teramo'),
(927, 'IT', 'TR', 'Terni'),
(928, 'IT', 'TO', 'Torino'),
(929, 'IT', 'TP', 'Trapani'),
(930, 'IT', 'TN', 'Trento'),
(931, 'IT', 'TV', 'Treviso'),
(932, 'IT', 'TS', 'Trieste'),
(933, 'IT', 'UD', 'Udine'),
(934, 'IT', 'VA', 'Varese'),
(935, 'IT', 'VE', 'Venezia'),
(936, 'IT', 'VB', 'Verbania'),
(937, 'IT', 'VC', 'Vercelli'),
(938, 'IT', 'VR', 'Verona'),
(939, 'IT', 'VV', 'Vibo-Valentia'),
(940, 'IT', 'VI', 'Vicenza'),
(941, 'IT', 'VT', 'Viterbo'),
(942, 'MX', 'AGU', 'Aguascalientes'),
(943, 'MX', 'BCN', 'Baja California'),
(944, 'MX', 'BCS', 'Baja California Sur'),
(945, 'MX', 'CAM', 'Campeche'),
(946, 'MX', 'CHP', 'Chiapas'),
(947, 'MX', 'CHH', 'Chihuahua'),
(948, 'MX', 'CMX', 'Ciudad de México'),
(949, 'MX', 'COA', 'Coahuila'),
(950, 'MX', 'COL', 'Colima'),
(951, 'MX', 'DUR', 'Durango'),
(952, 'MX', 'MEX', 'Estado de México'),
(953, 'MX', 'GUA', 'Guanajuato'),
(954, 'MX', 'GRO', 'Guerrero'),
(955, 'MX', 'HID', 'Hidalgo'),
(956, 'MX', 'JAL', 'Jalisco'),
(957, 'MX', 'MIC', 'Michoacán'),
(958, 'MX', 'MOR', 'Morelos'),
(959, 'MX', 'NAY', 'Nayarit'),
(960, 'MX', 'NLE', 'Nuevo León'),
(961, 'MX', 'OAX', 'Oaxaca'),
(962, 'MX', 'PUE', 'Puebla'),
(963, 'MX', 'QUE', 'Querétaro'),
(964, 'MX', 'ROO', 'Quintana Roo'),
(965, 'MX', 'SLP', 'San Luis Potosí'),
(966, 'MX', 'SIN', 'Sinaloa'),
(967, 'MX', 'SON', 'Sonora'),
(968, 'MX', 'TAB', 'Tabasco'),
(969, 'MX', 'TAM', 'Tamaulipas'),
(970, 'MX', 'TLA', 'Tlaxcala'),
(971, 'MX', 'VER', 'Veracruz'),
(972, 'MX', 'YUC', 'Yucatán'),
(973, 'MX', 'ZAC', 'Zacatecas'),
(974, 'PY', 'PY-ASU', 'Asunción'),
(975, 'PY', 'PY-16', 'Alto Paraguay'),
(976, 'PY', 'PY-10', 'Alto Paraná'),
(977, 'PY', 'PY-13', 'Amambay'),
(978, 'PY', 'PY-19', 'Boquerón'),
(979, 'PY', 'PY-5', 'Caaguazú'),
(980, 'PY', 'PY-6', 'Caazapá'),
(981, 'PY', 'PY-14', 'Canindeyú'),
(982, 'PY', 'PY-11', 'Central'),
(983, 'PY', 'PY-1', 'Concepción'),
(984, 'PY', 'PY-3', 'Cordillera'),
(985, 'PY', 'PY-4', 'Guairá'),
(986, 'PY', 'PY-7', 'Itapúa'),
(987, 'PY', 'PY-8', 'Misiones'),
(988, 'PY', 'PY-12', 'Ñeembucú'),
(989, 'PY', 'PY-9', 'Paraguarí'),
(990, 'PY', 'PY-15', 'Presidente Hayes'),
(991, 'PY', 'PY-2', 'San Pedro'),
(992, 'PE', 'PE-LMA', 'Municipalidad Metropolitana de Lima'),
(993, 'PE', 'PE-AMA', 'Amazonas'),
(994, 'PE', 'PE-ANC', 'Ancash'),
(995, 'PE', 'PE-APU', 'Apurímac'),
(996, 'PE', 'PE-ARE', 'Arequipa'),
(997, 'PE', 'PE-AYA', 'Ayacucho'),
(998, 'PE', 'PE-CAJ', 'Cajamarca'),
(999, 'PE', 'PE-CUS', 'Cusco'),
(1000, 'PE', 'PE-CAL', 'El Callao'),
(1001, 'PE', 'PE-HUV', 'Huancavelica'),
(1002, 'PE', 'PE-HUC', 'Huánuco'),
(1003, 'PE', 'PE-ICA', 'Ica'),
(1004, 'PE', 'PE-JUN', 'Junín'),
(1005, 'PE', 'PE-LAL', 'La Libertad'),
(1006, 'PE', 'PE-LAM', 'Lambayeque'),
(1007, 'PE', 'PE-LIM', 'Lima'),
(1008, 'PE', 'PE-LOR', 'Loreto'),
(1009, 'PE', 'PE-MDD', 'Madre de Dios'),
(1010, 'PE', 'PE-MOQ', 'Moquegua'),
(1011, 'PE', 'PE-PAS', 'Pasco'),
(1012, 'PE', 'PE-PIU', 'Piura'),
(1013, 'PE', 'PE-PUN', 'Puno'),
(1014, 'PE', 'PE-SAM', 'San Martín'),
(1015, 'PE', 'PE-TAC', 'Tacna'),
(1016, 'PE', 'PE-TUM', 'Tumbes'),
(1017, 'PE', 'PE-UCA', 'Ucayali'),
(1018, 'PL', 'PL-02', 'dolnośląskie'),
(1019, 'PL', 'PL-04', 'kujawsko-pomorskie'),
(1020, 'PL', 'PL-06', 'lubelskie'),
(1021, 'PL', 'PL-08', 'lubuskie'),
(1022, 'PL', 'PL-10', 'łódzkie'),
(1023, 'PL', 'PL-12', 'małopolskie'),
(1024, 'PL', 'PL-14', 'mazowieckie'),
(1025, 'PL', 'PL-16', 'opolskie'),
(1026, 'PL', 'PL-18', 'podkarpackie'),
(1027, 'PL', 'PL-20', 'podlaskie'),
(1028, 'PL', 'PL-22', 'pomorskie'),
(1029, 'PL', 'PL-24', 'śląskie'),
(1030, 'PL', 'PL-26', 'świętokrzyskie'),
(1031, 'PL', 'PL-28', 'warmińsko-mazurskie'),
(1032, 'PL', 'PL-30', 'wielkopolskie'),
(1033, 'PL', 'PL-32', 'zachodniopomorskie'),
(1034, 'PT', 'PT-01', 'Aveiro'),
(1035, 'PT', 'PT-02', 'Beja'),
(1036, 'PT', 'PT-03', 'Braga'),
(1037, 'PT', 'PT-04', 'Bragança'),
(1038, 'PT', 'PT-05', 'Castelo Branco'),
(1039, 'PT', 'PT-06', 'Coimbra'),
(1040, 'PT', 'PT-07', 'Évora'),
(1041, 'PT', 'PT-08', 'Faro'),
(1042, 'PT', 'PT-09', 'Guarda'),
(1043, 'PT', 'PT-10', 'Leiria'),
(1044, 'PT', 'PT-11', 'Lisboa'),
(1045, 'PT', 'PT-12', 'Portalegre'),
(1046, 'PT', 'PT-13', 'Porto'),
(1047, 'PT', 'PT-14', 'Santarém'),
(1048, 'PT', 'PT-15', 'Setúbal'),
(1049, 'PT', 'PT-16', 'Viana do Castelo'),
(1050, 'PT', 'PT-17', 'Vila Real'),
(1051, 'PT', 'PT-18', 'Viseu'),
(1052, 'PT', 'PT-20', 'Região Autónoma dos Açores'),
(1053, 'PT', 'PT-30', 'Região Autónoma da Madeira'),
(1054, 'SR', 'SR-BR', 'Brokopondo'),
(1055, 'SR', 'SR-CM', 'Commewijne'),
(1056, 'SR', 'SR-CR', 'Coronie'),
(1057, 'SR', 'SR-MA', 'Marowijne'),
(1058, 'SR', 'SR-NI', 'Nickerie'),
(1059, 'SR', 'SR-PR', 'Para'),
(1060, 'SR', 'SR-PM', 'Paramaribo'),
(1061, 'SR', 'SR-SA', 'Saramacca'),
(1062, 'SR', 'SR-SI', 'Sipaliwini'),
(1063, 'SR', 'SR-WA', 'Wanica'),
(1064, 'SE', 'SE-K', 'Blekinge län'),
(1065, 'SE', 'SE-W', 'Dalarnas län'),
(1066, 'SE', 'SE-I', 'Gotlands län'),
(1067, 'SE', 'SE-X', 'Gävleborgs län'),
(1068, 'SE', 'SE-N', 'Hallands län'),
(1069, 'SE', 'SE-Z', 'Jämtlands län'),
(1070, 'SE', 'SE-F', 'Jönköpings län'),
(1071, 'SE', 'SE-H', 'Kalmar län'),
(1072, 'SE', 'SE-G', 'Kronobergs län'),
(1073, 'SE', 'SE-BD', 'Norrbottens län'),
(1074, 'SE', 'SE-M', 'Skåne län'),
(1075, 'SE', 'SE-AB', 'Stockholms län'),
(1076, 'SE', 'SE-D', 'Södermanlands län'),
(1077, 'SE', 'SE-C', 'Uppsala län'),
(1078, 'SE', 'SE-S', 'Värmlands län'),
(1079, 'SE', 'SE-AC', 'Västerbottens län'),
(1080, 'SE', 'SE-Y', 'Västernorrlands län'),
(1081, 'SE', 'SE-U', 'Västmanlands län'),
(1082, 'SE', 'SE-O', 'Västra Götalands län'),
(1083, 'SE', 'SE-T', 'Örebro län'),
(1084, 'SE', 'SE-E', 'Östergötlands län'),
(1085, 'UA', 'UA-71', 'Cherkaska oblast'),
(1086, 'UA', 'UA-74', 'Chernihivska oblast'),
(1087, 'UA', 'UA-77', 'Chernivetska oblast'),
(1088, 'UA', 'UA-12', 'Dnipropetrovska oblast'),
(1089, 'UA', 'UA-14', 'Donetska oblast'),
(1090, 'UA', 'UA-26', 'Ivano-Frankivska oblast'),
(1091, 'UA', 'UA-63', 'Kharkivska oblast'),
(1092, 'UA', 'UA-65', 'Khersonska oblast'),
(1093, 'UA', 'UA-68', 'Khmelnytska oblast'),
(1094, 'UA', 'UA-35', 'Kirovohradska oblast'),
(1095, 'UA', 'UA-32', 'Kyivska oblast'),
(1096, 'UA', 'UA-09', 'Luhanska oblast'),
(1097, 'UA', 'UA-46', 'Lvivska oblast'),
(1098, 'UA', 'UA-48', 'Mykolaivska oblast'),
(1099, 'UA', 'UA-51', 'Odeska oblast'),
(1100, 'UA', 'UA-53', 'Poltavska oblast'),
(1101, 'UA', 'UA-56', 'Rivnenska oblast'),
(1102, 'UA', 'UA-59', 'Sumska oblast'),
(1103, 'UA', 'UA-61', 'Ternopilska oblast'),
(1104, 'UA', 'UA-05', 'Vinnytska oblast'),
(1105, 'UA', 'UA-07', 'Volynska oblast'),
(1106, 'UA', 'UA-21', 'Zakarpatska oblast'),
(1107, 'UA', 'UA-23', 'Zaporizka oblast'),
(1108, 'UA', 'UA-18', 'Zhytomyrska oblast'),
(1109, 'UA', 'UA-43', 'Avtonomna Respublika Krym'),
(1110, 'UA', 'UA-30', 'Kyiv'),
(1111, 'UA', 'UA-40', 'Sevastopol'),
(1112, 'UY', 'UY-AR', 'Artigas'),
(1113, 'UY', 'UY-CA', 'Canelones'),
(1114, 'UY', 'UY-CL', 'Cerro Largo'),
(1115, 'UY', 'UY-CO', 'Colonia'),
(1116, 'UY', 'UY-DU', 'Durazno'),
(1117, 'UY', 'UY-FS', 'Flores'),
(1118, 'UY', 'UY-FD', 'Florida'),
(1119, 'UY', 'UY-LA', 'Lavalleja'),
(1120, 'UY', 'UY-MA', 'Maldonado'),
(1121, 'UY', 'UY-MO', 'Montevideo'),
(1122, 'UY', 'UY-PA', 'Paysandu'),
(1123, 'UY', 'UY-RN', 'Río Negro'),
(1124, 'UY', 'UY-RV', 'Rivera'),
(1125, 'UY', 'UY-RO', 'Rocha'),
(1126, 'UY', 'UY-SA', 'Salto'),
(1127, 'UY', 'UY-SJ', 'San José'),
(1128, 'UY', 'UY-SO', 'Soriano'),
(1129, 'UY', 'UY-TA', 'Tacuarembó'),
(1130, 'UY', 'UY-TT', 'Treinta y Tres'),
(1131, 'VE', 'VE-W', 'Dependencias Federales'),
(1132, 'VE', 'VE-A', 'Distrito Capital'),
(1133, 'VE', 'VE-Z', 'Amazonas'),
(1134, 'VE', 'VE-B', 'Anzoátegui'),
(1135, 'VE', 'VE-C', 'Apure'),
(1136, 'VE', 'VE-D', 'Aragua'),
(1137, 'VE', 'VE-E', 'Barinas'),
(1138, 'VE', 'VE-F', 'Bolívar'),
(1139, 'VE', 'VE-G', 'Carabobo'),
(1140, 'VE', 'VE-H', 'Cojedes'),
(1141, 'VE', 'VE-Y', 'Delta Amacuro'),
(1142, 'VE', 'VE-I', 'Falcón'),
(1143, 'VE', 'VE-J', 'Guárico'),
(1144, 'VE', 'VE-K', 'Lara'),
(1145, 'VE', 'VE-L', 'Mérida'),
(1146, 'VE', 'VE-M', 'Miranda'),
(1147, 'VE', 'VE-N', 'Monagas'),
(1148, 'VE', 'VE-O', 'Nueva Esparta'),
(1149, 'VE', 'VE-P', 'Portuguesa'),
(1150, 'VE', 'VE-R', 'Sucre'),
(1151, 'VE', 'VE-S', 'Táchira'),
(1152, 'VE', 'VE-T', 'Trujillo'),
(1153, 'VE', 'VE-X', 'Vargas'),
(1154, 'VE', 'VE-U', 'Yaracuy'),
(1155, 'VE', 'VE-V', 'Zulia'),
(1156, 'IN', 'LA', 'Ladakh');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region_name`
--

CREATE TABLE `directory_country_region_name` (
  `locale` varchar(16) NOT NULL COMMENT 'Locale',
  `region_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Region ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country Region Name';

--
-- Dumping data for table `directory_country_region_name`
--

INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES
('en_US', 1, 'Alabama'),
('en_US', 2, 'Alaska'),
('en_US', 3, 'American Samoa'),
('en_US', 4, 'Arizona'),
('en_US', 5, 'Arkansas'),
('en_US', 6, 'Armed Forces Africa'),
('en_US', 7, 'Armed Forces Americas'),
('en_US', 8, 'Armed Forces Canada'),
('en_US', 9, 'Armed Forces Europe'),
('en_US', 10, 'Armed Forces Middle East'),
('en_US', 11, 'Armed Forces Pacific'),
('en_US', 12, 'California'),
('en_US', 13, 'Colorado'),
('en_US', 14, 'Connecticut'),
('en_US', 15, 'Delaware'),
('en_US', 16, 'District of Columbia'),
('en_US', 17, 'Federated States Of Micronesia'),
('en_US', 18, 'Florida'),
('en_US', 19, 'Georgia'),
('en_US', 20, 'Guam'),
('en_US', 21, 'Hawaii'),
('en_US', 22, 'Idaho'),
('en_US', 23, 'Illinois'),
('en_US', 24, 'Indiana'),
('en_US', 25, 'Iowa'),
('en_US', 26, 'Kansas'),
('en_US', 27, 'Kentucky'),
('en_US', 28, 'Louisiana'),
('en_US', 29, 'Maine'),
('en_US', 30, 'Marshall Islands'),
('en_US', 31, 'Maryland'),
('en_US', 32, 'Massachusetts'),
('en_US', 33, 'Michigan'),
('en_US', 34, 'Minnesota'),
('en_US', 35, 'Mississippi'),
('en_US', 36, 'Missouri'),
('en_US', 37, 'Montana'),
('en_US', 38, 'Nebraska'),
('en_US', 39, 'Nevada'),
('en_US', 40, 'New Hampshire'),
('en_US', 41, 'New Jersey'),
('en_US', 42, 'New Mexico'),
('en_US', 43, 'New York'),
('en_US', 44, 'North Carolina'),
('en_US', 45, 'North Dakota'),
('en_US', 46, 'Northern Mariana Islands'),
('en_US', 47, 'Ohio'),
('en_US', 48, 'Oklahoma'),
('en_US', 49, 'Oregon'),
('en_US', 50, 'Palau'),
('en_US', 51, 'Pennsylvania'),
('en_US', 52, 'Puerto Rico'),
('en_US', 53, 'Rhode Island'),
('en_US', 54, 'South Carolina'),
('en_US', 55, 'South Dakota'),
('en_US', 56, 'Tennessee'),
('en_US', 57, 'Texas'),
('en_US', 58, 'Utah'),
('en_US', 59, 'Vermont'),
('en_US', 60, 'Virgin Islands'),
('en_US', 61, 'Virginia'),
('en_US', 62, 'Washington'),
('en_US', 63, 'West Virginia'),
('en_US', 64, 'Wisconsin'),
('en_US', 65, 'Wyoming'),
('en_US', 66, 'Alberta'),
('en_US', 67, 'British Columbia'),
('en_US', 68, 'Manitoba'),
('en_US', 69, 'Newfoundland and Labrador'),
('en_US', 70, 'New Brunswick'),
('en_US', 71, 'Nova Scotia'),
('en_US', 72, 'Northwest Territories'),
('en_US', 73, 'Nunavut'),
('en_US', 74, 'Ontario'),
('en_US', 75, 'Prince Edward Island'),
('en_US', 76, 'Quebec'),
('en_US', 77, 'Saskatchewan'),
('en_US', 78, 'Yukon Territory'),
('en_US', 79, 'Niedersachsen'),
('en_US', 80, 'Baden-Württemberg'),
('en_US', 81, 'Bayern'),
('en_US', 82, 'Berlin'),
('en_US', 83, 'Brandenburg'),
('en_US', 84, 'Bremen'),
('en_US', 85, 'Hamburg'),
('en_US', 86, 'Hessen'),
('en_US', 87, 'Mecklenburg-Vorpommern'),
('en_US', 88, 'Nordrhein-Westfalen'),
('en_US', 89, 'Rheinland-Pfalz'),
('en_US', 90, 'Saarland'),
('en_US', 91, 'Sachsen'),
('en_US', 92, 'Sachsen-Anhalt'),
('en_US', 93, 'Schleswig-Holstein'),
('en_US', 94, 'Thüringen'),
('en_US', 95, 'Wien'),
('en_US', 96, 'Niederösterreich'),
('en_US', 97, 'Oberösterreich'),
('en_US', 98, 'Salzburg'),
('en_US', 99, 'Kärnten'),
('en_US', 100, 'Steiermark'),
('en_US', 101, 'Tirol'),
('en_US', 102, 'Burgenland'),
('en_US', 103, 'Vorarlberg'),
('en_US', 104, 'Aargau'),
('en_US', 105, 'Appenzell Innerrhoden'),
('en_US', 106, 'Appenzell Ausserrhoden'),
('en_US', 107, 'Bern'),
('en_US', 108, 'Basel-Landschaft'),
('en_US', 109, 'Basel-Stadt'),
('en_US', 110, 'Friburg'),
('en_US', 111, 'Geneva'),
('en_US', 112, 'Glarus'),
('en_US', 113, 'Graubünden'),
('en_US', 114, 'Jura'),
('en_US', 115, 'Lucerne'),
('en_US', 116, 'Neuchâtel'),
('en_US', 117, 'Nidwalden'),
('en_US', 118, 'Obwalden'),
('en_US', 119, 'St. Gallen'),
('en_US', 120, 'Schaffhausen'),
('en_US', 121, 'Solothurn'),
('en_US', 122, 'Schwyz'),
('en_US', 123, 'Thurgau'),
('en_US', 124, 'Ticino'),
('en_US', 125, 'Uri'),
('en_US', 126, 'Vaud'),
('en_US', 127, 'Wallis'),
('en_US', 128, 'Zug'),
('en_US', 129, 'Zürich'),
('en_US', 130, 'A Coruña'),
('en_US', 131, 'Alava'),
('en_US', 132, 'Albacete'),
('en_US', 133, 'Alicante'),
('en_US', 134, 'Almeria'),
('en_US', 135, 'Asturias'),
('en_US', 136, 'Avila'),
('en_US', 137, 'Badajoz'),
('en_US', 138, 'Baleares'),
('en_US', 139, 'Barcelona'),
('en_US', 140, 'Burgos'),
('en_US', 141, 'Caceres'),
('en_US', 142, 'Cadiz'),
('en_US', 143, 'Cantabria'),
('en_US', 144, 'Castellon'),
('en_US', 145, 'Ceuta'),
('en_US', 146, 'Ciudad Real'),
('en_US', 147, 'Cordoba'),
('en_US', 148, 'Cuenca'),
('en_US', 149, 'Girona'),
('en_US', 150, 'Granada'),
('en_US', 151, 'Guadalajara'),
('en_US', 152, 'Guipuzcoa'),
('en_US', 153, 'Huelva'),
('en_US', 154, 'Huesca'),
('en_US', 155, 'Jaen'),
('en_US', 156, 'La Rioja'),
('en_US', 157, 'Las Palmas'),
('en_US', 158, 'Leon'),
('en_US', 159, 'Lleida'),
('en_US', 160, 'Lugo'),
('en_US', 161, 'Madrid'),
('en_US', 162, 'Malaga'),
('en_US', 163, 'Melilla'),
('en_US', 164, 'Murcia'),
('en_US', 165, 'Navarra'),
('en_US', 166, 'Ourense'),
('en_US', 167, 'Palencia'),
('en_US', 168, 'Pontevedra'),
('en_US', 169, 'Salamanca'),
('en_US', 170, 'Santa Cruz de Tenerife'),
('en_US', 171, 'Segovia'),
('en_US', 172, 'Sevilla'),
('en_US', 173, 'Soria'),
('en_US', 174, 'Tarragona'),
('en_US', 175, 'Teruel'),
('en_US', 176, 'Toledo'),
('en_US', 177, 'Valencia'),
('en_US', 178, 'Valladolid'),
('en_US', 179, 'Vizcaya'),
('en_US', 180, 'Zamora'),
('en_US', 181, 'Zaragoza'),
('en_US', 182, 'Ain'),
('en_US', 183, 'Aisne'),
('en_US', 184, 'Allier'),
('en_US', 185, 'Alpes-de-Haute-Provence'),
('en_US', 186, 'Hautes-Alpes'),
('en_US', 187, 'Alpes-Maritimes'),
('en_US', 188, 'Ardèche'),
('en_US', 189, 'Ardennes'),
('en_US', 190, 'Ariège'),
('en_US', 191, 'Aube'),
('en_US', 192, 'Aude'),
('en_US', 193, 'Aveyron'),
('en_US', 194, 'Bouches-du-Rhône'),
('en_US', 195, 'Calvados'),
('en_US', 196, 'Cantal'),
('en_US', 197, 'Charente'),
('en_US', 198, 'Charente-Maritime'),
('en_US', 199, 'Cher'),
('en_US', 200, 'Corrèze'),
('en_US', 201, 'Corse-du-Sud'),
('en_US', 202, 'Haute-Corse'),
('en_US', 203, 'Côte-d\'Or'),
('en_US', 204, 'Côtes-d\'Armor'),
('en_US', 205, 'Creuse'),
('en_US', 206, 'Dordogne'),
('en_US', 207, 'Doubs'),
('en_US', 208, 'Drôme'),
('en_US', 209, 'Eure'),
('en_US', 210, 'Eure-et-Loir'),
('en_US', 211, 'Finistère'),
('en_US', 212, 'Gard'),
('en_US', 213, 'Haute-Garonne'),
('en_US', 214, 'Gers'),
('en_US', 215, 'Gironde'),
('en_US', 216, 'Hérault'),
('en_US', 217, 'Ille-et-Vilaine'),
('en_US', 218, 'Indre'),
('en_US', 219, 'Indre-et-Loire'),
('en_US', 220, 'Isère'),
('en_US', 221, 'Jura'),
('en_US', 222, 'Landes'),
('en_US', 223, 'Loir-et-Cher'),
('en_US', 224, 'Loire'),
('en_US', 225, 'Haute-Loire'),
('en_US', 226, 'Loire-Atlantique'),
('en_US', 227, 'Loiret'),
('en_US', 228, 'Lot'),
('en_US', 229, 'Lot-et-Garonne'),
('en_US', 230, 'Lozère'),
('en_US', 231, 'Maine-et-Loire'),
('en_US', 232, 'Manche'),
('en_US', 233, 'Marne'),
('en_US', 234, 'Haute-Marne'),
('en_US', 235, 'Mayenne'),
('en_US', 236, 'Meurthe-et-Moselle'),
('en_US', 237, 'Meuse'),
('en_US', 238, 'Morbihan'),
('en_US', 239, 'Moselle'),
('en_US', 240, 'Nièvre'),
('en_US', 241, 'Nord'),
('en_US', 242, 'Oise'),
('en_US', 243, 'Orne'),
('en_US', 244, 'Pas-de-Calais'),
('en_US', 245, 'Puy-de-Dôme'),
('en_US', 246, 'Pyrénées-Atlantiques'),
('en_US', 247, 'Hautes-Pyrénées'),
('en_US', 248, 'Pyrénées-Orientales'),
('en_US', 249, 'Bas-Rhin'),
('en_US', 250, 'Haut-Rhin'),
('en_US', 251, 'Rhône'),
('en_US', 252, 'Haute-Saône'),
('en_US', 253, 'Saône-et-Loire'),
('en_US', 254, 'Sarthe'),
('en_US', 255, 'Savoie'),
('en_US', 256, 'Haute-Savoie'),
('en_US', 257, 'Paris'),
('en_US', 258, 'Seine-Maritime'),
('en_US', 259, 'Seine-et-Marne'),
('en_US', 260, 'Yvelines'),
('en_US', 261, 'Deux-Sèvres'),
('en_US', 262, 'Somme'),
('en_US', 263, 'Tarn'),
('en_US', 264, 'Tarn-et-Garonne'),
('en_US', 265, 'Var'),
('en_US', 266, 'Vaucluse'),
('en_US', 267, 'Vendée'),
('en_US', 268, 'Vienne'),
('en_US', 269, 'Haute-Vienne'),
('en_US', 270, 'Vosges'),
('en_US', 271, 'Yonne'),
('en_US', 272, 'Territoire-de-Belfort'),
('en_US', 273, 'Essonne'),
('en_US', 274, 'Hauts-de-Seine'),
('en_US', 275, 'Seine-Saint-Denis'),
('en_US', 276, 'Val-de-Marne'),
('en_US', 277, 'Val-d\'Oise'),
('en_US', 278, 'Alba'),
('en_US', 279, 'Arad'),
('en_US', 280, 'Argeş'),
('en_US', 281, 'Bacău'),
('en_US', 282, 'Bihor'),
('en_US', 283, 'Bistriţa-Năsăud'),
('en_US', 284, 'Botoşani'),
('en_US', 285, 'Braşov'),
('en_US', 286, 'Brăila'),
('en_US', 287, 'Bucureşti'),
('en_US', 288, 'Buzău'),
('en_US', 289, 'Caraş-Severin'),
('en_US', 290, 'Călăraşi'),
('en_US', 291, 'Cluj'),
('en_US', 292, 'Constanţa'),
('en_US', 293, 'Covasna'),
('en_US', 294, 'Dâmboviţa'),
('en_US', 295, 'Dolj'),
('en_US', 296, 'Galaţi'),
('en_US', 297, 'Giurgiu'),
('en_US', 298, 'Gorj'),
('en_US', 299, 'Harghita'),
('en_US', 300, 'Hunedoara'),
('en_US', 301, 'Ialomiţa'),
('en_US', 302, 'Iaşi'),
('en_US', 303, 'Ilfov'),
('en_US', 304, 'Maramureş'),
('en_US', 305, 'Mehedinţi'),
('en_US', 306, 'Mureş'),
('en_US', 307, 'Neamţ'),
('en_US', 308, 'Olt'),
('en_US', 309, 'Prahova'),
('en_US', 310, 'Satu-Mare'),
('en_US', 311, 'Sălaj'),
('en_US', 312, 'Sibiu'),
('en_US', 313, 'Suceava'),
('en_US', 314, 'Teleorman'),
('en_US', 315, 'Timiş'),
('en_US', 316, 'Tulcea'),
('en_US', 317, 'Vaslui'),
('en_US', 318, 'Vâlcea'),
('en_US', 319, 'Vrancea'),
('en_US', 320, 'Lappi'),
('en_US', 321, 'Pohjois-Pohjanmaa'),
('en_US', 322, 'Kainuu'),
('en_US', 323, 'Pohjois-Karjala'),
('en_US', 324, 'Pohjois-Savo'),
('en_US', 325, 'Etelä-Savo'),
('en_US', 326, 'Etelä-Pohjanmaa'),
('en_US', 327, 'Pohjanmaa'),
('en_US', 328, 'Pirkanmaa'),
('en_US', 329, 'Satakunta'),
('en_US', 330, 'Keski-Pohjanmaa'),
('en_US', 331, 'Keski-Suomi'),
('en_US', 332, 'Varsinais-Suomi'),
('en_US', 333, 'Etelä-Karjala'),
('en_US', 334, 'Päijät-Häme'),
('en_US', 335, 'Kanta-Häme'),
('en_US', 336, 'Uusimaa'),
('en_US', 337, 'Itä-Uusimaa'),
('en_US', 338, 'Kymenlaakso'),
('en_US', 339, 'Ahvenanmaa'),
('en_US', 340, 'Harjumaa'),
('en_US', 341, 'Hiiumaa'),
('en_US', 342, 'Ida-Virumaa'),
('en_US', 343, 'Jõgevamaa'),
('en_US', 344, 'Järvamaa'),
('en_US', 345, 'Läänemaa'),
('en_US', 346, 'Lääne-Virumaa'),
('en_US', 347, 'Põlvamaa'),
('en_US', 348, 'Pärnumaa'),
('en_US', 349, 'Raplamaa'),
('en_US', 350, 'Saaremaa'),
('en_US', 351, 'Tartumaa'),
('en_US', 352, 'Valgamaa'),
('en_US', 353, 'Viljandimaa'),
('en_US', 354, 'Võrumaa'),
('en_US', 355, 'Daugavpils'),
('en_US', 356, 'Jelgava'),
('en_US', 357, 'Jēkabpils'),
('en_US', 358, 'Jūrmala'),
('en_US', 359, 'Liepāja'),
('en_US', 360, 'Liepājas novads'),
('en_US', 361, 'Rēzekne'),
('en_US', 362, 'Rīga'),
('en_US', 363, 'Rīgas novads'),
('en_US', 364, 'Valmiera'),
('en_US', 365, 'Ventspils'),
('en_US', 366, 'Aglonas novads'),
('en_US', 367, 'Aizkraukles novads'),
('en_US', 368, 'Aizputes novads'),
('en_US', 369, 'Aknīstes novads'),
('en_US', 370, 'Alojas novads'),
('en_US', 371, 'Alsungas novads'),
('en_US', 372, 'Alūksnes novads'),
('en_US', 373, 'Amatas novads'),
('en_US', 374, 'Apes novads'),
('en_US', 375, 'Auces novads'),
('en_US', 376, 'Babītes novads'),
('en_US', 377, 'Baldones novads'),
('en_US', 378, 'Baltinavas novads'),
('en_US', 379, 'Balvu novads'),
('en_US', 380, 'Bauskas novads'),
('en_US', 381, 'Beverīnas novads'),
('en_US', 382, 'Brocēnu novads'),
('en_US', 383, 'Burtnieku novads'),
('en_US', 384, 'Carnikavas novads'),
('en_US', 385, 'Cesvaines novads'),
('en_US', 386, 'Ciblas novads'),
('en_US', 387, 'Cēsu novads'),
('en_US', 388, 'Dagdas novads'),
('en_US', 389, 'Daugavpils novads'),
('en_US', 390, 'Dobeles novads'),
('en_US', 391, 'Dundagas novads'),
('en_US', 392, 'Durbes novads'),
('en_US', 393, 'Engures novads'),
('en_US', 394, 'Garkalnes novads'),
('en_US', 395, 'Grobiņas novads'),
('en_US', 396, 'Gulbenes novads'),
('en_US', 397, 'Iecavas novads'),
('en_US', 398, 'Ikšķiles novads'),
('en_US', 399, 'Ilūkstes novads'),
('en_US', 400, 'Inčukalna novads'),
('en_US', 401, 'Jaunjelgavas novads'),
('en_US', 402, 'Jaunpiebalgas novads'),
('en_US', 403, 'Jaunpils novads'),
('en_US', 404, 'Jelgavas novads'),
('en_US', 405, 'Jēkabpils novads'),
('en_US', 406, 'Kandavas novads'),
('en_US', 407, 'Kokneses novads'),
('en_US', 408, 'Krimuldas novads'),
('en_US', 409, 'Krustpils novads'),
('en_US', 410, 'Krāslavas novads'),
('en_US', 411, 'Kuldīgas novads'),
('en_US', 412, 'Kārsavas novads'),
('en_US', 413, 'Lielvārdes novads'),
('en_US', 414, 'Limbažu novads'),
('en_US', 415, 'Lubānas novads'),
('en_US', 416, 'Ludzas novads'),
('en_US', 417, 'Līgatnes novads'),
('en_US', 418, 'Līvānu novads'),
('en_US', 419, 'Madonas novads'),
('en_US', 420, 'Mazsalacas novads'),
('en_US', 421, 'Mālpils novads'),
('en_US', 422, 'Mārupes novads'),
('en_US', 423, 'Naukšēnu novads'),
('en_US', 424, 'Neretas novads'),
('en_US', 425, 'Nīcas novads'),
('en_US', 426, 'Ogres novads'),
('en_US', 427, 'Olaines novads'),
('en_US', 428, 'Ozolnieku novads'),
('en_US', 429, 'Preiļu novads'),
('en_US', 430, 'Priekules novads'),
('en_US', 431, 'Priekuļu novads'),
('en_US', 432, 'Pārgaujas novads'),
('en_US', 433, 'Pāvilostas novads'),
('en_US', 434, 'Pļaviņu novads'),
('en_US', 435, 'Raunas novads'),
('en_US', 436, 'Riebiņu novads'),
('en_US', 437, 'Rojas novads'),
('en_US', 438, 'Ropažu novads'),
('en_US', 439, 'Rucavas novads'),
('en_US', 440, 'Rugāju novads'),
('en_US', 441, 'Rundāles novads'),
('en_US', 442, 'Rēzeknes novads'),
('en_US', 443, 'Rūjienas novads'),
('en_US', 444, 'Salacgrīvas novads'),
('en_US', 445, 'Salas novads'),
('en_US', 446, 'Salaspils novads'),
('en_US', 447, 'Saldus novads'),
('en_US', 448, 'Saulkrastu novads'),
('en_US', 449, 'Siguldas novads'),
('en_US', 450, 'Skrundas novads'),
('en_US', 451, 'Skrīveru novads'),
('en_US', 452, 'Smiltenes novads'),
('en_US', 453, 'Stopiņu novads'),
('en_US', 454, 'Strenču novads'),
('en_US', 455, 'Sējas novads'),
('en_US', 456, 'Talsu novads'),
('en_US', 457, 'Tukuma novads'),
('en_US', 458, 'Tērvetes novads'),
('en_US', 459, 'Vaiņodes novads'),
('en_US', 460, 'Valkas novads'),
('en_US', 461, 'Valmieras novads'),
('en_US', 462, 'Varakļānu novads'),
('en_US', 463, 'Vecpiebalgas novads'),
('en_US', 464, 'Vecumnieku novads'),
('en_US', 465, 'Ventspils novads'),
('en_US', 466, 'Viesītes novads'),
('en_US', 467, 'Viļakas novads'),
('en_US', 468, 'Viļānu novads'),
('en_US', 469, 'Vārkavas novads'),
('en_US', 470, 'Zilupes novads'),
('en_US', 471, 'Ādažu novads'),
('en_US', 472, 'Ērgļu novads'),
('en_US', 473, 'Ķeguma novads'),
('en_US', 474, 'Ķekavas novads'),
('en_US', 475, 'Alytaus Apskritis'),
('en_US', 476, 'Kauno Apskritis'),
('en_US', 477, 'Klaipėdos Apskritis'),
('en_US', 478, 'Marijampolės Apskritis'),
('en_US', 479, 'Panevėžio Apskritis'),
('en_US', 480, 'Šiaulių Apskritis'),
('en_US', 481, 'Tauragės Apskritis'),
('en_US', 482, 'Telšių Apskritis'),
('en_US', 483, 'Utenos Apskritis'),
('en_US', 484, 'Vilniaus Apskritis'),
('en_US', 485, 'Acre'),
('en_US', 486, 'Alagoas'),
('en_US', 487, 'Amapá'),
('en_US', 488, 'Amazonas'),
('en_US', 489, 'Bahia'),
('en_US', 490, 'Ceará'),
('en_US', 491, 'Espírito Santo'),
('en_US', 492, 'Goiás'),
('en_US', 493, 'Maranhão'),
('en_US', 494, 'Mato Grosso'),
('en_US', 495, 'Mato Grosso do Sul'),
('en_US', 496, 'Minas Gerais'),
('en_US', 497, 'Pará'),
('en_US', 498, 'Paraíba'),
('en_US', 499, 'Paraná'),
('en_US', 500, 'Pernambuco'),
('en_US', 501, 'Piauí'),
('en_US', 502, 'Rio de Janeiro'),
('en_US', 503, 'Rio Grande do Norte'),
('en_US', 504, 'Rio Grande do Sul'),
('en_US', 505, 'Rondônia'),
('en_US', 506, 'Roraima'),
('en_US', 507, 'Santa Catarina'),
('en_US', 508, 'São Paulo'),
('en_US', 509, 'Sergipe'),
('en_US', 510, 'Tocantins'),
('en_US', 511, 'Distrito Federal'),
('en_US', 512, 'Berat'),
('en_US', 513, 'Dibër'),
('en_US', 514, 'Durrës'),
('en_US', 515, 'Elbasan'),
('en_US', 516, 'Fier'),
('en_US', 517, 'Gjirokastër'),
('en_US', 518, 'Korçë'),
('en_US', 519, 'Kukës'),
('en_US', 520, 'Lezhë'),
('en_US', 521, 'Shkodër'),
('en_US', 522, 'Tiranë'),
('en_US', 523, 'Vlorë'),
('en_US', 524, 'Ciudad Autónoma de Buenos Aires'),
('en_US', 525, 'Buenos Aires'),
('en_US', 526, 'Catamarca'),
('en_US', 527, 'Chaco'),
('en_US', 528, 'Chubut'),
('en_US', 529, 'Córdoba'),
('en_US', 530, 'Corrientes'),
('en_US', 531, 'Entre Ríos'),
('en_US', 532, 'Formosa'),
('en_US', 533, 'Jujuy'),
('en_US', 534, 'La Pampa'),
('en_US', 535, 'La Rioja'),
('en_US', 536, 'Mendoza'),
('en_US', 537, 'Misiones'),
('en_US', 538, 'Neuquén'),
('en_US', 539, 'Río Negro'),
('en_US', 540, 'Salta'),
('en_US', 541, 'San Juan'),
('en_US', 542, 'San Luis'),
('en_US', 543, 'Santa Cruz'),
('en_US', 544, 'Santa Fe'),
('en_US', 545, 'Santiago del Estero'),
('en_US', 546, 'Tierra del Fuego'),
('en_US', 547, 'Tucumán'),
('en_US', 548, 'Zagrebačka županija'),
('en_US', 549, 'Krapinsko-zagorska županija'),
('en_US', 550, 'Sisačko-moslavačka županija'),
('en_US', 551, 'Karlovačka županija'),
('en_US', 552, 'Varaždinska županija'),
('en_US', 553, 'Koprivničko-križevačka županija'),
('en_US', 554, 'Bjelovarsko-bilogorska županija'),
('en_US', 555, 'Primorsko-goranska županija'),
('en_US', 556, 'Ličko-senjska županija'),
('en_US', 557, 'Virovitičko-podravska županija'),
('en_US', 558, 'Požeško-slavonska županija'),
('en_US', 559, 'Brodsko-posavska županija'),
('en_US', 560, 'Zadarska županija'),
('en_US', 561, 'Osječko-baranjska županija'),
('en_US', 562, 'Šibensko-kninska županija'),
('en_US', 563, 'Vukovarsko-srijemska županija'),
('en_US', 564, 'Splitsko-dalmatinska županija'),
('en_US', 565, 'Istarska županija'),
('en_US', 566, 'Dubrovačko-neretvanska županija'),
('en_US', 567, 'Međimurska županija'),
('en_US', 568, 'Grad Zagreb'),
('en_US', 569, 'Andaman and Nicobar Islands'),
('en_US', 570, 'Andhra Pradesh'),
('en_US', 571, 'Arunachal Pradesh'),
('en_US', 572, 'Assam'),
('en_US', 573, 'Bihar'),
('en_US', 574, 'Chandigarh'),
('en_US', 575, 'Chhattisgarh'),
('en_US', 576, 'Dadra and Nagar Haveli'),
('en_US', 577, 'Daman and Diu'),
('en_US', 578, 'Delhi'),
('en_US', 579, 'Goa'),
('en_US', 580, 'Gujarat'),
('en_US', 581, 'Haryana'),
('en_US', 582, 'Himachal Pradesh'),
('en_US', 583, 'Jammu and Kashmir'),
('en_US', 584, 'Jharkhand'),
('en_US', 585, 'Karnataka'),
('en_US', 586, 'Kerala'),
('en_US', 587, 'Lakshadweep'),
('en_US', 588, 'Madhya Pradesh'),
('en_US', 589, 'Maharashtra'),
('en_US', 590, 'Manipur'),
('en_US', 591, 'Meghalaya'),
('en_US', 592, 'Mizoram'),
('en_US', 593, 'Nagaland'),
('en_US', 594, 'Odisha'),
('en_US', 595, 'Puducherry'),
('en_US', 596, 'Punjab'),
('en_US', 597, 'Rajasthan'),
('en_US', 598, 'Sikkim'),
('en_US', 599, 'Tamil Nadu'),
('en_US', 600, 'Telangana'),
('en_US', 601, 'Tripura'),
('en_US', 602, 'Uttar Pradesh'),
('en_US', 603, 'Uttarakhand'),
('en_US', 604, 'West Bengal'),
('en_US', 605, 'Australian Capital Territory'),
('en_US', 606, 'New South Wales'),
('en_US', 607, 'Victoria'),
('en_US', 608, 'Queensland'),
('en_US', 609, 'South Australia'),
('en_US', 610, 'Tasmania'),
('en_US', 611, 'Western Australia'),
('en_US', 612, 'Northern Territory'),
('en_US', 613, 'Bresckaja voblasć'),
('en_US', 614, 'Homieĺskaja voblasć'),
('en_US', 615, 'Horad Minsk'),
('en_US', 616, 'Hrodzienskaja voblasć'),
('en_US', 617, 'Mahilioŭskaja voblasć'),
('en_US', 618, 'Minskaja voblasć'),
('en_US', 619, 'Viciebskaja voblasć'),
('en_US', 620, 'Antwerpen'),
('en_US', 621, 'Brabant wallon'),
('en_US', 622, 'Brussels-Capital Region'),
('en_US', 623, 'Hainaut'),
('en_US', 624, 'Limburg'),
('en_US', 625, 'Liège'),
('en_US', 626, 'Luxembourg'),
('en_US', 627, 'Namur'),
('en_US', 628, 'Oost-Vlaanderen'),
('en_US', 629, 'Vlaams-Brabant'),
('en_US', 630, 'West-Vlaanderen'),
('en_US', 631, 'Cochabamba'),
('en_US', 632, 'Chuquisaca'),
('en_US', 633, 'El Beni'),
('en_US', 634, 'La Paz'),
('en_US', 635, 'Oruro'),
('en_US', 636, 'Pando'),
('en_US', 637, 'Potosí'),
('en_US', 638, 'Santa Cruz'),
('en_US', 639, 'Tarija'),
('en_US', 640, 'Blagoevgrad'),
('en_US', 641, 'Burgas'),
('en_US', 642, 'Varna'),
('en_US', 643, 'Veliko Tarnovo'),
('en_US', 644, 'Vidin'),
('en_US', 645, 'Vratsa'),
('en_US', 646, 'Gabrovo'),
('en_US', 647, 'Dobrich'),
('en_US', 648, 'Kardzhali'),
('en_US', 649, 'Kyustendil'),
('en_US', 650, 'Lovech'),
('en_US', 651, 'Montana'),
('en_US', 652, 'Pazardzhik'),
('en_US', 653, 'Pernik'),
('en_US', 654, 'Pleven'),
('en_US', 655, 'Plovdiv'),
('en_US', 656, 'Razgrad'),
('en_US', 657, 'Ruse'),
('en_US', 658, 'Silistra'),
('en_US', 659, 'Sliven'),
('en_US', 660, 'Smolyan'),
('en_US', 661, 'Sofia City'),
('en_US', 662, 'Sofia Province'),
('en_US', 663, 'Stara Zagora'),
('en_US', 664, 'Targovishte'),
('en_US', 665, 'Haskovo'),
('en_US', 666, 'Shumen'),
('en_US', 667, 'Yambol'),
('en_US', 668, 'Aisén del General Carlos Ibañez del Campo'),
('en_US', 669, 'Antofagasta'),
('en_US', 670, 'Arica y Parinacota'),
('en_US', 671, 'La Araucanía'),
('en_US', 672, 'Atacama'),
('en_US', 673, 'Biobío'),
('en_US', 674, 'Coquimbo'),
('en_US', 675, 'Libertador General Bernardo O\'Higgins'),
('en_US', 676, 'Los Lagos'),
('en_US', 677, 'Los Ríos'),
('en_US', 678, 'Magallanes'),
('en_US', 679, 'Maule'),
('en_US', 680, 'Ñuble'),
('en_US', 681, 'Región Metropolitana de Santiago'),
('en_US', 682, 'Tarapacá'),
('en_US', 683, 'Valparaíso'),
('en_US', 684, 'Anhui Sheng'),
('en_US', 685, 'Beijing Shi'),
('en_US', 686, 'Chongqing Shi'),
('en_US', 687, 'Fujian Sheng'),
('en_US', 688, 'Gansu Sheng'),
('en_US', 689, 'Guangdong Sheng'),
('en_US', 690, 'Guangxi Zhuangzu Zizhiqu'),
('en_US', 691, 'Guizhou Sheng'),
('en_US', 692, 'Hainan Sheng'),
('en_US', 693, 'Hebei Sheng'),
('en_US', 694, 'Heilongjiang Sheng'),
('en_US', 695, 'Henan Sheng'),
('en_US', 696, 'Hong Kong SAR'),
('en_US', 697, 'Hubei Sheng'),
('en_US', 698, 'Hunan Sheng'),
('en_US', 699, 'Jiangsu Sheng'),
('en_US', 700, 'Jiangxi Sheng'),
('en_US', 701, 'Jilin Sheng'),
('en_US', 702, 'Liaoning Sheng'),
('en_US', 703, 'Macao SAR'),
('en_US', 704, 'Nei Mongol Zizhiqu'),
('en_US', 705, 'Ningxia Huizi Zizhiqu'),
('en_US', 706, 'Qinghai Sheng'),
('en_US', 707, 'Shaanxi Sheng'),
('en_US', 708, 'Shandong Sheng'),
('en_US', 709, 'Shanghai Shi'),
('en_US', 710, 'Shanxi Sheng'),
('en_US', 711, 'Sichuan Sheng'),
('en_US', 712, 'Taiwan Sheng'),
('en_US', 713, 'Tianjin Shi'),
('en_US', 714, 'Xinjiang Uygur Zizhiqu'),
('en_US', 715, 'Xizang Zizhiqu'),
('en_US', 716, 'Yunnan Sheng'),
('en_US', 717, 'Zhejiang Sheng'),
('en_US', 718, 'Amazonas'),
('en_US', 719, 'Antioquia'),
('en_US', 720, 'Arauca'),
('en_US', 721, 'Atlántico'),
('en_US', 722, 'Bolívar'),
('en_US', 723, 'Boyacá'),
('en_US', 724, 'Caldas'),
('en_US', 725, 'Caquetá'),
('en_US', 726, 'Casanare'),
('en_US', 727, 'Cauca'),
('en_US', 728, 'Cesar'),
('en_US', 729, 'Chocó'),
('en_US', 730, 'Córdoba'),
('en_US', 731, 'Cundinamarca'),
('en_US', 732, 'Guainía'),
('en_US', 733, 'Guaviare'),
('en_US', 734, 'Huila'),
('en_US', 735, 'La Guajira'),
('en_US', 736, 'Magdalena'),
('en_US', 737, 'Meta'),
('en_US', 738, 'Nariño'),
('en_US', 739, 'Norte de Santander'),
('en_US', 740, 'Putumayo'),
('en_US', 741, 'Quindío'),
('en_US', 742, 'Risaralda'),
('en_US', 743, 'San Andrés y Providencia'),
('en_US', 744, 'Santander'),
('en_US', 745, 'Sucre'),
('en_US', 746, 'Tolima'),
('en_US', 747, 'Valle del Cauca'),
('en_US', 748, 'Vaupés'),
('en_US', 749, 'Vichada'),
('en_US', 750, 'San José'),
('en_US', 751, 'Alajuela'),
('en_US', 752, 'Cartago'),
('en_US', 753, 'Heredia'),
('en_US', 754, 'Guanacaste'),
('en_US', 755, 'Puntarenas'),
('en_US', 756, 'Limón'),
('en_US', 757, 'Praha, Hlavní město'),
('en_US', 758, 'Středočeský kraj'),
('en_US', 759, 'Jihočeský kraj'),
('en_US', 760, 'Plzeňský kraj'),
('en_US', 761, 'Karlovarský kraj'),
('en_US', 762, 'Ústecký kraj'),
('en_US', 763, 'Liberecký kraj'),
('en_US', 764, 'Královéhradecký kraj'),
('en_US', 765, 'Pardubický kraj'),
('en_US', 766, 'Kraj Vysočina'),
('en_US', 767, 'Jihomoravský kraj'),
('en_US', 768, 'Olomoucký kraj'),
('en_US', 769, 'Zlínský kraj'),
('en_US', 770, 'Moravskoslezský kraj'),
('en_US', 771, 'Hovedstaden'),
('en_US', 772, 'Midtjylland'),
('en_US', 773, 'Nordjylland'),
('en_US', 774, 'Sjælland'),
('en_US', 775, 'Syddanmark'),
('en_US', 776, 'Azuay'),
('en_US', 777, 'Bolívar'),
('en_US', 778, 'Cañar'),
('en_US', 779, 'Carchi'),
('en_US', 780, 'Chimborazo'),
('en_US', 781, 'Cotopaxi'),
('en_US', 782, 'El Oro'),
('en_US', 783, 'Esmeraldas'),
('en_US', 784, 'Galápagos'),
('en_US', 785, 'Guayas'),
('en_US', 786, 'Imbabura'),
('en_US', 787, 'Loja'),
('en_US', 788, 'Los Ríos'),
('en_US', 789, 'Manabí'),
('en_US', 790, 'Morona Santiago'),
('en_US', 791, 'Napo'),
('en_US', 792, 'Orellana'),
('en_US', 793, 'Pastaza'),
('en_US', 794, 'Pichincha'),
('en_US', 795, 'Santa Elena'),
('en_US', 796, 'Santo Domingo de los Tsáchilas'),
('en_US', 797, 'Sucumbíos'),
('en_US', 798, 'Tungurahua'),
('en_US', 799, 'Zamora Chinchipe'),
('en_US', 800, 'Anatolikí Makedonía kai Thráki'),
('en_US', 801, 'Attikí'),
('en_US', 802, 'Dytikí Elláda'),
('en_US', 803, 'Dytikí Makedonía'),
('en_US', 804, 'Ionía Nísia'),
('en_US', 805, 'Ípeiros'),
('en_US', 806, 'Kentrikí Makedonía'),
('en_US', 807, 'Kríti'),
('en_US', 808, 'Nótio Aigaío'),
('en_US', 809, 'Pelopónnisos'),
('en_US', 810, 'Stereá Elláda'),
('en_US', 811, 'Thessalía'),
('en_US', 812, 'Vóreio Aigaío'),
('en_US', 813, 'Ágion Óros'),
('en_US', 814, 'Barima-Waini'),
('en_US', 815, 'Cuyuni-Mazaruni'),
('en_US', 816, 'Demerara-Mahaica'),
('en_US', 817, 'East Berbice-Corentyne'),
('en_US', 818, 'Essequibo Islands-West Demerara'),
('en_US', 819, 'Mahaica-Berbice'),
('en_US', 820, 'Pomeroon-Supenaam'),
('en_US', 821, 'Potaro-Siparuni'),
('en_US', 822, 'Upper Demerara-Berbice'),
('en_US', 823, 'Upper Takutu-Upper Essequibo'),
('en_US', 824, 'Höfuðborgarsvæði'),
('en_US', 825, 'Suðurnes'),
('en_US', 826, 'Vesturland'),
('en_US', 827, 'Vestfirðir'),
('en_US', 828, 'Norðurland vestra'),
('en_US', 829, 'Norðurland eystra'),
('en_US', 830, 'Austurland'),
('en_US', 831, 'Suðurland'),
('en_US', 832, 'Agrigento'),
('en_US', 833, 'Alessandria'),
('en_US', 834, 'Ancona'),
('en_US', 835, 'Aosta'),
('en_US', 836, 'L\'Aquila'),
('en_US', 837, 'Arezzo'),
('en_US', 838, 'Ascoli-Piceno'),
('en_US', 839, 'Asti'),
('en_US', 840, 'Avellino'),
('en_US', 841, 'Bari'),
('en_US', 842, 'Barletta-Andria-Trani'),
('en_US', 843, 'Belluno'),
('en_US', 844, 'Benevento'),
('en_US', 845, 'Bergamo'),
('en_US', 846, 'Biella'),
('en_US', 847, 'Bologna'),
('en_US', 848, 'Bolzano'),
('en_US', 849, 'Brescia'),
('en_US', 850, 'Brindisi'),
('en_US', 851, 'Cagliari'),
('en_US', 852, 'Caltanissetta'),
('en_US', 853, 'Campobasso'),
('en_US', 854, 'Carbonia Iglesias'),
('en_US', 855, 'Caserta'),
('en_US', 856, 'Catania'),
('en_US', 857, 'Catanzaro'),
('en_US', 858, 'Chieti'),
('en_US', 859, 'Como'),
('en_US', 860, 'Cosenza'),
('en_US', 861, 'Cremona'),
('en_US', 862, 'Crotone'),
('en_US', 863, 'Cuneo'),
('en_US', 864, 'Enna'),
('en_US', 865, 'Fermo'),
('en_US', 866, 'Ferrara'),
('en_US', 867, 'Firenze'),
('en_US', 868, 'Foggia'),
('en_US', 869, 'Forli-Cesena'),
('en_US', 870, 'Frosinone'),
('en_US', 871, 'Genova'),
('en_US', 872, 'Gorizia'),
('en_US', 873, 'Grosseto'),
('en_US', 874, 'Imperia'),
('en_US', 875, 'Isernia'),
('en_US', 876, 'La-Spezia'),
('en_US', 877, 'Latina'),
('en_US', 878, 'Lecce'),
('en_US', 879, 'Lecco'),
('en_US', 880, 'Livorno'),
('en_US', 881, 'Lodi'),
('en_US', 882, 'Lucca'),
('en_US', 883, 'Macerata'),
('en_US', 884, 'Mantova'),
('en_US', 885, 'Massa-Carrara'),
('en_US', 886, 'Matera'),
('en_US', 887, 'Medio Campidano'),
('en_US', 888, 'Messina'),
('en_US', 889, 'Milano'),
('en_US', 890, 'Modena'),
('en_US', 891, 'Monza-Brianza'),
('en_US', 892, 'Napoli'),
('en_US', 893, 'Novara'),
('en_US', 894, 'Nuoro'),
('en_US', 895, 'Ogliastra'),
('en_US', 896, 'Olbia Tempio'),
('en_US', 897, 'Oristano'),
('en_US', 898, 'Padova'),
('en_US', 899, 'Palermo'),
('en_US', 900, 'Parma'),
('en_US', 901, 'Pavia'),
('en_US', 902, 'Perugia'),
('en_US', 903, 'Pesaro-Urbino'),
('en_US', 904, 'Pescara'),
('en_US', 905, 'Piacenza'),
('en_US', 906, 'Pisa'),
('en_US', 907, 'Pistoia'),
('en_US', 908, 'Pordenone'),
('en_US', 909, 'Potenza'),
('en_US', 910, 'Prato'),
('en_US', 911, 'Ragusa'),
('en_US', 912, 'Ravenna'),
('en_US', 913, 'Reggio-Calabria'),
('en_US', 914, 'Reggio-Emilia'),
('en_US', 915, 'Rieti'),
('en_US', 916, 'Rimini'),
('en_US', 917, 'Roma'),
('en_US', 918, 'Rovigo'),
('en_US', 919, 'Salerno'),
('en_US', 920, 'Sassari'),
('en_US', 921, 'Savona'),
('en_US', 922, 'Siena'),
('en_US', 923, 'Siracusa'),
('en_US', 924, 'Sondrio'),
('en_US', 925, 'Taranto'),
('en_US', 926, 'Teramo'),
('en_US', 927, 'Terni'),
('en_US', 928, 'Torino'),
('en_US', 929, 'Trapani'),
('en_US', 930, 'Trento'),
('en_US', 931, 'Treviso'),
('en_US', 932, 'Trieste'),
('en_US', 933, 'Udine'),
('en_US', 934, 'Varese'),
('en_US', 935, 'Venezia'),
('en_US', 936, 'Verbania'),
('en_US', 937, 'Vercelli'),
('en_US', 938, 'Verona'),
('en_US', 939, 'Vibo-Valentia'),
('en_US', 940, 'Vicenza'),
('en_US', 941, 'Viterbo'),
('en_US', 942, 'Aguascalientes'),
('en_US', 943, 'Baja California'),
('en_US', 944, 'Baja California Sur'),
('en_US', 945, 'Campeche'),
('en_US', 946, 'Chiapas'),
('en_US', 947, 'Chihuahua'),
('en_US', 948, 'Ciudad de México'),
('en_US', 949, 'Coahuila'),
('en_US', 950, 'Colima'),
('en_US', 951, 'Durango'),
('en_US', 952, 'Estado de México'),
('en_US', 953, 'Guanajuato'),
('en_US', 954, 'Guerrero'),
('en_US', 955, 'Hidalgo'),
('en_US', 956, 'Jalisco'),
('en_US', 957, 'Michoacán'),
('en_US', 958, 'Morelos'),
('en_US', 959, 'Nayarit'),
('en_US', 960, 'Nuevo León'),
('en_US', 961, 'Oaxaca'),
('en_US', 962, 'Puebla'),
('en_US', 963, 'Querétaro'),
('en_US', 964, 'Quintana Roo'),
('en_US', 965, 'San Luis Potosí'),
('en_US', 966, 'Sinaloa'),
('en_US', 967, 'Sonora'),
('en_US', 968, 'Tabasco'),
('en_US', 969, 'Tamaulipas'),
('en_US', 970, 'Tlaxcala'),
('en_US', 971, 'Veracruz'),
('en_US', 972, 'Yucatán'),
('en_US', 973, 'Zacatecas'),
('en_US', 974, 'Asunción'),
('en_US', 975, 'Alto Paraguay'),
('en_US', 976, 'Alto Paraná'),
('en_US', 977, 'Amambay'),
('en_US', 978, 'Boquerón'),
('en_US', 979, 'Caaguazú'),
('en_US', 980, 'Caazapá'),
('en_US', 981, 'Canindeyú'),
('en_US', 982, 'Central'),
('en_US', 983, 'Concepción'),
('en_US', 984, 'Cordillera'),
('en_US', 985, 'Guairá'),
('en_US', 986, 'Itapúa'),
('en_US', 987, 'Misiones'),
('en_US', 988, 'Ñeembucú'),
('en_US', 989, 'Paraguarí'),
('en_US', 990, 'Presidente Hayes'),
('en_US', 991, 'San Pedro'),
('en_US', 992, 'Municipalidad Metropolitana de Lima'),
('en_US', 993, 'Amazonas'),
('en_US', 994, 'Ancash'),
('en_US', 995, 'Apurímac'),
('en_US', 996, 'Arequipa'),
('en_US', 997, 'Ayacucho'),
('en_US', 998, 'Cajamarca'),
('en_US', 999, 'Cusco'),
('en_US', 1000, 'El Callao'),
('en_US', 1001, 'Huancavelica'),
('en_US', 1002, 'Huánuco'),
('en_US', 1003, 'Ica'),
('en_US', 1004, 'Junín'),
('en_US', 1005, 'La Libertad'),
('en_US', 1006, 'Lambayeque'),
('en_US', 1007, 'Lima'),
('en_US', 1008, 'Loreto'),
('en_US', 1009, 'Madre de Dios'),
('en_US', 1010, 'Moquegua'),
('en_US', 1011, 'Pasco'),
('en_US', 1012, 'Piura'),
('en_US', 1013, 'Puno'),
('en_US', 1014, 'San Martín'),
('en_US', 1015, 'Tacna'),
('en_US', 1016, 'Tumbes'),
('en_US', 1017, 'Ucayali'),
('en_US', 1018, 'dolnośląskie'),
('en_US', 1019, 'kujawsko-pomorskie'),
('en_US', 1020, 'lubelskie'),
('en_US', 1021, 'lubuskie'),
('en_US', 1022, 'łódzkie'),
('en_US', 1023, 'małopolskie'),
('en_US', 1024, 'mazowieckie'),
('en_US', 1025, 'opolskie'),
('en_US', 1026, 'podkarpackie'),
('en_US', 1027, 'podlaskie'),
('en_US', 1028, 'pomorskie'),
('en_US', 1029, 'śląskie'),
('en_US', 1030, 'świętokrzyskie'),
('en_US', 1031, 'warmińsko-mazurskie'),
('en_US', 1032, 'wielkopolskie'),
('en_US', 1033, 'zachodniopomorskie'),
('en_US', 1034, 'Aveiro'),
('en_US', 1035, 'Beja'),
('en_US', 1036, 'Braga'),
('en_US', 1037, 'Bragança'),
('en_US', 1038, 'Castelo Branco'),
('en_US', 1039, 'Coimbra'),
('en_US', 1040, 'Évora'),
('en_US', 1041, 'Faro'),
('en_US', 1042, 'Guarda'),
('en_US', 1043, 'Leiria'),
('en_US', 1044, 'Lisboa'),
('en_US', 1045, 'Portalegre'),
('en_US', 1046, 'Porto'),
('en_US', 1047, 'Santarém'),
('en_US', 1048, 'Setúbal'),
('en_US', 1049, 'Viana do Castelo'),
('en_US', 1050, 'Vila Real'),
('en_US', 1051, 'Viseu'),
('en_US', 1052, 'Região Autónoma dos Açores'),
('en_US', 1053, 'Região Autónoma da Madeira'),
('en_US', 1054, 'Brokopondo'),
('en_US', 1055, 'Commewijne'),
('en_US', 1056, 'Coronie'),
('en_US', 1057, 'Marowijne'),
('en_US', 1058, 'Nickerie'),
('en_US', 1059, 'Para'),
('en_US', 1060, 'Paramaribo'),
('en_US', 1061, 'Saramacca'),
('en_US', 1062, 'Sipaliwini'),
('en_US', 1063, 'Wanica'),
('en_US', 1064, 'Blekinge län'),
('en_US', 1065, 'Dalarnas län'),
('en_US', 1066, 'Gotlands län'),
('en_US', 1067, 'Gävleborgs län'),
('en_US', 1068, 'Hallands län'),
('en_US', 1069, 'Jämtlands län'),
('en_US', 1070, 'Jönköpings län'),
('en_US', 1071, 'Kalmar län'),
('en_US', 1072, 'Kronobergs län'),
('en_US', 1073, 'Norrbottens län'),
('en_US', 1074, 'Skåne län'),
('en_US', 1075, 'Stockholms län'),
('en_US', 1076, 'Södermanlands län'),
('en_US', 1077, 'Uppsala län'),
('en_US', 1078, 'Värmlands län'),
('en_US', 1079, 'Västerbottens län'),
('en_US', 1080, 'Västernorrlands län'),
('en_US', 1081, 'Västmanlands län'),
('en_US', 1082, 'Västra Götalands län'),
('en_US', 1083, 'Örebro län'),
('en_US', 1084, 'Östergötlands län'),
('en_US', 1085, 'Cherkaska oblast'),
('en_US', 1086, 'Chernihivska oblast'),
('en_US', 1087, 'Chernivetska oblast'),
('en_US', 1088, 'Dnipropetrovska oblast'),
('en_US', 1089, 'Donetska oblast'),
('en_US', 1090, 'Ivano-Frankivska oblast'),
('en_US', 1091, 'Kharkivska oblast'),
('en_US', 1092, 'Khersonska oblast'),
('en_US', 1093, 'Khmelnytska oblast'),
('en_US', 1094, 'Kirovohradska oblast'),
('en_US', 1095, 'Kyivska oblast'),
('en_US', 1096, 'Luhanska oblast'),
('en_US', 1097, 'Lvivska oblast'),
('en_US', 1098, 'Mykolaivska oblast'),
('en_US', 1099, 'Odeska oblast'),
('en_US', 1100, 'Poltavska oblast'),
('en_US', 1101, 'Rivnenska oblast'),
('en_US', 1102, 'Sumska oblast'),
('en_US', 1103, 'Ternopilska oblast'),
('en_US', 1104, 'Vinnytska oblast'),
('en_US', 1105, 'Volynska oblast'),
('en_US', 1106, 'Zakarpatska oblast'),
('en_US', 1107, 'Zaporizka oblast'),
('en_US', 1108, 'Zhytomyrska oblast'),
('en_US', 1109, 'Avtonomna Respublika Krym'),
('en_US', 1110, 'Kyiv'),
('en_US', 1111, 'Sevastopol'),
('en_US', 1112, 'Artigas'),
('en_US', 1113, 'Canelones'),
('en_US', 1114, 'Cerro Largo'),
('en_US', 1115, 'Colonia'),
('en_US', 1116, 'Durazno'),
('en_US', 1117, 'Flores'),
('en_US', 1118, 'Florida'),
('en_US', 1119, 'Lavalleja'),
('en_US', 1120, 'Maldonado'),
('en_US', 1121, 'Montevideo'),
('en_US', 1122, 'Paysandu'),
('en_US', 1123, 'Río Negro'),
('en_US', 1124, 'Rivera'),
('en_US', 1125, 'Rocha'),
('en_US', 1126, 'Salto'),
('en_US', 1127, 'San José'),
('en_US', 1128, 'Soriano'),
('en_US', 1129, 'Tacuarembó'),
('en_US', 1130, 'Treinta y Tres'),
('en_US', 1131, 'Dependencias Federales'),
('en_US', 1132, 'Distrito Capital'),
('en_US', 1133, 'Amazonas'),
('en_US', 1134, 'Anzoátegui'),
('en_US', 1135, 'Apure'),
('en_US', 1136, 'Aragua'),
('en_US', 1137, 'Barinas'),
('en_US', 1138, 'Bolívar'),
('en_US', 1139, 'Carabobo'),
('en_US', 1140, 'Cojedes'),
('en_US', 1141, 'Delta Amacuro'),
('en_US', 1142, 'Falcón'),
('en_US', 1143, 'Guárico'),
('en_US', 1144, 'Lara'),
('en_US', 1145, 'Mérida'),
('en_US', 1146, 'Miranda'),
('en_US', 1147, 'Monagas'),
('en_US', 1148, 'Nueva Esparta'),
('en_US', 1149, 'Portuguesa'),
('en_US', 1150, 'Sucre'),
('en_US', 1151, 'Táchira'),
('en_US', 1152, 'Trujillo'),
('en_US', 1153, 'Vargas'),
('en_US', 1154, 'Yaracuy'),
('en_US', 1155, 'Zulia'),
('en_US', 1156, 'Ladakh');

-- --------------------------------------------------------

--
-- Table structure for table `directory_currency_rate`
--

CREATE TABLE `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Currency Rate';

--
-- Dumping data for table `directory_currency_rate`
--

INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES
('EUR', 'EUR', 1.000000000000),
('EUR', 'USD', 1.415000000000),
('USD', 'EUR', 0.706700000000),
('USD', 'USD', 1.000000000000);

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link`
--

CREATE TABLE `downloadable_link` (
  `link_id` int UNSIGNED NOT NULL COMMENT 'Link ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Table';

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_price`
--

CREATE TABLE `downloadable_link_price` (
  `price_id` int UNSIGNED NOT NULL COMMENT 'Price ID',
  `link_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Price Table';

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased`
--

CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int UNSIGNED NOT NULL COMMENT 'Purchased ID',
  `order_id` int UNSIGNED DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of modification',
  `customer_id` int UNSIGNED DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Purchased Table';

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased_item`
--

CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int UNSIGNED NOT NULL COMMENT 'Item ID',
  `purchased_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int UNSIGNED DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int UNSIGNED DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Purchased Item Table';

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_title`
--

CREATE TABLE `downloadable_link_title` (
  `title_id` int UNSIGNED NOT NULL COMMENT 'Title ID',
  `link_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Link Title Table';

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample`
--

CREATE TABLE `downloadable_sample` (
  `sample_id` int UNSIGNED NOT NULL COMMENT 'Sample ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Sample Table';

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample_title`
--

CREATE TABLE `downloadable_sample_title` (
  `title_id` int UNSIGNED NOT NULL COMMENT 'Title ID',
  `sample_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Sample Title Table';

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute`
--

CREATE TABLE `eav_attribute` (
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `entity_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_code` varchar(255) NOT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute';

--
-- Dumping data for table `eav_attribute`
--

INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES
(1, 1, 'website_id', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website', 'static', NULL, NULL, 'select', 'Associate to Website', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website', 1, 0, NULL, 0, NULL),
(2, 1, 'store_id', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store', 'static', NULL, NULL, 'select', 'Create In', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store', 1, 0, NULL, 0, NULL),
(3, 1, 'created_in', NULL, NULL, 'static', NULL, NULL, 'text', 'Created From', NULL, NULL, 0, 0, NULL, 0, NULL),
(4, 1, 'prefix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(5, 1, 'firstname', NULL, NULL, 'static', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(6, 1, 'middlename', NULL, NULL, 'static', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(7, 1, 'lastname', NULL, NULL, 'static', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(8, 1, 'suffix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(9, 1, 'email', NULL, NULL, 'static', NULL, NULL, 'text', 'Email', NULL, NULL, 1, 0, NULL, 0, NULL),
(10, 1, 'group_id', NULL, NULL, 'static', NULL, NULL, 'select', 'Group', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group', 1, 0, NULL, 0, NULL),
(11, 1, 'dob', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'static', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime', 'date', 'Date of Birth', NULL, NULL, 0, 0, NULL, 0, NULL),
(12, 1, 'password_hash', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password', 'static', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(13, 1, 'rp_token', NULL, NULL, 'static', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(14, 1, 'rp_token_created_at', NULL, NULL, 'static', NULL, NULL, 'date', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(15, 1, 'default_billing', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing', 'static', NULL, NULL, 'text', 'Default Billing Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(16, 1, 'default_shipping', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping', 'static', NULL, NULL, 'text', 'Default Shipping Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(17, 1, 'taxvat', NULL, NULL, 'static', NULL, NULL, 'text', 'Tax/VAT Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(18, 1, 'confirmation', NULL, NULL, 'static', NULL, NULL, 'text', 'Is Confirmed', NULL, NULL, 0, 0, NULL, 0, NULL),
(19, 1, 'created_at', NULL, NULL, 'static', NULL, NULL, 'date', 'Created At', NULL, NULL, 0, 0, NULL, 0, NULL),
(20, 1, 'gender', NULL, NULL, 'static', NULL, NULL, 'select', 'Gender', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table', 0, 0, NULL, 0, NULL),
(21, 1, 'disable_auto_group_change', 'Magento\\Customer\\Model\\Attribute', 'Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean', 'static', NULL, NULL, 'boolean', 'Disable Automatic Group Change Based on VAT ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(22, 2, 'prefix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(23, 2, 'firstname', NULL, NULL, 'static', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(24, 2, 'middlename', NULL, NULL, 'static', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(25, 2, 'lastname', NULL, NULL, 'static', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(26, 2, 'suffix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(27, 2, 'company', NULL, NULL, 'static', NULL, NULL, 'text', 'Company', NULL, NULL, 0, 0, NULL, 0, NULL),
(28, 2, 'street', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend', 'static', NULL, NULL, 'multiline', 'Street Address', NULL, NULL, 1, 0, NULL, 0, NULL),
(29, 2, 'city', NULL, NULL, 'static', NULL, NULL, 'text', 'City', NULL, NULL, 1, 0, NULL, 0, NULL),
(30, 2, 'country_id', NULL, NULL, 'static', NULL, NULL, 'select', 'Country', NULL, 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Country', 1, 0, NULL, 0, NULL),
(31, 2, 'region', NULL, 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Backend\\Region', 'static', NULL, NULL, 'text', 'State/Province', NULL, NULL, 0, 0, NULL, 0, NULL),
(32, 2, 'region_id', NULL, NULL, 'static', NULL, NULL, 'hidden', 'State/Province', NULL, 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Region', 0, 0, NULL, 0, NULL),
(33, 2, 'postcode', NULL, NULL, 'static', NULL, NULL, 'text', 'Zip/Postal Code', NULL, NULL, 0, 0, NULL, 0, NULL),
(34, 2, 'telephone', NULL, NULL, 'static', NULL, NULL, 'text', 'Phone Number', NULL, NULL, 1, 0, NULL, 0, NULL),
(35, 2, 'fax', NULL, NULL, 'static', NULL, NULL, 'text', 'Fax', NULL, NULL, 0, 0, NULL, 0, NULL),
(36, 2, 'vat_id', 'Magento\\Customer\\Model\\Attribute', NULL, 'static', NULL, NULL, 'text', 'VAT Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(37, 2, 'vat_is_valid', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validity', NULL, NULL, 0, 0, NULL, 0, NULL),
(38, 2, 'vat_request_id', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validation request ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(39, 2, 'vat_request_date', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validation request date', NULL, NULL, 0, 0, NULL, 0, NULL),
(40, 2, 'vat_request_success', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validation request success', NULL, NULL, 0, 0, NULL, 0, NULL),
(41, 1, 'updated_at', NULL, NULL, 'static', NULL, NULL, 'date', 'Updated At', NULL, NULL, 0, 0, NULL, 0, NULL),
(42, 1, 'failures_num', NULL, NULL, 'static', NULL, NULL, 'hidden', 'Failures Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(43, 1, 'first_failure', NULL, NULL, 'static', NULL, NULL, 'date', 'First Failure Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(44, 1, 'lock_expires', NULL, NULL, 'static', NULL, NULL, 'date', 'Failures Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(45, 3, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(46, 3, 'is_active', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Active', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 1, 0, NULL, 0, NULL),
(47, 3, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(48, 3, 'image', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image', 'varchar', NULL, NULL, 'image', 'Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(49, 3, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Page Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(50, 3, 'meta_keywords', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(51, 3, 'meta_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(52, 3, 'display_mode', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Mode', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode', 0, 0, NULL, 0, NULL),
(53, 3, 'landing_page', NULL, NULL, 'int', NULL, NULL, 'select', 'CMS Block', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page', 0, 0, NULL, 0, NULL),
(54, 3, 'is_anchor', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Anchor', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, '1', 0, NULL),
(55, 3, 'path', NULL, NULL, 'static', NULL, NULL, 'text', 'Path', NULL, NULL, 0, 0, NULL, 0, NULL),
(56, 3, 'position', NULL, NULL, 'static', NULL, NULL, 'text', 'Position', NULL, NULL, 0, 0, NULL, 0, NULL),
(57, 3, 'all_children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(58, 3, 'path_in_store', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(59, 3, 'children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(60, 3, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Custom Design', NULL, 'Magento\\Theme\\Model\\Theme\\Source\\Theme', 0, 0, NULL, 0, NULL),
(61, 3, 'custom_design_from', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime', 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(62, 3, 'custom_design_to', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(63, 3, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Page Layout', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout', 0, 0, NULL, 0, NULL),
(64, 3, 'custom_layout_update', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Custom Layout Update', NULL, NULL, 0, 0, NULL, 0, NULL),
(65, 3, 'level', NULL, NULL, 'static', NULL, NULL, 'text', 'Level', NULL, NULL, 0, 0, NULL, 0, NULL),
(66, 3, 'children_count', NULL, NULL, 'static', NULL, NULL, 'text', 'Children Count', NULL, NULL, 0, 0, NULL, 0, NULL),
(67, 3, 'available_sort_by', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby', 'text', NULL, NULL, 'multiselect', 'Available Product Listing Sort By', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby', 1, 0, NULL, 0, NULL),
(68, 3, 'default_sort_by', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby', 'varchar', NULL, NULL, 'select', 'Default Product Listing Sort By', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby', 1, 0, NULL, 0, NULL),
(69, 3, 'include_in_menu', NULL, NULL, 'int', NULL, NULL, 'select', 'Include in Navigation Menu', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 1, 0, '1', 0, NULL),
(70, 3, 'custom_use_parent_settings', NULL, NULL, 'int', NULL, NULL, 'select', 'Use Parent Category Settings', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(71, 3, 'custom_apply_to_products', NULL, NULL, 'int', NULL, NULL, 'select', 'Apply To Products', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(72, 3, 'filter_price_range', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Layered Navigation Price Step', NULL, NULL, 0, 0, NULL, 0, NULL),
(73, 4, 'name', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', NULL, 'varchar', NULL, NULL, 'text', 'Product Name', 'validate-length maximum-length-255', NULL, 1, 0, NULL, 0, NULL),
(74, 4, 'sku', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku', 'static', NULL, NULL, 'text', 'SKU', 'validate-length maximum-length-64', NULL, 1, 0, NULL, 1, NULL),
(75, 4, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(76, 4, 'short_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Short Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(77, 4, 'price', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Price', NULL, NULL, 1, 0, NULL, 0, NULL),
(78, 4, 'special_price', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Special Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(79, 4, 'special_from_date', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Special Price From Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(80, 4, 'special_to_date', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Special Price To Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(81, 4, 'cost', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Cost', NULL, NULL, 0, 1, NULL, 0, NULL),
(82, 4, 'weight', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight', 'decimal', NULL, NULL, 'weight', 'Weight', NULL, NULL, 0, 0, NULL, 0, NULL),
(83, 4, 'manufacturer', NULL, NULL, 'int', NULL, NULL, 'select', 'Manufacturer', NULL, NULL, 0, 1, NULL, 0, NULL),
(84, 4, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Meta Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(85, 4, 'meta_keyword', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(86, 4, 'meta_description', NULL, NULL, 'varchar', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, 'Maximum 255 chars. Meta Description should optimally be between 150-160 characters'),
(87, 4, 'image', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Base', NULL, NULL, 0, 0, NULL, 0, NULL),
(88, 4, 'small_image', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Small', NULL, NULL, 0, 0, NULL, 0, NULL),
(89, 4, 'thumbnail', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Thumbnail', NULL, NULL, 0, 0, NULL, 0, NULL),
(90, 4, 'media_gallery', NULL, NULL, 'static', NULL, NULL, 'gallery', 'Media Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(91, 4, 'old_id', NULL, NULL, 'int', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(92, 4, 'tier_price', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice', 'decimal', NULL, NULL, 'text', 'Tier Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(93, 4, 'color', NULL, NULL, 'int', NULL, NULL, 'select', 'Color', NULL, NULL, 0, 1, NULL, 0, NULL),
(94, 4, 'news_from_date', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Set Product as New from Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(95, 4, 'news_to_date', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Set Product as New to Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(96, 4, 'gallery', NULL, NULL, 'varchar', NULL, NULL, 'gallery', 'Image Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(97, 4, 'status', NULL, NULL, 'int', NULL, NULL, 'select', 'Enable Product', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status', 0, 0, '1', 0, NULL),
(98, 4, 'minimal_price', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Minimal Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(99, 4, 'visibility', NULL, NULL, 'int', NULL, NULL, 'select', 'Visibility', NULL, 'Magento\\Catalog\\Model\\Product\\Visibility', 0, 0, '4', 0, NULL),
(100, 4, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'New Theme', NULL, 'Magento\\Theme\\Model\\Theme\\Source\\Theme', 0, 0, NULL, 0, NULL),
(101, 4, 'custom_design_from', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(102, 4, 'custom_design_to', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(103, 4, 'custom_layout_update', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Layout Update XML', NULL, NULL, 0, 0, NULL, 0, NULL),
(104, 4, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Layout', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout', 0, 0, NULL, 0, NULL),
(105, 4, 'category_ids', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category', 'static', NULL, NULL, 'text', 'Categories', NULL, NULL, 0, 0, NULL, 0, NULL),
(106, 4, 'options_container', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Product Options In', NULL, 'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container', 0, 0, 'container2', 0, NULL),
(107, 4, 'required_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(108, 4, 'has_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(109, 4, 'image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(110, 4, 'small_image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Small Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(111, 4, 'thumbnail_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Thumbnail Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(112, 4, 'created_at', NULL, NULL, 'static', NULL, NULL, 'date', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(113, 4, 'updated_at', NULL, NULL, 'static', NULL, NULL, 'date', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(114, 4, 'country_of_manufacture', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Country of Manufacture', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture', 0, 0, NULL, 0, NULL),
(115, 4, 'quantity_and_stock_status', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock', 'int', NULL, NULL, 'select', 'Quantity', NULL, 'Magento\\CatalogInventory\\Model\\Source\\Stock', 0, 0, '1', 0, NULL),
(116, 4, 'custom_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'New Layout', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout', 0, 0, NULL, 0, NULL),
(117, 4, 'custom_layout_update_file', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\LayoutUpdate', 'varchar', NULL, NULL, 'select', 'Custom Layout Update', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\LayoutUpdate', 0, 0, NULL, 0, NULL),
(118, 3, 'custom_layout_update_file', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\LayoutUpdate', 'varchar', NULL, NULL, 'select', 'Custom Layout Update', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\LayoutUpdate', 0, 0, NULL, 0, NULL),
(119, 3, 'url_key', NULL, NULL, 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL),
(120, 3, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(121, 4, 'url_key', NULL, NULL, 'varchar', NULL, NULL, 'text', 'URL Key', 'validate-trailing-hyphen', NULL, 0, 0, NULL, 0, NULL),
(122, 4, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(123, 4, 'msrp', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Minimum Advertised Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(124, 4, 'msrp_display_actual_price_type', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean', 'varchar', NULL, NULL, 'select', 'Display Actual Price', NULL, 'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price', 0, 0, '0', 0, NULL),
(125, 4, 'links_purchased_separately', NULL, NULL, 'int', NULL, NULL, NULL, 'Links can be purchased separately', NULL, NULL, 1, 0, NULL, 0, NULL),
(126, 4, 'samples_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Samples title', NULL, NULL, 1, 0, NULL, 0, NULL),
(127, 4, 'links_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Links title', NULL, NULL, 1, 0, NULL, 0, NULL),
(128, 4, 'links_exist', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(129, 4, 'price_type', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Dynamic Price', NULL, NULL, 1, 0, '0', 0, NULL),
(130, 4, 'sku_type', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Dynamic SKU', NULL, NULL, 1, 0, '0', 0, NULL),
(131, 4, 'weight_type', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Dynamic Weight', NULL, NULL, 1, 0, '0', 0, NULL),
(132, 4, 'price_view', NULL, NULL, 'int', NULL, NULL, 'select', 'Price View', NULL, 'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View', 1, 0, NULL, 0, NULL),
(133, 4, 'shipment_type', NULL, NULL, 'int', NULL, NULL, 'select', 'Ship Bundle Items', NULL, 'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Shipment\\Type', 1, 0, '0', 0, NULL),
(134, 4, 'gift_message_available', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean', 'varchar', NULL, NULL, 'select', 'Allow Gift Message', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(135, 4, 'swatch_image', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Swatch', NULL, NULL, 0, 0, NULL, 0, NULL),
(136, 4, 'tax_class_id', NULL, NULL, 'int', NULL, NULL, 'select', 'Tax Class', NULL, 'Magento\\Tax\\Model\\TaxClass\\Source\\Product', 0, 0, '2', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_group`
--

CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute Group ID',
  `attribute_set_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Default ID',
  `attribute_group_code` varchar(255) NOT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Group';

--
-- Dumping data for table `eav_attribute_group`
--

INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`, `attribute_group_code`, `tab_group_code`) VALUES
(1, 1, 'General', 1, 1, 'general', NULL),
(2, 2, 'General', 1, 1, 'general', NULL),
(3, 3, 'General', 10, 1, 'general', NULL),
(4, 3, 'General Information', 2, 0, 'general-information', NULL),
(5, 3, 'Display Settings', 20, 0, 'display-settings', NULL),
(6, 3, 'Custom Design', 30, 0, 'custom-design', NULL),
(7, 4, 'Product Details', 10, 1, 'product-details', 'basic'),
(8, 4, 'Advanced Pricing', 40, 0, 'advanced-pricing', 'advanced'),
(9, 4, 'Search Engine Optimization', 30, 0, 'search-engine-optimization', 'basic'),
(10, 4, 'Images', 20, 0, 'image-management', 'basic'),
(11, 4, 'Design', 50, 0, 'design', 'advanced'),
(12, 4, 'Autosettings', 60, 0, 'autosettings', 'advanced'),
(13, 4, 'Content', 15, 0, 'content', 'basic'),
(14, 4, 'Schedule Design Update', 55, 0, 'schedule-design-update', 'advanced'),
(15, 5, 'General', 1, 1, 'general', NULL),
(16, 6, 'General', 1, 1, 'general', NULL),
(17, 7, 'General', 1, 1, 'general', NULL),
(18, 8, 'General', 1, 1, 'general', NULL),
(19, 4, 'Bundle Items', 16, 0, 'bundle-items', NULL),
(20, 4, 'Gift Options', 61, 0, 'gift-options', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_label`
--

CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int UNSIGNED NOT NULL COMMENT 'Attribute Label ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Label';

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option`
--

CREATE TABLE `eav_attribute_option` (
  `option_id` int UNSIGNED NOT NULL COMMENT 'Option ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `sort_order` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Option';

--
-- Dumping data for table `eav_attribute_option`
--

INSERT INTO `eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES
(1, 20, 0),
(2, 20, 1),
(3, 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option_swatch`
--

CREATE TABLE `eav_attribute_option_swatch` (
  `swatch_id` int UNSIGNED NOT NULL COMMENT 'Swatch ID',
  `option_id` int UNSIGNED NOT NULL COMMENT 'Option ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `type` smallint UNSIGNED NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Magento Swatches table';

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option_value`
--

CREATE TABLE `eav_attribute_option_value` (
  `value_id` int UNSIGNED NOT NULL COMMENT 'Value ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Option Value';

--
-- Dumping data for table `eav_attribute_option_value`
--

INSERT INTO `eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES
(1, 1, 0, 'Male'),
(2, 2, 0, 'Female'),
(3, 3, 0, 'Not Specified');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_set`
--

CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute Set ID',
  `entity_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Set';

--
-- Dumping data for table `eav_attribute_set`
--

INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES
(1, 1, 'Default', 2),
(2, 2, 'Default', 2),
(3, 3, 'Default', 1),
(4, 4, 'Default', 1),
(5, 5, 'Default', 1),
(6, 6, 'Default', 1),
(7, 7, 'Default', 1),
(8, 8, 'Default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity`
--

CREATE TABLE `eav_entity` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `entity_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity';

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_attribute`
--

CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int UNSIGNED NOT NULL COMMENT 'Entity Attribute ID',
  `entity_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `attribute_group_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Group ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Attributes';

--
-- Dumping data for table `eav_entity_attribute`
--

INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 10),
(2, 1, 1, 1, 2, 20),
(3, 1, 1, 1, 3, 20),
(4, 1, 1, 1, 4, 30),
(5, 1, 1, 1, 5, 40),
(6, 1, 1, 1, 6, 50),
(7, 1, 1, 1, 7, 60),
(8, 1, 1, 1, 8, 70),
(9, 1, 1, 1, 9, 80),
(10, 1, 1, 1, 10, 25),
(11, 1, 1, 1, 11, 90),
(12, 1, 1, 1, 12, 81),
(13, 1, 1, 1, 13, 115),
(14, 1, 1, 1, 14, 120),
(15, 1, 1, 1, 15, 82),
(16, 1, 1, 1, 16, 83),
(17, 1, 1, 1, 17, 100),
(18, 1, 1, 1, 18, 0),
(19, 1, 1, 1, 19, 0),
(20, 1, 1, 1, 20, 110),
(21, 1, 1, 1, 21, 28),
(22, 2, 2, 2, 22, 10),
(23, 2, 2, 2, 23, 20),
(24, 2, 2, 2, 24, 30),
(25, 2, 2, 2, 25, 40),
(26, 2, 2, 2, 26, 50),
(27, 2, 2, 2, 27, 60),
(28, 2, 2, 2, 28, 70),
(29, 2, 2, 2, 29, 100),
(30, 2, 2, 2, 30, 80),
(31, 2, 2, 2, 31, 90),
(32, 2, 2, 2, 32, 90),
(33, 2, 2, 2, 33, 110),
(34, 2, 2, 2, 34, 120),
(35, 2, 2, 2, 35, 130),
(36, 2, 2, 2, 36, 140),
(37, 2, 2, 2, 37, 132),
(38, 2, 2, 2, 38, 133),
(39, 2, 2, 2, 39, 134),
(40, 2, 2, 2, 40, 135),
(41, 1, 1, 1, 41, 87),
(42, 1, 1, 1, 42, 100),
(43, 1, 1, 1, 43, 110),
(44, 1, 1, 1, 44, 120),
(45, 3, 3, 4, 45, 1),
(46, 3, 3, 4, 46, 2),
(47, 3, 3, 4, 47, 4),
(48, 3, 3, 4, 48, 5),
(49, 3, 3, 4, 49, 6),
(50, 3, 3, 4, 50, 7),
(51, 3, 3, 4, 51, 8),
(52, 3, 3, 5, 52, 10),
(53, 3, 3, 5, 53, 20),
(54, 3, 3, 5, 54, 30),
(55, 3, 3, 4, 55, 12),
(56, 3, 3, 4, 56, 13),
(57, 3, 3, 4, 57, 14),
(58, 3, 3, 4, 58, 15),
(59, 3, 3, 4, 59, 16),
(60, 3, 3, 6, 60, 10),
(61, 3, 3, 6, 61, 30),
(62, 3, 3, 6, 62, 40),
(63, 3, 3, 6, 63, 50),
(64, 3, 3, 6, 64, 60),
(65, 3, 3, 4, 65, 24),
(66, 3, 3, 4, 66, 25),
(67, 3, 3, 5, 67, 40),
(68, 3, 3, 5, 68, 50),
(69, 3, 3, 4, 69, 10),
(70, 3, 3, 6, 70, 5),
(71, 3, 3, 6, 71, 6),
(72, 3, 3, 5, 72, 51),
(73, 4, 4, 7, 73, 10),
(74, 4, 4, 7, 74, 20),
(75, 4, 4, 13, 75, 110),
(76, 4, 4, 13, 76, 100),
(77, 4, 4, 7, 77, 30),
(78, 4, 4, 8, 78, 3),
(79, 4, 4, 8, 79, 4),
(80, 4, 4, 8, 80, 5),
(81, 4, 4, 8, 81, 6),
(82, 4, 4, 7, 82, 70),
(83, 4, 4, 9, 84, 20),
(84, 4, 4, 9, 85, 30),
(85, 4, 4, 9, 86, 40),
(86, 4, 4, 10, 87, 1),
(87, 4, 4, 10, 88, 2),
(88, 4, 4, 10, 89, 3),
(89, 4, 4, 10, 90, 4),
(90, 4, 4, 7, 91, 6),
(91, 4, 4, 8, 92, 7),
(92, 4, 4, 7, 94, 90),
(93, 4, 4, 7, 95, 100),
(94, 4, 4, 10, 96, 5),
(95, 4, 4, 7, 97, 5),
(96, 4, 4, 8, 98, 8),
(97, 4, 4, 7, 99, 80),
(98, 4, 4, 14, 100, 40),
(99, 4, 4, 14, 101, 20),
(100, 4, 4, 14, 102, 30),
(101, 4, 4, 11, 103, 10),
(102, 4, 4, 11, 104, 5),
(103, 4, 4, 7, 105, 80),
(104, 4, 4, 11, 106, 6),
(105, 4, 4, 7, 107, 14),
(106, 4, 4, 7, 108, 15),
(107, 4, 4, 7, 109, 16),
(108, 4, 4, 7, 110, 17),
(109, 4, 4, 7, 111, 18),
(110, 4, 4, 7, 112, 19),
(111, 4, 4, 7, 113, 20),
(112, 4, 4, 7, 114, 110),
(113, 4, 4, 7, 115, 60),
(114, 4, 4, 14, 116, 50),
(115, 4, 4, 11, 117, 51),
(116, 3, 3, 6, 118, 51),
(117, 3, 3, 4, 119, 3),
(118, 3, 3, 4, 120, 17),
(119, 4, 4, 9, 121, 10),
(120, 4, 4, 7, 122, 11),
(121, 4, 4, 8, 123, 9),
(122, 4, 4, 8, 124, 10),
(123, 4, 4, 7, 125, 111),
(124, 4, 4, 7, 126, 112),
(125, 4, 4, 7, 127, 113),
(126, 4, 4, 7, 128, 114),
(127, 4, 4, 7, 129, 31),
(128, 4, 4, 7, 130, 21),
(129, 4, 4, 7, 131, 71),
(130, 4, 4, 8, 132, 11),
(131, 4, 4, 19, 133, 1),
(132, 4, 4, 20, 134, 10),
(133, 4, 4, 10, 135, 3),
(134, 4, 4, 7, 136, 40);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_datetime`
--

CREATE TABLE `eav_entity_datetime` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_decimal`
--

CREATE TABLE `eav_entity_decimal` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_int`
--

CREATE TABLE `eav_entity_int` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_store`
--

CREATE TABLE `eav_entity_store` (
  `entity_store_id` int UNSIGNED NOT NULL COMMENT 'Entity Store ID',
  `entity_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Store';

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_text`
--

CREATE TABLE `eav_entity_text` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_type`
--

CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint UNSIGNED NOT NULL COMMENT 'Entity Type ID',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity ID Field',
  `is_data_sharing` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set ID',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint UNSIGNED NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Type';

--
-- Dumping data for table `eav_entity_type`
--

INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES
(1, 'customer', 'Magento\\Customer\\Model\\ResourceModel\\Customer', 'Magento\\Customer\\Model\\Attribute', 'customer_entity', NULL, NULL, 1, 'default', 1, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 0, 8, '0', 'customer_eav_attribute', 'Magento\\Customer\\Model\\ResourceModel\\Attribute\\Collection'),
(2, 'customer_address', 'Magento\\Customer\\Model\\ResourceModel\\Address', 'Magento\\Customer\\Model\\Attribute', 'customer_address_entity', NULL, NULL, 1, 'default', 2, NULL, 0, 8, '0', 'customer_eav_attribute', 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Collection'),
(3, 'catalog_category', 'Magento\\Catalog\\Model\\ResourceModel\\Category', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'catalog_category_entity', NULL, NULL, 1, 'default', 3, NULL, 0, 8, '0', 'catalog_eav_attribute', 'Magento\\Catalog\\Model\\ResourceModel\\Category\\Attribute\\Collection'),
(4, 'catalog_product', 'Magento\\Catalog\\Model\\ResourceModel\\Product', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'catalog_product_entity', NULL, NULL, 1, 'default', 4, NULL, 0, 8, '0', 'catalog_eav_attribute', 'Magento\\Catalog\\Model\\ResourceModel\\Product\\Attribute\\Collection'),
(5, 'order', 'Magento\\Sales\\Model\\ResourceModel\\Order', NULL, 'sales_order', NULL, NULL, 1, 'default', 5, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL),
(6, 'invoice', 'Magento\\Sales\\Model\\ResourceModel\\Order\\Invoice', NULL, 'sales_invoice', NULL, NULL, 1, 'default', 6, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL),
(7, 'creditmemo', 'Magento\\Sales\\Model\\ResourceModel\\Order\\Creditmemo', NULL, 'sales_creditmemo', NULL, NULL, 1, 'default', 7, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL),
(8, 'shipment', 'Magento\\Sales\\Model\\ResourceModel\\Order\\Shipment', NULL, 'sales_shipment', NULL, NULL, 1, 'default', 8, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_varchar`
--

CREATE TABLE `eav_entity_varchar` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_element`
--

CREATE TABLE `eav_form_element` (
  `element_id` int UNSIGNED NOT NULL COMMENT 'Element ID',
  `type_id` smallint UNSIGNED NOT NULL COMMENT 'Type ID',
  `fieldset_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Fieldset ID',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Element';

--
-- Dumping data for table `eav_form_element`
--

INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, NULL, 23, 0),
(2, 1, NULL, 25, 1),
(3, 1, NULL, 27, 2),
(4, 1, NULL, 9, 3),
(5, 1, NULL, 28, 4),
(6, 1, NULL, 29, 5),
(7, 1, NULL, 31, 6),
(8, 1, NULL, 33, 7),
(9, 1, NULL, 30, 8),
(10, 1, NULL, 34, 9),
(11, 1, NULL, 35, 10),
(12, 2, NULL, 23, 0),
(13, 2, NULL, 25, 1),
(14, 2, NULL, 27, 2),
(15, 2, NULL, 9, 3),
(16, 2, NULL, 28, 4),
(17, 2, NULL, 29, 5),
(18, 2, NULL, 31, 6),
(19, 2, NULL, 33, 7),
(20, 2, NULL, 30, 8),
(21, 2, NULL, 34, 9),
(22, 2, NULL, 35, 10),
(23, 3, NULL, 23, 0),
(24, 3, NULL, 25, 1),
(25, 3, NULL, 27, 2),
(26, 3, NULL, 28, 3),
(27, 3, NULL, 29, 4),
(28, 3, NULL, 31, 5),
(29, 3, NULL, 33, 6),
(30, 3, NULL, 30, 7),
(31, 3, NULL, 34, 8),
(32, 3, NULL, 35, 9),
(33, 4, NULL, 23, 0),
(34, 4, NULL, 25, 1),
(35, 4, NULL, 27, 2),
(36, 4, NULL, 28, 3),
(37, 4, NULL, 29, 4),
(38, 4, NULL, 31, 5),
(39, 4, NULL, 33, 6),
(40, 4, NULL, 30, 7),
(41, 4, NULL, 34, 8),
(42, 4, NULL, 35, 9);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset`
--

CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint UNSIGNED NOT NULL COMMENT 'Fieldset ID',
  `type_id` smallint UNSIGNED NOT NULL COMMENT 'Type ID',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Fieldset';

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset_label`
--

CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint UNSIGNED NOT NULL COMMENT 'Fieldset ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `label` varchar(255) NOT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Fieldset Label';

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type`
--

CREATE TABLE `eav_form_type` (
  `type_id` smallint UNSIGNED NOT NULL COMMENT 'Type ID',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Type';

--
-- Dumping data for table `eav_form_type`
--

INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES
(1, 'checkout_onepage_register', 'checkout_onepage_register', 1, '', 0),
(2, 'checkout_onepage_register_guest', 'checkout_onepage_register_guest', 1, '', 0),
(3, 'checkout_onepage_billing_address', 'checkout_onepage_billing_address', 1, '', 0),
(4, 'checkout_onepage_shipping_address', 'checkout_onepage_shipping_address', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type_entity`
--

CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint UNSIGNED NOT NULL COMMENT 'Type ID',
  `entity_type_id` smallint UNSIGNED NOT NULL COMMENT 'Entity Type ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Type Entity';

--
-- Dumping data for table `eav_form_type_entity`
--

INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE `email_template` (
  `template_id` int UNSIGNED NOT NULL COMMENT 'Template ID',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int UNSIGNED DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of Template Creation',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  `is_legacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Should the template render in legacy mode'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Email Templates';

-- --------------------------------------------------------

--
-- Table structure for table `flag`
--

CREATE TABLE `flag` (
  `flag_id` int UNSIGNED NOT NULL COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` mediumtext COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Flag';

--
-- Dumping data for table `flag`
--

INSERT INTO `flag` (`flag_id`, `flag_code`, `state`, `flag_data`, `last_update`) VALUES
(1, 'analytics_link_attempts_reverse_counter', 0, '24', '2024-09-09 13:55:50'),
(2, 'config_hash', 0, '{\"system\":\"2be88ca4242c76e8253ac62474851065032d6833\"}', '2024-09-09 13:56:42'),
(3, 'feed_metadata_salesOrders', 0, '{\"lockedBy\":\"full reindex(legacy)(11693)\"}', '2024-09-28 14:25:22'),
(4, 'feed_metadata_salesOrderStatuses', 0, '{\"lockedBy\":\"full reindex(legacy)(11693)\"}', '2024-09-28 14:25:22'),
(5, 'feed_metadata_stores', 0, '{\"lockedBy\":\"full reindex(legacy)(11693)\"}', '2024-09-28 14:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `gift_message`
--

CREATE TABLE `gift_message` (
  `gift_message_id` int UNSIGNED NOT NULL COMMENT 'GiftMessage ID',
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Registrant',
  `message` text COMMENT 'Message'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Gift Message';

-- --------------------------------------------------------

--
-- Table structure for table `googleoptimizer_code`
--

CREATE TABLE `googleoptimizer_code` (
  `code_id` int UNSIGNED NOT NULL COMMENT 'Google experiment code ID',
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Optimized entity ID product ID or catalog ID',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `experiment_script` text COMMENT 'Google experiment script'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Google Experiment code';

-- --------------------------------------------------------

--
-- Table structure for table `importexport_importdata`
--

CREATE TABLE `importexport_importdata` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  `is_processed` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is Row Processed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Import Data Table';

-- --------------------------------------------------------

--
-- Table structure for table `import_history`
--

CREATE TABLE `import_history` (
  `history_id` int UNSIGNED NOT NULL COMMENT 'History record ID',
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Started at',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User ID',
  `imported_file` varchar(255) DEFAULT NULL COMMENT 'Imported file',
  `execution_time` varchar(255) DEFAULT NULL COMMENT 'Execution time',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Summary',
  `error_file` varchar(255) NOT NULL COMMENT 'Imported file with errors'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Import history table';

-- --------------------------------------------------------

--
-- Table structure for table `indexer_state`
--

CREATE TABLE `indexer_state` (
  `state_id` int UNSIGNED NOT NULL COMMENT 'Indexer State ID',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer ID',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  `hash_config` varchar(32) NOT NULL COMMENT 'Hash of indexer config'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Indexer State';

--
-- Dumping data for table `indexer_state`
--

INSERT INTO `indexer_state` (`state_id`, `indexer_id`, `status`, `updated`, `hash_config`) VALUES
(1, 'design_config_grid', 'valid', '2024-09-28 14:32:48', 'ca79bbb3549f851100c0595e7b36abe4'),
(2, 'customer_grid', 'valid', '2024-09-28 14:25:17', '5864364b81874fedc8558be2d98c2658'),
(3, 'catalog_category_product', 'valid', '2024-09-28 14:25:17', '0eef609ec5168a26a9d03b5a4b000091'),
(4, 'catalog_product_category', 'valid', '2024-09-28 14:25:17', 'ad90e02edbec8f561e10fbf69291fb80'),
(5, 'catalogrule_rule', 'valid', '2024-09-28 14:25:18', 'fc6688c94e10853390b1b4362979a72b'),
(6, 'catalog_product_attribute', 'valid', '2024-09-28 14:25:18', '8be6ea0d8da5f4e01af7d979411ecd19'),
(7, 'cataloginventory_stock', 'valid', '2024-09-28 14:25:18', '269639a8c4edeae265df33649001389a'),
(8, 'inventory', 'valid', '2024-09-28 14:25:18', '2f6f12f5f8605fdee7c0dd344a1d5d39'),
(9, 'catalogrule_product', 'valid', '2024-09-28 14:25:18', '94dafb9ff4109a8d0219b9c95516128f'),
(10, 'catalog_product_price', 'valid', '2024-09-28 14:25:18', '07920ba559bdf9f23b9d519861782841'),
(11, 'catalogsearch_fulltext', 'valid', '2024-09-28 14:25:22', 'e0dc622036c62e1cc2ea53035f690869'),
(12, 'sales_order_data_exporter', 'valid', '2024-09-28 14:25:22', '1a4b7f0e8eceee355406165a0a45ea38'),
(13, 'sales_order_status_data_exporter', 'valid', '2024-09-28 14:25:22', '645a6146469a487e090a20b3f6e74e9e'),
(14, 'store_data_exporter', 'valid', '2024-09-28 14:25:22', '8f603762d89ced42bbc61933c2418c15');

-- --------------------------------------------------------

--
-- Table structure for table `integration`
--

CREATE TABLE `integration` (
  `integration_id` int UNSIGNED NOT NULL COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint UNSIGNED NOT NULL COMMENT 'Integration status',
  `consumer_id` int UNSIGNED DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `setup_type` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='integration';

-- --------------------------------------------------------

--
-- Table structure for table `inventory_geoname`
--

CREATE TABLE `inventory_geoname` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'entity id',
  `country_code` varchar(64) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `city` varchar(180) NOT NULL,
  `region` varchar(100) NOT NULL,
  `province` varchar(64) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_low_stock_notification_configuration`
--

CREATE TABLE `inventory_low_stock_notification_configuration` (
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_order_notification`
--

CREATE TABLE `inventory_order_notification` (
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order ID',
  `notification_sent` smallint NOT NULL COMMENT 'Has Notification Been Sent For Order',
  `send_notification` smallint NOT NULL COMMENT 'Should Notification Be Send For Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_pickup_location_order`
--

CREATE TABLE `inventory_pickup_location_order` (
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order ID',
  `pickup_location_code` varchar(255) NOT NULL COMMENT 'Pickup Location Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_pickup_location_quote_address`
--

CREATE TABLE `inventory_pickup_location_quote_address` (
  `address_id` int UNSIGNED NOT NULL COMMENT 'Quote Address ID',
  `pickup_location_code` varchar(255) NOT NULL COMMENT 'Pickup Location Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_reservation`
--

CREATE TABLE `inventory_reservation` (
  `reservation_id` int UNSIGNED NOT NULL,
  `stock_id` int UNSIGNED NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `metadata` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_shipment_source`
--

CREATE TABLE `inventory_shipment_source` (
  `shipment_id` int UNSIGNED NOT NULL,
  `source_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_source`
--

CREATE TABLE `inventory_source` (
  `source_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` smallint UNSIGNED NOT NULL DEFAULT '1',
  `description` text,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `country_id` varchar(2) NOT NULL,
  `region_id` int UNSIGNED DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `use_default_carrier_config` smallint UNSIGNED NOT NULL DEFAULT '1',
  `is_pickup_location_active` tinyint(1) NOT NULL DEFAULT '0',
  `frontend_name` varchar(255) DEFAULT '',
  `frontend_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `inventory_source`
--

INSERT INTO `inventory_source` (`source_code`, `name`, `enabled`, `description`, `latitude`, `longitude`, `country_id`, `region_id`, `region`, `city`, `street`, `postcode`, `contact_name`, `email`, `phone`, `fax`, `use_default_carrier_config`, `is_pickup_location_active`, `frontend_name`, `frontend_description`) VALUES
('default', 'Default Source', 1, 'Default Source', 0.000000, 0.000000, 'US', NULL, NULL, NULL, NULL, '00000', NULL, NULL, NULL, NULL, 1, 0, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_source_carrier_link`
--

CREATE TABLE `inventory_source_carrier_link` (
  `link_id` int UNSIGNED NOT NULL,
  `source_code` varchar(255) NOT NULL,
  `carrier_code` varchar(255) NOT NULL,
  `position` smallint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_source_item`
--

CREATE TABLE `inventory_source_item` (
  `source_item_id` int UNSIGNED NOT NULL,
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `status` smallint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_source_stock_link`
--

CREATE TABLE `inventory_source_stock_link` (
  `link_id` int UNSIGNED NOT NULL,
  `stock_id` int UNSIGNED NOT NULL,
  `source_code` varchar(255) NOT NULL,
  `priority` smallint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `inventory_source_stock_link`
--

INSERT INTO `inventory_source_stock_link` (`link_id`, `stock_id`, `source_code`, `priority`) VALUES
(1, 1, 'default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_stock`
--

CREATE TABLE `inventory_stock` (
  `stock_id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `inventory_stock`
--

INSERT INTO `inventory_stock` (`stock_id`, `name`) VALUES
(1, 'Default Stock');

-- --------------------------------------------------------

--
-- Stand-in structure for view `inventory_stock_1`
-- (See below for the actual view)
--
CREATE TABLE `inventory_stock_1` (
`is_salable` smallint unsigned
,`product_id` int unsigned
,`quantity` decimal(12,4)
,`sku` varchar(64)
,`stock_id` smallint unsigned
,`website_id` smallint unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_stock_sales_channel`
--

CREATE TABLE `inventory_stock_sales_channel` (
  `type` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `stock_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `inventory_stock_sales_channel`
--

INSERT INTO `inventory_stock_sales_channel` (`type`, `code`, `stock_id`) VALUES
('website', 'base', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jwt_auth_revoked`
--

CREATE TABLE `jwt_auth_revoked` (
  `user_type_id` int UNSIGNED NOT NULL COMMENT 'User Type ID',
  `user_id` int UNSIGNED NOT NULL COMMENT 'User ID',
  `revoke_before` bigint UNSIGNED NOT NULL COMMENT 'Not accepting tokens issued before this timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Holds revoked JWT authentication data';

-- --------------------------------------------------------

--
-- Table structure for table `layout_link`
--

CREATE TABLE `layout_link` (
  `layout_link_id` int UNSIGNED NOT NULL COMMENT 'Link ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `theme_id` int UNSIGNED NOT NULL COMMENT 'Theme ID',
  `layout_update_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Layout Update ID',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Defines whether Layout Update is Temporary'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Layout Link';

-- --------------------------------------------------------

--
-- Table structure for table `layout_update`
--

CREATE TABLE `layout_update` (
  `layout_update_id` int UNSIGNED NOT NULL COMMENT 'Layout Update ID',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Layout Updates';

-- --------------------------------------------------------

--
-- Table structure for table `login_as_customer`
--

CREATE TABLE `login_as_customer` (
  `secret` varchar(64) NOT NULL COMMENT 'Login Secret',
  `customer_id` int NOT NULL COMMENT 'Customer ID',
  `admin_id` int NOT NULL COMMENT 'Admin ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Magento Login as Customer Table';

-- --------------------------------------------------------

--
-- Table structure for table `login_as_customer_assistance_allowed`
--

CREATE TABLE `login_as_customer_assistance_allowed` (
  `customer_id` int UNSIGNED NOT NULL COMMENT 'Customer ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Magento Login as Customer Assistance Allowed Table';

-- --------------------------------------------------------

--
-- Table structure for table `magento_acknowledged_bulk`
--

CREATE TABLE `magento_acknowledged_bulk` (
  `id` int UNSIGNED NOT NULL COMMENT 'Internal ID',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Bulk that was viewed by user from notification area';

-- --------------------------------------------------------

--
-- Table structure for table `magento_bulk`
--

CREATE TABLE `magento_bulk` (
  `id` int UNSIGNED NOT NULL COMMENT 'Bulk Internal ID (must not be exposed)',
  `uuid` varbinary(39) DEFAULT NULL COMMENT 'Bulk UUID (can be exposed to reference bulk entity)',
  `user_id` int UNSIGNED DEFAULT NULL COMMENT 'ID of the WebAPI user that performed an action',
  `user_type` int DEFAULT NULL COMMENT 'Which type of user',
  `description` varchar(255) DEFAULT NULL COMMENT 'Bulk Description',
  `operation_count` int UNSIGNED NOT NULL COMMENT 'Total number of operations scheduled within this bulk',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bulk start time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Bulk entity that represents set of related asynchronous operations';

-- --------------------------------------------------------

--
-- Table structure for table `magento_login_as_customer_log`
--

CREATE TABLE `magento_login_as_customer_log` (
  `log_id` int NOT NULL COMMENT 'Log Id',
  `time` timestamp NULL DEFAULT NULL COMMENT 'Event Date',
  `user_id` int UNSIGNED DEFAULT NULL COMMENT 'User Id',
  `user_name` varchar(40) DEFAULT NULL COMMENT 'User Name',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `customer_email` varchar(40) DEFAULT NULL COMMENT 'Customer email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Login as Customer Logging';

-- --------------------------------------------------------

--
-- Table structure for table `magento_operation`
--

CREATE TABLE `magento_operation` (
  `id` int UNSIGNED NOT NULL COMMENT 'Operation ID',
  `operation_key` int UNSIGNED DEFAULT NULL COMMENT 'Operation Key',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Name of the related message queue topic',
  `serialized_data` blob COMMENT 'Data (serialized) required to perform an operation',
  `result_serialized_data` blob COMMENT 'Result data (serialized) after perform an operation',
  `status` smallint DEFAULT '0' COMMENT 'Operation status (OPEN | COMPLETE | RETRIABLY_FAILED | NOT_RETRIABLY_FAILED)',
  `error_code` smallint DEFAULT NULL COMMENT 'Code of the error that appeared during operation execution (used to aggregate related failed operations)',
  `result_message` varchar(255) DEFAULT NULL COMMENT 'Operation result message',
  `started_at` timestamp NULL DEFAULT NULL COMMENT 'Datetime the operation started processing'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Operation entity';

-- --------------------------------------------------------

--
-- Table structure for table `media_content_asset`
--

CREATE TABLE `media_content_asset` (
  `asset_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `entity_type` varchar(255) NOT NULL COMMENT 'Content type',
  `entity_id` varchar(255) NOT NULL COMMENT 'Content entity id',
  `field` varchar(255) NOT NULL COMMENT 'Content field'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Relation between media content and media asset';

-- --------------------------------------------------------

--
-- Table structure for table `media_gallery_asset`
--

CREATE TABLE `media_gallery_asset` (
  `id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `path` text COMMENT 'Path',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `source` varchar(255) DEFAULT NULL COMMENT 'Source',
  `hash` varchar(255) DEFAULT NULL COMMENT 'File hash',
  `content_type` varchar(255) DEFAULT NULL COMMENT 'Content Type',
  `width` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Width',
  `height` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Height',
  `size` int UNSIGNED NOT NULL COMMENT 'Asset file size in bytes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Media Gallery Asset';

-- --------------------------------------------------------

--
-- Table structure for table `media_gallery_asset_keyword`
--

CREATE TABLE `media_gallery_asset_keyword` (
  `keyword_id` int UNSIGNED NOT NULL COMMENT 'Keyword Id',
  `asset_id` int UNSIGNED NOT NULL COMMENT 'Asset ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Media Gallery Asset Keyword';

-- --------------------------------------------------------

--
-- Table structure for table `media_gallery_keyword`
--

CREATE TABLE `media_gallery_keyword` (
  `id` int UNSIGNED NOT NULL COMMENT 'Keyword ID',
  `keyword` varchar(255) NOT NULL COMMENT 'Keyword'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Media Gallery Keyword';

-- --------------------------------------------------------

--
-- Table structure for table `mview_state`
--

CREATE TABLE `mview_state` (
  `state_id` int UNSIGNED NOT NULL COMMENT 'View State ID',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View ID',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int UNSIGNED DEFAULT NULL COMMENT 'View Version ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='View State';

--
-- Dumping data for table `mview_state`
--

INSERT INTO `mview_state` (`state_id`, `view_id`, `mode`, `status`, `updated`, `version_id`) VALUES
(1, 'design_config_dummy', 'enabled', 'idle', '2024-09-28 14:32:48', 0),
(2, 'customer_dummy', 'enabled', 'idle', '2024-09-28 14:32:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_problem`
--

CREATE TABLE `newsletter_problem` (
  `problem_id` int UNSIGNED NOT NULL COMMENT 'Problem ID',
  `subscriber_id` int UNSIGNED DEFAULT NULL COMMENT 'Subscriber ID',
  `queue_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue ID',
  `problem_error_code` int UNSIGNED DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Problems';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue`
--

CREATE TABLE `newsletter_queue` (
  `queue_id` int UNSIGNED NOT NULL COMMENT 'Queue ID',
  `template_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Template ID',
  `newsletter_type` int DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Queue';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_link`
--

CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int UNSIGNED NOT NULL COMMENT 'Queue Link ID',
  `queue_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue ID',
  `subscriber_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Subscriber ID',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Queue Link';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_store_link`
--

CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Queue Store Link';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscriber`
--

CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int UNSIGNED NOT NULL COMMENT 'Subscriber ID',
  `store_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Store ID',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Subscriber';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_template`
--

CREATE TABLE `newsletter_template` (
  `template_id` int UNSIGNED NOT NULL COMMENT 'Template ID',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int UNSIGNED DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint UNSIGNED DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  `is_legacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Should the template render in legacy mode'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Template';

-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE `oauth_consumer` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(128) NOT NULL COMMENT 'Secret code',
  `callback_url` text COMMENT 'Callback URL',
  `rejected_callback_url` text NOT NULL COMMENT 'Rejected callback URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAuth Consumers';

-- --------------------------------------------------------

--
-- Table structure for table `oauth_nonce`
--

CREATE TABLE `oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int UNSIGNED NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int UNSIGNED NOT NULL COMMENT 'Consumer ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAuth Nonce';

-- --------------------------------------------------------

--
-- Table structure for table `oauth_token`
--

CREATE TABLE `oauth_token` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `consumer_id` int UNSIGNED DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int UNSIGNED DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(128) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` text NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `user_type` int DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAuth Tokens';

-- --------------------------------------------------------

--
-- Table structure for table `oauth_token_request_log`
--

CREATE TABLE `oauth_token_request_log` (
  `log_id` int UNSIGNED NOT NULL COMMENT 'Log ID',
  `user_name` varchar(255) NOT NULL COMMENT 'Customer email or admin login',
  `user_type` smallint UNSIGNED NOT NULL COMMENT 'User type (admin or customer)',
  `failures_count` smallint UNSIGNED DEFAULT '0' COMMENT 'Number of failed authentication attempts in a row',
  `lock_expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Lock expiration time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Log of token request authentication failures.';

-- --------------------------------------------------------

--
-- Table structure for table `pagebuilder_template`
--

CREATE TABLE `pagebuilder_template` (
  `template_id` int NOT NULL COMMENT 'Template ID Auto Increment',
  `name` varchar(1024) NOT NULL COMMENT 'Template Name',
  `preview_image` varchar(1024) DEFAULT NULL COMMENT 'Template Preview Image',
  `template` longtext NOT NULL COMMENT 'Master Format HTML',
  `created_for` varchar(255) DEFAULT NULL COMMENT 'Created For',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Page Builder Templates';

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_request_event`
--

CREATE TABLE `password_reset_request_event` (
  `id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `request_type` smallint UNSIGNED NOT NULL COMMENT 'Type of the event under a security control',
  `account_reference` varchar(255) DEFAULT NULL COMMENT 'An identifier for existing account or another target',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp when the event occurs',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Password Reset Request Event under a security control';

-- --------------------------------------------------------

--
-- Table structure for table `patch_list`
--

CREATE TABLE `patch_list` (
  `patch_id` int NOT NULL COMMENT 'Patch Auto Increment',
  `patch_name` varchar(1024) NOT NULL COMMENT 'Patch Class Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='List of data/schema patches';

--
-- Dumping data for table `patch_list`
--

INSERT INTO `patch_list` (`patch_id`, `patch_name`) VALUES
(1, 'Magento\\Store\\Setup\\Patch\\Schema\\InitializeStoresAndWebsites'),
(2, 'Magento\\Catalog\\Setup\\Patch\\Schema\\EnableSegmentation'),
(3, 'Magento\\CatalogRule\\Setup\\Patch\\Schema\\CleanUpProductPriceReplicaTable'),
(4, 'Magento\\TwoFactorAuth\\Setup\\Patch\\Schema\\CopyTablesFromOldModule'),
(5, 'Magento\\Bundle\\Setup\\Patch\\Schema\\UpdateBundleRelatedSchema'),
(6, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\CreateLegacyStockStatusView'),
(7, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\InitializeDefaultStock'),
(8, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\UpdateInventorySourceItem'),
(9, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\ReindexDefaultSource'),
(10, 'Magento\\InventorySales\\Setup\\Patch\\Schema\\InitializeWebsiteDefaultSock'),
(11, 'Magento\\Review\\Setup\\Patch\\Schema\\AddUniqueConstraintToReviewEntitySummary'),
(12, 'Magento\\Store\\Setup\\Patch\\Data\\DisableSid'),
(13, 'Magento\\Store\\Setup\\Patch\\Data\\UpdateStoreGroupCodes'),
(14, 'Magento\\Config\\Setup\\Patch\\Data\\RemoveTinymceConfig'),
(15, 'Magento\\Config\\Setup\\Patch\\Data\\UnsetTinymce3'),
(16, 'Magento\\Config\\Setup\\Patch\\Data\\UpdateClassAliases'),
(17, 'Magento\\Directory\\Setup\\Patch\\Data\\InitializeDirectoryData'),
(18, 'Magento\\Directory\\Setup\\Patch\\Data\\AddCountriesCaribbeanCuracaoKosovoSintMaarten'),
(19, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForAlbania'),
(20, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForArgentina'),
(21, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCroatia'),
(22, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForIndia'),
(23, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForAustralia'),
(24, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBelarus'),
(25, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBelgium'),
(26, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBolivia'),
(27, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBulgaria'),
(28, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForChile'),
(29, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForChina'),
(30, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForColombia'),
(31, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCostaRica'),
(32, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCzechia'),
(33, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForDenmark'),
(34, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForEcuador'),
(35, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForGreece'),
(36, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForGuyana'),
(37, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForIceland'),
(38, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForItaly'),
(39, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForMexico'),
(40, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForParaguay'),
(41, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPeru'),
(42, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPoland'),
(43, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPortugal'),
(44, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForSuriname'),
(45, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForSweden'),
(46, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForUkraine'),
(47, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForUruguay'),
(48, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForVenezuela'),
(49, 'Magento\\Directory\\Setup\\Patch\\Data\\AddRegionsForIndia'),
(50, 'Magento\\Directory\\Setup\\Patch\\Data\\UpdateRegionNamesForSwitzerland'),
(51, 'Magento\\Theme\\Setup\\Patch\\Data\\RegisterThemes'),
(52, 'Magento\\Theme\\Setup\\Patch\\Data\\ConvertSerializedData'),
(53, 'Magento\\Security\\Setup\\Patch\\Data\\SessionIDColumnCleanUp'),
(54, 'Magento\\User\\Setup\\Patch\\Data\\UpgradePasswordHashes'),
(55, 'Magento\\User\\Setup\\Patch\\Data\\UpgradeSerializedFields'),
(56, 'Magento\\Authorization\\Setup\\Patch\\Data\\InitializeAuthRoles'),
(57, 'Magento\\Eav\\Setup\\Patch\\Data\\InitializeAttributeModels'),
(58, 'Magento\\Customer\\Setup\\Patch\\Data\\DefaultCustomerGroupsAndAttributes'),
(59, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributesMetadata'),
(60, 'Magento\\Customer\\Setup\\Patch\\Data\\AddNonSpecifiedGenderAttributeOption'),
(61, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateIdentifierCustomerAttributesVisibility'),
(62, 'Magento\\Customer\\Setup\\Patch\\Data\\AddCustomerUpdatedAtAttribute'),
(63, 'Magento\\Customer\\Setup\\Patch\\Data\\UpgradePasswordHashAndAddress'),
(64, 'Magento\\Customer\\Setup\\Patch\\Data\\RemoveCheckoutRegisterAndUpdateAttributes'),
(65, 'Magento\\Customer\\Setup\\Patch\\Data\\AddSecurityTrackingAttributes'),
(66, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateAutocompleteOnStorefrontConfigPath'),
(67, 'Magento\\Customer\\Setup\\Patch\\Data\\MigrateStoresAllowedCountriesToWebsite'),
(68, 'Magento\\Customer\\Setup\\Patch\\Data\\ConvertValidationRulesFromSerializedToJson'),
(69, 'Magento\\Customer\\Setup\\Patch\\Data\\SessionIDColumnCleanUp'),
(70, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAddressAttributesSortOrder'),
(71, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateVATNumber'),
(72, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributeInputFilters'),
(73, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateDefaultCustomerGroupInConfig'),
(74, 'Magento\\Indexer\\Setup\\Patch\\Data\\InitializeIndexerState'),
(75, 'Magento\\Cms\\Setup\\Patch\\Data\\CreateDefaultPages'),
(76, 'Magento\\Cms\\Setup\\Patch\\Data\\UpdatePrivacyPolicyPage'),
(77, 'Magento\\Cms\\Setup\\Patch\\Data\\ConvertWidgetConditionsToJson'),
(78, 'Magento\\Integration\\Setup\\Patch\\Data\\RemoveInactiveTokens'),
(79, 'Magento\\Integration\\Setup\\Patch\\Data\\UpgradeConsumerSecret'),
(80, 'Magento\\Integration\\Setup\\Patch\\Data\\UpgradeOauthToken'),
(81, 'Magento\\Catalog\\Setup\\Patch\\Data\\InstallDefaultCategories'),
(82, 'Magento\\Catalog\\Setup\\Patch\\Data\\SetNewResourceModelsPaths'),
(83, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateDefaultAttributeValue'),
(84, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateMediaAttributesBackendTypes'),
(85, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductAttributes'),
(86, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductMetaDescription'),
(87, 'Magento\\Catalog\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),
(88, 'Magento\\Catalog\\Setup\\Patch\\Data\\DisallowUsingHtmlForProductName'),
(89, 'Magento\\Catalog\\Setup\\Patch\\Data\\EnableDirectiveParsing'),
(90, 'Magento\\Catalog\\Setup\\Patch\\Data\\EnableSegmentation'),
(91, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateCustomLayoutAttributes'),
(92, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateMultiselectAttributesBackendTypes'),
(93, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductDescriptionOrder'),
(94, 'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\CreateUrlAttributes'),
(95, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductUrlKey'),
(96, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWidgetData'),
(97, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWebsiteAttributes'),
(98, 'Magento\\CatalogInventory\\Setup\\Patch\\Data\\CreateDefaultStock'),
(99, 'Magento\\CatalogInventory\\Setup\\Patch\\Data\\UpdateStockItemsWebsite'),
(100, 'Magento\\CatalogInventory\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(101, 'Magento\\CatalogRule\\Setup\\Patch\\Data\\UpdateClassAliasesForCatalogRules'),
(102, 'Magento\\CatalogRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(103, 'Magento\\Msrp\\Setup\\Patch\\Data\\InitializeMsrpAttributes'),
(104, 'Magento\\Msrp\\Setup\\Patch\\Data\\ChangeMsrpAttributeLabel'),
(105, 'Magento\\Msrp\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),
(106, 'Magento\\CatalogSearch\\Setup\\Patch\\Data\\MySQLSearchRemovalNotification'),
(107, 'Magento\\CatalogSearch\\Setup\\Patch\\Data\\SetInitialSearchWeightForAttributes'),
(108, 'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\UpdateUrlKeyForProducts'),
(109, 'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\UpdateUrlKeySearchable'),
(110, 'Magento\\Quote\\Setup\\Patch\\Data\\InstallEntityTypes'),
(111, 'Magento\\Quote\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(112, 'Magento\\Quote\\Setup\\Patch\\Data\\WishlistDataCleanUp'),
(113, 'Magento\\MediaGalleryUi\\Setup\\Patch\\Data\\AddMediaGalleryPermissions'),
(114, 'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\CopyConfigFromOldModule'),
(115, 'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\EncryptConfiguration'),
(116, 'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\EncryptGoogleSecrets'),
(117, 'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\EncryptSecrets'),
(118, 'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\GenerateDuoSecurityKey'),
(119, 'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\PopulateCountryTable'),
(120, 'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\ResetU2fConfig'),
(121, 'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\UpdateOtpWindow'),
(122, 'Magento\\Sales\\Setup\\Patch\\Data\\InstallOrderStatusesAndInitialSalesConfig'),
(123, 'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypes'),
(124, 'Magento\\Sales\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(125, 'Magento\\Sales\\Setup\\Patch\\Data\\FillQuoteAddressIdInSalesOrderAddress'),
(126, 'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypeModelForInvoice'),
(127, 'Magento\\Sales\\Setup\\Patch\\Data\\WishlistDataCleanUp'),
(128, 'Magento\\Checkout\\Setup\\Patch\\Data\\PrepareInitialCheckoutConfiguration'),
(129, 'Magento\\Widget\\Setup\\Patch\\Data\\UpgradeModelInstanceClassAliases'),
(130, 'Magento\\Widget\\Setup\\Patch\\Data\\ConvertSerializedData'),
(131, 'Magento\\Analytics\\Setup\\Patch\\Data\\PrepareInitialConfig'),
(132, 'Magento\\Analytics\\Setup\\Patch\\Data\\ActivateDataCollection'),
(133, 'Magento\\Downloadable\\Setup\\Patch\\Data\\AddDownloadableHostsConfig'),
(134, 'Magento\\Downloadable\\Setup\\Patch\\Data\\InstallDownloadableAttributes'),
(135, 'Magento\\Downloadable\\Setup\\Patch\\Data\\UpdateLinksExistDefaultAttributeValue'),
(136, 'Magento\\Newsletter\\Setup\\Patch\\Data\\FlagLegacyTemplates'),
(137, 'Magento\\Dhl\\Setup\\Patch\\Data\\PrepareShipmentDays'),
(138, 'Magento\\Bundle\\Setup\\Patch\\Data\\ApplyAttributesUpdate'),
(139, 'Magento\\Bundle\\Setup\\Patch\\Data\\UpdateBundleRelatedEntityTypes'),
(140, 'Magento\\Email\\Setup\\Patch\\Data\\FlagLegacyTemplates'),
(141, 'Magento\\EncryptionKey\\Setup\\Patch\\Data\\SodiumChachaPatch'),
(142, 'Magento\\Fedex\\Setup\\Patch\\Data\\ConfigureFedexDefaults'),
(143, 'Magento\\GiftMessage\\Setup\\Patch\\Data\\AddGiftMessageAttributes'),
(144, 'Magento\\GiftMessage\\Setup\\Patch\\Data\\MoveGiftMessageToGiftOptionsGroup'),
(145, 'Magento\\GiftMessage\\Setup\\Patch\\Data\\UpdateGiftMessageAttribute'),
(146, 'Magento\\GroupedProduct\\Setup\\Patch\\Data\\InitializeGroupedProductLinks'),
(147, 'Magento\\GroupedProduct\\Setup\\Patch\\Data\\UpdateProductRelations'),
(148, 'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\InstallInitialConfigurableAttributes'),
(149, 'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateManufacturerAttribute'),
(150, 'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateTierPriceAttribute'),
(151, 'Magento\\InventoryLowQuantityNotification\\Setup\\Patch\\Data\\MigrateCatalogInventoryNotifyStockQuantityData'),
(152, 'Magento\\Reports\\Setup\\Patch\\Data\\InitializeReportEntityTypesAndPages'),
(153, 'Magento\\Reports\\Setup\\Patch\\Data\\ReportDisableNotification'),
(154, 'Magento\\SalesRule\\Setup\\Patch\\Data\\PrepareRuleModelSerializedData'),
(155, 'Magento\\SalesRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(156, 'Magento\\SalesRule\\Setup\\Patch\\Data\\FillSalesRuleProductAttributeTable'),
(157, 'Magento\\PageBuilder\\Setup\\Patch\\Data\\UpdateProductAttribute'),
(158, 'Magento\\PageBuilder\\Setup\\Patch\\Data\\UpgradePageBuilderStripStyles'),
(159, 'Magento\\Vault\\Setup\\Patch\\Data\\SetCreditCardAsDefaultTokenType'),
(160, 'Magento\\Paypal\\Setup\\Patch\\Data\\AddPaypalOrderStatuses'),
(161, 'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateBmltoPayLater'),
(162, 'Magento\\Paypal\\Setup\\Patch\\Data\\UpdatePaypalCreditOption'),
(163, 'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateSmartButtonLabel'),
(164, 'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateSmartButtonSize'),
(165, 'Magento\\ServicesId\\Setup\\Patch\\Data\\RemoveKeySetEncryptedConfigFlag'),
(166, 'Magento\\ReCaptchaMigration\\Setup\\Patch\\Data\\MigrateConfigToRecaptchaModules'),
(167, 'Magento\\Review\\Setup\\Patch\\Data\\InitReviewStatusesAndData'),
(168, 'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateQuoteShippingAddresses'),
(169, 'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateShippingTablerate'),
(170, 'Magento\\UrlRewrite\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(171, 'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageAttribute'),
(172, 'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageToDefaultAttribtueSet'),
(173, 'Magento\\Swatches\\Setup\\Patch\\Data\\UpdateAdminTextSwatchValues'),
(174, 'Magento\\Swatches\\Setup\\Patch\\Data\\ConvertAdditionalDataToJson'),
(175, 'Magento\\Tax\\Setup\\Patch\\Data\\AddTaxAttributeAndTaxClasses'),
(176, 'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxClassAttributeVisibility'),
(177, 'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxRegionId'),
(178, 'Magento\\SampleData\\Setup\\Patch\\Data\\ClearSampleDataState'),
(179, 'Magento\\Usps\\Setup\\Patch\\Data\\UpdateAllowedMethods'),
(180, 'Magento\\Weee\\Setup\\Patch\\Data\\InitQuoteAndOrderAttributes'),
(181, 'Magento\\CurrencySymbol\\Setup\\Patch\\Data\\ConvertSerializedCustomCurrencySymbolToJson'),
(182, 'Magento\\Wishlist\\Setup\\Patch\\Data\\ConvertSerializedData'),
(183, 'Magento\\Wishlist\\Setup\\Patch\\Data\\WishlistDataCleanUp'),
(184, 'Magento\\Elasticsearch\\Setup\\Patch\\Data\\InvalidateIndex');

-- --------------------------------------------------------

--
-- Table structure for table `payment_services_order_data_production_submitted_hash`
--

CREATE TABLE `payment_services_order_data_production_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Order identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Submitted At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Payment Services Order Feed Storage';

-- --------------------------------------------------------

--
-- Table structure for table `payment_services_order_data_sandbox_submitted_hash`
--

CREATE TABLE `payment_services_order_data_sandbox_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Order identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Submitted At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Payment Services Order Feed Storage';

-- --------------------------------------------------------

--
-- Table structure for table `payment_services_order_status_data_prod_submitted_hash`
--

CREATE TABLE `payment_services_order_status_data_prod_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Order Status identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Submitted At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Payment Services Order Status Feed Storage';

-- --------------------------------------------------------

--
-- Table structure for table `payment_services_order_status_data_sandbox_submitted_hash`
--

CREATE TABLE `payment_services_order_status_data_sandbox_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Order Status identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Submitted At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Payment Services Order Status Feed Storage';

-- --------------------------------------------------------

--
-- Table structure for table `payment_services_store_data_production_submitted_hash`
--

CREATE TABLE `payment_services_store_data_production_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Store identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Submitted At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Payment Services Store Feed Storage';

-- --------------------------------------------------------

--
-- Table structure for table `payment_services_store_data_sandbox_submitted_hash`
--

CREATE TABLE `payment_services_store_data_sandbox_submitted_hash` (
  `identifier` varchar(64) NOT NULL COMMENT 'Store identifier',
  `feed_hash` varchar(64) NOT NULL COMMENT 'feed_hash',
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Submitted At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Payment Services Store Feed Storage';

-- --------------------------------------------------------

--
-- Table structure for table `paypal_billing_agreement`
--

CREATE TABLE `paypal_billing_agreement` (
  `agreement_id` int UNSIGNED NOT NULL COMMENT 'Agreement ID',
  `customer_id` int UNSIGNED NOT NULL COMMENT 'Customer ID',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference ID',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Billing Agreement';

-- --------------------------------------------------------

--
-- Table structure for table `paypal_billing_agreement_order`
--

CREATE TABLE `paypal_billing_agreement_order` (
  `agreement_id` int UNSIGNED NOT NULL COMMENT 'Agreement ID',
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Billing Agreement Order';

-- --------------------------------------------------------

--
-- Table structure for table `paypal_cert`
--

CREATE TABLE `paypal_cert` (
  `cert_id` smallint UNSIGNED NOT NULL COMMENT 'Cert ID',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Paypal Certificate Table';

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_transaction`
--

CREATE TABLE `paypal_payment_transaction` (
  `transaction_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn ID',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='PayPal Payflow Link Payment Transaction';

-- --------------------------------------------------------

--
-- Table structure for table `paypal_settlement_report`
--

CREATE TABLE `paypal_settlement_report` (
  `report_id` int UNSIGNED NOT NULL COMMENT 'Report ID',
  `report_date` date DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account ID',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Paypal Settlement Report Table';

-- --------------------------------------------------------

--
-- Table structure for table `paypal_settlement_report_row`
--

CREATE TABLE `paypal_settlement_report_row` (
  `row_id` int UNSIGNED NOT NULL COMMENT 'Row ID',
  `report_id` int UNSIGNED NOT NULL COMMENT 'Report ID',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction ID',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice ID',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference ID',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference ID Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT NULL COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer ID',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Paypal Settlement Report Row Table';

-- --------------------------------------------------------

--
-- Table structure for table `persistent_session`
--

CREATE TABLE `persistent_session` (
  `persistent_id` int UNSIGNED NOT NULL COMMENT 'Session ID',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Persistent Session';

-- --------------------------------------------------------

--
-- Table structure for table `product_alert_price`
--

CREATE TABLE `product_alert_price` (
  `alert_price_id` int UNSIGNED NOT NULL COMMENT 'Product alert price ID',
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price amount',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `store_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Store ID',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product alert status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Product Alert Price';

-- --------------------------------------------------------

--
-- Table structure for table `product_alert_stock`
--

CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int UNSIGNED NOT NULL COMMENT 'Product alert stock ID',
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `store_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Store ID',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product alert status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Product Alert Stock';

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int UNSIGNED NOT NULL COMMENT 'Queue ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Queue name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Table storing unique queues';

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`id`, `name`) VALUES
(21, 'async.operations.all'),
(4, 'catalog_website_attribute_value_sync'),
(17, 'codegenerator'),
(6, 'export'),
(12, 'inventory.indexer.sourceItem'),
(13, 'inventory.indexer.stock'),
(8, 'inventory.mass.update'),
(9, 'inventory.reservations.cleanup'),
(10, 'inventory.reservations.update'),
(11, 'inventory.reservations.updateSalabilityStatus'),
(7, 'inventory.source.items.cleanup'),
(14, 'media.content.synchronization'),
(15, 'media.gallery.renditions.update'),
(16, 'media.gallery.synchronization'),
(5, 'media.storage.catalog.image.resize'),
(2, 'product_action_attribute.update'),
(3, 'product_action_attribute.website.update'),
(20, 'product_alert.queue'),
(19, 'sales.rule.quote.trigger.recollect'),
(18, 'sales.rule.update.coupon.usage'),
(1, 'saveConfig');

-- --------------------------------------------------------

--
-- Table structure for table `queue_lock`
--

CREATE TABLE `queue_lock` (
  `id` int UNSIGNED NOT NULL COMMENT 'Message ID',
  `message_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Messages that were processed are inserted here to be locked.';

-- --------------------------------------------------------

--
-- Table structure for table `queue_message`
--

CREATE TABLE `queue_message` (
  `id` bigint UNSIGNED NOT NULL COMMENT 'Message ID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Message topic',
  `body` longtext COMMENT 'Message body'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Queue messages';

-- --------------------------------------------------------

--
-- Table structure for table `queue_message_status`
--

CREATE TABLE `queue_message_status` (
  `id` bigint UNSIGNED NOT NULL COMMENT 'Relation ID',
  `queue_id` int UNSIGNED NOT NULL COMMENT 'Queue ID',
  `message_id` bigint UNSIGNED NOT NULL COMMENT 'Message ID',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `status` smallint UNSIGNED NOT NULL COMMENT 'Message status in particular queue',
  `number_of_trials` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of trials to processed failed message processing'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Relation table to keep associations between queues and messages';

-- --------------------------------------------------------

--
-- Table structure for table `queue_poison_pill`
--

CREATE TABLE `queue_poison_pill` (
  `version` varchar(255) NOT NULL COMMENT 'Poison Pill version.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sequence table for poison pill versions';

--
-- Dumping data for table `queue_poison_pill`
--

INSERT INTO `queue_poison_pill` (`version`) VALUES
('version-66f8138fe57dc');

-- --------------------------------------------------------

--
-- Table structure for table `quote`
--

CREATE TABLE `quote` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint UNSIGNED DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint UNSIGNED DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint UNSIGNED DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int UNSIGNED DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int UNSIGNED DEFAULT '0' COMMENT 'Orig Order ID',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(20,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `customer_tax_class_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer Tax Class ID',
  `customer_group_id` int UNSIGNED DEFAULT '0' COMMENT 'Customer Group ID',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint UNSIGNED DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint UNSIGNED DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order ID',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int UNSIGNED DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `is_persistent` smallint UNSIGNED DEFAULT '0' COMMENT 'Is Quote Persistent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote';

-- --------------------------------------------------------

--
-- Table structure for table `quote_address`
--

CREATE TABLE `quote_address` (
  `address_id` int UNSIGNED NOT NULL COMMENT 'Address ID',
  `quote_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `save_in_address_book` smallint DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer Address ID',
  `address_type` varchar(10) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_id` int UNSIGNED DEFAULT NULL COMMENT 'Region ID',
  `postcode` varchar(20) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(30) DEFAULT NULL COMMENT 'Country ID',
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `same_as_billing` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(120) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `vat_id` text COMMENT 'Vat ID',
  `vat_is_valid` smallint DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request ID',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint DEFAULT NULL COMMENT 'Vat Request Success',
  `validated_country_code` text COMMENT 'Validated Country Code',
  `validated_vat_number` text COMMENT 'Validated Vat Number',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `free_shipping` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Free Shipping'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Address';

-- --------------------------------------------------------

--
-- Table structure for table `quote_address_item`
--

CREATE TABLE `quote_address_item` (
  `address_item_id` int UNSIGNED NOT NULL COMMENT 'Address Item ID',
  `parent_item_id` int UNSIGNED DEFAULT NULL COMMENT 'Parent Item ID',
  `quote_address_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Address ID',
  `quote_item_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int UNSIGNED DEFAULT NULL COMMENT 'Product ID',
  `super_product_id` int UNSIGNED DEFAULT NULL COMMENT 'Super Product ID',
  `parent_product_id` int UNSIGNED DEFAULT NULL COMMENT 'Parent Product ID',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `is_qty_decimal` int UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int UNSIGNED DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(20,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(20,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `free_shipping` int UNSIGNED DEFAULT NULL COMMENT 'Free Shipping'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Address Item';

-- --------------------------------------------------------

--
-- Table structure for table `quote_id_mask`
--

CREATE TABLE `quote_id_mask` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `quote_id` int UNSIGNED NOT NULL COMMENT 'Quote ID',
  `masked_id` varchar(32) DEFAULT NULL COMMENT 'Masked ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Quote ID and masked ID mapping';

-- --------------------------------------------------------

--
-- Table structure for table `quote_item`
--

CREATE TABLE `quote_item` (
  `item_id` int UNSIGNED NOT NULL COMMENT 'Item ID',
  `quote_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int UNSIGNED DEFAULT NULL COMMENT 'Product ID',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `parent_item_id` int UNSIGNED DEFAULT NULL COMMENT 'Parent Item ID',
  `is_virtual` smallint UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint UNSIGNED DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(20,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(20,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `free_shipping` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Item';

-- --------------------------------------------------------

--
-- Table structure for table `quote_item_option`
--

CREATE TABLE `quote_item_option` (
  `option_id` int UNSIGNED NOT NULL COMMENT 'Option ID',
  `item_id` int UNSIGNED NOT NULL COMMENT 'Item ID',
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Item Option';

-- --------------------------------------------------------

--
-- Table structure for table `quote_payment`
--

CREATE TABLE `quote_payment` (
  `payment_id` int UNSIGNED NOT NULL COMMENT 'Payment ID',
  `quote_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint UNSIGNED DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint UNSIGNED DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint UNSIGNED DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer ID',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Payment';

-- --------------------------------------------------------

--
-- Table structure for table `quote_shipping_rate`
--

CREATE TABLE `quote_shipping_rate` (
  `rate_id` int UNSIGNED NOT NULL COMMENT 'Rate ID',
  `address_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Address ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Shipping Rate';

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rating_id` smallint UNSIGNED NOT NULL COMMENT 'Rating ID',
  `entity_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Position On Storefront',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'Rating is active.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Ratings';

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rating_id`, `entity_id`, `rating_code`, `position`, `is_active`) VALUES
(1, 1, 'Quality', 0, 1),
(2, 1, 'Value', 0, 1),
(3, 1, 'Price', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating_entity`
--

CREATE TABLE `rating_entity` (
  `entity_id` smallint UNSIGNED NOT NULL COMMENT 'Entity ID',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating entities';

--
-- Dumping data for table `rating_entity`
--

INSERT INTO `rating_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'product_review'),
(3, 'review');

-- --------------------------------------------------------

--
-- Table structure for table `rating_option`
--

CREATE TABLE `rating_option` (
  `option_id` int UNSIGNED NOT NULL COMMENT 'Rating Option ID',
  `rating_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Ration option position on Storefront'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating options';

--
-- Dumping data for table `rating_option`
--

INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES
(1, 1, '1', 1, 1),
(2, 1, '2', 2, 2),
(3, 1, '3', 3, 3),
(4, 1, '4', 4, 4),
(5, 1, '5', 5, 5),
(6, 2, '1', 1, 1),
(7, 2, '2', 2, 2),
(8, 2, '3', 3, 3),
(9, 2, '4', 4, 4),
(10, 2, '5', 5, 5),
(11, 3, '1', 1, 1),
(12, 3, '2', 2, 2),
(13, 3, '3', 3, 3),
(14, 3, '4', 4, 4),
(15, 3, '5', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote`
--

CREATE TABLE `rating_option_vote` (
  `vote_id` bigint UNSIGNED NOT NULL COMMENT 'Vote ID',
  `option_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Vote option ID',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int UNSIGNED DEFAULT '0' COMMENT 'Customer ID',
  `entity_pk_value` bigint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `rating_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `review_id` bigint UNSIGNED DEFAULT NULL COMMENT 'Review ID',
  `percent` smallint NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint NOT NULL DEFAULT '0' COMMENT 'Vote option value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating option values';

-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote_aggregated`
--

CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int NOT NULL COMMENT 'Vote aggregation ID',
  `rating_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `entity_pk_value` bigint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `vote_count` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating vote aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `rating_store`
--

CREATE TABLE `rating_store` (
  `rating_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating Store';

-- --------------------------------------------------------

--
-- Table structure for table `rating_title`
--

CREATE TABLE `rating_title` (
  `rating_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating Title';

-- --------------------------------------------------------

--
-- Table structure for table `release_notification_viewer_log`
--

CREATE TABLE `release_notification_viewer_log` (
  `id` int UNSIGNED NOT NULL COMMENT 'Log ID',
  `viewer_id` int UNSIGNED NOT NULL COMMENT 'Viewer admin user ID',
  `last_view_version` varchar(16) NOT NULL COMMENT 'Viewer last view on product version'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Release Notification Viewer Log Table';

-- --------------------------------------------------------

--
-- Table structure for table `reporting_counts`
--

CREATE TABLE `reporting_counts` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'Item Reported',
  `count` int UNSIGNED DEFAULT NULL COMMENT 'Count Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for all count related events generated via the cron job';

-- --------------------------------------------------------

--
-- Table structure for table `reporting_module_status`
--

CREATE TABLE `reporting_module_status` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Module ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Module Name',
  `active` varchar(255) DEFAULT NULL COMMENT 'Module Active Status',
  `setup_version` varchar(255) DEFAULT NULL COMMENT 'Module Version',
  `state` varchar(255) DEFAULT NULL COMMENT 'Module State',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Module Status Table';

-- --------------------------------------------------------

--
-- Table structure for table `reporting_orders`
--

CREATE TABLE `reporting_orders` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `total` decimal(20,4) UNSIGNED DEFAULT NULL,
  `total_base` decimal(20,4) UNSIGNED DEFAULT NULL,
  `item_count` int UNSIGNED NOT NULL COMMENT 'Line Item Count',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for all orders';

-- --------------------------------------------------------

--
-- Table structure for table `reporting_system_updates`
--

CREATE TABLE `reporting_system_updates` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'Update Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for system updates';

-- --------------------------------------------------------

--
-- Table structure for table `reporting_users`
--

CREATE TABLE `reporting_users` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'User Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for user actions';

-- --------------------------------------------------------

--
-- Table structure for table `report_compared_product_index`
--

CREATE TABLE `report_compared_product_index` (
  `index_id` bigint UNSIGNED NOT NULL COMMENT 'Index ID',
  `visitor_id` int UNSIGNED DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reports Compared Product Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `report_event`
--

CREATE TABLE `report_event` (
  `event_id` bigint UNSIGNED NOT NULL COMMENT 'Event ID',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Event Type ID',
  `object_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Object ID',
  `subject_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Subject ID',
  `subtype` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reports Event Table';

-- --------------------------------------------------------

--
-- Table structure for table `report_event_types`
--

CREATE TABLE `report_event_types` (
  `event_type_id` smallint UNSIGNED NOT NULL COMMENT 'Event Type ID',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Login'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reports Event Type Table';

--
-- Dumping data for table `report_event_types`
--

INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES
(1, 'catalog_product_view', 0),
(2, 'sendfriend_product', 0),
(3, 'catalog_product_compare_add_product', 0),
(4, 'checkout_cart_add_product', 0),
(5, 'wishlist_add_product', 0),
(6, 'wishlist_share', 0);

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_daily`
--

CREATE TABLE `report_viewed_product_aggregated_daily` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `product_id` int UNSIGNED DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Most Viewed Products Aggregated Daily';

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_monthly`
--

CREATE TABLE `report_viewed_product_aggregated_monthly` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `product_id` int UNSIGNED DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Most Viewed Products Aggregated Monthly';

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_yearly`
--

CREATE TABLE `report_viewed_product_aggregated_yearly` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `product_id` int UNSIGNED DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Most Viewed Products Aggregated Yearly';

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_index`
--

CREATE TABLE `report_viewed_product_index` (
  `index_id` bigint UNSIGNED NOT NULL COMMENT 'Index ID',
  `visitor_id` int UNSIGNED DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reports Viewed Product Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` bigint UNSIGNED NOT NULL COMMENT 'Review ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `entity_pk_value` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `status_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Status code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review base information';

-- --------------------------------------------------------

--
-- Table structure for table `review_detail`
--

CREATE TABLE `review_detail` (
  `detail_id` bigint UNSIGNED NOT NULL COMMENT 'Review detail ID',
  `review_id` bigint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Review ID',
  `store_id` smallint UNSIGNED DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review detail information';

-- --------------------------------------------------------

--
-- Table structure for table `review_entity`
--

CREATE TABLE `review_entity` (
  `entity_id` smallint UNSIGNED NOT NULL COMMENT 'Review entity ID',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review entities';

--
-- Dumping data for table `review_entity`
--

INSERT INTO `review_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'customer'),
(3, 'category');

-- --------------------------------------------------------

--
-- Table structure for table `review_entity_summary`
--

CREATE TABLE `review_entity_summary` (
  `primary_id` bigint NOT NULL COMMENT 'Summary review entity ID',
  `entity_pk_value` bigint NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `entity_type` smallint NOT NULL DEFAULT '0' COMMENT 'Entity type ID',
  `reviews_count` smallint NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review aggregates';

-- --------------------------------------------------------

--
-- Table structure for table `review_status`
--

CREATE TABLE `review_status` (
  `status_id` smallint UNSIGNED NOT NULL COMMENT 'Status ID',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review statuses';

--
-- Dumping data for table `review_status`
--

INSERT INTO `review_status` (`status_id`, `status_code`) VALUES
(1, 'Approved'),
(2, 'Pending'),
(3, 'Not Approved');

-- --------------------------------------------------------

--
-- Table structure for table `review_store`
--

CREATE TABLE `review_store` (
  `review_id` bigint UNSIGNED NOT NULL COMMENT 'Review ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review Store';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule`
--

CREATE TABLE `salesrule` (
  `rule_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `uses_per_customer` int NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Discount Step',
  `apply_to_shipping` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int NOT NULL DEFAULT '0' COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint UNSIGNED DEFAULT NULL COMMENT 'Simple Free Shipping'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon`
--

CREATE TABLE `salesrule_coupon` (
  `coupon_id` int UNSIGNED NOT NULL COMMENT 'Coupon ID',
  `rule_id` int UNSIGNED NOT NULL COMMENT 'Rule ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int UNSIGNED DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int UNSIGNED DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` datetime DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint UNSIGNED DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint DEFAULT '0' COMMENT 'Coupon Code Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Coupon';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_aggregated`
--

CREATE TABLE `salesrule_coupon_aggregated` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Coupon Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_aggregated_order`
--

CREATE TABLE `salesrule_coupon_aggregated_order` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Coupon Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_aggregated_updated`
--

CREATE TABLE `salesrule_coupon_aggregated_updated` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Coupon Aggregated Updated';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_usage`
--

CREATE TABLE `salesrule_coupon_usage` (
  `coupon_id` int UNSIGNED NOT NULL COMMENT 'Coupon ID',
  `customer_id` int UNSIGNED NOT NULL COMMENT 'Customer ID',
  `times_used` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Coupon Usage';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_customer`
--

CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int UNSIGNED NOT NULL COMMENT 'Rule Customer ID',
  `rule_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `times_used` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Customer';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_customer_group`
--

CREATE TABLE `salesrule_customer_group` (
  `rule_id` int UNSIGNED NOT NULL COMMENT 'Rule ID',
  `customer_group_id` int UNSIGNED NOT NULL COMMENT 'Customer Group ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Rules To Customer Groups Relations';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_label`
--

CREATE TABLE `salesrule_label` (
  `label_id` int UNSIGNED NOT NULL COMMENT 'Label ID',
  `rule_id` int UNSIGNED NOT NULL COMMENT 'Rule ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Label';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_product_attribute`
--

CREATE TABLE `salesrule_product_attribute` (
  `rule_id` int UNSIGNED NOT NULL COMMENT 'Rule ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `customer_group_id` int UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Product Attribute';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_website`
--

CREATE TABLE `salesrule_website` (
  `rule_id` int UNSIGNED NOT NULL COMMENT 'Rule ID',
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Rules To Websites Relations';

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_daily`
--

CREATE TABLE `sales_bestsellers_aggregated_daily` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `product_id` int UNSIGNED DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Bestsellers Aggregated Daily';

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_monthly`
--

CREATE TABLE `sales_bestsellers_aggregated_monthly` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `product_id` int UNSIGNED DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Bestsellers Aggregated Monthly';

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_yearly`
--

CREATE TABLE `sales_bestsellers_aggregated_yearly` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `product_id` int UNSIGNED DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Bestsellers Aggregated Yearly';

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo`
--

CREATE TABLE `sales_creditmemo` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order ID',
  `email_sent` smallint UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint UNSIGNED DEFAULT NULL COMMENT 'Send Email',
  `creditmemo_status` int DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `invoice_id` int DEFAULT NULL COMMENT 'Invoice ID',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint UNSIGNED DEFAULT NULL COMMENT 'Customer Note Notify'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo';

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo_comment`
--

CREATE TABLE `sales_creditmemo_comment` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo Comment';

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo_grid`
--

CREATE TABLE `sales_creditmemo_grid` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `state` int DEFAULT NULL COMMENT 'Status',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order Status',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint DEFAULT NULL COMMENT 'Customer Group ID',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `order_base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Order Grand Total'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo_item`
--

CREATE TABLE `sales_creditmemo_item` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `base_price` decimal(20,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(20,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(20,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo Item';

-- --------------------------------------------------------

--
-- Table structure for table `sales_data_exporter_orders`
--

CREATE TABLE `sales_data_exporter_orders` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `mode` varchar(255) NOT NULL COMMENT 'Order Payment Mode',
  `feed_data` mediumtext NOT NULL COMMENT 'Feed Data',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Orders Feed Storage';

-- --------------------------------------------------------

--
-- Table structure for table `sales_data_exporter_orders_index_batches`
--

CREATE TABLE `sales_data_exporter_orders_index_batches` (
  `batch_number` int NOT NULL COMMENT 'Batch Number',
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='sales_data_exporter_orders_index_batches';

-- --------------------------------------------------------

--
-- Table structure for table `sales_data_exporter_orders_index_sequence`
--

CREATE TABLE `sales_data_exporter_orders_index_sequence` (
  `i` int UNSIGNED NOT NULL COMMENT 'Auto Increment ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='sales_data_exporter_orders_index_sequence';

-- --------------------------------------------------------

--
-- Table structure for table `sales_data_exporter_order_statuses`
--

CREATE TABLE `sales_data_exporter_order_statuses` (
  `status` varchar(255) NOT NULL COMMENT 'status',
  `feed_data` mediumtext NOT NULL COMMENT 'Feed Data',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Statuses Feed Storage';

--
-- Dumping data for table `sales_data_exporter_order_statuses`
--

INSERT INTO `sales_data_exporter_order_statuses` (`status`, `feed_data`, `modified_at`) VALUES
('canceled', '{\"status\":\"canceled\",\"label\":\"Canceled\"}', '2024-09-28 14:25:22'),
('closed', '{\"status\":\"closed\",\"label\":\"Closed\"}', '2024-09-28 14:25:22'),
('complete', '{\"status\":\"complete\",\"label\":\"Complete\"}', '2024-09-28 14:25:22'),
('fraud', '{\"status\":\"fraud\",\"label\":\"Suspected Fraud\"}', '2024-09-28 14:25:22'),
('holded', '{\"status\":\"holded\",\"label\":\"On Hold\"}', '2024-09-28 14:25:22'),
('payment_review', '{\"status\":\"payment_review\",\"label\":\"Payment Review\"}', '2024-09-28 14:25:22'),
('paypal_canceled_reversal', '{\"status\":\"paypal_canceled_reversal\",\"label\":\"PayPal Canceled Reversal\"}', '2024-09-28 14:25:22'),
('paypal_reversed', '{\"status\":\"paypal_reversed\",\"label\":\"PayPal Reversed\"}', '2024-09-28 14:25:22'),
('pending', '{\"status\":\"pending\",\"label\":\"Pending\"}', '2024-09-28 14:25:22'),
('pending_payment', '{\"status\":\"pending_payment\",\"label\":\"Pending Payment\"}', '2024-09-28 14:25:22'),
('pending_paypal', '{\"status\":\"pending_paypal\",\"label\":\"Pending PayPal\"}', '2024-09-28 14:25:22'),
('processing', '{\"status\":\"processing\",\"label\":\"Processing\"}', '2024-09-28 14:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `sales_data_exporter_order_statuses_index_batches`
--

CREATE TABLE `sales_data_exporter_order_statuses_index_batches` (
  `batch_number` int NOT NULL COMMENT 'Batch Number',
  `status` varchar(32) NOT NULL COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='sales_data_exporter_order_statuses_index_batches';

--
-- Dumping data for table `sales_data_exporter_order_statuses_index_batches`
--

INSERT INTO `sales_data_exporter_order_statuses_index_batches` (`batch_number`, `status`) VALUES
(1, 'canceled'),
(1, 'closed'),
(1, 'complete'),
(1, 'fraud'),
(1, 'holded'),
(1, 'payment_review'),
(1, 'paypal_canceled_reversal'),
(1, 'paypal_reversed'),
(1, 'pending'),
(1, 'pending_payment'),
(1, 'pending_paypal'),
(1, 'processing');

-- --------------------------------------------------------

--
-- Table structure for table `sales_data_exporter_order_statuses_index_sequence`
--

CREATE TABLE `sales_data_exporter_order_statuses_index_sequence` (
  `i` int UNSIGNED NOT NULL COMMENT 'Auto Increment ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='sales_data_exporter_order_statuses_index_sequence';

--
-- Dumping data for table `sales_data_exporter_order_statuses_index_sequence`
--

INSERT INTO `sales_data_exporter_order_statuses_index_sequence` (`i`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice`
--

CREATE TABLE `sales_invoice` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `is_used_for_refund` smallint UNSIGNED DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order ID',
  `email_sent` smallint UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint UNSIGNED DEFAULT NULL COMMENT 'Send Email',
  `can_void_flag` smallint UNSIGNED DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction ID',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint UNSIGNED DEFAULT NULL COMMENT 'Customer Note Notify'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice';

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated`
--

CREATE TABLE `sales_invoiced_aggregated` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced Not Captured'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Invoiced Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

CREATE TABLE `sales_invoiced_aggregated_order` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(20,4) DEFAULT NULL COMMENT 'Invoiced Not Captured'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Invoiced Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_comment`
--

CREATE TABLE `sales_invoice_comment` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` smallint UNSIGNED DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice Comment';

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_grid`
--

CREATE TABLE `sales_invoice_grid` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `state` int DEFAULT NULL COMMENT 'State',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL COMMENT 'Payment Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_item`
--

CREATE TABLE `sales_invoice_item` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `base_price` decimal(20,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(20,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(20,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice Item';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint UNSIGNED DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint UNSIGNED DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint UNSIGNED DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint UNSIGNED DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `customer_group_id` int DEFAULT NULL,
  `edit_increment` int DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint UNSIGNED DEFAULT NULL COMMENT 'Send Email',
  `forced_shipment_with_invoice` smallint UNSIGNED DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int DEFAULT NULL COMMENT 'Quote Address ID',
  `quote_id` int DEFAULT NULL COMMENT 'Quote ID',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(20,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(20,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `applied_rule_ids` varchar(128) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(128) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(128) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(128) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(32) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(32) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(32) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(32) DEFAULT NULL COMMENT 'Ext Customer ID',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT 'Ext Order ID',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(32) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(32) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(50) DEFAULT NULL COMMENT 'Original Increment ID',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child ID',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real ID',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent ID',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real ID',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(120) DEFAULT NULL,
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(255) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `total_item_count` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int DEFAULT NULL COMMENT 'Customer Gender',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `paypal_ipn_customer_notified` int DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  `dispute_status` varchar(45) DEFAULT NULL COMMENT 'Braintree Dispute Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_address`
--

CREATE TABLE `sales_order_address` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `parent_id` int UNSIGNED DEFAULT NULL COMMENT 'Parent ID',
  `customer_address_id` int DEFAULT NULL COMMENT 'Customer Address ID',
  `quote_address_id` int DEFAULT NULL COMMENT 'Quote Address ID',
  `region_id` int DEFAULT NULL COMMENT 'Region ID',
  `customer_id` int DEFAULT NULL COMMENT 'Customer ID',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country ID',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat ID',
  `vat_is_valid` smallint DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request ID',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint DEFAULT NULL COMMENT 'Vat Request Success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Address';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_aggregated_created`
--

CREATE TABLE `sales_order_aggregated_created` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Aggregated Created';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_aggregated_updated`
--

CREATE TABLE `sales_order_aggregated_updated` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Aggregated Updated';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_data_exporter_cl`
--

CREATE TABLE `sales_order_data_exporter_cl` (
  `version_id` int UNSIGNED NOT NULL COMMENT 'Version ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='sales_order_data_exporter_cl';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_grid`
--

CREATE TABLE `sales_order_grid` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group` varchar(255) DEFAULT NULL COMMENT 'Customer Group',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment Method',
  `total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Refunded',
  `pickup_location_code` varchar(255) DEFAULT NULL COMMENT 'Pickup Location Code',
  `dispute_status` varchar(45) DEFAULT NULL COMMENT 'Braintree Dispute Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_item`
--

CREATE TABLE `sales_order_item` (
  `item_id` int UNSIGNED NOT NULL COMMENT 'Item ID',
  `order_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Order ID',
  `parent_item_id` int UNSIGNED DEFAULT NULL COMMENT 'Parent Item ID',
  `quote_item_id` int UNSIGNED DEFAULT NULL COMMENT 'Quote Item ID',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int UNSIGNED DEFAULT NULL COMMENT 'Product ID',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` longtext COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(20,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(20,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(20,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item ID',
  `locked_do_invoice` smallint UNSIGNED DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint UNSIGNED DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `discount_tax_compensation_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Canceled',
  `tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `gift_message_available` int DEFAULT NULL COMMENT 'Gift Message Available',
  `free_shipping` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Item';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_payment`
--

CREATE TABLE `sales_order_payment` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `base_shipping_captured` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(20,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(20,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(20,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int DEFAULT NULL COMMENT 'Quote Payment ID',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(12) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(12) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(128) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(128) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(32) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(32) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(32) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(100) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(32) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(32) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(128) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(255) DEFAULT NULL COMMENT 'Last Trans ID',
  `cc_cid_status` varchar(32) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(128) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(32) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(32) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(4) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(4) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(32) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(32) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(32) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(32) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(32) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(32) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(128) DEFAULT NULL,
  `cc_trans_id` varchar(32) DEFAULT NULL COMMENT 'Cc Trans ID',
  `address_status` varchar(32) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Payment';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status`
--

CREATE TABLE `sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `sales_order_status`
--

INSERT INTO `sales_order_status` (`status`, `label`) VALUES
('canceled', 'Canceled'),
('closed', 'Closed'),
('complete', 'Complete'),
('fraud', 'Suspected Fraud'),
('holded', 'On Hold'),
('payment_review', 'Payment Review'),
('paypal_canceled_reversal', 'PayPal Canceled Reversal'),
('paypal_reversed', 'PayPal Reversed'),
('pending', 'Pending'),
('pending_payment', 'Pending Payment'),
('pending_paypal', 'Pending PayPal'),
('processing', 'Processing');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_data_exporter_cl`
--

CREATE TABLE `sales_order_status_data_exporter_cl` (
  `version_id` int UNSIGNED NOT NULL COMMENT 'Version ID',
  `entity_id` varchar(32) NOT NULL DEFAULT '' COMMENT 'Order status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='sales_order_status_data_exporter_cl';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_history`
--

CREATE TABLE `sales_order_status_history` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Status History';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_label`
--

CREATE TABLE `sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `label` varchar(128) NOT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Status Label Table';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_state`
--

CREATE TABLE `sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `visible_on_front` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Visible on front'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `sales_order_status_state`
--

INSERT INTO `sales_order_status_state` (`status`, `state`, `is_default`, `visible_on_front`) VALUES
('canceled', 'canceled', 1, 1),
('closed', 'closed', 1, 1),
('complete', 'complete', 1, 1),
('fraud', 'payment_review', 0, 1),
('fraud', 'processing', 0, 1),
('holded', 'holded', 1, 1),
('payment_review', 'payment_review', 1, 1),
('pending', 'new', 1, 1),
('pending_payment', 'pending_payment', 1, 0),
('processing', 'processing', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_tax`
--

CREATE TABLE `sales_order_tax` (
  `tax_id` int UNSIGNED NOT NULL COMMENT 'Tax ID',
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(20,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int NOT NULL COMMENT 'Priority',
  `position` int NOT NULL COMMENT 'Position',
  `base_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Real Amount'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Tax Table';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_tax_item`
--

CREATE TABLE `sales_order_tax_item` (
  `tax_item_id` int UNSIGNED NOT NULL COMMENT 'Tax Item ID',
  `tax_id` int UNSIGNED NOT NULL COMMENT 'Tax ID',
  `item_id` int UNSIGNED DEFAULT NULL COMMENT 'Item ID',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(20,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(20,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(20,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(20,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int UNSIGNED DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Tax Item';

-- --------------------------------------------------------

--
-- Table structure for table `sales_payment_transaction`
--

CREATE TABLE `sales_payment_transaction` (
  `transaction_id` int UNSIGNED NOT NULL COMMENT 'Transaction ID',
  `parent_id` int UNSIGNED DEFAULT NULL COMMENT 'Parent ID',
  `order_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Order ID',
  `payment_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Payment ID',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn ID',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn ID',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Payment Transaction';

-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated`
--

CREATE TABLE `sales_refunded_aggregated` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(20,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Offline Refunded'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Refunded Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated_order`
--

CREATE TABLE `sales_refunded_aggregated_order` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(20,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Offline Refunded'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Refunded Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `sales_sequence_meta`
--

CREATE TABLE `sales_sequence_meta` (
  `meta_id` int UNSIGNED NOT NULL COMMENT 'ID',
  `entity_type` varchar(32) NOT NULL COMMENT 'Prefix',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `sequence_table` varchar(64) NOT NULL COMMENT 'table for sequence'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='sales_sequence_meta';

--
-- Dumping data for table `sales_sequence_meta`
--

INSERT INTO `sales_sequence_meta` (`meta_id`, `entity_type`, `store_id`, `sequence_table`) VALUES
(1, 'order', 0, 'sequence_order_0'),
(2, 'invoice', 0, 'sequence_invoice_0'),
(3, 'creditmemo', 0, 'sequence_creditmemo_0'),
(4, 'shipment', 0, 'sequence_shipment_0'),
(5, 'order', 1, 'sequence_order_1'),
(6, 'invoice', 1, 'sequence_invoice_1'),
(7, 'creditmemo', 1, 'sequence_creditmemo_1'),
(8, 'shipment', 1, 'sequence_shipment_1');

-- --------------------------------------------------------

--
-- Table structure for table `sales_sequence_profile`
--

CREATE TABLE `sales_sequence_profile` (
  `profile_id` int UNSIGNED NOT NULL COMMENT 'ID',
  `meta_id` int UNSIGNED NOT NULL COMMENT 'Meta_id',
  `prefix` varchar(32) DEFAULT NULL COMMENT 'Prefix',
  `suffix` varchar(32) DEFAULT NULL COMMENT 'Suffix',
  `start_value` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Start value for sequence',
  `step` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Step for sequence',
  `max_value` int UNSIGNED NOT NULL COMMENT 'MaxValue for sequence',
  `warning_value` int UNSIGNED NOT NULL COMMENT 'WarningValue for sequence',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'isActive flag'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='sales_sequence_profile';

--
-- Dumping data for table `sales_sequence_profile`
--

INSERT INTO `sales_sequence_profile` (`profile_id`, `meta_id`, `prefix`, `suffix`, `start_value`, `step`, `max_value`, `warning_value`, `is_active`) VALUES
(1, 1, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(2, 2, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(3, 3, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(4, 4, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(5, 5, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(6, 6, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(7, 7, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(8, 8, NULL, NULL, 1, 1, 4294967295, 4294966295, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment`
--

CREATE TABLE `sales_shipment` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint UNSIGNED DEFAULT NULL COMMENT 'Send Email',
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order ID',
  `customer_id` int DEFAULT NULL COMMENT 'Customer ID',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `shipment_status` int DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint UNSIGNED DEFAULT NULL COMMENT 'Customer Note Notify'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment';

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_comment`
--

CREATE TABLE `sales_shipment_comment` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Comment';

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_grid`
--

CREATE TABLE `sales_shipment_grid` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_increment_id` varchar(32) NOT NULL COMMENT 'Order Increment ID',
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order ID',
  `order_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Order Increment ID',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `shipment_status` int DEFAULT NULL COMMENT 'Shipment Status',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `billing_name` varchar(128) DEFAULT NULL COMMENT 'Billing Name',
  `shipping_name` varchar(128) DEFAULT NULL COMMENT 'Shipping Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_item`
--

CREATE TABLE `sales_shipment_item` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(20,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Item';

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_track`
--

CREATE TABLE `sales_shipment_track` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `parent_id` int UNSIGNED NOT NULL COMMENT 'Parent ID',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int UNSIGNED NOT NULL COMMENT 'Order ID',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Track';

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated`
--

CREATE TABLE `sales_shipping_aggregated` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Shipping Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated_order`
--

CREATE TABLE `sales_shipping_aggregated_order` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Shipping Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `search_query`
--

CREATE TABLE `search_query` (
  `query_id` int UNSIGNED NOT NULL COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Search query table';

-- --------------------------------------------------------

--
-- Table structure for table `search_synonyms`
--

CREATE TABLE `search_synonyms` (
  `group_id` bigint UNSIGNED NOT NULL COMMENT 'Synonyms Group ID',
  `synonyms` text NOT NULL COMMENT 'list of synonyms making up this group',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID - identifies the store view these synonyms belong to',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID - identifies the website ID these synonyms belong to'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='table storing various synonyms groups';

-- --------------------------------------------------------

--
-- Table structure for table `sendfriend_log`
--

CREATE TABLE `sendfriend_log` (
  `log_id` int UNSIGNED NOT NULL COMMENT 'Log ID',
  `ip` bigint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Send to friend function log storage table';

-- --------------------------------------------------------

--
-- Table structure for table `sequence_creditmemo_0`
--

CREATE TABLE `sequence_creditmemo_0` (
  `sequence_value` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_creditmemo_1`
--

CREATE TABLE `sequence_creditmemo_1` (
  `sequence_value` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_invoice_0`
--

CREATE TABLE `sequence_invoice_0` (
  `sequence_value` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_invoice_1`
--

CREATE TABLE `sequence_invoice_1` (
  `sequence_value` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_order_0`
--

CREATE TABLE `sequence_order_0` (
  `sequence_value` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_order_1`
--

CREATE TABLE `sequence_order_1` (
  `sequence_value` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_shipment_0`
--

CREATE TABLE `sequence_shipment_0` (
  `sequence_value` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_shipment_1`
--

CREATE TABLE `sequence_shipment_1` (
  `sequence_value` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Database Sessions Storage';

-- --------------------------------------------------------

--
-- Table structure for table `setup_module`
--

CREATE TABLE `setup_module` (
  `module` varchar(50) NOT NULL COMMENT 'Module',
  `schema_version` varchar(50) DEFAULT NULL COMMENT 'Schema Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Module versions registry';

--
-- Dumping data for table `setup_module`
--

INSERT INTO `setup_module` (`module`, `schema_version`, `data_version`) VALUES
('Magento_DataExporter', '42.0.1', '42.0.1'),
('Magento_QueryXml', '42.0.0', '42.0.0'),
('Magento_Securitytxt', '1.0.0', '1.0.0'),
('Magento_ServicesConnector', '1.1.0', '1.1.0'),
('Magento_ServicesId', '1.1.0', '1.1.0'),
('Magento_ServicesIdLayout', '1.0.0', '1.0.0'),
('PayPal_Braintree', '4.6.1', '4.6.1');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_tablerate`
--

CREATE TABLE `shipping_tablerate` (
  `pk` int UNSIGNED NOT NULL COMMENT 'Primary key',
  `website_id` int NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int NOT NULL DEFAULT '0' COMMENT 'Destination Region ID',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(30) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Shipping Tablerate';

-- --------------------------------------------------------

--
-- Table structure for table `sitemap`
--

CREATE TABLE `sitemap` (
  `sitemap_id` int UNSIGNED NOT NULL COMMENT 'Sitemap ID',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='XML Sitemap';

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `group_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Group ID',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Activity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Stores';

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`) VALUES
(0, 'admin', 0, 0, 'Admin', 0, 1),
(1, 'default', 1, 1, 'Default Store View', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stores_data_exporter`
--

CREATE TABLE `stores_data_exporter` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `feed_data` mediumtext NOT NULL COMMENT 'Feed Data',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Modified At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Stores Feed Storage';

--
-- Dumping data for table `stores_data_exporter`
--

INSERT INTO `stores_data_exporter` (`id`, `feed_data`, `modified_at`) VALUES
(1, '{\"store_view_id\":\"1\",\"store_id\":1,\"website_id\":1,\"store_view_name\":\"Default Store View\",\"store_name\":\"Main Website Store\",\"website_name\":\"Main Website\"}', '2024-09-28 14:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `stores_data_exporter_index_batches`
--

CREATE TABLE `stores_data_exporter_index_batches` (
  `batch_number` int NOT NULL COMMENT 'Batch Number',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='stores_data_exporter_index_batches';

--
-- Dumping data for table `stores_data_exporter_index_batches`
--

INSERT INTO `stores_data_exporter_index_batches` (`batch_number`, `website_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stores_data_exporter_index_sequence`
--

CREATE TABLE `stores_data_exporter_index_sequence` (
  `i` int UNSIGNED NOT NULL COMMENT 'Auto Increment ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='stores_data_exporter_index_sequence';

--
-- Dumping data for table `stores_data_exporter_index_sequence`
--

INSERT INTO `stores_data_exporter_index_sequence` (`i`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Table structure for table `store_data_exporter_cl`
--

CREATE TABLE `store_data_exporter_cl` (
  `version_id` int UNSIGNED NOT NULL COMMENT 'Version ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='store_data_exporter_cl';

-- --------------------------------------------------------

--
-- Table structure for table `store_group`
--

CREATE TABLE `store_group` (
  `group_id` smallint UNSIGNED NOT NULL COMMENT 'Group ID',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Root Category ID',
  `default_store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Default Store ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Store group unique code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Store Groups';

--
-- Dumping data for table `store_group`
--

INSERT INTO `store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`, `code`) VALUES
(0, 0, 'Default', 0, 0, 'default'),
(1, 1, 'Main Website Store', 2, 1, 'main_website_store');

-- --------------------------------------------------------

--
-- Table structure for table `store_website`
--

CREATE TABLE `store_website` (
  `website_id` smallint UNSIGNED NOT NULL COMMENT 'Website ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Default Group ID',
  `is_default` smallint UNSIGNED DEFAULT '0' COMMENT 'Defines Is Website Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Websites';

--
-- Dumping data for table `store_website`
--

INSERT INTO `store_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`) VALUES
(0, 'admin', 'Admin', 0, 0, 0),
(1, 'base', 'Main Website', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation`
--

CREATE TABLE `tax_calculation` (
  `tax_calculation_id` int NOT NULL COMMENT 'Tax Calculation ID',
  `tax_calculation_rate_id` int NOT NULL COMMENT 'Tax Calculation Rate ID',
  `tax_calculation_rule_id` int NOT NULL COMMENT 'Tax Calculation Rule ID',
  `customer_tax_class_id` smallint NOT NULL COMMENT 'Customer Tax Class ID',
  `product_tax_class_id` smallint NOT NULL COMMENT 'Product Tax Class ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation';

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate`
--

CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int NOT NULL COMMENT 'Tax Calculation Rate ID',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country ID',
  `tax_region_id` int NOT NULL COMMENT 'Tax Region ID',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int UNSIGNED DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int UNSIGNED DEFAULT NULL COMMENT 'Zip To'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation Rate';

--
-- Dumping data for table `tax_calculation_rate`
--

INSERT INTO `tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`) VALUES
(1, 'US', 12, '*', 'US-CA-*-Rate 1', 8.2500, NULL, NULL, NULL),
(2, 'US', 43, '*', 'US-NY-*-Rate 1', 8.3750, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate_title`
--

CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int NOT NULL COMMENT 'Tax Calculation Rate Title ID',
  `tax_calculation_rate_id` int NOT NULL COMMENT 'Tax Calculation Rate ID',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` varchar(255) NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation Rate Title';

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rule`
--

CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int NOT NULL COMMENT 'Tax Calculation Rule ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int NOT NULL COMMENT 'Priority',
  `position` int NOT NULL COMMENT 'Position',
  `calculate_subtotal` int NOT NULL COMMENT 'Calculate off subtotal option'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation Rule';

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE `tax_class` (
  `class_id` smallint NOT NULL COMMENT 'Class ID',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Class';

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`class_id`, `class_name`, `class_type`) VALUES
(2, 'Taxable Goods', 'PRODUCT'),
(3, 'Retail Customer', 'CUSTOMER');

-- --------------------------------------------------------

--
-- Table structure for table `tax_order_aggregated_created`
--

CREATE TABLE `tax_order_aggregated_created` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Order Aggregation';

-- --------------------------------------------------------

--
-- Table structure for table `tax_order_aggregated_updated`
--

CREATE TABLE `tax_order_aggregated_updated` (
  `id` int UNSIGNED NOT NULL COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Order Aggregated Updated';

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `theme_id` int UNSIGNED NOT NULL COMMENT 'Theme identifier',
  `parent_id` int DEFAULT NULL COMMENT 'Parent ID',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text COMMENT 'Full theme code, including package'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Core theme';

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`theme_id`, `parent_id`, `theme_path`, `theme_title`, `preview_image`, `is_featured`, `area`, `type`, `code`) VALUES
(1, NULL, 'Magento/blank', 'Magento Blank', 'preview_image_66defe64a4bb1.jpeg', 0, 'frontend', 0, 'Magento/blank'),
(2, NULL, 'Magento/backend', 'Magento 2 backend', NULL, 0, 'adminhtml', 0, 'Magento/backend'),
(3, 1, 'Magento/luma', 'Magento Luma', 'preview_image_66defe64af928.jpeg', 0, 'frontend', 0, 'Magento/luma');

-- --------------------------------------------------------

--
-- Table structure for table `theme_file`
--

CREATE TABLE `theme_file` (
  `theme_files_id` int UNSIGNED NOT NULL COMMENT 'Theme files identifier',
  `theme_id` int UNSIGNED NOT NULL COMMENT 'Theme ID',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Temporary File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Core theme files';

-- --------------------------------------------------------

--
-- Table structure for table `translation`
--

CREATE TABLE `translation` (
  `key_id` int UNSIGNED NOT NULL COMMENT 'Key ID of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Translations';

-- --------------------------------------------------------

--
-- Table structure for table `ui_bookmark`
--

CREATE TABLE `ui_bookmark` (
  `bookmark_id` int UNSIGNED NOT NULL COMMENT 'Bookmark identifier',
  `user_id` int UNSIGNED NOT NULL COMMENT 'User ID',
  `namespace` varchar(255) NOT NULL COMMENT 'Bookmark namespace',
  `identifier` varchar(255) NOT NULL COMMENT 'Bookmark Identifier',
  `current` smallint NOT NULL COMMENT 'Mark current bookmark per user and identifier',
  `title` varchar(255) DEFAULT NULL COMMENT 'Bookmark title',
  `config` longtext COMMENT 'Bookmark config',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bookmark created at',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Bookmark updated at'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Bookmark';

--
-- Dumping data for table `ui_bookmark`
--

INSERT INTO `ui_bookmark` (`bookmark_id`, `user_id`, `namespace`, `identifier`, `current`, `title`, `config`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer_group_listing', 'default', 1, 'Default View', '{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"columns\":{\"customer_group_id\":{\"visible\":true,\"sorting\":\"asc\"},\"customer_group_code\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"tax_class_id\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"filters\":{\"applied\":{\"placeholder\":true}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"customer_group_id\":0,\"customer_group_code\":1,\"tax_class_id\":2,\"actions\":3}},\"value\":\"Default View\"}}}', '2024-09-15 15:13:41', '2024-09-15 15:13:41'),
(2, 1, 'customer_group_listing', 'current', 0, NULL, '{\"current\":{\"columns\":{\"customer_group_id\":{\"visible\":true,\"sorting\":\"asc\"},\"customer_group_code\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"tax_class_id\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"filters\":{\"applied\":{\"placeholder\":true}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"customer_group_id\":0,\"customer_group_code\":1,\"tax_class_id\":2,\"actions\":3}}}', '2024-09-15 15:13:42', '2024-09-15 15:13:42'),
(3, 1, 'sales_order_grid', 'default', 1, 'Default View', '{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"increment_id\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"billing_name\":{\"visible\":true,\"sorting\":false},\"shipping_name\":{\"visible\":true,\"sorting\":false},\"base_grand_total\":{\"visible\":true,\"sorting\":false},\"grand_total\":{\"visible\":true,\"sorting\":false},\"billing_address\":{\"visible\":false,\"sorting\":false},\"shipping_address\":{\"visible\":false,\"sorting\":false},\"shipping_information\":{\"visible\":false,\"sorting\":false},\"customer_email\":{\"visible\":false,\"sorting\":false},\"subtotal\":{\"visible\":false,\"sorting\":false},\"shipping_and_handling\":{\"visible\":false,\"sorting\":false},\"customer_name\":{\"visible\":false,\"sorting\":false},\"total_refunded\":{\"visible\":false,\"sorting\":false},\"pickup_location_code\":{\"visible\":false,\"sorting\":false},\"transaction_source\":{\"visible\":true,\"sorting\":false},\"dispute_status\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"customer_group\":{\"visible\":false,\"sorting\":false},\"payment_method\":{\"visible\":false,\"sorting\":false},\"allocated_sources\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"created_at\":{\"visible\":true,\"sorting\":\"desc\"}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"displayMode\":\"grid\",\"search\":{\"value\":\"\"},\"positions\":{\"ids\":0,\"increment_id\":1,\"store_id\":2,\"created_at\":3,\"billing_name\":4,\"shipping_name\":5,\"base_grand_total\":6,\"grand_total\":7,\"status\":8,\"billing_address\":9,\"shipping_address\":10,\"shipping_information\":11,\"customer_email\":12,\"customer_group\":13,\"subtotal\":14,\"shipping_and_handling\":15,\"customer_name\":16,\"payment_method\":17,\"total_refunded\":18,\"actions\":19,\"allocated_sources\":20,\"pickup_location_code\":21,\"transaction_source\":22,\"dispute_status\":23}},\"value\":\"Default View\"}}}', '2024-09-15 15:13:47', '2024-09-15 15:13:47'),
(4, 1, 'sales_order_grid', 'current', 0, NULL, '{\"current\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"increment_id\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"billing_name\":{\"visible\":true,\"sorting\":false},\"shipping_name\":{\"visible\":true,\"sorting\":false},\"base_grand_total\":{\"visible\":true,\"sorting\":false},\"grand_total\":{\"visible\":true,\"sorting\":false},\"billing_address\":{\"visible\":false,\"sorting\":false},\"shipping_address\":{\"visible\":false,\"sorting\":false},\"shipping_information\":{\"visible\":false,\"sorting\":false},\"customer_email\":{\"visible\":false,\"sorting\":false},\"subtotal\":{\"visible\":false,\"sorting\":false},\"shipping_and_handling\":{\"visible\":false,\"sorting\":false},\"customer_name\":{\"visible\":false,\"sorting\":false},\"total_refunded\":{\"visible\":false,\"sorting\":false},\"pickup_location_code\":{\"visible\":false,\"sorting\":false},\"transaction_source\":{\"visible\":true,\"sorting\":false},\"dispute_status\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"customer_group\":{\"visible\":false,\"sorting\":false},\"payment_method\":{\"visible\":false,\"sorting\":false},\"allocated_sources\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"created_at\":{\"visible\":true,\"sorting\":\"desc\"}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"displayMode\":\"grid\",\"search\":{\"value\":\"\"},\"positions\":{\"ids\":0,\"increment_id\":1,\"store_id\":2,\"created_at\":3,\"billing_name\":4,\"shipping_name\":5,\"base_grand_total\":6,\"grand_total\":7,\"status\":8,\"billing_address\":9,\"shipping_address\":10,\"shipping_information\":11,\"customer_email\":12,\"customer_group\":13,\"subtotal\":14,\"shipping_and_handling\":15,\"customer_name\":16,\"payment_method\":17,\"total_refunded\":18,\"actions\":19,\"allocated_sources\":20,\"pickup_location_code\":21,\"transaction_source\":22,\"dispute_status\":23}}}', '2024-09-15 15:13:48', '2024-09-15 15:13:48');

-- --------------------------------------------------------

--
-- Table structure for table `url_rewrite`
--

CREATE TABLE `url_rewrite` (
  `url_rewrite_id` int UNSIGNED NOT NULL COMMENT 'Rewrite ID',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Redirect Type',
  `store_id` smallint UNSIGNED NOT NULL COMMENT 'Store ID',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Url Rewrites';

--
-- Dumping data for table `url_rewrite`
--

INSERT INTO `url_rewrite` (`url_rewrite_id`, `entity_type`, `entity_id`, `request_path`, `target_path`, `redirect_type`, `store_id`, `description`, `is_autogenerated`, `metadata`) VALUES
(1, 'cms-page', 1, 'no-route', 'cms/page/view/page_id/1', 0, 1, NULL, 1, NULL),
(2, 'cms-page', 2, 'home', 'cms/page/view/page_id/2', 0, 1, NULL, 1, NULL),
(3, 'cms-page', 3, 'enable-cookies', 'cms/page/view/page_id/3', 0, 1, NULL, 1, NULL),
(4, 'cms-page', 4, 'privacy-policy-cookie-restriction-mode', 'cms/page/view/page_id/4', 0, 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE `variable` (
  `variable_id` int UNSIGNED NOT NULL COMMENT 'Variable ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Variables';

-- --------------------------------------------------------

--
-- Table structure for table `variable_value`
--

CREATE TABLE `variable_value` (
  `value_id` int UNSIGNED NOT NULL COMMENT 'Variable Value ID',
  `variable_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Variable ID',
  `store_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Variable Value';

-- --------------------------------------------------------

--
-- Table structure for table `vault_payment_token`
--

CREATE TABLE `vault_payment_token` (
  `entity_id` int UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `website_id` int UNSIGNED DEFAULT NULL COMMENT 'Website ID',
  `public_hash` varchar(128) NOT NULL COMMENT 'Hash code for using on frontend',
  `payment_method_code` varchar(128) NOT NULL COMMENT 'Payment method code',
  `type` varchar(128) NOT NULL COMMENT 'Type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Expires At',
  `gateway_token` varchar(255) NOT NULL COMMENT 'Gateway Token',
  `details` text COMMENT 'Details',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Vault tokens of payment';

-- --------------------------------------------------------

--
-- Table structure for table `vault_payment_token_order_payment_link`
--

CREATE TABLE `vault_payment_token_order_payment_link` (
  `order_payment_id` int UNSIGNED NOT NULL COMMENT 'Order payment ID',
  `payment_token_id` int UNSIGNED NOT NULL COMMENT 'Payment token ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Order payments to vault token';

-- --------------------------------------------------------

--
-- Table structure for table `weee_tax`
--

CREATE TABLE `weee_tax` (
  `value_id` int NOT NULL COMMENT 'Value ID',
  `website_id` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `entity_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` int NOT NULL DEFAULT '0' COMMENT 'State',
  `attribute_id` smallint UNSIGNED NOT NULL COMMENT 'Attribute ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Weee Tax';

-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

CREATE TABLE `widget` (
  `widget_id` int UNSIGNED NOT NULL COMMENT 'Widget ID',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Preconfigured Widgets';

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance`
--

CREATE TABLE `widget_instance` (
  `instance_id` int UNSIGNED NOT NULL COMMENT 'Instance ID',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int UNSIGNED NOT NULL COMMENT 'Theme ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Instances of Widget for Package Theme';

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page`
--

CREATE TABLE `widget_instance_page` (
  `page_id` int UNSIGNED NOT NULL COMMENT 'Page ID',
  `instance_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Instance ID',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Instance of Widget on Page';

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page_layout`
--

CREATE TABLE `widget_instance_page_layout` (
  `page_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Page ID',
  `layout_update_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Layout Update ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Layout updates';

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int UNSIGNED NOT NULL COMMENT 'Wishlist ID',
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Wishlist main Table';

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item`
--

CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int UNSIGNED NOT NULL COMMENT 'Wishlist item ID',
  `wishlist_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Wishlist items';

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item_option`
--

CREATE TABLE `wishlist_item_option` (
  `option_id` int UNSIGNED NOT NULL COMMENT 'Option ID',
  `wishlist_item_id` int UNSIGNED NOT NULL COMMENT 'Wishlist Item ID',
  `product_id` int UNSIGNED NOT NULL COMMENT 'Product ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Wishlist Item Option Table';

-- --------------------------------------------------------

--
-- Structure for view `inventory_stock_1`
--
DROP TABLE IF EXISTS `inventory_stock_1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`khanh13`@`localhost` SQL SECURITY INVOKER VIEW `inventory_stock_1`  AS SELECT DISTINCT `legacy_stock_status`.`product_id` AS `product_id`, `legacy_stock_status`.`website_id` AS `website_id`, `legacy_stock_status`.`stock_id` AS `stock_id`, `legacy_stock_status`.`qty` AS `quantity`, `legacy_stock_status`.`stock_status` AS `is_salable`, `product`.`sku` AS `sku` FROM (`cataloginventory_stock_status` `legacy_stock_status` join `catalog_product_entity` `product` on((`legacy_stock_status`.`product_id` = `product`.`entity_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminnotification_inbox`
--
ALTER TABLE `adminnotification_inbox`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  ADD KEY `ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  ADD KEY `ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`);

--
-- Indexes for table `admin_adobe_ims_webapi`
--
ALTER TABLE `admin_adobe_ims_webapi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ADMIN_ADOBE_IMS_WEBAPI_ACCESS_TOKEN_HASH` (`access_token_hash`),
  ADD KEY `ADMIN_ADOBE_IMS_WEBAPI_ADMIN_USER_ID` (`admin_user_id`);

--
-- Indexes for table `admin_analytics_usage_version_log`
--
ALTER TABLE `admin_analytics_usage_version_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ADMIN_ANALYTICS_USAGE_VERSION_LOG_LAST_VIEWED_IN_VERSION` (`last_viewed_in_version`);

--
-- Indexes for table `admin_passwords`
--
ALTER TABLE `admin_passwords`
  ADD PRIMARY KEY (`password_id`),
  ADD KEY `ADMIN_PASSWORDS_USER_ID` (`user_id`);

--
-- Indexes for table `admin_system_messages`
--
ALTER TABLE `admin_system_messages`
  ADD PRIMARY KEY (`identity`);

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `ADMIN_USER_USERNAME` (`username`);

--
-- Indexes for table `admin_user_expiration`
--
ALTER TABLE `admin_user_expiration`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `admin_user_session`
--
ALTER TABLE `admin_user_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  ADD KEY `ADMIN_USER_SESSION_USER_ID` (`user_id`);

--
-- Indexes for table `adobe_stock_asset`
--
ALTER TABLE `adobe_stock_asset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` (`media_gallery_id`),
  ADD KEY `ADOBE_STOCK_ASSET_ID` (`id`),
  ADD KEY `ADOBE_STOCK_ASSET_CATEGORY_ID` (`category_id`),
  ADD KEY `ADOBE_STOCK_ASSET_CREATOR_ID` (`creator_id`);

--
-- Indexes for table `adobe_stock_category`
--
ALTER TABLE `adobe_stock_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ADOBE_STOCK_CATEGORY_ID` (`id`);

--
-- Indexes for table `adobe_stock_creator`
--
ALTER TABLE `adobe_stock_creator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ADOBE_STOCK_CREATOR_ID` (`id`);

--
-- Indexes for table `adobe_user_profile`
--
ALTER TABLE `adobe_user_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ADOBE_USER_PROFILE_ADMIN_USER_ID` (`admin_user_id`);

--
-- Indexes for table `authorization_role`
--
ALTER TABLE `authorization_role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  ADD KEY `AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`);

--
-- Indexes for table `authorization_rule`
--
ALTER TABLE `authorization_rule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  ADD KEY `AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`);

--
-- Indexes for table `braintree_credit_prices`
--
ALTER TABLE `braintree_credit_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BRAINTREE_CREDIT_PRICES_PRODUCT_ID_TERM` (`product_id`,`term`),
  ADD KEY `BRAINTREE_CREDIT_PRICES_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `braintree_transaction_details`
--
ALTER TABLE `braintree_transaction_details`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `BRAINTREE_TRANSACTION_DETAILS_ORDER_ID` (`order_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CACHE_EXPIRE_TIME` (`expire_time`);

--
-- Indexes for table `cache_tag`
--
ALTER TABLE `cache_tag`
  ADD PRIMARY KEY (`tag`,`cache_id`),
  ADD KEY `CACHE_TAG_CACHE_ID` (`cache_id`);

--
-- Indexes for table `captcha_log`
--
ALTER TABLE `captcha_log`
  ADD PRIMARY KEY (`type`,`value`);

--
-- Indexes for table `cataloginventory_stock`
--
ALTER TABLE `cataloginventory_stock`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `cataloginventory_stock_item`
--
ALTER TABLE `cataloginventory_stock_item`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID_PRODUCT_ID` (`website_id`,`product_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`);

--
-- Indexes for table `cataloginventory_stock_status`
--
ALTER TABLE `cataloginventory_stock_status`
  ADD PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`);

--
-- Indexes for table `cataloginventory_stock_status_idx`
--
ALTER TABLE `cataloginventory_stock_status_idx`
  ADD PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `cataloginventory_stock_status_replica`
--
ALTER TABLE `cataloginventory_stock_status_replica`
  ADD PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`);

--
-- Indexes for table `cataloginventory_stock_status_tmp`
--
ALTER TABLE `cataloginventory_stock_status_tmp`
  ADD PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  ADD KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalogrule`
--
ALTER TABLE `catalogrule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`);

--
-- Indexes for table `catalogrule_customer_group`
--
ALTER TABLE `catalogrule_customer_group`
  ADD PRIMARY KEY (`rule_id`,`customer_group_id`),
  ADD KEY `CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`);

--
-- Indexes for table `catalogrule_group_website`
--
ALTER TABLE `catalogrule_group_website`
  ADD PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  ADD KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalogrule_group_website_replica`
--
ALTER TABLE `catalogrule_group_website_replica`
  ADD PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  ADD KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalogrule_product`
--
ALTER TABLE `catalogrule_product`
  ADD PRIMARY KEY (`rule_product_id`),
  ADD UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  ADD KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  ADD KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  ADD KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  ADD KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalogrule_product_price`
--
ALTER TABLE `catalogrule_product_price`
  ADD PRIMARY KEY (`rule_product_price_id`),
  ADD UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  ADD KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  ADD KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalogrule_product_price_replica`
--
ALTER TABLE `catalogrule_product_price_replica`
  ADD PRIMARY KEY (`rule_product_price_id`),
  ADD UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  ADD KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  ADD KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalogrule_product_replica`
--
ALTER TABLE `catalogrule_product_replica`
  ADD PRIMARY KEY (`rule_product_id`),
  ADD UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  ADD KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  ADD KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  ADD KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  ADD KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalogrule_website`
--
ALTER TABLE `catalogrule_website`
  ADD PRIMARY KEY (`rule_id`,`website_id`),
  ADD KEY `CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalogsearch_recommendations`
--
ALTER TABLE `catalogsearch_recommendations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` (`query_id`),
  ADD KEY `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` (`relation_id`);

--
-- Indexes for table `catalog_category_entity`
--
ALTER TABLE `catalog_category_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_PATH` (`path`);

--
-- Indexes for table `catalog_category_entity_datetime`
--
ALTER TABLE `catalog_category_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_category_entity_decimal`
--
ALTER TABLE `catalog_category_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_category_entity_int`
--
ALTER TABLE `catalog_category_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_category_entity_text`
--
ALTER TABLE `catalog_category_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_category_entity_varchar`
--
ALTER TABLE `catalog_category_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_category_product`
--
ALTER TABLE `catalog_category_product`
  ADD PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  ADD UNIQUE KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  ADD KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalog_category_product_cl`
--
ALTER TABLE `catalog_category_product_cl`
  ADD PRIMARY KEY (`version_id`);

--
-- Indexes for table `catalog_category_product_index`
--
ALTER TABLE `catalog_category_product_index`
  ADD PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  ADD KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  ADD KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`);

--
-- Indexes for table `catalog_category_product_index_replica`
--
ALTER TABLE `catalog_category_product_index_replica`
  ADD PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  ADD KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  ADD KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`);

--
-- Indexes for table `catalog_category_product_index_store1`
--
ALTER TABLE `catalog_category_product_index_store1`
  ADD PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  ADD KEY `IDX_4B965DC45C352D6E4C9DC0FF50B1FCF5` (`product_id`,`store_id`,`category_id`,`visibility`),
  ADD KEY `IDX_47AB760CD6A893ACEA69A9C2E0112C60` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`);

--
-- Indexes for table `catalog_category_product_index_store1_replica`
--
ALTER TABLE `catalog_category_product_index_store1_replica`
  ADD PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  ADD KEY `CAT_CTGR_PRD_IDX_STORE1_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  ADD KEY `IDX_216E521C8AD125E066D2B0BAB4A08412` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`);

--
-- Indexes for table `catalog_category_product_index_tmp`
--
ALTER TABLE `catalog_category_product_index_tmp`
  ADD PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  ADD KEY `CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`);

--
-- Indexes for table `catalog_compare_item`
--
ALTER TABLE `catalog_compare_item`
  ADD PRIMARY KEY (`catalog_compare_item_id`),
  ADD KEY `CATALOG_COMPARE_ITEM_LIST_ID_CATALOG_COMPARE_LIST_LIST_ID` (`list_id`),
  ADD KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  ADD KEY `CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  ADD KEY `CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  ADD KEY `CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_compare_list`
--
ALTER TABLE `catalog_compare_list`
  ADD PRIMARY KEY (`list_id`),
  ADD UNIQUE KEY `CATALOG_COMPARE_LIST_CUSTOMER_ID` (`customer_id`),
  ADD KEY `CATALOG_COMPARE_LIST_LIST_ID_MASK` (`list_id_mask`);

--
-- Indexes for table `catalog_eav_attribute`
--
ALTER TABLE `catalog_eav_attribute`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  ADD KEY `CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`);

--
-- Indexes for table `catalog_product_bundle_option`
--
ALTER TABLE `catalog_product_bundle_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`);

--
-- Indexes for table `catalog_product_bundle_option_value`
--
ALTER TABLE `catalog_product_bundle_option_value`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID` (`option_id`,`parent_product_id`,`store_id`);

--
-- Indexes for table `catalog_product_bundle_price_index`
--
ALTER TABLE `catalog_product_bundle_price_index`
  ADD PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  ADD KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  ADD KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`);

--
-- Indexes for table `catalog_product_bundle_selection`
--
ALTER TABLE `catalog_product_bundle_selection`
  ADD PRIMARY KEY (`selection_id`),
  ADD KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  ADD KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalog_product_bundle_selection_price`
--
ALTER TABLE `catalog_product_bundle_selection_price`
  ADD PRIMARY KEY (`selection_id`,`parent_product_id`,`website_id`),
  ADD KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalog_product_bundle_stock_index`
--
ALTER TABLE `catalog_product_bundle_stock_index`
  ADD PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`);

--
-- Indexes for table `catalog_product_entity`
--
ALTER TABLE `catalog_product_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_SKU` (`sku`);

--
-- Indexes for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_entity_decimal`
--
ALTER TABLE `catalog_product_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `catalog_product_entity_gallery`
--
ALTER TABLE `catalog_product_entity_gallery`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_entity_int`
--
ALTER TABLE `catalog_product_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID_STORE_ID_VALUE` (`attribute_id`,`store_id`,`value`);

--
-- Indexes for table `catalog_product_entity_media_gallery`
--
ALTER TABLE `catalog_product_entity_media_gallery`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `catalog_product_entity_media_gallery_value`
--
ALTER TABLE `catalog_product_entity_media_gallery_value`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`),
  ADD KEY `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_VAL_ID_STORE_ID` (`entity_id`,`value_id`,`store_id`);

--
-- Indexes for table `catalog_product_entity_media_gallery_value_to_entity`
--
ALTER TABLE `catalog_product_entity_media_gallery_value_to_entity`
  ADD PRIMARY KEY (`value_id`,`entity_id`),
  ADD KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` (`entity_id`);

--
-- Indexes for table `catalog_product_entity_media_gallery_value_video`
--
ALTER TABLE `catalog_product_entity_media_gallery_value_video`
  ADD PRIMARY KEY (`value_id`,`store_id`),
  ADD KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_entity_text`
--
ALTER TABLE `catalog_product_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_entity_tier_price`
--
ALTER TABLE `catalog_product_entity_tier_price`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalog_product_entity_varchar`
--
ALTER TABLE `catalog_product_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_frontend_action`
--
ALTER TABLE `catalog_product_frontend_action`
  ADD PRIMARY KEY (`action_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_VISITOR_ID_PRODUCT_ID_TYPE_ID` (`visitor_id`,`product_id`,`type_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_CUSTOMER_ID_PRODUCT_ID_TYPE_ID` (`customer_id`,`product_id`,`type_id`),
  ADD KEY `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`);

--
-- Indexes for table `catalog_product_index_eav`
--
ALTER TABLE `catalog_product_index_eav`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_decimal`
--
ALTER TABLE `catalog_product_index_eav_decimal`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_decimal_idx`
--
ALTER TABLE `catalog_product_index_eav_decimal_idx`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_decimal_replica`
--
ALTER TABLE `catalog_product_index_eav_decimal_replica`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_decimal_tmp`
--
ALTER TABLE `catalog_product_index_eav_decimal_tmp`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_idx`
--
ALTER TABLE `catalog_product_index_eav_idx`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_replica`
--
ALTER TABLE `catalog_product_index_eav_replica`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_eav_tmp`
--
ALTER TABLE `catalog_product_index_eav_tmp`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`);

--
-- Indexes for table `catalog_product_index_price`
--
ALTER TABLE `catalog_product_index_price`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  ADD KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`);

--
-- Indexes for table `catalog_product_index_price_bundle_idx`
--
ALTER TABLE `catalog_product_index_price_bundle_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_bundle_opt_idx`
--
ALTER TABLE `catalog_product_index_price_bundle_opt_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `catalog_product_index_price_bundle_opt_tmp`
--
ALTER TABLE `catalog_product_index_price_bundle_opt_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `catalog_product_index_price_bundle_sel_idx`
--
ALTER TABLE `catalog_product_index_price_bundle_sel_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`);

--
-- Indexes for table `catalog_product_index_price_bundle_sel_tmp`
--
ALTER TABLE `catalog_product_index_price_bundle_sel_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`);

--
-- Indexes for table `catalog_product_index_price_bundle_tmp`
--
ALTER TABLE `catalog_product_index_price_bundle_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_cfg_opt_agr_idx`
--
ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx`
  ADD PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_cfg_opt_agr_tmp`
--
ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp`
  ADD PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_cfg_opt_idx`
--
ALTER TABLE `catalog_product_index_price_cfg_opt_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_cfg_opt_tmp`
--
ALTER TABLE `catalog_product_index_price_cfg_opt_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_downlod_idx`
--
ALTER TABLE `catalog_product_index_price_downlod_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_downlod_tmp`
--
ALTER TABLE `catalog_product_index_price_downlod_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_final_idx`
--
ALTER TABLE `catalog_product_index_price_final_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_final_tmp`
--
ALTER TABLE `catalog_product_index_price_final_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_idx`
--
ALTER TABLE `catalog_product_index_price_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`);

--
-- Indexes for table `catalog_product_index_price_opt_agr_idx`
--
ALTER TABLE `catalog_product_index_price_opt_agr_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `catalog_product_index_price_opt_agr_tmp`
--
ALTER TABLE `catalog_product_index_price_opt_agr_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `catalog_product_index_price_opt_idx`
--
ALTER TABLE `catalog_product_index_price_opt_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_opt_tmp`
--
ALTER TABLE `catalog_product_index_price_opt_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `catalog_product_index_price_replica`
--
ALTER TABLE `catalog_product_index_price_replica`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  ADD KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`);

--
-- Indexes for table `catalog_product_index_price_tmp`
--
ALTER TABLE `catalog_product_index_price_tmp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_product_index_tier_price`
--
ALTER TABLE `catalog_product_index_tier_price`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalog_product_index_website`
--
ALTER TABLE `catalog_product_index_website`
  ADD PRIMARY KEY (`website_id`),
  ADD KEY `CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`);

--
-- Indexes for table `catalog_product_link`
--
ALTER TABLE `catalog_product_link`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_LINK_LINK_TYPE_ID_PRODUCT_ID_LINKED_PRODUCT_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  ADD KEY `CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  ADD KEY `CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`);

--
-- Indexes for table `catalog_product_link_attribute`
--
ALTER TABLE `catalog_product_link_attribute`
  ADD PRIMARY KEY (`product_link_attribute_id`),
  ADD KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`);

--
-- Indexes for table `catalog_product_link_attribute_decimal`
--
ALTER TABLE `catalog_product_link_attribute_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  ADD KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`);

--
-- Indexes for table `catalog_product_link_attribute_int`
--
ALTER TABLE `catalog_product_link_attribute_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  ADD KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`);

--
-- Indexes for table `catalog_product_link_attribute_varchar`
--
ALTER TABLE `catalog_product_link_attribute_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  ADD KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`);

--
-- Indexes for table `catalog_product_link_type`
--
ALTER TABLE `catalog_product_link_type`
  ADD PRIMARY KEY (`link_type_id`);

--
-- Indexes for table `catalog_product_option`
--
ALTER TABLE `catalog_product_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `catalog_product_option_price`
--
ALTER TABLE `catalog_product_option_price`
  ADD PRIMARY KEY (`option_price_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_option_title`
--
ALTER TABLE `catalog_product_option_title`
  ADD PRIMARY KEY (`option_title_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_option_type_price`
--
ALTER TABLE `catalog_product_option_type_price`
  ADD PRIMARY KEY (`option_type_price_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_option_type_title`
--
ALTER TABLE `catalog_product_option_type_title`
  ADD PRIMARY KEY (`option_type_title_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_option_type_value`
--
ALTER TABLE `catalog_product_option_type_value`
  ADD PRIMARY KEY (`option_type_id`),
  ADD KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`);

--
-- Indexes for table `catalog_product_relation`
--
ALTER TABLE `catalog_product_relation`
  ADD PRIMARY KEY (`parent_id`,`child_id`),
  ADD KEY `CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`);

--
-- Indexes for table `catalog_product_super_attribute`
--
ALTER TABLE `catalog_product_super_attribute`
  ADD PRIMARY KEY (`product_super_attribute_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`);

--
-- Indexes for table `catalog_product_super_attribute_label`
--
ALTER TABLE `catalog_product_super_attribute_label`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  ADD KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`);

--
-- Indexes for table `catalog_product_super_link`
--
ALTER TABLE `catalog_product_super_link`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  ADD KEY `CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`);

--
-- Indexes for table `catalog_product_website`
--
ALTER TABLE `catalog_product_website`
  ADD PRIMARY KEY (`product_id`,`website_id`),
  ADD KEY `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `catalog_url_rewrite_product_category`
--
ALTER TABLE `catalog_url_rewrite_product_category`
  ADD PRIMARY KEY (`url_rewrite_id`),
  ADD KEY `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  ADD KEY `CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`);

--
-- Indexes for table `checkout_agreement`
--
ALTER TABLE `checkout_agreement`
  ADD PRIMARY KEY (`agreement_id`);

--
-- Indexes for table `checkout_agreement_store`
--
ALTER TABLE `checkout_agreement_store`
  ADD PRIMARY KEY (`agreement_id`,`store_id`),
  ADD KEY `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `cms_block`
--
ALTER TABLE `cms_block`
  ADD PRIMARY KEY (`block_id`),
  ADD KEY `CMS_BLOCK_IDENTIFIER` (`identifier`);
ALTER TABLE `cms_block` ADD FULLTEXT KEY `CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`);

--
-- Indexes for table `cms_block_store`
--
ALTER TABLE `cms_block_store`
  ADD PRIMARY KEY (`block_id`,`store_id`),
  ADD KEY `CMS_BLOCK_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `cms_page`
--
ALTER TABLE `cms_page`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `CMS_PAGE_IDENTIFIER` (`identifier`);
ALTER TABLE `cms_page` ADD FULLTEXT KEY `CMS_PAGE_TITLE_META_KEYWORDS_META_DESCRIPTION_IDENTIFIER_CONTENT` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`);

--
-- Indexes for table `cms_page_store`
--
ALTER TABLE `cms_page_store`
  ADD PRIMARY KEY (`page_id`,`store_id`),
  ADD KEY `CMS_PAGE_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `core_config_data`
--
ALTER TABLE `core_config_data`
  ADD PRIMARY KEY (`config_id`),
  ADD UNIQUE KEY `CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`);

--
-- Indexes for table `cron_schedule`
--
ALTER TABLE `cron_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `CRON_SCHEDULE_JOB_CODE_STATUS_SCHEDULED_AT` (`job_code`,`status`,`scheduled_at`);

--
-- Indexes for table `customer_address_entity`
--
ALTER TABLE `customer_address_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`);

--
-- Indexes for table `customer_address_entity_datetime`
--
ALTER TABLE `customer_address_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_address_entity_decimal`
--
ALTER TABLE `customer_address_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_address_entity_int`
--
ALTER TABLE `customer_address_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_address_entity_text`
--
ALTER TABLE `customer_address_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `customer_address_entity_varchar`
--
ALTER TABLE `customer_address_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_dummy_cl`
--
ALTER TABLE `customer_dummy_cl`
  ADD PRIMARY KEY (`version_id`);

--
-- Indexes for table `customer_eav_attribute`
--
ALTER TABLE `customer_eav_attribute`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `CUSTOMER_EAV_ATTRIBUTE_SORT_ORDER` (`sort_order`);

--
-- Indexes for table `customer_eav_attribute_website`
--
ALTER TABLE `customer_eav_attribute_website`
  ADD PRIMARY KEY (`attribute_id`,`website_id`),
  ADD KEY `CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `customer_entity`
--
ALTER TABLE `customer_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  ADD KEY `CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  ADD KEY `CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  ADD KEY `CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  ADD KEY `CUSTOMER_ENTITY_LASTNAME` (`lastname`);

--
-- Indexes for table `customer_entity_datetime`
--
ALTER TABLE `customer_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_entity_decimal`
--
ALTER TABLE `customer_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_entity_int`
--
ALTER TABLE `customer_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_entity_text`
--
ALTER TABLE `customer_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `customer_entity_varchar`
--
ALTER TABLE `customer_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `customer_form_attribute`
--
ALTER TABLE `customer_form_attribute`
  ADD PRIMARY KEY (`form_code`,`attribute_id`),
  ADD KEY `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `customer_grid_flat`
--
ALTER TABLE `customer_grid_flat`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  ADD KEY `CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  ADD KEY `CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  ADD KEY `CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  ADD KEY `CUSTOMER_GRID_FLAT_DOB` (`dob`),
  ADD KEY `CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  ADD KEY `CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`);
ALTER TABLE `customer_grid_flat` ADD FULLTEXT KEY `FTI_8746F705702DD5F6D45B8C7CE7FE9F2F` (`name`,`email`,`created_in`,`taxvat`,`shipping_full`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`);

--
-- Indexes for table `customer_group`
--
ALTER TABLE `customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `customer_group_excluded_website`
--
ALTER TABLE `customer_group_excluded_website`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `CUSTOMER_GROUP_EXCLUDED_WEBSITE_CUSTOMER_GROUP_ID_WEBSITE_ID` (`customer_group_id`,`website_id`);

--
-- Indexes for table `customer_log`
--
ALTER TABLE `customer_log`
  ADD PRIMARY KEY (`log_id`),
  ADD UNIQUE KEY `CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `customer_visitor`
--
ALTER TABLE `customer_visitor`
  ADD PRIMARY KEY (`visitor_id`),
  ADD KEY `CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  ADD KEY `CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`);

--
-- Indexes for table `data_exporter_uuid`
--
ALTER TABLE `data_exporter_uuid`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `DATA_EXPORTER_UUID_ENTITY_ID_TYPE` (`entity_id`,`type`);

--
-- Indexes for table `design_change`
--
ALTER TABLE `design_change`
  ADD PRIMARY KEY (`design_change_id`),
  ADD KEY `DESIGN_CHANGE_STORE_ID` (`store_id`);

--
-- Indexes for table `design_config_dummy_cl`
--
ALTER TABLE `design_config_dummy_cl`
  ADD PRIMARY KEY (`version_id`);

--
-- Indexes for table `design_config_grid_flat`
--
ALTER TABLE `design_config_grid_flat`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID` (`store_website_id`),
  ADD KEY `DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID` (`store_group_id`),
  ADD KEY `DESIGN_CONFIG_GRID_FLAT_STORE_ID` (`store_id`);
ALTER TABLE `design_config_grid_flat` ADD FULLTEXT KEY `DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID` (`theme_theme_id`);

--
-- Indexes for table `directory_country`
--
ALTER TABLE `directory_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `directory_country_format`
--
ALTER TABLE `directory_country_format`
  ADD PRIMARY KEY (`country_format_id`),
  ADD UNIQUE KEY `DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`);

--
-- Indexes for table `directory_country_region`
--
ALTER TABLE `directory_country_region`
  ADD PRIMARY KEY (`region_id`),
  ADD KEY `DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`);

--
-- Indexes for table `directory_country_region_name`
--
ALTER TABLE `directory_country_region_name`
  ADD PRIMARY KEY (`locale`,`region_id`),
  ADD KEY `DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`);

--
-- Indexes for table `directory_currency_rate`
--
ALTER TABLE `directory_currency_rate`
  ADD PRIMARY KEY (`currency_from`,`currency_to`),
  ADD KEY `DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`);

--
-- Indexes for table `downloadable_link`
--
ALTER TABLE `downloadable_link`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`);

--
-- Indexes for table `downloadable_link_price`
--
ALTER TABLE `downloadable_link_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  ADD KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD PRIMARY KEY (`purchased_id`),
  ADD KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  ADD KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  ADD KEY `DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `downloadable_link_purchased_item`
--
ALTER TABLE `downloadable_link_purchased_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  ADD KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  ADD KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`);

--
-- Indexes for table `downloadable_link_title`
--
ALTER TABLE `downloadable_link_title`
  ADD PRIMARY KEY (`title_id`),
  ADD UNIQUE KEY `DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  ADD KEY `DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `downloadable_sample`
--
ALTER TABLE `downloadable_sample`
  ADD PRIMARY KEY (`sample_id`),
  ADD KEY `DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `downloadable_sample_title`
--
ALTER TABLE `downloadable_sample_title`
  ADD PRIMARY KEY (`title_id`),
  ADD UNIQUE KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  ADD KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD PRIMARY KEY (`attribute_id`),
  ADD UNIQUE KEY `EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  ADD KEY `EAV_ATTRIBUTE_FRONTEND_INPUT_ENTITY_TYPE_ID_IS_USER_DEFINED` (`frontend_input`,`entity_type_id`,`is_user_defined`);

--
-- Indexes for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`),
  ADD UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_CODE` (`attribute_set_id`,`attribute_group_code`),
  ADD UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  ADD KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`);

--
-- Indexes for table `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  ADD PRIMARY KEY (`attribute_label_id`),
  ADD KEY `EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  ADD KEY `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`);

--
-- Indexes for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `eav_attribute_option_swatch`
--
ALTER TABLE `eav_attribute_option_swatch`
  ADD PRIMARY KEY (`swatch_id`),
  ADD UNIQUE KEY `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  ADD KEY `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  ADD KEY `EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`);

--
-- Indexes for table `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  ADD KEY `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_attribute_set`
--
ALTER TABLE `eav_attribute_set`
  ADD PRIMARY KEY (`attribute_set_id`),
  ADD UNIQUE KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  ADD KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`);

--
-- Indexes for table `eav_entity`
--
ALTER TABLE `eav_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `EAV_ENTITY_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_entity_attribute`
--
ALTER TABLE `eav_entity_attribute`
  ADD PRIMARY KEY (`entity_attribute_id`),
  ADD UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  ADD UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  ADD KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  ADD KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `eav_entity_datetime`
--
ALTER TABLE `eav_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  ADD KEY `EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `eav_entity_decimal`
--
ALTER TABLE `eav_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  ADD KEY `EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `eav_entity_int`
--
ALTER TABLE `eav_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `EAV_ENTITY_INT_STORE_ID` (`store_id`),
  ADD KEY `EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `eav_entity_store`
--
ALTER TABLE `eav_entity_store`
  ADD PRIMARY KEY (`entity_store_id`),
  ADD KEY `EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `EAV_ENTITY_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_entity_text`
--
ALTER TABLE `eav_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `EAV_ENTITY_TEXT_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_entity_type`
--
ALTER TABLE `eav_entity_type`
  ADD PRIMARY KEY (`entity_type_id`),
  ADD KEY `EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`);

--
-- Indexes for table `eav_entity_varchar`
--
ALTER TABLE `eav_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  ADD KEY `EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `eav_form_element`
--
ALTER TABLE `eav_form_element`
  ADD PRIMARY KEY (`element_id`),
  ADD UNIQUE KEY `EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  ADD KEY `EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  ADD KEY `EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `eav_form_fieldset`
--
ALTER TABLE `eav_form_fieldset`
  ADD PRIMARY KEY (`fieldset_id`),
  ADD UNIQUE KEY `EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`);

--
-- Indexes for table `eav_form_fieldset_label`
--
ALTER TABLE `eav_form_fieldset_label`
  ADD PRIMARY KEY (`fieldset_id`,`store_id`),
  ADD KEY `EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_form_type`
--
ALTER TABLE `eav_form_type`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  ADD KEY `EAV_FORM_TYPE_STORE_ID` (`store_id`);

--
-- Indexes for table `eav_form_type_entity`
--
ALTER TABLE `eav_form_type_entity`
  ADD PRIMARY KEY (`type_id`,`entity_type_id`),
  ADD KEY `EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`);

--
-- Indexes for table `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`template_id`),
  ADD UNIQUE KEY `EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  ADD KEY `EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  ADD KEY `EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`);

--
-- Indexes for table `flag`
--
ALTER TABLE `flag`
  ADD PRIMARY KEY (`flag_id`),
  ADD KEY `FLAG_LAST_UPDATE` (`last_update`);

--
-- Indexes for table `gift_message`
--
ALTER TABLE `gift_message`
  ADD PRIMARY KEY (`gift_message_id`);

--
-- Indexes for table `googleoptimizer_code`
--
ALTER TABLE `googleoptimizer_code`
  ADD PRIMARY KEY (`code_id`),
  ADD UNIQUE KEY `GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`);

--
-- Indexes for table `importexport_importdata`
--
ALTER TABLE `importexport_importdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_history`
--
ALTER TABLE `import_history`
  ADD PRIMARY KEY (`history_id`);

--
-- Indexes for table `indexer_state`
--
ALTER TABLE `indexer_state`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `INDEXER_STATE_INDEXER_ID` (`indexer_id`);

--
-- Indexes for table `integration`
--
ALTER TABLE `integration`
  ADD PRIMARY KEY (`integration_id`),
  ADD UNIQUE KEY `INTEGRATION_NAME` (`name`),
  ADD UNIQUE KEY `INTEGRATION_CONSUMER_ID` (`consumer_id`);

--
-- Indexes for table `inventory_geoname`
--
ALTER TABLE `inventory_geoname`
  ADD PRIMARY KEY (`entity_id`);

--
-- Indexes for table `inventory_low_stock_notification_configuration`
--
ALTER TABLE `inventory_low_stock_notification_configuration`
  ADD PRIMARY KEY (`source_code`,`sku`);

--
-- Indexes for table `inventory_order_notification`
--
ALTER TABLE `inventory_order_notification`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `inventory_pickup_location_order`
--
ALTER TABLE `inventory_pickup_location_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `inventory_pickup_location_quote_address`
--
ALTER TABLE `inventory_pickup_location_quote_address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `inventory_reservation`
--
ALTER TABLE `inventory_reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `INVENTORY_RESERVATION_STOCK_ID_SKU_QUANTITY` (`stock_id`,`sku`,`quantity`);

--
-- Indexes for table `inventory_shipment_source`
--
ALTER TABLE `inventory_shipment_source`
  ADD PRIMARY KEY (`shipment_id`);

--
-- Indexes for table `inventory_source`
--
ALTER TABLE `inventory_source`
  ADD PRIMARY KEY (`source_code`);

--
-- Indexes for table `inventory_source_carrier_link`
--
ALTER TABLE `inventory_source_carrier_link`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`);

--
-- Indexes for table `inventory_source_item`
--
ALTER TABLE `inventory_source_item`
  ADD PRIMARY KEY (`source_item_id`),
  ADD UNIQUE KEY `INVENTORY_SOURCE_ITEM_SOURCE_CODE_SKU` (`source_code`,`sku`),
  ADD KEY `INVENTORY_SOURCE_ITEM_SKU_SOURCE_CODE_QUANTITY` (`sku`,`source_code`,`quantity`);

--
-- Indexes for table `inventory_source_stock_link`
--
ALTER TABLE `inventory_source_stock_link`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_SOURCE_CODE` (`stock_id`,`source_code`),
  ADD KEY `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`),
  ADD KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_PRIORITY` (`stock_id`,`priority`);

--
-- Indexes for table `inventory_stock`
--
ALTER TABLE `inventory_stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `inventory_stock_sales_channel`
--
ALTER TABLE `inventory_stock_sales_channel`
  ADD PRIMARY KEY (`type`,`code`),
  ADD KEY `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` (`stock_id`);

--
-- Indexes for table `jwt_auth_revoked`
--
ALTER TABLE `jwt_auth_revoked`
  ADD PRIMARY KEY (`user_type_id`,`user_id`);

--
-- Indexes for table `layout_link`
--
ALTER TABLE `layout_link`
  ADD PRIMARY KEY (`layout_link_id`),
  ADD KEY `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` (`theme_id`),
  ADD KEY `LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  ADD KEY `LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`);

--
-- Indexes for table `layout_update`
--
ALTER TABLE `layout_update`
  ADD PRIMARY KEY (`layout_update_id`),
  ADD KEY `LAYOUT_UPDATE_HANDLE` (`handle`);

--
-- Indexes for table `login_as_customer`
--
ALTER TABLE `login_as_customer`
  ADD PRIMARY KEY (`secret`),
  ADD KEY `LOGIN_AS_CUSTOMER_CREATED_AT` (`created_at`);

--
-- Indexes for table `login_as_customer_assistance_allowed`
--
ALTER TABLE `login_as_customer_assistance_allowed`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `magento_acknowledged_bulk`
--
ALTER TABLE `magento_acknowledged_bulk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID` (`bulk_uuid`);

--
-- Indexes for table `magento_bulk`
--
ALTER TABLE `magento_bulk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `MAGENTO_BULK_UUID` (`uuid`),
  ADD KEY `MAGENTO_BULK_USER_ID` (`user_id`),
  ADD KEY `MAGENTO_BULK_START_TIME` (`start_time`);

--
-- Indexes for table `magento_login_as_customer_log`
--
ALTER TABLE `magento_login_as_customer_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `MAGENTO_LOGIN_AS_CUSTOMER_LOG_USER_ID` (`user_id`);

--
-- Indexes for table `magento_operation`
--
ALTER TABLE `magento_operation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MAGENTO_OPERATION_BULK_UUID_ERROR_CODE` (`bulk_uuid`,`error_code`),
  ADD KEY `MAGENTO_OPERATION_STATUS_STARTED_AT` (`status`,`started_at`);

--
-- Indexes for table `media_content_asset`
--
ALTER TABLE `media_content_asset`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`field`,`asset_id`),
  ADD KEY `MEDIA_CONTENT_ASSET_ASSET_ID` (`asset_id`);

--
-- Indexes for table `media_gallery_asset`
--
ALTER TABLE `media_gallery_asset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MEDIA_GALLERY_ASSET_ID` (`id`);
ALTER TABLE `media_gallery_asset` ADD FULLTEXT KEY `MEDIA_GALLERY_ASSET_TITLE` (`title`);

--
-- Indexes for table `media_gallery_asset_keyword`
--
ALTER TABLE `media_gallery_asset_keyword`
  ADD PRIMARY KEY (`keyword_id`,`asset_id`),
  ADD KEY `MEDIA_GALLERY_ASSET_KEYWORD_ASSET_ID` (`asset_id`),
  ADD KEY `MEDIA_GALLERY_ASSET_KEYWORD_KEYWORD_ID` (`keyword_id`);

--
-- Indexes for table `media_gallery_keyword`
--
ALTER TABLE `media_gallery_keyword`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `MEDIA_GALLERY_KEYWORD_KEYWORD` (`keyword`),
  ADD KEY `MEDIA_GALLERY_KEYWORD_ID` (`id`);

--
-- Indexes for table `mview_state`
--
ALTER TABLE `mview_state`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `MVIEW_STATE_VIEW_ID` (`view_id`),
  ADD KEY `MVIEW_STATE_MODE` (`mode`);

--
-- Indexes for table `newsletter_problem`
--
ALTER TABLE `newsletter_problem`
  ADD PRIMARY KEY (`problem_id`),
  ADD KEY `NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  ADD KEY `NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`);

--
-- Indexes for table `newsletter_queue`
--
ALTER TABLE `newsletter_queue`
  ADD PRIMARY KEY (`queue_id`),
  ADD KEY `NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`);

--
-- Indexes for table `newsletter_queue_link`
--
ALTER TABLE `newsletter_queue_link`
  ADD PRIMARY KEY (`queue_link_id`),
  ADD KEY `NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  ADD KEY `NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`);

--
-- Indexes for table `newsletter_queue_store_link`
--
ALTER TABLE `newsletter_queue_store_link`
  ADD PRIMARY KEY (`queue_id`,`store_id`),
  ADD KEY `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`);

--
-- Indexes for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  ADD PRIMARY KEY (`subscriber_id`),
  ADD KEY `NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  ADD KEY `NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  ADD KEY `NEWSLETTER_SUBSCRIBER_SUBSCRIBER_EMAIL` (`subscriber_email`);

--
-- Indexes for table `newsletter_template`
--
ALTER TABLE `newsletter_template`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  ADD KEY `NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  ADD KEY `NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`);

--
-- Indexes for table `oauth_consumer`
--
ALTER TABLE `oauth_consumer`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `OAUTH_CONSUMER_KEY` (`key`),
  ADD UNIQUE KEY `OAUTH_CONSUMER_SECRET` (`secret`),
  ADD KEY `OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  ADD KEY `OAUTH_CONSUMER_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `oauth_nonce`
--
ALTER TABLE `oauth_nonce`
  ADD PRIMARY KEY (`nonce`,`consumer_id`),
  ADD KEY `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`),
  ADD KEY `OAUTH_NONCE_TIMESTAMP` (`timestamp`);

--
-- Indexes for table `oauth_token`
--
ALTER TABLE `oauth_token`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `OAUTH_TOKEN_TOKEN` (`token`),
  ADD KEY `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  ADD KEY `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  ADD KEY `OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  ADD KEY `OAUTH_TOKEN_CREATED_AT` (`created_at`);

--
-- Indexes for table `oauth_token_request_log`
--
ALTER TABLE `oauth_token_request_log`
  ADD PRIMARY KEY (`log_id`),
  ADD UNIQUE KEY `OAUTH_TOKEN_REQUEST_LOG_USER_NAME_USER_TYPE` (`user_name`,`user_type`);

--
-- Indexes for table `pagebuilder_template`
--
ALTER TABLE `pagebuilder_template`
  ADD PRIMARY KEY (`template_id`);
ALTER TABLE `pagebuilder_template` ADD FULLTEXT KEY `PAGEBUILDER_TEMPLATE_NAME` (`name`);

--
-- Indexes for table `password_reset_request_event`
--
ALTER TABLE `password_reset_request_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PASSWORD_RESET_REQUEST_EVENT_ACCOUNT_REFERENCE` (`account_reference`),
  ADD KEY `PASSWORD_RESET_REQUEST_EVENT_CREATED_AT` (`created_at`);

--
-- Indexes for table `patch_list`
--
ALTER TABLE `patch_list`
  ADD PRIMARY KEY (`patch_id`);

--
-- Indexes for table `payment_services_order_data_production_submitted_hash`
--
ALTER TABLE `payment_services_order_data_production_submitted_hash`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `payment_services_order_data_sandbox_submitted_hash`
--
ALTER TABLE `payment_services_order_data_sandbox_submitted_hash`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `payment_services_order_status_data_prod_submitted_hash`
--
ALTER TABLE `payment_services_order_status_data_prod_submitted_hash`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `payment_services_order_status_data_sandbox_submitted_hash`
--
ALTER TABLE `payment_services_order_status_data_sandbox_submitted_hash`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `payment_services_store_data_production_submitted_hash`
--
ALTER TABLE `payment_services_store_data_production_submitted_hash`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `payment_services_store_data_sandbox_submitted_hash`
--
ALTER TABLE `payment_services_store_data_sandbox_submitted_hash`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `paypal_billing_agreement`
--
ALTER TABLE `paypal_billing_agreement`
  ADD PRIMARY KEY (`agreement_id`),
  ADD KEY `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  ADD KEY `PAYPAL_BILLING_AGREEMENT_STORE_ID` (`store_id`);

--
-- Indexes for table `paypal_billing_agreement_order`
--
ALTER TABLE `paypal_billing_agreement_order`
  ADD PRIMARY KEY (`agreement_id`,`order_id`),
  ADD KEY `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`);

--
-- Indexes for table `paypal_cert`
--
ALTER TABLE `paypal_cert`
  ADD PRIMARY KEY (`cert_id`),
  ADD KEY `PAYPAL_CERT_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `paypal_payment_transaction`
--
ALTER TABLE `paypal_payment_transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`);

--
-- Indexes for table `paypal_settlement_report`
--
ALTER TABLE `paypal_settlement_report`
  ADD PRIMARY KEY (`report_id`),
  ADD UNIQUE KEY `PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`);

--
-- Indexes for table `paypal_settlement_report_row`
--
ALTER TABLE `paypal_settlement_report_row`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`);

--
-- Indexes for table `persistent_session`
--
ALTER TABLE `persistent_session`
  ADD PRIMARY KEY (`persistent_id`),
  ADD UNIQUE KEY `PERSISTENT_SESSION_KEY` (`key`),
  ADD UNIQUE KEY `PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  ADD KEY `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` (`website_id`),
  ADD KEY `PERSISTENT_SESSION_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `product_alert_price`
--
ALTER TABLE `product_alert_price`
  ADD PRIMARY KEY (`alert_price_id`),
  ADD KEY `PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  ADD KEY `PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  ADD KEY `PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`),
  ADD KEY `PRODUCT_ALERT_PRICE_STORE_ID` (`store_id`);

--
-- Indexes for table `product_alert_stock`
--
ALTER TABLE `product_alert_stock`
  ADD PRIMARY KEY (`alert_stock_id`),
  ADD KEY `PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  ADD KEY `PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  ADD KEY `PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`),
  ADD KEY `PRODUCT_ALERT_STOCK_STORE_ID` (`store_id`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `QUEUE_NAME` (`name`);

--
-- Indexes for table `queue_lock`
--
ALTER TABLE `queue_lock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `QUEUE_LOCK_MESSAGE_CODE` (`message_code`);

--
-- Indexes for table `queue_message`
--
ALTER TABLE `queue_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue_message_status`
--
ALTER TABLE `queue_message_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `QUEUE_MESSAGE_STATUS_QUEUE_ID_MESSAGE_ID` (`queue_id`,`message_id`),
  ADD KEY `QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID` (`message_id`),
  ADD KEY `QUEUE_MESSAGE_STATUS_STATUS_UPDATED_AT` (`status`,`updated_at`);

--
-- Indexes for table `quote`
--
ALTER TABLE `quote`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  ADD KEY `QUOTE_STORE_ID_UPDATED_AT` (`store_id`,`updated_at`);

--
-- Indexes for table `quote_address`
--
ALTER TABLE `quote_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `QUOTE_ADDRESS_QUOTE_ID` (`quote_id`);

--
-- Indexes for table `quote_address_item`
--
ALTER TABLE `quote_address_item`
  ADD PRIMARY KEY (`address_item_id`),
  ADD KEY `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  ADD KEY `QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  ADD KEY `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`),
  ADD KEY `QUOTE_ADDRESS_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `quote_id_mask`
--
ALTER TABLE `quote_id_mask`
  ADD PRIMARY KEY (`entity_id`,`quote_id`),
  ADD KEY `QUOTE_ID_MASK_QUOTE_ID` (`quote_id`),
  ADD KEY `QUOTE_ID_MASK_MASKED_ID` (`masked_id`);

--
-- Indexes for table `quote_item`
--
ALTER TABLE `quote_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  ADD KEY `QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  ADD KEY `QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  ADD KEY `QUOTE_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `quote_item_option`
--
ALTER TABLE `quote_item_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`);

--
-- Indexes for table `quote_payment`
--
ALTER TABLE `quote_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `QUOTE_PAYMENT_QUOTE_ID` (`quote_id`);

--
-- Indexes for table `quote_shipping_rate`
--
ALTER TABLE `quote_shipping_rate`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD UNIQUE KEY `RATING_RATING_CODE` (`rating_code`),
  ADD KEY `RATING_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `rating_entity`
--
ALTER TABLE `rating_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `RATING_ENTITY_ENTITY_CODE` (`entity_code`);

--
-- Indexes for table `rating_option`
--
ALTER TABLE `rating_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `RATING_OPTION_RATING_ID` (`rating_id`);

--
-- Indexes for table `rating_option_vote`
--
ALTER TABLE `rating_option_vote`
  ADD PRIMARY KEY (`vote_id`),
  ADD KEY `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`),
  ADD KEY `RATING_OPTION_VOTE_OPTION_ID` (`option_id`);

--
-- Indexes for table `rating_option_vote_aggregated`
--
ALTER TABLE `rating_option_vote_aggregated`
  ADD PRIMARY KEY (`primary_id`),
  ADD KEY `RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  ADD KEY `RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `rating_store`
--
ALTER TABLE `rating_store`
  ADD PRIMARY KEY (`rating_id`,`store_id`),
  ADD KEY `RATING_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `rating_title`
--
ALTER TABLE `rating_title`
  ADD PRIMARY KEY (`rating_id`,`store_id`),
  ADD KEY `RATING_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `release_notification_viewer_log`
--
ALTER TABLE `release_notification_viewer_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID` (`viewer_id`);

--
-- Indexes for table `reporting_counts`
--
ALTER TABLE `reporting_counts`
  ADD PRIMARY KEY (`entity_id`);

--
-- Indexes for table `reporting_module_status`
--
ALTER TABLE `reporting_module_status`
  ADD PRIMARY KEY (`entity_id`);

--
-- Indexes for table `reporting_orders`
--
ALTER TABLE `reporting_orders`
  ADD PRIMARY KEY (`entity_id`);

--
-- Indexes for table `reporting_system_updates`
--
ALTER TABLE `reporting_system_updates`
  ADD PRIMARY KEY (`entity_id`);

--
-- Indexes for table `reporting_users`
--
ALTER TABLE `reporting_users`
  ADD PRIMARY KEY (`entity_id`);

--
-- Indexes for table `report_compared_product_index`
--
ALTER TABLE `report_compared_product_index`
  ADD PRIMARY KEY (`index_id`),
  ADD UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  ADD UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  ADD KEY `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  ADD KEY `REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  ADD KEY `REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `report_event`
--
ALTER TABLE `report_event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  ADD KEY `REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  ADD KEY `REPORT_EVENT_OBJECT_ID` (`object_id`),
  ADD KEY `REPORT_EVENT_SUBTYPE` (`subtype`),
  ADD KEY `REPORT_EVENT_STORE_ID` (`store_id`);

--
-- Indexes for table `report_event_types`
--
ALTER TABLE `report_event_types`
  ADD PRIMARY KEY (`event_type_id`);

--
-- Indexes for table `report_viewed_product_aggregated_daily`
--
ALTER TABLE `report_viewed_product_aggregated_daily`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  ADD KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `report_viewed_product_aggregated_monthly`
--
ALTER TABLE `report_viewed_product_aggregated_monthly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  ADD KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `report_viewed_product_aggregated_yearly`
--
ALTER TABLE `report_viewed_product_aggregated_yearly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  ADD KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `report_viewed_product_index`
--
ALTER TABLE `report_viewed_product_index`
  ADD PRIMARY KEY (`index_id`),
  ADD UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  ADD UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  ADD KEY `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  ADD KEY `REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  ADD KEY `REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `REVIEW_ENTITY_ID` (`entity_id`),
  ADD KEY `REVIEW_STATUS_ID` (`status_id`),
  ADD KEY `REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`);

--
-- Indexes for table `review_detail`
--
ALTER TABLE `review_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  ADD KEY `REVIEW_DETAIL_STORE_ID` (`store_id`),
  ADD KEY `REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `review_entity`
--
ALTER TABLE `review_entity`
  ADD PRIMARY KEY (`entity_id`);

--
-- Indexes for table `review_entity_summary`
--
ALTER TABLE `review_entity_summary`
  ADD PRIMARY KEY (`primary_id`),
  ADD UNIQUE KEY `REVIEW_ENTITY_SUMMARY_ENTITY_PK_VALUE_STORE_ID_ENTITY_TYPE` (`entity_pk_value`,`store_id`,`entity_type`),
  ADD KEY `REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`);

--
-- Indexes for table `review_status`
--
ALTER TABLE `review_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `review_store`
--
ALTER TABLE `review_store`
  ADD PRIMARY KEY (`review_id`,`store_id`),
  ADD KEY `REVIEW_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `salesrule`
--
ALTER TABLE `salesrule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`);

--
-- Indexes for table `salesrule_coupon`
--
ALTER TABLE `salesrule_coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `SALESRULE_COUPON_CODE` (`code`),
  ADD UNIQUE KEY `SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  ADD KEY `SALESRULE_COUPON_RULE_ID` (`rule_id`);

--
-- Indexes for table `salesrule_coupon_aggregated`
--
ALTER TABLE `salesrule_coupon_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SALESRULE_COUPON_AGGRED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  ADD KEY `SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  ADD KEY `SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`);

--
-- Indexes for table `salesrule_coupon_aggregated_order`
--
ALTER TABLE `salesrule_coupon_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_1094D1FBBCBB11704A29DEF3ACC37D2B` (`period`,`store_id`,`order_status`,`coupon_code`),
  ADD KEY `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  ADD KEY `SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`);

--
-- Indexes for table `salesrule_coupon_aggregated_updated`
--
ALTER TABLE `salesrule_coupon_aggregated_updated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_7196FA120A4F0F84E1B66605E87E213E` (`period`,`store_id`,`order_status`,`coupon_code`),
  ADD KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  ADD KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`);

--
-- Indexes for table `salesrule_coupon_usage`
--
ALTER TABLE `salesrule_coupon_usage`
  ADD PRIMARY KEY (`coupon_id`,`customer_id`),
  ADD KEY `SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `salesrule_customer`
--
ALTER TABLE `salesrule_customer`
  ADD PRIMARY KEY (`rule_customer_id`),
  ADD KEY `SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  ADD KEY `SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`);

--
-- Indexes for table `salesrule_customer_group`
--
ALTER TABLE `salesrule_customer_group`
  ADD PRIMARY KEY (`rule_id`,`customer_group_id`),
  ADD KEY `SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`);

--
-- Indexes for table `salesrule_label`
--
ALTER TABLE `salesrule_label`
  ADD PRIMARY KEY (`label_id`),
  ADD UNIQUE KEY `SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  ADD KEY `SALESRULE_LABEL_STORE_ID` (`store_id`);

--
-- Indexes for table `salesrule_product_attribute`
--
ALTER TABLE `salesrule_product_attribute`
  ADD PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  ADD KEY `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  ADD KEY `SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `salesrule_website`
--
ALTER TABLE `salesrule_website`
  ADD PRIMARY KEY (`rule_id`,`website_id`),
  ADD KEY `SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `sales_bestsellers_aggregated_daily`
--
ALTER TABLE `sales_bestsellers_aggregated_daily`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  ADD KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `sales_bestsellers_aggregated_monthly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  ADD KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `sales_bestsellers_aggregated_yearly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  ADD KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `sales_creditmemo`
--
ALTER TABLE `sales_creditmemo`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `SALES_CREDITMEMO_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  ADD KEY `SALES_CREDITMEMO_STORE_ID` (`store_id`),
  ADD KEY `SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  ADD KEY `SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  ADD KEY `SALES_CREDITMEMO_STATE` (`state`),
  ADD KEY `SALES_CREDITMEMO_CREATED_AT` (`created_at`),
  ADD KEY `SALES_CREDITMEMO_UPDATED_AT` (`updated_at`),
  ADD KEY `SALES_CREDITMEMO_SEND_EMAIL` (`send_email`),
  ADD KEY `SALES_CREDITMEMO_EMAIL_SENT` (`email_sent`);

--
-- Indexes for table `sales_creditmemo_comment`
--
ALTER TABLE `sales_creditmemo_comment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  ADD KEY `SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_creditmemo_grid`
--
ALTER TABLE `sales_creditmemo_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  ADD KEY `SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  ADD KEY `SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  ADD KEY `SALES_CREDITMEMO_GRID_UPDATED_AT` (`updated_at`),
  ADD KEY `SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  ADD KEY `SALES_CREDITMEMO_GRID_STATE` (`state`),
  ADD KEY `SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  ADD KEY `SALES_CREDITMEMO_GRID_ORDER_STATUS` (`order_status`),
  ADD KEY `SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  ADD KEY `SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  ADD KEY `SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  ADD KEY `SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`);
ALTER TABLE `sales_creditmemo_grid` ADD FULLTEXT KEY `FTI_32B7BA885941A8254EE84AE650ABDC86` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`);

--
-- Indexes for table `sales_creditmemo_item`
--
ALTER TABLE `sales_creditmemo_item`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_data_exporter_orders`
--
ALTER TABLE `sales_data_exporter_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SALES_DATA_EXPORTER_ORDERS_MODIFIED_AT` (`modified_at`);

--
-- Indexes for table `sales_data_exporter_orders_index_batches`
--
ALTER TABLE `sales_data_exporter_orders_index_batches`
  ADD PRIMARY KEY (`batch_number`,`entity_id`);

--
-- Indexes for table `sales_data_exporter_orders_index_sequence`
--
ALTER TABLE `sales_data_exporter_orders_index_sequence`
  ADD PRIMARY KEY (`i`);

--
-- Indexes for table `sales_data_exporter_order_statuses`
--
ALTER TABLE `sales_data_exporter_order_statuses`
  ADD PRIMARY KEY (`status`),
  ADD KEY `SALES_DATA_EXPORTER_ORDER_STATUSES_MODIFIED_AT` (`modified_at`);

--
-- Indexes for table `sales_data_exporter_order_statuses_index_batches`
--
ALTER TABLE `sales_data_exporter_order_statuses_index_batches`
  ADD PRIMARY KEY (`batch_number`,`status`);

--
-- Indexes for table `sales_data_exporter_order_statuses_index_sequence`
--
ALTER TABLE `sales_data_exporter_order_statuses_index_sequence`
  ADD PRIMARY KEY (`i`);

--
-- Indexes for table `sales_invoice`
--
ALTER TABLE `sales_invoice`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `SALES_INVOICE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  ADD KEY `SALES_INVOICE_STORE_ID` (`store_id`),
  ADD KEY `SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  ADD KEY `SALES_INVOICE_ORDER_ID` (`order_id`),
  ADD KEY `SALES_INVOICE_STATE` (`state`),
  ADD KEY `SALES_INVOICE_CREATED_AT` (`created_at`),
  ADD KEY `SALES_INVOICE_UPDATED_AT` (`updated_at`),
  ADD KEY `SALES_INVOICE_SEND_EMAIL` (`send_email`),
  ADD KEY `SALES_INVOICE_EMAIL_SENT` (`email_sent`);

--
-- Indexes for table `sales_invoiced_aggregated`
--
ALTER TABLE `sales_invoiced_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_invoiced_aggregated_order`
--
ALTER TABLE `sales_invoiced_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_invoice_comment`
--
ALTER TABLE `sales_invoice_comment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  ADD KEY `SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_invoice_grid`
--
ALTER TABLE `sales_invoice_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  ADD KEY `SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  ADD KEY `SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  ADD KEY `SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  ADD KEY `SALES_INVOICE_GRID_STATE` (`state`),
  ADD KEY `SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  ADD KEY `SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  ADD KEY `SALES_INVOICE_GRID_UPDATED_AT` (`updated_at`),
  ADD KEY `SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  ADD KEY `SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  ADD KEY `SALES_INVOICE_GRID_BASE_GRAND_TOTAL` (`base_grand_total`);
ALTER TABLE `sales_invoice_grid` ADD FULLTEXT KEY `FTI_95D9C924DD6A8734EB8B5D01D60F90DE` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`);

--
-- Indexes for table `sales_invoice_item`
--
ALTER TABLE `sales_invoice_item`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `SALES_ORDER_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  ADD KEY `SALES_ORDER_STATUS` (`status`),
  ADD KEY `SALES_ORDER_STATE` (`state`),
  ADD KEY `SALES_ORDER_STORE_ID` (`store_id`),
  ADD KEY `SALES_ORDER_CREATED_AT` (`created_at`),
  ADD KEY `SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  ADD KEY `SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  ADD KEY `SALES_ORDER_QUOTE_ID` (`quote_id`),
  ADD KEY `SALES_ORDER_UPDATED_AT` (`updated_at`),
  ADD KEY `SALES_ORDER_SEND_EMAIL` (`send_email`),
  ADD KEY `SALES_ORDER_EMAIL_SENT` (`email_sent`),
  ADD KEY `SALES_ORDER_STORE_ID_STATE_CREATED_AT` (`store_id`,`state`,`created_at`);

--
-- Indexes for table `sales_order_address`
--
ALTER TABLE `sales_order_address`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_order_aggregated_created`
--
ALTER TABLE `sales_order_aggregated_created`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_order_aggregated_updated`
--
ALTER TABLE `sales_order_aggregated_updated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_order_data_exporter_cl`
--
ALTER TABLE `sales_order_data_exporter_cl`
  ADD PRIMARY KEY (`version_id`);

--
-- Indexes for table `sales_order_grid`
--
ALTER TABLE `sales_order_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `SALES_ORDER_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  ADD KEY `SALES_ORDER_GRID_STATUS` (`status`),
  ADD KEY `SALES_ORDER_GRID_STORE_ID` (`store_id`),
  ADD KEY `SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  ADD KEY `SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  ADD KEY `SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  ADD KEY `SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  ADD KEY `SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  ADD KEY `SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  ADD KEY `SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  ADD KEY `SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  ADD KEY `SALES_ORDER_GRID_UPDATED_AT` (`updated_at`),
  ADD KEY `SALES_ORDER_GRID_PICKUP_LOCATION_CODE` (`pickup_location_code`);
ALTER TABLE `sales_order_grid` ADD FULLTEXT KEY `FTI_65B9E9925EC58F0C7C2E2F6379C233E7` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`);

--
-- Indexes for table `sales_order_item`
--
ALTER TABLE `sales_order_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  ADD KEY `SALES_ORDER_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_order_payment`
--
ALTER TABLE `sales_order_payment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_order_status`
--
ALTER TABLE `sales_order_status`
  ADD PRIMARY KEY (`status`);

--
-- Indexes for table `sales_order_status_data_exporter_cl`
--
ALTER TABLE `sales_order_status_data_exporter_cl`
  ADD PRIMARY KEY (`version_id`);

--
-- Indexes for table `sales_order_status_history`
--
ALTER TABLE `sales_order_status_history`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  ADD KEY `SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`);

--
-- Indexes for table `sales_order_status_label`
--
ALTER TABLE `sales_order_status_label`
  ADD PRIMARY KEY (`status`,`store_id`),
  ADD KEY `SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_order_status_state`
--
ALTER TABLE `sales_order_status_state`
  ADD PRIMARY KEY (`status`,`state`);

--
-- Indexes for table `sales_order_tax`
--
ALTER TABLE `sales_order_tax`
  ADD PRIMARY KEY (`tax_id`),
  ADD KEY `SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`);

--
-- Indexes for table `sales_order_tax_item`
--
ALTER TABLE `sales_order_tax_item`
  ADD PRIMARY KEY (`tax_item_id`),
  ADD UNIQUE KEY `SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  ADD KEY `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` (`associated_item_id`),
  ADD KEY `SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`);

--
-- Indexes for table `sales_payment_transaction`
--
ALTER TABLE `sales_payment_transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  ADD KEY `SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  ADD KEY `SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`);

--
-- Indexes for table `sales_refunded_aggregated`
--
ALTER TABLE `sales_refunded_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_refunded_aggregated_order`
--
ALTER TABLE `sales_refunded_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_sequence_meta`
--
ALTER TABLE `sales_sequence_meta`
  ADD PRIMARY KEY (`meta_id`),
  ADD UNIQUE KEY `SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID` (`entity_type`,`store_id`);

--
-- Indexes for table `sales_sequence_profile`
--
ALTER TABLE `sales_sequence_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX` (`meta_id`,`prefix`,`suffix`);

--
-- Indexes for table `sales_shipment`
--
ALTER TABLE `sales_shipment`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `SALES_SHIPMENT_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  ADD KEY `SALES_SHIPMENT_STORE_ID` (`store_id`),
  ADD KEY `SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  ADD KEY `SALES_SHIPMENT_ORDER_ID` (`order_id`),
  ADD KEY `SALES_SHIPMENT_CREATED_AT` (`created_at`),
  ADD KEY `SALES_SHIPMENT_UPDATED_AT` (`updated_at`),
  ADD KEY `SALES_SHIPMENT_SEND_EMAIL` (`send_email`),
  ADD KEY `SALES_SHIPMENT_EMAIL_SENT` (`email_sent`);

--
-- Indexes for table `sales_shipment_comment`
--
ALTER TABLE `sales_shipment_comment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  ADD KEY `SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_shipment_grid`
--
ALTER TABLE `sales_shipment_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  ADD KEY `SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  ADD KEY `SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  ADD KEY `SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  ADD KEY `SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  ADD KEY `SALES_SHIPMENT_GRID_ORDER_STATUS` (`order_status`),
  ADD KEY `SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  ADD KEY `SALES_SHIPMENT_GRID_UPDATED_AT` (`updated_at`),
  ADD KEY `SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  ADD KEY `SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  ADD KEY `SALES_SHIPMENT_GRID_BILLING_NAME` (`billing_name`),
  ADD KEY `SALES_SHIPMENT_GRID_ORDER_ID` (`order_id`);
ALTER TABLE `sales_shipment_grid` ADD FULLTEXT KEY `FTI_086B40C8955F167B8EA76653437879B4` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`);

--
-- Indexes for table `sales_shipment_item`
--
ALTER TABLE `sales_shipment_item`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`);

--
-- Indexes for table `sales_shipment_track`
--
ALTER TABLE `sales_shipment_track`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  ADD KEY `SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  ADD KEY `SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`);

--
-- Indexes for table `sales_shipping_aggregated`
--
ALTER TABLE `sales_shipping_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  ADD KEY `SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `sales_shipping_aggregated_order`
--
ALTER TABLE `sales_shipping_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  ADD KEY `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`);

--
-- Indexes for table `search_query`
--
ALTER TABLE `search_query`
  ADD PRIMARY KEY (`query_id`),
  ADD UNIQUE KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID` (`query_text`,`store_id`),
  ADD KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  ADD KEY `SEARCH_QUERY_IS_PROCESSED` (`is_processed`),
  ADD KEY `SEARCH_QUERY_STORE_ID_NUM_RESULTS_POPULARITY` (`store_id`,`num_results`,`popularity`);

--
-- Indexes for table `search_synonyms`
--
ALTER TABLE `search_synonyms`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `SEARCH_SYNONYMS_STORE_ID` (`store_id`),
  ADD KEY `SEARCH_SYNONYMS_WEBSITE_ID` (`website_id`);
ALTER TABLE `search_synonyms` ADD FULLTEXT KEY `SEARCH_SYNONYMS_SYNONYMS` (`synonyms`);

--
-- Indexes for table `sendfriend_log`
--
ALTER TABLE `sendfriend_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `SENDFRIEND_LOG_IP` (`ip`),
  ADD KEY `SENDFRIEND_LOG_TIME` (`time`);

--
-- Indexes for table `sequence_creditmemo_0`
--
ALTER TABLE `sequence_creditmemo_0`
  ADD PRIMARY KEY (`sequence_value`);

--
-- Indexes for table `sequence_creditmemo_1`
--
ALTER TABLE `sequence_creditmemo_1`
  ADD PRIMARY KEY (`sequence_value`);

--
-- Indexes for table `sequence_invoice_0`
--
ALTER TABLE `sequence_invoice_0`
  ADD PRIMARY KEY (`sequence_value`);

--
-- Indexes for table `sequence_invoice_1`
--
ALTER TABLE `sequence_invoice_1`
  ADD PRIMARY KEY (`sequence_value`);

--
-- Indexes for table `sequence_order_0`
--
ALTER TABLE `sequence_order_0`
  ADD PRIMARY KEY (`sequence_value`);

--
-- Indexes for table `sequence_order_1`
--
ALTER TABLE `sequence_order_1`
  ADD PRIMARY KEY (`sequence_value`);

--
-- Indexes for table `sequence_shipment_0`
--
ALTER TABLE `sequence_shipment_0`
  ADD PRIMARY KEY (`sequence_value`);

--
-- Indexes for table `sequence_shipment_1`
--
ALTER TABLE `sequence_shipment_1`
  ADD PRIMARY KEY (`sequence_value`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `setup_module`
--
ALTER TABLE `setup_module`
  ADD PRIMARY KEY (`module`);

--
-- Indexes for table `shipping_tablerate`
--
ALTER TABLE `shipping_tablerate`
  ADD PRIMARY KEY (`pk`),
  ADD UNIQUE KEY `UNQ_D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`);

--
-- Indexes for table `sitemap`
--
ALTER TABLE `sitemap`
  ADD PRIMARY KEY (`sitemap_id`),
  ADD KEY `SITEMAP_STORE_ID` (`store_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`),
  ADD UNIQUE KEY `STORE_CODE` (`code`),
  ADD KEY `STORE_WEBSITE_ID` (`website_id`),
  ADD KEY `STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  ADD KEY `STORE_GROUP_ID` (`group_id`);

--
-- Indexes for table `stores_data_exporter`
--
ALTER TABLE `stores_data_exporter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `STORES_DATA_EXPORTER_MODIFIED_AT` (`modified_at`);

--
-- Indexes for table `stores_data_exporter_index_batches`
--
ALTER TABLE `stores_data_exporter_index_batches`
  ADD PRIMARY KEY (`batch_number`,`website_id`);

--
-- Indexes for table `stores_data_exporter_index_sequence`
--
ALTER TABLE `stores_data_exporter_index_sequence`
  ADD PRIMARY KEY (`i`);

--
-- Indexes for table `store_data_exporter_cl`
--
ALTER TABLE `store_data_exporter_cl`
  ADD PRIMARY KEY (`version_id`);

--
-- Indexes for table `store_group`
--
ALTER TABLE `store_group`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `STORE_GROUP_CODE` (`code`),
  ADD KEY `STORE_GROUP_WEBSITE_ID` (`website_id`),
  ADD KEY `STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`);

--
-- Indexes for table `store_website`
--
ALTER TABLE `store_website`
  ADD PRIMARY KEY (`website_id`),
  ADD UNIQUE KEY `STORE_WEBSITE_CODE` (`code`),
  ADD KEY `STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  ADD KEY `STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`);

--
-- Indexes for table `tax_calculation`
--
ALTER TABLE `tax_calculation`
  ADD PRIMARY KEY (`tax_calculation_id`),
  ADD KEY `TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  ADD KEY `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  ADD KEY `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  ADD KEY `TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`);

--
-- Indexes for table `tax_calculation_rate`
--
ALTER TABLE `tax_calculation_rate`
  ADD PRIMARY KEY (`tax_calculation_rate_id`),
  ADD KEY `TAX_CALCULATION_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  ADD KEY `TAX_CALCULATION_RATE_CODE` (`code`),
  ADD KEY `IDX_CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`);

--
-- Indexes for table `tax_calculation_rate_title`
--
ALTER TABLE `tax_calculation_rate_title`
  ADD PRIMARY KEY (`tax_calculation_rate_title_id`),
  ADD KEY `TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  ADD KEY `TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `tax_calculation_rule`
--
ALTER TABLE `tax_calculation_rule`
  ADD PRIMARY KEY (`tax_calculation_rule_id`),
  ADD KEY `TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  ADD KEY `TAX_CALCULATION_RULE_CODE` (`code`);

--
-- Indexes for table `tax_class`
--
ALTER TABLE `tax_class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `tax_order_aggregated_created`
--
ALTER TABLE `tax_order_aggregated_created`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `TAX_ORDER_AGGRED_CREATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  ADD KEY `TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`);

--
-- Indexes for table `tax_order_aggregated_updated`
--
ALTER TABLE `tax_order_aggregated_updated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `TAX_ORDER_AGGRED_UPDATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  ADD KEY `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `theme_file`
--
ALTER TABLE `theme_file`
  ADD PRIMARY KEY (`theme_files_id`),
  ADD KEY `THEME_FILE_THEME_ID_THEME_THEME_ID` (`theme_id`);

--
-- Indexes for table `translation`
--
ALTER TABLE `translation`
  ADD PRIMARY KEY (`key_id`),
  ADD UNIQUE KEY `TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`);

--
-- Indexes for table `ui_bookmark`
--
ALTER TABLE `ui_bookmark`
  ADD PRIMARY KEY (`bookmark_id`),
  ADD KEY `UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER` (`user_id`,`namespace`,`identifier`);

--
-- Indexes for table `url_rewrite`
--
ALTER TABLE `url_rewrite`
  ADD PRIMARY KEY (`url_rewrite_id`),
  ADD UNIQUE KEY `URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  ADD KEY `URL_REWRITE_TARGET_PATH` (`target_path`),
  ADD KEY `URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`),
  ADD KEY `URL_REWRITE_ENTITY_ID` (`entity_id`),
  ADD KEY `URL_REWRITE_IS_AUTOGENERATED_METADATA` (`is_autogenerated`,`metadata`);

--
-- Indexes for table `variable`
--
ALTER TABLE `variable`
  ADD PRIMARY KEY (`variable_id`),
  ADD UNIQUE KEY `VARIABLE_CODE` (`code`);

--
-- Indexes for table `variable_value`
--
ALTER TABLE `variable_value`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  ADD KEY `VARIABLE_VALUE_STORE_ID` (`store_id`);

--
-- Indexes for table `vault_payment_token`
--
ALTER TABLE `vault_payment_token`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `VAULT_PAYMENT_TOKEN_PUBLIC_HASH` (`public_hash`),
  ADD UNIQUE KEY `VAULT_PAYMENT_TOKEN_PAYMENT_METHOD_CODE_CSTR_ID_GATEWAY_TOKEN` (`payment_method_code`,`customer_id`,`gateway_token`),
  ADD KEY `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`);

--
-- Indexes for table `vault_payment_token_order_payment_link`
--
ALTER TABLE `vault_payment_token_order_payment_link`
  ADD PRIMARY KEY (`order_payment_id`,`payment_token_id`),
  ADD KEY `FK_4ED894655446D385894580BECA993862` (`payment_token_id`);

--
-- Indexes for table `weee_tax`
--
ALTER TABLE `weee_tax`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `WEEE_TAX_WEBSITE_ID` (`website_id`),
  ADD KEY `WEEE_TAX_ENTITY_ID` (`entity_id`),
  ADD KEY `WEEE_TAX_COUNTRY` (`country`),
  ADD KEY `WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `widget`
--
ALTER TABLE `widget`
  ADD PRIMARY KEY (`widget_id`),
  ADD KEY `WIDGET_WIDGET_CODE` (`widget_code`);

--
-- Indexes for table `widget_instance`
--
ALTER TABLE `widget_instance`
  ADD PRIMARY KEY (`instance_id`),
  ADD KEY `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` (`theme_id`);

--
-- Indexes for table `widget_instance_page`
--
ALTER TABLE `widget_instance_page`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`);

--
-- Indexes for table `widget_instance_page_layout`
--
ALTER TABLE `widget_instance_page_layout`
  ADD PRIMARY KEY (`layout_update_id`,`page_id`),
  ADD KEY `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD UNIQUE KEY `WISHLIST_CUSTOMER_ID` (`customer_id`),
  ADD KEY `WISHLIST_SHARED` (`shared`);

--
-- Indexes for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  ADD PRIMARY KEY (`wishlist_item_id`),
  ADD KEY `WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  ADD KEY `WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  ADD KEY `WISHLIST_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `wishlist_item_option`
--
ALTER TABLE `wishlist_item_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminnotification_inbox`
--
ALTER TABLE `adminnotification_inbox`
  MODIFY `notification_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Notification ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_adobe_ims_webapi`
--
ALTER TABLE `admin_adobe_ims_webapi`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `admin_analytics_usage_version_log`
--
ALTER TABLE `admin_analytics_usage_version_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_passwords`
--
ALTER TABLE `admin_passwords`
  MODIFY `password_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Password ID', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'User ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_user_session`
--
ALTER TABLE `admin_user_session`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `adobe_stock_asset`
--
ALTER TABLE `adobe_stock_asset`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `adobe_stock_category`
--
ALTER TABLE `adobe_stock_category`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `adobe_stock_creator`
--
ALTER TABLE `adobe_stock_creator`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `adobe_user_profile`
--
ALTER TABLE `adobe_user_profile`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `authorization_role`
--
ALTER TABLE `authorization_role`
  MODIFY `role_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Role ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `authorization_rule`
--
ALTER TABLE `authorization_rule`
  MODIFY `rule_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `braintree_credit_prices`
--
ALTER TABLE `braintree_credit_prices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Row ID';

--
-- AUTO_INCREMENT for table `braintree_transaction_details`
--
ALTER TABLE `braintree_transaction_details`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `cataloginventory_stock`
--
ALTER TABLE `cataloginventory_stock`
  MODIFY `stock_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Stock ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cataloginventory_stock_item`
--
ALTER TABLE `cataloginventory_stock_item`
  MODIFY `item_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item ID';

--
-- AUTO_INCREMENT for table `catalogrule`
--
ALTER TABLE `catalogrule`
  MODIFY `rule_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `catalogrule_product`
--
ALTER TABLE `catalogrule_product`
  MODIFY `rule_product_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product ID';

--
-- AUTO_INCREMENT for table `catalogrule_product_price`
--
ALTER TABLE `catalogrule_product_price`
  MODIFY `rule_product_price_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId';

--
-- AUTO_INCREMENT for table `catalogrule_product_price_replica`
--
ALTER TABLE `catalogrule_product_price_replica`
  MODIFY `rule_product_price_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId';

--
-- AUTO_INCREMENT for table `catalogrule_product_replica`
--
ALTER TABLE `catalogrule_product_replica`
  MODIFY `rule_product_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product ID';

--
-- AUTO_INCREMENT for table `catalogsearch_recommendations`
--
ALTER TABLE `catalogsearch_recommendations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `catalog_category_entity`
--
ALTER TABLE `catalog_category_entity`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catalog_category_entity_datetime`
--
ALTER TABLE `catalog_category_entity_datetime`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_category_entity_decimal`
--
ALTER TABLE `catalog_category_entity_decimal`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_category_entity_int`
--
ALTER TABLE `catalog_category_entity_int`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `catalog_category_entity_text`
--
ALTER TABLE `catalog_category_entity_text`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_category_entity_varchar`
--
ALTER TABLE `catalog_category_entity_varchar`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `catalog_category_product`
--
ALTER TABLE `catalog_category_product`
  MODIFY `entity_id` int NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `catalog_category_product_cl`
--
ALTER TABLE `catalog_category_product_cl`
  MODIFY `version_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Version ID';

--
-- AUTO_INCREMENT for table `catalog_compare_item`
--
ALTER TABLE `catalog_compare_item`
  MODIFY `catalog_compare_item_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID';

--
-- AUTO_INCREMENT for table `catalog_compare_list`
--
ALTER TABLE `catalog_compare_list`
  MODIFY `list_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Compare List ID';

--
-- AUTO_INCREMENT for table `catalog_product_bundle_option`
--
ALTER TABLE `catalog_product_bundle_option`
  MODIFY `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option ID';

--
-- AUTO_INCREMENT for table `catalog_product_bundle_option_value`
--
ALTER TABLE `catalog_product_bundle_option_value`
  MODIFY `value_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_bundle_selection`
--
ALTER TABLE `catalog_product_bundle_selection`
  MODIFY `selection_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Selection ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity`
--
ALTER TABLE `catalog_product_entity`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_decimal`
--
ALTER TABLE `catalog_product_entity_decimal`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_gallery`
--
ALTER TABLE `catalog_product_entity_gallery`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_int`
--
ALTER TABLE `catalog_product_entity_int`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_media_gallery`
--
ALTER TABLE `catalog_product_entity_media_gallery`
  MODIFY `value_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_media_gallery_value`
--
ALTER TABLE `catalog_product_entity_media_gallery_value`
  MODIFY `record_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Record ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_text`
--
ALTER TABLE `catalog_product_entity_text`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_tier_price`
--
ALTER TABLE `catalog_product_entity_tier_price`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_entity_varchar`
--
ALTER TABLE `catalog_product_entity_varchar`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_frontend_action`
--
ALTER TABLE `catalog_product_frontend_action`
  MODIFY `action_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product Action ID';

--
-- AUTO_INCREMENT for table `catalog_product_index_price_tmp`
--
ALTER TABLE `catalog_product_index_price_tmp`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `catalog_product_link`
--
ALTER TABLE `catalog_product_link`
  MODIFY `link_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID';

--
-- AUTO_INCREMENT for table `catalog_product_link_attribute`
--
ALTER TABLE `catalog_product_link_attribute`
  MODIFY `product_link_attribute_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `catalog_product_link_attribute_decimal`
--
ALTER TABLE `catalog_product_link_attribute_decimal`
  MODIFY `value_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_link_attribute_int`
--
ALTER TABLE `catalog_product_link_attribute_int`
  MODIFY `value_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_link_attribute_varchar`
--
ALTER TABLE `catalog_product_link_attribute_varchar`
  MODIFY `value_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_link_type`
--
ALTER TABLE `catalog_product_link_type`
  MODIFY `link_type_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `catalog_product_option`
--
ALTER TABLE `catalog_product_option`
  MODIFY `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option ID';

--
-- AUTO_INCREMENT for table `catalog_product_option_price`
--
ALTER TABLE `catalog_product_option_price`
  MODIFY `option_price_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID';

--
-- AUTO_INCREMENT for table `catalog_product_option_title`
--
ALTER TABLE `catalog_product_option_title`
  MODIFY `option_title_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID';

--
-- AUTO_INCREMENT for table `catalog_product_option_type_price`
--
ALTER TABLE `catalog_product_option_type_price`
  MODIFY `option_type_price_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID';

--
-- AUTO_INCREMENT for table `catalog_product_option_type_title`
--
ALTER TABLE `catalog_product_option_type_title`
  MODIFY `option_type_title_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID';

--
-- AUTO_INCREMENT for table `catalog_product_option_type_value`
--
ALTER TABLE `catalog_product_option_type_value`
  MODIFY `option_type_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID';

--
-- AUTO_INCREMENT for table `catalog_product_super_attribute`
--
ALTER TABLE `catalog_product_super_attribute`
  MODIFY `product_super_attribute_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID';

--
-- AUTO_INCREMENT for table `catalog_product_super_attribute_label`
--
ALTER TABLE `catalog_product_super_attribute_label`
  MODIFY `value_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `catalog_product_super_link`
--
ALTER TABLE `catalog_product_super_link`
  MODIFY `link_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID';

--
-- AUTO_INCREMENT for table `checkout_agreement`
--
ALTER TABLE `checkout_agreement`
  MODIFY `agreement_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Agreement ID';

--
-- AUTO_INCREMENT for table `cms_block`
--
ALTER TABLE `cms_block`
  MODIFY `block_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `cms_page`
--
ALTER TABLE `cms_page`
  MODIFY `page_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `core_config_data`
--
ALTER TABLE `core_config_data`
  MODIFY `config_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Config ID', AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cron_schedule`
--
ALTER TABLE `cron_schedule`
  MODIFY `schedule_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Schedule ID';

--
-- AUTO_INCREMENT for table `customer_address_entity`
--
ALTER TABLE `customer_address_entity`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `customer_address_entity_datetime`
--
ALTER TABLE `customer_address_entity_datetime`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `customer_address_entity_decimal`
--
ALTER TABLE `customer_address_entity_decimal`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `customer_address_entity_int`
--
ALTER TABLE `customer_address_entity_int`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `customer_address_entity_text`
--
ALTER TABLE `customer_address_entity_text`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `customer_address_entity_varchar`
--
ALTER TABLE `customer_address_entity_varchar`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `customer_dummy_cl`
--
ALTER TABLE `customer_dummy_cl`
  MODIFY `version_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Version ID';

--
-- AUTO_INCREMENT for table `customer_entity`
--
ALTER TABLE `customer_entity`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `customer_entity_datetime`
--
ALTER TABLE `customer_entity_datetime`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `customer_entity_decimal`
--
ALTER TABLE `customer_entity_decimal`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `customer_entity_int`
--
ALTER TABLE `customer_entity_int`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `customer_entity_text`
--
ALTER TABLE `customer_entity_text`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `customer_entity_varchar`
--
ALTER TABLE `customer_entity_varchar`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `customer_group`
--
ALTER TABLE `customer_group`
  MODIFY `customer_group_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_group_excluded_website`
--
ALTER TABLE `customer_group_excluded_website`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_log`
--
ALTER TABLE `customer_log`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT COMMENT 'Log ID';

--
-- AUTO_INCREMENT for table `customer_visitor`
--
ALTER TABLE `customer_visitor`
  MODIFY `visitor_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID';

--
-- AUTO_INCREMENT for table `design_change`
--
ALTER TABLE `design_change`
  MODIFY `design_change_id` int NOT NULL AUTO_INCREMENT COMMENT 'Design Change ID';

--
-- AUTO_INCREMENT for table `design_config_dummy_cl`
--
ALTER TABLE `design_config_dummy_cl`
  MODIFY `version_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Version ID';

--
-- AUTO_INCREMENT for table `directory_country_format`
--
ALTER TABLE `directory_country_format`
  MODIFY `country_format_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Country Format ID';

--
-- AUTO_INCREMENT for table `directory_country_region`
--
ALTER TABLE `directory_country_region`
  MODIFY `region_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Region ID', AUTO_INCREMENT=1157;

--
-- AUTO_INCREMENT for table `downloadable_link`
--
ALTER TABLE `downloadable_link`
  MODIFY `link_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID';

--
-- AUTO_INCREMENT for table `downloadable_link_price`
--
ALTER TABLE `downloadable_link_price`
  MODIFY `price_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Price ID';

--
-- AUTO_INCREMENT for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  MODIFY `purchased_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID';

--
-- AUTO_INCREMENT for table `downloadable_link_purchased_item`
--
ALTER TABLE `downloadable_link_purchased_item`
  MODIFY `item_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item ID';

--
-- AUTO_INCREMENT for table `downloadable_link_title`
--
ALTER TABLE `downloadable_link_title`
  MODIFY `title_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Title ID';

--
-- AUTO_INCREMENT for table `downloadable_sample`
--
ALTER TABLE `downloadable_sample`
  MODIFY `sample_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Sample ID';

--
-- AUTO_INCREMENT for table `downloadable_sample_title`
--
ALTER TABLE `downloadable_sample_title`
  MODIFY `title_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Title ID';

--
-- AUTO_INCREMENT for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  MODIFY `attribute_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute ID', AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  MODIFY `attribute_group_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group ID', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  MODIFY `attribute_label_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label ID';

--
-- AUTO_INCREMENT for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  MODIFY `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eav_attribute_option_swatch`
--
ALTER TABLE `eav_attribute_option_swatch`
  MODIFY `swatch_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID';

--
-- AUTO_INCREMENT for table `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  MODIFY `value_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eav_attribute_set`
--
ALTER TABLE `eav_attribute_set`
  MODIFY `attribute_set_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set ID', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `eav_entity`
--
ALTER TABLE `eav_entity`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `eav_entity_attribute`
--
ALTER TABLE `eav_entity_attribute`
  MODIFY `entity_attribute_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute ID', AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `eav_entity_datetime`
--
ALTER TABLE `eav_entity_datetime`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `eav_entity_decimal`
--
ALTER TABLE `eav_entity_decimal`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `eav_entity_int`
--
ALTER TABLE `eav_entity_int`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `eav_entity_store`
--
ALTER TABLE `eav_entity_store`
  MODIFY `entity_store_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Store ID';

--
-- AUTO_INCREMENT for table `eav_entity_text`
--
ALTER TABLE `eav_entity_text`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `eav_entity_type`
--
ALTER TABLE `eav_entity_type`
  MODIFY `entity_type_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Type ID', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `eav_entity_varchar`
--
ALTER TABLE `eav_entity_varchar`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `eav_form_element`
--
ALTER TABLE `eav_form_element`
  MODIFY `element_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Element ID', AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `eav_form_fieldset`
--
ALTER TABLE `eav_form_fieldset`
  MODIFY `fieldset_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Fieldset ID';

--
-- AUTO_INCREMENT for table `eav_form_type`
--
ALTER TABLE `eav_form_type`
  MODIFY `type_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Type ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `template_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Template ID';

--
-- AUTO_INCREMENT for table `flag`
--
ALTER TABLE `flag`
  MODIFY `flag_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Flag Id', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gift_message`
--
ALTER TABLE `gift_message`
  MODIFY `gift_message_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage ID';

--
-- AUTO_INCREMENT for table `googleoptimizer_code`
--
ALTER TABLE `googleoptimizer_code`
  MODIFY `code_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code ID';

--
-- AUTO_INCREMENT for table `importexport_importdata`
--
ALTER TABLE `importexport_importdata`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `import_history`
--
ALTER TABLE `import_history`
  MODIFY `history_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'History record ID';

--
-- AUTO_INCREMENT for table `indexer_state`
--
ALTER TABLE `indexer_state`
  MODIFY `state_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Indexer State ID', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `integration`
--
ALTER TABLE `integration`
  MODIFY `integration_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Integration ID';

--
-- AUTO_INCREMENT for table `inventory_geoname`
--
ALTER TABLE `inventory_geoname`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'entity id';

--
-- AUTO_INCREMENT for table `inventory_order_notification`
--
ALTER TABLE `inventory_order_notification`
  MODIFY `order_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Order ID';

--
-- AUTO_INCREMENT for table `inventory_pickup_location_order`
--
ALTER TABLE `inventory_pickup_location_order`
  MODIFY `order_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Order ID';

--
-- AUTO_INCREMENT for table `inventory_pickup_location_quote_address`
--
ALTER TABLE `inventory_pickup_location_quote_address`
  MODIFY `address_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Quote Address ID';

--
-- AUTO_INCREMENT for table `inventory_reservation`
--
ALTER TABLE `inventory_reservation`
  MODIFY `reservation_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_source_carrier_link`
--
ALTER TABLE `inventory_source_carrier_link`
  MODIFY `link_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_source_item`
--
ALTER TABLE `inventory_source_item`
  MODIFY `source_item_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_source_stock_link`
--
ALTER TABLE `inventory_source_stock_link`
  MODIFY `link_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory_stock`
--
ALTER TABLE `inventory_stock`
  MODIFY `stock_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `layout_link`
--
ALTER TABLE `layout_link`
  MODIFY `layout_link_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID';

--
-- AUTO_INCREMENT for table `layout_update`
--
ALTER TABLE `layout_update`
  MODIFY `layout_update_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Layout Update ID';

--
-- AUTO_INCREMENT for table `magento_acknowledged_bulk`
--
ALTER TABLE `magento_acknowledged_bulk`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Internal ID';

--
-- AUTO_INCREMENT for table `magento_bulk`
--
ALTER TABLE `magento_bulk`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Bulk Internal ID (must not be exposed)';

--
-- AUTO_INCREMENT for table `magento_login_as_customer_log`
--
ALTER TABLE `magento_login_as_customer_log`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT COMMENT 'Log Id';

--
-- AUTO_INCREMENT for table `magento_operation`
--
ALTER TABLE `magento_operation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Operation ID';

--
-- AUTO_INCREMENT for table `media_gallery_asset`
--
ALTER TABLE `media_gallery_asset`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `media_gallery_keyword`
--
ALTER TABLE `media_gallery_keyword`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Keyword ID';

--
-- AUTO_INCREMENT for table `mview_state`
--
ALTER TABLE `mview_state`
  MODIFY `state_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'View State ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `newsletter_problem`
--
ALTER TABLE `newsletter_problem`
  MODIFY `problem_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Problem ID';

--
-- AUTO_INCREMENT for table `newsletter_queue`
--
ALTER TABLE `newsletter_queue`
  MODIFY `queue_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Queue ID';

--
-- AUTO_INCREMENT for table `newsletter_queue_link`
--
ALTER TABLE `newsletter_queue_link`
  MODIFY `queue_link_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Queue Link ID';

--
-- AUTO_INCREMENT for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  MODIFY `subscriber_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Subscriber ID';

--
-- AUTO_INCREMENT for table `newsletter_template`
--
ALTER TABLE `newsletter_template`
  MODIFY `template_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Template ID';

--
-- AUTO_INCREMENT for table `oauth_consumer`
--
ALTER TABLE `oauth_consumer`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `oauth_token`
--
ALTER TABLE `oauth_token`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `oauth_token_request_log`
--
ALTER TABLE `oauth_token_request_log`
  MODIFY `log_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID';

--
-- AUTO_INCREMENT for table `pagebuilder_template`
--
ALTER TABLE `pagebuilder_template`
  MODIFY `template_id` int NOT NULL AUTO_INCREMENT COMMENT 'Template ID Auto Increment';

--
-- AUTO_INCREMENT for table `password_reset_request_event`
--
ALTER TABLE `password_reset_request_event`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `patch_list`
--
ALTER TABLE `patch_list`
  MODIFY `patch_id` int NOT NULL AUTO_INCREMENT COMMENT 'Patch Auto Increment', AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `paypal_billing_agreement`
--
ALTER TABLE `paypal_billing_agreement`
  MODIFY `agreement_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Agreement ID';

--
-- AUTO_INCREMENT for table `paypal_cert`
--
ALTER TABLE `paypal_cert`
  MODIFY `cert_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Cert ID';

--
-- AUTO_INCREMENT for table `paypal_payment_transaction`
--
ALTER TABLE `paypal_payment_transaction`
  MODIFY `transaction_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `paypal_settlement_report`
--
ALTER TABLE `paypal_settlement_report`
  MODIFY `report_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Report ID';

--
-- AUTO_INCREMENT for table `paypal_settlement_report_row`
--
ALTER TABLE `paypal_settlement_report_row`
  MODIFY `row_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Row ID';

--
-- AUTO_INCREMENT for table `persistent_session`
--
ALTER TABLE `persistent_session`
  MODIFY `persistent_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Session ID';

--
-- AUTO_INCREMENT for table `product_alert_price`
--
ALTER TABLE `product_alert_price`
  MODIFY `alert_price_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product alert price ID';

--
-- AUTO_INCREMENT for table `product_alert_stock`
--
ALTER TABLE `product_alert_stock`
  MODIFY `alert_stock_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock ID';

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Queue ID', AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `queue_lock`
--
ALTER TABLE `queue_lock`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Message ID';

--
-- AUTO_INCREMENT for table `queue_message`
--
ALTER TABLE `queue_message`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Message ID';

--
-- AUTO_INCREMENT for table `queue_message_status`
--
ALTER TABLE `queue_message_status`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Relation ID';

--
-- AUTO_INCREMENT for table `quote`
--
ALTER TABLE `quote`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `quote_address`
--
ALTER TABLE `quote_address`
  MODIFY `address_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Address ID';

--
-- AUTO_INCREMENT for table `quote_address_item`
--
ALTER TABLE `quote_address_item`
  MODIFY `address_item_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Address Item ID';

--
-- AUTO_INCREMENT for table `quote_id_mask`
--
ALTER TABLE `quote_id_mask`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `quote_item`
--
ALTER TABLE `quote_item`
  MODIFY `item_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item ID';

--
-- AUTO_INCREMENT for table `quote_item_option`
--
ALTER TABLE `quote_item_option`
  MODIFY `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option ID';

--
-- AUTO_INCREMENT for table `quote_payment`
--
ALTER TABLE `quote_payment`
  MODIFY `payment_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Payment ID';

--
-- AUTO_INCREMENT for table `quote_shipping_rate`
--
ALTER TABLE `quote_shipping_rate`
  MODIFY `rate_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rate ID';

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rating ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rating_entity`
--
ALTER TABLE `rating_entity`
  MODIFY `entity_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rating_option`
--
ALTER TABLE `rating_option`
  MODIFY `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rating Option ID', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `rating_option_vote`
--
ALTER TABLE `rating_option_vote`
  MODIFY `vote_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Vote ID';

--
-- AUTO_INCREMENT for table `rating_option_vote_aggregated`
--
ALTER TABLE `rating_option_vote_aggregated`
  MODIFY `primary_id` int NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation ID';

--
-- AUTO_INCREMENT for table `release_notification_viewer_log`
--
ALTER TABLE `release_notification_viewer_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID';

--
-- AUTO_INCREMENT for table `reporting_counts`
--
ALTER TABLE `reporting_counts`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `reporting_module_status`
--
ALTER TABLE `reporting_module_status`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Module ID';

--
-- AUTO_INCREMENT for table `reporting_orders`
--
ALTER TABLE `reporting_orders`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `reporting_system_updates`
--
ALTER TABLE `reporting_system_updates`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `reporting_users`
--
ALTER TABLE `reporting_users`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `report_compared_product_index`
--
ALTER TABLE `report_compared_product_index`
  MODIFY `index_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Index ID';

--
-- AUTO_INCREMENT for table `report_event`
--
ALTER TABLE `report_event`
  MODIFY `event_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Event ID';

--
-- AUTO_INCREMENT for table `report_event_types`
--
ALTER TABLE `report_event_types`
  MODIFY `event_type_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Event Type ID', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `report_viewed_product_aggregated_daily`
--
ALTER TABLE `report_viewed_product_aggregated_daily`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `report_viewed_product_aggregated_monthly`
--
ALTER TABLE `report_viewed_product_aggregated_monthly`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `report_viewed_product_aggregated_yearly`
--
ALTER TABLE `report_viewed_product_aggregated_yearly`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `report_viewed_product_index`
--
ALTER TABLE `report_viewed_product_index`
  MODIFY `index_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Index ID';

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review ID';

--
-- AUTO_INCREMENT for table `review_detail`
--
ALTER TABLE `review_detail`
  MODIFY `detail_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review detail ID';

--
-- AUTO_INCREMENT for table `review_entity`
--
ALTER TABLE `review_entity`
  MODIFY `entity_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review entity ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review_entity_summary`
--
ALTER TABLE `review_entity_summary`
  MODIFY `primary_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity ID';

--
-- AUTO_INCREMENT for table `review_status`
--
ALTER TABLE `review_status`
  MODIFY `status_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Status ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salesrule`
--
ALTER TABLE `salesrule`
  MODIFY `rule_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `salesrule_coupon`
--
ALTER TABLE `salesrule_coupon`
  MODIFY `coupon_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Coupon ID';

--
-- AUTO_INCREMENT for table `salesrule_coupon_aggregated`
--
ALTER TABLE `salesrule_coupon_aggregated`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `salesrule_coupon_aggregated_order`
--
ALTER TABLE `salesrule_coupon_aggregated_order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `salesrule_coupon_aggregated_updated`
--
ALTER TABLE `salesrule_coupon_aggregated_updated`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `salesrule_customer`
--
ALTER TABLE `salesrule_customer`
  MODIFY `rule_customer_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer ID';

--
-- AUTO_INCREMENT for table `salesrule_label`
--
ALTER TABLE `salesrule_label`
  MODIFY `label_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Label ID';

--
-- AUTO_INCREMENT for table `sales_bestsellers_aggregated_daily`
--
ALTER TABLE `sales_bestsellers_aggregated_daily`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `sales_bestsellers_aggregated_monthly`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `sales_bestsellers_aggregated_yearly`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `sales_creditmemo`
--
ALTER TABLE `sales_creditmemo`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_creditmemo_comment`
--
ALTER TABLE `sales_creditmemo_comment`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_creditmemo_item`
--
ALTER TABLE `sales_creditmemo_item`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_data_exporter_orders_index_sequence`
--
ALTER TABLE `sales_data_exporter_orders_index_sequence`
  MODIFY `i` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Auto Increment ID';

--
-- AUTO_INCREMENT for table `sales_data_exporter_order_statuses_index_sequence`
--
ALTER TABLE `sales_data_exporter_order_statuses_index_sequence`
  MODIFY `i` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Auto Increment ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_invoice`
--
ALTER TABLE `sales_invoice`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_invoiced_aggregated`
--
ALTER TABLE `sales_invoiced_aggregated`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `sales_invoiced_aggregated_order`
--
ALTER TABLE `sales_invoiced_aggregated_order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `sales_invoice_comment`
--
ALTER TABLE `sales_invoice_comment`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_invoice_item`
--
ALTER TABLE `sales_invoice_item`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_order_address`
--
ALTER TABLE `sales_order_address`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_order_aggregated_created`
--
ALTER TABLE `sales_order_aggregated_created`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `sales_order_aggregated_updated`
--
ALTER TABLE `sales_order_aggregated_updated`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `sales_order_data_exporter_cl`
--
ALTER TABLE `sales_order_data_exporter_cl`
  MODIFY `version_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Version ID';

--
-- AUTO_INCREMENT for table `sales_order_item`
--
ALTER TABLE `sales_order_item`
  MODIFY `item_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item ID';

--
-- AUTO_INCREMENT for table `sales_order_payment`
--
ALTER TABLE `sales_order_payment`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_order_status_data_exporter_cl`
--
ALTER TABLE `sales_order_status_data_exporter_cl`
  MODIFY `version_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Version ID';

--
-- AUTO_INCREMENT for table `sales_order_status_history`
--
ALTER TABLE `sales_order_status_history`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_order_tax`
--
ALTER TABLE `sales_order_tax`
  MODIFY `tax_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tax ID';

--
-- AUTO_INCREMENT for table `sales_order_tax_item`
--
ALTER TABLE `sales_order_tax_item`
  MODIFY `tax_item_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tax Item ID';

--
-- AUTO_INCREMENT for table `sales_payment_transaction`
--
ALTER TABLE `sales_payment_transaction`
  MODIFY `transaction_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Transaction ID';

--
-- AUTO_INCREMENT for table `sales_refunded_aggregated`
--
ALTER TABLE `sales_refunded_aggregated`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `sales_refunded_aggregated_order`
--
ALTER TABLE `sales_refunded_aggregated_order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `sales_sequence_meta`
--
ALTER TABLE `sales_sequence_meta`
  MODIFY `meta_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sales_sequence_profile`
--
ALTER TABLE `sales_sequence_profile`
  MODIFY `profile_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sales_shipment`
--
ALTER TABLE `sales_shipment`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_shipment_comment`
--
ALTER TABLE `sales_shipment_comment`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_shipment_item`
--
ALTER TABLE `sales_shipment_item`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_shipment_track`
--
ALTER TABLE `sales_shipment_track`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `sales_shipping_aggregated`
--
ALTER TABLE `sales_shipping_aggregated`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `sales_shipping_aggregated_order`
--
ALTER TABLE `sales_shipping_aggregated_order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `search_query`
--
ALTER TABLE `search_query`
  MODIFY `query_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Query ID';

--
-- AUTO_INCREMENT for table `search_synonyms`
--
ALTER TABLE `search_synonyms`
  MODIFY `group_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Synonyms Group ID';

--
-- AUTO_INCREMENT for table `sendfriend_log`
--
ALTER TABLE `sendfriend_log`
  MODIFY `log_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID';

--
-- AUTO_INCREMENT for table `sequence_creditmemo_0`
--
ALTER TABLE `sequence_creditmemo_0`
  MODIFY `sequence_value` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sequence_creditmemo_1`
--
ALTER TABLE `sequence_creditmemo_1`
  MODIFY `sequence_value` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sequence_invoice_0`
--
ALTER TABLE `sequence_invoice_0`
  MODIFY `sequence_value` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sequence_invoice_1`
--
ALTER TABLE `sequence_invoice_1`
  MODIFY `sequence_value` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sequence_order_0`
--
ALTER TABLE `sequence_order_0`
  MODIFY `sequence_value` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sequence_order_1`
--
ALTER TABLE `sequence_order_1`
  MODIFY `sequence_value` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sequence_shipment_0`
--
ALTER TABLE `sequence_shipment_0`
  MODIFY `sequence_value` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sequence_shipment_1`
--
ALTER TABLE `sequence_shipment_1`
  MODIFY `sequence_value` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_tablerate`
--
ALTER TABLE `shipping_tablerate`
  MODIFY `pk` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary key';

--
-- AUTO_INCREMENT for table `sitemap`
--
ALTER TABLE `sitemap`
  MODIFY `sitemap_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Sitemap ID';

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Store ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stores_data_exporter_index_sequence`
--
ALTER TABLE `stores_data_exporter_index_sequence`
  MODIFY `i` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Auto Increment ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `store_data_exporter_cl`
--
ALTER TABLE `store_data_exporter_cl`
  MODIFY `version_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Version ID';

--
-- AUTO_INCREMENT for table `store_group`
--
ALTER TABLE `store_group`
  MODIFY `group_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Group ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `store_website`
--
ALTER TABLE `store_website`
  MODIFY `website_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Website ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tax_calculation`
--
ALTER TABLE `tax_calculation`
  MODIFY `tax_calculation_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation ID';

--
-- AUTO_INCREMENT for table `tax_calculation_rate`
--
ALTER TABLE `tax_calculation_rate`
  MODIFY `tax_calculation_rate_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_calculation_rate_title`
--
ALTER TABLE `tax_calculation_rate_title`
  MODIFY `tax_calculation_rate_title_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title ID';

--
-- AUTO_INCREMENT for table `tax_calculation_rule`
--
ALTER TABLE `tax_calculation_rule`
  MODIFY `tax_calculation_rule_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule ID';

--
-- AUTO_INCREMENT for table `tax_class`
--
ALTER TABLE `tax_class`
  MODIFY `class_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'Class ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tax_order_aggregated_created`
--
ALTER TABLE `tax_order_aggregated_created`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `tax_order_aggregated_updated`
--
ALTER TABLE `tax_order_aggregated_updated`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `theme_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `theme_file`
--
ALTER TABLE `theme_file`
  MODIFY `theme_files_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier';

--
-- AUTO_INCREMENT for table `translation`
--
ALTER TABLE `translation`
  MODIFY `key_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Key ID of Translation';

--
-- AUTO_INCREMENT for table `ui_bookmark`
--
ALTER TABLE `ui_bookmark`
  MODIFY `bookmark_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Bookmark identifier', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `url_rewrite`
--
ALTER TABLE `url_rewrite`
  MODIFY `url_rewrite_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rewrite ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `variable`
--
ALTER TABLE `variable`
  MODIFY `variable_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Variable ID';

--
-- AUTO_INCREMENT for table `variable_value`
--
ALTER TABLE `variable_value`
  MODIFY `value_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Variable Value ID';

--
-- AUTO_INCREMENT for table `vault_payment_token`
--
ALTER TABLE `vault_payment_token`
  MODIFY `entity_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';

--
-- AUTO_INCREMENT for table `weee_tax`
--
ALTER TABLE `weee_tax`
  MODIFY `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID';

--
-- AUTO_INCREMENT for table `widget`
--
ALTER TABLE `widget`
  MODIFY `widget_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Widget ID';

--
-- AUTO_INCREMENT for table `widget_instance`
--
ALTER TABLE `widget_instance`
  MODIFY `instance_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Instance ID';

--
-- AUTO_INCREMENT for table `widget_instance_page`
--
ALTER TABLE `widget_instance_page`
  MODIFY `page_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Page ID';

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID';

--
-- AUTO_INCREMENT for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  MODIFY `wishlist_item_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID';

--
-- AUTO_INCREMENT for table `wishlist_item_option`
--
ALTER TABLE `wishlist_item_option`
  MODIFY `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option ID';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_adobe_ims_webapi`
--
ALTER TABLE `admin_adobe_ims_webapi`
  ADD CONSTRAINT `ADMIN_ADOBE_IMS_WEBAPI_ADMIN_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_passwords`
--
ALTER TABLE `admin_passwords`
  ADD CONSTRAINT `ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_user_expiration`
--
ALTER TABLE `admin_user_expiration`
  ADD CONSTRAINT `ADMIN_USER_EXPIRATION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_user_session`
--
ALTER TABLE `admin_user_session`
  ADD CONSTRAINT `ADMIN_USER_SESSION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `adobe_stock_asset`
--
ALTER TABLE `adobe_stock_asset`
  ADD CONSTRAINT `ADOBE_STOCK_ASSET_CATEGORY_ID_ADOBE_STOCK_CATEGORY_ID` FOREIGN KEY (`category_id`) REFERENCES `adobe_stock_category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ADOBE_STOCK_ASSET_CREATOR_ID_ADOBE_STOCK_CREATOR_ID` FOREIGN KEY (`creator_id`) REFERENCES `adobe_stock_creator` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` FOREIGN KEY (`media_gallery_id`) REFERENCES `media_gallery_asset` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `adobe_user_profile`
--
ALTER TABLE `adobe_user_profile`
  ADD CONSTRAINT `ADOBE_USER_PROFILE_ADMIN_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `authorization_rule`
--
ALTER TABLE `authorization_rule`
  ADD CONSTRAINT `AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `authorization_role` (`role_id`) ON DELETE CASCADE;

--
-- Constraints for table `braintree_transaction_details`
--
ALTER TABLE `braintree_transaction_details`
  ADD CONSTRAINT `BRAINTREE_TRANSACTION_DETAILS_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `cataloginventory_stock_item`
--
ALTER TABLE `cataloginventory_stock_item`
  ADD CONSTRAINT `CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalogrule_customer_group`
--
ALTER TABLE `catalogrule_customer_group`
  ADD CONSTRAINT `CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalogrule_website`
--
ALTER TABLE `catalogrule_website`
  ADD CONSTRAINT `CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalogsearch_recommendations`
--
ALTER TABLE `catalogsearch_recommendations`
  ADD CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`query_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`relation_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_category_entity_datetime`
--
ALTER TABLE `catalog_category_entity_datetime`
  ADD CONSTRAINT `CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_category_entity_decimal`
--
ALTER TABLE `catalog_category_entity_decimal`
  ADD CONSTRAINT `CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_category_entity_int`
--
ALTER TABLE `catalog_category_entity_int`
  ADD CONSTRAINT `CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_category_entity_text`
--
ALTER TABLE `catalog_category_entity_text`
  ADD CONSTRAINT `CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_category_entity_varchar`
--
ALTER TABLE `catalog_category_entity_varchar`
  ADD CONSTRAINT `CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_category_product`
--
ALTER TABLE `catalog_category_product`
  ADD CONSTRAINT `CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_compare_item`
--
ALTER TABLE `catalog_compare_item`
  ADD CONSTRAINT `CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_COMPARE_ITEM_LIST_ID_CATALOG_COMPARE_LIST_LIST_ID` FOREIGN KEY (`list_id`) REFERENCES `catalog_compare_list` (`list_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_COMPARE_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `catalog_compare_list`
--
ALTER TABLE `catalog_compare_list`
  ADD CONSTRAINT `CATALOG_COMPARE_LIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_eav_attribute`
--
ALTER TABLE `catalog_eav_attribute`
  ADD CONSTRAINT `CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_bundle_option`
--
ALTER TABLE `catalog_product_bundle_option`
  ADD CONSTRAINT `CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_bundle_option_value`
--
ALTER TABLE `catalog_product_bundle_option_value`
  ADD CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_bundle_price_index`
--
ALTER TABLE `catalog_product_bundle_price_index`
  ADD CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_bundle_selection`
--
ALTER TABLE `catalog_product_bundle_selection`
  ADD CONSTRAINT `CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_bundle_selection_price`
--
ALTER TABLE `catalog_product_bundle_selection_price`
  ADD CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  ADD CONSTRAINT `CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_decimal`
--
ALTER TABLE `catalog_product_entity_decimal`
  ADD CONSTRAINT `CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_gallery`
--
ALTER TABLE `catalog_product_entity_gallery`
  ADD CONSTRAINT `CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_int`
--
ALTER TABLE `catalog_product_entity_int`
  ADD CONSTRAINT `CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery`
--
ALTER TABLE `catalog_product_entity_media_gallery`
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery_value`
--
ALTER TABLE `catalog_product_entity_media_gallery_value`
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery_value_to_entity`
--
ALTER TABLE `catalog_product_entity_media_gallery_value_to_entity`
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A6C6C8FAA386736921D3A7C4B50B1185` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery_value_video`
--
ALTER TABLE `catalog_product_entity_media_gallery_value_video`
  ADD CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6FDF205946906B0E653E60AA769899F8` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_text`
--
ALTER TABLE `catalog_product_entity_text`
  ADD CONSTRAINT `CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_tier_price`
--
ALTER TABLE `catalog_product_entity_tier_price`
  ADD CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_entity_varchar`
--
ALTER TABLE `catalog_product_entity_varchar`
  ADD CONSTRAINT `CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_frontend_action`
--
ALTER TABLE `catalog_product_frontend_action`
  ADD CONSTRAINT `CAT_PRD_FRONTEND_ACTION_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_index_tier_price`
--
ALTER TABLE `catalog_product_index_tier_price`
  ADD CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_index_website`
--
ALTER TABLE `catalog_product_index_website`
  ADD CONSTRAINT `CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_link`
--
ALTER TABLE `catalog_product_link`
  ADD CONSTRAINT `CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute`
--
ALTER TABLE `catalog_product_link_attribute`
  ADD CONSTRAINT `CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_decimal`
--
ALTER TABLE `catalog_product_link_attribute_decimal`
  ADD CONSTRAINT `CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_int`
--
ALTER TABLE `catalog_product_link_attribute_int`
  ADD CONSTRAINT `CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_varchar`
--
ALTER TABLE `catalog_product_link_attribute_varchar`
  ADD CONSTRAINT `CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_option`
--
ALTER TABLE `catalog_product_option`
  ADD CONSTRAINT `CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_option_price`
--
ALTER TABLE `catalog_product_option_price`
  ADD CONSTRAINT `CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_option_title`
--
ALTER TABLE `catalog_product_option_title`
  ADD CONSTRAINT `CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_option_type_price`
--
ALTER TABLE `catalog_product_option_type_price`
  ADD CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_option_type_title`
--
ALTER TABLE `catalog_product_option_type_title`
  ADD CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_option_type_value`
--
ALTER TABLE `catalog_product_option_type_value`
  ADD CONSTRAINT `CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_relation`
--
ALTER TABLE `catalog_product_relation`
  ADD CONSTRAINT `CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_super_attribute`
--
ALTER TABLE `catalog_product_super_attribute`
  ADD CONSTRAINT `CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_super_attribute_label`
--
ALTER TABLE `catalog_product_super_attribute_label`
  ADD CONSTRAINT `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_super_link`
--
ALTER TABLE `catalog_product_super_link`
  ADD CONSTRAINT `CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_product_website`
--
ALTER TABLE `catalog_product_website`
  ADD CONSTRAINT `CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_url_rewrite_product_category`
--
ALTER TABLE `catalog_url_rewrite_product_category`
  ADD CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BB79E64705D7F17FE181F23144528FC8` FOREIGN KEY (`url_rewrite_id`) REFERENCES `url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE;

--
-- Constraints for table `checkout_agreement_store`
--
ALTER TABLE `checkout_agreement_store`
  ADD CONSTRAINT `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_block_store`
--
ALTER TABLE `cms_block_store`
  ADD CONSTRAINT `CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_page_store`
--
ALTER TABLE `cms_page_store`
  ADD CONSTRAINT `CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_address_entity`
--
ALTER TABLE `customer_address_entity`
  ADD CONSTRAINT `CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_address_entity_datetime`
--
ALTER TABLE `customer_address_entity_datetime`
  ADD CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_address_entity_decimal`
--
ALTER TABLE `customer_address_entity_decimal`
  ADD CONSTRAINT `CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_address_entity_int`
--
ALTER TABLE `customer_address_entity_int`
  ADD CONSTRAINT `CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_address_entity_text`
--
ALTER TABLE `customer_address_entity_text`
  ADD CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_address_entity_varchar`
--
ALTER TABLE `customer_address_entity_varchar`
  ADD CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_eav_attribute`
--
ALTER TABLE `customer_eav_attribute`
  ADD CONSTRAINT `CUSTOMER_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_eav_attribute_website`
--
ALTER TABLE `customer_eav_attribute_website`
  ADD CONSTRAINT `CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_entity`
--
ALTER TABLE `customer_entity`
  ADD CONSTRAINT `CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE SET NULL;

--
-- Constraints for table `customer_entity_datetime`
--
ALTER TABLE `customer_entity_datetime`
  ADD CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_entity_decimal`
--
ALTER TABLE `customer_entity_decimal`
  ADD CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_entity_int`
--
ALTER TABLE `customer_entity_int`
  ADD CONSTRAINT `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_entity_text`
--
ALTER TABLE `customer_entity_text`
  ADD CONSTRAINT `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_entity_varchar`
--
ALTER TABLE `customer_entity_varchar`
  ADD CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_form_attribute`
--
ALTER TABLE `customer_form_attribute`
  ADD CONSTRAINT `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `design_change`
--
ALTER TABLE `design_change`
  ADD CONSTRAINT `DESIGN_CHANGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `directory_country_region_name`
--
ALTER TABLE `directory_country_region_name`
  ADD CONSTRAINT `DIR_COUNTRY_REGION_NAME_REGION_ID_DIR_COUNTRY_REGION_REGION_ID` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE;

--
-- Constraints for table `downloadable_link`
--
ALTER TABLE `downloadable_link`
  ADD CONSTRAINT `DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `downloadable_link_price`
--
ALTER TABLE `downloadable_link_price`
  ADD CONSTRAINT `DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD CONSTRAINT `DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE SET NULL;

--
-- Constraints for table `downloadable_link_purchased_item`
--
ALTER TABLE `downloadable_link_purchased_item`
  ADD CONSTRAINT `DL_LNK_PURCHASED_ITEM_ORDER_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `DL_LNK_PURCHASED_ITEM_PURCHASED_ID_DL_LNK_PURCHASED_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE;

--
-- Constraints for table `downloadable_link_title`
--
ALTER TABLE `downloadable_link_title`
  ADD CONSTRAINT `DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `downloadable_sample`
--
ALTER TABLE `downloadable_sample`
  ADD CONSTRAINT `DOWNLOADABLE_SAMPLE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `downloadable_sample_title`
--
ALTER TABLE `downloadable_sample_title`
  ADD CONSTRAINT `DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD CONSTRAINT `EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  ADD CONSTRAINT `EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  ADD CONSTRAINT `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD CONSTRAINT `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_attribute_option_swatch`
--
ALTER TABLE `eav_attribute_option_swatch`
  ADD CONSTRAINT `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  ADD CONSTRAINT `EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_attribute_set`
--
ALTER TABLE `eav_attribute_set`
  ADD CONSTRAINT `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_entity`
--
ALTER TABLE `eav_entity`
  ADD CONSTRAINT `EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_entity_attribute`
--
ALTER TABLE `eav_entity_attribute`
  ADD CONSTRAINT `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_entity_datetime`
--
ALTER TABLE `eav_entity_datetime`
  ADD CONSTRAINT `EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_entity_decimal`
--
ALTER TABLE `eav_entity_decimal`
  ADD CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_entity_int`
--
ALTER TABLE `eav_entity_int`
  ADD CONSTRAINT `EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_entity_store`
--
ALTER TABLE `eav_entity_store`
  ADD CONSTRAINT `EAV_ENTITY_STORE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_entity_text`
--
ALTER TABLE `eav_entity_text`
  ADD CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_entity_varchar`
--
ALTER TABLE `eav_entity_varchar`
  ADD CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_form_element`
--
ALTER TABLE `eav_form_element`
  ADD CONSTRAINT `EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_form_fieldset`
--
ALTER TABLE `eav_form_fieldset`
  ADD CONSTRAINT `EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_form_fieldset_label`
--
ALTER TABLE `eav_form_fieldset_label`
  ADD CONSTRAINT `EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_form_type`
--
ALTER TABLE `eav_form_type`
  ADD CONSTRAINT `EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `eav_form_type_entity`
--
ALTER TABLE `eav_form_type_entity`
  ADD CONSTRAINT `EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

--
-- Constraints for table `googleoptimizer_code`
--
ALTER TABLE `googleoptimizer_code`
  ADD CONSTRAINT `GOOGLEOPTIMIZER_CODE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `integration`
--
ALTER TABLE `integration`
  ADD CONSTRAINT `INTEGRATION_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_order_notification`
--
ALTER TABLE `inventory_order_notification`
  ADD CONSTRAINT `INVENTORY_ORDER_NOTIFICATION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_pickup_location_order`
--
ALTER TABLE `inventory_pickup_location_order`
  ADD CONSTRAINT `INVENTORY_PICKUP_LOCATION_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_pickup_location_quote_address`
--
ALTER TABLE `inventory_pickup_location_quote_address`
  ADD CONSTRAINT `INV_PICKUP_LOCATION_QUOTE_ADDR_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_source_carrier_link`
--
ALTER TABLE `inventory_source_carrier_link`
  ADD CONSTRAINT `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_source_item`
--
ALTER TABLE `inventory_source_item`
  ADD CONSTRAINT `INVENTORY_SOURCE_ITEM_SOURCE_CODE_INVENTORY_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_source_stock_link`
--
ALTER TABLE `inventory_source_stock_link`
  ADD CONSTRAINT `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_stock_sales_channel`
--
ALTER TABLE `inventory_stock_sales_channel`
  ADD CONSTRAINT `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE;

--
-- Constraints for table `layout_link`
--
ALTER TABLE `layout_link`
  ADD CONSTRAINT `LAYOUT_LINK_LAYOUT_UPDATE_ID_LAYOUT_UPDATE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `LAYOUT_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE;

--
-- Constraints for table `login_as_customer_assistance_allowed`
--
ALTER TABLE `login_as_customer_assistance_allowed`
  ADD CONSTRAINT `LOGIN_AS_CSTR_ASSISTANCE_ALLOWED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `magento_acknowledged_bulk`
--
ALTER TABLE `magento_acknowledged_bulk`
  ADD CONSTRAINT `MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `magento_bulk` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `magento_operation`
--
ALTER TABLE `magento_operation`
  ADD CONSTRAINT `MAGENTO_OPERATION_BULK_UUID_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `magento_bulk` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `media_gallery_asset_keyword`
--
ALTER TABLE `media_gallery_asset_keyword`
  ADD CONSTRAINT `MEDIA_GALLERY_ASSET_KEYWORD_ASSET_ID_MEDIA_GALLERY_ASSET_ID` FOREIGN KEY (`asset_id`) REFERENCES `media_gallery_asset` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MEDIA_GALLERY_ASSET_KEYWORD_KEYWORD_ID_MEDIA_GALLERY_KEYWORD_ID` FOREIGN KEY (`keyword_id`) REFERENCES `media_gallery_keyword` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `newsletter_problem`
--
ALTER TABLE `newsletter_problem`
  ADD CONSTRAINT `NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE;

--
-- Constraints for table `newsletter_queue`
--
ALTER TABLE `newsletter_queue`
  ADD CONSTRAINT `NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE;

--
-- Constraints for table `newsletter_queue_link`
--
ALTER TABLE `newsletter_queue_link`
  ADD CONSTRAINT `NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE;

--
-- Constraints for table `newsletter_queue_store_link`
--
ALTER TABLE `newsletter_queue_store_link`
  ADD CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  ADD CONSTRAINT `NEWSLETTER_SUBSCRIBER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `oauth_nonce`
--
ALTER TABLE `oauth_nonce`
  ADD CONSTRAINT `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_token`
--
ALTER TABLE `oauth_token`
  ADD CONSTRAINT `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `paypal_billing_agreement`
--
ALTER TABLE `paypal_billing_agreement`
  ADD CONSTRAINT `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PAYPAL_BILLING_AGREEMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `paypal_billing_agreement_order`
--
ALTER TABLE `paypal_billing_agreement_order`
  ADD CONSTRAINT `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PAYPAL_BILLING_AGRT_ORDER_AGRT_ID_PAYPAL_BILLING_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `paypal_billing_agreement` (`agreement_id`) ON DELETE CASCADE;

--
-- Constraints for table `paypal_cert`
--
ALTER TABLE `paypal_cert`
  ADD CONSTRAINT `PAYPAL_CERT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `paypal_settlement_report_row`
--
ALTER TABLE `paypal_settlement_report_row`
  ADD CONSTRAINT `FK_E183E488F593E0DE10C6EBFFEBAC9B55` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE;

--
-- Constraints for table `persistent_session`
--
ALTER TABLE `persistent_session`
  ADD CONSTRAINT `PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_alert_price`
--
ALTER TABLE `product_alert_price`
  ADD CONSTRAINT `PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PRODUCT_ALERT_PRICE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PRODUCT_ALERT_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PRODUCT_ALERT_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_alert_stock`
--
ALTER TABLE `product_alert_stock`
  ADD CONSTRAINT `PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PRODUCT_ALERT_STOCK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PRODUCT_ALERT_STOCK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `PRODUCT_ALERT_STOCK_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `queue_message_status`
--
ALTER TABLE `queue_message_status`
  ADD CONSTRAINT `QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID` FOREIGN KEY (`message_id`) REFERENCES `queue_message` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `QUEUE_MESSAGE_STATUS_QUEUE_ID_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quote`
--
ALTER TABLE `quote`
  ADD CONSTRAINT `QUOTE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `quote_address`
--
ALTER TABLE `quote_address`
  ADD CONSTRAINT `QUOTE_ADDRESS_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `quote_address_item`
--
ALTER TABLE `quote_address_item`
  ADD CONSTRAINT `QUOTE_ADDR_ITEM_PARENT_ITEM_ID_QUOTE_ADDR_ITEM_ADDR_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_address_item` (`address_item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`quote_address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`quote_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `quote_id_mask`
--
ALTER TABLE `quote_id_mask`
  ADD CONSTRAINT `QUOTE_ID_MASK_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `quote_item`
--
ALTER TABLE `quote_item`
  ADD CONSTRAINT `QUOTE_ITEM_PARENT_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `QUOTE_ITEM_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `QUOTE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `quote_item_option`
--
ALTER TABLE `quote_item_option`
  ADD CONSTRAINT `QUOTE_ITEM_OPTION_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `quote_payment`
--
ALTER TABLE `quote_payment`
  ADD CONSTRAINT `QUOTE_PAYMENT_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `quote_shipping_rate`
--
ALTER TABLE `quote_shipping_rate`
  ADD CONSTRAINT `QUOTE_SHIPPING_RATE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `rating_option`
--
ALTER TABLE `rating_option`
  ADD CONSTRAINT `RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE;

--
-- Constraints for table `rating_option_vote`
--
ALTER TABLE `rating_option_vote`
  ADD CONSTRAINT `RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE;

--
-- Constraints for table `rating_option_vote_aggregated`
--
ALTER TABLE `rating_option_vote_aggregated`
  ADD CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `rating_store`
--
ALTER TABLE `rating_store`
  ADD CONSTRAINT `RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `RATING_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `rating_title`
--
ALTER TABLE `rating_title`
  ADD CONSTRAINT `RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `RATING_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `release_notification_viewer_log`
--
ALTER TABLE `release_notification_viewer_log`
  ADD CONSTRAINT `RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`viewer_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `report_compared_product_index`
--
ALTER TABLE `report_compared_product_index`
  ADD CONSTRAINT `REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `report_event`
--
ALTER TABLE `report_event`
  ADD CONSTRAINT `REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_EVENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_daily`
--
ALTER TABLE `report_viewed_product_aggregated_daily`
  ADD CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_monthly`
--
ALTER TABLE `report_viewed_product_aggregated_monthly`
  ADD CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_yearly`
--
ALTER TABLE `report_viewed_product_aggregated_yearly`
  ADD CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `report_viewed_product_index`
--
ALTER TABLE `report_viewed_product_index`
  ADD CONSTRAINT `REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`);

--
-- Constraints for table `review_detail`
--
ALTER TABLE `review_detail`
  ADD CONSTRAINT `REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REVIEW_DETAIL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `review_entity_summary`
--
ALTER TABLE `review_entity_summary`
  ADD CONSTRAINT `REVIEW_ENTITY_SUMMARY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `review_store`
--
ALTER TABLE `review_store`
  ADD CONSTRAINT `REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `REVIEW_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `salesrule_coupon`
--
ALTER TABLE `salesrule_coupon`
  ADD CONSTRAINT `SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE;

--
-- Constraints for table `salesrule_coupon_aggregated`
--
ALTER TABLE `salesrule_coupon_aggregated`
  ADD CONSTRAINT `SALESRULE_COUPON_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `salesrule_coupon_aggregated_order`
--
ALTER TABLE `salesrule_coupon_aggregated_order`
  ADD CONSTRAINT `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `salesrule_coupon_aggregated_updated`
--
ALTER TABLE `salesrule_coupon_aggregated_updated`
  ADD CONSTRAINT `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `salesrule_coupon_usage`
--
ALTER TABLE `salesrule_coupon_usage`
  ADD CONSTRAINT `SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `salesrule_customer`
--
ALTER TABLE `salesrule_customer`
  ADD CONSTRAINT `SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE;

--
-- Constraints for table `salesrule_customer_group`
--
ALTER TABLE `salesrule_customer_group`
  ADD CONSTRAINT `SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE;

--
-- Constraints for table `salesrule_label`
--
ALTER TABLE `salesrule_label`
  ADD CONSTRAINT `SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `salesrule_product_attribute`
--
ALTER TABLE `salesrule_product_attribute`
  ADD CONSTRAINT `SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `salesrule_website`
--
ALTER TABLE `salesrule_website`
  ADD CONSTRAINT `SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALESRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_daily`
--
ALTER TABLE `sales_bestsellers_aggregated_daily`
  ADD CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `sales_bestsellers_aggregated_monthly`
  ADD CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `sales_bestsellers_aggregated_yearly`
  ADD CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_creditmemo`
--
ALTER TABLE `sales_creditmemo`
  ADD CONSTRAINT `SALES_CREDITMEMO_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_CREDITMEMO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_creditmemo_comment`
--
ALTER TABLE `sales_creditmemo_comment`
  ADD CONSTRAINT `SALES_CREDITMEMO_COMMENT_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_creditmemo_item`
--
ALTER TABLE `sales_creditmemo_item`
  ADD CONSTRAINT `SALES_CREDITMEMO_ITEM_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_invoice`
--
ALTER TABLE `sales_invoice`
  ADD CONSTRAINT `SALES_INVOICE_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_INVOICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_invoiced_aggregated`
--
ALTER TABLE `sales_invoiced_aggregated`
  ADD CONSTRAINT `SALES_INVOICED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_invoiced_aggregated_order`
--
ALTER TABLE `sales_invoiced_aggregated_order`
  ADD CONSTRAINT `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_invoice_comment`
--
ALTER TABLE `sales_invoice_comment`
  ADD CONSTRAINT `SALES_INVOICE_COMMENT_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_invoice_item`
--
ALTER TABLE `sales_invoice_item`
  ADD CONSTRAINT `SALES_INVOICE_ITEM_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD CONSTRAINT `SALES_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `SALES_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_order_address`
--
ALTER TABLE `sales_order_address`
  ADD CONSTRAINT `SALES_ORDER_ADDRESS_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_order_aggregated_created`
--
ALTER TABLE `sales_order_aggregated_created`
  ADD CONSTRAINT `SALES_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_order_aggregated_updated`
--
ALTER TABLE `sales_order_aggregated_updated`
  ADD CONSTRAINT `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_order_item`
--
ALTER TABLE `sales_order_item`
  ADD CONSTRAINT `SALES_ORDER_ITEM_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_ORDER_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_order_payment`
--
ALTER TABLE `sales_order_payment`
  ADD CONSTRAINT `SALES_ORDER_PAYMENT_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_order_status_history`
--
ALTER TABLE `sales_order_status_history`
  ADD CONSTRAINT `SALES_ORDER_STATUS_HISTORY_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_order_status_label`
--
ALTER TABLE `sales_order_status_label`
  ADD CONSTRAINT `SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_ORDER_STATUS_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_order_status_state`
--
ALTER TABLE `sales_order_status_state`
  ADD CONSTRAINT `SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE;

--
-- Constraints for table `sales_order_tax_item`
--
ALTER TABLE `sales_order_tax_item`
  ADD CONSTRAINT `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`associated_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `sales_order_tax` (`tax_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_payment_transaction`
--
ALTER TABLE `sales_payment_transaction`
  ADD CONSTRAINT `FK_B99FF1A06402D725EBDB0F3A7ECD47A2` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_PAYMENT_TRANSACTION_PAYMENT_ID_SALES_ORDER_PAYMENT_ENTT_ID` FOREIGN KEY (`payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_refunded_aggregated`
--
ALTER TABLE `sales_refunded_aggregated`
  ADD CONSTRAINT `SALES_REFUNDED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_refunded_aggregated_order`
--
ALTER TABLE `sales_refunded_aggregated_order`
  ADD CONSTRAINT `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_sequence_profile`
--
ALTER TABLE `sales_sequence_profile`
  ADD CONSTRAINT `SALES_SEQUENCE_PROFILE_META_ID_SALES_SEQUENCE_META_META_ID` FOREIGN KEY (`meta_id`) REFERENCES `sales_sequence_meta` (`meta_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_shipment`
--
ALTER TABLE `sales_shipment`
  ADD CONSTRAINT `SALES_SHIPMENT_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SALES_SHIPMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_shipment_comment`
--
ALTER TABLE `sales_shipment_comment`
  ADD CONSTRAINT `SALES_SHIPMENT_COMMENT_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_shipment_item`
--
ALTER TABLE `sales_shipment_item`
  ADD CONSTRAINT `SALES_SHIPMENT_ITEM_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_shipment_track`
--
ALTER TABLE `sales_shipment_track`
  ADD CONSTRAINT `SALES_SHIPMENT_TRACK_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_shipping_aggregated`
--
ALTER TABLE `sales_shipping_aggregated`
  ADD CONSTRAINT `SALES_SHIPPING_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_shipping_aggregated_order`
--
ALTER TABLE `sales_shipping_aggregated_order`
  ADD CONSTRAINT `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL;

--
-- Constraints for table `search_query`
--
ALTER TABLE `search_query`
  ADD CONSTRAINT `SEARCH_QUERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `search_synonyms`
--
ALTER TABLE `search_synonyms`
  ADD CONSTRAINT `SEARCH_SYNONYMS_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SEARCH_SYNONYMS_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `sitemap`
--
ALTER TABLE `sitemap`
  ADD CONSTRAINT `SITEMAP_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `STORE_GROUP_ID_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `store_group` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `STORE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `store_group`
--
ALTER TABLE `store_group`
  ADD CONSTRAINT `STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_calculation`
--
ALTER TABLE `tax_calculation`
  ADD CONSTRAINT `TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_calculation_rate_title`
--
ALTER TABLE `tax_calculation_rate_title`
  ADD CONSTRAINT `FK_37FB965F786AD5897BB3AE90470C42AB` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `TAX_CALCULATION_RATE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_order_aggregated_created`
--
ALTER TABLE `tax_order_aggregated_created`
  ADD CONSTRAINT `TAX_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_order_aggregated_updated`
--
ALTER TABLE `tax_order_aggregated_updated`
  ADD CONSTRAINT `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `theme_file`
--
ALTER TABLE `theme_file`
  ADD CONSTRAINT `THEME_FILE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE;

--
-- Constraints for table `translation`
--
ALTER TABLE `translation`
  ADD CONSTRAINT `TRANSLATION_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE;

--
-- Constraints for table `ui_bookmark`
--
ALTER TABLE `ui_bookmark`
  ADD CONSTRAINT `UI_BOOKMARK_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `variable_value`
--
ALTER TABLE `variable_value`
  ADD CONSTRAINT `VARIABLE_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `VARIABLE_VALUE_VARIABLE_ID_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `variable` (`variable_id`) ON DELETE CASCADE;

--
-- Constraints for table `vault_payment_token`
--
ALTER TABLE `vault_payment_token`
  ADD CONSTRAINT `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `vault_payment_token_order_payment_link`
--
ALTER TABLE `vault_payment_token_order_payment_link`
  ADD CONSTRAINT `FK_4ED894655446D385894580BECA993862` FOREIGN KEY (`payment_token_id`) REFERENCES `vault_payment_token` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CF37B9D854256534BE23C818F6291CA2` FOREIGN KEY (`order_payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `weee_tax`
--
ALTER TABLE `weee_tax`
  ADD CONSTRAINT `WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `WEEE_TAX_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE;

--
-- Constraints for table `widget_instance`
--
ALTER TABLE `widget_instance`
  ADD CONSTRAINT `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE;

--
-- Constraints for table `widget_instance_page`
--
ALTER TABLE `widget_instance_page`
  ADD CONSTRAINT `WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE;

--
-- Constraints for table `widget_instance_page_layout`
--
ALTER TABLE `widget_instance_page_layout`
  ADD CONSTRAINT `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `WIDGET_INSTANCE_PAGE_LYT_LYT_UPDATE_ID_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  ADD CONSTRAINT `WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `WISHLIST_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist_item_option`
--
ALTER TABLE `wishlist_item_option`
  ADD CONSTRAINT `FK_A014B30B04B72DD0EAB3EECD779728D6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
