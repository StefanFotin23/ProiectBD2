-- Rapoarte

-- Complexitate 4
-- Produsele vandute de fiecare angajat, inclusiv categoria produsului
CREATE VIEW VANZARI_ANGAJAT_CATEGORIE AS
SELECT
    a.nume AS "NUME ANGAJAT",
    cp.nume AS "CATEGORIE PRODUS",
    COUNT(vp.id_produs) AS "NUMAR PRODUSE VANDUTE"
FROM
    vanzari_produse vp
JOIN stoc_produse sp ON vp.id_produs = sp.id
JOIN angajati a ON vp.id_angajat = a.id
JOIN categorii_produse cp ON sp.id_categorie = cp.id
GROUP BY a.nume, cp.nume;

-- Complexitate 6
-- Statistica vanzari pe fiecare categorie
CREATE VIEW INFORMATII_VANZARI_CATEGORII AS
SELECT
    cp.nume AS "CATEGORIE",
    COUNT(DISTINCT vp.id) AS "NUMAR VANZARI",
    ROUND(AVG(sp.pret)) AS "PRET MEDIU",
    SUM(vp.cantitate) AS "CANTITATE TOTALA VANDUTA",
    SUM(vp.cantitate * sp.pret) AS "SUMA TOTALA VANDUTA"
FROM
    vanzari_produse vp
JOIN stoc_produse sp ON vp.id_produs = sp.id
JOIN categorii_produse cp ON sp.id_categorie = cp.id
LEFT JOIN discount_si_comision_categorie dcc ON cp.id = dcc.id_categorie
WHERE vp.data_vanzare BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-12-31', 'YYYY-MM-DD')
GROUP BY cp.nume
HAVING SUM(vp.cantitate) > 10;

-- Complexitate 7
-- Statistica despre performanta angajatilor in vanzari
CREATE VIEW PERFORMANTA_ANGAJATI_VANZARI AS
SELECT
    a.nume AS "NUME ANGAJAT",
    a.prenume AS "PRENUME ANGAJAT",
    COUNT(vp.id) AS "NUMAR VANZARI",
    SUM(vp.cantitate) AS "CANTITATE TOTALA VANDUTA",
    ROUND(SUM(sp.pret * (1 - dcc.valoare_discount) * (1 + dcc.valoare_comision)), 2) AS "VENIT TOTAL (lei)",
    AVG(dcc.valoare_discount) AS "DISCOUNT MEDIU",
    AVG(dcc.valoare_comision) AS "COMISION_MEDIU"
FROM
    angajati a
JOIN vanzari_produse vp ON a.id = vp.id_angajat
JOIN stoc_produse sp ON vp.id_produs = sp.id
LEFT JOIN discount_si_comision_categorie dcc ON sp.id_categorie = dcc.id_categorie
JOIN categorii_produse cp ON sp.id_categorie = cp.id
WHERE a.data_angajare <= TO_DATE('2023-12-31', 'YYYY-MM-DD')
GROUP BY a.nume, a.prenume, (dcc.valoare_discount + dcc.valoare_comision) / 2
HAVING AVG(dcc.valoare_discount) <= 0.1 AND AVG(dcc.valoare_comision) <= 0.1
ORDER BY (dcc.valoare_discount + dcc.valoare_comision) / 2 ASC;