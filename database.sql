SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS Utente;
DROP TABLE IF EXISTS Tariffa;
DROP TABLE IF EXISTS Ordine;
DROP TABLE IF EXISTS Carrello;
DROP TABLE IF EXISTS Prodotto;
DROP TABLE IF EXISTS Dispositivo;
DROP TABLE IF EXISTS Accessorio;
DROP TABLE IF EXISTS Compatibilita;
DROP TABLE IF EXISTS Spedizione;

/* Struttura della tabella Tariffa */

CREATE TABLE Tariffa (
	NomeTariffa VARCHAR(20) PRIMARY KEY,
	GBInternet INT,
	SMS INT,
	Chiamate INT,
	Costo DOUBLE
) ENGINE=InnoDB;

/* Dump dei dati per la tabella Tariffa */

INSERT INTO Tariffa(NomeTariffa, Costo, Chiamate, SMS, GBInternet) VALUES
('AllIncluivePlus', '15', '400', '400', '4'),
('AllInclusive', '12', '200', '200', '02'),
('SoloChiamate', '5', '500', '0', '0'),
('SoloMessaggi', '5', '0', '500', '0'),
('SoloInternet', '5', '0', '0', '4');
INSERT INTO Tariffa(Chiamate, Costo, GBInternet, NomeTariffa, SMS) VALUES
('200', '10', '2', 'All Digital', '100'),
('200', '14,90', '1', 'Smart 200', '200'),
('1000', '8', '2', 'Special 1000', '1000'),
('500', '10,90', '5', 'Super 5GB', '500'),
('500', '8', '2', 'Super 2GB', '300');

/* Struttura della tabella Utente */

CREATE TABLE Utente (
	CodiceFiscale CHAR(16) PRIMARY KEY,
	TariffaAttiva VARCHAR(20),
	Nome VARCHAR(20),
	Cognome VARCHAR(20),
	DataDiNascita DATE,
	LuogoDiNascita VARCHAR(20),
	NumeroDiTelefono NUMERIC(10,0),
	Email VARCHAR(30),
	DataAttivazioneTariffa DATE,
	FOREIGN KEY (TariffaAttiva) REFERENCES Tariffa(NomeTariffa)
) ENGINE=InnoDB;

/* Dump dei dati per la tabella Utente */

INSERT INTO Utente(CodiceFiscale, Cognome, Nome, DataDiNascita, Email, LuogoDiNascita, TariffaAttiva, DataAttivazioneTariffa, NumeroDiTelefono) VALUES
('PLJRWN79E50F548N', 'Rossi', 'Mario', '1990-05-04', 'rossimario@gmail.com', 'Parma', 'All Digital', '2016-05-21', 3138963472),
('JVLZZZ37L02Z143W', 'Verdi', 'Carlo', '1987-10-09', 'verdicarlo@hotmail.it', 'Lecce', 'Smart 200', '2017-01-19', 6603036850),
('GTHBWD95T30M277G', 'Rossi', 'Chiara', '1968-11-15', 'rossichiara@yahoo.it', 'Napoli', 'Super 5GB', '2015-10-03', 4696856348),
('BXLNSF77T59A967J', 'Verdi', 'Luca', '1979-12-30', 'verdiluca@libero.it', 'Palermo', 'Super 2GB', '2016-07-18', 9734659879),
('FJCSGF40M28L369C', 'Trevisan', 'Alberto', '1985-02-24', 'trevisanalberto@gmail.com', 'Venezia', 'AllInclusivePlus', '2016-02-23', 9073479787),
('YGGQOU77E11G881D', 'Biondi', 'Mario', '1975-05-07', 'biondimario@hotmail.it', 'Genova', 'AllInclusive', '2016-03-10', 5736606596),
('BPAPZQ55D42G381V', 'Tommasi', 'Giovanni', '1991-01-21', 'tommasigiovanni@yahoo.it', 'Padova', 'SoloChiamate', '2015-06-01', 7199804288),
('ZUACCM86R52F012O', 'Zambon', 'Silvia', '1984-02-13', 'zambonsilvia@hotmail.com', 'Venezia', 'SoloMessaggi', '2016-11-20', 2485847895),
('PSBMFZ41B68C895T', 'Cesari', 'Alessandra', '1987-07-11', 'cesarialessandra@gmail.com', 'Roma', 'SoloInternet', '2016-08-11', 5183452405),
('GHZPMR84T16C488E', 'Pagani', 'Marco', '1981-06-20', 'paganimarco@gmail.com' , 'Milano', 'SoloInternet', '2016-09-07', 8304211227);

