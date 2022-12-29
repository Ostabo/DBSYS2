SELECT p.anr, min(p.gehalt), max(p.gehalt)
FROM Pers p
         INNER JOIN Abt a ON p.anr = a.anr
WHERE p.beruf = 'Programmierer'
  AND p.name = 'Junghans'
  AND a.ort = 'Erlangen'
GROUP BY p.anr
ORDER BY p.anr;

--a
CREATE INDEX IndexPersAnr ON Pers (anr);

--b
--SQL DEVELOPER: F10 - Explain Plan ↑

--c
--INSERT, DELETE, UPDATE verlangsamt, da Index neu aufgebaut werden muss