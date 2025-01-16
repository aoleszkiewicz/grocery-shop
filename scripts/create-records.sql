-- tworzenie nowej lokaliazcji
INSERT INTO Lokalizacja (dokladna_lokalizacja) 
VALUES ('Warszawa, ul. Miodowa 5');

-- utworzenie nowej kategorii
INSERT INTO Kategoria (nazwa) 
VALUES ('Napoje');

-- dodanie dostawcy
INSERT INTO Dostawca (nazwa, nr_tel) 
VALUES ('DostawcaX', '123456789');

-- dodanie produktu
INSERT INTO Produkt (sku, nazwa, cena, id_kategorii) 
VALUES ('SKU001', 'Woda Mineralna', 2.50, 1);

-- zapis klienta
INSERT INTO Klient (imie, nazwisko, email, nr_tel) 
VALUES ('Jan', 'Kowalski', 'jan.kowalski@example.com', '987654321');

-- utworzenie nowego zamowienia
INSERT INTO Zamowienie (id_klienta, status, data_zlozenia) 
VALUES (1, 'W TRAKCIE REALIZACJI', CURRENT_TIMESTAMP);

-- dodanie pracownikow z roznym typem
INSERT INTO Pracownik (imie, nazwisko, typ_pracownika)
VALUES 
    ('Adam', 'Manager', 'MANAGER'),
    ('Ewa', 'Regular', 'REGULAR');

-- dodanie produktow z promocja
WITH nowy_produkt AS (
    INSERT INTO Produkt (sku, nazwa, cena, id_kategorii)
    VALUES ('SKU002', 'Sok Pomaranczowy', 5.99, 
        (SELECT id_kategorii FROM Kategoria WHERE nazwa = 'Napoje'))
    RETURNING sku
)
INSERT INTO Produkt_Promocja (sku, id_promocji, data_rozpoczecia)
SELECT sku, 1, CURRENT_DATE
FROM nowy_produkt;
