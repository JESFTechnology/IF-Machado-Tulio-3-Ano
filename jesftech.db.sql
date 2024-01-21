-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.25-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para jesftech.db
DROP DATABASE IF EXISTS `jesftech.db`;
CREATE DATABASE IF NOT EXISTS `jesftech.db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jesftech.db`;

-- Copiando estrutura para tabela jesftech.db.cidade
DROP TABLE IF EXISTS `cidade`;
CREATE TABLE IF NOT EXISTS `cidade` (
  `codCidade` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) CHARACTER SET latin1 NOT NULL,
  `uf` varchar(2) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`codCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela jesftech.db.cidade: ~13 rows (aproximadamente)
INSERT INTO `cidade` (`codCidade`, `cid`, `uf`) VALUES
	(1, 'Pouso Alegre', 'MG'),
	(2, 'Ribeirão Preto', 'SP'),
	(3, 'Vitória', 'ES'),
	(4, 'Araraquara', 'SP'),
	(5, 'Carvalhopolis', 'MG'),
	(6, 'Arraial do Cabo', 'RJ'),
	(7, 'Zé Doca', 'MA'),
	(8, 'Machado', 'MG'),
	(9, 'Alfenas', 'MG'),
	(10, 'Paraguaçu', 'MG'),
	(11, 'Porto Alegre', 'RS'),
	(12, 'Silvianópolis', 'MG'),
	(15, 'Fama', 'MG');

-- Copiando estrutura para tabela jesftech.db.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `sobrenome` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `senha` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `cpf` varchar(11) CHARACTER SET latin1 NOT NULL,
  `pix` varchar(50) NOT NULL,
  `redesocial` varchar(50) DEFAULT NULL,
  `logradouro` varchar(300) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `codCidade` int(11) NOT NULL,
  PRIMARY KEY (`codCliente`),
  KEY `uf` (`codCidade`) USING BTREE,
  CONSTRAINT `FK_cliente_cidade` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela jesftech.db.cliente: ~3 rows (aproximadamente)
INSERT INTO `cliente` (`codCliente`, `nome`, `sobrenome`, `email`, `senha`, `cpf`, `pix`, `redesocial`, `logradouro`, `bairro`, `codCidade`) VALUES
	(1, 'Isabella', 'Fagundes', 'isabellamome@gmail.com', 'Isis14032006.', '93846523454', 'isabellamome@gmail.com', NULL, 'Rua Palmeiras 876', 'São Bento', 2),
	(4, 'Leopoldina', 'Sacconi', 'leopoldinasacconi@gmail.com', 'leopoldina1234', '82345683598', '82345683598', NULL, NULL, NULL, 9),
	(7, 'Johann', 'Sacconi', 'johannsacconi@gmail.com', 'johann', '13642344674', '13642344674', '@johann.e.sf', 'Rua Sabará 111', 'Residencial Oliveira', 9),
	(8, 'Tulio', 'Dias', 'tuliodias@gmail.com', 'tulio', '38465349234', 'tuliodias@gmail.com', '@tuliodias', NULL, NULL, 8);

-- Copiando estrutura para tabela jesftech.db.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `codFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET latin1 NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `senha` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cpf` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `cargo` varchar(50) CHARACTER SET latin1 NOT NULL,
  `nascimento` date DEFAULT NULL,
  `salario` double NOT NULL,
  `codCidade` int(11) DEFAULT NULL,
  `qrcode` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `bairro` varchar(50) CHARACTER SET latin1 NOT NULL,
  `endereco` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`codFuncionario`),
  KEY `FK_funcionario_cidade` (`codCidade`),
  CONSTRAINT `FK_funcionario_cidade` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela jesftech.db.funcionario: ~10 rows (aproximadamente)
INSERT INTO `funcionario` (`codFuncionario`, `nome`, `email`, `senha`, `cpf`, `cargo`, `nascimento`, `salario`, `codCidade`, `qrcode`, `bairro`, `endereco`) VALUES
	(1, 'Johann', 'johannsacconi@gmail.com', '*58D6C61551881B6A8E388EDB83A7D2F0E35F11B3', '13642344674', 'Fundador', '2006-03-14', 10000, 9, '{Johann001johann}', 'Residencial Oliveira', 'SabarÃ¡ 111'),
	(2, 'Luis', 'luisricardo@gmail.com', '*B883E0E9D11E9ED46113C5664741C32D6BD12010', '39258923854', 'Gerente', '2006-03-14', 5000, 8, '{Luis002luis}', 'Sla', 'Sla'),
	(3, 'Gustavo', 'gustavodias@gmail.com', '*05486BD506087BB3A68A2C3849C7BFA6CD21F6DA', '29835629563', 'Motorista', '2006-03-14', 3000, 10, '{Gustavo003gustavo}', 'Sla', 'Sla'),
	(4, 'Pedro', 'pedromatos@gmail.com', '*B60BAC7AFAC45E988FAF28CFF8767C3A7F3DE61D', '78345845780', 'Programador', '2003-09-10', 7000, 9, '{Pedro0014pedro}', 'Residencial Oliveira', 'Sla'),
	(5, 'Patrick', 'patrickboco@gmail.com', '*D474D52CD76836B3F51C037CF1C720738433E039', '34853874554', 'Gerente', '2004-10-19', 5000, 8, '{Patrick005patrick}', 'Sla', 'Sla'),
	(6, 'Rafael', 'rafaelcandido@gmail.com', '*8298F50766AF97B8686FFFDEF590B98EF2ADE9A0', '28375683756', 'Vendedor', '2004-10-19', 2000, 4, '{Rafael006rafael}', 'Sla', 'Sla'),
	(8, 'Bianca', 'biancacardoso@gmail.com', '*1222DC9FB42E2F8383DEBEE998702378A688BDED', '18436534958', 'Designer', '2004-10-19', 3000, 9, '{Bianca008bianca}', 'Residencial Oliveira', 'Sla'),
	(9, 'Juliana', 'julianacassia@gmail.com', '*0B67EB97BB085ACD07AFB55A24BF4DF331937271', '38763459384', 'Co-Fundadora', '2004-10-19', 10000, 9, '{Juliana009juliana}', 'Residencial Oliveira', 'Sla'),
	(10, 'Jhenifer', 'jheniferbruschi@gmail.com', '*2CB971F16A85CB86E41171265E0A40AC1A0D192E', '13982743435', 'Designer', '2004-10-19', 3000, 12, '{Jhenifer0010jhenifer}', 'Sla', 'Sla');

-- Copiando estrutura para tabela jesftech.db.itemvenda
DROP TABLE IF EXISTS `itemvenda`;
CREATE TABLE IF NOT EXISTS `itemvenda` (
  `codItemVenda` int(11) NOT NULL AUTO_INCREMENT,
  `codProduto` int(11) NOT NULL,
  `valor` decimal(10,0) NOT NULL DEFAULT 0,
  `quantVenda` int(11) NOT NULL DEFAULT 0,
  `codVenda` int(11) NOT NULL,
  PRIMARY KEY (`codItemVenda`),
  KEY `codProduto` (`codProduto`),
  KEY `codVenda` (`codVenda`),
  CONSTRAINT `FK_itemvenda_produtos` FOREIGN KEY (`codProduto`) REFERENCES `produtos` (`codProduto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_itemvenda_venda` FOREIGN KEY (`codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela jesftech.db.itemvenda: ~12 rows (aproximadamente)
