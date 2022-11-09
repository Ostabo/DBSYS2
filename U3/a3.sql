CREATE OR REPLACE TYPE BODY StudierenderT AS
    MEMBER FUNCTION getNotenschnitt RETURN FLOAT IS
        tmp_avg FLOAT;
    BEGIN
        select avg(p.PRÜFUNGSERGEBNIS.NOTE)
        INTO tmp_avg
        FROM prüfungsergebnistab p
        where p.PRÜFUNGSERGEBNIS.STUDIERENDER.MATRIKELNUMMER = self.matrikelnummer;
        RETURN tmp_avg;
    END getNotenschnitt;
END;
/

SELECT s.matrikelnummer, s.name, s.getNotenschnitt() as Notenschnitt
FROM studierendertab s;
