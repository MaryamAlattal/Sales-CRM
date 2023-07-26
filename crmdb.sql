-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2023 at 06:03 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crmdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL,
  `activity_title` varchar(100) NOT NULL,
  `activity_type` varchar(50) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `reply` text DEFAULT NULL,
  `reply_by` int(11) DEFAULT NULL COMMENT 'staff_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`activity_id`, `activity_title`, `activity_type`, `staff_id`, `date`, `reply`, `reply_by`) VALUES
(1021, 'opportunity added', 'opportunity', 5, '2023-04-30', 'helllooooo', 1),
(1022, 'opportunity added', 'opportunity', 4, '2023-04-30', 'asSasS', 1),
(1023, 'opportunity added', 'opportunity', 3, '2023-05-05', NULL, NULL),
(1024, 'opportunity added', 'opportunity', 4, '2023-05-05', NULL, NULL),
(72101, 'quotation added', 'quotation', 4, '2023-05-01', NULL, NULL),
(72102, 'quotation added', 'quotation', 4, '2023-05-03', 'ssdasdad', 1),
(72103, 'quotation added', 'quotation', 4, '2023-05-03', 'adasdad', 1),
(72104, 'quotation added', 'quotation', 2, '2023-05-04', 'dsadasd', 2),
(72105, 'quotation added', 'quotation', 4, '2023-05-05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(100) NOT NULL,
  `categories_description` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_description`) VALUES
(1, 'Dresses', 'All Dresses/New In Dresses/Maxi Dresses/Midi Dresses/Mini Dresses'),
(2, 'Coats/Jackets', 'Puffer Jackets/Spring Coats & Jackets/Blazers/\r\nTrench Coats/Faux Fur Coats/Trench Coats'),
(3, 'Trousers', 'Cargo Trousers/Leather Look Trousers/Cargo Trousers/Flared Trousers/Culottes/Skinny Trousers'),
(4, 'pullovers', 'pull overs are in trend in winter');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comment_subject` varchar(250) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `sender_mail` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `contact_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `sender_mail`, `subject`, `message`, `date`, `contact_no`) VALUES
(1, 'mariam@gmail.com', 'request a demo', '  we are requesting a detail demo about the product', '2023-05-05 18:46:14', '8838383');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `postcode` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 1,
  `regestration_date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `otp` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `address`, `area`, `city`, `phone`, `postcode`, `email`, `username`, `password`, `gender`, `regestration_date`, `deleted`, `otp`) VALUES
(1, 'Johnny Depp', ' 849 S Broadway,  United States', 'New pot', 'Jersey ', '+1 213-478-0755', 'JY 98900', '2sneha4@gmail.com', 'Edward_Scissorhands', 'Sci$$0rhands', 1, '2023-03-08 12:27:24', 1, '0984'),
(2, 'Macaulay Culkin', '671 Lincoln Avenue in Winnetka', 'posh square', 'Illinois', '+1 389-777-0275', ' IL 60093 ', 'xpertinfotek@gmail.com', 'customer', '123', 1, '2023-03-08 20:23:57', 0, '0633'),
(3, 'Manar', '4 Lincoln Avenue in Winnetka', 'Illinois', 'Illinois', '+1 389-777-05575', ' IL 60353', 'learn.code.630@gmail.com', 'pink', 'mnmn200', 1, '2023-03-08 20:23:57', 1, '0'),
(4, 'Van Diessele', 'Santa Monica', 'California', 'California', '+13 9878979879', 'CL 89437', 'V@yahoo.com', 'Vee', '123v', 1, '2023-04-18 08:25:22', 0, '0'),
(5, 'Sara', 'Baker road', 'Santa Monica', 'California', '+42 89798787', 'CL007', 'S@us.com', 'sara', '123ss', 2, '2023-04-18 08:26:12', 1, '0'),
(6, 'monali shreshtha', '1,opera heights', 'Whitefileds', 'Bangalore', '832888823', '9888822', 'monalishah@gmail.com', 'monali111', '123', 2, '2023-05-03 14:01:18', 0, '0'),
(7, 'nishant', 'management enclabve', 'vastrapur', 'ahmedbad', '83838838', '370001', 'nishant@gmail.com', 'nishant', '123', 1, '2023-05-03 19:09:10', 0, '0'),
(8, 'jishva', 's.g.highway', 'bodakdev', 'ahmedabad', '8383838', '484848', 'jishva@gmail.com', 'jishva', '123', 2, '2023-05-04 13:49:06', 1, '0'),
(9, 'meha patel', 'scarborough', 'lane no -=2', 'Toronto', '626262662', 'GR525', 'meha@gmail.com', 'meha', '123', 2, '2023-05-05 19:35:01', 0, '0');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `notify_customer` AFTER INSERT ON `customer` FOR EACH ROW insert into notify_tab (customers,subject,message) values (1 , "customer",new.name)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `leads_tab`
--

