-- Delete script
-- Drop views
DROP VIEW PRODUSE_CU_DISCOUNT;
DROP VIEW VANZARI_LUNARE_CU_COMISION;
DROP VIEW VANZARI_TOTALE_CATEGORIE;

-- Drop tables with CASCADE CONSTRAINTS to also drop dependent foreign keys
DROP TABLE vanzari_produse CASCADE CONSTRAINTS;
DROP TABLE stoc_produse CASCADE CONSTRAINTS;
DROP TABLE discount_si_comision_categorie;
DROP TABLE angajati;
DROP TABLE categorii_produse;

-- Commit changes
COMMIT;