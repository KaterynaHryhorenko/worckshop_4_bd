CREATE TABLE city (
    city        CHAR(50) NOT NULL,
    country_fk  CHAR(60) NOT NULL
);

ALTER TABLE city ADD CONSTRAINT city_pk PRIMARY KEY ( city );

CREATE TABLE country (
    country    CHAR(60) NOT NULL,
    region_fk  CHAR(60) NOT NULL
);

ALTER TABLE country ADD CONSTRAINT country_pk PRIMARY KEY ( country );

CREATE TABLE gdp (
    gdp         NUMBER,
    date_update      DATE NOT NULL,
    country_fk  CHAR(60) NOT NULL
);

ALTER TABLE gdp ADD CONSTRAINT gdp_pk PRIMARY KEY ( date_update,
                                                    country_fk );

CREATE TABLE land_price (
    date_update  DATE NOT NULL,
    sale_price   NUMBER(38, 2),
    square       NUMBER(38, 2),
    city_fk      CHAR(50) NOT NULL
);

ALTER TABLE land_price ADD CONSTRAINT land_price_pk PRIMARY KEY ( date_update,
                                                                  city_fk );

CREATE TABLE migrations (
    person_passport  CHAR(12) NOT NULL,
    country_in       CHAR(60) NOT NULL,
    country_out      CHAR(60) NOT NULL,
    date_migration   DATE NOT NULL
);


CREATE TABLE person (
    person_name     CHAR(60),
    passport        CHAR(12) NOT NULL,
    date_of_birth   DATE,
    native_country  CHAR(60) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT person_pk PRIMARY KEY ( passport );

CREATE TABLE region (
    region CHAR(60) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( region );

ALTER TABLE city
    ADD CONSTRAINT city_country_fk FOREIGN KEY ( country_fk )
        REFERENCES country ( country );

ALTER TABLE country
    ADD CONSTRAINT country_region_fk FOREIGN KEY ( region_fk )
        REFERENCES region ( region );

ALTER TABLE gdp
    ADD CONSTRAINT gdp_country_fk FOREIGN KEY ( country_fk )
        REFERENCES country ( country );

ALTER TABLE land_price
    ADD CONSTRAINT land_price_city_fk FOREIGN KEY ( city_fk )
        REFERENCES city ( city );

ALTER TABLE migrations
    ADD CONSTRAINT migration_country_fk FOREIGN KEY ( country_in )
        REFERENCES country ( country );

ALTER TABLE migrations
    ADD CONSTRAINT migration_country_fkv2 FOREIGN KEY ( country_out )
        REFERENCES country ( country );

ALTER TABLE migrations
    ADD CONSTRAINT migration_person_fk FOREIGN KEY ( person_passport )
        REFERENCES person ( passport );

ALTER TABLE person
    ADD CONSTRAINT person_country_fk FOREIGN KEY ( native_country )
        REFERENCES country ( country );
