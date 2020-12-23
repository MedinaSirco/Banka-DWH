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