CREATE TABLE `leads_tab` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=New,\r\n2=Assigned,\r\n3=In process,\r\n4=Converted,\r\n5=Recycled,\r\n6=Dead',
  `contact_no` varchar(20) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zipcode` varchar(15) NOT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 1,
  `updated_date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leads_tab`
--

INSERT INTO `leads_tab` (`id`, `name`, `status`, `contact_no`, `email_id`, `area`, `city`, `zipcode`, `gender`, `updated_date`, `deleted`) VALUES
(34, 'srishti khanna', 1, '82328328', 'astha@hotmail.com', 'parle point', 'surat', '345566', 1, '2023-04-07 14:46:50', 0),
(37, 'kinara desai', 1, '929239239', 'kinara@gmail.com', 'Road1', 'Manchester City', '', 2, '2023-04-12 15:32:48', 0),
(38, 'ishan shaha', 1, '823929380', 'ishan@hotmail.com', 'Lane1', 'Manchester City', '626362', 1, '2023-04-12 15:33:11', 0),
(39, 'Sara Ahmat', 1, '+1 9483785 098', 'Sara@yahoo.com', 'Turkey', 'Manchester City', 'T 42 MFF', 2, '2023-04-13 09:21:46', 0),
(40, 'Karama Osman', 1, '+974 4289724897', 'Karam@yahoo.com', 'Lane1', 'Manchester City', 'Manc 329', 1, '2023-04-13 09:24:25', 0),
(41, 'Taha Hussain', 1, '+92 43897583', 'th@yahoo.com', 'Lane1', 'Manchester City', 'MGG 53', 1, '2023-04-14 08:57:40', 0),
(42, 'Media Sarsor', 1, '+983 35578989', 'Medo@yahoo.com', 'Lane1', 'LiverPool', 'L59 DD', 2, '2023-04-15 01:16:57', 0),
(43, 'Noor Salam', 6, '+996 664843535', 'noor@gmail.com', 'Street1', 'Manchester City', 'M04 G3', 2, '2023-04-15 01:18:23', 0),
(44, 'Samantha Adil', 1, '+966 487346786', 'Sam@yahoo.com', 'Liester ', 'LiverPool', 'LLL1 7FP', 2, '2023-04-21 09:13:31', 0),
(45, '1235 3123123', 1, '31231231', 'ansnsn@gmail.com', 'Lane1', 'Manchester City', '123123', 1, '2023-04-26 15:02:22', 0),
(46, 'heerwa', 1, '872727277', '2sneha4@gmail.com', 'vasna', 'ahmedabad', '380002', 2, '2023-05-03 13:49:59', 0),
(47, 'shivay', 1, '62535235', 'shivay@gmail.com', 'SBR', 'ahmedabad', '3800012', 1, '2023-05-03 13:54:45', 0),
(48, 'shipra', 1, '928382311', 'shipra@gmail.com', 'VIP road', 'Surat', '282991', 1, '2023-05-03 13:56:28', 1),
(49, 'jinali vora', 1, '5137777221', 'xpertinfotek@gmail.com', 'ghod dod road', 'Surat', '929391', 1, '2023-05-03 13:57:32', 0),
(50, 'yesha mehra', 1, '9239293', 'yesha@hotmail.com', 'Lane1', 'Manchester City', 'GJ1217', 2, '2023-05-03 14:14:56', 0),
(51, 'nishtha', 1, '7998821212', 'nishtha@gmail.com', 'ville parle', 'mumbai', '8283882', 2, '2023-05-03 14:42:35', 0),
(52, 'nirarika khanna', 1, '62626262', 'niharika@gmail.com', 'south bopal', 'ahmedabad', '324422', 1, '2023-05-03 14:48:12', 0),
(53, 'kushal dudhia', 1, '27273728', 'kushal@gmail.com', 'ambawadi', 'ahmedabad', '3211112', 1, '2023-05-03 14:49:43', 0),
(54, 'trushil patel', 1, '55232321', 'trushilpatel@gmail.com', 'bopal', 'ahmedabad', '389912', 1, '2023-05-03 14:54:10', 0),
(56, 'gargi shah', 1, '5553211123', 'gargi@gmail.com', 'paldi', 'ahmedabad', '332321', 1, '2023-05-03 14:59:16', 0),
(57, 'jinali shah', 1, '923293999', 'jinalishah@gmail.com', 'Street1', 'Manchester City', '232211', 2, '2023-05-03 19:01:56', 1),
(58, 'niral shah', 0, '82838238', 'nirali@gmail.com', 'park avenue', 'Manchester City', '2830001', 1, '2023-05-04 13:34:54', 1),
(59, 'nisha arora', 1, '8283828', 'nisha@gmail.com', 'Lane1', 'Manchester City', '273628', 2, '2023-05-04 13:47:44', 1),
(60, 'bindi gohel', 1, '999921219', 'bindi@gmail.com', 'Lane1', 'Manchester City', 'gh2838', 2, '2023-05-05 13:49:29', 0),
(61, 'nishtha mehta', 1, '82382739', 'nishtha@gmail.com', 'Lane1', 'London', 'LM7272', 2, '2023-05-05 19:39:38', 0);

--
-- Triggers `leads_tab`
--
DELIMITER $$
CREATE TRIGGER `increase_lead` AFTER INSERT ON `leads_tab` FOR EACH ROW insert into notify_tab (leads,subject,message) values (1 , "lead",new.name)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `notify_tab`
--

CREATE TABLE `notify_tab` (
  `notify_id` int(11) NOT NULL,
  `leads` tinyint(4) NOT NULL DEFAULT 0,
  `quotations` tinyint(4) NOT NULL DEFAULT 0,
  `customers` tinyint(4) NOT NULL DEFAULT 0,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notify_tab`
