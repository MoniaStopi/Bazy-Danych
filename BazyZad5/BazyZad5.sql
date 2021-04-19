CREATE SCHEMA ksiegowosc;

   CREATE TABLE ksiegowosc.pracownicy (
	 id_pracownika INTEGER PRIMARY KEY,
	 imie VARCHAR(15) NOT NULL,
	 nazwisko VARCHAR(30) NOT NULL,
	 adres VARCHAR(50),
	 telefon INTEGER
	);
   CREATE TABLE ksiegowosc.godziny (
	 id_godziny INTEGER PRIMARY KEY,
	 data DATE NOT NULL,
	 liczba_godzin INTEGER,
	 id_pracownika INTEGER NOT NULL
	);
   CREATE TABLE ksiegowosc.pensje (
	 id_pensji INTEGER PRIMARY KEY,
	 stanowisko VARCHAR(20) NOT NULL,
	 kwota MONEY,
	 id_premii INTEGER 
	);
   CREATE TABLE ksiegowosc.premie (
	 id_premii INTEGER PRIMARY KEY, 
	 rodzaj VARCHAR(15) NOT NULL, 
	 kwota MONEY
    );
   CREATE TABLE ksiegowosc.wynagrodzenie (
	id_wynagrodzenia INTEGER PRIMARY KEY, 
	data DATE NOT NULL, 
	id_pracownika INTEGER NOT NULL, 
	id_godziny INTEGER NOT NULL, 
	id_pensji INTEGER NOT NULL, 
	id_premii INTEGER NOT NULL
	);
	ALTER TABLE ksiegowosc.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
	ALTER TABLE ksiegowosc.pensje ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);

	ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
	ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);
	ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje(id_pensji);
	ALTER TABLE ksiegowosc.wynagrodzenie ADD CONSTRAINT fk_PensjaPremia FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);
	
	
	COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela zawiera dane na temat pracowników (imie, nazwisko, adres, nr. telefonu)';
	COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela zawiera dane dotyczące liczby przepracowanych godzin przez poszczególnych pracownikow, a także daty kiedy pracowali';
    COMMENT ON TABLE ksiegowosc.pensje IS 'Tabela zawiera dane dotyczące typów stanowisk i kwot za nie wyplacanych, zawiera równiez dane o możliwej premii';
    COMMENT ON TABLE ksiegowosc.premie IS 'Zawiera dane dotyczące rodzaju i kwoty za daną premię';
    COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tutaj mamy wynagrodzenie'; 


	INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) values (1, 'Adam','Kowalski', 'Kraków, Słoneczna 10', 222333111);
	INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) values (2, 'Jolanta', 'Nowak', 'Kraków, Fiolkowa 11', 530123111);
	INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) values (3, 'Monika', 'Tulipan', 'Kraków, Kotlarska 12', 53509551);
	INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) values (4, 'Katarzyna', 'Gazela', 'Kraków, Bosacka 3', 12733551);
	INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) values (5, 'Zbigniew', 'Król', 'Kraków, Jandy 44a', 435754551);
	INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) values (6, 'Kamila', 'Kaczor', 'Kraków, Miłosza 55b', 53531551);
	INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) values (7, 'Bartosz','Ryba', 'Kraków, Zwierzęca 75/34', 4845551);
	INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) values (8, 'Anzelm','Kowalska', 'Kraków, Kotlarska 15', 53112851);
	INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) values (9, 'Karol','Boberek', 'Kraków, Deszczowa 12', 9354351);
	INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) values (10, 'Justyna','Róża', 'Kraków, Szpitalna', 73755551);
	INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) values (11, 'Katarzyna','Róża', 'Kraków, Szpitalna3', 99955551);

	INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (1, '2008-11-11' , 8, 1);
	INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (2, '2008-11-17' , 6, 9);
	INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (3, '2008-12-19' , 8, 8);
	INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (4, '2008-11-25' , 12, 7);
	INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (5, '2008-10-30' , 8, 6);
	INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (6, '2008-10-29' , 6, 5);
	INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (7, '2008-12-01' , 12, 4);
	INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (8, '2008-11-10' , 6, 3);
	INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (9, '2008-12-03' , 8, 2);
	INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (10, '2008-10-28', 8, 10);
	INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) values (11, '2008-10-28', 180, 10);
	
	INSERT INTO ksiegowosc.premie (id_premii,rodzaj, kwota) values (1, 'Kwartalna' , 1000 );
	INSERT INTO ksiegowosc.premie (id_premii,rodzaj, kwota) values (2, 'Kwartalna+' , 1300);
	INSERT INTO ksiegowosc.premie (id_premii,rodzaj, kwota) values (3, 'Roczna' , 1500);
	INSERT INTO ksiegowosc.premie (id_premii,rodzaj, kwota) values (4, 'Za osiągnięcia' , 1000);
	INSERT INTO ksiegowosc.premie (id_premii,rodzaj, kwota) values (5, 'Bonus' , 300);
	INSERT INTO ksiegowosc.premie (id_premii,rodzaj, kwota) values (6, 'Zwrot podatku' , 600);
	INSERT INTO ksiegowosc.premie (id_premii,rodzaj, kwota) values (7, 'Za lata pracy' , 8500);
	INSERT INTO ksiegowosc.premie (id_premii,rodzaj, kwota) values (8, 'Na świeta' , 500);
	INSERT INTO ksiegowosc.premie (id_premii,rodzaj, kwota) values (9, 'Inna' , 1000);
	INSERT INTO ksiegowosc.premie (id_premii,rodzaj, kwota) values (10, 'Brak ' , 0);
	
	INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (1, 'Kurier', 3800, 1);
	INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (2, 'Sprzedawca', 4800, 2);
	INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (3, 'Starszy Księgowy', 5300, 3);
	INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (4, 'Młodszy Księgowy', 3800, 4);
	INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (5, 'Sprzątaczka', 3300, 5);
	INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (6, 'Sekretarka', 4200, 6);
	INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (7, 'Logistyk', 5000, 7);
	INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (8, 'Stażysta', 1700,10 );
	INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (9, 'Kontoler jakości', 3000, 8);
	INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (10, 'Programista', 8000, 9);
	INSERT INTO ksiegowosc.pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (11, 'Kucharka', 800, 9);

	INSERT INTO ksiegowosc.wynagrodzenie VALUES(1, '2008-11-18', 1, 1, 8, 4);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(2, '2008-12-19', 4, 2, 3, 2);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(3, '2008-10-17', 5, 1, 2, 8);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(4, '2008-09-17', 2,10, 9, 4);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(5, '2008-08-11', 3, 4, 5, 9);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(6, '2008-07-16', 1, 7, 7, 7);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(7, '2008-07-15', 7, 1, 1, 10);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(8, '2008-06-14', 6, 4, 4, 5);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(9, '2008-05-17', 8, 4, 2, 6);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(10,'2008-04-17', 10,5, 7, 3); 
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(11,'2008-04-17', 11,5, 7, 3); 

