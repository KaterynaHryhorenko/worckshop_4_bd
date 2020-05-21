SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE Check_migration (coury_in In country.country%TYPE, 
pass In person.passport%TYPE,
coury_out IN country.country%TYPE,
date_migrate IN migrations.date_migration%TYPE)
is
    country_ex EXCEPTION;
    person_ex EXCEPTION;
    country_person_ex EXCEPTION;
    i INT := 1;
    CURSOR countries IS
    SELECT
        country
    FROM
        country;

    CURSOR people IS
    SELECT
        passport
    FROM
        person;

BEGIN
    FOR rec IN people LOOP 
    IF ( rec.passport = pass) THEN
        i := i + 2;
    END IF;
    END LOOP;

    FOR rec IN countries LOOP 
    IF ( rec.country = coury_in and rec.country = coury_out) THEN
        i := i - 1;
    END IF;
    END LOOP;
    IF ( i = 3 ) THEN
        RAISE country_ex;
    ELSIF ( i = 0 ) THEN
        RAISE person_ex;
    ELSIF ( i = 1 ) THEN
        RAISE country_person_ex;
    END IF;
    insert into migrations(date_migration,passport,country_in,country_out) values (date_migrations,pass,coury_in,coury_out);
    return;
EXCEPTION
    WHEN country_ex THEN
        dbms_output.put_line('Country does not exist');
    WHEN person_ex THEN
        dbms_output.put_line('Person does not exist');
    WHEN country_person_ex THEN
        dbms_output.put_line('Person and country does not exist');
    WHEN OTHERS THEN
        dbms_output.put_line('Something else went wrong - '
                             || sqlcode
                             || ' : '
                             || sqlerrm);
END;