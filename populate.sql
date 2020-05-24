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
    'Europe',
    'Ukraine'
);

INSERT INTO country (
    region_fk,
    country
) VALUES (
    'Europe',
    'Spain'
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
    person_name,
    passport,
    date_of_birth,
    native_country
) VALUES (
    'Jun Huan',
    'PC123',
    TO_DATE('1977/07/22', 'yyyy/mm/dd'),
    'China'
);

INSERT INTO person (
    person_name,
    passport,
    date_of_birth,
    native_country
) VALUES (
    'Pedro Osno',
    'PS123',
    TO_DATE('1989/01/22', 'yyyy/mm/dd'),
    'Spain'
);

INSERT INTO person (
    person_name,
    passport,
    date_of_birth,
    native_country
) VALUES (
    'Kolya Chaika',
    'PU123',
    TO_DATE('1999/02/28', 'yyyy/mm/dd'),
    'Ukraine'
);
INSERT INTO person (
    person_name,
    passport,
    date_of_birth,
    native_country
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
INSERT INTO migrations (
    date_migration,
    person_passport,
    country_in,
    country_out
) VALUES (
    TO_DATE('2003/12/01', 'yyyy/mm/dd'),
    'PC123',
    'China',
    'Italy'
);
INSERT INTO migrations (
    date_migration,
    person_passport,
    country_in,
    country_out
) VALUES (
    TO_DATE('2003/12/01', 'yyyy/mm/dd'),
    'PU123',
    'Ukraine',
    'Italy'
);
INSERT INTO migrations (
    date_migration,
    person_passport,
    country_in,
    country_out
) VALUES (
    TO_DATE('2002/05/01', 'yyyy/mm/dd'),
    'PS123',
    'Ukraine',
    'Japan'
);
INSERT INTO migrations (
    date_migration,
    person_passport,
    country_in,
    country_out
) VALUES (
    TO_DATE('2001/02/01', 'yyyy/mm/dd'),
    'PS123',
    'Spain',
    'Ukraine'
);

INSERT INTO migrations (
    date_migration,
    person_passport,
    country_in,
    country_out
) VALUES (
    TO_DATE('2011/11/29', 'yyyy/mm/dd'),
    'PJ123',
    'Japan',
    'Italy'
);
INSERT INTO gdp(country_fk,date_update,gdp)values('Ukraine',TO_DATE('2001/02/01', 'yyyy/mm/dd'),130000000);
INSERT INTO gdp(country_fk,date_update,gdp)values('Spain',TO_DATE('2001/05/01', 'yyyy/mm/dd'),38000000);

insert into city (country_fk,city) values ('Ukraine','Kiev');
insert into city (country_fk,city) values ('Ukraine','Vinnitsa');


insert into land_price (date_update, city_fk, sale_price, square) values (TO_DATE('2001/05/01 17:28', 'yyyy/mm/dd hh24:mi'),'Kiev',20,1);
insert into land_price (date_update, city_fk, sale_price, square) values (TO_DATE('2001/05/01 15:15', 'yyyy/mm/dd hh24:mi'),'Kiev',25,1);

