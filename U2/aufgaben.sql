CREATE OR REPLACE VIEW myself AS
SELECT *
FROM pers p, dual
WHERE p.account = USER;

SELECT * from myself;

GRANT SELECT ON myself TO dbsys77, dbsys52, dbsys76;
GRANT UPDATE(name, jahrg, eindat, beruf) ON myself TO dbsys77, dbsys52, dbsys76;


CREATE OR REPLACE VIEW mypeers AS
SELECT distinct p.* 
from pers p, pers u, dual
where p.account = USER
or u.vnr = p.pnr;


GRANT SELECT ON mypeers TO dbsys77, dbsys76, dbsys52;
GRANT UPDATE(gehalt, anr, vnr) ON mypeers TO dbsys77, dbsys76, dbsys52;

select * from mypeers;

--update mypeers set gehalt = 5 where name = 'Mueller';
commit;
