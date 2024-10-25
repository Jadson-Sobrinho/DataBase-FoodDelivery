-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_food_delivery
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_avaliacao_pedido`
--

DROP TABLE IF EXISTS `tb_avaliacao_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_avaliacao_pedido` (
  `avaliacao_pedido_id` int NOT NULL,
  `nota` char(1) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`avaliacao_pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_avaliacao_pedido`
--

LOCK TABLES `tb_avaliacao_pedido` WRITE;
/*!40000 ALTER TABLE `tb_avaliacao_pedido` DISABLE KEYS */;
INSERT INTO `tb_avaliacao_pedido` VALUES (1,'5','Perfeito como sempre, entrega rápida e comida deliciosa.'),(2,'5','Pedido entregue no prazo e tudo estava delicioso!'),(3,'4','Faltou um item no pedido, mas o resto estava bom.'),(4,'3','Demorou um pouco mais do que o esperado.'),(5,'5','Excelente serviço, recomendo!'),(6,'4','Comida saborosa, mas a embalagem estava danificada.'),(7,'3','Pedido veio com ingredientes errados.'),(8,'5','Sempre peço nesse restaurante, nunca me decepciono.'),(9,'4','Boa experiência no geral, mas a entrega demorou.'),(10,'3','Poderia melhorar a qualidade da embalagem.');
/*!40000 ALTER TABLE `tb_avaliacao_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cardapio`
--

DROP TABLE IF EXISTS `tb_cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cardapio` (
  `cardapio_id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`cardapio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cardapio`
--

