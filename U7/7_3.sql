CREATE INDEX Eintrittsindex ON Pers (eindat);
SELECT UPPER(name), UPPER(beruf)
FROM pers
WHERE TO_CHAR(eindat, 'YY') = '94';

--a
--Funktionsbasierter Index

--b
SELECT UPPER(name), UPPER(beruf)
FROM pers
WHERE EINDAT < TO_DATE('01.01.1995', 'DD.MM.YYYY')
  AND EINDAT >= TO_DATE('01.01.1994', 'DD.MM.YYYY');