/*
* podstawowe zapytanie z INNER JOIN
* - złączenie tabel Produkt i Kategoria
* - filtrowanie po nazwie kategorii
*/
SELECT p.sku, p.nazwa, p.cena 
FROM Produkt p
JOIN Kategoria k ON p.id_kategorii = k.id_kategorii
WHERE k.nazwa = 'Napoje';


/*
* wyswietlenie id_zamowienia, statusu oraz date zlozenia z zamowienia klienta o podanym emailu
* - pytanie skorelowane
* - WHERE
*/
SELECT z.id_zamowienia, z.status, z.data_zlozenia 
FROM Zamowienie z
JOIN Klient k ON z.id_klienta = k.id_klienta
WHERE k.email = 'jan.kowalski@example.com';

/*
* wyswietlenie imienia, nazwiska i emaila klienta z zamowienia o id_klienta
* - zapytanie nieskorelowane
*/
SELECT DISTINCT k.imie, k.nazwisko, k.email 
FROM Klient k
JOIN Zamowienie z ON k.id_klienta = z.id_klienta;

/*
* zapytanie z wieloma złączeniami i subquery
* - podzapytanie skorelowane
* - funkcję agregującą AVG
* - porównanie z wynikiem podzapytania
*/
SELECT p.sku, p.nazwa, p.cena, k.nazwa as kategoria
FROM Produkt p
INNER JOIN Kategoria k ON p.id_kategorii = k.id_kategorii
WHERE p.cena > (
    SELECT AVG(cena) 
    FROM Produkt p2 
    WHERE p2.id_kategorii = p.id_kategorii
);

/*
* agregacja danych zamówień klientów
* - LEFT JOIN dla uwzględnienia klientów bez zamówień
* - GROUP BY z wieloma kolumnami
* - HAVING do filtrowania zagregowanych wyników
* - funkcje agregujące SUM
*/
SELECT k.imie, k.nazwisko, SUM(sz.cena_jednostkowa * sz.ilosc) as wartosc_zamowien
FROM Klient k
LEFT JOIN Zamowienie z ON k.id_klienta = z.id_klienta
LEFT JOIN Szczegoly_Zamowienia sz ON z.id_zamowienia = sz.id_zamowienia
GROUP BY k.id_klienta, k.imie, k.nazwisko
HAVING SUM(sz.cena_jednostkowa * sz.ilosc) > 1000;

/*
* wyszukiwanie pracowników z podwładnymi
* - EXISTS do sprawdzenia powiązań
* - podzapytanie nieskorelowane
*/
SELECT p1.imie, p1.nazwisko
FROM Pracownik p1
WHERE EXISTS (
    SELECT 1 FROM Nadzor_Pracowniczy np
    WHERE np.id_nadzorcy = p1.id_pracownika
);

/*
* Wyszukiwanie produktów z aktywną promocją
* Wykorzystuje:
* - operator ANY
* - porównanie dat (CURRENT_DATE)
*/
SELECT p.nazwa, p.cena, pr.wartosc_procentowa_rabatu
FROM Produkt p
WHERE p.sku = ANY(
    SELECT pp.sku 
    FROM Produkt_Promocja pp
    WHERE pp.data_zakonczenia >= CURRENT_DATE
);

/*
* znajdź produkty droższe niż wszystkie produkty w kategorii 'Napoje'
* - operator ALL do porównania ze wszystkimi wartościami
* - podzapytanie
*/
SELECT p.sku, p.nazwa, p.cena
FROM Produkt p
WHERE p.cena > ALL (
    SELECT p2.cena
    FROM Produkt p2
    JOIN Kategoria k ON p2.id_kategorii = k.id_kategorii
    WHERE k.nazwa = 'Napoje'
);

/*
* lista zamówień posortowana według wartości całkowitej
* - JOIN do połączenia tabel
* - funkcje agregujące
* - ORDER BY do sortowania wyników
*/
SELECT 
    z.id_zamowienia,
    k.imie,
    k.nazwisko,
    SUM(sz.ilosc * sz.cena_jednostkowa) as wartosc_calkowita,
    z.data_zlozenia
FROM Zamowienie z
JOIN Klient k ON z.id_klienta = k.id_klienta
JOIN Szczegoly_Zamowienia sz ON z.id_zamowienia = sz.id_zamowienia
GROUP BY z.id_zamowienia, k.imie, k.nazwisko, z.data_zlozenia
ORDER BY wartosc_calkowita DESC, z.data_zlozenia DESC;