INSERT INTO `itemvenda` (`codItemVenda`, `codProduto`, `valor`, `quantVenda`, `codVenda`) VALUES
	(31, 1, 25, 1, 32),
	(37, 1, 25, 1, 34),
	(38, 3, 10, 1, 34),
	(39, 1, 25, 1, 35),
	(40, 3, 10, 1, 35),
	(44, 42, 75, 5, 36),
	(45, 1, 25, 1, 36),
	(46, 33, 24, 1, 36),
	(51, 3, 10, 1, 38),
	(52, 5, 10, 1, 38),
	(61, 2, 10, 1, 49),
	(62, 3, 50, 5, 49),
	(64, 2, 10, 1, 50);

-- Copiando estrutura para tabela jesftech.db.log
DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `codLog` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tabela` varchar(50) CHARACTER SET latin1 NOT NULL,
  `observacao` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET latin1 NOT NULL,
  `hora` datetime NOT NULL,
  PRIMARY KEY (`codLog`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela jesftech.db.log: ~48 rows (aproximadamente)
INSERT INTO `log` (`codLog`, `acao`, `tabela`, `observacao`, `usuario`, `hora`) VALUES
	(23, 'Exclusão', 'marca', 'CabeceiraEletrica', 'root@localhost', '2022-10-31 10:26:06'),
	(24, 'Exclusão', 'marca', 'Erlenmeyer', 'root@localhost', '2022-10-31 10:26:17'),
	(25, 'Inserção', 'produtos', '', 'root@localhost', '2022-11-11 10:31:32'),
	(26, 'Atualização', 'marca', 'paraTeclado', 'root@localhost', '2022-11-11 10:34:36'),
	(27, 'Inserção', 'produtos', 'MemoriaROM', 'root@localhost', '2022-11-11 10:35:26'),
	(28, 'Inserção', 'produtos', 'NoBreack', 'root@localhost', '2022-11-11 10:36:16'),
	(29, 'Inserção', 'produtos', 'Notebook Nitro 5', 'root@localhost', '2022-11-11 10:47:35'),
	(30, 'Inserção', 'produtos', 'Datashow', 'root@localhost', '2022-11-11 10:48:47'),
	(31, 'Exclusão', 'marca', 'Notebook Nitro 5', 'root@localhost', '2022-11-11 10:53:04'),
	(32, 'Exclusão', 'marca', 'Datashow', 'root@localhost', '2022-11-11 10:53:04'),
	(33, 'Inserção', 'produtos', 'Arduino Yún', 'root@localhost', '2022-11-17 08:41:54'),
	(34, 'Inserção', 'produtos', 'Arduino Duemilanove or Diecimila', 'root@localhost', '2022-11-17 08:43:35'),
	(35, 'Inserção', 'produtos', 'Arduino Nano', 'root@localhost', '2022-11-17 08:44:40'),
	(36, 'Exclusão', 'marca', 'Teclado', 'root@localhost', '2022-11-17 08:45:17'),
	(37, 'Exclusão', 'marca', 'Mouse', 'root@localhost', '2022-11-17 08:45:17'),
	(38, 'Exclusão', 'marca', 'MemoriaRAM', 'root@localhost', '2022-11-17 08:45:17'),
	(39, 'Exclusão', 'marca', 'Monitor', 'root@localhost', '2022-11-17 08:45:17'),
	(40, 'Exclusão', 'marca', 'MemoriaROM', 'root@localhost', '2022-11-17 08:45:17'),
	(41, 'Exclusão', 'marca', 'NoBreack', 'root@localhost', '2022-11-17 08:45:17'),
	(42, 'Inserção', 'produtos', 'Arduino Mega or Mega 2560', 'root@localhost', '2022-11-17 08:45:20'),
	(43, 'Inserção', 'produtos', 'Arduino Mega ADK', 'root@localhost', '2022-11-17 08:46:06'),
	(44, 'Inserção', 'produtos', 'Arduino Leonardo ', 'root@localhost', '2022-11-17 08:46:50'),
	(45, 'Inserção', 'produtos', 'Arduino Micro', 'root@localhost', '2022-11-17 08:47:04'),
	(46, 'Inserção', 'produtos', 'Arduino Leonardo ETH', 'root@localhost', '2022-11-17 08:47:19'),
	(47, 'Inserção', 'produtos', 'Arduino Esplora', 'root@localhost', '2022-11-17 08:47:22'),
	(48, 'Inserção', 'produtos', 'Arduino Ethernet ', 'root@localhost', '2022-11-17 08:47:43'),
	(49, 'Inserção', 'produtos', 'Arduino Mini', 'root@localhost', '2022-11-17 08:47:44'),
	(50, 'Inserção', 'produtos', 'Arduino BT', 'root@localhost', '2022-11-17 08:48:04'),
	(51, 'Inserção', 'produtos', 'Arduino Fio', 'root@localhost', '2022-11-17 08:48:07'),
	(52, 'Inserção', 'produtos', 'LilyPad Arduino ', 'root@localhost', '2022-11-17 08:48:33'),
	(53, 'Inserção', 'produtos', 'Arduino NG ir older', 'root@localhost', '2022-11-17 08:48:57'),
	(54, 'Inserção', 'produtos', 'LilyPad Arduino USB', 'root@localhost', '2022-11-17 08:48:57'),
	(55, 'Inserção', 'produtos', 'Arduino Robot Motor', 'root@localhost', '2022-11-17 08:49:41'),
	(56, 'Inserção', 'produtos', 'Arduino Pro or Pro mini', 'root@localhost', '2022-11-17 08:49:49'),
	(57, 'Inserção', 'produtos', 'Arduino Circuito Playground', 'root@localhost', '2022-11-17 08:50:08'),
	(58, 'Inserção', 'produtos', 'Arduino Robot Control ', 'root@localhost', '2022-11-17 08:50:24'),
	(59, 'Inserção', 'produtos', 'Arduino Industrial 101', 'root@localhost', '2022-11-17 08:50:29'),
	(60, 'Inserção', 'produtos', 'Arduino Uno Wifi', 'root@localhost', '2022-11-17 08:51:00'),
	(61, 'Inserção', 'produtos', 'Arduino gemma', 'root@localhost', '2022-11-17 08:51:12'),
	(62, 'Inserção', 'produtos', 'Arduino Yún Mini ', 'root@localhost', '2022-11-17 08:51:42'),
	(63, 'Inserção', 'produtos', 'Linino One', 'root@localhost', '2022-11-17 08:52:21'),
	(64, 'Atualização', 'marca', 'ArduinoparaArduino Uno', 'root@localhost', '2022-11-17 08:52:30'),
	(65, 'Inserção', 'produtos', 'HC-SR04', 'root@localhost', '2022-11-20 08:23:30'),
	(66, 'Inserção', 'produtos', 'TTP223B', 'root@localhost', '2022-11-20 08:24:18'),
	(67, 'Inserção', 'produtos', 'HC-SR501', 'root@localhost', '2022-11-20 08:24:48'),
	(68, 'Inserção', 'produtos', 'DS18B20', 'root@localhost', '2022-11-20 08:25:37'),
	(69, 'Inserção', 'produtos', 'Rs232 HC-06', 'root@localhost', '2022-11-20 08:29:03'),
	(70, 'Inserção', 'produtos', 'DHT11', 'WEBSERVICEFUNCIONARIO@localhost', '2022-11-20 08:33:44'),
	(71, 'Inserção', 'produtos', 'Kit RFID Mfrc522 13.56 Mhz', 'WEBSERVICEFUNCIONARIO@localhost', '2022-11-20 08:36:28'),
	(72, 'Inserção', 'produtos', 'SPP BT-06 2.1', 'WEBSERVICEFUNCIONARIO@localhost', '2022-11-20 08:37:13'),
	(73, 'Inserção', 'produtos', 'ESP8266 ESP-01', 'WEBSERVICEFUNCIONARIO@localhost', '2022-11-20 08:44:53'),
	(74, 'Inserção', 'produtos', 'Teste Delete e Insere', 'root@localhost', '2023-03-27 15:21:27'),
	(75, 'Exclusão', 'marca', 'Teste Delete e Insere', 'root@localhost', '2023-03-27 15:22:10'),
	(76, 'Inserção', 'produtos', 'vxcmnvbmxc', 'root@localhost', '2023-04-11 08:20:24'),
	(77, 'Exclusão', 'marca', 'vxcmnvbmxc', 'root@localhost', '2023-04-11 08:20:29'),
	(78, 'Inserção', 'produtos', 'Arduino', 'root@localhost', '2023-04-11 08:36:54'),
	(79, 'Exclusão', 'marca', 'Arduino', 'root@localhost', '2023-04-11 08:37:11'),
	(80, 'Inserção', 'produtos', 'Motor Dc', 'root@localhost', '2023-06-06 17:10:55'),
	(81, 'Inserção', 'produtos', 'ESP8266 Nodemcu 0.9', 'root@localhost', '2023-06-06 17:16:50');

-- Copiando estrutura para tabela jesftech.db.marca
DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `codMarca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  PRIMARY KEY (`codMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela jesftech.db.marca: ~6 rows (aproximadamente)
INSERT INTO `marca` (`codMarca`, `marca`) VALUES
	(2, 'Arduino'),
	(3, 'Servo'),
	(4, 'Sensor'),
	(5, 'WIFI'),
	(6, 'Motores'),
	(8, 'Módulo');

-- Copiando estrutura para tabela jesftech.db.modelo
DROP TABLE IF EXISTS `modelo`;
CREATE TABLE IF NOT EXISTS `modelo` (
  `codModelo` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codModelo`)
) ENGINE=InnoDB AUTO_INCREMENT=937 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela jesftech.db.modelo: ~7 rows (aproximadamente)
INSERT INTO `modelo` (`codModelo`, `modelo`) VALUES
	(1, 'AGRALE'),
	(7, 'FIAT'),
	(16, 'Mercedes'),
	(24, 'Scania'),
	(30, 'Volvo'),
	(129, 'Randon'),
	(191, 'Dodge'),
	(936, 'DAF');

