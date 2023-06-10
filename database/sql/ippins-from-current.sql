-- Adminer 4.2.5 MySQL dump

-- SET NAMES utf8;
-- SET time_zone = '+00:00';
-- SET foreign_key_checks = 0;
-- SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

-- DROP TABLE IF EXISTS `ippins`;
-- CREATE TABLE `ippins` (
--   `ippin_id` int(10) NOT NULL AUTO_INCREMENT,
--   `name` varchar(191) DEFAULT NULL,
--   `price` int(11) DEFAULT NULL,
--   `is_sustainable` char(5) NOT NULL,
--   `is_raw` char(5) NOT NULL,
--   `is_gf` char(5) NOT NULL,
--   `category` char(128) NOT NULL,
--   `is_special` char(5) NOT NULL,
--   `is_on_menu` char(5) NOT NULL,
--   PRIMARY KEY (`ippin_id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ippins` (`ippin_id`, `name`, `price`, `is_sustainable`, `is_raw`, `is_gf`, 
`category`, `is_special`, `is_on_menu`) VALUES
(1, 'Mustard greens and Washington albacore tuna dressed with an almond wasabi sauce',	10,	'Y', 'Y', 'Y', 'AP', 'N', 'Y'),
(2, 'Asparagus and shimeji mushrooms in a creamy tofu sauce',	9,	'N', 'N', 'Y', 'AP', 'N', 'Y'),
(3, 'Organic butter lettuce, radishes, toasted almonds and Washington Fuji apples tossed in a sweet miso dressing',	15,	'N', 'N', 'Y', 'AP', 'N', 'Y'),
(4, 'String bean salad tossed in a walnut miso dressing',	8,	'N', 'N', 'Y', 'AP', 'N', 'Y'),
(5, 'Hijiki seaweed nimono',	9,	'N', 'N', 'Y', 'AP', 'N', 'Y'),
(6, 'Chawan mushi with jidori eggs, snow crab and Neah Bay black cod',	11,	'Y', 'N', 'Y', 'AP', 'N', 'Y'),
(7, 'Shigoku oysters on the half shell with momiji ponzu',	20,	'Y', 'Y', 'Y', 'AP', 'N', 'Y'),
(8, 'Tempura assortment with wild prawns, local lingcod, kabocha squash, rooftop kale, and satsuma yam',	17,	'Y', 'N', 'N', 'TM', 'N', 'Y'),
(9, 'Assorted vegetable tempura with rooftop green beans, kabocha squash, organic shiitake, rooftop kale and satsuma yam served with shiitake mushroom and konbu dashi',	14,	'N', 'N', 'N', 'TM', 'N', 'Y'),
(10, 'Ling cod (Neah Bay, WA) Tempura served with matcha sea salt',	14,	'Y', 'N', 'N', 'TM', 'N', 'Y'),
(11, 'Geoduck (Puget Sound, WA) tender with mustard greens and shimeji mushrooms sauteed in a sake soy butter sauce',	17,'Y', 'N', 'N', 'FS', 'N', 'Y'),
(12, 'Black cod (Neah Bay, WA) miso yuan yaki',	20,'Y', 'N', 'Y', 	'FS', 'N', 'Y'),
(13, 'Hamachi (Kagoshima, Japan) kama shioyaki',	NULL,	'N', 'N', 'Y', 'FS', 'N', 'Y'),
(14, 'Kanpachi (Kona, HI) kama shioyaki',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(15, 'King salmon (Washington) kama shioyaki',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(16, 'White King salmon (WA) kama shioyaki',	18,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(17, 'Halibut (Neah Bay, WA) kama nitsuke with hari ginger and fresh gobo',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(18, 'Idiot fish nitsuke (Washington) with hari ginger and fresh gobo',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(19, 'Madai (Ehime, Japan) aradaki with hari ginger and fresh gobo',	15,	'N', 'N', 'Y', 'FS', 'N', 'Y'),
(20, 'Braised Snake River Farms wagyu beef skirt konabe with maitake mushrooms and yuchoi',	21,	'N', 'N', 'Y', 'MT', 'N', 'Y'),
(21, 'Snake River Farms organic pork tenderloin tonkatsu with sesame tonkatsu sauce',	19,	'N', 'N', 'Y', 'MT', 'N', 'Y'),
(22, 'Jidori chicken karaage with sansho sea salt',	15,	'N', 'N', 'Y', 'MT', 'N', 'Y'),
(23, 'Marble King Salmon kama shioyaki',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(24, 'Shumai',	13,	'N', 'N', 'N', 'MT', 'N', 'Y'),
(25, 'Shishito peppers blistered and sprinkled with sea salt',	8.5,	'N', 'N', 'Y', 'AP', 'N', 'Y'),
(26, 'Petrale sole (Neah Bay, WA) steamed with fresh ginger, scallions, Thai soy sauce and topped with sizzling peanut oil',	19,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(27, 'Coho salmon (Neah Bay, WA) kama shioyaki',	12,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(28, 'Ling cod (Neah Bay) aradaki',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(29, 'Kinki nitsuke (Neah Bay) with hari ginger and fresh gobo',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(30, 'Red king salmon kama shioyaki',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(31, 'Spotted parrot fish (Japan) aradaki with hari ginger and fresh gobo',	16,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(32, 'Grouper (East Coast) aradaki with hari ginger and fresh gobo',	16,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(33, 'Sakura smoked tofu with scallions, ginger, dark soy sauce and sizzling peanut oil',	12,	'N', 'N', 'N', 'AP', 'N', 'Y'),
(34, 'Duck breast sansho yaki served medium rare  with sauteed mustard greens',	21,	'N', 'Y', 'Y', 'MT', 'N', 'Y'),
(35, 'Dobin-mushi with Olympic Peninsula Matsutake, Neah Bay black cod, and red crab steamed with clam dashi',	20,	'Y', 'N', 'Y', 'AP', 'N', 'Y'),
(36, 'Bering Sea octopus tempura with matcha sea salt',	12,	'Y', 'N', 'N', 'TM', 'N', 'Y'),
(37, 'Steamed and chilled monk fish liver in ponzu sauce',	12,	'Y', 'N', 'Y', 'AP', 'N', 'Y'),
(38, 'Kinmedai (New Zealand) aradaki with hari ginger and fresh gobo',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(39, 'King Salmon (Alaska) kama shioyaki',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(40, 'Live sea urchin (San Juan Islands, WA) Sashimi',	24,	'Y', 'Y', 'Y', 'FS', 'N', 'Y'),
(41, 'Golden eye snapper (Japan) aradaki with hari ginger and fresh gobo',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(42, 'Rockfish aradaki with hari ginger and fresh gobo',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(43, 'Tempura with wild white prawns, purple yam, maitake mushroom and shishito pepper with matcha se salt',	20,	'Y', 'N', 'N','TM', 'N', 'Y'),
(44, 'Cabezone nitsuke with hari ginger and fresh gobo',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(45, 'Cabezone (Neah Bay) tempura served with matcha sea salt',	16,	'Y', 'N', 'N','TM', 'N', 'Y'),
(46, 'Ling Cod (Neah Bay, WA) steamed with fresh ginger, scallions, dark soy sauce and topped with sizzling peanut oil',	19,	'Y', 'N', 'N', 'FS', 'N', 'Y'),
(47, 'Rock fish (Neah Bay) nitsuke with hari ginger and fresh gobo',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(48, 'Ocean Perch (Washington) nitsuke with hari ginger and fresh gobo',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(49, 'Sockeye salmon (Bristol Bay) kama shioyaki',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(50, 'Halibut (Neah Bay, WA) tempura served with matcha sea salt',	18,	'Y', 'N', 'N', 'AP', 'N', 'Y'),
(51, 'Neah Bay Rockfish nitsuke with hari ginger and fresh gobo',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(52, 'Spring King salmon (Washington) kama shioyaki',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(53, 'Pan seared Copper River smelt served with ponzu dipping sauce',	14,	'Y', 'N', 'N', 'FS', 'N', 'Y'),
(54, 'Black rockfish (Neah Bay) nitsuke with hari ginger and fresh gobo',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(55, 'Rooftop nasu eggplant misoni',	7,	'N', 'N', 'Y', 'AP', 'N', 'Y'),
(56, 'Sockeye salmon (Fraser River) kama shioyaki',	NULL,	'Y', 'N', 'Y', 'FS', 'N', 'Y'),
(57, 'Red rockfish (Neah Bay, WA) nitsuke with hari ginger and fresh gobo',	 NULL,	'Y', 'N', 'Y','FS', 'N', 'Y');

-- 2018-09-28 03:20:04