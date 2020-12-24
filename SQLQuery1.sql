USE [Bank]
GO
DROP TABLE IF EXISTS "transakcije"; 
DROP TABLE IF EXISTS "racun";
DROP TABLE IF EXISTS "korisnik";
DROP TABLE IF EXISTS "posao";
DROP TABLE IF EXISTS "lokacije";
DROP TABLE IF EXISTS "usluga";
DROP TABLE IF EXISTS "vrsta_transakcije"; 
DROP TABLE IF EXISTS "datum"; 



GO
CREATE TABLE posao (
  posao_id int NOT NULL ,
  posao_naziv varchar(100) DEFAULT NULL,
  PRIMARY KEY (posao_id)
)

CREATE TABLE korisnik (
  korisnik_id int NOT NULL ,
  posao_id int NOT NULL,
  korisnik_ime varchar(100) DEFAULT NULL,
  korisnik_prezime varchar(100) DEFAULT NULL,
  korisnik_adresa varchar(100) DEFAULT NULL,
  PRIMARY KEY (korisnik_id),
  CONSTRAINT korisnik_ibfk_1 FOREIGN KEY (posao_id) REFERENCES posao (posao_id)
)

CREATE TABLE racun (

racun_id int NOT NULL ,
korisnik_id int NOT NULL ,
naziv varchar(50) Null,
datum_otvaranja Date NOT NULL,
datum_zatvaranja DATE  NULL,
stanje int NULL,
PRIMARY KEY (racun_id),
CONSTRAINT racun_ibfk_1 FOREIGN KEY (korisnik_id) REFERENCES korisnik (korisnik_id)
)

CREATE TABLE lokacije (
  lokacija_id int NOT NULL ,
  lokacija_naziv varchar(100) DEFAULT NULL,
  PRIMARY KEY (lokacija_id)
)

CREATE TABLE vrsta_transakcije (
  vrsta_transakcije_id int NOT NULL ,
  naziv_transakcije varchar(100) DEFAULT NULL,
  PRIMARY KEY (vrsta_transakcije_id)
)

CREATE TABLE datum (
  datum_id int NOT NULL ,
  datum Date   NULL,
  dan_u_sedmici int NUll,
  mjesec_broj int NUll,
  mjesec_ime varchar(100) NULL,
  godina int NULL,
  PRIMARY KEY (datum_id)
)


CREATE TABLE usluga (
  usluga_id int NOT NULL ,
  usluga_naziv varchar(100) DEFAULT NULL,
  PRIMARY KEY (usluga_id)
) 



CREATE TABLE transakcije (
  transakcija_id int NOT NULL ,
  racun_id int NOT NULL,
  lokacija_id int NOT NULL,
  usluga_id int NOT NULL,
  vrsta_transakcije_id int NOT NULL,
  datum_id int NOT NULL,
  /*datum_transakcije_id date DEFAULT NULL,*/
  kolicina int NOT NULL,
  PRIMARY KEY (transakcija_id),
  CONSTRAINT transakcije_ibfk_1 FOREIGN KEY (racun_id) REFERENCES racun (racun_id),
  CONSTRAINT transakcije_ibfk_2 FOREIGN KEY (lokacija_id) REFERENCES lokacije (lokacija_id),
  CONSTRAINT transakcije_ibfk_3 FOREIGN KEY (usluga_id) REFERENCES usluga (usluga_id),
  CONSTRAINT transakcije_ibfk_4 FOREIGN KEY (vrsta_transakcije_id) REFERENCES vrsta_transakcije (vrsta_transakcije_id),
  CONSTRAINT transakcije_ibfk_5 FOREIGN KEY (datum_id) REFERENCES datum (datum_id)


)
GO
INSERT INTO datum VALUES (1,'2008-01-04',1,1,'Januar',2008),(2,'2006-07-12',2,7,'August',2006),(3,'2007-06-11',2,6,'Juni',2007), (4,'2005-04-04',4,4,'April',2005),(5,'2000-01-01',1,1,'Januar',2000),(6,'2018-12-31',5,12,'Decembar',2018);
INSERT INTO posao VALUES (1,'Bankar'),(2,'Sekretarica'),(3,'Nezaposlen'),(4,'Nezaposlena'),(5,'Profesor'),(6,'CEO'),(7,'Penzioner'),(8,'Stručnjak za razvoj softvera'),(9,'Student'),(10,'Profesionalni kauboj');
INSERT INTO korisnik VALUES (1,8,'Tarik','Pleho','Prnjavorska 42'),(2,8,'Medina','Sirćo','Sunset Boulverad bb'),(3,8,'Muamer','Bandić','Ajfelova tornja 22'),(4,8,'Emir','Kurtović','Edina Džeke 7c'),(5,8,'Amna','Spahić','Green Mile 2'),(6,8,'Tarik','Pleho','Prnjavorska 42'),(7,10,'Johntra','Volta','Put sretnih kauboja 99'),(8,6,'Elon','Musk','Mars 1'),(9,1,'Samir','Emir','Žuti taksi 2'),(10,2,'Hana','Hanalić','Generična ulica 1'),(11,3,'Emina','Eminagić','Izmišljena ulica 2'),(12,4,'Džemal','Džemalović','Fiktivni bulevar 3'),(13,5,'Damir','Omerašević','Zmaja od Bosne bb'),(14,7,'Deda','Mraz','Sjeverni Pol');
INSERT INTO usluga VALUES (1,'Kredit'),(2,'Hipoteka'),(3,'Transfer novca'),(4,'Depozit'),(5,'Podizanje sa racuna'),(6,'Studentski kredit'),(7,'Listing stanja0'),(8,'Otvaranje racuna'),(9,'Zatvaranje racuna'),(10,'Orocena stednja');
INSERT INTO lokacije VALUES (1,'Los Angeles'),(2,'Sarajevo'),(3,'Ustiprača'),(4,'Berlin'),(5,'Grbavica'),(6,'Taj Mahal'),(7,'Amazonska Prašuma'),(8,'Buenos Aires'),(9,'Las Vegas'),(10,'London');
INSERT INTO vrsta_transakcije VALUES (1,'Kupovina'),(2,'Rata'),(3,'Najam');
INSERT INTO racun VALUES (1,1,'MasterCard','2008-01-04',NULL,50),(2,2,'MasterCard','2008-01-04',NULL,50),(3,2,'MasterCard','2008-01-04',NULL,50),(4,3,'MasterCard','2008-01-04',NULL,100),(5,4,'MasterCard','2008-01-04','2009-01-04',0);
INSERT INTO transakcije VALUES (1,4,5,2,1,1,5),(2,2,7,5,2,6,4),(3,1,6,1,3,5,1),(4,3,4,4,2,4,6),(5,5,5,2,1,2,5),(6,2,3,5,2,4,2),(7,2,2,1,3,5,15),(8,2,1,4,1,1,65),(9,5,5,2,1,5,5),(10,2,3,5,2,6,4),(11,2,8,6,3,6,155),(12,5,8,7,2,3,6);

GO
/*
Select * FROM posao;
Select * FROM korisnik;
Select * FROM usluga;
Select * FROM lokacije;
Select * FROM vrsta_transakcije;
Select * FROM racun;
Select * FROM transakcije;*/
Select * FROM racun;
Select * FROM korisnik;

GO


