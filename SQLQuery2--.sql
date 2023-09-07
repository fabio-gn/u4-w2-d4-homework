CREATE TABLE Impiegati(
	IDimpiegato  INT IDENTITY PRIMARY KEY,
	Cognome NVARCHAR(30) NOT NULL,
	Nome NVARCHAR(30) NOT NULL,
	CodiceFiscale CHAR(16) NOT NULL,
	Eta INT NOT NULL,
	RedditoMensile INT,
	DetrazioneFiscale BIT

)

CREATE TABLE Impieghi(
	IDimpiego INT IDENTITY PRIMARY KEY,
	TipoImpiego NVARCHAR(50),
	Data_assunzione DATE
)
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
--1
ALTER TABLE Impiegati ADD IDimpiego INT
ALTER TABLE Impiegati ADD CONSTRAINT FK_IMPIEGATI_IMPIEGHI FOREIGN KEY (IDimpiego) REFERENCES Impieghi(IDimpiego)

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------

--2
INSERT INTO Impiegati (Cognome, Nome, CodiceFiscale, Eta, RedditoMensile, DetrazioneFiscale)
VALUES
    ('Rossi', 'Mario', 'RSSMRA01A01H123B', 35, 3000, 1),
    ('Bianchi', 'Laura', 'BNCCHR02B02D456C', 28, 2500, 1),
    ('Verdi', 'Giovanni', 'VRDGNN03C03E789D', 42, 4000, 0),
    ('Ferrari', 'Maria', 'FRRMRA04D04F012E', 31, 2800, 1),
    ('Romano', 'Luca', 'RMNLCA05E05G345F', 29, 2600, 0),
    ('Russo', 'Anna', 'RSSANN06F06H678G', 37, 3200, 1),
    ('Esposito', 'Paolo', 'ESPPAO07G07I901H', 45, 4200, 1),
    ('Martini', 'Elena', 'MRTLEN08H08L234I', 33, 2700, 1),
    ('Conti', 'Andrea', 'CNTNDR09I09K567L', 39, 3500, 0),
    ('Gentile', 'Giuseppe', 'GNTGPP10J10M890N', 47, 4500, 0),
    ('De Luca', 'Martina', 'DLMRTN11K11O123P', 30, 2600, 1),
    ('Barbieri', 'Marco', 'BRBMRC12L12P456Q', 34, 2900, 0),
    ('Russo', 'Paola', 'RSSPAL13M13R789S', 36, 3100, 1),
    ('Moretti', 'Luca', 'MRTLCU14N14T012U', 32, 2700, 1),
    ('Conti', 'Alessia', 'CNTALS15O15V234W', 38, 3400, 0),
    ('Ricci', 'Alessandro', 'RCCLSN16P16X567Y', 40, 3600, 1),
    ('Mancini', 'Laura', 'MCNLRA17Q17Z890A', 29, 2500, 0),
    ('Gallo', 'Marco', 'GLLMRC18R18B123C', 43, 4100, 0),
    ('Ferrari', 'Chiara', 'FRRCHR19S19D456E', 31, 2800, 1),
    ('Vitale', 'Giorgio', 'VTLGIO20T20F012G', 44, 3900, 1);

INSERT INTO Impieghi (TipoImpiego, Data_assunzione)
VALUES
    ('Sviluppatore Web', '2022-01-15'),
    ('Gestore Progetti', '2021-11-20'),
    ('Analista Dati', '2022-03-10'),
    ('Assistente Amministrativo', '2022-02-01'),
    ('Sviluppatore Mobile', '2022-04-05'),
    ('Responsabile Marketing', '2021-09-15'),
    ('Direttore Generale', '2021-07-01'),
    ('Contabile', '2022-05-20'),
    ('Ingegnere del Software', '2022-06-30'),
    ('Analista Finanziario', '2021-10-10');
SELECT * FROM Impiegati

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------

--3a
SELECT * FROM Impiegati
WHERE ETA > 29
--3b
SELECT * FROM Impiegati
WHERE RedditoMensile > 3000 --ho messo 3000 perché la lista fittizia di impiegati 
							--era molto ottimista sugli stipendi e stavano tutti sopra gli 800
--3c
SELECT * FROM Impiegati 
WHERE DetrazioneFiscale = 1
--3d
SELECT * FROM Impiegati 
WHERE DetrazioneFiscale = 0
--3e
SELECT * FROM Impiegati
WHERE Cognome like 'G%'
ORDER BY Cognome
--3f
SELECT COUNT(*) as NumeroImpiegati FROM Impiegati
--3g
SELECT SUM(RedditoMensile) as SommaTotaleRedditi FROM Impiegati
--3h
SELECT AVG(RedditoMensile) as RedditoMedio FROM Impiegati
--3i
SELECT TOP(1) RedditoMensile FROM Impiegati
ORDER BY RedditoMensile DESC

SELECT MAX(RedditoMensile) as RedditoMensileMassimo FROM Impiegati
--3j
SELECT TOP(1) RedditoMensile as RedditoMensileMinore FROM Impiegati
ORDER BY RedditoMensile ASC


SELECT MIN(RedditoMensile) as RedditoMensileMinimo FROM Impiegati

--3k
SELECT * FROM Impiegati as I
LEFT JOIN                   --non ho trovato una soluzione al fatto che Joinando due tabelle con n° di records diverso molti valori diventano NULL
Impieghi as II ON
 II.IDimpiego = I.IDimpiegato
 WHERE Data_assunzione BETWEEN '2021-01-01' AND '2022-01-01'
--3l

--3m
SELECT AVG(Eta) as EtàMedia FROM Impiegati

--4 (Da completare)
