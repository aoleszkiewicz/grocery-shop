CREATE TABLE Faktura (
    id_faktury SERIAL PRIMARY KEY,
    nip VARCHAR(10) NOT NULL,
    kwota DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Lokalizacja (
    id_lokalizacji SERIAL PRIMARY KEY,
    dokladna_lokalizacja VARCHAR NOT NULL
);

CREATE TABLE Kategoria (
    id_kategorii SERIAL PRIMARY KEY,
    nazwa VARCHAR NOT NULL
);

CREATE TABLE Promocja (
    id_promocji SERIAL PRIMARY KEY,
    wartosc_procentowa_rabatu DECIMAL(5, 2) NOT NULL
);

CREATE TABLE Dostawca (
    id_dostawcy SERIAL PRIMARY KEY,
    nazwa VARCHAR NOT NULL,
    nr_tel VARCHAR(15)
);

CREATE TABLE Produkt (
    sku VARCHAR(10) PRIMARY KEY,
    nazwa VARCHAR NOT NULL,
    cena DECIMAL(10, 2) NOT NULL,
    id_kategorii INT NOT NULL,
    FOREIGN KEY (id_kategorii) REFERENCES Kategoria(id_kategorii)
);

CREATE TYPE typ_pracownika AS ENUM ('REGULAR', 'MANAGER');

CREATE TABLE Pracownik (
    id_pracownika SERIAL PRIMARY KEY,
    imie VARCHAR NOT NULL,
    nazwisko VARCHAR NOT NULL,
    typ_pracownika typ_pracownika NOT NULL
);

CREATE TABLE Nadzor_Pracowniczy (
    id_pracownika INT,
    id_nadzorcy INT,
    data_rozpoczecia DATE NOT NULL,
    PRIMARY KEY (id_pracownika, id_nadzorcy),
    FOREIGN KEY (id_pracownika) REFERENCES Pracownik(id_pracownika),
    FOREIGN KEY (id_nadzorcy) REFERENCES Pracownik(id_pracownika)
);

CREATE TABLE Klient (
    id_klienta SERIAL PRIMARY KEY,
    imie VARCHAR NOT NULL,
    nazwisko VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    nr_tel VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Klient_Telefony (
    id_klienta INT,
    nr_tel VARCHAR(15),
    PRIMARY KEY (id_klienta, nr_tel),
    FOREIGN KEY (id_klienta) REFERENCES Klient(id_klienta) ON DELETE CASCADE
);

CREATE TYPE status_zamowienia AS ENUM ('W TRAKCIE REALIZACJI', 'W DOSTAWIE', 'CZEKA NA ODBIOR', 'ZAKONCZONE');

CREATE TYPE typ_platnosci AS ENUM ('karta', 'gotowka');

CREATE TABLE Platnosc (
    id_platnosci SERIAL PRIMARY KEY,
    typ_platnosci typ_platnosci NOT NULL
);

CREATE TABLE Zamowienie (
    id_zamowienia SERIAL PRIMARY KEY,
    id_klienta INT,
    status status_zamowienia NOT NULL,
    data_zlozenia TIMESTAMP NOT NULL,
    id_platnosci INT,
    id_faktury INT,
    FOREIGN KEY (id_klienta) REFERENCES Klient(id_klienta),
    FOREIGN KEY (id_platnosci) REFERENCES Platnosc(id_platnosci),
    FOREIGN KEY (id_faktury) REFERENCES Faktura(id_faktury)
);

CREATE TABLE Produkt_Promocja (
    sku VARCHAR(10),
    id_promocji INT,
    data_rozpoczecia DATE NOT NULL,
    data_zakonczenia DATE,
    PRIMARY KEY (sku, id_promocji),
    FOREIGN KEY (sku) REFERENCES Produkt(sku),
    FOREIGN KEY (id_promocji) REFERENCES Promocja(id_promocji)
);

CREATE TABLE Szczegoly_Zamowienia (
    id_zamowienia INT,
    sku VARCHAR(10),
    ilosc INT NOT NULL,
    cena_jednostkowa DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_zamowienia, sku),
    FOREIGN KEY (id_zamowienia) REFERENCES Zamowienie(id_zamowienia),
    FOREIGN KEY (sku) REFERENCES Produkt(sku)
);

