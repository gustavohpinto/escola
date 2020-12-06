-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06-Dez-2020 às 19:26
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escola`
--
CREATE DATABASE IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escola`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `codCargo` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`codCargo`, `cargo`) VALUES
(1, 'Professor'),
(2, 'Diretor'),
(3, 'Coordenador Pedagógico'),
(4, 'Diretor do Departamento de T.I'),
(5, 'Coordenador de Informática'),
(6, 'Coordenador de ADM'),
(7, 'Coordenador do Ensino Médio');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargofunc`
--

CREATE TABLE `cargofunc` (
  `codFunc` int(11) NOT NULL,
  `codCargo` int(11) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataSaida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargofunc`
--

INSERT INTO `cargofunc` (`codFunc`, `codCargo`, `dataEntrada`, `dataSaida`) VALUES
(3, 1, '2015-05-07', NULL),
(3, 5, '2017-06-20', NULL),
(2, 2, '2006-12-08', '2009-07-12'),
(1, 4, '2006-12-08', NULL),
(4, 1, '2002-09-23', NULL),
(4, 7, '2007-06-20', '2015-10-15'),
(4, 3, '2015-10-20', NULL),
(4, 6, '2018-06-01', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codFunc` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataSaida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`codFunc`, `nome`, `dataEntrada`, `dataSaida`) VALUES
(1, 'Paulo', '2006-12-08', NULL),
(2, 'Maria', '2006-12-08', '2009-07-12'),
(3, 'Juscelino', '2015-05-07', NULL),
(4, 'Vanessa', '2002-09-23', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`codCargo`);

--
-- Indexes for table `cargofunc`
--
ALTER TABLE `cargofunc`
  ADD KEY `codFunc` (`codFunc`),
  ADD KEY `codCargo` (`codCargo`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codFunc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `codCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codFunc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cargofunc`
--
ALTER TABLE `cargofunc`
  ADD CONSTRAINT `cargofunc_ibfk_1` FOREIGN KEY (`codFunc`) REFERENCES `funcionario` (`codFunc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cargofunc_ibfk_2` FOREIGN KEY (`codCargo`) REFERENCES `cargo` (`codCargo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
