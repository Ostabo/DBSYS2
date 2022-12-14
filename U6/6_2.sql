-- c
-- Ohne ISOLATION LEVEL, arbeitet oracle nicht mit dem gleichen Sperrverhalten,
-- da ansonsten das update nicht ausgeführt werden dürfte, da die erste Transaktion
-- noch das read lock hält.

UPDATE dbsys52.girokonto SET kontostand = kontostand - 500 WHERE
        name = 'A';
UPDATE dbsys52.girokonto SET kontostand = kontostand + 500 WHERE
        name = 'F';
COMMIT;