CREATE OR REPLACE TRIGGER ban
    after update OF native_country on person
    for each row
    when(new.native_country != native_country)
    declare
    begin
    end ban;