--  a) Wyświetl tylko id pracownika oraz jego nazwisko.
	SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;
--b) Wyświetl id pracowników, których płaca jest większa niż 1000.
	SELECT pracownicy.id_pracownika, pensje.kwota
	FROM ksiegowosc.pensje
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
	INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	WHERE pensje.kwota > 1000::money ; 

--c) Wyświetl id pracowników nieposiadających premii,których płaca jest większa niż 2000. 
--   (ja dałam 1500 bo tylko on nie dostawał premii)
	SELECT wynagrodzenie.id_pracownika , wynagrodzenie.id_premii, pensje.kwota
	FROM ksiegowosc.wynagrodzenie
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_premii = pensje.id_premii
	WHERE pensje.kwota > 1500::money AND(pensje.id_premii = 10); 

--d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’.
	SELECT id_pracownika, imie 
	FROM ksiegowosc.pracownicy
	WHERE imie LIKE 'J%';

--e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
	SELECT id_pracownika, imie, nazwisko
	FROM ksiegowosc.pracownicy
	WHERE (nazwisko LIKE '%n%' OR nazwisko LIKE '%N%') AND (imie LIKE '%a')

--f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie.

--Na potrzeby zadania, potrzebny był update
	/*UPDATE ksiegowosc.godziny
	SET liczba_godzin = liczba_godzin * 15*/ 

   SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, godziny.liczba_godzin-160 AS liczba_nadgodzin
   FROM ksiegowosc.godziny
   INNER JOIN ksiegowosc.pracownicy ON godziny.id_pracownika = pracownicy.id_pracownika
   WHERE godziny.liczba_godzin > 160 ;  

