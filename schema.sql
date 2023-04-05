/* Database schema to keep the structure of entire database. */

-- creating database
CREATE DATABASE vet_clinic;

-- -- create table animals
CREATE TABLE ANIMALS(
    ID INTEGER NOT NULL,
    NAME VARCHAR(20),
    DATE_OF_BIRTH DATE,
    ESCAPE_ATTEMPTS INTEGER,
    NEUTERED BOOLEAN,
    WEIGHT_KG DECIMAL
);

-- Add COLUMN SPICIES
ALTER TABLE animals ADD COLUMN SPICIES VARCHAR;
