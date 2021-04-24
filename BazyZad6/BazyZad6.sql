SELECT * FROM ksiegowosc.godziny godziny
SELECT * FROM ksiegowosc.pensje pensje
SELECT * FROM ksiegowosc.pracownicy pracownicy
SELECT * FROM ksiegowosc.premie premie
SELECT * FROM ksiegowosc.wynagrodzenie wynagrodzenie

--ZAD 1 i 2
ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon TYPE varchar
USING telefon::character varying

UPDATE ksiegowosc.pracownicy 
SET telefon = 
('+48 '::varchar)||substring(telefon, 0, 4)||
'-' || substring(telefon, 4, 3) ||
'-' || substring(telefon,5,3) 

SELECT telefon FROM ksiegowosc.pracownicy

--ZAD3

SELECT UPPER(nazwisko), imie, adres
FROM ksiegowosc.pracownicy 
WHERE length(nazwisko) = (SELECT max(length(nazwisko)) FROM ksiegowosc.pracownicy);

--ZAD4
ALTER TABLE ksiegowosc.pensje 
ALTER COLUMN kwota TYPE varchar
USING kwota::character varying
SELECT 
 MD5(pracownicy.imie) AS Chronione_Imie,
 MD5(pracownicy.nazwisko) AS Chronione_Nazwisko,
 MD5(pracownicy.adres) AS Chroniony_Adres,
 MD5(pracownicy.telefon) AS Chroniony_Nr_Telefonu,
MD5(pensje.kwota) AS Chroniony_Pensja
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika 
JOIN ksiegowosc.pensje ON pensje.id_pensji = wynagrodzenie.id_pensji

--ZAD5

SELECT 
pracownicy.imie AS Imie,
pracownicy.nazwisko AS Nazwisko,
premie.kwota AS Premia,
pensje.kwota AS Pensja
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
LEFT JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
LEFT JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika

--ZAD6

SELECT 
('Pracownik ' || pracownicy.imie || ' ' || pracownicy.nazwisko ||' w dniu ' || wynagrodzenie.data ||
' otrzymał/a pensje całowitą na kwotę ' || pensje.kwota + premie.kwota + (godziny.liczba_godzin::money - 120::money)*25 ||
' gdzie wynagrodzenie zasadnicze wynosiło: ' || pensje.kwota || 
', premia: ' || premie.kwota ||', wyrobniona norma pracy / nadgodziny: ' || (godziny.liczba_godzin-120)*25 || ' zł')
AS RAPORT 
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika 
JOIN ksiegowosc.godziny ON wynagrodzenie.id_godziny = godziny.id_godziny
JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji

