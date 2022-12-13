--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE dbsys52.girokonto
SET kontostand = kontostand - 500
WHERE name = 'A';
UPDATE dbsys52.girokonto
SET kontostand = kontostand + 500
WHERE name = 'F';
--rollback;
COMMIT;