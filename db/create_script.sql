-- Step: 01
-- Goal: create database
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            11-05-2023      Vincent van de Merwe            new          
-- =============================================================================
drop database if exists `Mvc-2209b-P4-opdracht-2`;
create database if not exists `Mvc-2209b-P4-opdracht-2`;
use `Mvc-2209b-P4-opdracht-2`; 

-- Step: 02
-- Goal: create table Instructeur
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            11-05-2023      Vincent van de Merwe            new          
-- =============================================================================

drop table if exists Instructeur;
create table if not exists Instructeur (
Id TINYINT UNSIGNED not null auto_increment,
Voornaam varchar(50) not null,
Tussenvoegsel varchar(50) not null,
Achternaam varchar(50) not null,
Mobiel varchar(50) not null,
DatumInDienst varchar(50) not null,
AantalSterren varchar(20) not null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT primary key CLUSTERED(Id)
) engine=InnoDB;

-- Step: 03
-- Goal: create table TypeVoertuig
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            11-05-2023      Vincent van de Merwe            new          
-- =============================================================================

drop table if exists TypeVoertuig;
create table if not exists TypeVoertuig (
Id TINYINT UNSIGNED not null auto_increment,
TypeVoertuig varchar(50) not null,
Rijbewijscategorie varchar(50) not null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT      PK_TypeVoertuig_Id   PRIMARY KEY CLUSTERED(Id)
) engine=InnoDB;

-- Step: 04
-- Goal: create table Voertuig
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            11-05-2023      Vincent van de Merwe            new          
-- =============================================================================

drop table if exists Voertuig;
create table if not exists Voertuig (
Id TINYINT UNSIGNED not null auto_increment,
Kenteken varchar(20) not null,
Type varchar(30) not null,
Bouwjaar varchar(50) not null,
Brandstof varchar(20) not null,
TypeVoertuigId TINYINT UNSIGNED not null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT      PK_Voertuig_Id   PRIMARY KEY CLUSTERED(Id),
foreign key (TypeVoertuigId) references TypeVoertuig(Id)
) engine=InnoDB;

-- Step: 05
-- Goal: create table VoertuigInstructeur
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            11-05-2023      Vincent van de Merwe            new          
-- =============================================================================

drop table if exists VoertuigInstructeur;
create table if not exists VoertuigInstructeur (
Id TINYINT UNSIGNED not null auto_increment,
VoertuigId TINYINT UNSIGNED not null,
InstructeurId TINYINT UNSIGNED not null,
DatumToekenning date not null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT      PK_VoertuigInstructeur_Id   PRIMARY KEY CLUSTERED(Id),
foreign key (VoertuigId) references Voertuig(Id),
foreign key (InstructeurId) references Instructeur(Id)
) engine=InnoDB;

-- Step: 06
-- Goal: insert info into the table Instructeur
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            11-05-2023      Vincent van de Merwe            new          
-- =============================================================================

INSERT INTO Instructeur (Id,Voornaam,Tussenvoegsel,Achternaam,Mobiel,DatumInDienst,AantalSterren,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Li', '', 'Zhan', '06-28493827', '2015-04-17', '***', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Instructeur (Id,Voornaam,Tussenvoegsel,Achternaam,Mobiel,DatumInDienst,AantalSterren,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Leroy', '', 'Boerhaven', '06-39398734', '25-06-2018', '*', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Instructeur (Id,Voornaam,Tussenvoegsel,Achternaam,Mobiel,DatumInDienst,AantalSterren,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Yoeri', 'Van', 'Veen', '06-24383291', '12-05-2010', '***', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Instructeur (Id,Voornaam,Tussenvoegsel,Achternaam,Mobiel,DatumInDienst,AantalSterren,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Bert', 'Van', 'Sali', '06-48293823', '10-01-2023', '****', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Instructeur (Id,Voornaam,Tussenvoegsel,Achternaam,Mobiel,DatumInDienst,AantalSterren,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Mohammed', 'El', 'Yassidi', '06-34291234', '14-06-2010', '*****', 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step: 07
-- Goal: insert info into the table TypeVoertuig
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            11-05-2023      Vincent van de Merwe            new          
-- =============================================================================

INSERT INTO TypeVoertuig (Id,TypeVoertuig,Rijbewijscategorie,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Personenauto', 'B', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO TypeVoertuig (Id,TypeVoertuig,Rijbewijscategorie,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Vrachtwagen', 'C', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO TypeVoertuig (Id,TypeVoertuig,Rijbewijscategorie,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Bus', 'D', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO TypeVoertuig (Id,TypeVoertuig,Rijbewijscategorie,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Bromfiets', 'AM', 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step: 08
-- Goal: insert info into the table Voertuig
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            11-05-2023      Vincent van de Merwe            new          
-- =============================================================================

INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'AU-67-IO', 'Golf', '12-06-2017', 'Diesel', 1, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'TR-24-OP', 'DAF', '23-05-2019', 'Diesel', 2, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'TH-78-KL', 'Mercedes', '01-01-2023', 'Benzine', 1, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, '90-KL-TR', 'Fiat 500', '12-09-2021', 'Benzine', 1, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, '34-TK-LP', 'Scania', '13-03-2015', 'Diesel', 2, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'YY-OP-78', 'BMW M5', '13-05-2022', 'Diesel', 1, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'UU-HH-JK', 'M.A.N', '03-12-2017', 'Diesel', 2, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'ST-FZ-28', 'Citroën', '20-01-2018', 'Elektrisch', 1, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, '123-FR-T', 'Piaggio ZIP', '01-02-2021', 'Benzine', 4, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'DRS-52-P', 'Vespa', '21-03-2022', 'Benzine', 4, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'STP-12-U', 'Kymco', '02-07-2022', 'Benzine', 4, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO Voertuig (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, '45-SD-23', 'Renault', '01-01-2023', 'Diesel', 3, 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step: 09
-- Goal: insert info into the table VoertuigInstructeur
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            11-05-2023      Vincent van de Merwe            new          
-- =============================================================================

INSERT INTO VoertuigInstructeur (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 1, 5, '2017-06-18', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO VoertuigInstructeur (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 3, 1, '2021-09-26', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO VoertuigInstructeur (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 9, 1, '2021-09-27', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO VoertuigInstructeur (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 3, 4, '2022-08-01', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO VoertuigInstructeur (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 5, 1, '2019-08-30', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO VoertuigInstructeur (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 10, 5, '2020-02-02', 1, NULL, SYSDATE(6), SYSDATE(6));