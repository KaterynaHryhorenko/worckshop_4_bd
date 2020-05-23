
declare
begin

select * from table(Person_traveler('Yama Bob',TO_DATE('2001/11/21', 'yyyy')));

end;
Check_migration(
coury_in => 'Chaina',
coury_out => 'Japan',
date_migrate => to_date('01-JAN-2000', 'DD/MON/YYYY'),
pass => 'PJ456'
); 
end;