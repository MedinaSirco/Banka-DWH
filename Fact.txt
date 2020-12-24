USE [Bank]
GO

 
DROP TABLE IF EXISTS "Fact_upotreba";
DROP TABLE IF EXISTS "Fact_transakcije"; 
DROP TABLE IF EXISTS "Dim_datum"; 
DROP TABLE IF EXISTS "Dim_lokacije";
DROP TABLE IF EXISTS "Dim_usluga";
DROP TABLE IF EXISTS "Dim_proizvod";
DROP TABLE IF EXISTS "Dim_korisnik";
DROP TABLE IF EXISTS "Dim_racun";

DROP TABLE IF EXISTS "Fact_upotreba";
DROP TABLE IF EXISTS "Fact_promet";
DROP TABLE IF EXISTS "Fact_transakcije";




GO


CREATE TABLE Dim_korisnik (
  korisnik_id int NOT NULL ,
  posao_id int NOT NULL,
  korisnik_ime varchar(100) DEFAULT NULL,
  korisnik_prezime varchar(100) DEFAULT NULL,
  korisnik_adresa varchar(100) DEFAULT NULL,
  PRIMARY KEY (korisnik_id),
)

CREATE TABLE Dim_usluga (
  usluga_id int NOT NULL ,
  usluga_naziv varchar(100) DEFAULT NULL,
  PRIMARY KEY (usluga_id)
) 


CREATE TABLE Dim_racun (

racun_id int NOT NULL ,
korisnik_id int NOT NULL ,
naziv varchar(50) Null,
datum_otvaranja Date NOT NULL,
datum_zatvaranja DATE  NULL,
stanje int NULL,
PRIMARY KEY (racun_id),
)


CREATE TABLE Dim_datum (
  datum_id int NOT NULL ,
  datum Date   NULL,
  mjesec_broj int NUll,
  godina int NULL,
  PRIMARY KEY (datum_id)
)

CREATE TABLE Dim_lokacije (
  lokacija_id int NOT NULL ,
  lokacija_naziv varchar(100) DEFAULT NULL,
  PRIMARY KEY (lokacija_id)
)




CREATE TABLE Fact_transakcije (
  transakcija_id int NOT NULL ,
  lokacija_id int NOT NULL,
  usluga_id int NOT NULL,
  datum_id int NOT NULL,
  
  kolicina int NOT NULL,
  PRIMARY KEY (transakcija_id),
  CONSTRAINT transakcije_dim_1 FOREIGN KEY (lokacija_id) REFERENCES Dim_lokacije (lokacija_id),
  CONSTRAINT transakcije_dim_2 FOREIGN KEY (usluga_id) REFERENCES Dim_usluga (usluga_id),
  CONSTRAINT transakcije_dim_3 FOREIGN KEY (datum_id)    REFERENCES Dim_datum (datum_id)
) /* Star schema*/







CREATE TABLE Fact_upotreba (
  transakcija_id int NOT NULL ,
  lokacija_id int NOT NULL,
  usluga_id int NOT NULL,
  datum_id int NOT NULL,
  
  Total_Upotreba int NOT NULL,
  PRIMARY KEY (transakcija_id),
  CONSTRAINT upotreba_dim_1 FOREIGN KEY (lokacija_id) REFERENCES Dim_lokacije (lokacija_id),
  CONSTRAINT upotreba_dim_2 FOREIGN KEY (usluga_id) REFERENCES Dim_korisnik (korisnik_id),
  CONSTRAINT upotreba_dim_3 FOREIGN KEY (datum_id)    REFERENCES Dim_datum (datum_id)
)

CREATE TABLE Fact_promet (
  transakcija_id int NOT NULL ,
  lokacija_id int NOT NULL,
  racun_id int NOT NULL,
  datum_id int NOT NULL,
  
  Total_Upotreba int NOT NULL,
  PRIMARY KEY (transakcija_id),
  CONSTRAINT promet_dim_1 FOREIGN KEY (lokacija_id) REFERENCES Dim_lokacije (lokacija_id),
  CONSTRAINT promet_dim_2 FOREIGN KEY (racun_id) REFERENCES Dim_racun (racun_id),
  CONSTRAINT promet_dim_3 FOREIGN KEY (datum_id)    REFERENCES Dim_datum (datum_id)
)