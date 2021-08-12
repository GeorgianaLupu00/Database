CREATE SCHEMA `inchiriere_costume` ;

CREATE TABLE `inchiriere_costume`.`inchiriere` (
  `ID_INCHIRIERE` INT NOT NULL,
  `ID_CLIENT` INT NOT NULL,
  `ID_ANGAJAT` INT NOT NULL,
  `DATA_INCHIRIERE` DATE NOT NULL,
  `DATA_RETURN` DATE NOT NULL,
  PRIMARY KEY (`ID_INCHIRIERE`));

ALTER TABLE `inchiriere_costume`.`inchiriere` 
ADD INDEX `inchiriere_client_id_idx` (`ID_CLIENT` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`inchiriere` 
ADD CONSTRAINT `inchiriere_client_id`
  FOREIGN KEY (`ID_CLIENT`)
  REFERENCES `inchiriere_costume`.`client` (`ID_CLIENT`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `inchiriere_costume`.`inchiriere` 
ADD INDEX `inchiriere_angajat_id_idx` (`ID_ANGAJAT` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`inchiriere` 
ADD CONSTRAINT `inchiriere_angajat_id`
  FOREIGN KEY (`ID_ANGAJAT`)
  REFERENCES `inchiriere_costume`.`angajat` (`ID_ANGAJAT`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `inchiriere_costume`.`inventar` (
  `ID_INVENTAR` INT NOT NULL,
  `ID_COSTUM` INT NOT NULL,
  `ID_MAGAZIN` INT NOT NULL,
  `STOC` DATE NULL,
  PRIMARY KEY (`ID_INVENTAR`));

ALTER TABLE `inchiriere_costume`.`inventar` 
ADD INDEX `inventar_costum_id_idx` (`ID_COSTUM` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`inventar` 
ADD CONSTRAINT `inventar_costum_id`
  FOREIGN KEY (`ID_COSTUM`)
  REFERENCES `inchiriere_costume`.`costum` (`ID_COSTUM`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `inchiriere_costume`.`inventar` 
ADD INDEX `inventar_magazin_id_idx` (`ID_MAGAZIN` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`inventar` 
ADD CONSTRAINT `inventar_magazin_id`
  FOREIGN KEY (`ID_MAGAZIN`)
  REFERENCES `inchiriere_costume`.`magazin` (`ID_MAGAZIN`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



CREATE TABLE `inchiriere_costume`.`client` (
  `ID_CLIENT` INT NOT NULL,
  `ID_MAGAZIN` INT NOT NULL,
  `ID_ADRESA` INT NOT NULL,
  `NUME` VARCHAR(25) NULL,
  `PRENUME` VARCHAR(25) NULL,
  `EMAIL` VARCHAR(25) NULL,
  `TELEFON` INT NULL,
  PRIMARY KEY (`ID_CLIENT`));

ALTER TABLE `inchiriere_costume`.`client` 
ADD INDEX `client_magazin_id_idx` (`ID_MAGAZIN` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`client` 
ADD CONSTRAINT `client_magazin_id`
  FOREIGN KEY (`ID_MAGAZIN`)
  REFERENCES `inchiriere_costume`.`magazin` (`ID_MAGAZIN`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `inchiriere_costume`.`client` 
ADD INDEX `client_adresa_id_idx` (`ID_ADRESA` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`client` 
ADD CONSTRAINT `client_adresa_id`
  FOREIGN KEY (`ID_ADRESA`)
  REFERENCES `inchiriere_costume`.`adresa` (`ID_ADRESA`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `inchiriere_costume`.`plata` (
  `ID_PLATA` INT NOT NULL,
  `ID_CLIENT` INT NOT NULL,
  `ID_ANGAJAT` INT NOT NULL,
  `DATA_PLATA` DATE NULL,
  `SUMA` INT NULL,
  PRIMARY KEY (`ID_PLATA`));

ALTER TABLE `inchiriere_costume`.`plata` 
ADD INDEX `plata_client_id_idx` (`ID_CLIENT` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`plata` 
ADD CONSTRAINT `plata_client_id`
  FOREIGN KEY (`ID_CLIENT`)
  REFERENCES `inchiriere_costume`.`client` (`ID_CLIENT`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `inchiriere_costume`.`plata` 
ADD INDEX `plata_id_angajat_idx` (`ID_ANGAJAT` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`plata` 
ADD CONSTRAINT `plata_id_angajat`
  FOREIGN KEY (`ID_ANGAJAT`)
  REFERENCES `inchiriere_costume`.`angajat` (`ID_ANGAJAT`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `inchiriere_costume`.`plata` 
ADD INDEX `plata_id_inchiriere_idx` (`ID_INCHIRIERE` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`plata` 
ADD CONSTRAINT `plata_id_inchiriere`
  FOREIGN KEY (`ID_INCHIRIERE`)
  REFERENCES `inchiriere_costume`.`inchiriere` (`ID_INCHIRIERE`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



CREATE TABLE `inchiriere_costume`.`adresa` (
  `ID_ADRESA` INT NOT NULL,
  `ORAS` VARCHAR(50) NULL,
  `STRADA` VARCHAR(50) NULL,
  `COD_POSTAL` INT NULL,
  PRIMARY KEY (`ID_ADRESA`));

INSERT INTO `inchiriere_costume`.`adresa` (`ID_ADRESA`, `ORAS`, `STRADA`, `COD_POSTAL`) VALUES ('10', 'BUCURESTI', 'INDEPENDENTEI', '123456');


CREATE TABLE `inchiriere_costume`.`costum` (
  `ID_COSTUM` INT NOT NULL,
  `ID_MATERIAL` INT NOT NULL,
  `DESCRIERE` VARCHAR(50) NULL,
  `DATA_CROITORIE` DATE NULL,
  `INCHIRIERE` TINYINT NULL,
  `CALITATE` VARCHAR(10) NULL,
  `PRET` INT NULL,
  PRIMARY KEY (`ID_COSTUM`));

ALTER TABLE `inchiriere_costume`.`costum` 
ADD INDEX `costum_material_id_idx` (`ID_MATERIAL` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`costum` 
ADD CONSTRAINT `costum_material_id`
  FOREIGN KEY (`ID_MATERIAL`)
  REFERENCES `inchiriere_costume`.`material` (`ID_MATERIAL`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `inchiriere_costume`.`magazin` (
  `ID_MAGAZIN` INT NOT NULL,
  `ID_ADRESA` INT NOT NULL,
  `ID_ANGAJAT` INT NOT NULL,
  `MANAGER` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_MAGAZIN`));

ALTER TABLE `inchiriere_costume`.`magazin` 
ADD INDEX `magazin_angajat_idx` (`ID_ANGAJAT` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`magazin` 
ADD CONSTRAINT `magazin_angajat`
  FOREIGN KEY (`ID_ANGAJAT`)
  REFERENCES `inchiriere_costume`.`angajat` (`ID_ANGAJAT`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `inchiriere_costume`.`magazin` 
ADD INDEX `magazin_adresa_id_idx` (`ID_ADRESA` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`magazin` 
ADD CONSTRAINT `magazin_adresa_id`
  FOREIGN KEY (`ID_ADRESA`)
  REFERENCES `inchiriere_costume`.`adresa` (`ID_ADRESA`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `inchiriere_costume`.`material` (
  `ID_MATERIAL` INT NOT NULL,
  `ID_FABRICA` INT NOT NULL,
  `LUNGIME` FLOAT NULL,
  `TARA_ORIGINE` VARCHAR(25) NULL,
  `DENUMIRE` VARCHAR(25) NULL,
  `DETALII` VARCHAR(25) NULL,
  `CULOARE` VARCHAR(25) NULL,
  PRIMARY KEY (`ID_MATERIAL`));

ALTER TABLE `inchiriere_costume`.`material` 
ADD INDEX `material_fabrica_id_idx` (`ID_FABRICA` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`material` 
ADD CONSTRAINT `material_fabrica_id`
  FOREIGN KEY (`ID_FABRICA`)
  REFERENCES `inchiriere_costume`.`fabrica` (`ID_FABRICA`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `inchiriere_costume`.`angajat` (
  `ID_ANGAJAT` INT NOT NULL,
  `ID_ADRESA` INT NOT NULL,
  `ID_MAGAZIN` INT NOT NULL,
  `NUME` VARCHAR(25) NULL,
  `PRENUME` VARCHAR(25) NULL,
  `EMAIL` VARCHAR(25) NULL,
  `USERNAME` VARCHAR(25) NULL,
  `PAROLA` VARCHAR(25) NULL,
  PRIMARY KEY (`ID_ANGAJAT`));

ALTER TABLE `inchiriere_costume`.`angajat` 
ADD CONSTRAINT `adresa_ang_id`
  FOREIGN KEY (`ID_ADRESA`)
  REFERENCES `inchiriere_costume`.`adresa` (`ID_ADRESA`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `inchiriere_costume`.`angajat` 
ADD INDEX `magazin_ang_id_idx` (`ID_MAGAZIN` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`angajat` 
ADD CONSTRAINT `magazin_ang_id`
  FOREIGN KEY (`ID_MAGAZIN`)
  REFERENCES `inchiriere_costume`.`magazin` (`ID_MAGAZIN`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `inchiriere_costume`.`fabrica` (
  `ID_FABRICA` INT NOT NULL,
  `ID_ADRESA` INT NOT NULL,
  `TIPUL` VARCHAR(10) NULL,
  `NR_ANGAJATI` VARCHAR(3) NULL,
  `COMENZI_LUNARE` VARCHAR(3) NULL,
  `FURNIZOR` VARCHAR(25) NULL,
  `PRE_FURNIZOR` INT NULL,
  PRIMARY KEY (`ID_FABRICA`));

ALTER TABLE `inchiriere_costume`.`fabrica` 
ADD INDEX `fabrica_adresa_id_idx` (`ID_ADRESA` ASC) VISIBLE;
;
ALTER TABLE `inchiriere_costume`.`fabrica` 
ADD CONSTRAINT `fabrica_adresa_id`
  FOREIGN KEY (`ID_ADRESA`)
  REFERENCES `inchiriere_costume`.`adresa` (`ID_ADRESA`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
