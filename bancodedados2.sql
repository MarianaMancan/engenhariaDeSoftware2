-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.10.2-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bd_cabelow
CREATE DATABASE IF NOT EXISTS `bd_cabelow` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bd_cabelow`;

-- Copiando estrutura para tabela bd_cabelow.tbl_agendamento
CREATE TABLE IF NOT EXISTS `tbl_agendamento` (
  `id_agendamento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_cliente` int(10) unsigned NOT NULL,
  `fk_funcionario` int(10) unsigned NOT NULL,
  `data` date NOT NULL,
  `hora` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_agendamento`),
  KEY `fk_pessoa_agendamento` (`fk_cliente`),
  KEY `fk_funcionario_agendamento` (`fk_funcionario`),
  CONSTRAINT `fk_funcionario_agendamento` FOREIGN KEY (`fk_funcionario`) REFERENCES `tbl_funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_agendamento` FOREIGN KEY (`fk_cliente`) REFERENCES `tbl_pessoas` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_cabelow.tbl_contas_a_pagar
CREATE TABLE IF NOT EXISTS `tbl_contas_a_pagar` (
  `id_conta_a_pagar` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_vencimento` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `valor` float NOT NULL,
  `comprovante` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_conta_a_pagar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_cabelow.tbl_contas_a_receber
CREATE TABLE IF NOT EXISTS `tbl_contas_a_receber` (
  `id_contas_a_receber` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk_cliente` int(11) unsigned NOT NULL,
  `data_prevista` date DEFAULT NULL,
  `data_recebimento` date NOT NULL,
  `valor` float NOT NULL DEFAULT 0,
  `fk_tipo_pagamento` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_contas_a_receber`),
  KEY `fk_contas_receber_cliente` (`fk_cliente`),
  KEY `fk_contas_receber_tipo_pagamento` (`fk_tipo_pagamento`),
  CONSTRAINT `fk_contas_receber_cliente` FOREIGN KEY (`fk_cliente`) REFERENCES `tbl_pessoas` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contas_receber_tipo_pagamento` FOREIGN KEY (`fk_tipo_pagamento`) REFERENCES `tbl_tipo_pagamento` (`id_tipo_pagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_cabelow.tbl_fornecedores
CREATE TABLE IF NOT EXISTS `tbl_fornecedores` (
  `id_fornecedor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(14) NOT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(11) NOT NULL,
  `nome_representante` varchar(100) NOT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_cabelow.tbl_funcionarios
CREATE TABLE IF NOT EXISTS `tbl_funcionarios` (
  `id_funcionario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_pessoa` int(10) unsigned NOT NULL DEFAULT 0,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `cargo` tinyint(4) NOT NULL DEFAULT 1,
  `contratacao` date NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `FK_pessoa_funcionario` (`fk_pessoa`),
  CONSTRAINT `FK_pessoa_funcionario` FOREIGN KEY (`fk_pessoa`) REFERENCES `tbl_pessoas` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_cabelow.tbl_pessoas
CREATE TABLE IF NOT EXISTS `tbl_pessoas` (
  `id_pessoa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `cpf_cnpj` varchar(14) DEFAULT NULL,
  `nascimento` date NOT NULL DEFAULT '0000-00-00',
  `observacoes` varchar(500) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabela para guarda informações sobre pessoas';

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_cabelow.tbl_produtos
CREATE TABLE IF NOT EXISTS `tbl_produtos` (
  `id_produtos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_fornecedor` int(10) unsigned NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `ultimo_custo` float DEFAULT 0,
  `estoque_min` int(11) NOT NULL,
  PRIMARY KEY (`id_produtos`),
  KEY `fk_produto_fornecedor` (`fk_fornecedor`),
  CONSTRAINT `fk_produto_fornecedor` FOREIGN KEY (`fk_fornecedor`) REFERENCES `tbl_fornecedores` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_cabelow.tbl_serviço
CREATE TABLE IF NOT EXISTS `tbl_serviço` (
  `id_serviço` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `duração` int(11) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`id_serviço`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_cabelow.tbl_serviço_agendado
CREATE TABLE IF NOT EXISTS `tbl_serviço_agendado` (
  `id_serviço_agendado` int(10) unsigned NOT NULL,
  `fk_serviço` int(10) unsigned NOT NULL,
  `fk_agendamento` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_serviço_agendado`),
  KEY `fk_sevico_agendados_agendamento` (`fk_agendamento`),
  KEY `fk_serviços_agendados_servico` (`fk_serviço`),
  CONSTRAINT `fk_serviços_agendados_servico` FOREIGN KEY (`fk_serviço`) REFERENCES `tbl_serviço` (`id_serviço`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sevico_agendados_agendamento` FOREIGN KEY (`fk_agendamento`) REFERENCES `tbl_agendamento` (`id_agendamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_cabelow.tbl_tipo_pagamento
CREATE TABLE IF NOT EXISTS `tbl_tipo_pagamento` (
  `id_tipo_pagamento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
