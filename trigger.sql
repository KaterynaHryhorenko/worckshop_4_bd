SET SERVEROUTPUT ON

create or replace TRIGGER ban
    before update of native_country1 on person
    for each row
   
    declare
    NATIVE_COUNTRY person.native_country1%type;
    begin
     if (:new.native_country1 != :old.native_country1) then
     NATIVE_COUNTRY:= :old.native_country1;
       dbms_output.put_line("Can't change native country");
     end if;
    end ban;
    
UPDATE person set native_country1 = 'Japan' where name = 'Yama Bob';