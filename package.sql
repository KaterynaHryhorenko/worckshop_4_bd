create or replace function Person_traveler(peron_traveler char, year_migration date)
return traveler_table_type
 PIPELINED
        is
result_table traveler_table_type := traveler_table_type();
begin
for cursor_traveler in (select name,country_out,date_migration from person_migration
WHERE country_in = native_country1
and name = person_traveler
and year_migration = )
loop
result_table.extend;
result_table (result_table.last) := traveler_row(cursor.name,
                                                cursor.country_out,
                                                cursor.date_migration);
end loop;

end;