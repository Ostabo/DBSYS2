-- a
select *
from all_tables
where table_name = 'DBESTELLUNG';
-- b
select TABLE_NAME, DATA_TYPE
from all_tab_columns
where table_name = 'DBESTELLUNG';
-- c
select t1.table_name
from ALL_TABLES t1,
     ALL_TABLES t2
where t1.OWNER = t2.OWNER
  and t2.TABLE_NAME = 'DBESTELLUNG';
-- d
select sum(t1.NUM_ROWS) as SUM_OF_ROWS
from ALL_TABLES t1,
     ALL_TABLES t2
where t1.OWNER = t2.OWNER
  and t2.TABLE_NAME = 'DBESTELLUNG';
-- e
select c1.CONSTRAINT_TYPE, c2.TABLE_NAME, c2.CONSTRAINT_TYPE, t.COLUMN_NAME
from ALL_CONSTRAINTS c1, ALL_CONSTRAINTS c2, ALL_TAB_COLS t
where c1.table_name = 'DBESTELLUNG'
  and c1.CONSTRAINT_TYPE = 'R'
  and c2.CONSTRAINT_NAME = c1.R_CONSTRAINT_NAME
  and c2.TABLE_NAME = t.TABLE_NAME;