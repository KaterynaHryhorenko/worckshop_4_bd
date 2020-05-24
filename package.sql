create or replace PACKAGE traveler_pack
is
type traveler_type_row is record(
person_name char(60)
,date_migration date
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
for cursor_travels in (select person_name,date_migration from person_migration 
WHERE country_in = native_country
and name_traveler=person_name and country_out = country_travel)
loop
pipe row(cursor_travels);
end loop;
end;

 PROCEDURE Check_migration (coury_in In country.country%TYPE, 
pass In person.passport%TYPE,
coury_out IN country.country%TYPE,
date_migrate IN migrations.date_migration%TYPE)
is
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