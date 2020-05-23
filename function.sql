--drop view person_migration;
--drop type traveler_row;
--drop type traveler_table_type;
--drop function Person_traveler;
--drop view person_migration;
--drop type traveler_row;
--drop type traveler_table_type;
--drop function Person_traveler;
create view person_migration
as
select 
name ,
native_country1,
country_in,
country_out,
date_migration
from migrations
join person on person.passport = migrations.person_passport;


CREATE type traveler_row as object(
person_name char(60)
,country char(60)
,date_migration date
) 

create type traveler_table_type is table of traveler_row;


--скільки разів боб мандрував зі своєї рідної країни
create or replace function Person_traveler(name_traveler CHAR,year_travel date)
return traveler_table_type

IS
result_table traveler_table_type := traveler_table_type();
begin
for cursor_travels in (select name,country_out,date_migration from person_migration 
WHERE country_in = native_country1
and name_traveler=name and year_travel=date_migration)
loop

result_table.extend;
result_table (result_table.last) := traveler_row(cursor_travels.name,
                                              cursor_travels.country_out,
                                             cursor_travels.date_migration);
end loop;
return result_table;
end;

