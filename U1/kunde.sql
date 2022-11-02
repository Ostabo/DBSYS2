CREATE TABLE KUNDE 
(
  LAND VARCHAR2(20 BYTE) 
, KUNDENID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) NOT NULL
, AGE NUMBER 
, CONSTRAINT KUNDE_PK PRIMARY KEY 
  (
    KUNDENID
  )
) 