
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE Check_migration (coury_in In country.country%TYPE, 
pass In person.passport%TYPE,
coury_out IN country.country%TYPE,
date_migrate IN migrations.date_migration%TYPE)
is
/*
pass  person.passport%TYPE:= 'PJ123';
coury_in country.country%TYPE := 'Italy';
coury_out country.country%TYPE := 'Japan';
date_migrate date := to_date('1977/07/22', 'yyyy/mm/dd');
*/
BEGIN
update migrations set 
    date_migration = date_migrate
    where country_in = coury_in and
    country_out = coury_out and
    pass = pass;
 return;
EXCEPTION
    WHEN ACCESS_INTO_NULL then
    dbms_output.put_line('Country or person does not exist');

END;

