CREATE TABLE Dim_korisnik (
  korisnik_id int NOT NULL ,
  posao_id int NOT NULL,
  korisnik_ime varchar(100) DEFAULT NULL,
  korisnik_prezime varchar(100) DEFAULT NULL,
  korisnik_adresa varchar(100) DEFAULT NULL,
  PRIMARY KEY (korisnik_id),
)
