-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2023 at 06:36 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guitarhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `phone_number`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'aditya', 'aditya', '1234567890', 0, '2022-12-03 05:04:56', '2022-12-03 05:04:56'),
(2, 'Jayesh', 'jb', '1234567890', 0, '2022-12-04 06:15:43', '2022-12-04 06:15:43'),
(3, 'atmanand', 'atmanand', '1234567890', 0, '2022-12-06 04:54:18', '2022-12-06 04:54:18'),
(4, 'vai', 'a', '1234567890', 0, '2022-12-07 17:31:42', '2022-12-07 17:31:42'),
(5, 'Nikita', '', '3586', 0, '2023-01-12 09:40:09', '2023-01-12 09:40:09'),
(6, 'Nikki', 'Nikki', '54684', 0, '2023-01-12 09:40:30', '2023-01-12 09:40:30');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `profile_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int NOT NULL,
  `seller_product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `cart_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `profile_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `address` varchar(8000) DEFAULT NULL,
  `pincode` varchar(16) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `profile_id`, `name`, `email`, `phone_no`, `address`, `pincode`, `city`, `created_at`) VALUES
(6, 3, 'Atmanand Nagpure', 'atmanandnagpure31@gmail.com', '123', 'Plot G-3, Sector N-4, CIDCO, Aurangabad', '431003', 'Aurangabad', '2023-01-16 02:49:50'),
(8, 3, 'Atmanand Nagpure', 'atmanandnagpure31@gmail.com', '123', 'Plot G-3, Sector N-4, CIDCO, Aurangabad', '431003', 'Aurangabad', '2023-01-16 03:37:14'),
(9, 3, 'Aditya Bhadane', 'iegiengoi@gnqwieng.egwqeg', '23123123', 'Plot G-3, Sector N-4, CIDCO, Aurangabad', '431003', 'Aurangabad', '2023-01-16 05:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `seller_product_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `seller_product_id`, `order_id`, `quantity`) VALUES
(1, 1, 6, 1),
(2, 8, 8, 1),
(3, 2, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` text,
  `features` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `created_at`, `updated_at`, `image`, `features`) VALUES
(1, 'Gibson /  Acoustic / J-35', 'The J-35 evolved from the Jumbo in 1936, a time when the Great Depression was still wreaking havoc on Americans. Gibson developed the J-35 to be a pared-down model that still offered musicians a warm and balanced instrument. This J-35 delivers every bit of the seasoned, vintage look, feel, and sound of those classic models. Discerning flat-top players will love the rich, full-bodied tone from this vintage-inspired, round-shoulder beauty, along with its superb playability and simple aesthetic charm. Includes a hardshell case.', '2022-12-21 21:21:24', '2022-12-21 21:21:24', 'https://images.ctfassets.net/m8onsx4mm13s/2uVo8GF4ETzZkiwqNngE4b/a222632547f87be35fe443a57023383b/DTCRS35VS_front.png?h=900', 'Profile : Rounded <br>Fingerboard : Radius <br> Body Styles : J-45 <br> Body Material : Mahogany <br> Fret Count : 19'),
(2, 'Gibson /  Acoustic / J-35 30s', 'The J-35 evolved from the Jumbo in 1936, a time when the Great Depression was still wreaking havoc on Americans. Gibson developed the J-35 to be a pared-down model that still offered musicians a warm and balanced instrument. The J-35 30s Faded delivers every bit of the seasoned, vintage look, feel, and sound of our iconic J-35, with a satin nitrocellulose finish that only adds to its rich legacy and undeniable vintage vibe. Discerning flattop players will love the rich, full-bodied tone from this vintage-inspired, round-shoulder beauty, along with its superb playability and simple aesthetic charm. Includes a hardshell case.', '2022-12-21 21:23:16', '2022-12-21 21:23:16', 'https://images.ctfassets.net/m8onsx4mm13s/28suY1qeMfTk1SrBhdJqQP/0305f26d16ec6d9b271eecd672c42584/OCRS3FAN_front.png?h=300', 'Body Styles : Round Shoulder <br> Body Shape : J-45 <br> Top : Sitka Spruce <br>Fingerboard Radius : 304.8 mm / 12 in <br> Fret Count : 19'),
(3, 'Gibson  / Hummingbird Faded', 'The unmistakable Gibson Hummingbird™ is followed by the masses as one of the most remarkable acoustic guitars ever built. The new Hummingbird Faded blends vintage appointments and today\'s modern, high-quality build construction. The Hummingbird Faded is outfitted with gold Gotoh® Keystone tuners, a traditional Hummingbird truss rod cover, and a bone nut and saddle. The built-in LR Baggs VTC electronics make this guitar stage and studio-ready, right out of the included hardshell case.', '2022-12-21 21:23:16', '2022-12-21 21:23:16', 'https://images.ctfassets.net/m8onsx4mm13s/16RB13z7ZmTWndHpncfy2N/eca3cfc0546b5831bc018a6f24454f9b/OCSSHFAN_front.png?h=300', 'Body Styles : Square Shoulder <br> Body Shape : Hummingbird <br> Fingerboard Radius : 304.8 mm / 12 in <br> Back : Mahogany <br> Fret Count : 20'),
(4, 'Gibson /  Acoustic / L-00', 'Gibson was a pioneer in the development of small body guitars in the beginning of the 1900s with its \"L-Series Small Body\" acoustics. These smaller Gibsons deliver a tonality that is best described in Gibson\'s 1934 catalog as a sound of \"perfect balance.\" The L-00 Original, while achieving all the advantages of an acoustic that is comfortable to play in your home, still produces Gibson\'s rich full sound. The new L-00 Original features a classic white script Gibson logo, subtle antiquing on the top and back binding, and Golden Age nickel tuners.', '2022-12-21 21:23:16', '2022-12-21 21:23:16', 'https://images.ctfassets.net/m8onsx4mm13s/6UKGVv8Q8q2nYR6rR0pFj7/8c5c24013f65e44b353d58bcf85d1fc7/__static.gibson.com_product-images_Acoustic_ACCL5X202_Ebony_OCSBL0EB_front.jpg?h=300', 'Body Styles : Small Body <br> Body Shape : L-00 <br> Top  : Sitka spruce <br> Fingerboard Radius : 304.8 mm / 12 in <br> Fret Count :18'),
(5, 'Gibson /  Acoustic / J-45 ', 'The J-45 is Gibson\'s best-selling acoustic of all time. Nicknamed \"The Workhorse\" and first introduced in 1942, this iconic acoustic has become the cornerstone of its round-shoulder, dreadnought line. World-renowned for its full, balanced expression, warm bass, and excellent projection, the J-45 has been refined to carry this legacy to new heights. The Gibson J-45 Standard\'s classic combination of a Sitka spruce top coupled with mahogany back and sides deliver a sound with incredible dynamic range, warm mids, and a tight punchy bass. Now available in Cherry; a Gibson hardshell case is included.', '2022-12-21 23:34:00', '2022-12-21 23:34:00', 'https://images.ctfassets.net/m8onsx4mm13s/2oxQhASiSAdW2Hbo8fSojz/747da0393b444b1e6de0c275e16f135b/OCRS4FVS_front.png?h=300', 'Body Styles : Small Body <br> Body Shape : L-00 <br> Top  : Sitka spruce <br> Fingerboard Radius : 304.8 mm / 12 in <br> Fret Count :18'),
(6, 'Gibson /  Acoustic / J-4', 'The J-45 is Gibson\'s best-selling acoustic of all time. Nicknamed \"The Workhorse\" and first introduced in 1942, this iconic acoustic has become the cornerstone of its round-shoulder, dreadnought line. World-renowned for its full, balanced expression, warm bass, and excellent projection, the J-45 has been refined to carry this legacy to new heights. The Gibson J-45 50s Faded delivers full-spectrum sound with incredible dynamic range, warm mids, and tight, punchy bass. Now available with a faded satin nitrocellulose lacquer finish that accentuates the guitar\'s vintage vibe and equipped with a modern LR Baggs pickup and electronics package for studio and stage use. A hardshell case is also included.', '2022-12-22 22:53:25', '2022-12-22 22:53:25', 'https://images.ctfassets.net/m8onsx4mm13s/3jqz0bwthjvcvDEhGyjSbp/fca14689e9595d96d15d72d2e10e431d/__static.gibson.com_product-images_Acoustic_ACCNGE89_Cherry_MCRS45CH_front.jpg?h=300', 'Body Styles : Small Body <br> Body Shape : L-00 <br> Top  : Sitka spruce <br> Fingerboard Radius : 304.8 mm / 12 in <br> Fret Count :18'),
(7, 'Gibson /  Acoustic / L-00', 'Gibson /  Acoustic / L-00  The J-45 is Gibson\'s best-selling acoustic of all time. Nicknamed \"The Workhorse\" and first introduced in 1942, this iconic acoustic has become the cornerstone of its round-shoulder, dreadnought line. World-renowned for its full, balanced expression, warm bass, and excellent projection, the J-45 has been refined to carry this legacy to new heights. The Gibson J-45 50s Faded delivers full-spectrum sound with incredible dynamic range, warm mids, and tight, punchy bass. Now available with a faded satin nitrocellulose lacquer finish that accentuates the guitar\'s vintage vibe and equipped with a modern LR Baggs pickup and electronics package for studio and stage use. A hardshell case is also included.', '2023-01-02 21:27:38', '2023-01-02 21:27:38', 'https://images.ctfassets.net/m8onsx4mm13s/5dvvivDhmPW8QyimGUIXjf/6417533c82d9f81431c96d287e97fb02/OCSSDOVCS_front.png?h=300', 'Body Styles : Small Body <br> Body Shape : L-00 <br> Top  : Sitka spruce <br> Fingerboard Radius : 304.8 mm / 12 in <br> Fret Count :18'),
(8, 'Gibson / Original / Les Paul  ', 'The new Les Paul Standard returns to the classic design that made it famous. It pays tribute to Gibson\'s Golden Era of innovation and brings authenticity back to life. The Les Paul Standard 50s P-90 has a solid mahogany body with a maple top and a rounded 50s-style mahogany neck with a rosewood fingerboard and trapezoid inlays. It\'s equipped with an ABR-1, the classic-style Tune-O-Matic™ bridge, an aluminum Stop Bar tailpiece, Vintage Deluxe tuners with Keystone buttons, and aged gold Top Hat knobs. The classic P-90 pickups (neck and bridge) are loaded with Alnico 5 magnets, audio taper potentiometers, and Orange Drop® capacitors.', '2023-01-05 18:25:28', '2023-01-05 18:25:28', 'https://images.ctfassets.net/m8onsx4mm13s/5wZqspV76KbgFoarX89otc/04fe00eac8af4ed47f402908219aaa28/__static.gibson.com_product-images_USA_USA85B326_Gold_Top_LPS5P900GTNH1_1.jpg?h=300', 'Body Styles : Les Paul <br> BodyShapes : Les Paul <br>  Fret Count : 22 <br>Joint : Glued In, Set Neck <br> Inlays: Acrylic Dots'),
(9, 'Gibson / Original / SG Special', 'The SG Special returns to the classic design that made it relevant, played and loved -- shaping sound across generations and genres of music. This early 60\'s style SG Special has the vibe and sound heard on countless classic rock recordings. The comfortable, slim taper mahogany neck and bound rosewood fingerboard is well known for fast, effortless playing. The two P-90 pickups are noted for their fat, snarl when driven and for their smooth, sweetness when played clean. The SG Special is equipped with the 3-way toggle switch, handwired controls and orange drop capacitors.', '2023-01-05 18:30:35', '2023-01-05 18:30:35', 'https://images.ctfassets.net/m8onsx4mm13s/7xqS5rhdqCrwLVZ2R4qKb8/5eb53ae09d60e0ce35fdeedba37cd903/__static.gibson.com_product-images_USA_USAFN1750_Faded_Pelham_Blue_SGSP19FPCH1_front.jpg?h=300', 'Body Styles : Les Paul <br> BodyShapes : Les Paul <br>  Fret Count : 22 <br>Profile : Slim Taper <br> Frets : Medium Jumbo'),
(10, 'Gibson / Artist / Brian Ray ', 'The Brian Ray ’62 SG Junior builds on the popularity of Brian’s ‘63 SG Standard model with exciting design elements, versatile features and analog innovations. It has become Brian’s guitar of choice on recent tours with Sir Paul McCartney, playing on the world’s biggest stages. And because of the variety of stage conditions, Brian wanted to make sure this SG Junior offered a lot more than meets the eye. A passive “induction coil” circuit, engaged with a tap of the push-push knob, hides under the pickguard to reduce RF interference and high-gain noise while preserving the tone of the powerful P-90 pickup. The clever convertible bridge design gives players the choice between a tune-o-matic ABR-1, a wrap-tail bridge, and/or a Vibrola tremolo – all available in the time it takes to change strings. The solid mahogany body is also slightly thicker than a normal SG, which Brian says “offers more low and mid-range punch to the overall tone of the guitar up and down the neck.” The finishing touches include sleek, pearlescent White Fox paint, a custom trapezoid inlay pattern and an ebony block tailpiece as seen on some original 1962 SG models. It’s easily the most versatile and distinctive SG Junior ever created, and for Brian it’s also reliable and just plain cool.', '2023-01-05 18:39:57', '2023-01-05 18:39:57', 'https://images.ctfassets.net/m8onsx4mm13s/3JyxALTupVeGZjww5PZBsE/68603982abd1ab0ddb0260e99ae2470e/__static.gibson.com_product-images_Custom_CUS4CC145_White_Fox_SGSJBRWFNH1.front.jpg?h=300', 'Body Styles : SG <br> Profile : 60s SlimTaper™ <br> Fret Count : 22 <br> Fingerboard Material: Rosewood <br>  Frets : Medium Jumbo '),
(11, 'Gibson / Modern / SG Modern', 'The newly refreshed Gibson SG Modern incorporates many contemporary updates that players have embraced, and it’s much more than a classic “solid guitar;” it’s a hybrid between an SG™ and a Les Paul™. Shaped and scarfed like a classic SG, the body is crafted with a AA maple top and mahogany back, characteristic of a Les Paul. This combination is renowned for its resonance and sustain. The genuine ebony, 24-fret compound radius fingerboard and asymmetrical, SlimTaper™ neck allow fast and silky access to the highest frets. A pair of calibrated Burstbucker™ Pro Alnico 5 humbuckers deliver firepower, and the push-pull controls allow you to switch between the Gibson humbucker and the single coil P-90 sounds, both of which have defined so many genres of music across multiple generations since we invented them. Upscale appointments include genuine mother-of-pearl inlays, Grover® Rotomatic® tuners, and clear Top Hat knobs.', '2023-01-05 18:51:41', '2023-01-05 18:51:41', 'https://images.ctfassets.net/m8onsx4mm13s/4G6kki7Jn5fsTOs1pPHDOm/95c12051f823a00c03f7e4c5085eb8b7/__static.gibson.com_product-images_USA_USAQHL543_Blueberry_Fade_SGM01U8CH1_front.jpg?h=300', 'Body Styles : SG <br> Profile : 60s SlimTaper™ <br> Fret Count : 22 <br> Fingerboard Material: Rosewood <br>  Frets : Medium Jumbo '),
(12, 'Gibson / SG Standard Bass', 'The SG Bass has the legendary looks, sound and feel which made it one of Gibson\'s most iconic basses. The short scale length is actually a big part of this sound! While the short scale length of the SG Bass is preferred by smaller players, it\'s also preferred by many for the strong fundamental tone for which this short scale bass is known. As expected, the solid mahogany body has deeply sculpted scarfing and the rounded profile mahogany neck and rosewood fingerboard feels familiar and comfortable. A pair of calibrated SG bass pickups (neck and bridge) with individual volume and master tone controls add further tonal possibilities.', '2023-01-05 18:54:52', '2023-01-05 18:54:52', 'https://images.ctfassets.net/m8onsx4mm13s/1FwWFCcvYYSEtHVNrOPaq1/ce4170d25bc2ac00801efec5faba3331/__static.gibson.com_product-images_USA_USABCH291_Heritage_Cherry_BASG19HCCH1_front.jpg?h=300', 'Body Styles : Small Body <br> Body Shape : L-00 <br> Top  : Sitka spruce <br> Fingerboard Radius : 304.8 mm / 12 in <br> Fret Count :22');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int NOT NULL,
  `account_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int NOT NULL DEFAULT '0',
  `description` varchar(8000) CHARACTER SET utf8mb4  NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `account_id`, `name`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Aditya Bhadane', 0, '', '2022-12-03 05:04:56', '2022-12-03 05:04:56'),
(2, 2, 'Jayesh bhave', 0, '', '2022-12-04 06:15:43', '2022-12-04 06:15:43'),
(3, 3, 'Atmanand Nagpure', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis erat dui, convallis ac pharetra vel, cursus non nisl. Sed sed blandit dui. Nullam accumsan ex ac lorem egestas, id fringilla risus tristique. Donec vel maximus diam, id varius elit. Pellentesque vehicula sollicitudin faucibus. Integer augue ipsum, malesuada eget imperdiet nec, eleifend non orci. Aenean pretium tortor ut ornare sollicitudin. Nunc sagittis a nisi pharetra blandit. Ut aliquam pulvinar arcu quis maximus. Fusce aliquam placerat orci, et mattis nisl blandit vel. Integer nec lectus lectus. Integer lacus nisl, faucibus sit amet risus ut, consequat volutpat felis.\r\n\r\nDonec a bibendum nunc. Aenean eget augue elit. Nullam lobortis, sem non aliquam dapibus, nulla lacus ornare diam, sed rhoncus dui elit cursus sem. Fusce nec ipsum quam. Quisque id varius enim, sed finibus nisl. Aliquam mi purus, euismod at metus sit amet, eleifend viverra quam. Aenean gravida dui sed iaculis feugiat. Curabitur sed semper ex. Nullam cursus, tortor sit amet blandit sagittis, turpis mi volutpat mauris, vel porta eros neque non arcu. Donec malesuada aliquam eros eget aliquam. Nam bibendum aliquam euismod. Duis ut leo ac quam tincidunt vehicula. Proin laoreet maximus lobortis. Suspendisse potenti. In varius, augue eu lacinia eleifend, diam leo ullamcorper ex, dapibus efficitur ligula libero a ex. Nunc pulvinar elit sed dui dignissim dictum.\r\n\r\nProin diam turpis, molestie at venenatis quis, finibus in ligula. Integer vitae euismod orci, vitae consectetur nulla. Aliquam commodo pharetra accumsan. Ut aliquet mauris sed diam facilisis, at posuere orci tristique. Nunc fringilla nisl sed odio vulputate lobortis. Vivamus convallis varius cursus. Suspendisse elementum massa sed sollicitudin consectetur.\r\n\r\nDonec in feugiat urna. In eget elit quam. Vestibulum in purus semper quam euismod imperdiet in sit amet dui. Integer hendrerit metus tincidunt lacus laoreet aliquet. Sed id mi gravida, commodo est accumsan, placerat nunc. Nulla scelerisque varius elit. Duis at ultricies eros. Suspendisse in gravida ex.', '2022-12-06 04:54:18', '2022-12-06 04:54:18'),
(4, 4, 'vaish', 0, '', '2022-12-07 17:31:42', '2022-12-07 17:31:42'),
(5, 5, 'Nikita', 0, '', '2023-01-12 09:40:09', '2023-01-12 09:40:09'),
(6, 6, 'Nikki', 0, '', '2023-01-12 09:40:30', '2023-01-12 09:40:30');

-- --------------------------------------------------------

--
-- Table structure for table `seller_products`
--

CREATE TABLE `seller_products` (
  `id` int NOT NULL,
  `seller_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `variant_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller_products`
--

INSERT INTO `seller_products` (`id`, `seller_id`, `product_id`, `price`, `created_at`, `updated_at`, `variant_id`) VALUES
(1, 1, 1, '99.99', '2023-01-06 11:42:41', '2023-01-06 11:42:41', 2),
(2, 3, 1, '119.99', '2023-01-06 11:42:41', '2023-01-06 11:42:41', 3),
(3, 1, 2, '99.99', '2023-01-06 11:42:41', '2023-01-06 11:42:41', 3),
(4, 1, 3, '99.99', '2023-01-06 11:42:41', '2023-01-06 11:42:41', 3),
(5, 2, 4, '99.99', '2023-01-06 11:42:41', '2023-01-06 11:42:41', 4),
(6, 2, 5, '99.99', '2023-01-06 11:42:41', '2023-01-06 11:42:41', 2),
(7, 2, 5, '12332', '2023-01-12 14:59:56', '2023-01-12 14:59:56', 3),
(8, 2, 6, '4654', '2023-01-12 14:59:56', '2023-01-12 14:59:56', 1),
(9, 2, 7, '564', '2023-01-12 14:59:56', '2023-01-12 14:59:56', 1),
(10, 2, 8, '3422', '2023-01-12 14:59:56', '2023-01-12 14:59:56', 6),
(11, 2, 9, '3453', '2023-01-12 14:59:56', '2023-01-12 14:59:56', 7),
(12, 2, 10, '2323', '2023-01-12 15:03:17', '2023-01-12 15:03:17', 8),
(13, 2, 11, '24234', '2023-01-12 15:03:17', '2023-01-12 15:03:17', 5),
(14, 2, 12, '2324', '2023-01-12 15:03:17', '2023-01-12 15:03:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int NOT NULL,
  `variant_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `variant_name`, `created_at`, `updated_at`) VALUES
(1, 'Red', '2023-01-06 11:36:19', '2023-01-06 11:36:19'),
(2, 'Brown', '2023-01-06 11:36:19', '2023-01-06 11:36:19'),
(3, 'Cream', '2023-01-06 11:36:19', '2023-01-06 11:36:19'),
(4, 'Black', '2023-01-06 11:36:19', '2023-01-06 11:36:19'),
(5, 'Blue', '2023-01-06 11:36:19', '2023-01-06 11:36:19'),
(6, 'Golden', '2023-01-12 14:59:36', '2023-01-12 14:59:36'),
(7, 'Dark Blue', '2023-01-12 14:59:36', '2023-01-12 14:59:36'),
(8, 'white', '2023-01-12 15:01:45', '2023-01-12 15:01:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_product_id` (`seller_product_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_product_id` (`seller_product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `seller_products`
--
ALTER TABLE `seller_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `seller_products`
--
ALTER TABLE `seller_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`seller_product_id`) REFERENCES `seller_products` (`id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`seller_product_id`) REFERENCES `seller_products` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seller_products`
--
ALTER TABLE `seller_products`
  ADD CONSTRAINT `seller_products_ibfk_28` FOREIGN KEY (`seller_id`) REFERENCES `profiles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `seller_products_ibfk_29` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `seller_products_ibfk_30` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET;
