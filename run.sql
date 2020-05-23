SET SERVEROUTPUT ON

declare
passport_proc  person.passport%TYPE;
country_in_proc country.country%TYPE;
country_out_proc country.country%TYPE;
cursor traveler_table
is
select
*
from 
table(Person_traveler('Yama Bob','Italy'));
begin

for rec in traveler_table 
loop
dbms_output.put_line(rec.person_name);
dbms_output.put_line(rec.country);
end loop;

/*
Check_migration(
'Japan',
 'PJ123',
 'China' ,
 to_date('1977/07/22', 'yyyy/mm/dd')
 ); */
end;