
create view person_migration
as
select 
person_name ,
native_country,
country_in,
country_out,
migrations.date_migration
from migrations
join person on person.passport = migrations.person_passport;


CREATE or replace type traveler_row as object(
person_name char(60)
,date_migration date
) 
/
create type traveler_table_type is table of traveler_row;
/

--instance now many times bob was in italy
create or replace function Person_traveler(name_traveler CHAR,country_travel char)
return traveler_table_type

IS
result_table traveler_table_type := traveler_table_type();
begin
for cursor_travels in (select person_name,country_out,date_migration from person_migration 
WHERE country_in = native_country
and name_traveler=person_name and country_out = country_travel)
loop

result_table.extend;
result_table (result_table.last) := traveler_row(cursor_travels.person_name,
                                              cursor_travels.date_migration);
end loop;
return result_table;
end;

