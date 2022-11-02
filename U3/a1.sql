--DROP TABLE PrüfungsergebnisTab;

CREATE OR REPLACE TYPE PrüfungsergebnisT AS OBJECT
(
  PrüfungsDatum DATE,
  Note NUMBER,
  Vorlesung REF VORLESUNGT,
  Studierender REF STUDIERENDERT
) FINAL;
/

CREATE TABLE PrüfungsergebnisTab
(
    Prüfungsergebnis PrüfungsergebnisT,
    CHECK ( Prüfungsergebnis.NOTE BETWEEN 1.0 AND 5.0 )
);

INSERT INTO PROFESSORTAB VALUES ('Stark','Software','O333');
INSERT INTO PROFESSORTAB VALUES ('Heinz','Software','O332');
INSERT INTO PROFESSORTAB VALUES ('Macht','Embedded','O331');
INSERT INTO PROFESSORTAB VALUES ('Kohl','Monumente','A231');

INSERT INTO FAKULTAETTAB VALUES ('Informatik',
                                 NULL,
                                 NULL);
UPDATE FAKULTAETTAB
SET DEKAN = (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Stark' FETCH FIRST 1 ROWS ONLY),
    PROFESSOREN = PROFESSORENVA(
                        (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Stark' FETCH FIRST 1 ROWS ONLY),
                        (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Heinz' FETCH FIRST 1 ROWS ONLY),
                        (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Macht' FETCH FIRST 1 ROWS ONLY)
                    )
WHERE NAME = 'Informatik';

INSERT INTO FAKULTAETTAB VALUES ('Architektur',
                                 NULL,
                                 NULL);
UPDATE FAKULTAETTAB
SET DEKAN = (SELECT REF(Prof) FROM PROFESSORTAB Prof WHERE Prof.NAME = 'Kohl' FETCH FIRST 1 ROWS ONLY),
    PROFESSOREN = PROFESSORENVA(
        (
        SELECT REF(Prof)
        FROM PROFESSORTAB Prof
        WHERE Prof.BUERO LIKE 'A%'
        FETCH FIRST 1 ROWS ONLY)
        )
WHERE NAME = 'Architektur';