-- Aufgabe 2
create or replace view Verkauf_2DC as
(
select DECODE(GROUPING(k.age), 1, 'Alle', k.age)                     AS Age,
       DECODE(GROUPING(p.produktgruppe), 1, 'Alle', p.produktgruppe) AS Produktgruppe,
       sum(v.anzahl)                                                 as Anzahl_Käufe
from kunde k,
     produkt p,
     verkauf v
where TO_CHAR(v.datum, 'YYYY') = '2022' --2020 keine einträge
  and v.produktid = p.produktid
  and v.kundenid = k.kundenid
group by cube (k.age, p.produktgruppe)
    );
select *
from verkauf_2dc;

-- Aufgabe 3
SELECT *
FROM
    (SELECT k.age as Alter_Kunde, p.produktgruppe, v.anzahl
     from kunde k,
          produkt p,
          verkauf v
     WHERE TO_CHAR(datum, 'YYYY') = '2022'
       AND v.produktid = p.produktid
       AND v.kundenid = k.kundenid)
        PIVOT (
        SUM(anzahl) as Anzahl
        FOR produktgruppe
        IN (
            'Technik' as Technik,
            'Essen' as Essen
            )
        );
-- Aufgabe 4
-- rollup weil produktgruppe interessanter als alter und alter interessanter als datum
select decode(grouping(p.produktgruppe), 1, 'Alle', p.produktgruppe)                         as Produktgruppe,
       decode(grouping(ve.geb), 1, 'Alle', trunc(months_between(CURRENT_DATE, ve.geb) / 12)) as Age,
       decode(grouping(v.datum), 1, 'Alle', TO_CHAR(v.datum, 'YYYY'))                        as Year,
       sum(v.anzahl * p.preis)                                                               as Umsatz
from dual,
     verkäufer ve,
     verkauf v,
     produkt p
where v.verkäuferid = ve.verkäuferid
  and v.produktid = p.produktid
group by rollup (p.produktgruppe, ve.geb, v.datum);
