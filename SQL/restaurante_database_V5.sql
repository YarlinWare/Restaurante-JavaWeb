-- MySQL dump 10.13  Distrib 5.5.21, for Win64 (x86)
--
-- Host: localhost    Database: restaurante_database
-- ------------------------------------------------------
-- Server version	5.5.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombres` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  KEY `idCategoria` (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Entradas',NULL),(2,'Ensaladas/Bowls',NULL),(3,'Veggie',NULL),(4,'Pastas',NULL),(5,'Pizzas',NULL),(6,'Panini',NULL),(7,'Horno',NULL),(8,'Bebidas',NULL),(9,'Postres',NULL);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `valorNeto` int(11) DEFAULT NULL,
  `valorTotal` int(11) DEFAULT NULL,
  `propina` int(11) DEFAULT NULL,
  `iva` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `pago` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `idPedido` (`idPedido`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapago`
--

DROP TABLE IF EXISTS `formapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formapago` (
  `IdFormaPago` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdFormaPago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapago`
--

LOCK TABLES `formapago` WRITE;
/*!40000 ALTER TABLE `formapago` DISABLE KEYS */;
INSERT INTO `formapago` VALUES (1,'Tarjeta',1),(2,'Efectivo',1);
/*!40000 ALTER TABLE `formapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Mesa` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,3,'2020-03-05',1,1),(2,3,'2020-03-07',2,1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_detalle`
--

DROP TABLE IF EXISTS `pedido_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_detalle` (
  `idPedido` int(11) NOT NULL,
  `idDetalle` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `idPedido` (`idPedido`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_detalle`
--

LOCK TABLES `pedido_detalle` WRITE;
/*!40000 ALTER TABLE `pedido_detalle` DISABLE KEYS */;
INSERT INTO `pedido_detalle` VALUES (1,1,6,1,1),(2,2,1,2,1);
/*!40000 ALTER TABLE `pedido_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Administrador','Administrador del restaurante'),(2,'Camarero','Empleado del restaurante'),(3,'Cliente','Cliente del restaurante');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `valor` int(30) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `idCategoria` int(11) NOT NULL,
  `url_img` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idCategoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Panino Caprese','Queso bocconcini de b£fala, mozzarella, albahaca y tomates secos, con pesto y reducci¢n de bals mico. ',19500,1,0,'img/Paninis/Panini_caprese_veggie_ilforno@2x.jpg',20),(2,'Bowl De Frijol','Queso bocconcini de bÃ?Â£fala, pasta penne a la napolitana, albahaca y tomates cherry, con aceite de oliva. ',21000,1,0,'img/Bowls/Bowl_caprese_ilforno_f1460ad3-9871-48f9-ba13-86dd4a454816@2x.jpg',20),(3,'Bowl Feta','Queso bocconcini de b£fala o tofu, pasta penne al pesto, ma¡z, queso feta, ajonjol¡, tomates cherry, aguacate y mix de lechugas; con vinagreta campi¤a.',20000,1,0,'img/Bowls/Bowl_feta_broconchini_veggie_ilforno@2x.jpg',20),(4,'Crema de champi¤ones','Crema de champi¤ones acompa¤ada con pancitos y parmesano. ',13500,1,0,'img/prueba.jpg',20),(5,'Panino Pollo Carbonara','Pollo a la plancha con champi¤¢n portobello y tocineta; cubierto con salsa carbonara y mozzarella. ',26100,1,0,'img/prueba.jpg',20),(6,'Canelones Ricotta y Espinaca','Tres rollos de pasta artesanal, rellenos con espinaca, ricotta y tomates secos, gratinados con salsa blanca, napolitana y parmesano. ',21600,1,0,'img/Veggie/Canelones_espinaca_veggie_.jpg',20),(7,'Bowl Pesto','Queso bocconcini de b£fala o tofu, cusc£s al pesto, tomates cherry, champi¤ones salteados, zanahorias rostizadas y mix de lechugas; con aderezo ranch. ',21000,1,0,'img/Bowls/Bowl_pesto_tofu_veggie_ilforno@2x.jpg',20),(8,'Jugo Amazonas','Jugo de nuestra tierra elaborado con aca¡, banano, jengibre, albahaca y lim¢n. Contiene una carga nutricional y concentraci¢n de antioxidantes alta, ayuda a aliviar el dolor y aporta energ¡a. Se recomienda... ',7800,1,0,'img/Bebidas/Jugos_Funcionales_Amazonas@2x.jpg',20),(9,'Jugo Caribe','Jugo de nuestra tierra elaborado con Corozo, es refrescante con alto contenido de vitamina c, antioxidantes y ayuda a tener una correcta digesti¢n la digesti¢n. Se recomienda endulzar con estevia o... ',7800,1,0,'img/Bebidas/Jugos_Funcionales_Caribe@2x.jpg',20),(10,'Jugo Valle','Jugo de nuestra tierra elaborado con pi¤a, espinaca y naranja, es desintoxicante y limpiador. Se recomienda endulzar con estevia o panela. ',7800,1,0,'img/Bebidas/Jugos_Funcionales_Valle@2x.jpg',20),(11,'Jugo Bahamas','Jugo Bahamas (maracuy , mango y pi¤a) ',7800,1,0,'img/Bebidas/jugo_bahamas_ilforno@2x.jpg',20),(12,'Limonada de Coco','Limonada De Coco ',7800,1,0,'img/Bebidas/jugo_limonada_coco_ilforno@2x.jpg',20),(14,'Arveja','Plato de arvejas al gusto',15000,NULL,0,NULL,15),(15,'Changua','Leche, huevo, cilantro, caladito y amor',5000,NULL,0,NULL,20);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idPerfil` int(11) NOT NULL,
  `nombres` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidos` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `correo` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `celular` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `password` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idPerfil` (`idPerfil`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,' Arqu¡medes','Hernandez','ahernandez@restaurante.com','3109879876','administrador'),(2,2,'Herodes','Perez','hperez@restaurante.com','3109876543','camarero'),(3,3,'Charlotte','Johnson','cjohnson@restaurante.com','3109876542','cliente'),(4,1,'Sophia','Reyes','sreyes@restaurante.com','3009876765','administrador'),(5,3,'Pedro','Perez','pperez@restaurante.com','3109996543','cliente'),(6,2,'Edwin','Chaparro','e.andressalinas@gmail.com','3118486114','admin');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-25 16:47:51