-- Copiando estrutura para procedure jesftech.db.proc_alteraCidade
DROP PROCEDURE IF EXISTS `proc_alteraCidade`;
DELIMITER //
CREATE PROCEDURE `proc_alteraCidade`(
	IN `codC` INT,
	IN `ufC` VARCHAR(2),
	IN `cidadeC` VARCHAR(50)
)
BEGIN

UPDATE cidade SET uf = ufC, cid = cidadeC WHERE codCidade = codC;

END//
DELIMITER ;

-- Copiando estrutura para procedure jesftech.db.proc_alteraCliente
DROP PROCEDURE IF EXISTS `proc_alteraCliente`;
DELIMITER //
CREATE PROCEDURE `proc_alteraCliente`(IN nomeC VARCHAR(50), emailC VARCHAR(50), senhaC VARCHAR(50), cpfC VARCHAR(11), pixC VARCHAR(50), 
redesocialC VARCHAR(50), logradouroC VARCHAR(300), codCidadeC INT(11), codC INT(11))
BEGIN

UPDATE cliente SET nome = nomeC, email = emailC, senha = senhaC, cpf = cpfC, 
pix = pixC, redesocial = redesocialC, logradouro = logradouroC, codCidade = codCidadeC
WHERE codCliente = codC;

END//
DELIMITER ;

