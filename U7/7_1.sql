-- a
-- Wie viele Personen sind alleine in einer Abteilung?
SELECT COUNT(DISTINCT pnr)
FROM Pers p
WHERE NOT EXISTS
    (SELECT *
     FROM pers p2
     WHERE p.anr = p2.anr
       AND p.pnr != p2.pnr);
SELECT COUNT(p.pnr)
FROM Pers p
         LEFT JOIN Pers p2 ON p.anr = p2.anr AND p.pnr != p2.pnr
WHERE p2.pnr IS NULL;
select count(p1.pnr)
from PERS p1,
     PERS p2
where p1.anr = p2.ANR
  and p1.pnr != p2.PNR
  and p2.PNR is null;
-- a correct
CREATE OR REPLACE /*MATERIALIZED*/ VIEW AbtPers AS
SELECT a.anr, COUNT(DISTINCT p.pnr) AS anz
FROM ABT a,
     PERS p
WHERE a.anr = p.anr
GROUP BY a.anr;
SELECT COUNT(anr) as Anzahl
FROM AbtPers
WHERE anz = 1;

-- b
-- In welchen Abteilungen arbeiten keine Programmierer?
SELECT a.aname
FROM abt a
WHERE NOT EXISTS(SELECT *
                 FROM pers p
                 WHERE p.anr = a.anr
                   AND beruf = 'Programmierer');
-- b correct
CREATE OR REPLACE /*MATERIALIZED*/ VIEW AbtProg AS
SELECT a.aname, COUNT(p.pnr) as AnzProg
FROM ABT a
         LEFT OUTER JOIN PERS p
                         ON a.ANR = p.ANR
                             AND p.beruf = 'Programmierer'
GROUP BY a.aname;
SELECT aname
FROM AbtProg
WHERE anzprog = 0;

-- c
-- Wie viele Personen verdienen mehr als das Durchschnittsgehalt aller Programmierer?
SELECT COUNT(DISTINCT p.pnr)
FROM pers p
WHERE p.gehalt > (SELECT AVG(gehalt)
                  FROM pers
                  WHERE beruf = 'Programmierer');
-- c correct
CREATE OR REPLACE /*MATERIALIZED*/ VIEW AvgGehaltBeruf AS
SELECT beruf, AVG(gehalt) as AvgGehalt
FROM pers
group by beruf;
SELECT COUNT(p.pnr)
FROM pers p,
     AvgGehaltBeruf a
WHERE a.beruf = 'Programmierer'
  AND p.gehalt > a.avggehalt;

-- d
-- Welche Personen haben einen Chef der jünger ist als sie selbst?
SELECT Name
FROM Pers p1
WHERE p1.jahrg < (SELECT p2.jahrg
                  FROM pers p2
                  WHERE p2.pnr = p1.vnr);
-- d correct
SELECT p1.name
FROM pers p1,
     pers p2
WHERE p1.vnr = p2.pnr
  AND p1.jahrg < p2.jahrg;

-- e
-- Ermittle alle Personen, die in der gleichen Abteilung wie Hr. Junghans arbeiten und den
-- gleichen Beruf haben.
SELECT DISTINCT name
FROM Pers
WHERE name != 'Junghans'
  AND beruf = ANY (SELECT beruf
                   FROM Pers
                   WHERE name = 'Junghans')
  AND anr = ANY (SELECT anr
                 FROM Pers
                 WHERE name = 'Junghans');
-- e correct
SELECT DISTINCT p1.name
FROM pers p1,
     pers p2
WHERE p1.name != 'Junghans'
  AND p2.name = 'Junghans'
    /*AND p1.pnr != p2.pnr*/
  AND p1.beruf = p2.beruf
  AND p1.anr = p2.anr;

-- f
-- Suche alle Mitarbeiter, deren Namen in der Firma nur einmal vorkommt.
SELECT DISTINCT name
FROM Pers p1
WHERE NOT EXISTS(SELECT *
                 FROM Pers p2
                 WHERE p1.name = p2.name
                   AND p1.pnr != p2.pnr);
select p1.name
from pers p1
         left join pers p2 on p1.pnr != p2.PNR
    and p1.name = p2.name
where p2.pnr is null;
-- f correct
SELECT name
FROM pers
GROUP BY name
HAVING COUNT(*) = 1;

-- g
-- Welche Mitarbeiternamen kommen in der Firma auch als Abteilungsname vor?
SELECT DISTINCT p.name
FROM Pers p
WHERE EXISTS(SELECT *
             FROM Abt a
             WHERE p.name = a.aname);
-- g correct
SELECT p.name
FROM pers p,
     abt a
WHERE p.name = a.aname;
