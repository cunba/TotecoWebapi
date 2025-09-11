-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-09-2022 a las 16:03:52
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `toteco_api`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establishments`
--

CREATE TABLE `Establishments` (
  `id` varchar(36) NOT NULL,
  `name` varchar(30) NOT NULL,
  `creation_date` date NOT NULL,
  `location` varchar(200),
  `is_open` tinyint(1) NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `establishments`
--

INSERT INTO `Establishments` (`id`, `name`, `creation_date`, `location`, `is_open`, `score`) VALUES
('071ebb03-1d02-4af6-998d-72c2bb8d202c', 'Cómete México', '2025-09-05', '{\"latitude\": 40.4243892, \"longitude\": -3.6785293}', 1, 9.75),
('12b9190b-6aa9-47e2-ae98-53b9f2206b35', 'Brunells', '2025-09-05', '{\"latitude\": 41.3854186, \"longitude\": 2.1806806}', 1, 3.61),
('13e5397e-3b1e-4836-8667-2449b4d20a68', 'AMMA Gelato', '2025-09-05', '{\"latitude\": 41.4050748, \"longitude\": 2.1574339}', 1, 5),
('1fbd1b4a-115a-4124-8770-8f5042854d67', 'Veintiuno Coffee', '2025-09-05', '{\"latitude\": 41.642461, \"longitude\": -0.8931408999999999}', 1, 4.4),
('25c2d3a6-0d1e-4687-90eb-37bdf8005617', 'Pistacho Bakery & Coffee', '2025-09-05', '{\"latitude\": 41.662007599999995, \"longitude\": -0.8731738}', 1, 4.5),
('29c7ec53-1e46-4a5f-ad49-52b1613f2e28', 'Ramen-ya Hiro - Restaurant Japonés', '2025-09-05', '{\"latitude\": 41.3997038, \"longitude\": 2.1650736999999998}', 1, 4.29),
('2c89cb13-018d-43d1-87bb-864e390120b8', 'Los Manueles Reyes Católicos - Restaurante Granadino', '2025-09-05', '{\"latitude\": 37.1763525, \"longitude\": -3.5968756999999996}', 1, 4.44),
('31926287-72ea-4126-b56d-5235ef4d9d5e', 'Restaurant Sa Gambina', '2025-09-05', '{\"latitude\": 42.2878671, \"longitude\": 3.2770270999999997}', 1, 4.03),
('3bab5f64-bbee-468c-a213-ea3fd7746ca2', 'Impasto', '2025-09-05', '{\"latitude\": 59.20180380000001, \"longitude\": 17.623043499999998}', 1, 4.38),
('45bf196b-bab7-46e7-9c92-8d754226e802', 'Restaurante La Sirena Cadaqués', '2025-09-05', '{\"latitude\": 42.288227, \"longitude\": 3.2765136}', 1, 4.7),
('576750e8-70a3-4b9b-9e4e-61fe8479a2ee', 'Matcha Ya', '2025-09-05', '{\"latitude\": 59.3476405, \"longitude\": 18.066297}', 1, 5),
('6039e522-68b9-44fb-a3bd-5449545ae713', 'Anouk cafe', '2025-09-05', '{\"latitude\": 41.2672382, \"longitude\": 1.9711744999999998}', 1, 4.83),
('680b6dab-8ffa-43fc-a187-4782bf1bbe17', 'Pikio Taco', '2025-09-05', '{\"latitude\": 41.3990459, \"longitude\": 2.1628711}', 1, 4.51),
('69421a6f-c9c6-4c04-a7e4-c7916b5609db', 'Surfers Stockholm', '2025-09-05', '{\"latitude\": 59.335811400000004, \"longitude\": 18.0712029}', 1, 4.67),
('76c55665-23e8-4753-814e-1fd2a1f96edd', 'Stiernan Ramen', '2025-09-05', '{\"latitude\": 59.323463000000004, \"longitude\": 18.073787}', 1, 5),
('797feb44-9aec-4223-b85e-cf63c342510b', 'Pastelería Vincelle', '2025-09-05', '{\"latitude\": 42.5709865, \"longitude\": -0.5482277}', 1, 4.41),
('7b805c9d-e734-4772-a7d8-2b4fcff77f8e', 'Café Society', '2025-09-05', '{\"latitude\": 51.4976007, \"longitude\": -0.18443299999999999}', 1, 2.39),
('7f04900b-6b08-49ee-967f-517cb2383a7d', 'Mono Café', '2025-09-05', '{\"latitude\": 41.2363379, \"longitude\": 1.8100490999999999}', 1, 3.67),
('83d9b0d8-f98f-4818-bb01-cbf43dba87f7', 'The Milkman', '2025-09-05', '{\"latitude\": 55.950411599999995, \"longitude\": -3.1885375999999996}', 1, 4.67),
('92bd1c9f-bdb9-4640-b8b6-dfcd5dd397ae', 'Algrano | Pasta Bistro', '2025-09-05', '{\"latitude\": 41.376129, \"longitude\": 2.1578559000000004}', 1, 3.88),
('93c6b9e3-8f47-47fc-951b-82b5d8ecdce8', 'Trattoria dei Cartari', '2025-09-05', '{\"latitude\": 40.6367568, \"longitude\": 14.6019883}', 1, 4.7),
('947ab0b7-902e-4952-9cb1-1f9a7d64252f', 'O''Parrucchiano La Favorita', '2025-09-05', '{\"latitude\": 40.625067099999995, \"longitude\": 14.3717224}', 1, 3.88),
('a2b40d22-3a17-48d2-99e2-19cac3cc22d9', 'Maxime Petit Pâtisserie - pastelería & cafeteria', '2025-09-05', '{\"latitude\": 41.4117052, \"longitude\": 2.1754015}', 1, 4.5),
('aa3f7753-d70d-4aec-a298-70ed90274e40', 'Maison coffee', '2025-09-05', '{\"latitude\": 41.3878719, \"longitude\": 2.1526312}', 1, 5),
('bb178ba7-5c4e-431c-aff6-2b09450ae331', 'Roma & Sants', '2025-09-05', '{\"latitude\": 41.3751792, \"longitude\": 2.1392841}', 1, 3.71),
('bd3a1a7e-0e5e-4451-810a-6c3205a63d2d', 'Can Codina', '2025-09-05', '{\"latitude\": 41.398954, \"longitude\": 2.160862}', 1, 4.44),
('c03f1fa2-44c7-4944-b577-eb409a7ab000', 'botànic', '2025-09-05', '{\"latitude\": 41.4032513, \"longitude\": 2.1590879}', 1, 2.83),
('c1ebc1c2-2172-457e-8aeb-75076557a8ce', 'Coco Social House', '2025-09-05', '{\"latitude\": 41.3771944, \"longitude\": 2.1903981999999997}', 1, 4.25),
('d57b380d-8d76-4ca0-beb8-3f28668277ba', 'Faire Brunch & Drinks', '2025-09-05', '{\"latitude\": 41.3951705, \"longitude\": 2.1702878}', 1, 3.5),
('e2149053-7213-4459-aa8b-efbb950c7720', 'La Fuga Barcelona', '2025-09-05', '{\"latitude\": 41.3936326, \"longitude\": 2.1693359}', 1, 4.5),
('fafa6617-62a9-4268-8689-25b0a08f178e', 'Restaurante 5mentarios', '2025-09-05', '{\"latitude\": 42.6287981, \"longitude\": -0.32146949999999996}', 1, 3.92);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `Products` (
  `id` varchar(36) NOT NULL,
  `name` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `price` float NOT NULL,
  `score` float NOT NULL,
  `publication_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `Products` (`id`, `name`, `date`, `price`, `score`, `publication_id`) VALUES
