

CREATE OR REPLACE PROCEDURE Check_migration (coury_in In country.country%TYPE, 
pass In person.passport%TYPE,
coury_out IN country.country%TYPE,
new_date_migrate IN migrations.date_migration%TYPE,
date_migrate IN migrations.date_migration%TYPE)
is
cursor migr_date
is 
select
date_migration
from 
migrations;
ex exception;
BEGIN
 for rec in migr_date
        loop
        if (new_date_migrate= rec.date_migration) then
        raise ex;
        end if;
        end loop;
update migrations set 
    date_migration =   new_date_migrate
    where country_in = coury_in 
    and
    country_out = coury_out 
   and
    person_passport = pass
    and
    date_migrate = date_migration;
      IF SQL%ROWCOUNT = 0 THEN
        RAISE NO_DATA_FOUND;
        END IF;
 return;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.put_line('country or person does not exist');
when ex then
DBMS_OUTPUT.put_line('this date existed, unique constraint violated');
END;
--select * from migrations;