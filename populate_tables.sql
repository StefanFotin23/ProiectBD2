-- POPULARE TABELE
-- Populare tabela categorii_produse
INSERT INTO categorii_produse (nume, descriere) VALUES ('Aer Conditionat', 'Aparat aer conditionat pentru uz rezidential');
INSERT INTO categorii_produse (nume, descriere) VALUES ('Pompa de caldura Aer-Aer', 'Pompa de caldura cu detenta directa');
INSERT INTO categorii_produse (nume, descriere) VALUES ('Pompa de caldura Aer-Apa', 'Pompa de caldura pentru incalzirea apei');
INSERT INTO categorii_produse (nume, descriere) VALUES ('Ventilatie', 'Ventilatie centralizata cu recuperare de caldura');
INSERT INTO categorii_produse (nume, descriere) VALUES ('Vitrina refrigerare', 'Vitrina frigorifica pentru refrigerare +5 grade Celsius');
INSERT INTO categorii_produse (nume, descriere) VALUES ('Vitrina congelare', 'Vitrina frigorifica pentru congelare -25 grade Celsius');
COMMIT;

-- Populare tabela stoc_produse
INSERT INTO stoc_produse (id_categorie, putere_termica_kWh, randament_energetic, cantitate, pret)
VALUES (1, 3.5, 3, 50, 1500);
INSERT INTO stoc_produse (id_categorie, putere_termica_kWh, randament_energetic, cantitate, pret)
VALUES (1, 5.8, 3, 30, 2500);
INSERT INTO stoc_produse (id_categorie, putere_termica_kWh, randament_energetic, cantitate, pret)
VALUES (2, 7.2, 4.5, 30, 2500);
INSERT INTO stoc_produse (id_categorie, putere_termica_kWh, randament_energetic, cantitate, pret)
VALUES (2, 15, 4.5, 9, 4500);
INSERT INTO stoc_produse (id_categorie, putere_termica_kWh, randament_energetic, cantitate, pret)
VALUES (3, 15.0, 4, 20, 3500);
INSERT INTO stoc_produse (id_categorie, putere_termica_kWh, randament_energetic, cantitate, pret)
VALUES (4, 5.0, 0.96, 40, 2000);
INSERT INTO stoc_produse (id_categorie, putere_termica_kWh, randament_energetic, cantitate, pret)
VALUES (5, 2.0, 2.5, 60, 1000);
INSERT INTO stoc_produse (id_categorie, putere_termica_kWh, randament_energetic, cantitate, pret)
VALUES (6, 10.0, 1.8, 12, 3000);
INSERT INTO stoc_produse (id_categorie, putere_termica_kWh, randament_energetic, cantitate, pret)
VALUES (6, 4.0, 1.8, 25, 1800);
COMMIT;

-- Populare tabela discount_si_comision_categorie
INSERT INTO discount_si_comision_categorie (id_categorie, valoare_discount, valoare_comision)
VALUES (1, 0.1, 0.05);
INSERT INTO discount_si_comision_categorie (id_categorie, valoare_discount, valoare_comision)
VALUES (2, 0, 0.1);
INSERT INTO discount_si_comision_categorie (id_categorie, valoare_discount, valoare_comision)
VALUES (3, 0.05, 0.03);
INSERT INTO discount_si_comision_categorie (id_categorie, valoare_discount, valoare_comision)
VALUES (4, 0.12, 0.08);
INSERT INTO discount_si_comision_categorie (id_categorie, valoare_discount, valoare_comision)
VALUES (5, 0.02, 0.02);
INSERT INTO discount_si_comision_categorie (id_categorie, valoare_discount, valoare_comision)
VALUES (6, 0.15, 0.12);
COMMIT;

-- Populare tabela angajati
INSERT INTO angajati (nume, prenume, functie, data_angajare, salariu, comision)
VALUES ('Popescu', 'Ion', 'CEO', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 10000, 0.2);
INSERT INTO angajati (nume, prenume, functie, data_angajare, salariu, comision)
VALUES ('Ionescu', 'Ana', 'CTO', TO_DATE('2022-02-01', 'YYYY-MM-DD'), 9000, 0.18);
INSERT INTO angajati (nume, prenume, functie, data_angajare, salariu, comision)
VALUES ('Dumitru', 'Radu', 'Inginer', TO_DATE('2022-03-01', 'YYYY-MM-DD'), 7000, 0.15);
INSERT INTO angajati (nume, prenume, functie, data_angajare, salariu, comision)
VALUES ('Stan', 'Elena', 'Contabil', TO_DATE('2022-04-01', 'YYYY-MM-DD'), 7500, 0.1);
INSERT INTO angajati (nume, prenume, functie, data_angajare, salariu, comision)
VALUES ('Popa', 'Mihai', 'Marketing', TO_DATE('2022-05-01', 'YYYY-MM-DD'), 8000, 0.12);
INSERT INTO angajati (nume, prenume, functie, data_angajare, salariu, comision)
VALUES ('Bogdan', 'Laura', 'Marketing', TO_DATE('2022-06-01', 'YYYY-MM-DD'), 8000, 0.12);
INSERT INTO angajati (nume, prenume, functie, data_angajare, salariu, comision)
VALUES ('Gheorghiu', 'Andrei', 'Sales', TO_DATE('2022-07-01', 'YYYY-MM-DD'), 6000, 0.08);
INSERT INTO angajati (nume, prenume, functie, data_angajare, salariu, comision)
VALUES ('Stoica', 'Gabriela', 'Sales', TO_DATE('2022-08-01', 'YYYY-MM-DD'), 6000, 0.08);
INSERT INTO angajati (nume, prenume, functie, data_angajare, salariu, comision)
VALUES ('Cristea', 'Alexandru', 'Sales', TO_DATE('2022-09-01', 'YYYY-MM-DD'), 6000, 0.08);
COMMIT;

-- Populare tabela vanzari_produse
INSERT INTO vanzari_produse (id_produs, cantitate, data_vanzare, id_angajat)
VALUES (1, 5, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO vanzari_produse (id_produs, cantitate, data_vanzare, id_angajat)
VALUES (3, 8, TO_DATE('2023-01-16', 'YYYY-MM-DD'), 4);
INSERT INTO vanzari_produse (id_produs, cantitate, data_vanzare, id_angajat)
VALUES (2, 3, TO_DATE('2023-01-17', 'YYYY-MM-DD'), 3);
INSERT INTO vanzari_produse (id_produs, cantitate, data_vanzare, id_angajat)
VALUES (4, 10, TO_DATE('2023-01-18', 'YYYY-MM-DD'), 2);
INSERT INTO vanzari_produse (id_produs, cantitate, data_vanzare, id_angajat)
VALUES (5, 15, TO_DATE('2023-01-19', 'YYYY-MM-DD'), 5);
INSERT INTO vanzari_produse (id_produs, cantitate, data_vanzare, id_angajat)
VALUES (1, 12, TO_DATE('2023-02-10', 'YYYY-MM-DD'), 6);
INSERT INTO vanzari_produse (id_produs, cantitate, data_vanzare, id_angajat)
VALUES (4, 5, TO_DATE('2023-02-15', 'YYYY-MM-DD'), 8);
INSERT INTO vanzari_produse (id_produs, cantitate, data_vanzare, id_angajat)
VALUES (2, 7, TO_DATE('2023-02-20', 'YYYY-MM-DD'), 4);
COMMIT;