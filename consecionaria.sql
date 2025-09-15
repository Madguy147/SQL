-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/09/2025 às 20:48
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `consecionaria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carro`
--

CREATE TABLE `carro` (
  `id_carro` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `placa` char(7) NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `status_disponibilidade` enum('Disponível','Reservado','Manutenção') DEFAULT 'Disponível'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carro`
--

INSERT INTO `carro` (`id_carro`, `modelo`, `placa`, `ano`, `status_disponibilidade`) VALUES
(1, 'Onix', 'AAA1A11', 2020, 'Disponível'),
(2, 'HB20', 'BBB2B22', 2021, 'Disponível'),
(3, 'Corolla', 'CCC3C33', 2022, 'Disponível'),
(4, 'Civic', 'DDD4D44', 2019, 'Disponível'),
(5, 'Gol', 'EEE5E55', 2018, 'Disponível'),
(6, 'Palio', 'FFF6F66', 2017, 'Disponível'),
(7, 'Sandero', 'GGG7G77', 2020, 'Disponível'),
(8, 'Kwid', 'HHH8H88', 2022, 'Disponível'),
(9, 'Tracker', 'III9I99', 2021, 'Disponível'),
(10, 'Compass', 'JJJ0J00', 2023, 'Disponível');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` char(11) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `cpf`, `telefone`, `email`) VALUES
(1, 'Maria Silva', '12345678901', '11999990001', 'maria@email.com'),
(2, 'João Souza', '12345678902', '11999990002', 'joao@email.com'),
(3, 'Ana Costa', '12345678903', '11999990003', 'ana@email.com'),
(4, 'Carlos Pereira', '12345678904', '11999990004', 'carlos@email.com'),
(5, 'Fernanda Lima', '12345678905', '11999990005', 'fernanda@email.com'),
(6, 'Rafael Santos', '12345678906', '11999990006', 'rafael@email.com'),
(7, 'Juliana Rocha', '12345678907', '11999990007', 'juliana@email.com'),
(8, 'Diego Alves', '12345678908', '11999990008', 'diego@email.com'),
(9, 'Beatriz Mendes', '12345678909', '11999990009', 'bia@email.com'),
(10, 'Lucas Oliveira', '12345678910', '11999990010', 'lucas@email.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_carro` int(11) NOT NULL,
  `data_reserva` date NOT NULL,
  `data_devolucao` date NOT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `id_cliente`, `id_carro`, `data_reserva`, `data_devolucao`, `valor_total`) VALUES
(1, 1, 1, '2025-09-01', '2025-09-05', 500.00),
(2, 2, 2, '2025-09-02', '2025-09-07', 700.00),
(3, 3, 3, '2025-09-03', '2025-09-06', 900.00),
(4, 4, 4, '2025-09-05', '2025-09-10', 800.00),
(5, 5, 5, '2025-09-07', '2025-09-12', 400.00),
(6, 6, 6, '2025-09-08', '2025-09-11', 350.00),
(7, 7, 7, '2025-09-10', '2025-09-15', 750.00),
(8, 8, 8, '2025-09-11', '2025-09-14', 600.00),
(9, 9, 9, '2025-09-12', '2025-09-16', 950.00),
(10, 10, 10, '2025-09-13', '2025-09-18', 1200.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`id_carro`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_carro` (`id_carro`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carro`
--
ALTER TABLE `carro`
  MODIFY `id_carro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_carro`) REFERENCES `carro` (`id_carro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
