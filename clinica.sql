-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/09/2025 às 18:46
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
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`id`, `id_paciente`, `id_medico`, `data_hora`, `observacoes`) VALUES
(1, 1, 3, '2025-09-19 14:00:00', 'Consulta de rotina'),
(2, 2, 1, '2025-09-20 09:00:00', 'Avaliação de sintomas gripais'),
(3, 3, 2, '2025-09-20 11:30:00', 'Retorno de exames'),
(4, 4, 4, '2025-09-21 10:00:00', 'Consulta pré-natal'),
(5, 5, 1, '2025-09-21 15:00:00', 'Dor nas costas'),
(6, 6, 3, '2025-09-22 08:00:00', 'Revisão de medicação'),
(7, 7, 2, '2025-09-22 13:30:00', 'Consulta de rotina'),
(8, 8, 4, '2025-09-23 14:00:00', 'Exame de rotina'),
(9, 9, 1, '2025-09-23 16:30:00', 'Encaminhamento para especialista'),
(10, 10, 2, '2025-09-24 10:00:00', 'Acompanhamento de tratamento');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `crm` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`id`, `nome`, `especialidade`, `telefone`, `crm`) VALUES
(1, 'Dr Carlinhos Maia', 'Cardiologista', '5436-6612', 'CRM69210'),
(2, 'Dra. Marileine Bash', 'Pediatra', '5234-6436', 'CRM12134'),
(3, 'Dr. Josevaldo Costa', 'Dermatologista', '2374-6546', 'CRM18344'),
(4, 'Dr. James Fruta', 'Ginecologista', '5464-8329', 'CRM10694'),
(5, 'Dr. Jonathan Primeiro', 'Residente', '5523-4732', 'CRM59483'),
(6, 'Dr. Jonathan Segundo', 'Residente', '2374-5546', 'CRM63723'),
(7, 'Dr. Hover Carimbo', 'Fisioterapeuta', '2468-6543', 'CRM24029'),
(8, 'Dra. Rosaline Rosa', 'Oftalmologista', '5768-4352', 'CRM74356'),
(9, 'Dr. Marciano Beto', 'Cirurgião', '8654-5634', 'CRM11445'),
(10, 'Dr. José Alentar', 'Recepicionista', '4566-8345', 'CRM26363');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`id`, `nome`, `data_nascimento`, `telefone`, `endereco`, `cep`, `email`) VALUES
(1, 'João Silva', '1990-05-12', '4853-8543', 'Rua ', '43423-144', 'Josilva@gmail.com'),
(2, 'Ana Beatriz Silva', '0000-00-00', '(11) 98877-1234', 'Rua das Flores, 120 - São Paulo', '01001-000', 'ana.silva@gmail.com'),
(3, 'João Pedro Santos', '0000-00-00', '(21) 99765-4321', 'Av. Atlântica, 550 - Rio de Janeiro', '22010-000', 'joao.santos@yahoo.com'),
(4, 'Maria Clara Souza', '0000-00-00', '(31) 98456-9876', 'Rua Minas Gerais 80 - Belo Horizonte', '30130-000', 'maria.clara@outlook.com'),
(5, 'Lucas Henrique Lima', '0000-00-00', '(41) 99654-2211', 'Rua XV de Novembro 300 - Curitiba', '80020-310', 'lucas.hlima@gmail.com'),
(6, 'Juliana Mendes', '0000-00-00', '(51) 99123-4455', 'Rua da Praia 45 - Porto Alegre', '90010-150', 'juliana.mendes@hotmail.com'),
(7, 'Rafael Torres', '0000-00-00', '(85) 99911-7766', 'Av. Beira Mar 2500 - Fortaleza', '60165-121', 'rafael.torres@gmail.com'),
(8, 'Camila Barbosa', '0000-00-00', '(71) 98234-5566', 'Rua do Farol, 15 - Salvador', '40015-250', 'camila.barbosa@icloud.com'),
(9, 'Pedro Almeida', '0000-00-00', '(62) 99543-8899', 'Av. Goiás, 780 - Goiânia', '74000-010', 'pedro.almeida@gmail.com'),
(10, 'Fernanda Rocha', '0000-00-00', '(13) 99788-2233', 'Rua da Praia Grande, 99 - Santos', '11013-150', 'fernanda.rocha@uol.com.br'),
(11, 'Thiago Oliveira', '0000-00-00', '(19) 99456-7788', 'Rua das Palmeiras, 40 - Campinas', '13010-080', 'thiago.oliveira@gmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