-- Copiando estrutura para procedure jesftech.db.proc_alteraFuncionario
DROP PROCEDURE IF EXISTS `proc_alteraFuncionario`;
DELIMITER //
CREATE PROCEDURE `proc_alteraFuncionario`(IN nomeF VARCHAR(50), emailF VARCHAR(50), senhaF VARCHAR(50), cpfF VARCHAR(50), cargoF VARCHAR(50),
 nascimentoF DATE, salarioF DOUBLE, codCidadeF INT(11), qrcodeF VARCHAR(50), codFunciF INT(11))
BEGIN

UPDATE funcionario SET nome = nomeF, email = emailF, senha = senhaF, cpf = cpfF, cargo = cargoF, nascimento = nascimentoF,
 salario = salarioF, codCidade = codCidadeF, qrcode = qrcodeF
WHERE codFuncionario = codFunciF;

END//
DELIMITER ;

-- Copiando estrutura para procedure jesftech.db.proc_deletaFuncionario
DROP PROCEDURE IF EXISTS `proc_deletaFuncionario`;
DELIMITER //
CREATE PROCEDURE `proc_deletaFuncionario`(IN codFunciF INT(11))
BEGIN

DELETE FROM funcionario WHERE codFuncionario = codFunciF;

END//
DELIMITER ;

