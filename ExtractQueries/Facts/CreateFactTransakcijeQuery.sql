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


