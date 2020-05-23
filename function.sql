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


--������ ���� ��� ��������� � �� ���� �����
create or replace function Person_traveler
return traveler_table_type
as
result_table traveler_table_type := traveler_table_type();
begin
for cursor in (select name,country_out,date_migration from person_migration WHERE country_in = native_country1)
loop
result_table.extend;
result_table (result_table.last) := traveler_row(cursor.name,
                                                cursor.country_out,
                                                cursor.date_migration);
end loop;
end;