--

INSERT INTO `notify_tab` (`notify_id`, `leads`, `quotations`, `customers`, `subject`, `message`) VALUES
(13, 1, 0, 0, 'lead', 'bindi gohel'),
(14, 0, 0, 1, 'customer', 'meha patel'),
(15, 1, 0, 0, 'lead', 'nishtha mehta'),
(16, 0, 1, 0, 'quotation', 'Quotation for sarah');

-- --------------------------------------------------------

--
-- Table structure for table `opportunity`
--

CREATE TABLE `opportunity` (
  `opportunity_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL DEFAULT 0,
  `product_name` varchar(100) NOT NULL,
  `preferred_date` date NOT NULL,
  `pref_channel` varchar(25) NOT NULL DEFAULT 'phone',
  `description` varchar(400) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opportunity`
--

INSERT INTO `opportunity` (`opportunity_id`, `lead_id`, `employee_id`, `quotation_id`, `product_name`, `preferred_date`, `pref_channel`, `description`, `deleted`) VALUES
(101, 7, 2, 67461, 'frocks and minis', '2023-05-18', 'phone, email', 'no description added', 0),
(1008, 6, 4, 67468, 'FIT & FLARE TAILORED TROUSERS', '2023-03-23', 'Email,Phone,', 'a potential customer - expecting to place order in volume          ', 1),
(1009, 7, 5, 67463, 'QUILTED WOOL LOOK PADDED TRENCH COAT', '2023-03-28', 'Email,Phone,', 'upgraded the record for contact number', 0),
(1010, 2, 1, 67459, 'QUILTED WOOL LOOK PADDED TRENCH COAT', '2023-03-27', 'Email,Phone,WhatsApp,', 'she can be contacted between 1 to 2 after preferred dates                                    ', 0),
(1011, 5, 5, 67459, 'DOBBY WRAP BELTED MAXI DRESS', '2023-03-30', 'WhatsApp,', 'connect to her after the given date                                    ', 0),
(1012, 10, 1, 0, 'QUILTED WOOL LOOK PADDED TRENCH COAT', '2023-04-01', 'Phone', 'potential customer possibly. need to take good follow up ', 0),
(1013, 5, 1, 64388, 'DOBBY WRAP BELTED MAXI DRESS', '2023-04-05', 'Email,', 'she is a potential lead and follow up is required', 0),
(1014, 9, 4, 0, 'DOBBY WRAP BELTED MAXI DRESS', '2023-04-08', 'Email,', 'she wants to make the process quick', 0),
(1016, 1, 4, 67461, 'DOBBY WRAP BELTED MAXI DRESS', '2023-03-31', 'Array', 'she is out of station till 31st', 0),
(1019, 35, 2, 67461, 'DOBBY WRAP BELTED MAXI DRESS', '2023-04-19', 'WhatsApp,', 'potential customer', 0),
(1020, 11, 3, 67461, 'flairy gowns', '2023-05-10', 'phone', 'no descriptions', 0),
(1021, 25, 5, 67460, 'FIT & FLARE TAILORED TROUSERS', '2023-05-01', 'phone', 'no description added', 0),
(1022, 34, 4, 0, 'Gown', '2023-05-05', 'Email,', 'willing to place order for next month       ', 0),
(1023, 34, 3, 0, 'FIT & FLARE TAILORED TROUSERS', '2023-05-08', 'Email,', 'DsasSsA       ', 0),
(1024, 38, 4, 0, 'evening gown', '2023-05-22', 'Email,', 'nothing  ', 0);

--
-- Triggers `opportunity`
--
DELIMITER $$
CREATE TRIGGER `AddToActivity` AFTER INSERT ON `opportunity` FOR EACH ROW INSERT INTO activities (activity_id,activity_title,activity_type,staff_id,date) VALUES (new.opportunity_id,"opportunity added","opportunity",new.employee_id,CURRENT_DATE)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `process_id` int(11) NOT NULL,
  `opportunity_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `progress(perc)` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `process`
--

INSERT INTO `process` (`process_id`, `opportunity_id`, `staff_id`, `activity_id`, `date`, `progress(perc)`) VALUES
(1, 0, 1, 1, '2023-01-08', 0),
(2, 0, 3, 2, '2023-02-10', 0),
(3, 0, 2, 3, '2023-01-09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `SKU` int(11) NOT NULL DEFAULT 5,
  `size` varchar(10) NOT NULL,
  `description` varchar(400) NOT NULL,
  `image` varchar(300) NOT NULL DEFAULT 'noimage.png',
  `deleted` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `title`, `category_id`, `manufacturer`, `price`, `SKU`, `size`, `description`, `image`, `deleted`) VALUES
(1, 'QUILTED WOOL LOOK PADDED TRENCH COAT', 1, 'Boohoo', '80', 9262, '', '  Wrap up warm in the latest wool look coats. A stylish way to cover up from the colder weather, wool coats work on off-duty days as well as those nights out with the girls. A warm and durable classic that mimics a sheep\'s wool blend and is perfect for winter, try slouchy silhouettes, military styles or checked prints. For that extra elevated finish, pick a wool look jacket with a faux fur collar ', '../products/dress-2.jpg', 1),
(2, 'DOBBY WRAP BELTED MAXI DRESS', 1, 'Boohoo', '40', 29295, '', '  Versatile, chic, and always effortless, wrap dresses are the wardrobe essential you don’t wanna sleep on this season, and this style is no exception. With a wrap design secured with tie detailing, this one is giving us all the vibes. Pair with cute sandals for off-duty days or opt for barely-there heels for Saturday night plans. From midi wrap dresses to maxi styles, we’ve got something for ever', '../products/dress3.jpg', 1),
(3, 'FIT & FLARE TAILORED TROUSERS', 3, 'Boohoo', '25', 13117, '', '        Work clothes don’t have to be boring, and these work trousers are a secure style. Slightly more formal attire, these are tailored, high waisted, and tapered at the ankle. Choose between button or zip-up detail, these are smart pants that are sharply tailored, serving some serious attitude. Always a practical piece to have in your wardrobe, throw these on and prepare to impress in any profe', '../products/dress5.jpg', 0),
(4, 'evening gown', 1, 'Zara', '35', 6, '', '                                     Green  ', '../products/dress6.jpg', 1),
(5, 'Gown', 1, 'Zara', '30', 4, '', '                                     evening red dress  ', '../products/dress7.jpg', 0),
(6, 'Pullover', 4, 'Breshka', '74', 2, 'Array', '                                comfortable, loose, cotton', '../products/dress8.jpg', 1),
(7, 'Racool', 1, 'Coach', '345', 10, 'Array', 'the casual long shirt for summer look', '../products/shirt1.jpg', 1),
(8, 'NewFrock', 1, 'Myntra', '100', 10, 'Array', 'lenhnga dress', '../products/lehenga-3.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

CREATE TABLE `quotation` (
  `quotation_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL DEFAULT 'quotation #',
  `quotation_date` date NOT NULL DEFAULT current_timestamp(),
  `expiry_date` date DEFAULT NULL,
  `offer` varchar(100) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotation`
--

INSERT INTO `quotation` (`quotation_id`, `lead_id`, `title`, `quotation_date`, `expiry_date`, `offer`, `product_id`, `quantity`, `price`, `file`, `deleted`) VALUES
(67455, 1, '0', '2023-03-26', '2023-05-06', '50% OFF', 1, '0.00', '40', NULL, 0),
(67456, 2, 'quotation 12', '2023-05-18', '2023-05-19', 'Offer 3', 0, '33.00', '400', 'login_form.html', 0),
(67457, 8, 'quotation 13', '2023-05-06', '2023-05-30', 'Offer 1', 0, '30.00', '250', 'C_test answers.docx', 0),
(67459, 7, 'quotation 86', '2023-03-27', '2023-04-26', 'Offer 3', 1, '10.00', '100', 'quoatation-mob-app-development2.pdf', 0),
(67460, 3, 'quotation 21', '2023-04-20', '2023-04-28', 'Offer 2', 2, '10.00', '100', 'ijbmer2019100501.pdf', 0),
(67461, 14, 'quotation #12', '2023-05-06', '2023-05-14', 'Offer 2', 2, '33.00', '200', 'CRMsoftware.pdf', 0),
(67463, 9, 'quotation #11', '2023-04-07', NULL, 'Offer 2', 2, '100.00', '560', 'quoatation-mob-app-development.pdf', 0),
(67464, 34, 'quotation #13', '2023-04-08', '2023-04-12', 'Offer 3', 2, '200.00', '200', 'quoatation-mob-app-development2.xls', 0),
(67466, 35, 'quotation #14', '2023-04-10', NULL, 'Offer 2', 3, '90.00', '100', 'basepaper-2.pdf', 0),
(67467, 36, 'quotation #15', '2023-05-05', '2023-05-15', 'Offer 3', 2, '200.00', '10', 'basepaper.pdf', 0),
(67468, 35, 'quotation #17', '2023-04-12', '2023-05-02', 'Offer 1', 2, '100.00', '210', 'information-13-00517-v3.pdf', 0),
(67469, 38, 'quotation #18', '2023-10-24', '2023-05-01', 'Select Any Offer', 0, '4.00', '500', 'Rajvee-ME-topic-1.pdf', 0),
(72100, 2, 'quotation #21', '2023-04-30', '2023-05-25', '20% off', 2, '200.00', '23', NULL, 0),
(72101, 34, 'quotation #3', '2023-05-02', '2023-05-12', 'Offer 30%', 6, '11.00', '2000', 'V17N1-02[4].pdf', 0),
(72102, 45, 'quotation #45', '2023-05-03', '2023-05-23', 'offer 20%', 1, '122.00', '44', NULL, 0),
(72103, 43, 'quotation #112', '2023-06-30', '2023-07-31', 'Offer 10%', 1, '16.00', '10', 'project_handbook.pdf', 0),
(72104, 47, 'quotation#09', '2023-05-04', '2023-05-11', 'Offer 30%', 4, '3.00', '10', 'brijesh-internship-complete.pdf', 0),
(72105, 46, 'Quotation for sarah', '2023-05-12', '2023-05-22', 'Offer 30%', 3, '17.00', '1000', 'shakraday stuti.pdf', 0);

--
-- Triggers `quotation`
--
DELIMITER $$
CREATE TRIGGER `AddToActivity2` AFTER INSERT ON `quotation` FOR EACH ROW INSERT INTO activities (activity_id,activity_title,activity_type,staff_id,date) VALUES (new.quotation_id,"quotation added","quotation",4,CURRENT_DATE)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `notify_quotation` AFTER INSERT ON `quotation` FOR EACH ROW insert into notify_tab (quotations,subject,message) values (1 , "quotation",new.title)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` int(11) NOT NULL,
  `quote` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote`) VALUES
(1, '“All our dreams can come true; if we have the courage to pursue them.” – Walt Disney\r\n'),
(2, '“However difficult life may seem, there is always something you can do and succeed at.” – Stephen Hawking'),
(3, '“Nothing is impossible, the word itself says ‘I’m possible’!” – Audrey Hepburn'),
(4, '\"When you have a dream, you\'ve got to grab it and never let go.\"\r\n— Carol Burnett'),
(5, '\"Nothing is impossible. The word itself says \'I\'m possible!\'\"\r\n— Audrey Hepburn'),
(6, '\"There is nothing impossible to they who will try.\"\r\n— Alexander the Great'),
(7, '\"Life has got all those twists and turns. You\'ve got to hold on tight and off you go.\"\r\n— Nicole Kidman'),
(8, '\"Keep your face always toward the sunshine, and shadows will fall behind you.\"\r\n— Walt Whitman'),
(9, '\"Success is not final, failure is not fatal: it is the courage to continue that counts.\"\r\n- Winston Churchill'),
(10, '\"You define your own life. Don\'t let other people write your script.\"\r\n— Oprah Winfrey'),
(11, ' \"You are never too old to set another goal or to dream a new dream.\"\r\n— Malala Yousafzai'),
(12, '\"Spread love everywhere you go.\"\r\n— Mother Teresa'),
(13, ' \"You can be everything. You can be the infinite amount of things that people are.\"\r\n— Kesha'),
(14, '\"Belief creates the actual fact.\"\r\n— William James'),
(15, '\"It is during our darkest moments that we must focus to see the light.\"\r\n— Aristotle'),
(16, '\"Believe you can and you\'re halfway there.\"\r\n- Theodore Roosevelt'),
(17, ' \"Silence is the last thing the world will ever hear from me.\"\r\n— Marlee Matlin'),
(18, '\"In a gentle way, you can shake the world.\"\r\n— Mahatma Gandhi'),
(19, '\"All you need is the plan, the road map, and the courage to press on to your destination.\"\r\n— Earl Nightingale'),
(20, ' \"Try to be a rainbow in someone\'s cloud.\"\r\n— Maya Angelou'),
(21, '\"Wake up determined, go to bed satisfied.\"\r\n— Dwayne \"The Rock\" Johnson\r\n\r\n'),
(22, '\"Nobody built like you, you design yourself.\"\r\n— Jay-Z'),
(23, '\"Live your beliefs and you can turn the world around.\"\r\n— Henry David Thoreau\r\n\r\n'),
(24, '\"We are not our best intentions. We are what we do.\"\r\n— Amy Dickinson'),
(25, '\"Out of the mountain of despair, a stone of hope.\"\r\n— Martin Luther King, Jr.'),
(26, '\"You are never too old to set another goal or to dream a new dream.\"\r\n— C.S. Lewis'),
(27, ' \"Definitions belong to the definers, not the defined.\"\r\n— Toni Morrison'),
(28, ' \"We have to let go of who we think we should be and embrace what is.\"\r\n— Achea Redd'),
(29, '“People begin to become successful the minute they decide to be.” – Harvey MacKay\r\n'),
(30, '“It always seems impossible until it’s done.” – Nelson Mandela\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `joining_date` date NOT NULL,
  `branch` varchar(20) NOT NULL,
  `designation` varchar(20) NOT NULL,
  `supervisor` int(11) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `name`, `contact_no`, `email`, `joining_date`, `branch`, `designation`, `supervisor`, `username`, `password`) VALUES
(1, 'Rachel Green', '+330701709222', 'Rachgreen@us.com', '2020-08-12', 'New York', 'buyer', 1, 'user1', '123'),
(2, 'Chandler Bing', '+330771702200', 'chandlerbing@us.com', '2021-10-22', 'California', 'buyer', 3, 'user2', '123'),
(3, 'Pheobe Buffay', '+33387583033', 'Pheeeb@icloud.com', '2020-03-02', 'New York', 'HR', 1, 'Pheobe Buffay', '123'),
(4, 'priya patel', '9848238238', 'priya@gmail.com', '2022-05-09', 'New Jersey', 'Admin', NULL, 'priya111', '123'),
(5, 'Harsh Shah', '993883823', 'harsh@gmail.com', '2021-04-08', 'Mumbai', 'Manager', 1, 'harsh', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL DEFAULT 0,
  `topic` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(400) NOT NULL,
  `priority` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(11) NOT NULL DEFAULT 'pending' COMMENT '0=pending,\r\n1=In progress,\r\n2=Completed',
  `file` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `customer_id`, `product_id`, `staff_id`, `topic`, `subject`, `message`, `priority`, `date`, `status`, `file`) VALUES
(10015, 2, 1, 3, 'inquiry', 'product information required', 'Good evening, are the sizes on the website American?\r\n', 0, '2023-02-02 00:00:00', 'Completed', ''),
(10092, 1, 2, 1, '', '', 'Hello, \r\nI would like to add some items on my order,\r\nand don\'t know how?', 0, '2023-01-08 00:00:00', 'Pending', ''),
(10093, 4, 4, 0, 'Order', 'missing item', '  missing item', 2, '2023-04-21 10:16:43', 'pending', NULL),
(10094, 4, 4, 0, 'Product', 'important', '  damage items', 3, '2023-04-21 10:39:04', 'pending', NULL),
(10104, 0, 3, 0, 'Quotation', 'new order', '  adjust on the old order', 1, '2023-04-23 11:14:59', 'in progress', NULL),
(10105, 0, 5, 0, 'Order', 'return', '  damaged item', 3, '2023-04-24 01:42:20', 'pending', NULL),
(10106, 2, 3, 0, 'Order', 'order related111', '  order related query', 1, '2023-05-02 14:59:09', '1', NULL),
(10107, 2, 8, 0, 'Quotation', 'about the product quotation sent', 'to whomsoever it may concern', 1, '2023-05-05 16:40:13', 'pending', NULL),
(10108, 2, 3, 0, 'Quotation', 'quotation still not received', ' plz send the quotation asap  as we have a meeting ', 3, '2023-05-05 18:42:49', 'pending', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`),
  ADD KEY `categories_id` (`categories_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `email_2` (`email`),
  ADD KEY `customer_id_2` (`customer_id`);

--
-- Indexes for table `leads_tab`
--
ALTER TABLE `leads_tab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `notify_tab`
--
ALTER TABLE `notify_tab`
  ADD PRIMARY KEY (`notify_id`);

--
-- Indexes for table `opportunity`
--
ALTER TABLE `opportunity`
  ADD PRIMARY KEY (`opportunity_id`),
  ADD KEY `opportunity_id` (`opportunity_id`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `process_id` (`process_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`quotation_id`),
  ADD KEY `quotation_id` (`quotation_id`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `leads_tab`
--
ALTER TABLE `leads_tab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `notify_tab`
--
ALTER TABLE `notify_tab`
  MODIFY `notify_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `opportunity`
--
ALTER TABLE `opportunity`
  MODIFY `opportunity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1025;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quotation`
--
ALTER TABLE `quotation`
  MODIFY `quotation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72106;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10109;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