-- Copiando estrutura para procedure jesftech.db.proc_insereCidade
DROP PROCEDURE IF EXISTS `proc_insereCidade`;
DELIMITER //
CREATE PROCEDURE `proc_insereCidade`(IN city VARCHAR(50), in estado VARCHAR(2))
BEGIN

INSERT INTO cidade VALUES(NULL, city, estado);

END//
DELIMITER ;

-- Copiando estrutura para procedure jesftech.db.proc_insereCliente
DROP PROCEDURE IF EXISTS `proc_insereCliente`;
DELIMITER //
CREATE PROCEDURE `proc_insereCliente`(IN nomeC VARCHAR(50), emailC VARCHAR(50), senhaC VARCHAR(50), cpfC VARCHAR(11), pixC VARCHAR(50), 
redesocialC VARCHAR(50), logradouroC VARCHAR(300), codCidadeC INT(11))
BEGIN

INSERT INTO cliente (codCliente, nome, email, senha, cpf, pix, redesocial, logradouro, codCidade)
VALUES(NULL, nomeC, emailC, senhaC, cpfC, pixC, redesocialC, logradouroC, codCidadeC);

END//
DELIMITER ;

-- Copiando estrutura para procedure jesftech.db.proc_insereFuncionario
DROP PROCEDURE IF EXISTS `proc_insereFuncionario`;
DELIMITER //
CREATE PROCEDURE `proc_insereFuncionario`(IN nomeF VARCHAR(50), emailF VARCHAR(50), senhaF VARCHAR(50), cpfF VARCHAR(50), cargoF VARCHAR(50),
 nascimentoF DATE, salarioF DOUBLE, codCidadeF INT(11), qrcodeF VARCHAR(50))
BEGIN

INSERT INTO funcionario (codFuncionario, nome, email, senha, cpf, cargo, nascimento, salario, codCidade, qrcode)
VALUES(NULL, nomeF, emailF, senhaF, cpfF, cargoF, nascimentoF, salarioF, codCidadeF, qrcodeF);

END//
DELIMITER ;

-- Copiando estrutura para procedure jesftech.db.proc_insereMarca
DROP PROCEDURE IF EXISTS `proc_insereMarca`;
DELIMITER //
CREATE PROCEDURE `proc_insereMarca`(IN marcaC VARCHAR(50))
BEGIN

INSERT INTO marca VALUES(NULL, marcaC);

END//
DELIMITER ;

-- Copiando estrutura para procedure jesftech.db.proc_insereProdutos
DROP PROCEDURE IF EXISTS `proc_insereProdutos`;
DELIMITER //
CREATE PROCEDURE `proc_insereProdutos`(IN nomeP VARCHAR(50), quantiP DECIMAL(10.0),estoP DECIMAL(10.0),preP DECIMAL(10.0))
BEGIN

INSERT INTO produtos(codProduto, nome, quantidade, estoque, preco) VALUES(NULL, nomeP, quantiP ,estoP, preP);

END//
DELIMITER ;

-- Copiando estrutura para procedure jesftech.db.proc_insereVeiculo
DROP PROCEDURE IF EXISTS `proc_insereVeiculo`;
DELIMITER //
CREATE PROCEDURE `proc_insereVeiculo`(IN nomeV VARCHAR(50), compraV DATE, anoV DOUBLE,
espacoV DOUBLE)
BEGIN

INSERT INTO veiculo (codVeiculo, nome, compra, ano, quantidade)
VALUES(NULL, nomeV, compraV, anoV, espacoV);

END//
DELIMITER ;

-- Copiando estrutura para procedure jesftech.db.proc_relatorioCrescente
DROP PROCEDURE IF EXISTS `proc_relatorioCrescente`;
DELIMITER //
CREATE PROCEDURE `proc_relatorioCrescente`(
	IN `TabelaReferente` VARCHAR(50)
)
BEGIN

if(TabelaReferente = "cidade")
		then SELECT * FROM cidade order by cid ASC;
	
ELSE if(TabelaReferente = "cliente")
		then SELECT * FROM cliente order by nome ASC;
				
ELSE if(TabelaReferente = "funcionario")
		then SELECT * FROM funcionario order by nome ASC;
		
ELSE if(TabelaReferente = "marca")
		then SELECT * FROM marca order by nome ASC;

ELSE if(TabelaReferente = "produtos")
		then SELECT * FROM produtos order by nome ASC;

ELSE if(TabelaReferente = "veiculo")
		then SELECT * FROM veiculo order by nome ASC;

ELSE if(TabelaReferente = "venda")
		then SELECT * FROM venda order by dados ASC;
		
ELSE
		SELECT "Tipo Invalido para o relatório" AS Erro;
						
END if;
					
END if;
			
END if;

END if;
					
END if;
			
END if;

END if;

END//
DELIMITER ;

-- Copiando estrutura para procedure jesftech.db.proc_relatorioDescrescente
DROP PROCEDURE IF EXISTS `proc_relatorioDescrescente`;
DELIMITER //
CREATE PROCEDURE `proc_relatorioDescrescente`(
	IN `TabelaReferente` VARCHAR(50)
)
BEGIN

