--DROP TABLE PrüfungsergebnisTab;

CREATE OR REPLACE TYPE PrüfungsergebnisT AS OBJECT
(
    PrüfungsDatum DATE,
    Note          NUMBER,
    Vorlesung     REF VORLESUNGT,
    Studierender  REF STUDIERENDERT
) FINAL;
/

CREATE TABLE PrüfungsergebnisTab
(
    Prüfungsergebnis PrüfungsergebnisT,
    CHECK ( Prüfungsergebnis.NOTE BETWEEN 1.0 AND 5.0 )
);

INSERT INTO PROFESSORTAB
VALUES ('Stark', 'Software', 'O333');
INSERT INTO PROFESSORTAB
VALUES ('Heinz', 'Software', 'O332');
INSERT INTO PROFESSORTAB
VALUES ('Macht', 'Embedded', 'O331');
INSERT INTO PROFESSORTAB
VALUES ('Kohl', 'Monumente', 'A231');

INSERT INTO FAKULTAETTAB
VALUES ('Informatik',
        NULL,
        NULL);
UPDATE FAKULTAETTAB
SET DEKAN       = (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Stark' FETCH FIRST 1 ROWS ONLY),
    PROFESSOREN = PROFESSORENVA(
            (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Stark' FETCH FIRST 1 ROWS ONLY),
            (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Heinz' FETCH FIRST 1 ROWS ONLY),
            (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Macht' FETCH FIRST 1 ROWS ONLY)
        )
WHERE NAME = 'Informatik';

INSERT INTO FAKULTAETTAB
VALUES ('Architektur',
        NULL,
        NULL);
UPDATE FAKULTAETTAB
SET DEKAN       = (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Kohl' FETCH FIRST 1 ROWS ONLY),
    PROFESSOREN = PROFESSORENVA(
            (SELECT REF(Prof)
             FROM PROFESSORTAB Prof
             WHERE Prof.BUERO LIKE 'A%'
                 FETCH FIRST 1 ROWS ONLY)
        )
WHERE NAME = 'Architektur';

INSERT INTO STUDIENGANGTAB
VALUES ('Informatik',
        (SELECT REF(Fak) FROM FAKULTAETTAB Fak WHERE Fak.NAME = 'Informatik' FETCH FIRST 1 ROWS ONLY));
INSERT INTO STUDIENGANGTAB
VALUES ('Architektur',
        (SELECT REF(Fak) FROM FAKULTAETTAB Fak WHERE Fak.NAME = 'Architektur' FETCH FIRST 1 ROWS ONLY));

INSERT INTO STUDIERENDERTAB
VALUES ('Hans Muster', '123456',
        (SELECT REF(Stg) FROM STUDIENGANGTAB Stg WHERE Stg.NAME = 'Informatik' FETCH FIRST 1 ROWS ONLY));
INSERT INTO STUDIERENDERTAB
VALUES ('Gustav Grün', '111111',
        (SELECT REF(Stg) FROM STUDIENGANGTAB Stg WHERE Stg.NAME = 'Architektur' FETCH FIRST 1 ROWS ONLY));
INSERT INTO STUDIERENDERTAB
VALUES ('Hans Zimmer', '125555',
        (SELECT REF(Stg) FROM STUDIENGANGTAB Stg WHERE Stg.NAME = 'Architektur' FETCH FIRST 1 ROWS ONLY));
INSERT INTO STUDIERENDERTAB
VALUES ('Christian Lindner', '654321',
        (SELECT REF(Stg) FROM STUDIENGANGTAB Stg WHERE Stg.NAME = 'Informatik' FETCH FIRST 1 ROWS ONLY));

INSERT INTO VORLESUNGTAB
VALUES ('Software',
        (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Stark' FETCH FIRST 1 ROWS ONLY));
INSERT INTO VORLESUNGTAB
VALUES ('Datenbanken',
        (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Heinz' FETCH FIRST 1 ROWS ONLY));
INSERT INTO VORLESUNGTAB
VALUES ('Häuser',
        (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Kohl' FETCH FIRST 1 ROWS ONLY));

INSERT INTO PRÜFUNGSERGEBNISTAB
VALUES (PrüfungsergebnisT('01.01.2017', 1.0,
                          (SELECT REF(Vor) FROM VORLESUNGTAB Vor WHERE Vor.NAME = 'Software' FETCH FIRST 1 ROWS ONLY),
                          (SELECT REF(Stud)
                           FROM STUDIERENDERTAB Stud
                           WHERE Stud.NAME = 'Hans Muster' FETCH FIRST 1 ROWS ONLY)));
INSERT INTO PRÜFUNGSERGEBNISTAB
VALUES (PrüfungsergebnisT('01.01.2022', 1.0,
                          (SELECT REF(Vor) FROM VORLESUNGTAB Vor WHERE Vor.NAME = 'Software' FETCH FIRST 1 ROWS ONLY),
                          (SELECT REF(Stud)
                           FROM STUDIERENDERTAB Stud
                           WHERE Stud.NAME = 'Christian Lindner' FETCH FIRST 1 ROWS ONLY)));
INSERT INTO PRÜFUNGSERGEBNISTAB
VALUES (PrüfungsergebnisT('02.01.2022', 2.0,
                          (SELECT REF(Vor) FROM VORLESUNGTAB Vor WHERE Vor.NAME = 'Häuser' FETCH FIRST 1 ROWS ONLY),
                          (SELECT REF(Stud)
                           FROM STUDIERENDERTAB Stud
                           WHERE Stud.NAME = 'Hans Zimmer' FETCH FIRST 1 ROWS ONLY)));
INSERT INTO PRÜFUNGSERGEBNISTAB
VALUES (PrüfungsergebnisT('02.01.2022', 1.3,
                          (SELECT REF(Vor) FROM VORLESUNGTAB Vor WHERE Vor.NAME = 'Häuser' FETCH FIRST 1 ROWS ONLY),
                          (SELECT REF(Stud)
                           FROM STUDIERENDERTAB Stud
                           WHERE Stud.NAME = 'Gustav Grün' FETCH FIRST 1 ROWS ONLY)));
INSERT INTO PRÜFUNGSERGEBNISTAB
VALUES (PrüfungsergebnisT('05.01.2022', 1.0,
                          (SELECT REF(Vor)
                           FROM VORLESUNGTAB Vor
                           WHERE Vor.NAME = 'Datenbanken' FETCH FIRST 1 ROWS ONLY),
                          (SELECT REF(Stud)
                           FROM STUDIERENDERTAB Stud
                           WHERE Stud.NAME = 'Hans Muster' FETCH FIRST 1 ROWS ONLY)));
INSERT INTO PRÜFUNGSERGEBNISTAB
VALUES (PrüfungsergebnisT('05.01.2022', 2.0,
                          (SELECT REF(Vor)
                           FROM VORLESUNGTAB Vor
                           WHERE Vor.NAME = 'Datenbanken' FETCH FIRST 1 ROWS ONLY),
                          (SELECT REF(Stud)
                           FROM STUDIERENDERTAB Stud
                           WHERE Stud.NAME = 'Christian Lindner' FETCH FIRST 1 ROWS ONLY)));

commit;