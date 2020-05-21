INSERT INTO region ( region ) VALUES ( 'Asia' );

INSERT INTO region ( region ) VALUES ( 'Europe' );



INSERT INTO country (
    region_fk,
    country
) VALUES (
    'Europe',
    'Italy'
);

INSERT INTO country (
    region_fk,
    country
) VALUES (
    'Asia',
    'China'
);




INSERT INTO country (
    region_fk,
    country
) VALUES (
    'Asia',
    'Japan'
);

INSERT INTO person (
    name,
    passport,
    date_of_birth,
    native_country1
) VALUES (
    'Jun Huan',
    'PC123',
    TO_DATE('1977/07/22', 'yyyy/mm/dd'),
    'China'
);

INSERT INTO person (
    name,
    passport,
    date_of_birth,
    native_country1
) VALUES (
    'Yama Bob',
    'PJ123',
    TO_DATE('1982/11/21', 'yyyy/mm/dd'),
    'Japan'
);

INSERT INTO migrations (
    date_migration,
    person_passport,
    country_in,
    country_out
) VALUES (
    TO_DATE('2001/11/21', 'yyyy/mm/dd'),
    'PJ123',
    'Italy',
    'Japan'
);

INSERT INTO migrations (
    date_migration,
    person_passport,
    country_in,
    country_out
) VALUES (
    TO_DATE('2001/11/29', 'yyyy/mm/dd'),
    'PJ123',
    'Japan',
    'Italy'
);
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE Check_country (country IN country.country%TYPE, answer out BOOLEAN)
is
begin
FOR rec IN countries
loop
if (rec.country = 'Gabon')then
DBMS_OUTPUT.put_line('Gabon');
end if;
end loop;
DBMS_OUTPUT.put_line('country does not exist');
end;

declare 
countris country.country%TYPE := 'Gabon';
i NUMBER;
cursor countries
is
select 
country 
from country;
BEGIN

END;

DECLARE
  
  CHECK_CONSTRAINT_VIOLATED EXCEPTION;
  PRAGMA EXCEPTION_INIT(CHECK_CONSTRAINT_VIOLATED, -2290);
BEGIN
  INSERT INTO SOME_TABLE(COL1) VALUES ('X'); 
  RETURN;
EXCEPTION
  WHEN CHECK_CONSTRAINT_VIOLATED THEN  
    DBMS_OUTPUT.PUT_LINE('INSERT failed due to check constraint violation');
  WHEN OTHERS THEN                     
    DBMS_OUTPUT.PUT_LINE('Something else went wrong - ' || SQLCODE ||' : ' || SQLERRM);
END;