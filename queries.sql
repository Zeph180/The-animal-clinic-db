/*Queries that provide answers to the questions from all projects.*/

-- select name ending with mon
SELECT * FROM animals WHERE NAME like '%mon'

SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name from animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts from animals WHERE weight_kg > 10.5; 

SELECT * from animals WHERE neutered = true;

SELECT * from animals WHERE name != 'Gabumon';

SELECT * from animals WHERE weight_kg BETWEEN 10.4 and 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals 

-- update the animals table by setting the species column to unspecified
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = 'null';
COMMIT;
SELECT * FROM animals;

--  Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Delete all animals born after Jan 1st, 2022.
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK To my_savepoint;
UPDATE animals SET weight_kg = WEIGHT_KG * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, avg(escape_attempts) AS avg_escape_att 
FROM animals 
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) AS AVG_SCAPE_ATTEMPTS
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT * FROM animals;