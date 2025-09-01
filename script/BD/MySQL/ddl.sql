DROP DATABASE IF EXISTS 5to_AerolineasArgentinas;
CREATE DATABASE 5to_AerolineasArgentinas;
USE 5to_AerolineasArgentinas;


CREATE TABLE `Aeropuertos` (
  `IATA` varchar(5) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IATA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Avion` (
  `id_avion` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(100) DEFAULT NULL,
  `fabricante` varchar(100) DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  `año_fabricacion` int DEFAULT NULL,
  `matricula` varchar(50) DEFAULT NULL,
  `id_hangar` int DEFAULT NULL,
  PRIMARY KEY (`id_avion`),
  KEY `id_hangar` (`id_hangar`),
  CONSTRAINT `Avion_ibfk_1` FOREIGN KEY (`id_hangar`) REFERENCES `Hangar` (`id_hangar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `Checkin`;

CREATE TABLE `Checkin` (
  `id_checkin` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int DEFAULT NULL,
  `fecha_checkin` datetime DEFAULT NULL,
  `asiento` varchar(10) DEFAULT NULL,
  `equipaje_bodega` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_checkin`),
  KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `Checkin_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `Reservas` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `Empleados`;

CREATE TABLE `Empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `puesto` varchar(100) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `CURP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `Equipaje`;

CREATE TABLE `Equipaje` (
  `id_equipaje` int NOT NULL AUTO_INCREMENT,
  `id_checkin` int DEFAULT NULL,
  `peso` decimal(6,2) DEFAULT NULL,
  `etiqueta_codigo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_equipaje`),
  KEY `id_checkin` (`id_checkin`),
  CONSTRAINT `Equipaje_ibfk_1` FOREIGN KEY (`id_checkin`) REFERENCES `Checkin` (`id_checkin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `Hangar`;

CREATE TABLE `Hangar` (
  `id_hangar` int NOT NULL AUTO_INCREMENT,
  `IATA` varchar(5) DEFAULT NULL,
  `cantidad_aviones` int DEFAULT NULL,
  PRIMARY KEY (`id_hangar`),
  KEY `IATA` (`IATA`),
  CONSTRAINT `Hangar_ibfk_1` FOREIGN KEY (`IATA`) REFERENCES `Aeropuertos` (`IATA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Pasajeros`;

CREATE TABLE `Pasajeros` (
  `dni` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `pasaporte` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `Reservas`;

CREATE TABLE `Reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_pasajero` int DEFAULT NULL,
  `id_vuelo` int DEFAULT NULL,
  `fecha_reserva` datetime DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `asiento` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `id_pasajero` (`id_pasajero`),
  KEY `id_vuelo` (`id_vuelo`),
  CONSTRAINT `Reservas_ibfk_1` FOREIGN KEY (`id_pasajero`) REFERENCES `Pasajeros` (`dni`),
  CONSTRAINT `Reservas_ibfk_2` FOREIGN KEY (`id_vuelo`) REFERENCES `Vuelos` (`id_vuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `Tripulaciones`;

CREATE TABLE `Tripulaciones` (
  `id_tripulacion` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `id_vuelo` int DEFAULT NULL,
  PRIMARY KEY (`id_tripulacion`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_vuelo` (`id_vuelo`),
  CONSTRAINT `Tripulaciones_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `Empleados` (`id_empleado`),
  CONSTRAINT `Tripulaciones_ibfk_2` FOREIGN KEY (`id_vuelo`) REFERENCES `Vuelos` (`id_vuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `Vuelos`;

CREATE TABLE `Vuelos` (
  `id_vuelo` int NOT NULL AUTO_INCREMENT,
  `numero_vuelo` varchar(20) DEFAULT NULL,
  `id_origen` varchar(5) DEFAULT NULL,
  `id_destino` varchar(5) DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `fecha_llegada` datetime DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `id_avion` int DEFAULT NULL,
  PRIMARY KEY (`id_vuelo`),
  KEY `id_origen` (`id_origen`),
  KEY `id_destino` (`id_destino`),
  CONSTRAINT `Vuelos_ibfk_1` FOREIGN KEY (`id_origen`) REFERENCES `Aeropuertos` (`IATA`),
  CONSTRAINT `Vuelos_ibfk_2` FOREIGN KEY (`id_destino`) REFERENCES `Aeropuertos` (`IATA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