/* Struttura della tabella Ordine */

CREATE TABLE Ordine (
	NumeroOrdine INT PRIMARY KEY,
	Utente CHAR(16),
	CostoTotale DOUBLE,
	MetodoPagamento VARCHAR(20),
	FOREIGN KEY (Utente) REFERENCES Utente(CodiceFiscale)
) ENGINE=InnoDB;

/* Dump dei dati per la tabella Ordine */

INSERT INTO Ordine(Utente, NumeroOrdine, MetodoPagamento, CostoTotale) VALUES
('PLJRWN79E50F548N', 103327341, 'Contrassegno', 0),
('JVLZZZ37L02Z143W', 570803459, 'Mastercard', 0),
('GTHBWD95T30M277G', 192262717, 'Mastercard', 0),
('BXLNSF77T59A967J', 907217601, 'Visa', 0),
('FJCSGF40M28L369C', 978968086, 'PayPal', 0),
('YGGQOU77E11G881D', 479884547, 'PayPal', 0),
('BPAPZQ55D42G381V', 202170158, 'PayPal', 0),
('ZUACCM86R52F012O', 581715534, 'Bonifico bancario', 0),
('PSBMFZ41B68C895T', 254978374, 'Paypal', 0),
('GHZPMR84T16C488E', 827532325, 'Visa', 0);

/* Struttura della tabella Prodotto */

CREATE TABLE Prodotto (
	Nome VARCHAR(20) PRIMARY KEY,
	Prezzo DOUBLE,
	Marca VARCHAR(20),
	Disponibilita BOOLEAN
) ENGINE=InnoDB;

/* Dump dei dati per la tabella Prodotto */

INSERT INTO Prodotto(Nome, Marca, Prezzo, Disponibilita)
VALUES('iPhone 5S', 'Apple', '279', '1'),
('iPhone 6S Plus', 'Apple', '549', '1'),
('iPhone 7 Plus', 'Apple', '809', '0'),
('iPhone SE', 'Apple', '389', '1'),
('Galaxy A5', 'Samsung', '249', '1'),
('Galaxy S7 Edge', 'Samsung', '539', '0'),
('Galaxy S7', 'Samsung', '459', '1'),
('Galaxy J7', 'Samsung', '219', '1'),
('G5 SE', 'LG', '319', '1'),
('K7 WHITE', 'LG', '99.99', '1'),
('P8 Lite', 'Huawei', '149', '0'),
('P9 Lite', 'Huawei', '209', '1'),
('HTC 10', 'HTC', '459', '1'),
('One S9', 'HTC', '299', '1'),
('Lumia 650', 'Microsoft', '99.90', '1'),
('Lumia 950XL', 'Microsoft', '229', '0'),
('Lumia 550', 'Microsoft', '79.99', '1'),
('ZenFone 2 Laser', 'Asus', '149', '0'),
('Xperia X F5121', 'Sony', '329', '1'),
('Xperia XZ', 'Sony', '509', '1'),
('Yoga Tab 3', 'Lenovo', '169', '1'),
('Galaxy Tab Pro', 'Samsung', '609', '1'),
('ZenPad 7', 'Asus', '99', '1'),
('iPad Pro', 'Apple', '609', '0'),
('Galaxy Tab S2', 'Samsung', '409.99', '1'),
('MediaPad M2', 'Huawei', '449', '1'),
('iPad Air 2', 'Apple', '699', '0'),
('iPad Mini 2', 'Apple', '299', '1'),
('ZenPad 10', 'Asus', '249.99', '1');
INSERT INTO Prodotto(Nome, Prezzo, Marca, Disponibilita)
VALUES('Dock Table', '9.99', 'Cellularline', '1'),
('Cavo Lightning', '19.00', 'Apple', '1'),
('Freepower Dual 5200', '29.49', 'Cellularline', '1'),
('Freepower dual 7800', '39.49', 'Cellularline', '1'),
('USB Data Cable Color', '9.99', 'Aiino', '1'),
('Charger Ultra Fast', '39.49', 'Aiino', '1'),
('Clear Touch', '19.99', 'Hama', '1'),
('Book Touch', '24.49', 'Hama', '1'),
('Second Glass Ultra', '22.49', 'Puro', '1'),
('Clear Color', '14.99', 'Puro', '1'),
('Clear Crystal', '12.99', 'Puro', '1'),
('Flip-Book', '19.99', 'Puro', '1'),
('Ok Display Invisible', '9.99', 'Nikon', '1'),
('Mosquito - Universale', '19.99', 'Nikon', '1'),
('Essential Headsets', '18.89', 'Fujifilm', '1');