if(TabelaReferente = "cidade")
		then SELECT * FROM cidade order by cid DESC;
	
ELSE if(TabelaReferente = "cliente")
		then SELECT * FROM cliente order by nome DESC;
				
ELSE if(TabelaReferente = "funcionario")
		then SELECT * FROM funcionario order by nome DESC;
		
ELSE if(TabelaReferente = "marca")
		then SELECT * FROM marca order by nome DESC;

ELSE if(TabelaReferente = "produtos")
		then SELECT * FROM produtos order by nome DESC;

ELSE if(TabelaReferente = "veiculo")
		then SELECT * FROM veiculo order by nome DESC;

ELSE if(TabelaReferente = "venda")
		then SELECT * FROM venda order by dados DESC;
		
ELSE
		SELECT "Tipo Invalido para o relatório" AS Erro;
						
END if;
					
END if;
			
END if;

END if;
					
END if;
			
END if;

END if;

END//
DELIMITER ;

-- Copiando estrutura para tabela jesftech.db.produtos
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `codProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET latin1 NOT NULL,
  `quantidade` decimal(10,0) DEFAULT 0,
  `estoque` decimal(10,0) NOT NULL,
  `preco` decimal(10,0) NOT NULL,
  `path` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `nomeFoto` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `codMarca` int(11) NOT NULL,
  PRIMARY KEY (`codProduto`) USING BTREE,
  KEY `codMarca` (`codMarca`),
  CONSTRAINT `FK_produtos_marca` FOREIGN KEY (`codMarca`) REFERENCES `marca` (`codMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela jesftech.db.produtos: ~35 rows (aproximadamente)
INSERT INTO `produtos` (`codProduto`, `nome`, `quantidade`, `estoque`, `preco`, `path`, `nomeFoto`, `codMarca`) VALUES
	(1, 'Arduino Uno', 94, 100, 25, 'img/Arduino.png', 'Arduino_Uno', 2),
	(2, 'Arduino Yún', 20, 20, 10, 'img/Arduino_Yun.png', 'Arduino_Yun.png', 2),
	(3, 'Arduino Duemilanove or Diecimila', 45, 100, 10, 'img/Arduino_Duemilanove.jpg', 'Arduino_Duemilanove', 2),
	(4, 'Arduino Nano', 90, 100, 10, 'img/Arduino_Nano.jpg', 'Arduino_Nano', 2),
	(5, 'Arduino Mega or Mega 2560', 90, 100, 10, 'img/Arduino_Mega.jpg', 'Arduino_Mega', 2),
	(6, 'Arduino Mega ADK', 100, 100, 10, NULL, NULL, 2),
	(7, 'Arduino Leonardo ', 100, 100, 10, NULL, NULL, 2),
	(8, 'Arduino Micro', 100, 100, 10, NULL, NULL, 2),
	(9, 'Arduino Leonardo ETH', 100, 100, 10, NULL, NULL, 2),
	(10, 'Arduino Esplora', 100, 100, 10, NULL, NULL, 2),
	(11, 'Arduino Ethernet ', 50, 100, 10, NULL, NULL, 2),
	(12, 'Arduino Mini', 90, 100, 10, NULL, NULL, 2),
	(13, 'Arduino BT', 100, 100, 10, NULL, NULL, 2),
	(14, 'Arduino Fio', 100, 100, 10, NULL, NULL, 2),
	(15, 'LilyPad Arduino ', 100, 100, 10, NULL, NULL, 2),
	(16, 'Arduino NG ir older', 100, 100, 10, NULL, NULL, 2),
	(17, 'LilyPad Arduino USB', 100, 100, 10, NULL, NULL, 2),
	(18, 'Arduino Robot Motor', 70, 50, 10, NULL, NULL, 2),
	(19, 'Arduino Pro or Pro mini', 100, 100, 10, NULL, NULL, 2),
	(20, 'Arduino Circuito Playground', 100, 100, 10, NULL, NULL, 2),
	(21, 'Arduino Robot Control ', 80, 100, 10, NULL, NULL, 2),
	(22, 'Arduino Industrial 101', 100, 100, 10, NULL, NULL, 2),
	(23, 'Arduino Uno Wifi', 20, 100, 10, NULL, NULL, 2),
	(24, 'Arduino gemma', 90, 100, 10, NULL, NULL, 2),
	(25, 'Arduino Yún Mini ', 100, 100, 10, NULL, NULL, 2),
	(26, 'Linino One', 100, 100, 10, NULL, NULL, 2),
	(27, 'HC-SR04', 100, 100, 15, NULL, NULL, 4),
	(28, 'TTP223B', 100, 100, 7, NULL, NULL, 4),
	(29, 'HC-SR501', 100, 100, 14, NULL, NULL, 4),
	(30, 'DS18B20', 100, 100, 19, NULL, NULL, 4),
	(31, 'Rs232 HC-06', 100, 150, 46, NULL, NULL, 8),
	(32, 'DHT11', 100, 150, 17, NULL, NULL, 4),
	(33, 'Kit RFID Mfrc522 13.56 Mhz', 100, 75, 24, NULL, NULL, 8),
	(34, 'SPP BT-06 2.1', 100, 150, 37, NULL, NULL, 8),
	(35, 'ESP8266 ESP-01', 10, 150, 28, NULL, NULL, 5),
	(41, 'Motor Dc', 100, 100, 12, NULL, NULL, 6),
	(42, 'ESP8266 Nodemcu 0.9', 100, 80, 15, NULL, NULL, 5);

