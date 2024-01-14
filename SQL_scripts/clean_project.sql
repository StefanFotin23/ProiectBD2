-- Delete script
-- Drop views
DROP VIEW VANZARI_ANGAJAT_CATEGORIE;
DROP VIEW INFORMATII_VANZARI_CATEGORII;
DROP VIEW PERFORMANTA_ANGAJATI_VANZARI;

-- Drop tables with CASCADE CONSTRAINTS to also drop dependent foreign keys
DROP TABLE vanzari_produse CASCADE CONSTRAINTS;
DROP TABLE stoc_produse CASCADE CONSTRAINTS;
DROP TABLE discount_si_comision_categorie;
DROP TABLE angajati;
DROP TABLE categorii_produse;

-- Commit changes
COMMIT;