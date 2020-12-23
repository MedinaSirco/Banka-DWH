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
