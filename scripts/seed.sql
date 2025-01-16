SET client_encoding = 'UTF8';

BEGIN;

INSERT INTO Lokalizacja (dokladna_lokalizacja) VALUES
('ul. Długa 1, Warszawa'), ('ul. Krakowska 15, Kraków'), ('ul. Wrocławska 3, Wrocław'),
('ul. Poznańska 7, Poznań'), ('ul. Gdańska 22, Gdańsk'), ('ul. Szczecińska 11, Szczecin'),
('ul. Łódzka 45, Łódź'), ('ul. Bydgoska 33, Bydgoszcz'), ('ul. Lubelska 8, Lublin'),
('ul. Rzeszowska 19, Rzeszów'), ('ul. Katowicka 27, Katowice'), ('ul. Olsztyńska 14, Olsztyn'),
('ul. Kielecka 5, Kielce'), ('ul. Opolska 9, Opole'), ('ul. Zielonogórska 12, Zielona Góra');

INSERT INTO Kategoria (nazwa) VALUES
('Warzywa'), ('Owoce'), ('Nabiał'), ('Pieczywo'), ('Mięso'),
('Napoje'), ('Słodycze'), ('Przekąski'), ('Przyprawy'), ('Produkty zbożowe'),
('Konserwy'), ('Mrożonki'), ('Alkohole'), ('Kosmetyki'), ('Chemia gospodarcza');

INSERT INTO Promocja (wartosc_procentowa_rabatu) VALUES
(10), (15), (20), (25), (30), (35), (40), (45), (50), (5),
(12), (18), (22), (28), (33);

INSERT INTO Produkt (sku, nazwa, cena, id_kategorii) VALUES
('P001', 'Marchewka', 2.99, 1), ('P002', 'Jabłka', 3.99, 2),
('P003', 'Mleko', 3.49, 3), ('P004', 'Chleb', 4.50, 4),
('P005', 'Schab', 22.99, 5), ('P006', 'Cola', 5.99, 6),
('P007', 'Czekolada', 4.99, 7), ('P008', 'Chipsy', 5.99, 8),
('P009', 'Pieprz', 3.99, 9), ('P010', 'Ryż', 4.99, 10),
('P011', 'Tuńczyk', 8.99, 11), ('P012', 'Pizza', 15.99, 12),
('P013', 'Wino', 29.99, 13), ('P014', 'Szampon', 12.99, 14),
('P015', 'Proszek', 19.99, 15);

INSERT INTO Pracownik (imie, nazwisko, typ_pracownika) VALUES
('Jan', 'Kowalski', 'MANAGER'), ('Anna', 'Nowak', 'REGULAR'),
('Piotr', 'Wiśniewski', 'REGULAR'), ('Maria', 'Wójcik', 'MANAGER'),
('Krzysztof', 'Kowalczyk', 'REGULAR'), ('Magdalena', 'Kamińska', 'REGULAR'),
('Tomasz', 'Lewandowski', 'MANAGER'), ('Agnieszka', 'Zielińska', 'REGULAR'),
('Marcin', 'Szymański', 'REGULAR'), ('Katarzyna', 'Woźniak', 'MANAGER'),
('Michał', 'Dąbrowski', 'REGULAR'), ('Ewa', 'Kozłowska', 'REGULAR'),
('Adam', 'Jankowski', 'REGULAR'), ('Monika', 'Mazur', 'REGULAR'),
('Robert', 'Wojciechowski', 'REGULAR');

INSERT INTO Klient (imie, nazwisko, email, nr_tel) VALUES
('Marek', 'Nowacki', 'marek.n@email.com', '111222333'),
('Alicja', 'Kwiatkowska', 'alicja.k@email.com', '222333444'),
('Jerzy', 'Mickiewicz', 'jerzy.m@email.com', '333444555'),
('Helena', 'Pawlak', 'helena.p@email.com', '444555666'),
('Stanisław', 'Kaczmarek', 'stanislaw.k@email.com', '555666777'),
('Zofia', 'Grabowska', 'zofia.g@email.com', '666777888'),
('Daniel', 'Nowakowski', 'daniel.n@email.com', '777888999'),
('Julia', 'Pawłowska', 'julia.p@email.com', '888999000'),
('Filip', 'Michalski', 'filip.m@email.com', '999000111'),
('Laura', 'Zając', 'laura.z@email.com', '000111222'),
('Jakub', 'Król', 'jakub.k@email.com', '111333555'),
('Nina', 'Wróbel', 'nina.w@email.com', '222444666'),
('Oskar', 'Majewski', 'oskar.m@email.com', '333555777'),
('Lena', 'Wieczorek', 'lena.w@email.com', '444666888'),
('Igor', 'Adamczyk', 'igor.a@email.com', '555777999');

INSERT INTO Platnosc (typ_platnosci) VALUES
('karta'), ('gotowka'), ('karta'), ('gotowka'), ('karta'),
('gotowka'), ('karta'), ('gotowka'), ('karta'), ('gotowka'),
('karta'), ('gotowka'), ('karta'), ('gotowka'), ('karta');

