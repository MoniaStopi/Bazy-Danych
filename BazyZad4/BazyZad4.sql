CREATE SCHEMA rozliczenia 
	AUTHORIZATION postgres;

CREATE TABLE rozliczenia.pracownicy 
(
id_pracownika integer PRIMARY KEY NOT NULL UNIQUE,
nazwisko varchar NOT NULL,
adres varchar NOT NULL,
telefon integer NOT NULL
);

CREATE TABLE rozliczenia.godziny
(
id_godziny int UNIQUE PRIMARY KEY,
data date ,
liczba_godzin integer ,
id_pracownika integer  NOT NULL 
);

CREATE TABLE rozliczenia.pensje
(
id_pensji integer NOT NULL UNIQUE PRIMARY KEY,
stanowisko varchar(20) NOT NULL,
kwota money NOT NULL,
id_premii integer NOT NULL
);

CREATE TABLE rozliczenia.premie
(
id_premii integer PRIMARY KEY NOT NULL UNIQUE,
rodziaj varchar(40) NOT NULL,
kwota money NOT NULL
);

ALTER TABLE rozliczenia.pensje
ADD CONSTRAINT fk_PensjaPremia FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

ALTER TABLE rozliczenia.godziny
ADD CONSTRAINT fk_GodzinyPracownicy FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy (id_pracownika);

INSERT INTO rozliczenia.pracownicy (id_pracownika, nazwisko, adres, telefon) values (1, 'Kowalski', 'Kraków, Słoneczna 10', 222333111);
INSERT INTO rozliczenia.pracownicy (id_pracownika, nazwisko, adres, telefon) values (2, 'Nowak', 'Kraków, Fiolkowa 11', 530123111);
INSERT INTO rozliczenia.pracownicy (id_pracownika, nazwisko, adres, telefon) values (3, 'Tulipan', 'Kraków, Kotlarska 12', 53509551);
INSERT INTO rozliczenia.pracownicy (id_pracownika, nazwisko, adres, telefon) values (4, 'Gazela', 'Kraków, Bosacka 3', 12733551);
INSERT INTO rozliczenia.pracownicy (id_pracownika, nazwisko, adres, telefon) values (5, 'Król', 'Kraków, Jandy 44a', 435754551);
INSERT INTO rozliczenia.pracownicy (id_pracownika, nazwisko, adres, telefon) values (6, 'Kaczor', 'Kraków, Miłosza 55b', 53531551);
INSERT INTO rozliczenia.pracownicy (id_pracownika, nazwisko, adres, telefon) values (7, 'Ryba', 'Kraków, Zwierzęca 75/34', 4845551);
INSERT INTO rozliczenia.pracownicy (id_pracownika, nazwisko, adres, telefon) values (8, 'Kowalska', 'Kraków, Kotlarska 15', 53112851);
INSERT INTO rozliczenia.pracownicy (id_pracownika, nazwisko, adres, telefon) values (9, 'Boberek', 'Kraków, Deszczowa 12', 9354351);
INSERT INTO rozliczenia.pracownicy (id_pracownika, nazwisko, adres, telefon) values (10, 'Róża', 'Kraków, Szpitalna', 73755551);

INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (1, '2008-11-11' , 8, 1);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (2, '2008-11-17' , 6, 9);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (3, '2008-12-19' , 8, 8);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (4, '2008-11-25' , 12, 7);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (5, '2008-10-30' , 8, 6);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (6, '2008-10-29' , 6, 5);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (7, '2008-12-01' , 12, 4);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (8, '2008-11-10' , 6, 3);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (9, '2008-12-03' , 8, 2);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (10, '2008-10-28', 8, 10);

ALTER TABLE rozliczenia.premie
RENAME COLUMN "rodziaj" TO "rodzaj";

INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) values (1, 'Kwartalna' , '1000');
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) values (2, 'Kwartalna' , 1300);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) values (3, 'Roczna' , 1500);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) values (4, 'Za osiągnięcia' , 1000);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) values (5, 'Bonus miesięczny' , 300);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) values (6, 'Zwrot podatku' , 600);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) values (7, 'Wynagrodzenie za 30 lat pracy' , 8500);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) values (8, 'Bonus świąteczny' , 500);
INSERT INTO rozliczenia.premie (id_premii,rodzaj, kwota) values (9, 'Inna' , 1000);

INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota_brutto, id_premii) VALUES (1, 'Kurier', 3800, 1);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota_brutto, id_premii) VALUES (2, 'Sprzedawca', 4800, 2);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota_brutto, id_premii) VALUES (3, 'Starszy Księgowy', 5300, 3);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota_brutto, id_premii) VALUES (4, 'Młodszy Księgowy', 3800, 3);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota_brutto, id_premii) VALUES (5, 'Sprzątaczka', 3300, 6);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota_brutto, id_premii) VALUES (6, 'Sekretarka', 4200, 2);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota_brutto, id_premii) VALUES (7, 'Logistyk', 5000, 5);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota_brutto, id_premii) VALUES (8, 'Stażysta', 1700,3 );
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota_brutto, id_premii) VALUES (9, 'Kontoler jakości', 3000, 4);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota_brutto, id_premii) VALUES (9, 'Programista', 6000, 7);



SELECT nazwisko, adres 
FROM rozliczenia.pracownicy

SELECT data, DATE_PART('dow', data) AS DzienTygodnia, DATE_PART('month', data) AS Miesiąc FROM rozliczenia.godziny;

ALTER TABLE rozliczenia.pensje
RENAME COLUMN "kwota" TO "kwota_brutto"
ALTER TABLE rozliczenia.pensje
ADD kwota_netto money

UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto * 0.81