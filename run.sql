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
dbms_output.put_line(rec.person_name || rec.date_migration);
end loop;
dbms_output.put_line('          exception works');
--doesn't update 
Check_migration(
'Japan',
 'PJ123',
 'Chiana' ,
 to_date('1977/07/22', 'yyyy/mm/dd'),
  to_date('2001/11/11', 'yyyy/mm/dd')
 ); 
 
  --updated
 Check_migration(
'Japan',
 'PJ123',
 'Italy',
  to_date('2001/07/22', 'yyyy/mm/dd'),
 to_date('2001/11/11', 'yyyy/mm/dd')
 ); 
 -- if unique constraint fails
Check_migration(
'Japan',
 'PJ123',
 'Italy',
  to_date('2001/07/22', 'yyyy/mm/dd'),
 to_date('2001/11/11', 'yyyy/mm/dd')
 );
end;