/* Struttura della tabella Carrello */

CREATE TABLE Carrello (
	QuantitࠉNT,
	NumeroOrdine INT,
	NomeProdotto VARCHAR(20),
	PRIMARY KEY (NumeroOrdine, NomeProdotto),
	FOREIGN KEY (NumeroOrdine) REFERENCES Ordine(NumeroOrdine),
	FOREIGN KEY (NomeProdotto) REFERENCES Prodotto(Nome)
) ENGINE=InnoDB;

/* Dump dei dati per la tabella Carrello */

INSERT INTO Carrello(NumeroOrdine, NomeProdotto, Quantit੠VALUES
(103327341, 'iPhone 5S', 1),
(103327341, 'Cavo Lightning', 1),
(570803459, 'Galaxy A5', 1),
(570803459, 'Clear Color', 1),
(570803459, 'Mosquito - Universale', 1),
(192262717, 'Essential Headsets', 1),
(192262717, 'Flip-Book', 1),
(192262717, 'USB Data Cable Color', 2),
(907217601, 'iPhone 7 Plus', 1),
(978968086, 'iPhone SE', 1),
(978968086, 'Galaxy A5', 1),
(479884547, 'Galaxy S7 Edge', 1),
(479884547, 'Freepower Dual 5200', 1),
(479884547, 'Second Glass Ultra', 3),
(202170158, 'G5 SE', 1),
(581715534, 'Yoga Tab 3', 1),
(581715534, 'Ok Display Invisible', 2),
(581715534, 'Book Touch', 1),
(254978374, 'ZenPad 7', 1),
(254978374, 'iPad Pro', 1),
(254978374, 'Cavo Lightning', 2),
(254978374, 'Clear Color', 2),
(827532325, 'P9 Lite', 1),
(827532325, 'Charger Ultra Fast', 1);

/* Struttura della tabella Dispositivo */

CREATE TABLE Dispositivo (
	NomeDispositivo VARCHAR(20) PRIMARY KEY,
	Batteria INT,
	DimensioneDisplay DOUBLE,
	GBMemoria INT,
	MPFotocamera INT,
	SistemaOperativo ENUM('iOS', 'Android', 'WindowsPhone'),
	Tipo ENUM('Smartphone', 'Tablet'),
	ProdottoRicondizionato BOOLEAN,
	FOREIGN KEY (NomeDispositivo) REFERENCES Prodotto(Nome)
) ENGINE=InnoDB;

/* Dump dei dati per la tabella Dispositivo */

INSERT INTO Dispositivo(NomeDispositivo, Tipo, DimensioneDisplay, GBMemoria, MPFotocamera, Batteria, SistemaOperativo, ProdottoRicondizionato) VALUES
('iPhone 5S', 'Smartphone', '4', '16', '8', '1570', 'iOS', '0'),
('iPhone 6S Plus', 'Smartphone', '5.5', '128', '8', '2750', 'iOS', '0'),
('iPhone 7 Plus', 'Smartphone', '5.5', '256', '6', '2900', 'iOS', '0'),
('iPhone SE', 'Smartphone', '4', '64', '8', '1624', 'iOS', '1'),
('Galaxy A5', 'Smartphone', '5.2', '32', '8', '3000', 'Android', '0'),
('Galaxy S7 Edge', 'Smartphone', '5.5', '32', '9', '3600', 'Android', '0'),
('Galaxy S7', 'Smartphone', '5.1', '32', '8', '3000', 'Android', '0'),
('Galaxy J7', 'Smartphone', '5.5', '16', '5', '3300', 'Android', '1'),
('G5 SE', 'Smartphone', '5.3', '32', '8', '2800', 'Android', '0'),
('K7 WHITE', 'Smartphone', '5', '8', '6', '2125', 'Android', '0'),
('P8 Lite', 'Smartphone', '5.2', '16', '8', '3000', 'Android', '0'),
('P9 Lite', 'Smartphone', '5.2', '16', '6', '3000', 'Android', '0'),
('HTC 10', 'Smartphone', '5.2', '16', '10', '3000', 'Android', '0'),
('One S9', 'Smartphone', '5', '16', '8', '2840', 'Android', '1'),
('Lumia 650', 'Smartphone', '5', '16', '6', '2000', 'WindowsPhone', '0');
INSERT INTO Dispositivo(NomeDispositivo, Batteria, DimensioneDisplay, GBMemoria, MPFotocamera, SistemaOperativo, Tipo, ProdottoRicondizionato) VALUES
('Lumia 950XL', 3340, 5.7, 32, 20, 'WindowsPhone', 'Smartphone', '0'),
('ZenFone 2 Laser', 2400, 5, 8, 13, 'Android', 'Smartphone', '1'),
('Xperia X F5121', 2620, 5, 32, 23, 'Android', 'Smartphone', '0'),
('Xperia XZ', 2900, 5.2, 32, 23, 'Android', 'Smartphone', '1'),
('Yoga Tab 3', 6200, 8, 16, 8, 'Android', 'Tablet', '0'),
('Galaxy Tab Pro', 4800, 8.4, 16, 8, 'Android', 'Tablet', '0'),
('ZenPad 7', 3450, 7, 16, 8, 'Android', 'Tablet', '0'),
('iPad Pro', 10307, 12.9, 32, 8, 'iOS', 'Tablet', '1'),
('Galaxy Tab S2', 5870, 9.7, 32, 8, 'Android', 'Tablet', '0'),
('MediaPad M2', 4800, 8.0, 32, 8, 'Android', 'Tablet', '1'),
('iPad Air 2', 7340, 9.7, 16, 8, 'iOS', 'Tablet', '0'),
('iPad Mini 2', 6470, 7.9, 16, 5, 'iOS', 'Tablet', '0'),
('ZenPad 10', 4890, 10.1, 8, 5, 'Android', 'Tablet', '0');

/* Struttura della tabella Accessorio */

CREATE TABLE Accessorio (
	NomeAccessorio VARCHAR(20) PRIMARY KEY,
	Categoria VARCHAR(20),
	FOREIGN KEY (NomeAccessorio) REFERENCES Prodotto(Nome)
) ENGINE=InnoDB;

/* Dump dei dati per la tabella Accessorio */

INSERT INTO Accessorio(NomeAccessorio, Categoria) VALUES
('Dock Table', 'Caricabatterie'),
('Cavo Lightning', 'Cavi'),
('Freepower Dual 5200', 'Power bank'),
('Freepower Dual 7800', 'Power bank'),
('USB Data Cable Color', 'Cavi'),
('Charger Ultra Fast', 'Caricabatterie'),
('Clear Touch', 'Pellicole protettive'),
('Book Touch', 'Custodie'),
('Second Glass Ultra', 'Pellicole protettive'),
('Clear Color', 'Pellicole protettive'),
('Clear Crystal', 'Pellicole protettive'),
('Flip-Book', 'Custodie'),
('Ok Display Invisible', 'Pellicole protettive'),
('Mosquito - Universale', 'Auricolari'),
('Essential Headsets', 'Auricolari');

/* Struttura della tabella Compatibilita */

CREATE TABLE Compatibilita (
	NomeDispositivo VARCHAR(20),
	NomeAccessorio VARCHAR(20),
	PRIMARY KEY (NomeDispositivo, NomeAccessorio),
	FOREIGN KEY (NomeDispositivo) REFERENCES Dispositivo(NomeDispositivo),
	FOREIGN KEY (NomeAccessorio) REFERENCES Accessorio(NomeAccessorio)
) ENGINE=InnoDB;

/* Dump dei dati per la tabella Compatibilita */

INSERT INTO Compatibilita(NomeAccessorio, NomeDispositivo) VALUES
('Dock Table', 'Lumia 650'),
('Dock Table', 'Xperia XZ'),
('Dock Table', 'Galaxy A5'),
('Dock Table', 'G5 SE'),
('Dock Table', 'P8 Lite'),
('Cavo Lightning', 'iPad Pro'),
('Cavo Lightning', 'iPad Air 2'),
('Cavo Lightning', 'iPad Mini 2'),
('Cavo Lightning', 'iPhone 5S'),
('Cavo Lightning', 'iPhone 6S Plus'),
('Cavo Lightning', 'iPhone 7 Plus'),
('Cavo Lightning', 'iPhone SE'),
('Freepower Dual 5200', 'Lumia 950XL'),
('Freepower Dual 5200', 'ZenFone 2 Laser'),
('Freepower Dual 5200', 'Xperia X F5121'),
('Freepower Dual 5200', 'Xperia XZ'),
('Freepower Dual 5200', 'Yoga Tab 3'),
('Freepower Dual 5200', 'Galaxy Tab Pro'),
('Freepower Dual 5200', 'ZenPad 7'),
('Freepower Dual 5200', 'iPad Pro'),
('Freepower Dual 5200', 'Galaxy Tab S2'),
('Freepower Dual 5200', 'MediaPad M2'),
('Freepower Dual 5200', 'iPad Air 2'),
('Freepower Dual 5200', 'iPad Mini 2'),
('Freepower Dual 5200', 'ZenPad 10'),
('Freepower Dual 5200', 'iPhone 5S'),
('Freepower Dual 5200', 'iPhone 6S Plus'),
('Freepower Dual 5200', 'iPhone 7 Plus'),
('Freepower Dual 5200', 'iPhone SE'),
('Freepower Dual 5200', 'Galaxy A5'),
('Freepower Dual 5200', 'Galaxy S7 Edge'),
('Freepower Dual 5200', 'Galaxy S7'),
('Freepower Dual 5200', 'Galaxy J7'),
('Freepower Dual 5200', 'G5 SE'),
('Freepower Dual 5200', 'K7 WHITE'),
('Freepower Dual 5200', 'P8 Lite'),
('Freepower Dual 5200', 'P9 Lite'),
('Freepower Dual 5200', 'HTC 10'),
('Freepower Dual 5200', 'One S9'),
('Freepower Dual 5200', 'Lumia 650'),
('Freepower Dual 7800', 'Lumia 950XL'),
('Freepower Dual 7800', 'ZenFone 2 Laser'),
('Freepower Dual 7800', 'Xperia X F5121'),
('Freepower Dual 7800', 'Xperia XZ'),
('Freepower Dual 7800', 'Yoga Tab 3'),
('Freepower Dual 7800', 'Galaxy Tab Pro'),
('Freepower Dual 7800', 'ZenPad 7'),
('Freepower Dual 7800', 'iPad Pro'),
('Freepower Dual 7800', 'Galaxy Tab S2'),
('Freepower Dual 7800', 'MediaPad M2'),
('Freepower Dual 7800', 'iPad Air 2'),
('Freepower Dual 7800', 'iPad Mini 2'),
('Freepower Dual 7800', 'ZenPad 10'),
('Freepower Dual 7800', 'iPhone 5S'),
('Freepower Dual 7800', 'iPhone 6S Plus'),
('Freepower Dual 7800', 'iPhone 7 Plus'),
('Freepower Dual 7800', 'iPhone SE'),
('Freepower Dual 7800', 'Galaxy A5'),
('Freepower Dual 7800', 'Galaxy S7 Edge'),
('Freepower Dual 7800', 'Galaxy S7'),
('Freepower Dual 7800', 'Galaxy J7'),
('Freepower Dual 7800', 'G5 SE'),
('Freepower Dual 7800', 'K7 WHITE'),
('Freepower Dual 7800', 'P8 Lite'),
('Freepower Dual 7800', 'P9 Lite'),
('Freepower Dual 7800', 'HTC 10'),
('Freepower Dual 7800', 'One S9'),
('Freepower Dual 7800', 'Lumia 650'),
('USB Dati Cable Color', 'Lumia 950XL'),
('USB Dati Cable Color', 'ZenFone 2 Laser'),
('USB Dati Cable Color', 'Xperia X F5121'),
('USB Dati Cable Color', 'Xperia XZ'),
('USB Dati Cable Color', 'Yoga Tab 3'),
('USB Dati Cable Color', 'Galaxy Tab Pro'),
('USB Dati Cable Color', 'ZenPad 7'),
('USB Dati Cable Color', 'iPad Pro'),
('USB Dati Cable Color', 'Galaxy Tab S2'),
('USB Dati Cable Color', 'MediaPad M2'),
('USB Dati Cable Color', 'iPad Air 2'),
('USB Dati Cable Color', 'iPad Mini 2'),
('USB Dati Cable Color', 'ZenPad 10'),
('USB Dati Cable Color', 'iPhone 5S'),
('USB Dati Cable Color', 'iPhone 6S Plus'),
('USB Dati Cable Color', 'iPhone 7 Plus'),
('USB Dati Cable Color', 'iPhone SE'),
('USB Dati Cable Color', 'Galaxy A5'),
('USB Dati Cable Color', 'Galaxy S7 Edge'),
('USB Dati Cable Color', 'Galaxy S7'),
('USB Dati Cable Color', 'Galaxy J7'),
('USB Dati Cable Color', 'G5 SE'),
('USB Dati Cable Color', 'K7 WHITE'),
('USB Dati Cable Color', 'P8 Lite'),
('USB Dati Cable Color', 'P9 Lite'),
('USB Dati Cable Color', 'HTC 10'),
('USB Dati Cable Color', 'One S9'),
('USB Dati Cable Color', 'Lumia 650'),
('Charger Ultra Fast', 'Galaxy Tab Pro'),
('Charger Ultra Fast', 'Galaxy S7 Edge'),
('Charger Ultra Fast', 'Galaxy S7'),
('Clear Touch', 'Lumia 950XL'),
('Clear Touch', 'iPhone 6S Plus'),
('Clear Touch', 'iPhone 7 Plus'),
('Clear Touch', 'Galaxy S7 Edge'),
('Clear Touch', 'Galaxy S7'),
('Clear Touch', 'P8 Lite'),
('Clear Touch', 'HTC 10'),
('Book Touch', 'Galaxy S7 Edge'),
('Book Touch', 'P9 Lite'),
('Book Touch', 'iPhone 7 Plus'),
('Book Touch', 'Lumia 950XL'),
('Book Touch', 'iPad Air 2'),
('Second Glass Ultra', 'iPad Pro'),
('Second Glass Ultra', 'iPad Mini 2'),
('Second Glass Ultra', 'iPhone 5S'),
('Second Glass Ultra', 'iPhone 6S Plus'),
('Second Glass Ultra', 'iPhone 7 Plus'),
('Second Glass Ultra', 'iPhone SE'),
('Second Glass Ultra', 'Galaxy S7 Edge'),
('Second Glass Ultra', 'Galaxy S7'),
('Second Glass Ultra', 'Galaxy A5'),
('Second Glass Ultra', 'Galaxy J7'),
('Clear Color', 'Lumia 950XL'),
('Clear Color', 'ZenFone 2 Laser'),
('Clear Color', 'Xperia X F5121'),
('Clear Color', 'Xperia XZ'),
('Clear Color', 'Yoga Tab 3'),
('Clear Color', 'Galaxy Tab Pro'),
('Clear Color', 'ZenPad 7'),
('Clear Crystal', 'iPhone 6S Plus'),
('Clear Crystal', 'iPhone 7 Plus'),
('Clear Crystal', 'iPhone SE'),
('Flip-Book', 'Galaxy S7'),
('Flip-Book', 'Galaxy S7 Edge'),
('Ok Display Invisible', 'iPhone 7 Plus'),
('Mosquito - Universale', 'Galaxy S7'),
('Mosquito - Universale', 'Galaxy J7'),
('Mosquito - Universale', 'Galaxy A5'),
('Mosquito - Universale', 'Xperia XZ'),
('Mosquito - Universale', 'ZenPad 10'),
('Mosquito - Universale', 'One S9'),
('Mosquito - Universale', 'Lumia 650'),
('Mosquito - Universale', 'iPhone 5S'),
('Mosquito - Universale', 'iPad Mini 2'),
('Mosquito - Universale', 'Yoga Tab 3'),
('Mosquito - Universale', 'ZenFone 2 Laser'),
('Essential Headsets', 'iPhone 6S Plus'),
('Essential Headsets', 'iPhone 7 Plus'),
('Essential Headsets', 'iPhone SE'),
('Essential Headsets', 'Galaxy A5'),
('Essential Headsets', 'Galaxy S7 Edge'),
('Essential Headsets', 'Galaxy S7'),
('Essential Headsets', 'Galaxy J7'),
('Essential Headsets', 'G5 SE'),
('Essential Headsets', 'K7 WHITE'),
('Essential Headsets', 'P8 Lite');

/* Struttura della tabella Spedizione */

CREATE TABLE Spedizione (
	NumeroSpedizione INT PRIMARY KEY,
	NumeroOrdine INT,
	CostoSpedizione DOUBLE,
	Corriere VARCHAR(20),
	DataConsegnaStimata DATE,
	PaeseDiConsegna VARCHAR(20),
	FOREIGN KEY (NumeroOrdine) REFERENCES Ordine(NumeroOrdine)
) ENGINE=InnoDB;

/* Dump dei dati per la tabella Spedizione */

INSERT INTO Spedizione(NumeroSpedizione, NumeroOrdine, CostoSpedizione, Corriere, DataConsegnaStimata,PaeseDiConsegna) VALUES
(86767689, 103327341, 2.50, 'Bartolini', '2017-02-20', 'Italia'),
(27345790, 103327341, 5, 'Bartolini', '2017-02-19', 'Italia'),
(33620056, 103327341, 2, 'Bartolini', '2017-02-23', 'Italia'),
(92908034, 570803459, 3, 'Bartolini', '2017-03-04', 'Austria'),
(46904730, 570803459, 2, 'DHL', '2017-03-10', 'Francia'),
(61611404, 192262717, 2, 'DHL', '2017-03-01', 'Italia'),
(49733291, 907217601, 2.50, 'DHL', '2017-03-05', 'Germania'),
(77065393, 978968086, 3.50, 'GLS', '2017-02-18', 'Italia'),
(89830882, 479884547, 2, 'GLS', '2017-02-25', 'Italia'),
(98280102, 202170158, 4, 'GLS', '2017-04-10', 'Italia'),
(57120034, 581715534, 4.50, 'UPS', '2017-04-03', 'Italia'),
(12666754, 254978374, 1.50, 'UPS', '2017-03-11', 'Italia'),
(84582429, 827532325, 5.50, 'UPS', '2017-03-15', 'Italia'),
(58729549, 827532325, 2.50, 'UPS', '2017-04-20', 'Italia'),
(40438377, 827532325, 3, 'UPS', '2017-04-01', 'Italia');

SET FOREIGN_KEY_CHECKS=1;