INSERT INTO Faktura (nip, kwota) VALUES
('1234567890', 299.99), ('2345678901', 199.50), ('3456789012', 499.99),
('4567890123', 149.99), ('5678901234', 399.99), ('6789012345', 249.99),
('7890123456', 599.99), ('8901234567', 349.99), ('9012345678', 449.99),
('0123456789', 699.99), ('1122334455', 799.99), ('2233445566', 899.99),
('3344556677', 999.99), ('4455667788', 199.99), ('5566778899', 299.99);

INSERT INTO Zamowienie (id_klienta, status, data_zlozenia, id_platnosci, id_faktury) VALUES
(1, 'W TRAKCIE REALIZACJI', '2023-11-01 10:00:00', 1, 1),
(2, 'W DOSTAWIE', '2023-11-01 11:00:00', 2, 2),
(3, 'CZEKA NA ODBIOR', '2023-11-01 12:00:00', 3, 3),
(4, 'ZAKONCZONE', '2023-11-01 13:00:00', 4, 4),
(5, 'W TRAKCIE REALIZACJI', '2023-11-01 14:00:00', 5, 5),
(6, 'W DOSTAWIE', '2023-11-01 15:00:00', 6, 6),
(7, 'CZEKA NA ODBIOR', '2023-11-02 10:00:00', 7, 7),
(8, 'ZAKONCZONE', '2023-11-02 11:00:00', 8, 8),
(9, 'W TRAKCIE REALIZACJI', '2023-11-02 12:00:00', 9, 9),
(10, 'W DOSTAWIE', '2023-11-02 13:00:00', 10, 10),
(11, 'CZEKA NA ODBIOR', '2023-11-02 14:00:00', 11, 11),
(12, 'ZAKONCZONE', '2023-11-02 15:00:00', 12, 12),
(13, 'W TRAKCIE REALIZACJI', '2023-11-03 10:00:00', 13, 13),
(14, 'W DOSTAWIE', '2023-11-03 11:00:00', 14, 14),
(15, 'CZEKA NA ODBIOR', '2023-11-03 12:00:00', 15, 15);

INSERT INTO Szczegoly_Zamowienia (id_zamowienia, sku, ilosc, cena_jednostkowa) VALUES
(1, 'P001', 2, 2.99), (2, 'P002', 3, 3.99),
(3, 'P003', 1, 3.49), (4, 'P004', 2, 4.50),
(5, 'P005', 1, 22.99), (6, 'P006', 6, 5.99),
(7, 'P007', 2, 4.99), (8, 'P008', 3, 5.99),
(9, 'P009', 1, 3.99), (10, 'P010', 2, 4.99),
(11, 'P011', 4, 8.99), (12, 'P012', 1, 15.99),
(13, 'P013', 1, 29.99), (14, 'P014', 2, 12.99),
(15, 'P015', 1, 19.99);

INSERT INTO Nadzor_Pracowniczy (id_pracownika, id_nadzorcy, data_rozpoczecia) VALUES
(2, 1, '2023-01-01'), (3, 1, '2023-01-01'),
(5, 4, '2023-01-01'), (6, 4, '2023-01-01'),
(8, 7, '2023-01-01'), (9, 7, '2023-01-01'),
(11, 10, '2023-01-01'), (12, 10, '2023-01-01'),
(13, 1, '2023-01-01'), (14, 4, '2023-01-01'),
(15, 7, '2023-01-01'), (2, 4, '2023-06-01'),
(3, 7, '2023-06-01'), (5, 1, '2023-06-01'),
(6, 10, '2023-06-01');

INSERT INTO Produkt_Promocja (sku, id_promocji, data_rozpoczecia, data_zakonczenia) VALUES
('P001', 1, '2023-11-01', '2023-11-30'),
('P002', 2, '2023-11-01', '2023-11-30'),
('P003', 3, '2023-11-01', '2023-11-30'),
('P004', 4, '2023-11-01', '2023-11-30'),
('P005', 5, '2023-11-01', '2023-11-30'),
('P006', 6, '2023-11-01', '2023-11-30'),
('P007', 7, '2023-11-01', '2023-11-30'),
('P008', 8, '2023-11-01', '2023-11-30'),
('P009', 9, '2023-11-01', '2023-11-30'),
('P010', 10, '2023-11-01', '2023-11-30'),
('P011', 11, '2023-11-01', '2023-11-30'),
('P012', 12, '2023-11-01', '2023-11-30'),
('P013', 13, '2023-11-01', '2023-11-30'),
('P014', 14, '2023-11-01', '2023-11-30'),
('P015', 15, '2023-11-01', '2023-11-30');

INSERT INTO Klient_Telefony (id_klienta, nr_tel) VALUES
(1, '111222333'), (2, '222333444'),
(3, '333444555'), (4, '444555666'),
(5, '555666777'), (6, '666777888'),
(7, '777888999'), (8, '888999000'),
(9, '999000111'), (10, '000111222'),
(11, '111333555'), (12, '222444666'),
(13, '333555777'), (14, '444666888'),
(15, '555777999');

COMMIT;