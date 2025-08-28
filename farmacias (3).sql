-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/08/2025 às 17:21
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `farmacias`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `id` int(11) NOT NULL,
  `farmacia_id` int(11) NOT NULL,
  `nome_usuario` varchar(100) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `data` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`id`, `farmacia_id`, `nome_usuario`, `nota`, `comentario`, `data`) VALUES
(1, 1, 'João Silva', 5, 'Ótimo atendimento, sempre encontro o que preciso.', '2025-08-28 12:00:00'),
(2, 2, 'Maria Oliveira', 4, 'Preços competitivos, mas o estacionamento é pequeno.', '2025-08-27 15:30:00'),
(3, 3, 'Pedro Santos', 5, 'Atendimento rápido e eficiente. Horário estendido ajuda muito.', '2025-08-26 18:45:00'),
(4, 4, 'Ana Costa', 4, 'Boa variedade de produtos, mas o local pode ser um pouco movimentado.', '2025-08-25 10:15:00'),
(5, 5, 'Lucas Pereira', 3, 'O atendimento é bom, mas a fila costuma ser grande.', '2025-08-24 14:00:00'),
(6, 6, 'Fernanda Lima', 5, 'Entrega super rápida! Recomendo!', '2025-08-23 09:50:00'),
(7, 7, 'Guilherme Souza', 4, 'Farmácia de bairro, com atendimento pessoal e atencioso.', '2025-08-22 17:20:00'),
(8, 8, 'Juliana Almeida', 5, 'Excelente serviço, sempre me ajudam a encontrar o medicamento certo.', '2025-08-21 11:05:00'),
(9, 9, 'Felipe Martins', 4, 'Horário de funcionamento excelente para quem trabalha até tarde.', '2025-08-20 16:30:00'),
(10, 10, 'Patrícia Gomes', 5, 'Ambiente limpo, organizado e com ótimo atendimento.', '2025-08-19 13:10:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id` int(11) NOT NULL,
  `farmacia_id` int(11) DEFAULT NULL,
  `logradouro` varchar(150) NOT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `enderecos`
--

INSERT INTO `enderecos` (`id`, `farmacia_id`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep`, `latitude`, `longitude`) VALUES
(1, 1, 'Rua Doutor Flores', '194', NULL, 'Centro Historico', 'Porto Alegre', 'RS', NULL, NULL, NULL),
(2, 2, 'Avenida Borges de Medeiros', '589', NULL, 'Centro Historico', 'Porto Alegre', 'RS', NULL, NULL, NULL),
(3, 3, 'Avenida da Azenha', '693', NULL, 'Azenha', 'Porto Alegre', 'RS', NULL, NULL, NULL),
(4, 4, 'Avenida do Forte', '1031', NULL, 'Vila Ipiranga', 'Porto Alegre', 'RS', '91360001', NULL, NULL),
(5, 5, 'Avenida Assis Brasil', '2127', NULL, 'Cristo Redentor', 'Porto Alegre', 'RS', NULL, NULL, NULL),
(6, 6, 'Rua Amélia Telles', '470', 'Loja 102', 'Petrópolis', 'Porto Alegre', 'RS', NULL, NULL, NULL),
(7, 7, 'Rua Vicente da Fontoura', '1448', NULL, 'Santana', 'Porto Alegre', 'RS', NULL, NULL, NULL),
(8, 8, 'Avenida Protásio Alves', '7525', NULL, 'Petrópolis', 'Porto Alegre', 'RS', NULL, NULL, NULL),
(9, 9, 'Avenida Azenha', '875', 'Sala 01', 'Azenha', 'Porto Alegre', 'RS', NULL, NULL, NULL),
(10, 10, 'Rua dos Andradas', '1665', NULL, 'Centro Histórico', 'Porto Alegre', 'RS', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `farmacias`
--

CREATE TABLE `farmacias` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `plantao` tinyint(1) DEFAULT 0,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `rede` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `farmacias`
--

INSERT INTO `farmacias` (`id`, `nome`, `cnpj`, `telefone`, `email`, `website`, `descricao`, `logo`, `plantao`, `data_cadastro`, `rede`) VALUES
(1, 'Panvel - Dr Flores', '92.784.808/0001-00', '51996925129', 'contato@panvel.com.br', 'https://www.panvel.com/', 'Panvel Farmácias é a escolha confiável para quem busca cuidar da saúde e do bem-estar.', NULL, 0, '2025-08-28 15:09:44', 'Panvel'),
(2, 'Panvel - Borges', '92.784.808/0002-00', '51995794726', 'contato@panvel.com.br', 'https://www.panvel.com/', 'Panvel Farmácias é a escolha confiável para quem busca cuidar da saúde e do bem-estar.', NULL, 0, '2025-08-28 15:09:44', 'Panvel'),
(3, 'Panvel - Azenha 693', '92.784.808/0003-00', '51995949390', 'contato@panvel.com.br', 'https://www.panvel.com/', 'Panvel Farmácias é a escolha confiável para quem busca cuidar da saúde e do bem-estar.', NULL, 0, '2025-08-28 15:09:44', 'Panvel'),
(4, 'Droga Raia - Av. do Forte', '61.585.865/0001-00', '995849323', 'contato@drogaraia.com.br', 'https://www.drogaraia.com.br/', 'Droga Raia, sempre cuidando de você.', NULL, 0, '2025-08-28 15:09:44', 'Droga Raia'),
(5, 'Droga Raia - Av. Assis Brasil', '61.585.865/0002-00', '51998779006', 'contato@drogaraia.com.br', 'https://www.drogaraia.com.br/', 'Droga Raia, sempre cuidando de você.', NULL, 0, '2025-08-28 15:09:44', 'Droga Raia'),
(6, 'Droga Raia - Rua Amélia Telles', '61.585.865/0003-00', '5132189000', 'contato@drogaraia.com.br', 'https://www.drogaraia.com.br/', 'Droga Raia, sempre cuidando de você.', NULL, 0, '2025-08-28 15:09:44', 'Droga Raia'),
(7, 'Farmácias Associadas - R. Vicente da Fontoura', '87.798.123/0001-00', '5133333333', 'contato@farmaciasassociadas.com.br', 'https://farmaciasassociadas.com.br/', 'A Farmácias Associadas é uma rede com diversas filiais.', NULL, 0, '2025-08-28 15:09:44', 'Farmácias Associadas'),
(8, 'Farmácias Associadas - Av. Protásio Alves', '87.798.123/0002-00', '5133334444', 'contato@farmaciasassociadas.com.br', 'https://farmaciasassociadas.com.br/', 'A Farmácias Associadas é uma rede com diversas filiais.', NULL, 0, '2025-08-28 15:09:44', 'Farmácias Associadas'),
(9, 'Farmácias São João - Av. Azenha', '87.712.910/0001-00', '5133335555', 'contato@saojoaofarmacias.com.br', 'https://www.saojoaofarmacias.com.br/', 'Farmácia São João, sempre ao seu lado.', NULL, 0, '2025-08-28 15:09:44', 'São João'),
(10, 'Farmácias São João - R. dos Andradas', '87.712.910/0002-00', '5133336666', 'contato@saojoaofarmacias.com.br', 'https://www.saojoaofarmacias.com.br/', 'Farmácia São João, sempre ao seu lado.', NULL, 0, '2025-08-28 15:09:44', 'São João');

-- --------------------------------------------------------

--
-- Estrutura para tabela `farmacia_servicos`
--

CREATE TABLE `farmacia_servicos` (
  `farmacia_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `farmacia_servicos`
--

INSERT INTO `farmacia_servicos` (`farmacia_id`, `servico_id`) VALUES
(1, 5),
(1, 6),
(1, 7),
(2, 5),
(2, 6),
(2, 7),
(3, 5),
(3, 6),
(4, 1),
(4, 2),
(4, 5),
(5, 1),
(5, 2),
(5, 5),
(6, 6),
(7, 5),
(7, 6),
(8, 5),
(8, 6),
(9, 1),
(9, 2),
(9, 6),
(10, 1),
(10, 2),
(10, 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `farmacia_id` int(11) DEFAULT NULL,
  `dia_semana` tinyint(4) NOT NULL,
  `hora_abertura` time DEFAULT NULL,
  `hora_fechamento` time DEFAULT NULL,
  `fechado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `horarios`
--

INSERT INTO `horarios` (`id`, `farmacia_id`, `dia_semana`, `hora_abertura`, `hora_fechamento`, `fechado`) VALUES
(1, 1, 1, '08:00:00', '21:00:00', 0),
(2, 1, 2, '08:00:00', '21:00:00', 0),
(3, 1, 3, '08:00:00', '21:00:00', 0),
(4, 1, 4, '08:00:00', '21:00:00', 0),
(5, 1, 5, '08:00:00', '21:00:00', 0),
(6, 1, 6, '08:00:00', '21:00:00', 0),
(7, 1, 7, '09:00:00', '19:00:00', 0),
(8, 2, 1, '08:00:00', '21:00:00', 0),
(9, 2, 2, '08:00:00', '21:00:00', 0),
(10, 2, 3, '08:00:00', '21:00:00', 0),
(11, 2, 4, '08:00:00', '21:00:00', 0),
(12, 2, 5, '08:00:00', '21:00:00', 0),
(13, 2, 6, '08:00:00', '21:00:00', 0),
(14, 2, 7, '09:00:00', '19:00:00', 0),
(15, 3, 1, '07:00:00', '21:00:00', 0),
(16, 3, 2, '07:00:00', '21:00:00', 0),
(17, 3, 3, '07:00:00', '21:00:00', 0),
(18, 3, 4, '07:00:00', '21:00:00', 0),
(19, 3, 5, '07:00:00', '21:00:00', 0),
(20, 3, 6, '07:00:00', '21:00:00', 0),
(21, 3, 7, '08:00:00', '20:00:00', 0),
(22, 1, 1, '08:00:00', '21:00:00', 0),
(23, 1, 2, '08:00:00', '21:00:00', 0),
(24, 1, 3, '08:00:00', '21:00:00', 0),
(25, 1, 4, '08:00:00', '21:00:00', 0),
(26, 1, 5, '08:00:00', '21:00:00', 0),
(27, 1, 6, '08:00:00', '21:00:00', 0),
(28, 1, 7, '09:00:00', '19:00:00', 0),
(29, 2, 1, '08:00:00', '21:00:00', 0),
(30, 2, 2, '08:00:00', '21:00:00', 0),
(31, 2, 3, '08:00:00', '21:00:00', 0),
(32, 2, 4, '08:00:00', '21:00:00', 0),
(33, 2, 5, '08:00:00', '21:00:00', 0),
(34, 2, 6, '08:00:00', '21:00:00', 0),
(35, 2, 7, '09:00:00', '19:00:00', 0),
(36, 3, 1, '07:00:00', '21:00:00', 0),
(37, 3, 2, '07:00:00', '21:00:00', 0),
(38, 3, 3, '07:00:00', '21:00:00', 0),
(39, 3, 4, '07:00:00', '21:00:00', 0),
(40, 3, 5, '07:00:00', '21:00:00', 0),
(41, 3, 6, '07:00:00', '21:00:00', 0),
(42, 3, 7, '08:00:00', '20:00:00', 0),
(43, 1, 1, '08:00:00', '21:00:00', 0),
(44, 1, 2, '08:00:00', '21:00:00', 0),
(45, 1, 3, '08:00:00', '21:00:00', 0),
(46, 1, 4, '08:00:00', '21:00:00', 0),
(47, 1, 5, '08:00:00', '21:00:00', 0),
(48, 1, 6, '08:00:00', '21:00:00', 0),
(49, 1, 7, '09:00:00', '19:00:00', 0),
(50, 2, 1, '08:00:00', '21:00:00', 0),
(51, 2, 2, '08:00:00', '21:00:00', 0),
(52, 2, 3, '08:00:00', '21:00:00', 0),
(53, 2, 4, '08:00:00', '21:00:00', 0),
(54, 2, 5, '08:00:00', '21:00:00', 0),
(55, 2, 6, '08:00:00', '21:00:00', 0),
(56, 2, 7, '09:00:00', '19:00:00', 0),
(57, 3, 1, '07:00:00', '21:00:00', 0),
(58, 3, 2, '07:00:00', '21:00:00', 0),
(59, 3, 3, '07:00:00', '21:00:00', 0),
(60, 3, 4, '07:00:00', '21:00:00', 0),
(61, 3, 5, '07:00:00', '21:00:00', 0),
(62, 3, 6, '07:00:00', '21:00:00', 0),
(63, 3, 7, '08:00:00', '20:00:00', 0),
(64, 1, 1, '08:00:00', '21:00:00', 0),
(65, 1, 2, '08:00:00', '21:00:00', 0),
(66, 1, 3, '08:00:00', '21:00:00', 0),
(67, 1, 4, '08:00:00', '21:00:00', 0),
(68, 1, 5, '08:00:00', '21:00:00', 0),
(69, 1, 6, '08:00:00', '21:00:00', 0),
(70, 1, 7, '09:00:00', '19:00:00', 0),
(71, 2, 1, '08:00:00', '21:00:00', 0),
(72, 2, 2, '08:00:00', '21:00:00', 0),
(73, 2, 3, '08:00:00', '21:00:00', 0),
(74, 2, 4, '08:00:00', '21:00:00', 0),
(75, 2, 5, '08:00:00', '21:00:00', 0),
(76, 2, 6, '08:00:00', '21:00:00', 0),
(77, 2, 7, '09:00:00', '19:00:00', 0),
(78, 3, 1, '07:00:00', '21:00:00', 0),
(79, 3, 2, '07:00:00', '21:00:00', 0),
(80, 3, 3, '07:00:00', '21:00:00', 0),
(81, 3, 4, '07:00:00', '21:00:00', 0),
(82, 3, 5, '07:00:00', '21:00:00', 0),
(83, 3, 6, '07:00:00', '21:00:00', 0),
(84, 3, 7, '08:00:00', '20:00:00', 0),
(85, 1, 1, '08:00:00', '21:00:00', 0),
(86, 1, 2, '08:00:00', '21:00:00', 0),
(87, 1, 3, '08:00:00', '21:00:00', 0),
(88, 1, 4, '08:00:00', '21:00:00', 0),
(89, 1, 5, '08:00:00', '21:00:00', 0),
(90, 1, 6, '08:00:00', '21:00:00', 0),
(91, 1, 7, '09:00:00', '19:00:00', 0),
(92, 2, 1, '08:00:00', '21:00:00', 0),
(93, 2, 2, '08:00:00', '21:00:00', 0),
(94, 2, 3, '08:00:00', '21:00:00', 0),
(95, 2, 4, '08:00:00', '21:00:00', 0),
(96, 2, 5, '08:00:00', '21:00:00', 0),
(97, 2, 6, '08:00:00', '21:00:00', 0),
(98, 2, 7, '09:00:00', '19:00:00', 0),
(99, 3, 1, '07:00:00', '21:00:00', 0),
(100, 3, 2, '07:00:00', '21:00:00', 0),
(101, 3, 3, '07:00:00', '21:00:00', 0),
(102, 3, 4, '07:00:00', '21:00:00', 0),
(103, 3, 5, '07:00:00', '21:00:00', 0),
(104, 3, 6, '07:00:00', '21:00:00', 0),
(105, 3, 7, '08:00:00', '20:00:00', 0),
(106, 1, 1, '08:00:00', '21:00:00', 0),
(107, 1, 2, '08:00:00', '21:00:00', 0),
(108, 1, 3, '08:00:00', '21:00:00', 0),
(109, 1, 4, '08:00:00', '21:00:00', 0),
(110, 1, 5, '08:00:00', '21:00:00', 0),
(111, 1, 6, '08:00:00', '21:00:00', 0),
(112, 1, 7, '09:00:00', '19:00:00', 0),
(113, 2, 1, '08:00:00', '21:00:00', 0),
(114, 2, 2, '08:00:00', '21:00:00', 0),
(115, 2, 3, '08:00:00', '21:00:00', 0),
(116, 2, 4, '08:00:00', '21:00:00', 0),
(117, 2, 5, '08:00:00', '21:00:00', 0),
(118, 2, 6, '08:00:00', '21:00:00', 0),
(119, 2, 7, '09:00:00', '19:00:00', 0),
(120, 3, 1, '07:00:00', '21:00:00', 0),
(121, 3, 2, '07:00:00', '21:00:00', 0),
(122, 3, 3, '07:00:00', '21:00:00', 0),
(123, 3, 4, '07:00:00', '21:00:00', 0),
(124, 3, 5, '07:00:00', '21:00:00', 0),
(125, 3, 6, '07:00:00', '21:00:00', 0),
(126, 3, 7, '08:00:00', '20:00:00', 0),
(127, 4, 1, '08:00:00', '22:00:00', 0),
(128, 4, 2, '08:00:00', '22:00:00', 0),
(129, 4, 3, '08:00:00', '22:00:00', 0),
(130, 4, 4, '08:00:00', '22:00:00', 0),
(131, 4, 5, '08:00:00', '22:00:00', 0),
(132, 4, 6, '08:00:00', '22:00:00', 0),
(133, 4, 7, '09:00:00', '21:00:00', 0),
(134, 5, 1, '07:00:00', '21:00:00', 0),
(135, 5, 2, '07:00:00', '21:00:00', 0),
(136, 5, 3, '07:00:00', '21:00:00', 0),
(137, 5, 4, '07:00:00', '21:00:00', 0),
(138, 5, 5, '07:00:00', '21:00:00', 0),
(139, 5, 6, '07:00:00', '21:00:00', 0),
(140, 5, 7, '08:00:00', '20:00:00', 0),
(141, 6, 1, '08:00:00', '22:00:00', 0),
(142, 6, 2, '08:00:00', '22:00:00', 0),
(143, 6, 3, '08:00:00', '22:00:00', 0),
(144, 6, 4, '08:00:00', '22:00:00', 0),
(145, 6, 5, '08:00:00', '22:00:00', 0),
(146, 6, 6, '08:00:00', '22:00:00', 0),
(147, 6, 7, '09:00:00', '21:00:00', 0),
(148, 1, 1, '08:00:00', '21:00:00', 0),
(149, 1, 2, '08:00:00', '21:00:00', 0),
(150, 1, 3, '08:00:00', '21:00:00', 0),
(151, 1, 4, '08:00:00', '21:00:00', 0),
(152, 1, 5, '08:00:00', '21:00:00', 0),
(153, 1, 6, '08:00:00', '21:00:00', 0),
(154, 1, 7, '09:00:00', '19:00:00', 0),
(155, 2, 1, '08:00:00', '21:00:00', 0),
(156, 2, 2, '08:00:00', '21:00:00', 0),
(157, 2, 3, '08:00:00', '21:00:00', 0),
(158, 2, 4, '08:00:00', '21:00:00', 0),
(159, 2, 5, '08:00:00', '21:00:00', 0),
(160, 2, 6, '08:00:00', '21:00:00', 0),
(161, 2, 7, '09:00:00', '19:00:00', 0),
(162, 3, 1, '07:00:00', '21:00:00', 0),
(163, 3, 2, '07:00:00', '21:00:00', 0),
(164, 3, 3, '07:00:00', '21:00:00', 0),
(165, 3, 4, '07:00:00', '21:00:00', 0),
(166, 3, 5, '07:00:00', '21:00:00', 0),
(167, 3, 6, '07:00:00', '21:00:00', 0),
(168, 3, 7, '08:00:00', '20:00:00', 0),
(169, 4, 1, '08:00:00', '22:00:00', 0),
(170, 4, 2, '08:00:00', '22:00:00', 0),
(171, 4, 3, '08:00:00', '22:00:00', 0),
(172, 4, 4, '08:00:00', '22:00:00', 0),
(173, 4, 5, '08:00:00', '22:00:00', 0),
(174, 4, 6, '08:00:00', '22:00:00', 0),
(175, 4, 7, '09:00:00', '21:00:00', 0),
(176, 5, 1, '07:00:00', '21:00:00', 0),
(177, 5, 2, '07:00:00', '21:00:00', 0),
(178, 5, 3, '07:00:00', '21:00:00', 0),
(179, 5, 4, '07:00:00', '21:00:00', 0),
(180, 5, 5, '07:00:00', '21:00:00', 0),
(181, 5, 6, '07:00:00', '21:00:00', 0),
(182, 5, 7, '08:00:00', '20:00:00', 0),
(183, 6, 1, '08:00:00', '22:00:00', 0),
(184, 6, 2, '08:00:00', '22:00:00', 0),
(185, 6, 3, '08:00:00', '22:00:00', 0),
(186, 6, 4, '08:00:00', '22:00:00', 0),
(187, 6, 5, '08:00:00', '22:00:00', 0),
(188, 6, 6, '08:00:00', '22:00:00', 0),
(189, 6, 7, '09:00:00', '21:00:00', 0),
(190, 1, 1, '08:00:00', '21:00:00', 0),
(191, 1, 2, '08:00:00', '21:00:00', 0),
(192, 1, 3, '08:00:00', '21:00:00', 0),
(193, 1, 4, '08:00:00', '21:00:00', 0),
(194, 1, 5, '08:00:00', '21:00:00', 0),
(195, 1, 6, '08:00:00', '21:00:00', 0),
(196, 1, 7, '09:00:00', '19:00:00', 0),
(197, 2, 1, '08:00:00', '21:00:00', 0),
(198, 2, 2, '08:00:00', '21:00:00', 0),
(199, 2, 3, '08:00:00', '21:00:00', 0),
(200, 2, 4, '08:00:00', '21:00:00', 0),
(201, 2, 5, '08:00:00', '21:00:00', 0),
(202, 2, 6, '08:00:00', '21:00:00', 0),
(203, 2, 7, '09:00:00', '19:00:00', 0),
(204, 3, 1, '07:00:00', '21:00:00', 0),
(205, 3, 2, '07:00:00', '21:00:00', 0),
(206, 3, 3, '07:00:00', '21:00:00', 0),
(207, 3, 4, '07:00:00', '21:00:00', 0),
(208, 3, 5, '07:00:00', '21:00:00', 0),
(209, 3, 6, '07:00:00', '21:00:00', 0),
(210, 3, 7, '08:00:00', '20:00:00', 0),
(211, 4, 1, '08:00:00', '22:00:00', 0),
(212, 4, 2, '08:00:00', '22:00:00', 0),
(213, 4, 3, '08:00:00', '22:00:00', 0),
(214, 4, 4, '08:00:00', '22:00:00', 0),
(215, 4, 5, '08:00:00', '22:00:00', 0),
(216, 4, 6, '08:00:00', '22:00:00', 0),
(217, 4, 7, '09:00:00', '21:00:00', 0),
(218, 5, 1, '07:00:00', '21:00:00', 0),
(219, 5, 2, '07:00:00', '21:00:00', 0),
(220, 5, 3, '07:00:00', '21:00:00', 0),
(221, 5, 4, '07:00:00', '21:00:00', 0),
(222, 5, 5, '07:00:00', '21:00:00', 0),
(223, 5, 6, '07:00:00', '21:00:00', 0),
(224, 5, 7, '08:00:00', '20:00:00', 0),
(225, 6, 1, '08:00:00', '22:00:00', 0),
(226, 6, 2, '08:00:00', '22:00:00', 0),
(227, 6, 3, '08:00:00', '22:00:00', 0),
(228, 6, 4, '08:00:00', '22:00:00', 0),
(229, 6, 5, '08:00:00', '22:00:00', 0),
(230, 6, 6, '08:00:00', '22:00:00', 0),
(231, 6, 7, '09:00:00', '21:00:00', 0),
(232, 1, 1, '08:00:00', '21:00:00', 0),
(233, 1, 2, '08:00:00', '21:00:00', 0),
(234, 1, 3, '08:00:00', '21:00:00', 0),
(235, 1, 4, '08:00:00', '21:00:00', 0),
(236, 1, 5, '08:00:00', '21:00:00', 0),
(237, 1, 6, '08:00:00', '21:00:00', 0),
(238, 1, 7, '09:00:00', '19:00:00', 0),
(239, 2, 1, '08:00:00', '21:00:00', 0),
(240, 2, 2, '08:00:00', '21:00:00', 0),
(241, 2, 3, '08:00:00', '21:00:00', 0),
(242, 2, 4, '08:00:00', '21:00:00', 0),
(243, 2, 5, '08:00:00', '21:00:00', 0),
(244, 2, 6, '08:00:00', '21:00:00', 0),
(245, 2, 7, '09:00:00', '19:00:00', 0),
(246, 3, 1, '07:00:00', '21:00:00', 0),
(247, 3, 2, '07:00:00', '21:00:00', 0),
(248, 3, 3, '07:00:00', '21:00:00', 0),
(249, 3, 4, '07:00:00', '21:00:00', 0),
(250, 3, 5, '07:00:00', '21:00:00', 0),
(251, 3, 6, '07:00:00', '21:00:00', 0),
(252, 3, 7, '08:00:00', '20:00:00', 0),
(253, 4, 1, '08:00:00', '22:00:00', 0),
(254, 4, 2, '08:00:00', '22:00:00', 0),
(255, 4, 3, '08:00:00', '22:00:00', 0),
(256, 4, 4, '08:00:00', '22:00:00', 0),
(257, 4, 5, '08:00:00', '22:00:00', 0),
(258, 4, 6, '08:00:00', '22:00:00', 0),
(259, 4, 7, '09:00:00', '21:00:00', 0),
(260, 5, 1, '07:00:00', '21:00:00', 0),
(261, 5, 2, '07:00:00', '21:00:00', 0),
(262, 5, 3, '07:00:00', '21:00:00', 0),
(263, 5, 4, '07:00:00', '21:00:00', 0),
(264, 5, 5, '07:00:00', '21:00:00', 0),
(265, 5, 6, '07:00:00', '21:00:00', 0),
(266, 5, 7, '08:00:00', '20:00:00', 0),
(267, 6, 1, '08:00:00', '22:00:00', 0),
(268, 6, 2, '08:00:00', '22:00:00', 0),
(269, 6, 3, '08:00:00', '22:00:00', 0),
(270, 6, 4, '08:00:00', '22:00:00', 0),
(271, 6, 5, '08:00:00', '22:00:00', 0),
(272, 6, 6, '08:00:00', '22:00:00', 0),
(273, 6, 7, '09:00:00', '21:00:00', 0),
(274, 1, 1, '08:00:00', '21:00:00', 0),
(275, 1, 2, '08:00:00', '21:00:00', 0),
(276, 1, 3, '08:00:00', '21:00:00', 0),
(277, 1, 4, '08:00:00', '21:00:00', 0),
(278, 1, 5, '08:00:00', '21:00:00', 0),
(279, 1, 6, '08:00:00', '21:00:00', 0),
(280, 1, 7, '09:00:00', '19:00:00', 0),
(281, 2, 1, '08:00:00', '21:00:00', 0),
(282, 2, 2, '08:00:00', '21:00:00', 0),
(283, 2, 3, '08:00:00', '21:00:00', 0),
(284, 2, 4, '08:00:00', '21:00:00', 0),
(285, 2, 5, '08:00:00', '21:00:00', 0),
(286, 2, 6, '08:00:00', '21:00:00', 0),
(287, 2, 7, '09:00:00', '19:00:00', 0),
(288, 3, 1, '07:00:00', '21:00:00', 0),
(289, 3, 2, '07:00:00', '21:00:00', 0),
(290, 3, 3, '07:00:00', '21:00:00', 0),
(291, 3, 4, '07:00:00', '21:00:00', 0),
(292, 3, 5, '07:00:00', '21:00:00', 0),
(293, 3, 6, '07:00:00', '21:00:00', 0),
(294, 3, 7, '08:00:00', '20:00:00', 0),
(295, 4, 1, '08:00:00', '22:00:00', 0),
(296, 4, 2, '08:00:00', '22:00:00', 0),
(297, 4, 3, '08:00:00', '22:00:00', 0),
(298, 4, 4, '08:00:00', '22:00:00', 0),
(299, 4, 5, '08:00:00', '22:00:00', 0),
(300, 4, 6, '08:00:00', '22:00:00', 0),
(301, 4, 7, '09:00:00', '21:00:00', 0),
(302, 5, 1, '07:00:00', '21:00:00', 0),
(303, 5, 2, '07:00:00', '21:00:00', 0),
(304, 5, 3, '07:00:00', '21:00:00', 0),
(305, 5, 4, '07:00:00', '21:00:00', 0),
(306, 5, 5, '07:00:00', '21:00:00', 0),
(307, 5, 6, '07:00:00', '21:00:00', 0),
(308, 5, 7, '08:00:00', '20:00:00', 0),
(309, 6, 1, '08:00:00', '22:00:00', 0),
(310, 6, 2, '08:00:00', '22:00:00', 0),
(311, 6, 3, '08:00:00', '22:00:00', 0),
(312, 6, 4, '08:00:00', '22:00:00', 0),
(313, 6, 5, '08:00:00', '22:00:00', 0),
(314, 6, 6, '08:00:00', '22:00:00', 0),
(315, 6, 7, '09:00:00', '21:00:00', 0),
(316, 9, 1, '08:00:00', '22:00:00', 0),
(317, 9, 2, '08:00:00', '22:00:00', 0),
(318, 9, 3, '08:00:00', '22:00:00', 0),
(319, 9, 4, '08:00:00', '22:00:00', 0),
(320, 9, 5, '08:00:00', '22:00:00', 0),
(321, 9, 6, '08:00:00', '22:00:00', 0),
(322, 9, 7, '08:00:00', '21:00:00', 0),
(323, 10, 1, '08:00:00', '22:00:00', 0),
(324, 10, 2, '08:00:00', '22:00:00', 0),
(325, 10, 3, '08:00:00', '22:00:00', 0),
(326, 10, 4, '08:00:00', '22:00:00', 0),
(327, 10, 5, '08:00:00', '22:00:00', 0),
(328, 10, 6, '08:00:00', '22:00:00', 0),
(329, 10, 7, '08:00:00', '21:00:00', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`) VALUES
(1, 'Aferição de pressão'),
(2, 'Aferição de glicose'),
(3, 'Testes rápidos'),
(4, 'Vacinação'),
(5, 'Atendimento farmacêutico'),
(6, 'Entrega a domicílio'),
(7, 'Estacionamento');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farmacia_id` (`farmacia_id`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farmacia_id` (`farmacia_id`);

--
-- Índices de tabela `farmacias`
--
ALTER TABLE `farmacias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `farmacia_servicos`
--
ALTER TABLE `farmacia_servicos`
  ADD PRIMARY KEY (`farmacia_id`,`servico_id`),
  ADD KEY `servico_id` (`servico_id`);

--
-- Índices de tabela `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farmacia_id` (`farmacia_id`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `farmacias`
--
ALTER TABLE `farmacias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`farmacia_id`) REFERENCES `farmacias` (`id`);

--
-- Restrições para tabelas `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`farmacia_id`) REFERENCES `farmacias` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `farmacia_servicos`
--
ALTER TABLE `farmacia_servicos`
  ADD CONSTRAINT `farmacia_servicos_ibfk_1` FOREIGN KEY (`farmacia_id`) REFERENCES `farmacias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `farmacia_servicos_ibfk_2` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`farmacia_id`) REFERENCES `farmacias` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
