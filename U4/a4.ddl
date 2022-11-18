CREATE TABLE Vorlesung (ID number(10) GENERATED AS IDENTITY, StudiengangID varchar2(255) NOT NULL, Name varchar2(255) NOT NULL, Ects number(10) NOT NULL, Sws number(10) NOT NULL, PRIMARY KEY (ID));
CREATE TABLE Studiengang (ID varchar2(255) NOT NULL, Kuerzel varchar2(255), Abschluss varchar2(255), PRIMARY KEY (ID));
ALTER TABLE Vorlesung ADD CONSTRAINT enthalten FOREIGN KEY (StudiengangID) REFERENCES Studiengang (ID);
