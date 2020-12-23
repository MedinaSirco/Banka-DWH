
CREATE TABLE Dim_racun (

racun_id int NOT NULL ,
korisnik_id int NOT NULL ,
naziv varchar(50) Null,
datum_otvaranja Date NOT NULL,
datum_zatvaranja DATE  NULL,
stanje int NULL,
PRIMARY KEY (racun_id),
)
