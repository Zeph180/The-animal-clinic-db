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
ALTER TABLE animals ADD COLUMN SPECIES VARCHAR;

CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;

--rEMOVE SPECIES COLUMN abbrev
ALTER TABLE animals DROP COLUMN species;

--ADD FOREIGN KEY COLUMN REF species TABLE
ALTER TABLE animals ADD COLUMN species_ID INTEGER REFERENCES species(id); 

--FOREIGN KEY COLUMN REF owners TABLE
ALTER TABLE animals ADD COLUMN owner_ID INTEGER REFERENCES owners(id);

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
  animal_id INTEGER REFERENCES animals(id),
  vet_id INTEGER REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY (animal_id, vet_id, date_of_visit)
);