-- Copiando estrutura para tabela jesftech.db.transporte
DROP TABLE IF EXISTS `transporte`;
CREATE TABLE IF NOT EXISTS `transporte` (
  `codTransporte` int(11) NOT NULL AUTO_INCREMENT,
  `transportadora` varchar(50) NOT NULL DEFAULT '',
  `codVeiculo` int(11) NOT NULL,
  `codMotorista` int(11) NOT NULL,
  `data` date NOT NULL,
  `lat` double NOT NULL DEFAULT 0,
  `long` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`codTransporte`),
  KEY `codVeiculo` (`codVeiculo`),
  KEY `codMotorista` (`codMotorista`),
  CONSTRAINT `FK_transporte_funcionario` FOREIGN KEY (`codMotorista`) REFERENCES `funcionario` (`codFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_transporte_veiculo` FOREIGN KEY (`codVeiculo`) REFERENCES `veiculo` (`codVeiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela jesftech.db.transporte: ~0 rows (aproximadamente)
INSERT INTO `transporte` (`codTransporte`, `transportadora`, `codVeiculo`, `codMotorista`, `data`, `lat`, `long`) VALUES
	(1, 'SEDEX', 1, 6, '2023-04-25', -21.700922, -45.890945),
	(2, 'MERCADO LIVRE', 2, 6, '2023-07-26', -21.700922, -45.890945);

-- Copiando estrutura para tabela jesftech.db.veiculo
DROP TABLE IF EXISTS `veiculo`;
CREATE TABLE IF NOT EXISTS `veiculo` (
  `codVeiculo` int(11) NOT NULL AUTO_INCREMENT,
  `codModelo` int(11) NOT NULL DEFAULT 0,
  `placa` varchar(50) NOT NULL,
  `ano` int(11) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'Parado',
  PRIMARY KEY (`codVeiculo`),
  KEY `codModelo` (`codModelo`),
  CONSTRAINT `FK_veiculo_modelo` FOREIGN KEY (`codModelo`) REFERENCES `modelo` (`codModelo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela jesftech.db.veiculo: ~7 rows (aproximadamente)
INSERT INTO `veiculo` (`codVeiculo`, `codModelo`, `placa`, `ano`, `status`) VALUES
	(1, 30, 'BRA-1356', 2010, 'Em andamento'),
	(2, 24, 'BRA-1357', 2020, 'Parado'),
	(3, 24, 'BRA-1358', 2002, 'Em andamento'),
	(4, 24, 'BRA-1359', 2002, 'Em andamento'),
	(5, 30, 'BRA-1360', 2010, 'Em manutenção'),
	(6, 1, 'BRA-1361', 2010, 'Parado'),
	(7, 30, 'BRA-1362', 2020, 'Parado');

-- Copiando estrutura para tabela jesftech.db.venda
DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `codVenda` int(11) NOT NULL AUTO_INCREMENT,
  `codCliente` int(11) NOT NULL,
  `statusDaVenda` varchar(50) DEFAULT 'Em andamento',
  `dataVenda` datetime NOT NULL,
  `codTransporte` int(11) DEFAULT 1,
  PRIMARY KEY (`codVenda`),
  KEY `codCliente` (`codCliente`),
  KEY `codTransporte` (`codTransporte`),
  CONSTRAINT `FK_venda_cliente` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_venda_transporte` FOREIGN KEY (`codTransporte`) REFERENCES `transporte` (`codTransporte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela jesftech.db.venda: ~8 rows (aproximadamente)
INSERT INTO `venda` (`codVenda`, `codCliente`, `statusDaVenda`, `dataVenda`, `codTransporte`) VALUES
	(32, 7, 'Concluída', '2023-06-06 08:54:07', 1),
	(34, 7, 'Concluída', '2023-06-06 09:01:35', 1),
	(35, 7, 'Concluída', '2023-06-06 09:01:45', 1),
	(36, 7, 'Concluída', '2023-06-06 09:02:36', 1),
	(38, 7, 'Concluída', '2023-06-06 17:28:15', 1),
	(49, 8, 'Concluída', '2023-09-04 20:42:24', 1),
	(50, 8, 'Concluída', '2023-09-04 21:00:34', 1);

-- Copiando estrutura para view jesftech.db.view_funcionarioscomnascimentoformatadoeidade
DROP VIEW IF EXISTS `view_funcionarioscomnascimentoformatadoeidade`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `view_funcionarioscomnascimentoformatadoeidade` (
	`nome` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`email` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`cpf` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`cargo` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nascimento` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`idade` BIGINT(21) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view jesftech.db.view_ordemprodutocmarca
DROP VIEW IF EXISTS `view_ordemprodutocmarca`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `view_ordemprodutocmarca` (
	`nome` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`marca` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view jesftech.db.view_precosbaratos
DROP VIEW IF EXISTS `view_precosbaratos`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `view_precosbaratos` (
	`nome` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`preco` DECIMAL(10,0) NOT NULL
) ENGINE=MyISAM;

-- Copiando estrutura para trigger jesftech.db.cripto
DROP TRIGGER IF EXISTS `cripto`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `cripto` BEFORE INSERT ON `funcionario` FOR EACH ROW BEGIN
SET NEW.senha = PASSWORD(NEW.senha);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger jesftech.db.venda_after_insert
DROP TRIGGER IF EXISTS `venda_after_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `venda_after_insert` AFTER INSERT ON `venda` FOR EACH ROW BEGIN

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger jesftech.db.ZAtualizaCaminhao
DROP TRIGGER IF EXISTS `ZAtualizaCaminhao`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ZAtualizaCaminhao` BEFORE UPDATE ON `veiculo` FOR EACH ROW BEGIN
/*UPDATE venda SET dados = "Concluído";
if(NEW.quantidade >= NEW.espaco)
then
SET new.status = "Parado";
END if;*/
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger jesftech.db.ZAvisoDeEstoqueBaixo
DROP TRIGGER IF EXISTS `ZAvisoDeEstoqueBaixo`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ZAvisoDeEstoqueBaixo` AFTER UPDATE ON `produtos` FOR EACH ROW BEGIN
/*if(NEW.quantidade <= NEW.estoque * 0.2)

then

SET @dados = CONCAT("O produto ",NEW.nome, " está com estoque baixo");

INSERT INTO avisos VALUES(NULL, NEW.nome,@dados,NOW(),NULL);

END if;*/
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger jesftech.db.ZCriarQrCodeFuncionario
DROP TRIGGER IF EXISTS `ZCriarQrCodeFuncionario`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ZCriarQrCodeFuncionario` BEFORE INSERT ON `funcionario` FOR EACH ROW BEGIN

SET @dados = CONCAT("{",NEW.nome,"00",NEW.codFuncionario,NEW.senha,"}");

SET NEW.qrcode = @dados;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger jesftech.db.ZLogAtualizaProdutos
DROP TRIGGER IF EXISTS `ZLogAtualizaProdutos`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ZLogAtualizaProdutos` AFTER UPDATE ON `produtos` FOR EACH ROW BEGIN
if( OLD.nome != NEW.nome)

then
 SET @observacoes = CONCAT(OLD.nome, "para", NEW.nome);
 INSERT INTO log VALUES(NULL,"Atualização","marca",@observacoes,USER(),NOW());
 
END if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger jesftech.db.ZlogExclusaoProdutos
DROP TRIGGER IF EXISTS `ZlogExclusaoProdutos`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ZlogExclusaoProdutos` AFTER DELETE ON `produtos` FOR EACH ROW BEGIN
INSERT INTO log VALUES(NULL,"Exclusão","marca",OLD.nome,USER(),NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger jesftech.db.ZLogInsereProdutos
DROP TRIGGER IF EXISTS `ZLogInsereProdutos`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ZLogInsereProdutos` AFTER INSERT ON `produtos` FOR EACH ROW BEGIN
INSERT INTO log VALUES(NULL,"Inserção","produtos",NEW.nome,USER(),NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para view jesftech.db.view_funcionarioscomnascimentoformatadoeidade
DROP VIEW IF EXISTS `view_funcionarioscomnascimentoformatadoeidade`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `view_funcionarioscomnascimentoformatadoeidade`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_funcionarioscomnascimentoformatadoeidade` AS select `funcionario`.`nome` AS `nome`,`funcionario`.`email` AS `email`,`funcionario`.`cpf` AS `cpf`,`funcionario`.`cargo` AS `cargo`,date_format(`funcionario`.`nascimento`,'%d/%m/%Y') AS `nascimento`,timestampdiff(YEAR,`funcionario`.`nascimento`,current_timestamp()) AS `idade` from `funcionario`;

-- Copiando estrutura para view jesftech.db.view_ordemprodutocmarca
DROP VIEW IF EXISTS `view_ordemprodutocmarca`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `view_ordemprodutocmarca`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_ordemprodutocmarca` AS select `p`.`nome` AS `nome`,`m`.`marca` AS `marca` from (`produtos` `p` join `marca` `m` on(`p`.`codMarca` = `m`.`codMarca`)) order by `m`.`marca`;

-- Copiando estrutura para view jesftech.db.view_precosbaratos
DROP VIEW IF EXISTS `view_precosbaratos`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `view_precosbaratos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_precosbaratos` AS select `produtos`.`nome` AS `nome`,`produtos`.`preco` AS `preco` from `produtos` order by `produtos`.`preco`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