--g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 –3000PLN.
   SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensje.kwota
   FROM ksiegowosc.pensje
   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
   WHERE pensje.kwota BETWEEN 1500::money AND 3000::money;  

--h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinachi nie otrzymali premii.
	SELECT pracownicy.imie, pracownicy.nazwisko,premie.id_premii, godziny.liczba_godzin AS LiczbaGodzin
	FROM ksiegowosc.pracownicy JOIN ((ksiegowosc.wynagrodzenie  JOIN ksiegowosc.premie ON wynagrodzenie.id_premii=premie.id_premii)
	JOIN ksiegowosc.godziny ON wynagrodzenie.id_godziny=godziny.id_godziny) ON wynagrodzenie.id_pracownika=pracownicy.id_pracownika
	WHERE godziny.liczba_godzin  > 160 AND  wynagrodzenie.id_premii = 10
	

--i) Uszereguj pracowników według pensji.
	SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensje.kwota
	FROM ksiegowosc.pensje
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
	INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	ORDER BY pensje.kwota desc; 

--j) Uszereguj pracowników według pensji i premii malejąco.
	SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, premie.kwota
	FROM ksiegowosc.premie
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_premii = premie.id_premii
	INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	ORDER BY premie.kwota desc; 
	
--k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’.
	SELECT count(pensje.id_pensji) AS ilosc_os_zatrudnionych, pensje.stanowisko
	FROM ksiegowosc.pensje
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
	INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	GROUP BY pensje.stanowisko;  

--l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie masz, to przyjmij dowolne inne).
	SELECT AVG(pensje.kwota::numeric::float8) AS Średnia_płaca_sprzedawcy
	FROM ksiegowosc.pensje
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
	INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	WHERE pensje.stanowisko = 'Sprzedawca';

	SELECT MIN(pensje.kwota::numeric::float8) AS Min_płaca_sprzedawcy
	FROM ksiegowosc.pensje
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
	INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	WHERE pensje.stanowisko = 'Sprzedawca';

	SELECT MAX(pensje.kwota::numeric::float8) AS Max_płaca_sprzedawcy
	FROM ksiegowosc.pensje
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
	INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	WHERE pensje.stanowisko = 'Sprzedawca'; 


--m) Policz sumę wszystkich wynagrodzeń.
	SELECT SUM(pensje.kwota::numeric) AS suma_pensji
	FROM ksiegowosc.pensje
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
	INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika; 

--n) Policz sumę wynagrodzeń w ramach danego stanowiska.
	SELECT SUM(pensje.kwota::numeric) AS Suma_plac, pensje.stanowisko
	FROM ksiegowosc.pensje
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
	INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	GROUP BY pensje.stanowisko; 

--o) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.

	SELECT COUNT(premie.id_premii) AS Suma_premii
	FROM ksiegowosc.premie
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_premii = premie.id_premii
	INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika 
	WHERE ksiegowosc.premie.id_premii <> 10


--p) Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł.*/=====================================================

--DO POPRAWY

	SELECT * FROM ksiegowosc.pensje
	SELECT * FROM ksiegowosc.pracownicy
	--DELETE ksiegowosc.pracownicy()
	SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensje.kwota,pracownicy.adres, pracownicy.telefon
	FROM ksiegowosc.pensje
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
	INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	WHERE pensje.kwota < 1800::money; 












