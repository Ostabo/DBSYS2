DROP TABLE girokonto;
CREATE TABLE girokonto
(
    name       VARCHAR2(20) primary key,
    kontostand INT,
    land       VARCHAR2(20)
);
GRANT INSERT, SELECT, UPDATE ON girokonto TO dbsys37;
INSERT INTO girokonto
VALUES ('A', 1000, 'D');
INSERT INTO girokonto
VALUES ('B', 1000, 'D');
INSERT INTO girokonto
VALUES ('C', 1000, 'D');
INSERT INTO girokonto
VALUES ('D', 1000, 'D');
INSERT INTO girokonto
VALUES ('E', 1000, 'D');
INSERT INTO girokonto
VALUES ('F', 1000, 'CH');
INSERT INTO girokonto
VALUES ('G', 1000, 'CH');
INSERT INTO girokonto
VALUES ('H', 1000, 'CH');
INSERT INTO girokonto
VALUES ('I', 1000, 'CH');
INSERT INTO girokonto
VALUES ('J', 1000, 'CH');
COMMIT;

--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--
--Create VIEW girokonto_de_view AS
--SELECT SUM(kontostand) as DE_sum
--FROM girokonto
--WHERE land = 'D';
--
--SELECT SUM(kontostand) as CH_sum
--FROM girokonto
--WHERE land = 'CH';
--select *
--from girokonto_de_view;
--COMMIT;

--a
-- mit variablen besteht das problem, mit view nicht, da view evtl einen Pointer benutzt?
VARIABLE ger_sum NUMBER;
BEGIN
    SELECT SUM(kontostand) INTO :ger_sum FROM girokonto WHERE land = 'D' ;
END;
/

VARIABLE ch_sum NUMBER;
BEGIN
    SELECT SUM(kontostand) INTO :ch_sum FROM girokonto WHERE land = 'CH' ;
END;
/

PRINT ger_sum;
PRINT ch_sum;
COMMIT;

--b
--super
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
VARIABLE ger_sum NUMBER;
BEGIN
    SELECT SUM(kontostand) INTO :ger_sum FROM girokonto WHERE land = 'D' ;
END;
/

VARIABLE ch_sum NUMBER;
BEGIN
    SELECT SUM(kontostand) INTO :ch_sum FROM girokonto WHERE land = 'CH' ;
END;
/

PRINT ger_sum;
PRINT ch_sum;
COMMIT;

