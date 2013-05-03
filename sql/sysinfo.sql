/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.28-log : Database - sysinfo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`sysinfo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sysinfo`;

/*Table structure for table `actividad` */

CREATE TABLE `actividad` (
  `idActividad` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) NOT NULL,
  `memorando` varchar(255) NOT NULL,
  PRIMARY KEY (`idActividad`),
  KEY `FK_actividad` (`memorando`),
  KEY `FK_actividadestado` (`estado`),
  CONSTRAINT `FK_actividad` FOREIGN KEY (`memorando`) REFERENCES `memorando` (`idMemorando`),
  CONSTRAINT `FK_actividadestado` FOREIGN KEY (`estado`) REFERENCES `estadoactividad` (`idEstadoActividad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `actividad` */

LOCK TABLES `actividad` WRITE;

UNLOCK TABLES;

/*Table structure for table `actor` */

CREATE TABLE `actor` (
  `idActor` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idActor`),
  CONSTRAINT `FK_actorq` FOREIGN KEY (`idActor`) REFERENCES `quien` (`idQuien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `actor` */

LOCK TABLES `actor` WRITE;

insert  into `actor`(`idActor`,`nombre`,`apellido`,`email`,`descripcion`) values ('18','Faber Danilo','Giraldo','fdgiraldo@uniquindio.edu.co',NULL);
insert  into `actor`(`idActor`,`nombre`,`apellido`,`email`,`descripcion`) values ('18475320','Juan Pablo','Giraldo','jpgir123@gmail.com',NULL);
insert  into `actor`(`idActor`,`nombre`,`apellido`,`email`,`descripcion`) values ('20','Rocio','Suarez','rociosuarez@uniquindio.edu.co',NULL);
insert  into `actor`(`idActor`,`nombre`,`apellido`,`email`,`descripcion`) values ('21','Elkin Anibal ','Monsalve','elkinmonsalve@uniquindio.edu.co',NULL);
insert  into `actor`(`idActor`,`nombre`,`apellido`,`email`,`descripcion`) values ('22','Carlos Arturo ','Garcia','cacivil_uq@uniquindio.edu.co',NULL);
insert  into `actor`(`idActor`,`nombre`,`apellido`,`email`,`descripcion`) values ('28','Luz Elena','Arias Holguín','learias@uniquindio.edu.co',NULL);
insert  into `actor`(`idActor`,`nombre`,`apellido`,`email`,`descripcion`) values ('7','Carlos Andrés','Florez','caflorezvi@gmail.com',NULL);
insert  into `actor`(`idActor`,`nombre`,`apellido`,`email`,`descripcion`) values ('9','Pepito','Perez','pepitoperez@gmail.com',NULL);

UNLOCK TABLES;

/*Table structure for table `actorrol` */

CREATE TABLE `actorrol` (
  `idRolActor` varchar(255) NOT NULL,
  `actor` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL,
  PRIMARY KEY (`idRolActor`),
  KEY `FK_actor` (`actor`),
  KEY `FK_rolac` (`rol`),
  CONSTRAINT `FK_actor` FOREIGN KEY (`actor`) REFERENCES `actor` (`idActor`),
  CONSTRAINT `FK_rolac` FOREIGN KEY (`rol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `actorrol` */

LOCK TABLES `actorrol` WRITE;

insert  into `actorrol`(`idRolActor`,`actor`,`rol`) values ('1','7','4');
insert  into `actorrol`(`idRolActor`,`actor`,`rol`) values ('2','9','8');
insert  into `actorrol`(`idRolActor`,`actor`,`rol`) values ('3','18475320','12');
insert  into `actorrol`(`idRolActor`,`actor`,`rol`) values ('4','18','17');
insert  into `actorrol`(`idRolActor`,`actor`,`rol`) values ('5','22','26');
insert  into `actorrol`(`idRolActor`,`actor`,`rol`) values ('6','28','27');
insert  into `actorrol`(`idRolActor`,`actor`,`rol`) values ('7','20','24');

UNLOCK TABLES;

/*Table structure for table `agenda` */

CREATE TABLE `agenda` (
  `idAgenda` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAgenda`),
  CONSTRAINT `FK_paquete` FOREIGN KEY (`idAgenda`) REFERENCES `paquete` (`idPaquete`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `agenda` */

LOCK TABLES `agenda` WRITE;

UNLOCK TABLES;

/*Table structure for table `anexo` */

CREATE TABLE `anexo` (
  `idAnexo` varchar(255) NOT NULL,
  `ruta` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAnexo`),
  KEY `FK_anexo` (`documento`),
  CONSTRAINT `FK_anexo` FOREIGN KEY (`documento`) REFERENCES `documento` (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `anexo` */

LOCK TABLES `anexo` WRITE;

UNLOCK TABLES;

/*Table structure for table `armario` */

CREATE TABLE `armario` (
  `idArmario` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`idArmario`),
  CONSTRAINT `FK_armario` FOREIGN KEY (`idArmario`) REFERENCES `deposito` (`idDeposito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `armario` */

LOCK TABLES `armario` WRITE;

UNLOCK TABLES;

/*Table structure for table `autordocumento` */

CREATE TABLE `autordocumento` (
  `idAutorDoc` varchar(255) NOT NULL,
  `actor` varchar(255) NOT NULL,
  `documento` varchar(255) NOT NULL,
  `descripcionModificacion` varchar(255) NOT NULL,
  PRIMARY KEY (`idAutorDoc`),
  KEY `FK_autordoc` (`actor`),
  KEY `FK_autordocumento` (`documento`),
  CONSTRAINT `FK_autordoc` FOREIGN KEY (`actor`) REFERENCES `actor` (`idActor`),
  CONSTRAINT `FK_autordocumento` FOREIGN KEY (`documento`) REFERENCES `documento` (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `autordocumento` */

LOCK TABLES `autordocumento` WRITE;

UNLOCK TABLES;

/*Table structure for table `calendario` */

CREATE TABLE `calendario` (
  `idCalendario` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `calendario` varchar(255) DEFAULT NULL,
  `agenda` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCalendario`),
  KEY `FK_calendario` (`calendario`),
  KEY `FK_agenda` (`agenda`),
  CONSTRAINT `FK_agenda` FOREIGN KEY (`agenda`) REFERENCES `agenda` (`idAgenda`),
  CONSTRAINT `FK_calendario` FOREIGN KEY (`calendario`) REFERENCES `calendario` (`idCalendario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `calendario` */

LOCK TABLES `calendario` WRITE;

UNLOCK TABLES;

/*Table structure for table `circular` */

CREATE TABLE `circular` (
  `idCircular` varchar(255) NOT NULL,
  `numeroRadicado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCircular`),
  CONSTRAINT `FK_circular` FOREIGN KEY (`idCircular`) REFERENCES `comunicacion` (`idComunicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `circular` */

LOCK TABLES `circular` WRITE;

insert  into `circular`(`idCircular`,`numeroRadicado`) values ('138',NULL);
insert  into `circular`(`idCircular`,`numeroRadicado`) values ('139',NULL);
insert  into `circular`(`idCircular`,`numeroRadicado`) values ('190',NULL);
insert  into `circular`(`idCircular`,`numeroRadicado`) values ('90',NULL);
insert  into `circular`(`idCircular`,`numeroRadicado`) values ('98',NULL);

UNLOCK TABLES;

/*Table structure for table `ciudad` */

CREATE TABLE `ciudad` (
  `idCiudad` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ciudad` */

LOCK TABLES `ciudad` WRITE;

insert  into `ciudad`(`idCiudad`,`nombre`) values ('1','Armenia');
insert  into `ciudad`(`idCiudad`,`nombre`) values ('2','Pereira');

UNLOCK TABLES;

/*Table structure for table `comunciacioninterna` */

CREATE TABLE `comunciacioninterna` (
  `idComunicacionI` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idComunicacionI`),
  CONSTRAINT `FK_comunciacioninterna` FOREIGN KEY (`idComunicacionI`) REFERENCES `comunicacion` (`idComunicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comunciacioninterna` */

LOCK TABLES `comunciacioninterna` WRITE;

insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('100',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('108',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('111',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('112',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('113',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('115',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('116',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('117',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('118',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('121',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('122',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('123',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('124',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('125',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('128',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('130',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('132',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('137',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('141',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('143',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('144',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('145',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('146',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('147',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('148',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('149',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('150',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('151',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('152',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('153',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('154',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('157',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('160',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('186',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('188',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('189',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('193',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('194',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('195',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('196',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('197',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('247',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('95',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('96',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('97',NULL);
insert  into `comunciacioninterna`(`idComunicacionI`,`descripcion`) values ('99',NULL);

UNLOCK TABLES;

/*Table structure for table `comunicacion` */

CREATE TABLE `comunicacion` (
  `idComunicacion` varchar(255) NOT NULL,
  `asunto` varchar(255) DEFAULT NULL,
  `contenidoCom` text,
  `estado` varchar(255) NOT NULL,
  `remitente` varchar(255) NOT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `leido` varchar(2) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `unidadOrganizacional` varchar(255) DEFAULT NULL,
  `destinatariosCom` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idComunicacion`),
  KEY `FK_comunicacioncontacto` (`remitente`),
  KEY `FK_comunicacionf` (`fecha`),
  KEY `FK_comunicacionestado` (`estado`),
  CONSTRAINT `FK_comunicacioncontacto` FOREIGN KEY (`remitente`) REFERENCES `contacto` (`idContacto`),
  CONSTRAINT `FK_comunicaciondoc` FOREIGN KEY (`idComunicacion`) REFERENCES `documento` (`idDocumento`),
  CONSTRAINT `FK_comunicacionestado` FOREIGN KEY (`estado`) REFERENCES `estadocomunicacion` (`idEstadoComunicacion`),
  CONSTRAINT `FK_comunicacionf` FOREIGN KEY (`fecha`) REFERENCES `fecha` (`idFecha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comunicacion` */

LOCK TABLES `comunicacion` WRITE;

insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('1','Comunicación con ñ','Contenido de la comunicación','1','1','357','','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('10','Mensaje Prueba','Hola Luis, mañana es la reunión con Acreditación. Hora: 10am.','1','4',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('100','ABC','XXX','12','4',NULL,'SI','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('101','msj','hola.','2','5',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('102','msj','ok','2','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('103','asunto mensaje','contenido 1q23','2','4',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('104','asunto mensaje','...','2','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('105','asunto memorando','contenido....','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('106','ASUNTO //\\\\','CONTENIDO<div>1.</div><div>2.</div><div>3.</div>','1','4',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('107','EL ASUNTO','EL CONTENIDO<div>VA</div><div>ACÁ</div>','12','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('108','EL ASUNTO','CONTENIDO DE LA COMUNICACIÓN INTERNA.','12','2',NULL,'SI','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('109','Asunto','ccc lol','12','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('11','Comunicación 08 2013','Estimados, esta comunicación es con el motivo de informarles que la próxima semana se hará una reunión sobre acreditación en el auditorio EUCLIDES JARAMILLO a las 8am.','2','4',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('110','FIRMAR MEMORANDO XYZ','MEMORANDO XYZ CAJA.','12','5',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('111','COMUNICACIÓN INTERNA','UNIQUINDIO','12','5',NULL,'SI','Comunicacion interna','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('112','SIN INTERNET','LABORATORIO X SIN INTERNET....','12','2',NULL,'SI','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('113','LABORATORIO PRÉSTAMO','CONTENIDO LABORATORIO.<div>1.&nbsp;</div><div>2.</div><div>3. &lt;--&gt;</div>','12','5',NULL,'SI','Comunicacion interna','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('114','VIERNES','bla bla bla','12','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('115','ANEXO','CONTENIDO ANEXO','12','2',NULL,'SI','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('116','expeidnete','contenido','12','2',NULL,'NO','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('117','EXPEDIENTE','CONTENIDO','12','5',NULL,'SI','Comunicacion interna','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('118','registros','lista estudiantes','12','2',NULL,'SI','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('119','PRUEBA 26 FEBRERO','Hola, este es el contenido del memorando ok<div>Bla.</div>','12','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('12','Comunicación 12','Hola, ingelec mañana habrá una jornada de integración a las 5pm. Canchas uq.','2','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('120','mensaje con anexo','leer anexo.','12','6',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('121','expediente prueba','contenido','12','2',NULL,'SI','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('122','ok','okay','12','4',NULL,'SI','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('123','XD','XD','12','4',NULL,'SI','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('124','Comunicacion interna','contenido','12','6',NULL,'SI','Comunicacion interna','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('125','sda','sadasd','12','2',NULL,'NO','Comunicacion interna','2','Patricia Gonzales; ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('126','sd','sd','12','4',NULL,'SI','Memorando','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('127','ddsd','asdasd','12','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('128','ds','asdd','12','2',NULL,'NO','Comunicacion interna','2','Gloria Gomez');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('129','asd','asd','12','4',NULL,'SI','Mensaje','2','Luis Eduardo Sepulveda; Juan Pablo Giraldo; ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('13','Asunto 8 Enero','Ingresar Contenido.','12','5',NULL,'SI','Memorando','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('130','asd','asdasd','12','4',NULL,'SI','Comunicacion interna','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('131','Asunto con anexo','Aaaaaaaaaaaaaaaaaaaaaa','12','2',NULL,'NO','Memorando','2','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('132','sad','sd','12','2',NULL,'SI','Comunicacion interna','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('133','asd','asd','12','5',NULL,'SI','Mensaje','3','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('134','asd','sadsd','12','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('135','EL ASUNTO','EL CONTENIDO','12','4',NULL,'SI','Mensaje','2','Luis Eduardo Sepulveda; Juan Pablo Giraldo; Patricia Gonzales; ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('136','EL ASUNTO','dsasd','12','2',NULL,'NO','Mensaje','2','Gloria Gomez');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('137','ASUNTO','com','12','5',NULL,'SI','Comunicacion interna','3','Luis Eduardo Sepulveda; Gloria Gomez y otros');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('138','asiu','s','12','2',NULL,'SI','Circular','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('139','EL ASUNTO','LLLLA','12','2',NULL,'NO','Circular','2','Ingesis');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('14','Hola','Contenido Enero. Semestre 1.','2','4',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('140','anexo','del','12','2',NULL,'SI','Memorando','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('141','ANEXO','content','12','2',NULL,'SI','Comunicacion interna','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('142','Tarea 28 Febrero 2013','Desarrollo de la comunicación..','12','2',NULL,'SI','Memorando','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('143','asunto con anexo','tiene anexo. Leer.','12','4',NULL,'SI','Comunicacion interna','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('144','ok Leído','ok','12','5',NULL,'SI','Comunicacion interna','3','Gloria Gomez');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('145','adas','sdfsdf','12','2',NULL,'NO','Comunicacion interna','2','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('146','asas','asdasd','12','2',NULL,'NO','Comunicacion interna','2','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('147','aseunto','asas','12','2',NULL,'SI','Comunicacion interna','2','Gloria Gomez');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('148','Asunto comunicación interna prueba','contenido','12','5',NULL,'SI','Comunicacion interna','3','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('149','Asunto comunicación','conte','12','5',NULL,'SI','Comunicacion interna','3','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('15','Directores','Hola, mañana hay una reunión a las 7:45 am. Lo esperamos.','1','5',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('150','as','asd','12','4',NULL,'SI','Comunicacion interna','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('151','anexo','cont','12','4',NULL,'SI','Comunicacion interna','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('152','sin anexo','ascd','12','4',NULL,'SI','Comunicacion interna','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('153','asunto','______________________________________________________<div>______________________________________________________</div><div>______________________________________________________</div>','12','2',NULL,'NO','Comunicacion interna','2','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('154','asunto','le','12','2',NULL,'SI','Comunicacion interna','2','Gloria Gomez');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('155','ASUNTO','HOLA TIENE ANEXO PDF DE TAREAS PENDIENTES','12','4',NULL,'SI','Memorando','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('156','anexo comunicación 141','=D','12','2',NULL,'SI','Memorando','2','Gloria Gomez');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('157','tareas pendientes','revisar pdf adjunto','12','2',NULL,'SI','Comunicacion interna','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('158','=D',':(','12','5',NULL,'SI','Memorando','3','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('159','Reingreso','Hola, enviar notas estudiante...','12','4',NULL,'SI','Memorando','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('16','Mensaje','Mirar fecha.','1','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('160','reingreso comunicación interna','hola.','12','4',NULL,'SI','Comunicacion interna','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('161','Reingreso','Reingreso estudiante.','12','5',NULL,'SI','Memorando','3','Gloria Gomez');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('162','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('163','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('164','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('165','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('166','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('167','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('168','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('169','Asunto','Contenido del mensaje','12','4',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('17','Bla Bla Bla','Mensaje.','1','5',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('170','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('171','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('172','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('173','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('174','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('175','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('176','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('177','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('178','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('179','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('18','Mensaje - memorando','Hola<div>este</div><div>es</div><div>un</div><div>memorando. Adiós.&nbsp;</div>','2','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('180','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('181','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('182','Asunto','Contenido del mensaje','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('183','prueba memorando','Contenido&nbsp;<div><br/></div><div><ul><li><span style=\"font-size: 10pt;\">item 1</span></li><li><span style=\"font-size: 10pt;\">item 2</span></li><li><span style=\"font-size: 10pt;\">texto item 3</span></li></ul></div>','12','2',NULL,'SI','Memorando','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('184','Reunión formal','Indicar que mañana todos deben venir en ropa formal para la reunión con consejo superior de la Universidad del Quindío.<div><br/></div><div>Muchas gracias.&nbsp;</div><div><br/></div><div>Fecha: 07/Marzo/2013</div>','12','2',NULL,'SI','Memorando','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('185','ASENTE','.....9D','2','2',NULL,'NO','Memorando','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('186','asunti','comunicacacac','12','2',NULL,'SI','Comunicacion interna','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('187','el asunto eee','certificación&nbsp;','12','2',NULL,'SI','Memorando','2','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('188','ggmez','cntendio','12','2',NULL,'NO','Comunicacion interna','2','Gloria Gomez');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('189','prueba','asas','12','7',NULL,'SI','Comunicacion interna','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('19','Mensaje','Este es el mensaje 10 de ENERO. Adiós.','1','4',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('190','ver anexo','asdd','12','2',NULL,'NO','Circular','2','Ingesis');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('191','lalalalads','jasjashasj','2','2',NULL,'NO','Memorando','2','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('192','Asunto memorando 07/03/2013 tarde','<font size=\"2\">Este es el contenido del memorando.</font><br/><div style=\"font-size: 10pt;\"><ul><li><font face=\"Arial, Verdana\" size=\"2\">Incluir fechas de grados</font></li><li><font face=\"Arial, Verdana\" size=\"2\">Traspaso de estudiantes al exterior.&nbsp;</font></li><li><font face=\"Arial, Verdana\" size=\"2\">Intercambio docentes 2014</font></li><li><font face=\"Arial, Verdana\" size=\"2\">Lista de primíparos&nbsp;</font></li><li><font face=\"Arial, Verdana\" size=\"2\">En fin...</font></li></ul></div>','12','5',NULL,'SI','Memorando','3','Faber Danilo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('193','Hla','asas','12','5',NULL,'SI','Comunicacion interna','3','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('194','asun___','ñasñlñasl','12','6',NULL,'SI','Comunicacion interna','3','Gloria Gomez');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('195','_____________',':D','12','6',NULL,'SI','Comunicacion interna','3','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('196','wwwww','wwwww','12','6',NULL,'SI','Comunicacion interna','3','Gloria Gomez');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('197','dadad','dadad','12','2',NULL,'SI','Comunicacion interna','2','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('198','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('199','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('2','Asunto comunicación','Contenido Comunicación.','2','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('20','Memorando XYZ','Contenido XYZ.','2','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('200','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('201','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('202','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('203','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('204','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('205','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('206','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('207','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('208','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('209','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('21','Asunto','Hola, lo necesitamos urgente.','2','4',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('210','Asunto del memorando prueba','Contenido del memorando ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('211','Asunto','Contenido del mensaje','12','2',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('212','Asunto','Contenido del mensaje','12','2',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('213','Asunto','Contenido del mensaje','12','2',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('214','Asunto','Contenido del mensaje','12','2',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('215','Asunto','Contenido del mensaje','12','2',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('216','Asunto prueba','Conenido&nbsp;<div>1 item 1</div><div>2 item 2</div><div>3 item 3</div><div>4 item 4</div><div>5. item 5</div>','5','2',NULL,'NO','Memorando','2','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('217',NULL,'Agregar contenido de la comunicaciónñ.','12','2',NULL,'NO','Mensaje','2','Luz Adriana Cardona ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('218',NULL,'Ok entendido','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('219',NULL,'Favor adjuntar información de tal CD:','12','4',NULL,'SI','Mensaje','2','Faber Danilo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('22','Necesito Documento X','Requiero el documento X de acreditación.','2','5',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('220',NULL,'CD','12','7',NULL,'NO','Mensaje','2','Luz Adriana Cardona ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('221',NULL,'Gracias.','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('222','El asunto de la comunicación','<font face=\"Arial, Verdana\" size=\"2\">Esta comunicación tiene la finalidad de cumplir tres puntos:</font><div style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal;\"><br/></div><div><ul><li><font face=\"Arial, Verdana\" size=\"2\">Solicitar nuevo video beam para el laboratorio de ingeniería</font></li><li><font face=\"Arial, Verdana\" size=\"2\">Sillas Rimax x 90</font></li><li><font face=\"Arial, Verdana\" size=\"2\">Monitor LED 21\'\' Laboratorio usabilidad.</font></li></ul></div>','12','2',NULL,'SI','Memorando','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('223',NULL,'Adjuntar información acerca de los promedios.','12','2',NULL,'SI','Mensaje','2','Luz Adriana Cardona ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('224',NULL,'_::','12','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('225',NULL,'hola','12','2',NULL,'SI','Mensaje','2','Faber Danilo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('226',NULL,'Ok. :D','12','2',NULL,'SI','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('227',NULL,'Adjuntar Info','12','2',NULL,'SI','Mensaje','2','Faber Danilo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('228',NULL,'Info adjunta.','12','7',NULL,'SI','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('229',NULL,'Gracias.','12','2',NULL,'SI','Mensaje','2','Faber Danilo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('23','Necesito Documento X','Okay.....','2','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('230',NULL,'oka','12','7',NULL,'NO','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('231',NULL,'Faltó el estudiante x.','12','2',NULL,'NO','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('232',NULL,'entendido','12','4',NULL,'SI','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('233',NULL,'¿Qué pasó? &nbsp;la información no ha llegado y la necesito con urgencia para adjuntarla a un archivo que me están pidiendo desde hace rato, sobre promedios del progama','12','2',NULL,'NO','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('234',NULL,'¿?','12','2',NULL,'NO','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('235',NULL,'Aquí está la información:<div>1</div><div>1</div><div>1</div><div>1</div><div>1</div><div>1</div>','12','4',NULL,'SI','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('236',NULL,'Se ve mal el código html en la lista de mensajes.','12','2',NULL,'NO','Mensaje','2','Luz Adriana Cardona ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('237',NULL,'_____-_','12','2',NULL,'NO','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('238',NULL,'Gracias.','12','2',NULL,'SI','Mensaje','2','Faber Danilo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('239','asunto','Holi','12','4',NULL,'NO','Mensaje','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('24','Lista Profesores con doctorado','Hola, requerimos la lista de profesores... bla.','2','4',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('240',NULL,'Indique que es necesario recibir la información de.','12','2',NULL,'NO','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('241','Asunto prueba','Holi','12','2',NULL,'NO','Mensaje','2','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('242','Asunto prueba','mensaje prueba','12','2',NULL,'NO','Mensaje','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('243','RE: null','Entendido','12','2',NULL,'NO','Mensaje','2','Luz Adriana Cardona ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('244','Solicitud información x','x','12','2',NULL,'SI','Mensaje','2','Faber Danilo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('245','Solicitud información x','Infor','12','7',NULL,'SI','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('246','Continuar construcción','hola...','12','2',NULL,'SI','Mensaje','2','Luz Adriana Cardona ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('247','Ensayo mailbox','Ensayo comunicación contenido.<div>Al parecer está bien. \"frase\"</div>','12','4',NULL,'SI','Comunicacion interna','2','Faber Danilo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('248','Adjunta info','Info asjjad','12','2',NULL,'NO','Mensaje','2','Luz Adriana Cardona ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('249','RE: Adjunta info','La info ya está.','12','4',NULL,'NO','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('25','Solicitud Lista mejores promedios año 2012-2','<font face=\"Arial, Verdana\" size=\"2\">Solicitud Lista mejores promedios año 2012-2. Favor enviar en formato excel.</font>','2','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('250','Info de la sala','Sala ifnfo pc, videobeam','12','4',NULL,'SI','Mensaje','2','Faber Danilo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('251','RE: RE: Adjunta info','Completar con la siguiente frase \"frase\"','12','2',NULL,'SI','Mensaje','2','Luz Adriana Cardona ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('252','RE: RE: RE: Adjunta info','Usted la agregó','12','4',NULL,'SI','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('253','RE: RE: RE: Adjunta info','Adjunto','12','2',NULL,'SI','Mensaje','2','Luz Adriana Cardona ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('254','Anexo','pruebas mensaje con anexo','12','2',NULL,'SI','Mensaje','2','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('255','Anexo','Ok entendido anexo la información','12','6',NULL,'SI','Mensaje','3','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('256',NULL,'Adjunto','12','7',NULL,'SI','Mensaje','2','Luis Eduardo Sepulveda');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('257','Ejemplo prueba','Contenido del ejemplo de la comunicación.&nbsp;','12','2',NULL,'SI','Memorando','2','Juan Pablo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('258','msj','prueba','12','2',NULL,'SI','Mensaje','2','Luz Adriana Cardona ');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('259','Adjuntar informaciÃ³n laboratorio','Mensaje prueba','12','2',NULL,'NO','Mensaje','2','Faber Danilo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('26','Promedios','Leí el mensaje, aquí está el documento.','2','6',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('260','información','Adunatr información eñe.','12','5',NULL,'NO','Mensaje','3','Patricia Gonzales');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('261','Mensaje','Ayuda menasje','12','2',NULL,'NO','Mensaje','2','Faber Danilo Giraldo');
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('27','Solicitud préstamo laboratorio ingesis','Solicitud préstamo laboratorio ingesis. Hora: 7-12am. 22 de Enero 2013.','12','5',NULL,'NO','Memorando','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('28','Hola','Prueba.','2','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('29','Leer','Revisar.','2','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('3','Asunto de la comunicación','Contenido comunicación de nuevo&nbsp;','2','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('30','Asunto','Contenido.','2','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('31','Prueba','El contenido.','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('32','nuevo','algo.','1','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('33','Mensaje','Acreditación.','2','5',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('34','Doc','Enviar documento.','2','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('35','Bla Bla Bla','<font face=\"Arial, Verdana\" size=\"2\">bla&nbsp;comunicación.</font>','2','5',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('36','Algo','Prueba.','2','5',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('37','Mensaje','Contenido.','2','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('38','El Asunto','El Contenido.','2','4',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('39','El Asunto','La respuesta.','2','6',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('4','Nuevo mensaje 23 de Febrero de 2013','Hola, esta es una comunicación con el motivo de \"BLA!\".&nbsp;','12','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('40','Otra prueba','Una prueba más.','2','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('41','Promedios','Enviar YA.','2','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('42','Mensaje 12 Enero','Contenido de hoy.','2','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('43','Mensaje 12 Enero','Listo leído.','2','6',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('44','Mensaje 13 Enero','Hola.','2','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('45','Mensaje 13 Enero','Hola, buenos días.','2','5',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('46','Mensaje 13 Enero','Necesito lo siguiente, con copia a la secre.','2','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('47','Memorando 13 enero','<font face=\"Arial, Verdana\" size=\"2\">Solicitud, lista profesores&nbsp;catedráticos&nbsp;contratados periodo 2013-1.</font>','12','6',NULL,'SI','Memorando','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('48','Mensaje solicitud lista x','Lista x.','2','2',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('49','Mensaje solicitud lista x','Lista y.','2','4',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('5','Asunto Nuevo','Contenido nuevo de la comunicación (Memorando)..','12','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('50','Mensaje solicitud lista x','Lista z.','2','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('51','Asunto nuevo','Contenido nuevo','12','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('52','Asunto del memorando','Contenido del memorando...','12','5',NULL,'SI','Memorando','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('53','Asunto del memorando','Contenido del memorando','1','5',NULL,'NO','Memorando','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('54','Asunto del mensaje','Contenido del mensaje','1','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('55','Asunto del mensaje','Contenido del mensaje','1','4',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('56','Asunto del mensaje','Contenido del mensaje','1','3',NULL,'NO','Mensaje','1',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('57','Asunto del mensaje','Contenido del mensaje','1','3',NULL,'NO','Mensaje','1',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('58','Asunto del mensaje','Contenido del mensaje','1','3',NULL,'NO','Mensaje','1',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('59','Asunto del mensaje','Contenido del mensaje','1','3',NULL,'NO','Mensaje','1',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('6','Urgente!!','<font face=\"Arial, Verdana\" size=\"2\">Hola Luis, necesito urgentemente el documento X. Gracias.</font><div><font face=\"Arial, Verdana\" size=\"2\">Espero la&nbsp;respuesta&nbsp;rápidamente.&nbsp;</font></div>','1','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('60','Asunto del mensaje','Contenido del mensaje','1','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('61','Asunto','Contenido del mensaje','1','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('62','Asunto','Contenido del mensaje','1','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('63','Asunto','Contenido del mensaje','1','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('64','Asunto','Contenido del mensaje','1','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('65','Asunto','Contenido del mensaje','1','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('66','Asunto','Contenido del mensaje','1','5',NULL,'NO','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('67','Asunto','Contenido del mensaje','1','5',NULL,'NO','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('68','Asunto','Contenido del mensaje','1','5',NULL,'NO','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('69','Memo prueba anexo','Prueba.','2','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('7','Urgente!!','zxczxczxczxczxczxc','1','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('70','Anexo hola','Mensaje','2','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('71','Anexo hola','Ok leído.&nbsp;','2','6',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('72','xyz','Memorando xyz.','2','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('73','memo','Hola memo.','2','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('74','bd','BASE DE DATOS','12','5',NULL,'SI','Memorando','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('75','Asunto del memorando','Contenido del memorando hola','4','6',NULL,'NO','Memorando','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('76','memommamam','Contenido del memorando prueba____<div>ok jaja</div>','12','5',NULL,'SI','Memorando','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('77','Asunto del memorando prueba','Contenido del memorando prueba.<div><br/></div><div>OKasasa</div>','12','5',NULL,'SI','Memorando','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('78','Asunto del memorando prueba','Contenido del memorando prueba','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('79','Asunto del memorando prueba','Contenido 123','12','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('8','Reunión Profesores','Reunión: 25 Diciembre 2012.<div>Motivo: Integración.</div>','2','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('80','Asunto del memorando prueba','Contenido ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('81','Asunto','Contenido del mensaje','1','5',NULL,'NO','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('82','Asunto','Contenido del mensaje','1','5',NULL,'NO','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('83','Asunto','Contenido del mensaje','1','5',NULL,'NO','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('84','Asunto','Contenido del mensaje','1','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('85','Anex','anexo con contenido.','2','5',NULL,'SI','Mensaje','3',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('86','asunto','contenido.','2','4',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('87','asunto','Contenido comunicación.','2','4',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('88','Asunto de la comunicación 12/02/2013','La siguiente comunicación tiene el fin de solicitar el artículo x del laboratorio Y.','2','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('89','asunto','Contenido comert','2','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('9','Nuevo mensaje','¡Feliz navidad!','1','2',NULL,'SI','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('90','asu','conte234','6','4',NULL,'NO','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('91','Asunto del memorando prueba XL','Contenido ok','12','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('92','Asunto del memorando prueba bla','Contenido jkakjds<div>adasd</div>','12','2',NULL,'SI','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('93','Asunto','Contenido del mensaje','1','4',NULL,'NO','Mensaje','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('94','Asunto del memorando prueba','Contenido ','1','2',NULL,'NO','Memorando','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('95','Asunto del memorando prueba','Contenido ','1','2',NULL,'NO','Comunicacion interna',NULL,NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('96','asunto','comunicacion','12','2',NULL,'NO','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('97','Asunto 19/02/2013 _-','Contenido bla bla bla.<div>bla</div>','12','4',NULL,'SI','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('98',NULL,NULL,'2','2',NULL,'NO','Comunicacion interna','2',NULL);
insert  into `comunicacion`(`idComunicacion`,`asunto`,`contenidoCom`,`estado`,`remitente`,`fecha`,`leido`,`tipo`,`unidadOrganizacional`,`destinatariosCom`) values ('99','Prueba__ /// \\\\\\','Contenido...............<div><br/></div><div>+++</div>','12','2',NULL,'SI','Comunicacion interna','2',NULL);

UNLOCK TABLES;

/*Table structure for table `comunicaciondestinatario` */

CREATE TABLE `comunicaciondestinatario` (
  `idComunicacionDestinatario` varchar(255) NOT NULL,
  `comunicacion` varchar(255) NOT NULL,
  `destinatario` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idComunicacionDestinatario`),
  KEY `FK_comunicacion` (`comunicacion`),
  KEY `FK_destinatario` (`destinatario`),
  CONSTRAINT `FK_comunicacion` FOREIGN KEY (`comunicacion`) REFERENCES `comunicacion` (`idComunicacion`),
  CONSTRAINT `FK_destinatario` FOREIGN KEY (`destinatario`) REFERENCES `contacto` (`idContacto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comunicaciondestinatario` */

LOCK TABLES `comunicaciondestinatario` WRITE;

insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('10','10','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('100','111','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('100000','1','1',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('101','112','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('102','113','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('103','113','4','SI');
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('104','114','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('105','115','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('106','116','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('107','117','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('108','117','4','SI');
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('109','118','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('11','11','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('110','119','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('111','120','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('112','121','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('113','122','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('114','123','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('115','124','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('116','125','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('117','126','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('118','127','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('119','128','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('12','12','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('120','129','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('121','129','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('122','130','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('123','131','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('124','132','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('125','133','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('126','134','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('127','134','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('128','135','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('129','135','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('13','13','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('130','135','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('131','136','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('132','137','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('133','137','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('134','137','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('135','137','5','SI');
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('136','138','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('137','139','1',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('138','140','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('139','141','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('14','14','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('140','142','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('141','143','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('142','144','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('143','145','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('144','146','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('145','147','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('146','148','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('147','149','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('148','150','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('149','151','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('15','15','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('150','152','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('151','153','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('152','153','5','SI');
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('153','154','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('154','155','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('155','156','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('156','157','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('157','158','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('158','159','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('159','160','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('16','16','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('160','160','4','SI');
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('161','161','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('162','162','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('163','163','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('164','169','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('165','183','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('166','184','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('167','185','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('168','186','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('169','187','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('17','17','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('170','188','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('171','189','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('172','190','1',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('173','191','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('174','192','7',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('175','193','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('176','193','2','SI');
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('177','194','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('178','195','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('179','196','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('18','18','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('180','197','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('181','197','5','SI');
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('182','198','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('183','199','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('184','200','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('185','201','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('186','202','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('187','203','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('188','204','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('189','205','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('19','19','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('190','206','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('191','207','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('192','208','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('193','209','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('194','210','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('195','211','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('196','212','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('197','213','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('198','214','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('199','215','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('2','2','1',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('20','20','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('200','215','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('201','216','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('202','217','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('203','218','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('204','219','7',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('205','220','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('206','221','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('207','222','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('208','223','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('209','224','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('21','21','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('210','225','7',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('211','226','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('212','227','7',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('213','228','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('214','229','7',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('215','230','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('216','231','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('217','232','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('218','233','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('219','234','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('22','22','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('220','235','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('221','236','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('222','237','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('223','238','7',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('224','239','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('225','240','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('226','241','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('227','242','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('228','243','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('229','244','7',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('23','23','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('230','245','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('231','246','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('232','247','7',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('233','248','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('234','249','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('235','250','7',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('236','251','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('237','252','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('238','253','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('239','254','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('24','24','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('240','255','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('241','256','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('242','257','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('243','258','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('244','259','7',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('245','260','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('246','261','7',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('25','25','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('26','26','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('27','27','1',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('28','28','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('29','29','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('3','3','1',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('30','30','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('31','31','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('32','32','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('33','33','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('34','34','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('35','35','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('36','36','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('37','37','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('38','38','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('39','39','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('4','4','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('40','40','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('41','41','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('42','42','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('43','43','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('44','44','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('45','45','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('46','46','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('47','46','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('48','47','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('49','48','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('5','5','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('50','49','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('51','50','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('52','51','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('53','52','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('54','53','3',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('55','54','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('56','54','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('57','55','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('58','55','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('59','56','1',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('6','6','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('60','57','1',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('61','57','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('62','58','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('63','59','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('64','60','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('65','60','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('66','69','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('67','70','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('68','71','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('69','72','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('7','7','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('70','73','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('71','74','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('72','75','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('73','76','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('74','77','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('75','78','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('76','79','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('77','80','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('78','85','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('79','86','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('8','8','1',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('80','87','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('81','88','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('82','89','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('83','90','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('84','91','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('85','92','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('86','97','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('87','99','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('88','100','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('89','101','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('9','9','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('90','102','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('91','102','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('92','103','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('93','104','4',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('94','104','2',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('95','107','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('96','108','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('97','108','6',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('98','109','5',NULL);
insert  into `comunicaciondestinatario`(`idComunicacionDestinatario`,`comunicacion`,`destinatario`,`cc`) values ('99','110','2',NULL);

UNLOCK TABLES;

/*Table structure for table `contacto` */

CREATE TABLE `contacto` (
  `idContacto` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `directorio` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idContacto`),
  KEY `FK_contacto` (`directorio`),
  KEY `FK_contactod` (`direccion`),
  CONSTRAINT `FK_contacto` FOREIGN KEY (`directorio`) REFERENCES `directorio` (`idDirectorio`),
  CONSTRAINT `FK_contactod` FOREIGN KEY (`direccion`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contacto` */

LOCK TABLES `contacto` WRITE;

insert  into `contacto`(`idContacto`,`nombre`,`email`,`telefono`,`direccion`,`directorio`,`username`,`password`,`descripcion`) values ('1','Ingesis','ingesis@uniquindio.edu.co','7451100','1','2','ingesis','123456','Programa Ingeniería de Sistemas');
insert  into `contacto`(`idContacto`,`nombre`,`email`,`telefono`,`direccion`,`directorio`,`username`,`password`,`descripcion`) values ('2','Luis Eduardo Sepulveda','lesepulveda@uniquindio.edu.co','3125342109','1','2','lesepulveda','12345','Director Ingeniería de Sistemas');
insert  into `contacto`(`idContacto`,`nombre`,`email`,`telefono`,`direccion`,`directorio`,`username`,`password`,`descripcion`) values ('3','Pepito Perez','peperez@uniquindio.edu.co','201','1','2','pperez','123456','Administrador');
insert  into `contacto`(`idContacto`,`nombre`,`email`,`telefono`,`direccion`,`directorio`,`username`,`password`,`descripcion`) values ('4','Luz Adriana Cardona ','lacardona@uniquindio.edu.co','7458912',NULL,NULL,'lacardona','lacardona','Secretaria Ingesis');
insert  into `contacto`(`idContacto`,`nombre`,`email`,`telefono`,`direccion`,`directorio`,`username`,`password`,`descripcion`) values ('5','Juan Pablo Giraldo','jpgiraldo@uniquindio.edu.co','7459814',NULL,NULL,'jpgiraldo','123456','Director ingelec');
insert  into `contacto`(`idContacto`,`nombre`,`email`,`telefono`,`direccion`,`directorio`,`username`,`password`,`descripcion`) values ('6','Patricia Gonzales','pgonzales@uniquindio.edu.co','7459610',NULL,NULL,'pgonzales','987654','Secretaria Ingeniería Electrónica');
insert  into `contacto`(`idContacto`,`nombre`,`email`,`telefono`,`direccion`,`directorio`,`username`,`password`,`descripcion`) values ('7','Faber Danilo Giraldo','fdgiraldo@uniquindio.edu.co',NULL,'1','2','fdgiraldo','fdgiraldo','Administrador Laboratorio Ingeniería de Sistemas');

UNLOCK TABLES;

/*Table structure for table `contactoquien` */

CREATE TABLE `contactoquien` (
  `idContactoQuien` varchar(255) NOT NULL,
  `contacto` varchar(255) NOT NULL,
  `quien` varchar(255) NOT NULL,
  PRIMARY KEY (`idContactoQuien`),
  KEY `FK_contactoq` (`contacto`),
  KEY `FK_quienc` (`quien`),
  CONSTRAINT `FK_contactoq` FOREIGN KEY (`contacto`) REFERENCES `contacto` (`idContacto`),
  CONSTRAINT `FK_quienc` FOREIGN KEY (`quien`) REFERENCES `quien` (`idQuien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contactoquien` */

LOCK TABLES `contactoquien` WRITE;

insert  into `contactoquien`(`idContactoQuien`,`contacto`,`quien`) values ('1','2','6');
insert  into `contactoquien`(`idContactoQuien`,`contacto`,`quien`) values ('2','3','9');
insert  into `contactoquien`(`idContactoQuien`,`contacto`,`quien`) values ('3','4','10');
insert  into `contactoquien`(`idContactoQuien`,`contacto`,`quien`) values ('4','5','18475320');
insert  into `contactoquien`(`idContactoQuien`,`contacto`,`quien`) values ('5','1','2');
insert  into `contactoquien`(`idContactoQuien`,`contacto`,`quien`) values ('6','6','11');
insert  into `contactoquien`(`idContactoQuien`,`contacto`,`quien`) values ('7','7','18');

UNLOCK TABLES;

/*Table structure for table `contenido` */

CREATE TABLE `contenido` (
  `idContenido` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `documento` varchar(255) NOT NULL,
  PRIMARY KEY (`idContenido`),
  KEY `FK_contenido` (`documento`),
  CONSTRAINT `FK_contenido` FOREIGN KEY (`documento`) REFERENCES `documento` (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contenido` */

LOCK TABLES `contenido` WRITE;

UNLOCK TABLES;

/*Table structure for table `conversacion` */

CREATE TABLE `conversacion` (
  `idConversacion` varchar(255) NOT NULL,
  `comunicacion` varchar(255) DEFAULT NULL,
  `nombreContacto` varchar(255) DEFAULT NULL,
  `asunto` varchar(255) DEFAULT NULL,
  `fechaConversacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idConversacion`),
  KEY `FK_conversacion` (`comunicacion`),
  CONSTRAINT `FK_conversacion` FOREIGN KEY (`comunicacion`) REFERENCES `comunicacion` (`idComunicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `conversacion` */

LOCK TABLES `conversacion` WRITE;

insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('1',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('10',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('11',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('12',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('13',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('14',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('15',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('16',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('17',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('18',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('19',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('2',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('20',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('21',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('22',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('23',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('24',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('25',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('26',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('27',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('28',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('29',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('3',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('30',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('31',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('32',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('33',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('34',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('35',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('36',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('37',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('38','216','Luis Eduardo Sepulveda; ',NULL,'09/04/2013 14:57:15');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('39','216','Luz Adriana Cardona ; ','Asunto prueba','12/04/2013 14:50:25');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('4',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('40','222','Luz Adriana Cardona  y Luis Eduardo Sepulveda','asunto','12/04/2013 12:16:01');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('41','216','Faber Danilo Giraldo y Luis Eduardo Sepulveda','Asunto prueba','09/04/2013 18:15:23');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('42','222','Faber Danilo Giraldo y Luis Eduardo Sepulveda','asunto','12/04/2013 11:39:38');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('43','222','Juan Pablo Giraldo y Luz Adriana Cardona ','asunto','12/04/2013 11:43:10');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('44','216','Patricia Gonzales y Luis Eduardo Sepulveda','Asunto prueba','12/04/2013 13:24:42');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('45','216','Juan Pablo Giraldo y Luis Eduardo Sepulveda','Asunto prueba','12/04/2013 13:36:16');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('46','210','Faber Danilo Giraldo y Luis Eduardo Sepulveda','Solicitud información x','12/04/2013 14:50:53');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('47','210','Luz Adriana Cardona  y Luis Eduardo Sepulveda','Continuar construcción','12/04/2013 15:00:05');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('48','247','Luz Adriana Cardona  y Luis Eduardo Sepulveda','Adjunta info','12/04/2013 16:44:50');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('49','247','Faber Danilo Giraldo y Luz Adriana Cardona ','Info de la sala','12/04/2013 16:41:40');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('5',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('50','210','Patricia Gonzales y Luis Eduardo Sepulveda','Anexo','14/04/2013 11:21:54');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('51',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('52','107','Faber Danilo Giraldo y Luis Eduardo Sepulveda','Adjuntar informaciÃ³n laboratorio','19/04/2013 12:31:06');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('53','75','Patricia Gonzales y Juan Pablo Giraldo','información','19/04/2013 12:36:34');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('54','191','Faber Danilo Giraldo y Luis Eduardo Sepulveda','Mensaje','19/04/2013 12:51:26');
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('6',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('7',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('8',NULL,NULL,NULL,NULL);
insert  into `conversacion`(`idConversacion`,`comunicacion`,`nombreContacto`,`asunto`,`fechaConversacion`) values ('9',NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `copia` */

CREATE TABLE `copia` (
  `idCopia` varchar(255) NOT NULL,
  `formato` varchar(255) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `deposito` varchar(255) NOT NULL,
  PRIMARY KEY (`idCopia`),
  KEY `FK_copiad` (`deposito`),
  KEY `FK_copiap` (`producto`),
  CONSTRAINT `FK_copiad` FOREIGN KEY (`deposito`) REFERENCES `deposito` (`idDeposito`),
  CONSTRAINT `FK_copiap` FOREIGN KEY (`producto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `copia` */

LOCK TABLES `copia` WRITE;

UNLOCK TABLES;

/*Table structure for table `deposito` */

CREATE TABLE `deposito` (
  `idDeposito` varchar(255) NOT NULL,
  `unidadOrganizacional` varchar(255) NOT NULL,
  `deposito` varchar(255) NOT NULL,
  PRIMARY KEY (`idDeposito`),
  KEY `FK_deposito` (`deposito`),
  KEY `FK_dunidadorg` (`unidadOrganizacional`),
  CONSTRAINT `FK_deposito` FOREIGN KEY (`deposito`) REFERENCES `deposito` (`idDeposito`),
  CONSTRAINT `FK_dunidadorg` FOREIGN KEY (`unidadOrganizacional`) REFERENCES `unidadorganizacional` (`idUnidadOrganizacional`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deposito` */

LOCK TABLES `deposito` WRITE;

UNLOCK TABLES;

/*Table structure for table `direccion` */

CREATE TABLE `direccion` (
  `id_direccion` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `FK_ciudad` (`ciudad`),
  CONSTRAINT `FK_ciudad` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`idCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `direccion` */

LOCK TABLES `direccion` WRITE;

insert  into `direccion`(`id_direccion`,`direccion`,`ciudad`) values ('1','Carrera 15 Calle 12 Norte','1');
insert  into `direccion`(`id_direccion`,`direccion`,`ciudad`) values ('2','Carrera 15 Calle 12 Norte - Bloque Administrativo','1');
insert  into `direccion`(`id_direccion`,`direccion`,`ciudad`) values ('3','Carrera 15 Calle 12 Norte - Bloque Ingeniería','1');

UNLOCK TABLES;

/*Table structure for table `directorio` */

CREATE TABLE `directorio` (
  `idDirectorio` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`idDirectorio`),
  CONSTRAINT `FK_directorio` FOREIGN KEY (`idDirectorio`) REFERENCES `paquete` (`idPaquete`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `directorio` */

LOCK TABLES `directorio` WRITE;

insert  into `directorio`(`idDirectorio`,`descripcion`) values ('2','Directorio Uniquindio');

UNLOCK TABLES;

/*Table structure for table `disco` */

CREATE TABLE `disco` (
  `idDisco` varchar(255) NOT NULL,
  `referencia` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`idDisco`),
  CONSTRAINT `FK_disco` FOREIGN KEY (`idDisco`) REFERENCES `deposito` (`idDeposito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `disco` */

LOCK TABLES `disco` WRITE;

UNLOCK TABLES;

/*Table structure for table `documento` */

CREATE TABLE `documento` (
  `idDocumento` varchar(255) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `edicion` varchar(255) DEFAULT NULL,
  `vigencia` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `documentobase` varchar(255) DEFAULT NULL,
  `orientacion` varchar(255) DEFAULT NULL,
  `tipoDocumento` varchar(255) DEFAULT NULL,
  `tabladeretenciondocumental` varchar(255) DEFAULT NULL,
  `fechaCreacion` varchar(255) DEFAULT NULL,
  `anexo` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `comentarios` text,
  PRIMARY KEY (`idDocumento`),
  KEY `FK_documentobase` (`documentobase`),
  KEY `FK_documentoori` (`orientacion`),
  KEY `FK_documentotipo` (`tipoDocumento`),
  KEY `FK_documentotablar` (`tabladeretenciondocumental`),
  CONSTRAINT `FK_documentobase` FOREIGN KEY (`documentobase`) REFERENCES `documento` (`idDocumento`),
  CONSTRAINT `FK_documentoori` FOREIGN KEY (`orientacion`) REFERENCES `orientacion` (`idOrientacion`),
  CONSTRAINT `FK_documentotablar` FOREIGN KEY (`tabladeretenciondocumental`) REFERENCES `tablaretenciondocumental` (`idTabla`),
  CONSTRAINT `FK_documentotipo` FOREIGN KEY (`tipoDocumento`) REFERENCES `tipodocumento` (`idTipoDoc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `documento` */

LOCK TABLES `documento` WRITE;

insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('1','memorandoTitulo',NULL,NULL,'17/12/2012',NULL,NULL,NULL,NULL,NULL,'14/12/2012 11:45:41',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'08/01/2013 13:12:40',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('100',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'23/02/2013 14:01:48','C:/glassfish/glassfishv3/glassfish/temporal/487810_10151457134602764_694976748_n.jpg','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/02/2013 14:57:58',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/02/2013 15:09:18',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/02/2013 15:25:53','C:/glassfish/glassfishv3/glassfish/temporal/componentes faces.txt','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('104',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/02/2013 15:26:47','C:/glassfish/glassfishv3/glassfish/temporal/componentes faces.txt','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/02/2013 18:17:53',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('106',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/02/2013 18:28:07',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('107',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'19/04/2013 12:35:48',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('108',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'23/02/2013 13:06:43',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('109',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 13:49:15',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'08/01/2013 17:21:10',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'21/02/2013 16:54:53',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'21/02/2013 17:14:36',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('112',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/02/2013 12:22:02',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('113',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/02/2013 12:26:23',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('114',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/02/2013 13:07:08',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('115',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'23/02/2013 14:47:06','C:/glassfish/glassfishv3/glassfish/temporal/Business Glossary.docx','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'24/02/2013 10:44:41',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('117',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'24/02/2013 10:51:33',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('118',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'24/02/2013 11:08:03',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('119',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'26/02/2013 18:27:03',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'08/01/2013 20:14:08',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('120',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'26/02/2013 20:11:27','C:/glassfish/glassfishv3/glassfish/temporal/Trabajo Final.pptx','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('121',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 09:20:20',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('122',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 10:31:35',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 10:36:21',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('124',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'27/02/2013 10:43:56',NULL,'Comunciacioninterna','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('125',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 12:25:18',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('126',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 15:39:58',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('127',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 12:53:48','C:/glassfish/glassfishv3/glassfish/temporal/Cocora.doc','Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('128',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 13:01:08',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('129',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 13:01:39',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('13',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 15:42:57',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('130',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 13:02:34',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('131',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'27/02/2013 13:06:49',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('132',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 13:07:25',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('133',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 14:47:24',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('134',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 14:47:47',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('135',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 14:59:49',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('136',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 15:00:38',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('137',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 15:05:26',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('138',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'27/02/2013 21:59:50',NULL,'Circular','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('139',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'27/02/2013 22:05:40',NULL,'Circular',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09/01/2013 16:15:54',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('140',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 14:52:24','C:/glassfish/glassfishv3/glassfish/temporal/6865962876_e01ac2f09d_b.jpg','Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('141',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:04:25','C:/glassfish/glassfishv3/glassfish/temporal/how_to_ububtu2.pdf','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('142',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'28/02/2013 15:12:31','C:/glassfish/glassfishv3/glassfish/temporal/how_to_ububtu2.pdf','Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('143',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:19:51','C:/glassfish/glassfishv3/glassfish/temporal/2205461097398578.pdf','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('144',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:20:31','C:/glassfish/glassfishv3/glassfish/temporal/2205461097398578.pdf','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('145',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:23:23',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('146',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:24:05','C:/glassfish/glassfishv3/glassfish/temporal/IMG_20130127_210123.jpg','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('147',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:24:26','','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('148',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:27:29','C:/glassfish/glassfishv3/glassfish/temporal/recibo (1).pdf','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('149',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:27:47','','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09/01/2013 14:16:56',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('150',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:29:55',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('151',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:30:35','C:/glassfish/glassfishv3/glassfish/temporal/reporteHorario.pdf','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('152',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:31:00',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('153',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:38:27',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('154',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28/02/2013 15:38:49',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('155',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'02/03/2013 21:11:01',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('156',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'02/03/2013 21:15:34','../../../temporal/comunicacion141.pdf','Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('157',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'02/03/2013 21:16:13','../../../temporal/Tareas Pendientes 20130226.pdf','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('158',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'02/03/2013 21:17:53',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('159',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:14:24',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09/01/2013 14:17:22',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('160',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:15:45',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('161',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'04/03/2013 14:18:36',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('162','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:26:38',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('163','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:27:01',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('164','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:28:42',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('165','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:29:34',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('166','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:30:59',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('167','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:31:39',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('168','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:32:10',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('169',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:44:05',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/01/2013 12:21:01',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('170',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:48:00',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('171',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:48:13',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('172',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:49:03',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('173',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:49:52',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('174',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:51:41',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('175',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:58:56',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('176',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:59:07',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('177',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:59:46',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('178',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 14:59:58',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('179',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 15:00:54',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/01/2013 12:25:37',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('180',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 15:01:04',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 15:01:24',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('182',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'04/03/2013 15:01:35',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('183',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'05/03/2013 14:29:25',NULL,'Memorando',' ');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('184',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'05/03/2013 14:54:11','../../../temporal/Fabric_by_Just_Jeanette.jpg','Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('185',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'12/04/2013 11:40:29',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('186',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 13:05:16',NULL,'Comunciacioninterna','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('187',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 13:07:36',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('188',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'07/03/2013 13:09:53','../../../temporal/fuuuuuu.jpg','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('189',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'07/03/2013 13:10:55','../../../temporal/Pink-Floyd-Pink-Logo.jpg','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/01/2013 12:51:59',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('190',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'07/03/2013 13:12:27','../../../temporal/WLMContacts.csv','Circular',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('191',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 13:50:55','../../../temporal/texto.txt','Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('192',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 14:53:02','../../../temporal/tarjetas-navidad-mensajes.jpg','Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('193',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'07/03/2013 14:56:15','../../../temporal/fuuuuuu.jpg','Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('194',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 15:27:42',NULL,'Comunciacioninterna','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('195',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 15:32:21','../../../temporal/01 001.jpg','Comunciacioninterna','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('196',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 15:38:57',NULL,'Comunciacioninterna','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'07/03/2013 15:38:40',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('198','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 15:33:59',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('199','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 15:36:04',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'15/12/2012 08:52:47',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/01/2013 13:13:08',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('200','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 15:36:21',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('201','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 15:36:36',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('202','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 15:39:29',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('203','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 15:39:39',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('204','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:33:10',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('205','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:33:22',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('206','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:34:43',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('207','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:37:52',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('208','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:38:15',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('209','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:38:49',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/01/2013 13:19:13',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('210','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:39:34',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('211',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:50:33',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:51:24',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('213',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:52:45',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:53:28',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('215',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/03/2013 16:53:49',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('216',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'21/04/2013 10:14:05',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('217',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09/04/2013 11:00:06',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('218',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09/04/2013 14:57:15',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('219',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09/04/2013 15:00:20',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/01/2013 13:48:50',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('220',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09/04/2013 15:03:56','../../../temporal/formato_hoja_vida_2013.doc','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('221',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09/04/2013 15:09:28',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('222',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'12/04/2013 12:46:11',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('223',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09/04/2013 16:10:23',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('224',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09/04/2013 16:11:39',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('225',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09/04/2013 18:15:23',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('226',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/04/2013 14:10:02',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('227',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/04/2013 14:11:37',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('228',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/04/2013 14:12:39','../../../temporal/AC201225663513.pdf','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('229',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/04/2013 14:17:50',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/01/2013 14:17:12',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('230',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/04/2013 14:18:57',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('231',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/04/2013 14:37:27',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('232',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/04/2013 14:38:27',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('233',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/04/2013 14:40:09',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/04/2013 14:50:56',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('235',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/04/2013 14:51:40',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('236',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 10:03:48',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('237',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 10:08:43',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('238',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 11:39:38',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('239',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 11:43:10',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/01/2013 14:35:38',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('240',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 12:16:01',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('241',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 13:24:42',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('242',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 13:36:17',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('243',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 14:50:26',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('244',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 14:50:54',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('245',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 14:51:18',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('246',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 15:00:05',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('247',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'12/04/2013 16:45:48',NULL,'Comunciacioninterna','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('248',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 15:15:42',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('249',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 16:41:00',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/01/2013 21:57:15',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('250',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 16:41:40',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('251',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 16:43:18',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('252',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/04/2013 16:44:50',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('253',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'14/04/2013 11:00:53','../../../temporal/Blinds.jpg','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('254',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'14/04/2013 11:21:54','../../../temporal/tumblr_mb66ikaWvm1rvnx3lo1_500.jpg','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('255',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'14/04/2013 11:24:56','../../../temporal/consultaReporte.txt','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('256',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'14/04/2013 11:45:07','../../../temporal/Prevalencia_ortogonal.docx','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('257',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18/04/2013 11:39:59',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('258',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18/04/2013 11:42:28','../../../temporal/Modelos De Datos De La Forma 20130405.pdf','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('259',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/04/2013 12:31:06',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10/01/2013 21:58:50',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('260',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/04/2013 12:36:34',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('261',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/04/2013 12:51:26',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('27',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'05/03/2013 15:12:37',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 10:09:20',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 11:43:43',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'15/12/2012 10:41:01',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 11:48:14',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 11:50:53',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 11:53:35',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 12:01:30',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 12:08:47',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 12:20:56',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 12:31:32',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 21:28:52',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 21:31:05',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 21:33:30',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('4',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'23/02/2013 14:31:56',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/01/2013 23:28:51',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/01/2013 12:11:36',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/01/2013 14:27:39',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/01/2013 14:28:19',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13/01/2013 11:29:18',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13/01/2013 11:30:31',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13/01/2013 11:31:38',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('47',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'23/02/2013 14:13:00',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13/01/2013 11:51:33',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13/01/2013 11:52:13',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('5',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 15:41:08',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13/01/2013 11:56:47',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('51','tituloMemorando',NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'23/02/2013 14:11:07',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('52','tituloMemorando',NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 14:48:42',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('53','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 15:41:54',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 15:47:39',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:18:47',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:20:24',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:20:49',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:22:42',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:25:02',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'24/12/2012 11:41:24',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('60',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:31:39',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('61',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:33:32',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('62',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:35:19',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('63',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:36:15',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('64',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:38:28',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('65',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:39:32',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('66',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:39:52',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('67',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:40:51',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('68',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/01/2013 18:41:39',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('69',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'21/01/2013 16:03:37','C:/tmp/palabraClave.txt','Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'24/12/2012 13:09:53',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('70',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'21/01/2013 16:47:23','C:/tmp/anexo.txt','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'21/01/2013 16:48:52','C:/tmp/anexo.txt','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'21/01/2013 16:57:02',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('73',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/01/2013 10:41:16',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('74',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'23/02/2013 13:07:50','C:/glassfish/glassfishv3/glassfish/temporal/sysinfo.sql','Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('75','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/01/2013 11:17:50',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('76','tituloMemorandoP',NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 15:26:07',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('77','tituloMemorandoP',NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 15:23:27',NULL,'Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('78','tituloMemorandoP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/01/2013 12:02:55',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('79','tituloMemorando',NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'26/02/2013 19:15:10','C:/glassfish/glassfishv3/glassfish/temporal/notas_introduccion.xls','Memorando','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'24/12/2012 14:14:24',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('80','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/01/2013 12:05:45',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('81',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/01/2013 12:16:45',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('82',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/01/2013 12:18:03',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('83',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/01/2013 12:18:21',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('84',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/01/2013 12:19:50',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('85',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'22/01/2013 13:00:04','C:/glassfish/glassfishv3/glassfish/temporal/anexo.txt','Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('86',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11/02/2013 18:08:42',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('87',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/02/2013 14:29:23',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('88',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'12/02/2013 14:45:51',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('89',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'13/02/2013 15:23:42',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'25/12/2012 17:45:16',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('90',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'13/02/2013 15:27:44',NULL,'Circular',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('91','tituloMemorando',NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'26/02/2013 19:11:42',NULL,'Memorando','Corregir');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('92','tituloMemorando',NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'23/02/2013 14:19:50',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('93',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'17/02/2013 20:15:44',NULL,'Mensaje',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('94','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'17/02/2013 20:19:20',NULL,'Memorando',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('95','tituloMemorando',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18/02/2013 18:56:15',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('96',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 15:25:09',NULL,'Comunciacioninterna','');
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('97',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'21/02/2013 17:17:19',NULL,'Comunciacioninterna',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('98',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'19/02/2013 09:13:03',NULL,'Circular',NULL);
insert  into `documento`(`idDocumento`,`titulo`,`descripcion`,`edicion`,`vigencia`,`estado`,`documentobase`,`orientacion`,`tipoDocumento`,`tabladeretenciondocumental`,`fechaCreacion`,`anexo`,`tipo`,`comentarios`) values ('99',NULL,NULL,NULL,NULL,'NO',NULL,NULL,NULL,NULL,'07/03/2013 13:49:02',NULL,'Comunciacioninterna','');

UNLOCK TABLES;

/*Table structure for table `edificio` */

CREATE TABLE `edificio` (
  `idEdificio` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  PRIMARY KEY (`idEdificio`),
  KEY `FK_direccion` (`direccion`),
  CONSTRAINT `FK_direccion` FOREIGN KEY (`direccion`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `edificio` */

LOCK TABLES `edificio` WRITE;

insert  into `edificio`(`idEdificio`,`direccion`) values ('99','1');
insert  into `edificio`(`idEdificio`,`direccion`) values ('2','2');
insert  into `edificio`(`idEdificio`,`direccion`) values ('3','3');

UNLOCK TABLES;

/*Table structure for table `estadoactividad` */

CREATE TABLE `estadoactividad` (
  `idEstadoActividad` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idEstadoActividad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `estadoactividad` */

LOCK TABLES `estadoactividad` WRITE;

insert  into `estadoactividad`(`idEstadoActividad`,`estado`,`descripcion`) values ('1','Iniciada','Iniciada');
insert  into `estadoactividad`(`idEstadoActividad`,`estado`,`descripcion`) values ('2','Pospuesta','Pospuesta');
insert  into `estadoactividad`(`idEstadoActividad`,`estado`,`descripcion`) values ('3','Cerrada','cerrada');
insert  into `estadoactividad`(`idEstadoActividad`,`estado`,`descripcion`) values ('4','Cancelada','Cancelada');
insert  into `estadoactividad`(`idEstadoActividad`,`estado`,`descripcion`) values ('5','More info','More info');
insert  into `estadoactividad`(`idEstadoActividad`,`estado`,`descripcion`) values ('6','Abierta','Abierta');

UNLOCK TABLES;

/*Table structure for table `estadocomunicacion` */

CREATE TABLE `estadocomunicacion` (
  `idEstadoComunicacion` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idEstadoComunicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `estadocomunicacion` */

LOCK TABLES `estadocomunicacion` WRITE;

insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('1','Registrado','Registrado');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('10','En Redaccion','en redacción');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('11','En Elaboracion','En Elaboración');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('12','Enviado','Enviado');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('13','Archivado','Archivado');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('14','Redactado','Redactado');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('2','Aprobado','Aprobado');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('3','Expirado','Expirado');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('4','Elaborado','Elaborado');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('5','Construido','Construido');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('6','Identificado','Identificacion');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('7','Construido Aprobado','Construido Aprobado');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('8','Construido Rechazado','Construido Rechazado');
insert  into `estadocomunicacion`(`idEstadoComunicacion`,`estado`,`descripcion`) values ('9','En Construccion','En construcción');

UNLOCK TABLES;

/*Table structure for table `expediente` */

CREATE TABLE `expediente` (
  `idExpediente` varchar(255) NOT NULL,
  `asunto` varchar(255) DEFAULT NULL,
  `fechaCreacion` varchar(255) DEFAULT NULL,
  `expediente` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idExpediente`),
  KEY `FK_expedienteE` (`expediente`),
  CONSTRAINT `FK_expedienteE` FOREIGN KEY (`expediente`) REFERENCES `expediente` (`idExpediente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `expediente` */

LOCK TABLES `expediente` WRITE;

insert  into `expediente`(`idExpediente`,`asunto`,`fechaCreacion`,`expediente`) values ('1','Seleccionar expediente','19/02/2013 16:55:13',NULL);
insert  into `expediente`(`idExpediente`,`asunto`,`fechaCreacion`,`expediente`) values ('10','Intercambio','07/03/2013 14:59:25',NULL);
insert  into `expediente`(`idExpediente`,`asunto`,`fechaCreacion`,`expediente`) values ('11','pares académicos','12/04/2013 13:07:55',NULL);
insert  into `expediente`(`idExpediente`,`asunto`,`fechaCreacion`,`expediente`) values ('2','Registros 20131','24/02/2013 10:29:42',NULL);
insert  into `expediente`(`idExpediente`,`asunto`,`fechaCreacion`,`expediente`) values ('3','Visita pares 20122','24/02/2013 10:30:49',NULL);
insert  into `expediente`(`idExpediente`,`asunto`,`fechaCreacion`,`expediente`) values ('4','Expediente 2','24/02/2013 10:42:51',NULL);
insert  into `expediente`(`idExpediente`,`asunto`,`fechaCreacion`,`expediente`) values ('5','Documentos autoevaluación','27/02/2013 09:43:03','3');
insert  into `expediente`(`idExpediente`,`asunto`,`fechaCreacion`,`expediente`) values ('6','exp','28/02/2013 15:07:26',NULL);
insert  into `expediente`(`idExpediente`,`asunto`,`fechaCreacion`,`expediente`) values ('7','pxe','28/02/2013 15:07:41','6');
insert  into `expediente`(`idExpediente`,`asunto`,`fechaCreacion`,`expediente`) values ('8','Expediente','04/03/2013 14:13:27',NULL);
insert  into `expediente`(`idExpediente`,`asunto`,`fechaCreacion`,`expediente`) values ('9','Reingreso 1098564123','04/03/2013 14:13:48','8');

UNLOCK TABLES;

/*Table structure for table `expedientedocumento` */

CREATE TABLE `expedientedocumento` (
  `idExpDoc` varchar(255) NOT NULL,
  `expediente` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idExpDoc`),
  KEY `FK_expediente` (`expediente`),
  KEY `FK_expedientedocumento` (`documento`),
  CONSTRAINT `FK_expediente` FOREIGN KEY (`expediente`) REFERENCES `expediente` (`idExpediente`),
  CONSTRAINT `FK_expedientedocumento` FOREIGN KEY (`documento`) REFERENCES `documento` (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `expedientedocumento` */

LOCK TABLES `expedientedocumento` WRITE;

insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('1','1','108');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('10','1','122');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('11','2','137');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('12','5','143');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('13','5','144');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('14','3','145');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('15','9','160');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('16','9','161');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('17','2','186');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('18','8','192');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('19','7','194');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('2','1','111');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('20','9','195');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('21','2','197');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('22','5','222');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('23','10','257');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('3','1','112');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('4','1','113');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('5','1','115');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('6','1','116');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('7','1','117');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('8','3','118');
insert  into `expedientedocumento`(`idExpDoc`,`expediente`,`documento`) values ('9','3','121');

UNLOCK TABLES;

/*Table structure for table `fecha` */

CREATE TABLE `fecha` (
  `idFecha` varchar(255) NOT NULL,
  `dia` varchar(4) NOT NULL,
  `mes` varchar(20) NOT NULL,
  `anio` varchar(4) NOT NULL,
  PRIMARY KEY (`idFecha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fecha` */

LOCK TABLES `fecha` WRITE;

insert  into `fecha`(`idFecha`,`dia`,`mes`,`anio`) values ('1','1','1','2012');
insert  into `fecha`(`idFecha`,`dia`,`mes`,`anio`) values ('2','2','1','2012');
insert  into `fecha`(`idFecha`,`dia`,`mes`,`anio`) values ('3','3','1','2012');
insert  into `fecha`(`idFecha`,`dia`,`mes`,`anio`) values ('357','14','12','2012');
insert  into `fecha`(`idFecha`,`dia`,`mes`,`anio`) values ('358','15','12','2012');
insert  into `fecha`(`idFecha`,`dia`,`mes`,`anio`) values ('4','4','1','2012');

UNLOCK TABLES;

/*Table structure for table `fechacalendario` */

CREATE TABLE `fechacalendario` (
  `idFechaCalendario` varchar(255) NOT NULL,
  `fecha` varchar(255) NOT NULL,
  `calendario` varchar(255) NOT NULL,
  PRIMARY KEY (`idFechaCalendario`),
  KEY `FK_fecha` (`fecha`),
  KEY `FK_fechacalendario` (`calendario`),
  CONSTRAINT `FK_fecha` FOREIGN KEY (`fecha`) REFERENCES `fecha` (`idFecha`),
  CONSTRAINT `FK_fechacalendario` FOREIGN KEY (`calendario`) REFERENCES `calendario` (`idCalendario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fechacalendario` */

LOCK TABLES `fechacalendario` WRITE;

UNLOCK TABLES;

/*Table structure for table `grupo` */

CREATE TABLE `grupo` (
  `idGrupo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grupo` */

LOCK TABLES `grupo` WRITE;

UNLOCK TABLES;

/*Table structure for table `grupocontacto` */

CREATE TABLE `grupocontacto` (
  `idGrupoContacto` varchar(255) NOT NULL,
  `contacto` varchar(255) NOT NULL,
  `grupo` varchar(255) NOT NULL,
  PRIMARY KEY (`idGrupoContacto`),
  KEY `FK_grupocontacto` (`contacto`),
  KEY `FK_grupocontactog` (`grupo`),
  CONSTRAINT `FK_grupocontacto` FOREIGN KEY (`contacto`) REFERENCES `contacto` (`idContacto`),
  CONSTRAINT `FK_grupocontactog` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grupocontacto` */

LOCK TABLES `grupocontacto` WRITE;

UNLOCK TABLES;

/*Table structure for table `guia` */

CREATE TABLE `guia` (
  `idGuia` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`idGuia`),
  CONSTRAINT `FK_guia` FOREIGN KEY (`idGuia`) REFERENCES `documento` (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `guia` */

LOCK TABLES `guia` WRITE;

UNLOCK TABLES;

/*Table structure for table `item` */

CREATE TABLE `item` (
  `idItem` varchar(255) NOT NULL,
  `texto` text NOT NULL,
  `documento` varchar(255) NOT NULL,
  `contenido` varchar(255) NOT NULL,
  `hlnt` varchar(255) NOT NULL,
  PRIMARY KEY (`idItem`),
  KEY `FK_itemcon` (`contenido`),
  KEY `FK_itemdoc` (`documento`),
  CONSTRAINT `FK_itemcon` FOREIGN KEY (`contenido`) REFERENCES `contenido` (`idContenido`),
  CONSTRAINT `FK_itemdoc` FOREIGN KEY (`documento`) REFERENCES `documento` (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `item` */

LOCK TABLES `item` WRITE;

UNLOCK TABLES;

/*Table structure for table `listachequeo` */

CREATE TABLE `listachequeo` (
  `idListaChequeo` varchar(255) NOT NULL,
  `observacion` varchar(255) NOT NULL,
  PRIMARY KEY (`idListaChequeo`),
  CONSTRAINT `FK_listachequeo` FOREIGN KEY (`idListaChequeo`) REFERENCES `documento` (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `listachequeo` */

LOCK TABLES `listachequeo` WRITE;

UNLOCK TABLES;

/*Table structure for table `memorando` */

CREATE TABLE `memorando` (
  `idMemorando` varchar(255) NOT NULL,
  `numeroRadicado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMemorando`),
  CONSTRAINT `FK_memorando` FOREIGN KEY (`idMemorando`) REFERENCES `comunicacion` (`idComunicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `memorando` */

LOCK TABLES `memorando` WRITE;

insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('1',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('105',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('106',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('107',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('109',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('11',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('114','R114-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('119','R119-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('12',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('126','R126-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('127','R127-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('13',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('131','R131-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('14',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('140','R140-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('142','R142-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('155','R155-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('156','R156-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('158','R158-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('159','R159-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('161','R161-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('162','R162-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('163','R163-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('164','R164-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('165','R165-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('166','R166-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('167','R167-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('168','R168-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('18',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('183','R183-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('184','R184-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('185','R185-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('187','R187-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('191','R191-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('192','R192-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('198','R198-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('199','R199-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('2',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('20',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('200','R200-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('201','R201-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('202','R202-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('203','R203-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('204','R204-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('205','R205-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('206','R206-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('207','R207-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('208','R208-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('209','R209-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('21',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('210','R210-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('216','R216-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('222','R222-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('24',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('25',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('257','R257-13');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('27',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('29',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('3',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('30',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('31',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('32',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('4',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('47',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('5',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('51','19012013451');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('52','19012013452');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('53','19012013452');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('69',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('72',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('73',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('74',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('75','220120134998');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('76','220120134998');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('77','220120134998');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('78','220120130998');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('79','220120130908');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('8',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('80','220120130908');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('87',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('88',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('89',NULL);
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('91','220120130908');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('92','220120130908');
insert  into `memorando`(`idMemorando`,`numeroRadicado`) values ('94','220120130908');

UNLOCK TABLES;

/*Table structure for table `mensaje` */

CREATE TABLE `mensaje` (
  `idMensaje` varchar(255) NOT NULL,
  `respuestaA` varchar(50) DEFAULT NULL,
  `conversacion` varchar(255) NOT NULL,
  PRIMARY KEY (`idMensaje`),
  KEY `FK_mensajeC` (`conversacion`),
  CONSTRAINT `FK_mensaje` FOREIGN KEY (`idMensaje`) REFERENCES `comunicacion` (`idComunicacion`),
  CONSTRAINT `FK_mensajeC` FOREIGN KEY (`conversacion`) REFERENCES `conversacion` (`idConversacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mensaje` */

LOCK TABLES `mensaje` WRITE;

insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('10',NULL,'2');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('101',NULL,'31');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('102','101','31');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('103',NULL,'32');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('104','103','32');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('110',NULL,'33');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('120',NULL,'34');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('129',NULL,'35');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('133',NULL,'36');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('134','133','36');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('135',NULL,'37');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('136','135','37');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('15',NULL,'4');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('16',NULL,'5');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('169',NULL,'33');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('17',NULL,'6');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('170',NULL,'33');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('171',NULL,'33');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('172',NULL,'33');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('173',NULL,'33');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('174',NULL,'33');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('175',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('176',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('177',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('178',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('179',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('180',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('181',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('182',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('19',NULL,'7');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('211',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('212',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('213',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('214',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('215',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('217',NULL,'38');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('218','217','38');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('219',NULL,'39');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('22',NULL,'8');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('220','219','39');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('221','219','39');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('223',NULL,'40');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('224','223','40');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('225',NULL,'41');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('226','223','40');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('227',NULL,'42');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('228','227','42');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('229','228','42');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('23','22','8');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('230','229','42');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('231','226','40');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('232','226','40');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('233','226','40');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('234','226','40');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('235','226','40');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('236','235','40');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('237','236','40');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('238','230','42');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('239',NULL,'43');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('240','237','40');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('241',NULL,'44');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('242',NULL,'45');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('243','221','39');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('244',NULL,'46');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('245','244','46');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('246',NULL,'47');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('248',NULL,'48');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('249','248','48');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('250',NULL,'49');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('251','249','48');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('252','251','48');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('253','252','48');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('254',NULL,'50');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('255','254','50');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('256','225','41');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('258',NULL,'51');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('259',NULL,'52');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('26',NULL,'9');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('260',NULL,'53');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('261',NULL,'54');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('28',NULL,'10');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('33',NULL,'11');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('34',NULL,'12');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('35',NULL,'13');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('36',NULL,'14');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('37',NULL,'16');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('38',NULL,'17');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('39','38','17');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('40',NULL,'18');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('41','26','9');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('42',NULL,'19');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('43','42','19');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('44',NULL,'20');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('45','44','20');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('46','45','20');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('48',NULL,'21');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('49','48','21');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('50','49','21');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('54',NULL,'8');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('55',NULL,'9');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('56',NULL,'9');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('57',NULL,'9');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('58',NULL,'9');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('59',NULL,'8');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('6',NULL,'1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('60',NULL,'22');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('61',NULL,'23');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('62',NULL,'24');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('63',NULL,'25');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('64',NULL,'9');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('65',NULL,'9');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('66',NULL,'9');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('67',NULL,'9');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('68',NULL,'9');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('7','6','1');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('70',NULL,'28');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('71','70','28');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('81',NULL,'8');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('82',NULL,'8');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('83',NULL,'8');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('84',NULL,'8');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('85',NULL,'29');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('86',NULL,'30');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('9',NULL,'3');
insert  into `mensaje`(`idMensaje`,`respuestaA`,`conversacion`) values ('93',NULL,'6');

UNLOCK TABLES;

/*Table structure for table `observacion` */

CREATE TABLE `observacion` (
  `idObservacion` varchar(255) NOT NULL,
  `observacion` text,
  `documento` varchar(255) NOT NULL,
  PRIMARY KEY (`idObservacion`),
  KEY `FK_observacion` (`documento`),
  CONSTRAINT `FK_observacion` FOREIGN KEY (`documento`) REFERENCES `documento` (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `observacion` */

LOCK TABLES `observacion` WRITE;

insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('1','- Corrección ortografía. ','2');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('10','- observación 1','89');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('11','- observación 1','89');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('12','Observación','51');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('13','Observación','51');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('14','- Esta es una observación.','91');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('15','Sin Observaciones','97');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('16','Sin Observaciones','97');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('17','Sin Observaciones','97');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('18','Sin Observaciones','99');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('19','Sin Observaciones','99');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('2','- Cambiar Fecha.\r\n- Cambiar Lugar. ','8');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('20','Sin Observaciones','99');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('21','- Esta es una observación.','91');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('22','Sin Observaciones','100');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('23','- es BASE DE DATOS','74');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('24','','74');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('25','Sin Observaciones','107');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('26','Sin Observaciones','107');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('27','Sin Observaciones','107');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('28','Sin Observaciones','109');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('29','Sin Observaciones','109');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('3','- Asunto: Lista Profesores con doctorado.\r\n- En el contenido deben ir los salarios de cada uno.','24');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('30','Sin Observaciones','109');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('31','Sin Observaciones','92');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('32','Sin Observaciones','92');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('33','Sin Observaciones','4');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('34','Sin Observaciones','4');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('35','Sin Observaciones','4');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('36','Sin Observaciones','4');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('37','Sin Observaciones','4');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('4','- Corregir hora. Agregar fecha','27');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('5','- Completar contenido.','47');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('6','','88');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('7','','88');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('8','','88');
insert  into `observacion`(`idObservacion`,`observacion`,`documento`) values ('9','','88');

UNLOCK TABLES;

/*Table structure for table `orientacion` */

CREATE TABLE `orientacion` (
  `idOrientacion` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idOrientacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orientacion` */

LOCK TABLES `orientacion` WRITE;

UNLOCK TABLES;

/*Table structure for table `palabraclave` */

CREATE TABLE `palabraclave` (
  `idPalabraClave` varchar(255) NOT NULL,
  `palabra` varchar(255) NOT NULL,
  PRIMARY KEY (`idPalabraClave`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `palabraclave` */

LOCK TABLES `palabraclave` WRITE;

insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('1','Ingeniería');
insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('10','Laboratorio');
insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('11','Visita');
insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('12','Presentación');
insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('2','Acreditación');
insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('3','Solicitud');
insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('4','Educacion');
insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('5','Vicerrectoria');
insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('6','Invitacion');
insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('7','Carta');
insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('8','Reingreso');
insert  into `palabraclave`(`idPalabraClave`,`palabra`) values ('9','Lista');

UNLOCK TABLES;

/*Table structure for table `palabradocumento` */

CREATE TABLE `palabradocumento` (
  `idPalabraClaveDocumento` varchar(255) NOT NULL,
  `palabraClave` varchar(255) NOT NULL,
  `documento` varchar(255) NOT NULL,
  PRIMARY KEY (`idPalabraClaveDocumento`),
  KEY `FK_palabraclv` (`palabraClave`),
  KEY `FK_palabradocumento` (`documento`),
  CONSTRAINT `FK_palabraclv` FOREIGN KEY (`palabraClave`) REFERENCES `palabraclave` (`idPalabraClave`),
  CONSTRAINT `FK_palabradocumento` FOREIGN KEY (`documento`) REFERENCES `documento` (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `palabradocumento` */

LOCK TABLES `palabradocumento` WRITE;

insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('1','2','36');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('10','3','101');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('11','3','102');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('12','2','104');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('13','2','108');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('14','3','111');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('15','3','114');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('16','3','119');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('17','2','121');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('18','3','134');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('19','3','161');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('2','1','37');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('20','2','184');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('21','2','192');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('3','1','38');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('4','2','47');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('5','1','70');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('6','1','87');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('7','1','88');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('8','2','89');
insert  into `palabradocumento`(`idPalabraClaveDocumento`,`palabraClave`,`documento`) values ('9','1','99');

UNLOCK TABLES;

/*Table structure for table `paquete` */

CREATE TABLE `paquete` (
  `idPaquete` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPaquete`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `paquete` */

LOCK TABLES `paquete` WRITE;

insert  into `paquete`(`idPaquete`,`nombre`,`tipo`) values ('2','DirectorioUQ','Directorio');
insert  into `paquete`(`idPaquete`,`nombre`,`tipo`) values ('99','Facultad Ingeniería','Edificio');

UNLOCK TABLES;

/*Table structure for table `plantilla` */

CREATE TABLE `plantilla` (
  `idPlantilla` varchar(255) NOT NULL,
  `formato` varchar(255) NOT NULL,
  PRIMARY KEY (`idPlantilla`),
  CONSTRAINT `FK_plantilla` FOREIGN KEY (`idPlantilla`) REFERENCES `documento` (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plantilla` */

LOCK TABLES `plantilla` WRITE;

UNLOCK TABLES;

/*Table structure for table `producto` */

CREATE TABLE `producto` (
  `idProducto` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `ubicacionEnSistema` varchar(255) DEFAULT NULL,
  `documento` varchar(255) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `FK_producto` (`documento`),
  CONSTRAINT `FK_producto` FOREIGN KEY (`documento`) REFERENCES `documento` (`idDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `producto` */

LOCK TABLES `producto` WRITE;

UNLOCK TABLES;

/*Table structure for table `quien` */

CREATE TABLE `quien` (
  `idQuien` varchar(255) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idQuien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quien` */

LOCK TABLES `quien` WRITE;

insert  into `quien`(`idQuien`,`tipo`) values ('1','Unidadorganizacional');
insert  into `quien`(`idQuien`,`tipo`) values ('10','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('11','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('12','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('13','Unidadorganizacional');
insert  into `quien`(`idQuien`,`tipo`) values ('14','Unidadorganizacional');
insert  into `quien`(`idQuien`,`tipo`) values ('15','Unidadorganizacional');
insert  into `quien`(`idQuien`,`tipo`) values ('16','Unidadorganizacional');
insert  into `quien`(`idQuien`,`tipo`) values ('17','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('18','Actor');
insert  into `quien`(`idQuien`,`tipo`) values ('18475320','Actor');
insert  into `quien`(`idQuien`,`tipo`) values ('19','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('2','Unidadorganizacional');
insert  into `quien`(`idQuien`,`tipo`) values ('20','Actor');
insert  into `quien`(`idQuien`,`tipo`) values ('21','Actor');
insert  into `quien`(`idQuien`,`tipo`) values ('22','Actor');
insert  into `quien`(`idQuien`,`tipo`) values ('23','Actor');
insert  into `quien`(`idQuien`,`tipo`) values ('24','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('25','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('26','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('27','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('28','Actor');
insert  into `quien`(`idQuien`,`tipo`) values ('3','Unidadorganizacional');
insert  into `quien`(`idQuien`,`tipo`) values ('4','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('5','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('6','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('7','Actor');
insert  into `quien`(`idQuien`,`tipo`) values ('8','Rol');
insert  into `quien`(`idQuien`,`tipo`) values ('9','Actor');

UNLOCK TABLES;

/*Table structure for table `rol` */

CREATE TABLE `rol` (
  `idRol` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `unidadOrganizacional` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idRol`),
  KEY `FK_rolunidad` (`unidadOrganizacional`),
  CONSTRAINT `FK_rol` FOREIGN KEY (`idRol`) REFERENCES `quien` (`idQuien`),
  CONSTRAINT `FK_rolunidad` FOREIGN KEY (`unidadOrganizacional`) REFERENCES `unidadorganizacional` (`idUnidadOrganizacional`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rol` */

LOCK TABLES `rol` WRITE;

insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('10','Secretaria','Secretaria del programa Ingesis','2');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('11','Secretaria','Secretaria del programa Ingelec','3');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('12','Director','Director Ingelect','3');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('17','Worker','Administrador Laboratorio Ingesis','2');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('19','Worker','Profesor','13');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('24','Worker','Worker','14');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('25','Secretaria','Secretaria Vicerrectoria académica','14');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('26','Director','Director Ingeniería Civil','13');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('27','Secretaria','Secretaria Ingeniería Civil','13');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('4','Auxiliar Administrativo','Auxiliar admin','2');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('5','Profesor','Profesor','2');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('6','Director','Director del Programa','2');
insert  into `rol`(`idRol`,`nombre`,`descripcion`,`unidadOrganizacional`) values ('8','Administrador','Administrador del Sistema','1');

UNLOCK TABLES;

/*Table structure for table `seriedocumental` */

CREATE TABLE `seriedocumental` (
  `codigo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `retencionAnios` varchar(20) NOT NULL,
  `disposicionFinal` varchar(20) NOT NULL,
  `procedimiento` varchar(255) NOT NULL,
  `tabladeretencion` varchar(255) NOT NULL,
  `subserie` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_seriedocumentaltabla` (`tabladeretencion`),
  KEY `FK_subseriedoc` (`subserie`),
  CONSTRAINT `FK_seriedocumentaltabla` FOREIGN KEY (`tabladeretencion`) REFERENCES `tablaretenciondocumental` (`idTabla`),
  CONSTRAINT `FK_subseriedoc` FOREIGN KEY (`subserie`) REFERENCES `seriedocumental` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `seriedocumental` */

LOCK TABLES `seriedocumental` WRITE;

UNLOCK TABLES;

/*Table structure for table `tablaretenciondocumental` */

CREATE TABLE `tablaretenciondocumental` (
  `idTabla` varchar(255) NOT NULL,
  PRIMARY KEY (`idTabla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tablaretenciondocumental` */

LOCK TABLES `tablaretenciondocumental` WRITE;

UNLOCK TABLES;

/*Table structure for table `tipodocumento` */

CREATE TABLE `tipodocumento` (
  `idTipoDoc` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `guia` varchar(255) DEFAULT NULL,
  `plantilla` varchar(255) DEFAULT NULL,
  `listachequeo` varchar(255) DEFAULT NULL,
  `orientacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idTipoDoc`),
  KEY `FK_tipodocPlantilla` (`plantilla`),
  KEY `FK_tipodocumentolista` (`listachequeo`),
  KEY `FK_tipodocumentoguia` (`guia`),
  KEY `FK_tipodocorientacion` (`orientacion`),
  CONSTRAINT `FK_tipodocorientacion` FOREIGN KEY (`orientacion`) REFERENCES `orientacion` (`idOrientacion`),
  CONSTRAINT `FK_tipodocPlantilla` FOREIGN KEY (`plantilla`) REFERENCES `plantilla` (`idPlantilla`),
  CONSTRAINT `FK_tipodocumentoguia` FOREIGN KEY (`guia`) REFERENCES `guia` (`idGuia`),
  CONSTRAINT `FK_tipodocumentolista` FOREIGN KEY (`listachequeo`) REFERENCES `listachequeo` (`idListaChequeo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipodocumento` */

LOCK TABLES `tipodocumento` WRITE;

UNLOCK TABLES;

/*Table structure for table `unidadorganizacional` */

CREATE TABLE `unidadorganizacional` (
  `idUnidadOrganizacional` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `edificio` varchar(255) NOT NULL,
  `unidadorganizacional` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUnidadOrganizacional`),
  KEY `FK_edificio` (`edificio`),
  KEY `FK_unidadorg` (`unidadorganizacional`),
  CONSTRAINT `FK_edificio` FOREIGN KEY (`edificio`) REFERENCES `edificio` (`idEdificio`),
  CONSTRAINT `FK_unidadorg` FOREIGN KEY (`unidadorganizacional`) REFERENCES `unidadorganizacional` (`idUnidadOrganizacional`),
  CONSTRAINT `FK_unidadorganizacional` FOREIGN KEY (`idUnidadOrganizacional`) REFERENCES `quien` (`idQuien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `unidadorganizacional` */

LOCK TABLES `unidadorganizacional` WRITE;

insert  into `unidadorganizacional`(`idUnidadOrganizacional`,`nombre`,`descripcion`,`edificio`,`unidadorganizacional`) values ('1','Facultad de Ingeniería','Facultad','99',NULL);
insert  into `unidadorganizacional`(`idUnidadOrganizacional`,`nombre`,`descripcion`,`edificio`,`unidadorganizacional`) values ('13','Ingeniería Civil','Ingecivil','99',NULL);
insert  into `unidadorganizacional`(`idUnidadOrganizacional`,`nombre`,`descripcion`,`edificio`,`unidadorganizacional`) values ('14','Vicerrectoria Académica','viceacademica','99',NULL);
insert  into `unidadorganizacional`(`idUnidadOrganizacional`,`nombre`,`descripcion`,`edificio`,`unidadorganizacional`) values ('15','Vicerrectoria de Investigación','viceinvestigacion','99',NULL);
insert  into `unidadorganizacional`(`idUnidadOrganizacional`,`nombre`,`descripcion`,`edificio`,`unidadorganizacional`) values ('16','Bienestar Universitario','bienestar','99',NULL);
insert  into `unidadorganizacional`(`idUnidadOrganizacional`,`nombre`,`descripcion`,`edificio`,`unidadorganizacional`) values ('2','Ingeniería de Sistemas y Computación','Ingesis','99',NULL);
insert  into `unidadorganizacional`(`idUnidadOrganizacional`,`nombre`,`descripcion`,`edificio`,`unidadorganizacional`) values ('3','Ingeniería Electrónica','Ingelec','99','1');

UNLOCK TABLES;

/*Table structure for table `version` */

CREATE TABLE `version` (
  `idVersion` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `cuenta` varchar(255) NOT NULL,
  `formato` varchar(255) NOT NULL,
  `documento` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`idVersion`),
  KEY `FK_versionv` (`version`),
  KEY `FK_versiondoc` (`documento`),
  CONSTRAINT `FK_versiondoc` FOREIGN KEY (`documento`) REFERENCES `documento` (`idDocumento`),
  CONSTRAINT `FK_versionv` FOREIGN KEY (`version`) REFERENCES `version` (`idVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `version` */

LOCK TABLES `version` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
