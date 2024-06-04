CREATE DATABASE consultoriomedico;
USE consultoriomedico;

/*TABLE - TYPE OF DOCUMENT*/
CREATE TABLE typeiddoc (
  idTypeIdDoc int NOT NULL AUTO_INCREMENT,
  typeDocument varchar(45) NOT NULL,
  typeIdDocAbrev varchar(45) DEFAULT NULL,
  stateTypeDoc tinyint DEFAULT '1',
  PRIMARY KEY (idTypeIdDoc),
  KEY idx_typeDocument (typeDocument)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*VISTA - LIST TYPE OF DOCUMENTS*/
CREATE VIEW listTypeIdentification AS 
SELECT idTypeIdDoc,typeDocument,typeIdDocAbrev
FROM consultoriomedico.typeiddoc 
WHERE stateTypeDoc=1 
ORDER BY typeDocument;

SELECT * FROM listTypeIdentification;

/*SP - INSERT TYPE OF DOCUMENT*/
DELIMITER $$
CREATE PROCEDURE insertypeIdentification(IN typeDoc varchar(45),abbreviation varchar(45))
BEGIN 
INSERT INTO consultoriomedico.typeiddoc(typeDocument,typeIdDocAbrev)VALUES(typeDoc,abbreviation); 
END$$

CALL insertypeIdentification('cedula de ciudadania','cc');
CALL insertypeIdentification('cedula de extranjeria','ce');
CALL insertypeIdentification('tarjeta de identidad','ti');
CALL insertypeIdentification('registro civil','rc');
CALL insertypeIdentification('pasoporte','pa');
CALL insertypeIdentification('nacido vivo','nv');


/*TABLE - HEALTH REGIME*/
CREATE TABLE healthregimen (
  idhealthregimen int NOT NULL AUTO_INCREMENT,
  regime varchar(45) NOT NULL,
  stateRegime tinyint DEFAULT '1',
  PRIMARY KEY (idhealthregimen),
  KEY idx_regime (regime)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




/*VISTA - LIST HEALTH REGIME*/
CREATE VIEW listHealthRegime AS 
SELECT idhealthregimen,regime
FROM consultoriomedico.healthregimen 
WHERE stateRegime=1 
ORDER BY regime;

SELECT * FROM listHealthRegime;

/*SP - INSERT HEALTH REGIME*/
DELIMITER $$
CREATE PROCEDURE inserthealthRegime(IN regimen varchar(45))
BEGIN 
INSERT INTO consultoriomedico.healthregimen(regime)VALUES(regimen); 
END$$

CALL inserthealthRegime('contributivo');
CALL inserthealthRegime('subsidiado');

/*TABLE - EPS*/
CREATE TABLE eps (
  ideps int NOT NULL AUTO_INCREMENT,
  epsname varchar(250) NOT NULL,
  epscode varchar(45) NOT NULL,
  epscodemovie varchar(45) DEFAULT NULL,
  epsnit varchar(45) NOT NULL,
  epsregime int DEFAULT NULL,
  stateeps tinyint DEFAULT '1',
  PRIMARY KEY (ideps),
  KEY idx_eps (epsnit,epsname,epsregime,epscode),
  KEY fk_regimen_idx (epsregime),
  CONSTRAINT fk_regimen FOREIGN KEY (epsregime) REFERENCES healthregimen (idhealthregimen)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



/*VISTA - LIST EPS*/
CREATE VIEW listEPS AS 
SELECT ideps,epsname,epscode,epscodemovie,epsnit,epsregime
FROM consultoriomedico.eps
WHERE stateeps=1 
ORDER BY epsname;

SELECT * FROM listEPS;

/*SP - INSERT EPS*/
DELIMITER $$
CREATE PROCEDURE insertEPS(IN eps varchar(150),coding varchar(50),codingMovil varchar(50),nit varchar(50),regimen int)
BEGIN 
INSERT INTO consultoriomedico.eps(epsname,epscode,epscodemovie,epsnit,epsregime)VALUES(eps,coding,codingMovil,nit,regimen); 
END$$

CALL insertEPS('COOSALUD EPS-S','ESS024','ESSC24','900226715',1);
CALL insertEPS('COOSALUD EPS-S','EPS042','EPSS42','900226715',2);
CALL insertEPS('NUEVA EPS','EPS037','EPSS37','900156264',1);
CALL insertEPS('NUEVA EPS','EPSS41','EPS041','900156264',2);
CALL insertEPS('MUTUAL SER','ESS207','ESSC07','806008394',1);
CALL insertEPS('MUTUAL SER','EPS048','EPSS48','806008394',2);
CALL insertEPS('ALIANSALUD EPS','EPS001','EPSS01','830113831',1);
CALL insertEPS('SALUD TOTAL EPS S.A.','EPS002','EPSS02','800130907',1);
CALL insertEPS('EPS SANITAS','EPS005','EPSS05','800251440',1);
CALL insertEPS('EPS SURA','EPS010','EPSS10','800088702',1);
CALL insertEPS('FAMISANAR','EPS017','EPSS17','830003564',1);
CALL insertEPS('SERVICIO OCCIDENTAL DE SALUD EPS SOS','EPS018','EPSS18','805001157',1);
CALL insertEPS('SALUD MIA','EPS046','EPSS46','900914254',1);
CALL insertEPS('COMFENALCO VALLE','EPS012','EPSS12','890303093',1);
CALL insertEPS('COMPENSAR EPS','EPS008','EPSS08','860066942',1);
CALL insertEPS('EPM - EMPRESAS PUBLICAS DE MEDELLIN','EAS016','N/A','890904996',1);
CALL insertEPS('FONDO DE PASIVO SOCIAL DE FERROCARRILES NACIONALES DE COLOMBIA','EAS027','N/A','800112806',1);
CALL insertEPS('CAJACOPI ATLANTICO','CCF055','CCFC55','8901020442',2);
CALL insertEPS('CAPRESOCA','EPS025','EPSC25','891856000',2);
CALL insertEPS('COMFACHOCO','CCF102','CCFC20','891600091',2);
CALL insertEPS('COMFAORIENTE','CCF050','CCFC50','890500675',2);
CALL insertEPS('EPS FAMILIAR DE COLOMBIA','CCF033','CCFC33','901543761',2);
CALL insertEPS('ASMET SALUD','ESS062','ESSC62','900935126',2);
CALL insertEPS('EMSSANAR E.S.S.','ESS118','ESSC18','901021565',2);
CALL insertEPS('CAPITAL SALUD EPS-S','EPSS34','EPSC34','900298372',2);
CALL insertEPS('SAVIA SALUD EPS','EPSS40','EPS040','900604350',2);
CALL insertEPS('DUSAKAWI EPSI','EPSI01','EPSIC1','824001398',2);
CALL insertEPS('ASOCIACION INDIGENA DEL CAUCA EPSI','EPSI03','EPSIC3','817001773',2);
CALL insertEPS('ANAS WAYUU EPSI','EPSI04','EPSIC4','839000495',2);
CALL insertEPS('MALLAMAS EPSI','EPSI05','EPSIC5','837000084',2);
CALL insertEPS('PIJAOS SALUD EPSI','EPSI06','EPSIC6','809008362',2);
CALL insertEPS('SALUD BÓLIVAR EPS SAS','EPS047','EPSS47','901438242',1);







