-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/09/2025 às 15:21
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
-- Banco de dados: `ecomercy`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `CPF` int(11) NOT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `cidade` varchar(40) DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `cep` int(8) DEFAULT NULL,
  `DatadeCadastro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome`, `email`, `senha`, `CPF`, `endereco`, `cidade`, `estado`, `cep`, `DatadeCadastro`) VALUES
(1, 'João Silva', 'joao.silva@email.com', '123456', 2147483647, 'Rua das Flores, 123', 'São Paulo', 'SP', 1234567, '0000-00-00'),
(2, 'Maria Oliveira', 'maria.oliveira@email.com', 'password123', 2147483647, 'Av. Paulista, 456', 'São Paulo', 'SP', 1312000, '0000-00-00'),
(3, 'Carlos Souza', 'carlos.souza@email.com', 'senha2023', 2147483647, 'Rua dos Três, 789', 'Rio de Janeiro', 'RJ', 22050000, '0000-00-00'),
(4, 'Ana Costa', 'ana.costa@email.com', 'abc12345', 2147483647, 'Travessa das Pedras, 321', 'Belo Horizonte', 'MG', 30310000, '0000-00-00'),
(5, 'Felipe Martins', 'felipe.martins@email.com', 'qwerty123', 2147483647, 'Rua das Palmeiras, 101', 'Curitiba', 'PR', 80050000, '0000-00-00'),
(6, 'Fernanda Almeida', 'fernanda.almeida@email.com', '1234abcd', 2147483647, 'Rua do Sol, 202', 'Fortaleza', 'CE', 60010000, '0000-00-00'),
(7, 'Ricardo Pereira', 'ricardo.pereira@email.com', 'senha1234', 2147483647, 'Avenida Brasil, 303', 'Salvador', 'BA', 40010000, '0000-00-00'),
(8, 'Juliana Santos', 'juliana.santos@email.com', 'senha5678', 2147483647, 'Rua das Laranjeiras, 404', 'Porto Alegre', 'RS', 90020000, '0000-00-00'),
(9, 'Lucas Oliveira', 'lucas.oliveira@email.com', 'senha9876', 2147483647, 'Alameda dos Cedros, 505', 'Florianópolis', 'SC', 88040000, '0000-00-00'),
(10, 'Beatriz Lima', 'beatriz.lima@email.com', '12345xyz', 2147483647, 'Praça da Paz, 606', 'Recife', 'PE', 50050000, '0000-00-00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itenspedidos`
--

CREATE TABLE `itenspedidos` (
  `ID_ItemPedidoPK` int(11) NOT NULL,
  `id_pedidoFK` int(11) DEFAULT NULL,
  `id_produtosFK` int(11) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `PrecoUnitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itenspedidos`
--

INSERT INTO `itenspedidos` (`ID_ItemPedidoPK`, `id_pedidoFK`, `id_produtosFK`, `qtd`, `PrecoUnitario`) VALUES
(1, 1, 5, 5, 59.80),
(2, 2, 2, 2, 89.95),
(3, 3, 4, 3, 140.25),
(4, 4, 1, 1, 99.99),
(5, 5, 4, 4, 49.98),
(6, 6, 2, 2, 174.50),
(7, 7, 3, 3, 19.97),
(8, 8, 1, 1, 89.90),
(9, 9, 5, 5, 49.90),
(10, 10, 3, 2, 74.95);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_Pedido` int(11) NOT NULL,
  `ID_Clientes` int(11) DEFAULT NULL,
  `DataPedido` date DEFAULT NULL,
  `Stats` varchar(50) DEFAULT NULL,
  `ValorTotal` double DEFAULT NULL,
  `EnderecoEntrega` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`ID_Pedido`, `ID_Clientes`, `DataPedido`, `Stats`, `ValorTotal`, `EnderecoEntrega`) VALUES
(1, 1, '2025-09-08', 'Pendente', 149.9, 'Rua das Flores, 123 - São Paulo/SP'),
(2, NULL, '2025-09-09', 'Em Processamento', 249.5, 'Av. Central, 456 - Rio de Janeiro/RJ'),
(3, NULL, '2025-09-10', 'Pago', 89.9, 'Rua Azevedo, 78 - Belo Horizonte/MG'),
(4, NULL, '2025-09-11', 'Cancelado', 59.9, 'Av. Paulista, 1000 - São Paulo/SP'),
(5, NULL, '2025-09-12', 'Pago', 349, 'Rua da Praia, 45 - Salvador/BA'),
(6, NULL, '2025-09-13', 'Enviado', 199.9, 'Rua Verde, 32 - Curitiba/PR'),
(7, NULL, '2025-09-14', 'Entregue', 99.99, 'Av. Atlântica, 200 - Florianópolis/SC'),
(8, NULL, '2025-09-15', 'Pago', 420.75, 'Rua do Sol, 14 - Recife/PE'),
(9, NULL, '2025-09-16', 'Em Processamento', 179.9, 'Rua Azul, 55 - Porto Alegre/RS'),
(10, NULL, '2025-09-17', 'Entregue', 299, 'Av. Brasil, 999 - Brasília/DF');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `ID_Produtos` int(11) NOT NULL,
  `nome` varchar(70) DEFAULT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `DatadeCriacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`ID_Produtos`, `nome`, `descricao`, `preco`, `sku`, `estoque`, `DatadeCriacao`) VALUES
(1, 'Cadeira Escritório', 'Cadeira ergonômica, ajuste de altura.', 499.9, 'CAD-ESC-010', 15, '2025-09-08 00:00:00'),
(2, 'Teclado Mecânico', 'Teclado com switches azuis e iluminação.', 299.9, 'TEC-MEC-009', 30, '2025-09-09 00:00:00'),
(3, 'Mouse Gamer', 'Mouse RGB com 6 botões programáveis.', 129.9, 'MOU-GAM-008', 70, '2025-09-10 00:00:00'),
(4, 'Fone Bluetooth', 'Fone de ouvido sem fio com microfone.', 149.9, 'FON-BLU-007', 95, '2025-09-11 00:00:00'),
(5, 'Garrafa Térmica', 'Mantém líquidos quentes por até 12h.', 59.9, 'GAR-TER-006', 200, '2025-09-12 00:00:00'),
(6, 'Relógio Digital', 'Relógio à prova d’água com cronômetro.', 89.9, 'REL-DIG-005', 120, '2025-09-13 00:00:00'),
(7, 'Mochila Escolar', 'Mochila resistente com 3 compartimentos.', 119.9, 'MOC-ESC-004', 40, '2025-09-14 00:00:00'),
(8, 'Tênis Casual', 'Tênis confortável para uso diário.', 199.9, 'TEN-CAS-003', 65, '2025-09-15 00:00:00'),
(9, 'Calça Jeans Slim', 'Calça jeans azul escuro, modelagem slim.', 139.9, 'CAL-JEA-002', 80, '2025-09-16 00:00:00'),
(10, 'Camiseta Básica', 'Camiseta de algodão, cor branca, unissex.', 49.9, 'CAM-BAS-001', 150, '2025-09-17 00:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `itenspedidos`
--
ALTER TABLE `itenspedidos`
  ADD PRIMARY KEY (`ID_ItemPedidoPK`),
  ADD KEY `id_pedidoFK` (`id_pedidoFK`),
  ADD KEY `id_produtosFK` (`id_produtosFK`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `ID_Clientes` (`ID_Clientes`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`ID_Produtos`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `itenspedidos`
--
ALTER TABLE `itenspedidos`
  MODIFY `ID_ItemPedidoPK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `ID_Produtos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itenspedidos`
--
ALTER TABLE `itenspedidos`
  ADD CONSTRAINT `itenspedidos_ibfk_1` FOREIGN KEY (`id_pedidoFK`) REFERENCES `pedidos` (`ID_Pedido`),
  ADD CONSTRAINT `itenspedidos_ibfk_2` FOREIGN KEY (`id_produtosFK`) REFERENCES `produtos` (`ID_Produtos`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_Clientes`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
