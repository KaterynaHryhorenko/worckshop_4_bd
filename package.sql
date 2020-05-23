create or replace PACKAGE traveler_pack
is
type traveler_type_row is record(
person_name char(60)
,country char(60)
);

type traveler_table is table of traveler_type_row;

function Person_travel(name_traveler CHAR,country_travel char)
return traveler_table
PIPELINED;

PROCEDURE Check_migration (coury_in In country.country%TYPE, 
pass In person.passport%TYPE,
coury_out IN country.country%TYPE,
date_migrate IN migrations.date_migration%TYPE);
end traveler_pack;
/
create or replace PACKAGE body traveler_pack
is
function Person_travel(name_traveler CHAR,country_travel char)
return traveler_table
pipelined
is
begin
for cursor_travels in (select name,country_out  from person_migration 
WHERE country_in = native_country1
and name_traveler=name and country_out = country_travel)
loop
pipe row(cursor_travels);
end loop;
end;

 PROCEDURE Check_migration (coury_in In country.country%TYPE, 
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

end traveler_pack;
/