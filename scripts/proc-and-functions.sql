/*
* procedura dodająca nowy produkt
* - parametry wejściowe (IN)
* - podstawowe INSERT
*/
CREATE OR REPLACE PROCEDURE DodajProdukt(
    IN sku_input VARCHAR(10),
    IN nazwa_input VARCHAR,
    IN cena_input DECIMAL(10, 2),
    IN id_kategorii_input INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Produkt (sku, nazwa, cena, id_kategorii)
    VALUES (sku_input, nazwa_input, cena_input, id_kategorii_input);
END;
$$;

/*
* procedura zwracająca szczegóły zamówienia w formacie JSON
* - parametry wyjściowe (OUT)
* - agregację JSON (json_agg)
* - konwersję wierszy na JSON (row_to_json)
*/
CREATE OR REPLACE PROCEDURE SzczegolyZamowienia(
    IN zamowienie_id INT,
    OUT szczegoly JSON
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT json_agg(row_to_json(sz)) 
    INTO szczegoly
    FROM Szczegoly_Zamowienia sz
    WHERE sz.id_zamowienia = zamowienie_id;
END;
$$;

/*
* funkcja triggerowa ustawiająca datę zakończenia promocji
* - warunek IF
* - operacje na datach (INTERVAL)
* - automatyczne wyzwalanie przez trigger BEFORE INSERT
*/
CREATE OR REPLACE FUNCTION UstawDateZakonczeniaPromocji()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.data_zakonczenia IS NULL THEN
        NEW.data_zakonczenia := NEW.data_rozpoczecia + INTERVAL '30 days';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trigger_promocja_data_zakonczenia
BEFORE INSERT ON Produkt_Promocja
FOR EACH ROW
EXECUTE FUNCTION UstawDateZakonczeniaPromocji();

/*
* funkcja triggerowa aktualizująca cenę produktu
* - automatyczne wyzwalanie przez trigger AFTER INSERT
* - operacje arytmetyczne na cenach
* - dostęp do nowo wstawionego rekordu (NEW)
*/
CREATE OR REPLACE FUNCTION AktualizujStanMagazynu()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Produkt
    SET cena = cena * 0.95
    WHERE sku = NEW.sku;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trigger_stan_magazynu
AFTER INSERT ON Szczegoly_Zamowienia
FOR EACH ROW
EXECUTE FUNCTION AktualizujStanMagazynu();
