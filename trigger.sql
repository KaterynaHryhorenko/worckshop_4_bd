SET SERVEROUTPUT ON

create or replace TRIGGER ban
    before update of native_country on person
    for each row
   
    declare
    NATIVE_COUNTRY person.native_country%type;
    begin
     if (:new.native_country != :old.native_country) then
     NATIVE_COUNTRY:= :old.native_country;
     :new.native_country := NATIVE_COUNTRY;
       dbms_output.put_line('Can not change native country');
     end if;
    end ban;
    
--try    
UPDATE person set native_country = 'Spain' where person_name = 'Jun Huan';