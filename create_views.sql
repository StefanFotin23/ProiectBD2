-- Rapoarte
-- Complexitate 5
-- Cantitatea totala vanduta pentru fiecare categorie de produse
CREATE VIEW VANZARI_TOTALE_CATEGORIE AS
SELECT
    cp.nume AS CATEGORIE,
    SUM(vp.cantitate) AS "CANTITATE TOTALA",
    SUM(vp.cantitate * sp.pret) AS "VALOARE TOTALA (lei)",
    CASE
        WHEN SUM(vp.cantitate) > 0
            THEN ROUND(SUM(vp.cantitate * sp.pret) / SUM(vp.cantitate))
        ELSE 0
    END AS "PRET MEDIU PE UNITATE (lei)"
FROM
    categorii_produse cp
JOIN stoc_produse sp ON cp.id = sp.id_categorie
JOIN vanzari_produse vp ON sp.id = vp.id_produs
GROUP BY cp.nume;

-- Complexitate 7
-- Vanzarile lunare, inclusiv comisioanele si discounturile aplicate
CREATE VIEW VANZARI_LUNARE_CU_COMISION AS
SELECT TO_CHAR(vp.data_vanzare, 'YYYY-MM') AS LUNA,
       a.nume AS "NUME ANGAJAT",
       cp.nume AS "CATEGORIE",
       vp.cantitate,
       ROUND (vp.cantitate * sp.pret * (1 - dcc.valoare_discount) * (1 + dcc.valoare_comision)) AS "venit (lei)"
FROM vanzari_produse vp
JOIN stoc_produse sp ON vp.id_produs = sp.id
JOIN angajati a ON vp.id_angajat = a.id
JOIN categorii_produse cp ON sp.id_categorie = cp.id
LEFT JOIN discount_si_comision_categorie dcc ON cp.id = dcc.id_categorie
ORDER BY luna;

-- Complexitate 8
-- Produsele disponibile in stoc, inclusiv discounturile aplicate
-- Complexitate 8
-- Produsele disponibile în stoc, inclusiv discounturile aplicate
CREATE VIEW PRODUSE_CU_DISCOUNT AS
SELECT cp.nume AS CATEGORIE,
       sp.putere_termica_kWh,
       sp.randament_energetic,
       sp.cantitate,
       sp.pret,
       CASE
           WHEN dcc.valoare_discount IS NOT NULL AND dcc.valoare_discount > 0
               THEN sp.pret * dcc.valoare_discount
           ELSE 0
       END AS "DISCOUNT APLICAT (lei)",
       sp.pret - (CASE
                     WHEN dcc.valoare_discount IS NOT NULL AND dcc.valoare_discount > 0
                         THEN sp.pret * dcc.valoare_discount
                     ELSE 0
                 END) AS "PRET FINAL (lei)"
FROM stoc_produse sp
JOIN categorii_produse cp ON sp.id_categorie = cp.id
LEFT JOIN discount_si_comision_categorie dcc ON cp.id = dcc.id_categorie;
COMMIT;