('00a3e2bb-d20e-4462-93b7-f5d91a3c6747', 'tartufato', '2025-09-05', 15.8, 4, 'c7b0d12c-e041-444c-a949-ced4836e404d'),
('0115a6cb-4d7d-436f-82b3-1b89c554a0e6', 'pan carasau con pedro de albahaca', '2025-09-05', 3.5, 3.5, '97f062c9-53dc-435b-b8a4-7e318a6c2584'),
('01b922e8-2587-40d5-97b1-de567f1e3bee', 'huevos rotos con jamon', '2025-09-05', 11, 3.75, '30266b55-315d-4c60-91d4-e1d04f7295cb'),
('03e263a8-783c-4e4a-9745-c3e853bc1b1c', 'tarta de queso', '2025-09-05', 8.8, 3.75, '45417e45-3b1c-413c-853b-4db4360c8e9c'),
('042e3245-dc0d-49c0-900f-f95dc70ae15b', 'panettone clasico', '2025-09-05', 4.8, 4.5, '28595365-9f78-4c3c-8c02-4b31ddf54646'),
('063c3d11-7719-4bde-8345-0688f95b2143', 'agua jamaica', '2025-09-05', 4, 4.75, '12ca0cb6-9881-4d72-a382-d67173a2a39d'),
('0908d04b-1972-491c-8582-8c5e4576d036', 'arroz negro', '2025-09-05', 45.4, 3.75, '45417e45-3b1c-413c-853b-4db4360c8e9c'),
('097444de-06df-4af5-a842-d7175489005a', 'ramen shio', '2025-09-05', 17.41, 4.5, 'bc9f9d2f-e47d-408f-be85-65a2434279d2'),
('0a589c80-b665-4c14-a82a-f57999a675a0', 'taco carnitas', '2025-09-05', 3.9, 3.5, '12ca0cb6-9881-4d72-a382-d67173a2a39d'),
('0b27a996-0f33-4de8-990e-63f66e7adecd', 'iced matcha con leche de avena', '2025-09-05', 4.2, 3, '67c940bd-9838-4070-90fd-a89a3a92729e'),
('0c351aef-e0ee-42fd-8cba-0559e2a37b6b', 'tarta de queso con cobertura de maracuya', '2025-09-05', 5.8, 5, 'fce90186-872e-46e0-8882-ec5ea61deff2'),
('0d3a820c-e8bf-4075-86b3-b2e311726843', 'chipirones', '2025-09-05', 9.9, 3, '45417e45-3b1c-413c-853b-4db4360c8e9c'),
('0e2c217c-2154-467f-ae78-976d45b9f151', 'pastor con queso', '2025-09-05', 14, 5, '31c34a6e-f910-4513-80cf-c812a9d1ad1b'),
('0e76e033-3ed3-4d18-8cbf-83755e57054f', 'matcha avena', '2025-09-05', 4.5, 4, 'a6a061ac-96d4-4c34-a8bf-6081995f092a'),
('1010aa2f-744c-4b22-b994-246cc937f8f3', 'café society club', '2025-09-05', 10.5, 3, '57866e49-9319-486c-92dd-ac08cdc0ec94'),
('114ac2a0-fc68-4b96-a3a1-c257f2aa6f72', 'miso ramen picante 2', '2025-09-05', 15, 5, 'd1ce9b49-acde-4a0a-9726-05b99f05d578'),
('137ee4f5-d52a-41d5-aac3-5b0a9eeb92d5', 'croissant vegano', '2025-09-05', 2.4, 3.75, '12fd0990-5578-4333-a609-7d5a0e68d1c5'),
('142398ce-be41-4547-a115-28e221bf4d5c', 'tostada de setas', '2025-09-05', 5, 4.75, '12ca0cb6-9881-4d72-a382-d67173a2a39d'),
('155ddbc7-9353-4101-819b-53c9193f36e2', 'pastel de pistacho y frambuesa', '2025-09-05', 4.2, 5, 'f7a2a553-93bf-40f7-926f-0c249b897518'),
('1960ad56-c0ee-4815-b233-fb1b2f090258', 'palmera', '2025-09-05', 1.2, 5, 'f7a2a553-93bf-40f7-926f-0c249b897518'),
('1ab9bd11-e8cf-4f9a-9aa1-5ae513c74dc1', 'iced latte', '2025-09-05', 3.5, 4, '67c940bd-9838-4070-90fd-a89a3a92729e'),
('1c072b9d-a6e5-4be8-ba4c-0f2767bacc46', 'pizza parma', '2025-09-05', 25, 3.5, 'cb5af8ea-0eaf-4b4e-a629-797f3a7f1db4'),
('1d939b7a-0eb2-4327-a05f-4f3a52265bc0', 'ravioli de setas', '2025-09-05', 15.2, 5, '28595365-9f78-4c3c-8c02-4b31ddf54646'),
('1eed7bea-e9ee-469d-b90b-d805d52bbc2c', 'matcha con leche de avena', '2025-09-05', 4, 2, 'f6a42db8-e280-4130-807c-9f4577ff376d'),
('23124b71-e420-499c-861e-22d3a689d8e1', 'croqueton de rabo de buey', '2025-09-05', 3.8, 5, '9ba1e298-3447-4194-9014-528ce4ce02fc'),
('2488f26f-340f-4217-9a0d-1d7504820e09', 'eggs royale', '2025-09-05', 12.99, 1, '57866e49-9319-486c-92dd-ac08cdc0ec94'),
('2694508b-b084-43bb-9a61-3d45bc32461c', 'mejillones', '2025-09-05', 17.5, 5, '8eb8d85e-ad2d-48cf-b316-4a30fb998b34'),
('270815e1-e85b-4dc9-8721-20090ddd8186', 'matcha latte', '2025-09-05', 3.9, 3, '67c940bd-9838-4070-90fd-a89a3a92729e'),
('2dd10a7a-46ce-492b-b47b-b28a6b1fd0c7', 'matcha con leche de avena', '2025-09-05', 3, 3.5, 'f7a2a553-93bf-40f7-926f-0c249b897518'),
('2ee77c3d-612f-4221-a0d0-3101fdf2763a', 'kimchi', '2025-09-05', 3.9, 4, 'd1ce9b49-acde-4a0a-9726-05b99f05d578'),
('2f128a82-d53d-4142-a22b-87f92b101160', 'costilla de cerdo confitada', '2025-09-05', 8.8, 4.5, '9ba1e298-3447-4194-9014-528ce4ce02fc'),
('30185b06-ef3c-444b-b4c1-dd0996e4771e', 'bang', '2025-09-05', 13, 5, 'de0c8333-2caf-4626-91df-1a4d0034325d'),
('32992678-100c-41d3-9d2b-9a75eca34f83', 'enchiladas pollo', '2025-09-05', 14, 4, '31c34a6e-f910-4513-80cf-c812a9d1ad1b'),
('37299167-5a46-4e15-aefb-2a59f17972ee', 'entremes variados', '2025-09-05', 23.45, 4, '31c34a6e-f910-4513-80cf-c812a9d1ad1b'),
('38dadef1-c945-4e86-91a5-a2f72bb22133', 'huevos estrellados', '2025-09-05', 8.1, 3.7, '9ba1e298-3447-4194-9014-528ce4ce02fc'),
('3b35e1fe-02e3-4c4b-a426-634de0a23f6a', 'mini campero', '2025-09-05', 12.95, 4, 'e5a64410-d7d4-4add-9c32-4c85250419cc'),
('3cd25b35-463c-4245-992b-33f58ff6e800', 'shoyu ramen', '2025-09-05', 17.18, 5, '12c45e77-7cb5-4a29-ad85-ce9f8d111f2b'),
('40bd414d-e22e-4275-8c1b-fd1dc9998f5a', 'tofu', '2025-09-05', 13, 4.25, 'de0c8333-2caf-4626-91df-1a4d0034325d'),
('4526420a-003c-4116-a7b2-7a962934063e', 'pizza carciofini', '2025-09-05', 18, 4.5, 'cb5af8ea-0eaf-4b4e-a629-797f3a7f1db4'),
('48877754-dd54-4ed9-bdaf-60c66eccc016', 'café americano', '2025-09-05', 3.3, 4, '12fd0990-5578-4333-a609-7d5a0e68d1c5'),
('4955574b-165d-4073-b280-7e096c1ff773', 'iced matcha con leche de avena', '2025-09-05', 4, 3.5, '2dc64142-3453-4c9b-a35e-7fc0bb8de9b7'),
('4a8d4d20-7ac2-42d4-8874-3c6a3f44b1e7', 'infusion de gengibre y limon', '2025-09-05', 3.85, 4, 'db30829f-c665-418f-b46c-6e098e182efb'),
('4aec4889-d510-4402-a4e6-8e0a5a6df0b6', 'vermut', '2025-09-05', 3.2, 4.8, '9ba1e298-3447-4194-9014-528ce4ce02fc'),
('4e049c13-d577-4aaf-a5a0-8461539618c8', 'spaghetti quadrati alle vongole', '2025-09-05', 22, 4.75, '02e91092-8c31-47a7-a5f7-747bc576fe05'),
('4efad7ac-945d-450e-97f8-aa1c71b894e3', 'café con leche de avena', '2025-09-05', 4, 2.5, 'f6a42db8-e280-4130-807c-9f4577ff376d'),
('50999425-17e3-4bab-a95b-1e592df0fcbb', 'brioche de aguacate', '2025-09-05', 7.2, 5, '06d3c629-5dae-480c-9916-8462d4599984'),
('50cad72d-7f90-4ec6-80ba-19ae698b6995', 'agua mango', '2025-09-05', 4, 4.6, '12ca0cb6-9881-4d72-a382-d67173a2a39d'),
('50f47c6d-1aa4-4b9f-b852-31dfc5fa2664', 'chai con leche de vaca', '2025-09-05', 4.9, 4.5, 'e898c959-7086-419b-b215-bb5238e5f2f8'),
('5219ac1c-be89-4c73-8942-91081ba8fa99', 'brioche de aguacate', '2025-09-05', 7.2, 4, '06d3c629-5dae-480c-9916-8462d4599984'),
('57f3ea9c-cb20-475c-b7df-1f3b982ad3d4', 'menu del día', '2025-09-05', 30, 4.25, '30266b55-315d-4c60-91d4-e1d04f7295cb'),
('5acb97c3-6279-47f1-84a1-25d42e1318e2', 'crema catalana', '2025-09-05', 7.7, 4.75, '45417e45-3b1c-413c-853b-4db4360c8e9c'),
('5e96ff33-0d17-47dd-9cb7-d11fc4e81328', 'gyozas', '2025-09-05', 5.8, 4.75, 'd1ce9b49-acde-4a0a-9726-05b99f05d578'),
('63573794-3f6c-4a43-b333-e68fcf840fa2', 'croqueta de setas', '2025-09-05', 1.7, 4, '9ba1e298-3447-4194-9014-528ce4ce02fc'),
('653e0edd-be87-45b3-a3fe-07d2f0b2be0e', 'iced latte con leche de avena', '2025-09-05', 3.2, 5, 'fce90186-872e-46e0-8882-ec5ea61deff2'),
('669b763b-fc8b-4f89-9c12-b7ad9cb5e2c3', 'cookie de giaduia', '2025-09-05', 3.9, 4, '28595365-9f78-4c3c-8c02-4b31ddf54646'),
('6711b28a-b197-4d62-a34f-dc3502f46a4d', 'vainilla y mandarina con albahaca', '2025-09-05', 4.1, 5, '59ec1233-8eb7-47e3-88ef-1f7d8572daa5'),
('6a0f8c8d-17f9-4baf-89f6-384c3fe7f02d', 'taco tijuana', '2025-09-05', 3.9, 4.25, '12ca0cb6-9881-4d72-a382-d67173a2a39d'),
('6a61d678-795a-4a51-848e-9cc7b3a66d03', 'tartalletta di fragola', '2025-09-05', 6, 5, '1ff262b3-9fbb-4636-b808-3cd7ef1a096a'),
('6a96a15e-88d7-48c6-a78f-2d9ad543eeb9', 'torrezno con patatas', '2025-09-05', 4, 4.5, '30266b55-315d-4c60-91d4-e1d04f7295cb'),
('6b2372b1-66f4-434d-8b2a-d119fef084ff', 'crepe de aguacate con pavo y crema de pistacho', '2025-09-05', 7, 4.75, 'e898c959-7086-419b-b215-bb5238e5f2f8'),
('6cf4917a-866b-4dbc-8e94-0387301f70e6', 'cookie de matcha', '2025-09-05', 3.7, 3.75, '87a79d3c-7bfd-4112-9dba-e6c979638004'),
('6d30c958-f749-4300-a770-fa66bf129d3b', 'coulant de matcha', '2025-09-05', 5, 4, 'd1ce9b49-acde-4a0a-9726-05b99f05d578'),
('6d3b2a54-5982-40ee-b75b-db25691dc921', 'pappardelle ragú', '2025-09-05', 15.5, 4.5, '28595365-9f78-4c3c-8c02-4b31ddf54646'),
('6df697f6-7392-4bca-b6f2-b12ff73e4716', 'café con leche de avena', '2025-09-05', 1.8, 4.75, 'f7a2a553-93bf-40f7-926f-0c249b897518'),
('6ea05421-0a39-447b-acd6-9a7d2cc6116d', 'radish salad', '2025-09-05', 12, 4, 'de0c8333-2caf-4626-91df-1a4d0034325d'),
('75eb69f4-ab37-4ad7-af67-703ab1e81d5c', 'eclair de maracuya', '2025-09-05', 4, 5, '2dc64142-3453-4c9b-a35e-7fc0bb8de9b7'),
('76aca108-c4c1-4d07-97fc-65843486cd28', 'matcha con leche de avena', '2025-09-05', 2.5, 3, '7dfe4286-25ab-4167-a42b-d011a01fbb83'),
('793ab291-e67a-4bdc-8996-cfd75cd037a4', 'gnocci alla sorrentina', '2025-09-05', 14, 4, '02e91092-8c31-47a7-a5f7-747bc576fe05'),
('79a10fa9-dea5-4456-b7b9-99c1e69255e8', 'matcha con leche de avena', '2025-09-05', 3.9, 4.5, '87a79d3c-7bfd-4112-9dba-e6c979638004'),
('7a6d8b28-5e7c-40d3-9a23-efd65853b679', 'avocado royale', '2025-09-05', 13.99, 1.5, '57866e49-9319-486c-92dd-ac08cdc0ec94'),
('7f434854-3d64-4509-a597-722f6717f8ef', 'matcha con leche de avena', '2025-09-05', 3.1, 4.75, '5f37752c-565a-4ca8-9e78-6f3a345ab609'),
('80da1ce7-f68a-422c-bbfd-94e915a48462', 'antipasti dello chef', '2025-09-05', 15, 2, '02e91092-8c31-47a7-a5f7-747bc576fe05'),
('81747830-fe99-4d78-b30e-76d3c7ece7a7', 'cochinita pibil', '2025-09-05', 14, 3.5, '31c34a6e-f910-4513-80cf-c812a9d1ad1b'),
('819f45ea-0375-4eb7-8e58-92f1eaf2e74a', 'escalivada', '2025-09-05', 11.5, 3.5, '8eb8d85e-ad2d-48cf-b316-4a30fb998b34'),
('81b1f709-e004-4d6f-82d2-a353e1c52a6f', 'croissant de lemon pie', '2025-09-05', 5.3, 3.5, '12fd0990-5578-4333-a609-7d5a0e68d1c5'),
('8482b325-ad88-4341-b05f-08d63b8fda00', 'moritz', '2025-09-05', 2.8, 5, '9ba1e298-3447-4194-9014-528ce4ce02fc'),
('853622e5-cc52-45ef-b21d-f2bcc1c3d641', 'candela con braciola al ragu', '2025-09-05', 18, 4.5, '02e91092-8c31-47a7-a5f7-747bc576fe05'),
('89dce69c-e096-45d0-9528-8eb901f2e1c8', 'te negro', '2025-09-05', 4, 4.5, '4fb56d78-0f1c-40f8-b0ce-02c458819c7e'),
('8bee1ba1-aa8b-415c-bf18-d547d15ea0a4', 'croissant de mango', '2025-09-05', 2.9, 4, '67c940bd-9838-4070-90fd-a89a3a92729e'),
('8d9fd79b-3e99-45cd-8c84-89485e5a6b4d', 'croissant de pistacho', '2025-09-05', 5.3, 5, 'db30829f-c665-418f-b46c-6e098e182efb'),
('8e901ef1-ef71-4e5d-99b9-9b163c0d172a', 'ravioli de ossobuco', '2025-09-05', 16.5, 4.75, '97f062c9-53dc-435b-b8a4-7e318a6c2584'),
('90696f04-eaa7-46c7-aec7-062d2baa87b2', 'Black Tea', '2025-09-05', 4, 5, 'c60cab24-d703-4f7f-ad63-233ee81d2c3c'),
('9434e90d-9a5c-423d-b0a9-334f2f1fd0f8', 'tapa', '2025-09-05', 0, 4, 'e5a64410-d7d4-4add-9c32-4c85250419cc'),
('95f6dad2-4459-4202-ba83-51620383d2a0', 'ribs', '2025-09-05', 14, 4.5, 'de0c8333-2caf-4626-91df-1a4d0034325d'),
('9ea59369-7df6-406f-b71f-7519ec4daf3e', 'iced mousse foam pistacho latte', '2025-09-05', 5, 4, '4b1bdd9a-6d20-4980-9ef2-1c2625d72358'),
('a34f2cdd-bff0-4b14-9eeb-bf1c850bb9fe', 'migas', '2025-09-05', 9, 3.75, '30266b55-315d-4c60-91d4-e1d04f7295cb'),
('a544f531-b804-4cfd-823c-cc578ede6364', 'fideua', '2025-09-05', 43.4, 3.5, '45417e45-3b1c-413c-853b-4db4360c8e9c'),
('a54c43bd-11cd-4d59-83b2-e0f4d1288a62', 'café con leche de avena', '2025-09-05', 3.1, 4, '12fd0990-5578-4333-a609-7d5a0e68d1c5'),
('a741c0fc-5d75-46b2-8f0d-2e140b562ff5', 'pizza cherry, olivas negras y mozzarella', '2025-09-05', 12.1, 4.25, '28595365-9f78-4c3c-8c02-4b31ddf54646'),
('aaf97034-d6d3-46d5-9518-aee536c9e8e6', 'cortado descafeinado', '2025-09-05', 2.2, 4.5, '28595365-9f78-4c3c-8c02-4b31ddf54646'),
('af8e4d51-0d4b-4717-bd42-3fc0f5db2c9a', 'benedict aguacate', '2025-09-05', 12, 2, 'c7b0d12c-e041-444c-a949-ced4836e404d'),
('afa09ac0-3fa3-4258-988c-74a5a4ac910f', 'paella marinera', '2025-09-05', 24.5, 5, '8eb8d85e-ad2d-48cf-b316-4a30fb998b34'),
('b21d7245-b462-45e5-942c-b428a1ab04a6', 'Nachos guacamole carnitas', '2025-09-05', 13.3, 5, '31c34a6e-f910-4513-80cf-c812a9d1ad1b'),
('b35c8090-1bb1-444d-8bbc-6d2f30f7e648', 'cacao con datiles y mango', '2025-09-05', 4.1, 5, '59ec1233-8eb7-47e3-88ef-1f7d8572daa5'),
('bacf99f4-e142-41c1-a67c-53bc5ef4c755', 'latte con avena', '2025-09-05', 5, 3, '57866e49-9319-486c-92dd-ac08cdc0ec94'),
('bb03dc27-6431-4f28-b840-ebd875e24109', 'matcha con leche de avena', '2025-09-05', 6, 2, '57866e49-9319-486c-92dd-ac08cdc0ec94'),
('bb652873-4174-4ed8-95b9-c590c85269e2', 'tarta de queso y pistacho', '2025-09-05', 6, 4.75, 'e898c959-7086-419b-b215-bb5238e5f2f8'),
('bd2332d3-ccb2-4246-96e0-b7caeecabd00', 'matcha con leche de avena', '2025-09-05', 4.9, 4, 'e898c959-7086-419b-b215-bb5238e5f2f8'),
('bd8680ab-8eba-4b61-81ac-fdbca4a1f4e0', 'chai latte', '2025-09-05', 3.2, 4, '06d3c629-5dae-480c-9916-8462d4599984'),
('bd8696b6-4b5e-42d0-a7d7-83543fca9eaf', 'matcha con leche de avena', '2025-09-05', 3.2, 4, '06d3c629-5dae-480c-9916-8462d4599984'),
('bdf2c888-95f6-49ce-96e9-4ae70e340428', 'lacito', '2025-09-05', 2.75, 3.5, 'f7a2a553-93bf-40f7-926f-0c249b897518'),
('c0ad6dbb-f677-41be-a94c-f062a306b1a7', 'tiramisu', '2025-09-05', 6, 3, '02e91092-8c31-47a7-a5f7-747bc576fe05'),
('c13fe4d6-97e9-4709-9275-79df924c6e60', 'avocado royale', '2025-09-05', 13.99, 1.5, '57866e49-9319-486c-92dd-ac08cdc0ec94'),
('c2a068ba-fe2e-414b-bd4d-02fbf94d1b17', 'brocheta de pulpo y panceta', '2025-09-05', 5.6, 4.5, '9ba1e298-3447-4194-9014-528ce4ce02fc'),
('c2d2afb4-3bb5-4ff2-80ff-93cf983a4d8e', 'pan tumaca', '2025-09-05', 3.9, 4, '45417e45-3b1c-413c-853b-4db4360c8e9c'),
('c486900a-c720-4c6e-b4fa-6ae97bd1f1b1', 'parmiggiani melanzana', '2025-09-05', 10, 4.5, '1ff262b3-9fbb-4636-b808-3cd7ef1a096a'),
('c5948dbb-56a9-43e3-bb04-2fe4756cf604', 'edamame', '2025-09-05', 4, 4, 'd1ce9b49-acde-4a0a-9726-05b99f05d578'),
('c5961984-5453-4071-bea1-7aeb36119698', 'cookie xoco blanco', '2025-09-05', 3.3, 4.25, '67c940bd-9838-4070-90fd-a89a3a92729e'),
('c5d2c1ed-e24f-467c-a926-a2013e0d1f32', 'aubergine', '2025-09-05', 18, 5, 'de0c8333-2caf-4626-91df-1a4d0034325d'),
('c6b8c84e-d12f-4405-a189-4704249eb1fa', 'pastel de lotus y chocolate', '2025-09-05', 3.8, 4, 'f7a2a553-93bf-40f7-926f-0c249b897518'),
('c7e76d59-ff6c-4d1e-9b5d-767204c8609f', 'biang biang noodles', '2025-09-05', 23, 5, 'de0c8333-2caf-4626-91df-1a4d0034325d'),
('c81fd24a-2ef4-4089-8e3a-53c22edff96a', 'chuleton', '2025-09-05', 55, 3.5, '30266b55-315d-4c60-91d4-e1d04f7295cb'),
('c95d5200-383d-44ee-8043-5c53ef88ad30', 'spaghetti alle vongole', '2025-09-05', 18, 4, '1ff262b3-9fbb-4636-b808-3cd7ef1a096a'),
('caa15bb1-1eb0-492e-bf78-106f93eb1af8', 'benedict supreme', '2025-09-05', 14, 3, 'c7b0d12c-e041-444c-a949-ced4836e404d'),
('cc5e610e-6b7c-4c8c-8f6a-bcece434f983', '4 cafés con leche de avena', '2025-09-05', 3.1, 4.75, '5f37752c-565a-4ca8-9e78-6f3a345ab609'),
('cc86e485-ebc9-4b78-a575-e5ec18bc968b', 'iced matcha coco latte', '2025-09-05', 5.5, 4.5, 'fce90186-872e-46e0-8882-ec5ea61deff2'),
('cd45ee75-6801-4d15-9376-bd690ad99238', 'taco birria', '2025-09-05', 3.9, 4.7, '12ca0cb6-9881-4d72-a382-d67173a2a39d'),
('d54888c8-703a-4fea-a9b4-1da90e577cb7', 'café con leche de avena', '2025-09-05', 2.5, 4, '7dfe4286-25ab-4167-a42b-d011a01fbb83'),
('d5a80e43-d34a-4849-a67b-ca1683315864', 'pizza margarita', '2025-09-05', 16, 5, 'cb5af8ea-0eaf-4b4e-a629-797f3a7f1db4'),
('d5a962a7-716f-49d7-b0ec-f70f3dcad804', 'zumo de naranja', '2025-09-05', 4.5, 4, 'c7b0d12c-e041-444c-a949-ced4836e404d'),
('d5f68aa9-67f8-44cb-b1b2-45f00e9749e6', 'capuchino', '2025-09-05', 5.49, 2.5, '57866e49-9319-486c-92dd-ac08cdc0ec94'),
('d6b86371-4bc4-41c1-b9ea-700e5f08153b', 'capuchino', '2025-09-05', 5.49, 4, '57866e49-9319-486c-92dd-ac08cdc0ec94'),
('d73ee0f9-9102-4213-87ac-265203a5ba1c', 'tiramisú', '2025-09-05', 5, 4, '4b1bdd9a-6d20-4980-9ef2-1c2625d72358'),
('d75b82b5-73c8-4e03-9374-cfd7471ebdbf', 'iced latte', '2025-09-05', 4.5, 5, 'a6a061ac-96d4-4c34-a8bf-6081995f092a'),
('d7a00088-9656-4de5-bca9-5089c807d84d', 'croissant de cheesecake', '2025-09-05', 5.3, 4, '12fd0990-5578-4333-a609-7d5a0e68d1c5'),
('dc8e17d8-42a6-4f98-ada6-9e1cf7da48a3', 'shrimp balls', '2025-09-05', 19, 4.75, 'de0c8333-2caf-4626-91df-1a4d0034325d'),
('dc9c913d-c9de-43a1-ab94-696f90f104aa', 'maccheroni tartufo', '2025-09-05', 16.5, 3.25, '97f062c9-53dc-435b-b8a4-7e318a6c2584'),
('df6214e1-1ba3-4ef7-9fef-131bdcce4e1d', 'te-ramisu', '2025-09-05', 10, 4.5, 'de0c8333-2caf-4626-91df-1a4d0034325d'),
('e17f0c3a-9957-4483-8624-80f2d5387a53', 'iced latte con leche de avena', '2025-09-05', 3.5, 5, '4b1bdd9a-6d20-4980-9ef2-1c2625d72358'),
('e467475e-6404-4b3c-bba1-9c021b3aa282', 'albondiga', '2025-09-05', 2.6, 4.75, 'e5a64410-d7d4-4add-9c32-4c85250419cc'),
('e57dc1f2-51dd-4846-8a33-6219a172686e', 'bowl de yogur con granola y fruta de temporada', '2025-09-05', 4.9, 5, 'e898c959-7086-419b-b215-bb5238e5f2f8'),
('e5e7c196-1bed-4814-a2ac-7ffd73217bf7', 'matcha latte', '2025-09-05', 6, 4, '4fb56d78-0f1c-40f8-b0ce-02c458819c7e'),
('e9d8b9da-e029-4bb5-bdd0-b930535a65ec', 'jaqués', '2025-09-05', 2.8, 4.5, 'f7a2a553-93bf-40f7-926f-0c249b897518'),
('f16e47f7-2592-48ce-8d30-c42b52b411be', 'maccheroni genovesse', '2025-09-05', 15, 5, '1ff262b3-9fbb-4636-b808-3cd7ef1a096a'),
('f27bf2dd-9983-454f-8bfc-f0f5e98d6767', 'zumo de manzana', '2025-09-05', 4.4, 4, 'db30829f-c665-418f-b46c-6e098e182efb'),
('f6210226-960f-4b3d-bd57-2e3b3c1683dc', 'café leche de avena', '2025-09-05', 2, 4, 'c7b0d12c-e041-444c-a949-ced4836e404d'),
('f70452f7-538e-446f-bed8-5bf39b6abbaf', 'vieras con alcachofa en salsa de azafrán', '2025-09-05', 17.1, 4.5, '45417e45-3b1c-413c-853b-4db4360c8e9c'),
('fba6388d-7569-4ad8-ab6f-cc4a64d6c81c', 'suquet', '2025-09-05', 27.5, 5, '8eb8d85e-ad2d-48cf-b316-4a30fb998b34'),
('fbe42c1a-5cf5-4fbd-94c4-7c5a70666b61', 'Jarra margarita maracuyá', '2025-09-05', 28, 5, '31c34a6e-f910-4513-80cf-c812a9d1ad1b'),
('fcbdd0f7-d84d-4220-9d39-5a788026cfe6', 'café con leche de avena', '2025-09-05', 3.1, 4, 'db30829f-c665-418f-b46c-6e098e182efb'),
('fdc0e6dc-2b0f-4c0e-99e5-d87c77ef3f60', 'tarta de matcha y frambuesa', '2025-09-05', 5, 3.7, '4b1bdd9a-6d20-4980-9ef2-1c2625d72358'),
('fe043956-f5dd-42ae-a18a-7ef96a5381a2', 'matcha con leche de avena', '2025-09-05', 4, 3, '12fd0990-5578-4333-a609-7d5a0e68d1c5'),
('fef82a24-1467-4457-b064-d11ee3066b79', 'pancakes', '2025-09-05', 11.75, 3.5, 'c7b0d12c-e041-444c-a949-ced4836e404d');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publications`
--

CREATE TABLE `Publications` (
  `id` varchar(36) NOT NULL,
  `date` date NOT NULL,
  `total_price` float NOT NULL,
  `total_score` float NOT NULL,
  `photo` varchar(200) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `establishment_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `publications`
