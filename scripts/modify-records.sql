-- nowa cena produktu dla podanego SKU
UPDATE Produkt 
SET cena = 2.75 
WHERE sku = 'SKU001';

-- zmiana statusu zamowienia
UPDATE Zamowienie 
SET status = 'ZAKONCZONE' 
WHERE id_zamowienia = 1;

-- usuniecie klienta o id=1
DELETE FROM Klient 
WHERE id_klienta = 1;

/*
* aktualizacja cen dla kategorii
* - IN z podzapytaniem
* - LIKE do dopasowania wzorca
* - operacje arytmetyczne na cenach
*/
UPDATE Produkt
SET cena = cena * 1.1
WHERE id_kategorii IN (
    SELECT id_kategorii 
    FROM Kategoria 
    WHERE nazwa LIKE 'Nap%'
);

/*
* usuwanie nieaktywnych promocji
* - złożone warunki WHERE
* - operacje na datach
* - IN z podzapytaniem
*/
DELETE FROM Produkt_Promocja
WHERE data_zakonczenia < CURRENT_DATE
AND sku IN (
    SELECT sku 
    FROM Produkt 
    WHERE cena > 10
);

/*
* aktualizacja statusów starych zamówień
* - operacje na datach i interwałach czasowych
* - złożone warunki WHERE
* - operatory porównania
*/
UPDATE Zamowienie
SET status = 'ZAKONCZONE'
WHERE data_zlozenia < CURRENT_DATE - INTERVAL '30 days'
AND status != 'ZAKONCZONE';
