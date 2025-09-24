-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/09/2025 às 17:06
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
-- Banco de dados: `techsolutions`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `nome_departamento` varchar(100) DEFAULT NULL,
  `desricao` varchar(200) DEFAULT NULL,
  `localizacao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nome_departamento`, `desricao`, `localizacao`) VALUES
(1, 'Techsolutions', 'Foco em tecnologia, IA, e suporte', 'SP'),
(2, 'Techsolutions', 'Foco em tecnologia, IA, e suporte', 'SP'),
(3, 'Techsolutions', 'Foco em tecnologia, IA, e suporte', 'SP'),
(4, 'Techsolutions', 'Foco em tecnologia, IA, e suporte', 'SP'),
(5, 'Techsolutions', 'Foco em tecnologia, IA, e suporte', 'SP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `id_treinamento` int(11) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `CPF` varchar(10) DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `desricao` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `id_treinamento`, `id_departamento`, `nome`, `CPF`, `data_admissao`, `cargo`, `desricao`) VALUES
(1, NULL, NULL, 'Marcos', '832687423', '0000-00-00', 'Programador', 'Marcos pode participar do treinamento A para proramadores no Bloco A'),
(2, NULL, NULL, 'Julia', '724519829', '0000-00-00', 'Tecnica', 'Julia pode participar do treinamento B para tecnicos no Bloco B'),
(3, NULL, NULL, 'Ana', '628472091', '2014-05-31', 'Vendedora', 'Ana pode participar do treinamento C para vendedores no Bloco C'),
(4, NULL, NULL, 'Paulo', '237193450', '0000-00-00', 'Tecnico', 'Paulo pode participar do treinamento B para vendedores no Bloco B'),
(5, NULL, NULL, 'Julius', '921927636', '2018-03-31', 'Programador', 'Julius pode participar do treinamento A para programadores no Bloco A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `treinamento`
--

CREATE TABLE `treinamento` (
  `id_treinamento` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `data_treinamento` varchar(100) DEFAULT NULL,
  `carga_horaria` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `treinamento`
--

INSERT INTO `treinamento` (`id_treinamento`, `titulo`, `data_treinamento`, `carga_horaria`) VALUES
(1, 'A', '2014-04-31', '8h'),
(2, 'B', '2014-04-31', '8h'),
(3, 'C', '2014-05-31', '8h'),
(4, 'B', '2016-06-31', '8h'),
(5, 'A', '2018-03-31', '8h');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `id_treinamento` (`id_treinamento`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Índices de tabela `treinamento`
--
ALTER TABLE `treinamento`
  ADD PRIMARY KEY (`id_treinamento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `treinamento`
--
ALTER TABLE `treinamento`
  MODIFY `id_treinamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_treinamento`) REFERENCES `treinamento` (`id_treinamento`),
  ADD CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