--

INSERT INTO `Publications` (`id`, `date`, `total_price`, `total_score`, `photo`, `user_id`, `establishment_id`) VALUES
('02e91092-8c31-47a7-a5f7-747bc576fe05', '2025-09-05', 75, 3.88, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/3A2BF7B4-23D9-4BC2-AF50-303D96FD2BD6.jpg?alt=media&token=ac8cb061-2b06-4934-ad32-3075b2fa5892', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '947ab0b7-902e-4952-9cb1-1f9a7d64252f'),
('06d3c629-5dae-480c-9916-8462d4599984', '2025-09-05', 20.8, 4.4, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/A217FC11-07FC-475B-8933-56109523C342.jpg?alt=media&token=978350a7-6dd2-4814-b261-fb77b51dbcb6', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '1fbd1b4a-115a-4124-8770-8f5042854d67'),
('12c45e77-7cb5-4a29-ad85-ce9f8d111f2b', '2025-09-05', 17.18, 5, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/BCB46270-979C-484A-B975-64525D32F78A.jpg?alt=media&token=eb4392aa-b49d-4e51-a86e-4b39d7e8a2f2', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '76c55665-23e8-4753-814e-1fd2a1f96edd'),
('12ca0cb6-9881-4d72-a382-d67173a2a39d', '2025-09-05', 24.7, 4.51, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/D93DB1F3-C205-43E1-BC62-DA21B61D03AE.jpg?alt=media&token=b4b799e9-6848-497c-a518-51fd2f0ec2ae', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '680b6dab-8ffa-43fc-a187-4782bf1bbe17'),
('12fd0990-5578-4333-a609-7d5a0e68d1c5', '2025-09-05', 23.4, 3.61, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/C73C83D5-F6D1-455B-913B-5EA457847C4E.jpg?alt=media&token=b0169a1b-a30c-4eef-bf1e-d91118cf3576', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '12b9190b-6aa9-47e2-ae98-53b9f2206b35'),
('1ff262b3-9fbb-4636-b808-3cd7ef1a096a', '2025-09-05', 49, 4.7, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/93F35016-61E9-47F7-B754-6C3CFAD3EB3F.jpg?alt=media&token=f4568130-7864-401f-bc72-caf7a9519753', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '93c6b9e3-8f47-47fc-951b-82b5d8ecdce8'),
('28595365-9f78-4c3c-8c02-4b31ddf54646', '2025-09-05', 53.7, 4.5, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/5397E3D2-34C6-452D-9A09-443DF0E89152.jpg?alt=media&token=adfddcf2-f437-4810-8357-201876c9ed92', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', 'e2149053-7213-4459-aa8b-efbb950c7720'),
('2dc64142-3453-4c9b-a35e-7fc0bb8de9b7', '2025-09-05', 8, 4.5, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/5071B534-22E8-4EB7-9468-13FA9982BBC5.jpg?alt=media&token=8bacaa75-1e56-49fc-845f-88c93424222c', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', 'a2b40d22-3a17-48d2-99e2-19cac3cc22d9'),
('30266b55-315d-4c60-91d4-e1d04f7295cb', '2025-09-05', 109, 3.92, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/6894D909-4081-4A22-B5D2-5738188705B1.jpg?alt=media&token=56adacdb-d5b6-447d-aa60-692b81c385fa', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', 'fafa6617-62a9-4268-8689-25b0a08f178e'),
('31c34a6e-f910-4513-80cf-c812a9d1ad1b', '2025-09-05', 106.75, 4.46, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/21119045-2DC6-4D78-B94B-EDBF8188D384.jpg?alt=media&token=24348111-dd7a-48d0-9559-a1ea84b381fe', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '071ebb03-1d02-4af6-998d-72c2bb8d202c'),
('45417e45-3b1c-413c-853b-4db4360c8e9c', '2025-09-05', 136.2, 4.03, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/C9F56DBE-8318-41B8-A16A-7B7A75386B5A.jpg?alt=media&token=dbe1905d-e985-43fe-943f-9b46342336be', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '31926287-72ea-4126-b56d-5235ef4d9d5e'),
('4b1bdd9a-6d20-4980-9ef2-1c2625d72358', '2025-09-05', 18.5, 4.34, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/45966194-D84E-45D0-9232-9100A07E999A.jpg?alt=media&token=3600be5a-b780-4b69-bd7b-f22ffa9c1e7b', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', 'aa3f7753-d70d-4aec-a298-70ed90274e40'),
('4fb56d78-0f1c-40f8-b0ce-02c458819c7e', '2025-09-05', 10, 4, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/B9F6FAA0-B0BF-4258-887B-3F4CDC16B2BA.jpg?alt=media&token=1adf6c48-6d54-40fa-acdb-e938d626a462', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '576750e8-70a3-4b9b-9e4e-61fe8479a2ee'),
('57866e49-9319-486c-92dd-ac08cdc0ec94', '2025-09-05', 73.45, 2.39, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/7DABC7C1-B027-48D8-A3D2-FAA77351C80C.jpg?alt=media&token=79ac5de3-67c7-42cb-8055-ba1a765d367b', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '7b805c9d-e734-4772-a7d8-2b4fcff77f8e'),
('59ec1233-8eb7-47e3-88ef-1f7d8572daa5', '2025-09-05', 8.2, 5, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/AB6402B5-9EE0-4630-96FE-F7DB10B97262.jpg?alt=media&token=fae03275-9335-43f5-8bf2-f5519d462207', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '13e5397e-3b1e-4836-8667-2449b4d20a68'),
('5f37752c-565a-4ca8-9e78-6f3a345ab609', '2025-09-05', 6.2, 4.83, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/3727DC7D-FA1E-45D5-8808-C16DB8AC80E6.jpg?alt=media&token=22a4ec12-f85b-4ac7-887b-2f5cf6caef9a', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '6039e522-68b9-44fb-a3bd-5449545ae713'),
('67c940bd-9838-4070-90fd-a89a3a92729e', '2025-09-05', 17.8, 3.7, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/2058F24C-1CE7-4E7A-8897-DB52A86AA16F.jpg?alt=media&token=3fa908fd-4159-462e-96f4-06b7294ac3ba', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', 'bb178ba7-5c4e-431c-aff6-2b09450ae331'),
('7dfe4286-25ab-4167-a42b-d011a01fbb83', '2025-09-05', 5, 3.67, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/09F2103C-C256-451C-811F-57F05777558E.jpg?alt=media&token=c556741c-d448-47be-9652-22b949f131f7', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '7f04900b-6b08-49ee-967f-517cb2383a7d'),
('87a79d3c-7bfd-4112-9dba-e6c979638004', '2025-09-05', 7.6, 4.25, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/954F38E2-B618-4344-A576-79EF4E55BC8D.jpg?alt=media&token=b0fcbd8c-c375-4873-be4e-69b82a5cf775', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', 'c1ebc1c2-2172-457e-8aeb-75076557a8ce'),
('8eb8d85e-ad2d-48cf-b316-4a30fb998b34', '2025-09-05', 81, 4.7, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/6822DB53-45DF-4C8C-AE13-B4BF8F14B029.jpg?alt=media&token=50f15387-a473-49c7-9398-656f195f354f', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '45bf196b-bab7-46e7-9c92-8d754226e802'),
('97f062c9-53dc-435b-b8a4-7e318a6c2584', '2025-09-05', 36.5, 3.88, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/AD8255F7-D523-4BE5-8E8D-753615D0D0FF.jpg?alt=media&token=6a3f4bf5-c28d-4240-b8cf-c3bc519fe213', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '92bd1c9f-bdb9-4640-b8b6-dfcd5dd397ae'),
('9ba1e298-3447-4194-9014-528ce4ce02fc', '2025-09-05', 34, 4.44, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/D14B6A94-70CC-4ECD-BE31-BB087AB49350.jpg?alt=media&token=40e49ea0-1e85-4fd7-8922-5735e494d92a', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', 'bd3a1a7e-0e5e-4451-810a-6c3205a63d2d'),
('a6a061ac-96d4-4c34-a8bf-6081995f092a', '2025-09-05', 9, 4.67, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/B630ABF7-E3DC-430A-B0AA-843C399D9334.jpg?alt=media&token=7b70ce40-a5c8-4872-bb07-4589d567354f', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '83d9b0d8-f98f-4818-bb01-cbf43dba87f7'),
('bc9f9d2f-e47d-408f-be85-65a2434279d2', '2025-09-05', 17.41, 4.75, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/AA06E623-FD23-4A62-8E1A-BDD5DEB9CAF4.jpg?alt=media&token=1350a365-0155-4cbb-b540-797d713109a9', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '76c55665-23e8-4753-814e-1fd2a1f96edd'),
('c60cab24-d703-4f7f-ad63-233ee81d2c3c', '2025-09-05', 4, 5, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/IMG_5020.jpeg?alt=media&token=eaede88a-5fac-456f-b172-97aab80f62ce', '34c177a1-69ab-4d54-83c1-3b1e962c95f2', '576750e8-70a3-4b9b-9e4e-61fe8479a2ee'),
('c7b0d12c-e041-444c-a949-ced4836e404d', '2025-09-05', 60.05, 3.5, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/5C7C96F8-ABE9-402C-B522-E15B5F407F8E.jpg?alt=media&token=b41c16fe-8cb9-4d11-be0f-7e6f0cbc7cba', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', 'd57b380d-8d76-4ca0-beb8-3f28668277ba'),
('cb5af8ea-0eaf-4b4e-a629-797f3a7f1db4', '2025-09-05', 59, 4.38, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/83E9E4B6-53AB-4740-B0E6-BB87CF6ABF6C.jpg?alt=media&token=ff92cc57-7f9e-4151-a97b-63fd033a7f8e', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '3bab5f64-bbee-468c-a213-ea3fd7746ca2'),
('d1ce9b49-acde-4a0a-9726-05b99f05d578', '2025-09-05', 33.7, 4.29, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/CECAEEDB-81C8-4A82-9924-383618400654.jpg?alt=media&token=f9c4ef1c-8185-4dcd-8329-1762aaf0bdae', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '29c7ec53-1e46-4a5f-ad49-52b1613f2e28'),
('db30829f-c665-418f-b46c-6e098e182efb', '2025-09-05', 16.65, 4.35, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/8C385517-AEDF-47CA-8DDF-A36C50D1A66B.jpg?alt=media&token=ca1d6ba3-f1e2-47bf-b545-e4f30b09dcb0', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '12b9190b-6aa9-47e2-ae98-53b9f2206b35'),
('de0c8333-2caf-4626-91df-1a4d0034325d', '2025-09-05', 122, 4.67, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/0C393E7D-49F2-473B-A99C-B53097B29118.jpg?alt=media&token=2830a28c-7240-490e-a237-c100e2071403', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '69421a6f-c9c6-4c04-a7e4-c7916b5609db'),
('e5a64410-d7d4-4add-9c32-4c85250419cc', '2025-09-05', 15.55, 4.44, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/D47C4843-CEE5-4329-96DA-FD0C4DEA06C3.jpg?alt=media&token=82c7b508-a00c-4447-871a-7b66b9df6bdf', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '2c89cb13-018d-43d1-87bb-864e390120b8'),
('e898c959-7086-419b-b215-bb5238e5f2f8', '2025-09-05', 27.7, 4.5, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/CF615A7B-F200-4FC6-A1B7-B38DA884A38E.jpg?alt=media&token=a9ee0d0e-4d69-4652-a955-35a6a911906c', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '25c2d3a6-0d1e-4687-90eb-37bdf8005617'),
('f6a42db8-e280-4130-807c-9f4577ff376d', '2025-09-05', 8, 2.83, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/BE09A6B2-27AB-481B-8194-30BE7626A86A.jpg?alt=media&token=75b3367d-4dcb-45a0-a149-71e57d796d3b', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', 'c03f1fa2-44c7-4944-b577-eb409a7ab000'),
('f7a2a553-93bf-40f7-926f-0c249b897518', '2025-09-05', 19.55, 4.41, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/7D66FDA3-9C98-4384-9525-A831993A68A4.jpg?alt=media&token=897033c4-c00e-4abf-8832-db6eaa594d29', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', '797feb44-9aec-4223-b85e-cf63c342510b'),
('fce90186-872e-46e0-8882-ec5ea61deff2', '2025-09-05', 14.5, 4.88, 'https://firebasestorage.googleapis.com/v0/b/toteco-426117.appspot.com/o/8349C05D-4C9D-41E1-8DE7-FDCDC80B0E71.jpg?alt=media&token=b3541341-5fdb-4a19-b4b6-37e57291595b', 'c5bbfc70-e2d1-4e0b-8a09-5209b5719863', 'aa3f7753-d70d-4aec-a298-70ed90274e40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `Users` (
  `id` varchar(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `surname` varchar(30) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `money_spent` float DEFAULT NULL,
  `publications_number` int(10) DEFAULT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `Users` (`id`, `username`, `name`, `surname`, `birth_date`, `email`, `password`, `creation_date`, `active`, `money_spent`, `publications_number`, `role`) VALUES
('34c177a1-69ab-4d54-83c1-3b1e962c95f2', 'martabags', 'Marta', 'Bagüés ', '1995-04-20', 'martabags@gmail.com', 'martabags', '2025-09-08', 1, 4, 1, "USER"),
('c5bbfc70-e2d1-4e0b-8a09-5209b5719863', 'cunba', 'Irene', 'Cunto', '1995-04-20', 'ire.cunba@gmail.com', 'cunba', '2025-09-08', 1, 1325.09, 34, "ADMIN");

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `establishments`
--
ALTER TABLE `Establishments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Publications`
--
ALTER TABLE `Publications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_establishment_id` (`establishment_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indices de la tabla `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_publication_id` (`publication_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Publications`
--
ALTER TABLE `Publications`
  ADD CONSTRAINT `fk_establishment_id` FOREIGN KEY (`establishment_id`) REFERENCES `Establishments` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Filtros para la tabla `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `fk_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `Publications` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;