LOCK TABLES `tb_cardapio` WRITE;
/*!40000 ALTER TABLE `tb_cardapio` DISABLE KEYS */;
INSERT INTO `tb_cardapio` VALUES (1,'Comida Japonesa'),(2,'Comida Mexicana'),(3,'Comida Árabe'),(4,'Comida Brasileira'),(5,'Comida Chinesa'),(6,'Comida Indiana'),(7,'Comida Francesa'),(8,'Comida Tailandesa'),(9,'Comida Alemã'),(10,'Comida Coreana');
/*!40000 ALTER TABLE `tb_cardapio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cartao`
--

DROP TABLE IF EXISTS `tb_cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cartao` (
  `cartao_id` int NOT NULL AUTO_INCREMENT,
  `numero` char(16) NOT NULL,
  `nome_titular` varchar(45) NOT NULL,
  `data_validade` date NOT NULL,
  `cpf_cnpj` varchar(16) NOT NULL,
  `cvv` char(3) NOT NULL,
  PRIMARY KEY (`cartao_id`),
  UNIQUE KEY `numero_UNIQUE` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cartao`
--

LOCK TABLES `tb_cartao` WRITE;
/*!40000 ALTER TABLE `tb_cartao` DISABLE KEYS */;
INSERT INTO `tb_cartao` VALUES (1,'1111222233334444','Ana Silva','2026-06-30','11111111111','111'),(2,'2222333344445555','Pedro Oliveira','2025-12-31','22222222222','222'),(3,'3333444455556666','Carla Santos','2024-10-31','33333333333','333'),(4,'4444555566667777','Rafaela Costa','2023-08-31','44444444444','444'),(5,'5555666677778888','Mateus Pereira','2022-05-31','55555555555','555'),(6,'6666777788889999','Juliana Souza','2026-04-30','66666666666','666'),(7,'7777888899990000','Lucas Almeida','2025-11-30','77777777777','777'),(8,'8888999900001111','Mariana Lima','2024-09-30','88888888888','888'),(9,'9999000011112222','Felipe Castro','2023-07-31','99999999999','999'),(10,'0000111122223333','Aline Fernandes','2022-03-31','00000000000','000');
/*!40000 ALTER TABLE `tb_cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_carteira`
--

DROP TABLE IF EXISTS `tb_carteira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_carteira` (
  `carteira_id` int NOT NULL,
  `cartao_id` int DEFAULT NULL,
  `voucher_id` int DEFAULT NULL,
  PRIMARY KEY (`carteira_id`),
  KEY `cartao_id_idx` (`cartao_id`),
  KEY `voucher_id_idx` (`voucher_id`),
  CONSTRAINT `cartao_id` FOREIGN KEY (`cartao_id`) REFERENCES `tb_cartao` (`cartao_id`),
  CONSTRAINT `voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `tb_voucher` (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carteira`
--

LOCK TABLES `tb_carteira` WRITE;
/*!40000 ALTER TABLE `tb_carteira` DISABLE KEYS */;
INSERT INTO `tb_carteira` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `tb_carteira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categoria` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`),
  UNIQUE KEY `categoria_id_UNIQUE` (`categoria_id`),
  UNIQUE KEY `tipo_UNIQUE` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (9,'Comida Alemã'),(3,'Comida Árabe'),(4,'Comida Brasileira'),(5,'Comida Chinesa'),(10,'Comida Coreana'),(7,'Comida Francesa'),(6,'Comida Indiana'),(1,'Comida Japonesa'),(2,'Comida Mexicana'),(8,'Comida Tailandesa');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `rg` char(9) NOT NULL,
  `sexo` char(1) NOT NULL,
  `cpf` char(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `senha` char(8) NOT NULL,
  `carteira_id` int DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `cliente_id_UNIQUE` (`cliente_id`),
  UNIQUE KEY `cnpj_UNIQUE` (`cpf`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `carteira_id_idx` (`carteira_id`),
  CONSTRAINT `carteira_id` FOREIGN KEY (`carteira_id`) REFERENCES `tb_carteira` (`carteira_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'Thiago Fernandes','123456789','M','98765432199','1993-12-05','thiago123','senha191',1),(2,'Fernanda Rodrigues','123456780','F','98765432108','1985-04-25','fernanda123','senha456',2),(3,'Rodrigo Sousa','123456781','M','98765432107','1992-08-12','rodrigo123','senha789',3),(4,'Camila Costa','123456782','F','98765432106','1978-10-07','camila123','senha101',4),(5,'Gustavo Santos','123456783','M','98765432105','1999-02-18','gustavo123','senha112',5),(6,'Laura Lima','123456784','F','98765432104','1982-11-29','laura123','senha131',6),(7,'Bruno Oliveira','123456785','M','98765432103','1996-07-14','bruno123','senha415',7),(8,'Vanessa Silva','123456786','F','98765432102','1975-03-20','vanessa123','senha161',8),(9,'Marcelo Souza','123456787','M','98765432101','1990-09-03','marcelo123','senha171',9),(10,'Amanda Rodrigues','123456788','F','98765432100','1988-06-22','amanda123','senha181',10);
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_endereco` (
  `endereco_id` int NOT NULL AUTO_INCREMENT,
  `cidade` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cep` char(8) NOT NULL,
  `UF` char(2) NOT NULL,
  PRIMARY KEY (`endereco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
INSERT INTO `tb_endereco` VALUES (1,'Feira de Santana','Centro','44001000','BA'),(2,'Feira de Santana','Queimadinha','44001001','BA'),(3,'Feira de Santana','Santa Mônica','44001002','BA'),(4,'Feira de Santana','Sobradinho','44001003','BA'),(5,'Feira de Santana','Papagaio','44001004','BA'),(6,'Feira de Santana','Cidade Nova','44001005','BA'),(7,'Feira de Santana','Muchila','44001006','BA'),(8,'Feira de Santana','SIM','44001007','BA'),(9,'Feira de Santana','Tomba','44001008','BA'),(10,'Feira de Santana','Brasília','44001009','BA');
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco_cliente`
--

DROP TABLE IF EXISTS `tb_endereco_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_endereco_cliente` (
  `endereco_cliente_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `endereco_id` int NOT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`endereco_cliente_id`,`endereco_id`,`cliente_id`),
  KEY `endereco_id_idx` (`endereco_id`),
  KEY `cliente_id_idx` (`cliente_id`),
  CONSTRAINT `cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `tb_cliente` (`cliente_id`),
  CONSTRAINT `endereco_id` FOREIGN KEY (`endereco_id`) REFERENCES `tb_endereco` (`endereco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco_cliente`
--

LOCK TABLES `tb_endereco_cliente` WRITE;
/*!40000 ALTER TABLE `tb_endereco_cliente` DISABLE KEYS */;
INSERT INTO `tb_endereco_cliente` VALUES (1,1,1,'1050','Casa 304'),(2,2,2,'200','Apto 202'),(3,3,3,'300','Bloco C'),(4,4,4,'400','Casa 2'),(5,5,5,'500','Apto 501'),(6,6,6,'600','Casa 1'),(7,7,7,'700','Bloco D'),(8,8,8,'800','Apto 802'),(9,9,9,'900','Casa 3'),(10,10,10,'1000','Apto 1001');
/*!40000 ALTER TABLE `tb_endereco_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco_estabelecimento`
--

DROP TABLE IF EXISTS `tb_endereco_estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_endereco_estabelecimento` (
  `tb_estabelecimento_endereco_id` int NOT NULL AUTO_INCREMENT,
  `endereco_id` int NOT NULL,
  `estabelecimento_id` int NOT NULL,
  `numero` int DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tb_estabelecimento_endereco_id`,`endereco_id`,`estabelecimento_id`),
  KEY `endereco_id_idx` (`endereco_id`),
  KEY `estabelecimento_id_idx` (`estabelecimento_id`),
  CONSTRAINT `estabelecimento_id` FOREIGN KEY (`estabelecimento_id`) REFERENCES `tb_estabelecimento` (`estabelecimento_id`),
  CONSTRAINT `fk_endereco_id` FOREIGN KEY (`endereco_id`) REFERENCES `tb_endereco` (`endereco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco_estabelecimento`
--

LOCK TABLES `tb_endereco_estabelecimento` WRITE;
/*!40000 ALTER TABLE `tb_endereco_estabelecimento` DISABLE KEYS */;
INSERT INTO `tb_endereco_estabelecimento` VALUES (1,1,1,201,'Loja 2'),(2,2,2,301,'Sala 1'),(3,3,3,401,'Apto 302'),(4,4,4,501,'Casa 4'),(5,5,5,601,'Apto 701'),(6,6,6,701,'Bloco E'),(7,7,7,801,'Apto 902'),(8,8,8,901,'Casa 5'),(9,9,9,1001,'Apto 1102'),(10,10,10,101,'Casa 6');
/*!40000 ALTER TABLE `tb_endereco_estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estabelecimento`
--

DROP TABLE IF EXISTS `tb_estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estabelecimento` (
  `estabelecimento_id` int NOT NULL AUTO_INCREMENT,
  `cardapio_id` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `horario_funcionamento_id` int DEFAULT NULL,
  `cnpj` char(14) NOT NULL,
  `razao_social` varchar(45) NOT NULL,
  `nome_fantasia` varchar(45) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`estabelecimento_id`),
  UNIQUE KEY `estabelecimento_id_UNIQUE` (`estabelecimento_id`),
  KEY `categoria_id_idx` (`categoria_id`),
  KEY `cardapio_id_idx` (`cardapio_id`),
  KEY `horario_funcionamento_id_idx` (`horario_funcionamento_id`),
  CONSTRAINT `categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `tb_categoria` (`categoria_id`),
  CONSTRAINT `fk_cardapio_id` FOREIGN KEY (`cardapio_id`) REFERENCES `tb_cardapio` (`cardapio_id`),
  CONSTRAINT `horario_funcionamento_id` FOREIGN KEY (`horario_funcionamento_id`) REFERENCES `tb_horario_funcionamento` (`horario_funcionamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estabelecimento`
--

LOCK TABLES `tb_estabelecimento` WRITE;
/*!40000 ALTER TABLE `tb_estabelecimento` DISABLE KEYS */;
INSERT INTO `tb_estabelecimento` VALUES (1,1,1,1,'98765432101234','Sushi Master','Sushi Master','Restaurante especializado em comida japonesa','2198765-4321','contato@sushimaster.com'),(2,2,2,2,'98765432101235','El Mariachi','El Mariachi','Restaurante mexicano com música ao vivo','2198765-4322','contato@elmariachi.com'),(3,3,3,3,'98765432101236','Alibaba Kebab','Alibaba Kebab','Casa de kebabs e pratos árabes','2198765-4323','contato@alibabakebab.com'),(4,4,4,4,'98765432101237','Feijoada da Vovó','Feijoada da Vovó','Restaurante de comida brasileira caseira','2198765-4324','contato@feijoadadavovo.com'),(5,5,5,5,'98765432101238','Dragão Chinês','Dragão Chinês','Comida chinesa autêntica e delivery','2198765-4325','contato@dragaochines.com'),(6,6,6,6,'98765432101239','Taj Mahal','Taj Mahal','Restaurante indiano com decoração exótica','2198765-4326','contato@tajmahal.com'),(7,7,7,7,'98765432101240','La Tour Eiffel','La Tour Eiffel','Bistrô francês com pratos tradicionais','2198765-4327','contato@latoureiffel.com'),(8,8,8,8,'98765432101241','Bangkok Thai','Bangkok Thai','Comida tailandesa autêntica e temperos exóticos','2198765-4328','contato@bangkokthai.com'),(9,9,9,9,'98765432101242','Cervejaria München','Cervejaria München','Bar alemão com cervejas artesanais','2198765-4329','contato@cervejariamunchen.com'),(10,10,10,10,'98765432101243','Seoul BBQ','Seoul BBQ','Churrascaria coreana com grelhados especiais','2198765-4330','contato@seoulbbq.com');
/*!40000 ALTER TABLE `tb_estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_horario_funcionamento`
--

DROP TABLE IF EXISTS `tb_horario_funcionamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_horario_funcionamento` (
  `horario_funcionamento_id` int NOT NULL AUTO_INCREMENT,
  `dia_semana` varchar(20) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `almoco_inicio` time DEFAULT NULL,
  `almoco_fim` time DEFAULT NULL,
  PRIMARY KEY (`horario_funcionamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_horario_funcionamento`
--

LOCK TABLES `tb_horario_funcionamento` WRITE;
/*!40000 ALTER TABLE `tb_horario_funcionamento` DISABLE KEYS */;
INSERT INTO `tb_horario_funcionamento` VALUES (1,'Segunda','10:00:00','22:00:00','12:00:00','14:00:00'),(2,'Terça','10:00:00','22:00:00','12:00:00','14:00:00'),(3,'Quarta','10:00:00','22:00:00','12:00:00','14:00:00'),(4,'Quinta','10:00:00','22:00:00','12:00:00','14:00:00'),(5,'Sexta','10:00:00','22:00:00','12:00:00','14:00:00'),(6,'Sábado','10:00:00','22:00:00','12:00:00','14:00:00'),(7,'Domingo','10:00:00','22:00:00','12:00:00','14:00:00'),(8,'Segunda','10:00:00','22:00:00','12:00:00','14:00:00'),(9,'Segunda','10:00:00','22:00:00','12:00:00','14:00:00'),(10,'Segunda','10:00:00','22:00:00','12:00:00','14:00:00');
/*!40000 ALTER TABLE `tb_horario_funcionamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_item`
--

DROP TABLE IF EXISTS `tb_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `cardapio_id` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `observacao` varchar(100) DEFAULT NULL,
  `categoria` varchar(45) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `cardapio_id_idx` (`cardapio_id`),
  CONSTRAINT `cardapio_id` FOREIGN KEY (`cardapio_id`) REFERENCES `tb_cardapio` (`cardapio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item`
--

LOCK TABLES `tb_item` WRITE;
/*!40000 ALTER TABLE `tb_item` DISABLE KEYS */;
INSERT INTO `tb_item` VALUES (1,1,'Sashimi de Salmão','Fatias de salmão fresco','Servir com shoyu','Sashimi',25.00),(2,2,'Taco de Carne','Taco crocante recheado com carne moída temperada','Acompanha guacamole e pimenta','Taco',15.00),(3,3,'Kibe Frito','Bolinho de trigo com recheio de carne','Servir com limão','Salgado Árabe',10.00),(4,4,'Feijoada Completa','Feijoada com todos os acompanhamentos tradicionais','Serve 2 pessoas','Prato Principal',60.00),(5,5,'Frango Xadrez','Pedacinhos de frango com legumes e molho agridoce','Opção vegetariana disponível','Prato Principal',30.00),(6,6,'Curry de Frango','Frango cozido lentamente em molho de curry','Acompanha arroz basmati','Prato Principal',35.00),(7,7,'Ratatouille','Prato de legumes cozidos em molho de tomate','Acompanha pão','Vegetariano',20.00),(8,8,'Pad Thai','Macarrão de arroz frito com camarão e vegetais','Servir com limão e amendoim','Prato Principal',40.00),(9,9,'Joelho de Porco','Joelho de porco assado com batatas','Acompanha mostarda','Prato Principal',50.00),(10,10,'Bibimbap','Arroz misturado com legumes, carne e ovo frito','Molho gochujang a parte','Prato Principal',45.00);
/*!40000 ALTER TABLE `tb_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pagamento`
--

DROP TABLE IF EXISTS `tb_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pagamento` (
  `pagamento_id` int NOT NULL,
  `pedido_id` int NOT NULL,
  `carteira_id` int NOT NULL,
  `tipo_pagamento` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`pagamento_id`),
  KEY `tipo_pagamento_id_idx` (`tipo_pagamento`),
  KEY `pedido_id_idx` (`pedido_id`),
  KEY `fk_carteira_id_idx` (`carteira_id`),
  CONSTRAINT `fk_carteira_id` FOREIGN KEY (`carteira_id`) REFERENCES `tb_carteira` (`carteira_id`),
  CONSTRAINT `fk_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `tb_pedido` (`pedido_id`),
  CONSTRAINT `fk_tipo_pagamento_id` FOREIGN KEY (`tipo_pagamento`) REFERENCES `tb_tipo_pagamento` (`tipo_pagamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pagamento`
--

LOCK TABLES `tb_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_pagamento` DISABLE KEYS */;
INSERT INTO `tb_pagamento` VALUES (1,1,1,1,25.00),(2,2,2,3,15.00),(3,3,3,2,10.00),(4,4,4,2,60.00),(5,5,5,2,30.00),(6,6,6,1,35.00),(7,7,7,1,20.00),(8,8,8,3,40.00),(9,9,9,3,50.00),(10,10,10,3,45.00);
/*!40000 ALTER TABLE `tb_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido`
--

DROP TABLE IF EXISTS `tb_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pedido` (
  `pedido_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `endereco_cliente_id` int NOT NULL,
  `item_id` int NOT NULL,
  `cardapio_id` int NOT NULL,
  `estabelecimento_id` int NOT NULL,
  `horario_solicitacao` time NOT NULL,
  `horario_entrega` time DEFAULT NULL,
  `status_pedido` varchar(45) DEFAULT 'PENDENTE',
  `valor_total` decimal(10,2) DEFAULT NULL,
  `avaliacao_pedido_id` int DEFAULT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `cliente_id_idx` (`cliente_id`),
  KEY `estabelecimento_id_idx` (`estabelecimento_id`),
  KEY `cardapio_id_idx` (`cardapio_id`),
  KEY `item_id_idx` (`item_id`),
  KEY `endereco_cliente_id_idx` (`endereco_cliente_id`),
  KEY `avaliacao_pedido_id_idx` (`avaliacao_pedido_id`),
  CONSTRAINT `fk2_cardapio_id` FOREIGN KEY (`cardapio_id`) REFERENCES `tb_cardapio` (`cardapio_id`),
  CONSTRAINT `fk_avaliacao_pedido_id` FOREIGN KEY (`avaliacao_pedido_id`) REFERENCES `tb_avaliacao_pedido` (`avaliacao_pedido_id`),
  CONSTRAINT `fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `tb_cliente` (`cliente_id`),
  CONSTRAINT `fk_endereco_cliente_id` FOREIGN KEY (`endereco_cliente_id`) REFERENCES `tb_endereco_cliente` (`endereco_cliente_id`),
  CONSTRAINT `fk_estabelecimento_id` FOREIGN KEY (`estabelecimento_id`) REFERENCES `tb_estabelecimento` (`estabelecimento_id`),
  CONSTRAINT `fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `tb_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido`
--

LOCK TABLES `tb_pedido` WRITE;
/*!40000 ALTER TABLE `tb_pedido` DISABLE KEYS */;
INSERT INTO `tb_pedido` VALUES (1,1,1,1,1,1,'12:00:00','12:30:00','ENTREGUE',15.00,2),(2,2,2,2,2,2,'12:00:00','12:30:00','ENTREGUE',15.00,2),(3,3,3,3,3,3,'13:00:00','13:40:00','ENTREGUE',10.00,3),(4,4,4,4,4,4,'14:00:00','15:00:00','ENTREGUE',60.00,4),(5,5,5,5,5,5,'15:00:00','16:00:00','ENTREGUE',30.00,5),(6,6,6,6,6,6,'16:00:00','16:45:00','ENTREGUE',35.00,6),(7,7,7,7,7,7,'17:00:00','18:15:00','ENTREGUE',20.00,7),(8,8,8,8,8,8,'18:00:00','19:00:00','ENTREGUE',40.00,8),(9,9,9,9,9,9,'19:00:00','20:30:00','ENTREGUE',50.00,9),(10,10,10,10,10,10,'19:00:00','20:30:00','ENTREGUE',50.00,9);
/*!40000 ALTER TABLE `tb_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_pagamento`
--

DROP TABLE IF EXISTS `tb_tipo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_pagamento` (
  `tipo_pagamento_id` int NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tipo_pagamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_pagamento`
--

LOCK TABLES `tb_tipo_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_tipo_pagamento` DISABLE KEYS */;
INSERT INTO `tb_tipo_pagamento` VALUES (1,'Cartão de Débito'),(2,'Cartão de Crédito'),(3,'Voucher');
/*!40000 ALTER TABLE `tb_tipo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_voucher`
--

DROP TABLE IF EXISTS `tb_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_voucher` (
  `voucher_id` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_validade` date DEFAULT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_voucher`
--

LOCK TABLES `tb_voucher` WRITE;
/*!40000 ALTER TABLE `tb_voucher` DISABLE KEYS */;
INSERT INTO `tb_voucher` VALUES (1,65.00,'2033-12-31'),(2,20.00,'2024-12-31'),(3,30.00,'2025-12-31'),(4,40.00,'2026-12-31'),(5,50.00,'2027-12-31'),(6,25.00,'2028-12-31'),(7,35.00,'2029-12-31'),(8,45.00,'2030-12-31'),(9,55.00,'2031-12-31'),(10,60.00,'2032-12-31');
/*!40000 ALTER TABLE `tb_voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-27  2:07:37
