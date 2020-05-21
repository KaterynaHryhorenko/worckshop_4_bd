CREATE TABLE coastline (
    coastline   NUMBER(38, 2) NOT NULL,
    "date"      DATE,
    country_fk  CHAR(60) NOT NULL
);

ALTER TABLE coastline ADD CONSTRAINT coastline_pk PRIMARY KEY ( coastline );

CREATE TABLE country (
    country    CHAR(60) NOT NULL,
    region_fk  CHAR(60) NOT NULL
);

ALTER TABLE country ADD CONSTRAINT country_pk PRIMARY KEY ( country );

CREATE TABLE gdp (
    gdp         NUMBER,
    "date"      DATE,
    country_fk  CHAR(60) NOT NULL
);

CREATE TABLE migrations (
    date_migration           DATE NOT NULL,
    person_passport  CHAR(12) NOT NULL,
    country_in       CHAR(60) NOT NULL,
    country_out      CHAR(60) NOT NULL
);

ALTER TABLE migrations ADD CONSTRAINT migration_pk PRIMARY KEY ( date_migration,
                                                                person_passport );

CREATE TABLE person (
    name             CHAR(60),
    passport         CHAR(12) NOT NULL,
    date_of_birth    DATE,
    native_country1  CHAR(60) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT person_pk PRIMARY KEY ( passport );

CREATE TABLE region (
    region CHAR(60) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( region );

ALTER TABLE coastline
    ADD CONSTRAINT coastline_country_fk FOREIGN KEY ( country_fk )
        REFERENCES country ( country );

ALTER TABLE country
    ADD CONSTRAINT country_region_fk FOREIGN KEY ( region_fk )
        REFERENCES region ( region );

ALTER TABLE gdp
    ADD CONSTRAINT gdp_country_fk FOREIGN KEY ( country_fk )
        REFERENCES country ( country );

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
    ADD CONSTRAINT person_country_fk FOREIGN KEY ( native_country1 )
        REFERENCES country ( country );
        
