/*============================================================================================*/
/* 											DATA BASE 										  */
/*============================================================================================*/
CREATE DATABASE consultoriomedico;
USE consultoriomedico;

/*============================================================================================*/
/* 											PERMISSION 										  */
/*============================================================================================*/
/*TABLE - PERMISSION*/
CREATE TABLE permission (
idPermission INT NOT NULL AUTO_INCREMENT,
permissionType VARCHAR(45) NOT NULL,
statePermission TINYINT NULL DEFAULT 1,
PRIMARY KEY (idPermission),
INDEX idx_permission (permissionType ASC) VISIBLE);
/*============================================================================================*/
/*VIEW - LIST PERMISSIONS*/
CREATE VIEW listPermission AS
SELECT idPermission, permissionType
FROM permission
WHERE statePermission=1
ORDER BY permissionType;
/*============================================================================================*/
SELECT * FROM listPermission;
/*============================================================================================*/
/*============================================================================================*/
/*VIEW - LIST PERMISSIONS*/
CREATE VIEW listPermissionAdmin AS
SELECT idPermission, permissionType
FROM permission
WHERE statePermission=1 AND idPermission>2
ORDER BY permissionType;
/*============================================================================================*/
SELECT * FROM listPermissionAdmin;
/*============================================================================================*/
/*SP - INSERT PERMISSION*/
DELIMITER $$
CREATE PROCEDURE insertPermission(IN permissionName varchar(45))
BEGIN 
INSERT INTO consultoriomedico.permission(permissionType)VALUES(permissionName); 
END$$
/*============================================================================================*/
/* EXECUTE THE STORE PROCEDURE*/
CALL insertPermission('superadministrador');
CALL insertPermission('administrador');
CALL insertPermission('medico');
CALL insertPermission('asistente');
/*============================================================================================*/
/*SP - UPDATE PERMISSION*/
DELIMITER $$
CREATE PROCEDURE updatePermission(IN permissionName varchar(45),id int)
BEGIN 
UPDATE consultoriomedico.permission 
SET permissionType=permissionName
WHERE idPermission=id;
END$$
/*============================================================================================*/
/*SP - DELLETE PERMISSION*/
DELIMITER $$
CREATE PROCEDURE deletePermission(IN id int)
BEGIN 
UPDATE consultoriomedico.permission 
SET statePermission=0
WHERE idPermission=id;
END$$
/*============================================================================================*/
/* 											USER OF SYSTEM   								  */
/*============================================================================================*/
/*TABLE - USER OF SYSTEM*/
CREATE TABLE usersystem (
idUserSystem INT  AUTO_INCREMENT NOT NULL,
namesUser VARCHAR(45) NOT NULL,
lastNamesUser VARCHAR(45) NOT NULL,
username VARCHAR(50) NOT NULL,
passwordUser VARCHAR(500) NOT NULL,
emailUser VARCHAR(45) NOT NULL,
phoneUser VARCHAR(45) NOT NULL,
fkPermission INT NULL,
stateUserSystem TINYINT NULL DEFAULT 1,
PRIMARY KEY (idUserSystem),
UNIQUE INDEX username_UNIQUE (username ASC) VISIBLE,
INDEX idx_userSystem (username ASC) VISIBLE,
INDEX fk_permission_idx (fkPermission ASC) VISIBLE,
CONSTRAINT fk_permission
FOREIGN KEY (fkPermission)
REFERENCES permission (idPermission)
ON DELETE NO ACTION
ON UPDATE NO ACTION);
/*============================================================================================*/
/*VIEW - LIST USER OF SYSTEM*/
CREATE VIEW listUserSystem AS
SELECT idUserSystem, namesUser,lastNamesUser,username,permissionType,emailUser,phoneUser
FROM usersystem
INNER JOIN permission ON usersystem.fkPermission=permission.idPermission
WHERE stateUserSystem=1
ORDER BY username;
/*============================================================================================*/
SELECT * FROM listUserSystem
/*============================================================================================*/
/*VIEW - LOGIN - USER OF SYSTEM*/
CREATE VIEW login AS
SELECT username AS usuario,permissionType,passwordUser AS idPublic
FROM usersystem
INNER JOIN permission ON usersystem.fkPermission=permission.idPermission
WHERE stateUserSystem=1
/*============================================================================================*/
/*SP - INSERT USER OF SYSTEM*/
DELIMITER $$
CREATE PROCEDURE insertUserSystem(IN namePerson varchar(45),lastnamePerson varchar(45),userPerson varchar(50),pass varchar(500),emailPerson varchar(45),phonePerson varchar(45),rol int)
BEGIN 
INSERT INTO consultoriomedico.usersystem(namesUser,lastNamesUser,username,passwordUser,emailUser,phoneUser,fkPermission)VALUES(namePerson,lastnamePerson,userPerson,pass,emailPerson,phonePerson,rol); 
END$$
/*============================================================================================*/
/*SP - UPDATE USER OF SYSTEM */
DELIMITER $$
CREATE PROCEDURE updateUserSystem(IN pass varchar(500),emailPerson varchar(45),phonePerson varchar(45),id int)
BEGIN 
UPDATE consultoriomedico.usersystem 
SET 
passwordUser=pass,
emailUser=emailPerson,
phoneUser=phonePerson
WHERE idUserSystem=id;
END$$
/*============================================================================================*/
/*SP - DELETE USER OF SYSTEM */
DELIMITER $$
CREATE PROCEDURE deleteUserSystem(IN id int)
BEGIN 
UPDATE consultoriomedico.usersystem 
SET stateUserSystem=0
WHERE idUserSystem=id;
END$$
/*============================================================================================*/
/* 											TYPE OF DOCUMENTS  								  */
/*============================================================================================*/
/*TABLE - TYPE OF DOCUMENT*/
CREATE TABLE typeiddoc (
  idTypeIdDoc int NOT NULL AUTO_INCREMENT,
  typeDocument varchar(45) NOT NULL,
  typeIdDocAbrev varchar(45) DEFAULT NULL,
  stateTypeDoc tinyint DEFAULT '1',
  PRIMARY KEY (idTypeIdDoc),
  KEY idx_typeDocument (typeDocument)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*============================================================================================*/
/*VISTA - LIST TYPE OF DOCUMENTS*/
CREATE VIEW listTypeIdentification AS 
SELECT idTypeIdDoc,typeDocument,typeIdDocAbrev
FROM consultoriomedico.typeiddoc 
WHERE stateTypeDoc=1 
ORDER BY typeDocument;
/*============================================================================================*/
SELECT * FROM listTypeIdentification;
/*============================================================================================*/
/*SP - INSERT TYPE OF DOCUMENT*/
DELIMITER $$
CREATE PROCEDURE insertTypeIdentification(IN typeDoc varchar(45),abbreviation varchar(45))
BEGIN 
INSERT INTO consultoriomedico.typeiddoc(typeDocument,typeIdDocAbrev)VALUES(typeDoc,abbreviation); 
END$$
/*============================================================================================*/
CALL insertTypeIdentification('cedula de ciudadania','cc');
CALL insertTypeIdentification('cedula de extranjeria','ce');
CALL insertTypeIdentification('tarjeta de identidad','ti');
CALL insertTypeIdentification('registro civil','rc');
CALL insertTypeIdentification('pasoporte','pa');
CALL insertTypeIdentification('nacido vivo','nv');
/*============================================================================================*/
/*SP - UPDATE USER OF SYSTEM */
DELIMITER $$
CREATE PROCEDURE updateTypeIdentification(IN typeDoc varchar(45),abbreviation varchar(45),id int)
BEGIN 
UPDATE consultoriomedico.typeiddoc 
SET 
typeDocument=typeDoc,
typeIdDocAbrev=abbreviation
WHERE idTypeIdDoc=id;
END$$
/*============================================================================================*/
/*SP - DELETE USER OF SYSTEM */
DELIMITER $$
CREATE PROCEDURE deleteTypeIdentification(IN id int)
BEGIN 
UPDATE consultoriomedico.typeiddoc 
SET stateTypeDoc=0
WHERE idTypeIdDoc=id;
END$$
/*============================================================================================*/
/* 											HEALTH REGIME´S  								  */
/*============================================================================================*/
/*TABLE - HEALTH REGIME*/
CREATE TABLE healthregimen (
idhealthregimen int NOT NULL AUTO_INCREMENT,
regime varchar(45) NOT NULL,
stateRegime tinyint DEFAULT '1',
PRIMARY KEY (idhealthregimen),
KEY idx_regime (regime)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*============================================================================================*/
/*VISTA - LIST HEALTH REGIME*/
CREATE VIEW listHealthRegime AS 
SELECT idhealthregimen,regime
FROM consultoriomedico.healthregimen 
WHERE stateRegime=1 
ORDER BY regime;
/*============================================================================================*/
SELECT * FROM listHealthRegime;
/*============================================================================================*/
/*SP - INSERT HEALTH REGIME*/
DELIMITER $$
CREATE PROCEDURE insertHealthRegime(IN regimen varchar(45))
BEGIN 
INSERT INTO consultoriomedico.healthregimen(regime)VALUES(regimen); 
END$$
/*============================================================================================*/
CALL insertHealthRegime('contributivo');
CALL insertHealthRegime('subsidiado');
/*============================================================================================*/
/*SP - UPDATE HEALTH REGIME*/
DELIMITER $$
CREATE PROCEDURE updateHealthRegime(IN regimenType varchar(45),id int)
BEGIN 
UPDATE consultoriomedico.healthregimen 
SET regime=regimenType
WHERE idhealthregimen=id;
END$$
/*============================================================================================*/
/*SP - DELETE HEALTH REGIME*/
DELIMITER $$
CREATE PROCEDURE deleteHealthRegime(IN id int)
BEGIN 
UPDATE consultoriomedico.healthregimen 
SET stateRegime=0
WHERE idhealthregimen=id;
END$$
/*============================================================================================*/
/* 							 HEALTH PROMOTION COMPANY - E.P.S.  							  */
/*============================================================================================*/
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*============================================================================================*/
/*VISTA - LIST EPS*/
CREATE VIEW listEPS AS 
SELECT ideps,epsname,epscode,epscodemovie,epsnit,epsregime
FROM consultoriomedico.eps
WHERE stateeps=1 
ORDER BY epsname;
/*============================================================================================*/
SELECT * FROM listEPS;
/*============================================================================================*/
/*SP - INSERT EPS*/
DELIMITER $$
CREATE PROCEDURE insertEps(IN eps varchar(150),coding varchar(50),codingMovil varchar(50),nit varchar(50),regimen int)
BEGIN 
INSERT INTO consultoriomedico.eps(epsname,epscode,epscodemovie,epsnit,epsregime)VALUES(eps,coding,codingMovil,nit,regimen); 
END$$
/*============================================================================================*/
CALL insertEPS('coosalud eps','ESS024','ESSC24','900226715',1);
CALL insertEPS('coosalud eps','EPS042','EPSS42','900226715',2);
CALL insertEPS('nueva eps','EPS037','EPSS37','900156264',1);
CALL insertEPS('nueva eps','EPSS41','EPS041','900156264',2);
CALL insertEPS('mutualser','ESS207','ESSC07','806008394',1);
CALL insertEPS('mutualser','EPS048','EPSS48','806008394',2);
CALL insertEPS('alianzasalud eps','EPS001','EPSS01','830113831',1);
CALL insertEPS('salud total eps','EPS002','EPSS02','800130907',1);
CALL insertEPS('eps sanitas','EPS005','EPSS05','800251440',1);
CALL insertEPS('eps sura','EPS010','EPSS10','800088702',1);
CALL insertEPS('famisanar','EPS017','EPSS17','830003564',1);
CALL insertEPS('servicio occidental de salud eps','EPS018','EPSS18','805001157',1);
CALL insertEPS('salud mia','EPS046','EPSS46','900914254',1);
CALL insertEPS('comfenalco valle','EPS012','EPSS12','890303093',1);
CALL insertEPS('compensar eps','EPS008','EPSS08','860066942',1);
CALL insertEPS('epm - empresas publicas de medellin','EAS016','N/A','890904996',1);
CALL insertEPS('fondo pasivo social de ferrocarriles nacionales de colombia','EAS027','N/A','800112806',1);
CALL insertEPS('cajacopi atlantico','CCF055','CCFC55','8901020442',2);
CALL insertEPS('capresoca','EPS025','EPSC25','891856000',2);
CALL insertEPS('comfachoco','CCF102','CCFC20','891600091',2);
CALL insertEPS('comfaoriente','CCF050','CCFC50','890500675',2);
CALL insertEPS('eps familiar de colombia','CCF033','CCFC33','901543761',2);
CALL insertEPS('asmet salud','ESS062','ESSC62','900935126',2);
CALL insertEPS('emssanar.','ESS118','ESSC18','901021565',2);
CALL insertEPS('capital salud eps','EPSS34','EPSC34','900298372',2);
CALL insertEPS('savia salud eps','EPSS40','EPS040','900604350',2);
CALL insertEPS('dusakawi epsi','EPSI01','EPSIC1','824001398',2);
CALL insertEPS('asociacion indighena del cauca epsi','EPSI03','EPSIC3','817001773',2);
CALL insertEPS('anas wayuu epsi','EPSI04','EPSIC4','839000495',2);
CALL insertEPS('mallamas epsi','EPSI05','EPSIC5','837000084',2);
CALL insertEPS('pijaos salud epsi','EPSI06','EPSIC6','809008362',2);
CALL insertEPS('salud bolivar eps','EPS047','EPSS47','901438242',1);
/*============================================================================================*/
/*SP - UPDATE EPS*/
DELIMITER $$
CREATE PROCEDURE updateEps(IN eps varchar(150),coding varchar(50),codingMovil varchar(50),nit varchar(50),regimen int,id int)
BEGIN 
UPDATE consultoriomedico.eps
SET 
epsname=eps,
epscode=coding,
epscodemovie=codingMovil,
epsnit=nit,
epsregime=regimen
WHERE ideps=id; 
END$$
/*============================================================================================*/
/*SP - DELETE EPS*/
DELIMITER $$
CREATE PROCEDURE deleteEps(IN id int)
BEGIN 
UPDATE consultoriomedico.eps
SET stateeps=0
WHERE ideps=id; 
END$$
/*============================================================================================*/
/* 											 PATIENT  										  */
/*============================================================================================*/
/*TABLE - EPS*/
CREATE TABLE patient (
idPatient int NOT NULL AUTO_INCREMENT,
firstNamePatient varchar(250) NOT NULL,
secondNamePatient varchar(250) NOT NULL,
firstLastnamePatient varchar(250) NOT NULL,
secondLastnamePatient varchar(250) NOT NULL,
typeDocumentPatient int NOT NULL,
idNumberDocumentPatiend varchar(45) NOT NULL,
epsPatient int NOT NULL,
regimePatient int NOT NULL,
statePatient tinyint DEFAULT '1',
PRIMARY KEY (idPatient),
KEY idx_patient (idNumberDocumentPatiend,firstNamePatient,firstLastnamePatient),
CONSTRAINT fk_eps FOREIGN KEY (epsPatient) REFERENCES eps (ideps),
CONSTRAINT fk_typeDocument FOREIGN KEY (typeDocumentPatient) REFERENCES typeiddoc (idTypeIdDoc),
CONSTRAINT fk_regimePatient FOREIGN KEY (regimePatient) REFERENCES healthregimen (idhealthregimen)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*============================================================================================*/
/*VIEW - PATIENT*/
CREATE VIEW listPatient AS
SELECT 
idPatient,
firstNamePatient,
secondNamePatient,
firstLastnamePatient,
secondLastnamePatient, 
typeDocument,
idNumberDocumentPatiend,
epsname,
regime
FROM consultoriomedico.patient
INNER JOIN typeiddoc ON patient.typeDocumentPatient=typeiddoc.idTypeIdDoc
INNER JOIN eps ON patient.epsPatient = eps.ideps
INNER JOIN healthregimen ON patient.regimePatient= healthregimen.regime
WHERE statePatient=1
ORDER BY firstNamePatient;
/*============================================================================================*/
SELECT * FROM listPatient;
/*============================================================================================*/
/*SP - INSERT PATIENT*/
DELIMITER $$
CREATE PROCEDURE insertPatient(IN name_one varchar(250),name_two varchar(250),lastname_one varchar(250),lastname_two varchar(250),typeId int,numberId varchar(45),eps int,typeRegimen int)
BEGIN 
INSERT INTO consultoriomedico.patient(firstNamePatient,secondNamePatient,firstLastnamePatient,secondLastnamePatient,typeDocument,idNumberDocumentPatiend,epsname,regime)VALUES(name_one,name_two,lastname_one,lastname_two,typeId,numberId,eps,typeRegimen); 
END$$
/*============================================================================================*/
/*SP - UPDATE PATIENT*/
DELIMITER $$
CREATE PROCEDURE updatePatient(IN name_one varchar(250),name_two varchar(250),lastname_one varchar(250),lastname_two varchar(250),typeId int,numberId varchar(45),eps int,typeRegimen int,id int)
BEGIN 
UPDATE consultoriomedico.patient
SET 
firstNamePatient=name_one,
secondNamePatient=name_two,
firstLastnamePatient=lastname_one,
secondLastnamePatient=lastname_two,
typeDocumentPatient=typeId,
idNumberDocumentPatiend=numberId,
epsPatient=eps,
regimePatient=typeRegimen
WHERE idPatient=id; 
END$$
/*============================================================================================*/
/*SP - DELETE PATIENT*/
DELIMITER $$
CREATE PROCEDURE deletePatient(IN id int)
BEGIN 
UPDATE consultoriomedico.patient
SET statePatient=0
WHERE idPatient=id; 
END$$
/*============================================================================================*/
/* 										STATE PATIENT STUDY									  */
/*============================================================================================*/
/*TABLE - STATE PATIENT STUDY	*/
CREATE TABLE statePatientStudy (
idStatePatientStudy INT NOT NULL AUTO_INCREMENT,
stateType VARCHAR(45) NOT NULL,
stateStudy TINYINT NULL DEFAULT 1,
PRIMARY KEY (idStatePatientStudy),
INDEX idx_stateStudy (stateType ASC) VISIBLE);
/*============================================================================================*/
/*VIEW - LIST STATE PATIENT STUDY*/
CREATE VIEW listStatePatientStudy AS
SELECT idStatePatientStudy, stateType
FROM statePatientStudy
WHERE stateStudy=1
ORDER BY stateType;
/*============================================================================================*/
SELECT * FROM listStatePatientStudy;
/*============================================================================================*/
/*SP - INSERT STATE PATIENT STUDY*/
DELIMITER $$
CREATE PROCEDURE insertStatePatientStudy(IN state varchar(45))
BEGIN 
INSERT INTO consultoriomedico.statePatientStudy(stateType)VALUES(state); 
END$$
/*============================================================================================*/
CALL insertStatePatientStudy('abierto');
CALL insertStatePatientStudy('cerrado');
/*============================================================================================*/
/*SP - UPDATE STATE PATIENT STUDY*/
DELIMITER $$
CREATE PROCEDURE updateStatePatientStudy(IN state varchar(45),id int)
BEGIN 
UPDATE consultoriomedico.statePatientStudy 
SET stateType=state
WHERE idStatePatientStudy=id;
END$$
/*============================================================================================*/
/*SP - DELLETE STATE PATIENT STUDY*/
DELIMITER $$
CREATE PROCEDURE deleteStatePatientStudy(IN id int)
BEGIN 
UPDATE consultoriomedico.statePatientStudy 
SET stateStudy=0
WHERE idStatePatientStudy=id;
END$$
/*============================================================================================*/






/*============================================================================================*/
/* 											 PATIENT STUDY									  */
/*============================================================================================*/
CREATE TABLE patientstudy (
idPatientStudy INT NOT NULL AUTO_INCREMENT,
namePatient VARCHAR(500),
identification VARCHAR(45) NOT NULL,
dateOfBirth DATE,
dateStudy DATE NOT NULL,
nameStudy VARCHAR(5000),
rutePdfStudy VARCHAR(5000),
operatorStudy VARCHAR(500),
typeStudy VARCHAR(45),
fkStateStudy INT,
statePatientStudy TINYINT NULL DEFAULT 1,
fkPatient INT NOT NULL,
PRIMARY KEY (idPatientStudy),
INDEX idx_patiendStudy (dateStudy ASC, identification ASC, typeStudy ASC, stateStudy ASC) VISIBLE,
INDEX fk_patient_idx (fkPatient ASC) VISIBLE,
CONSTRAINT fk_patient FOREIGN KEY (fkPatient) REFERENCES patient (idPatient),
CONSTRAINT fk_statestudy FOREIGN KEY (fkStateStudy) REFERENCES patient (idPatient)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);










