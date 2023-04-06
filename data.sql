/* Populate database with sample data. */

INSERT INTO animals(ID, NAME, DATE_OF_BIRTH, ESCAPe_ATTEMPtS, neutered, weight_kg)
VALUES 
(1, 'Agumon', '2020-02-03', 0, true, 10.23),
(2, 'Gabumon', '2018-11-15', 2, true, 8),
(3, 'Pikachu', '2021-01-07', 1, false, 15.04),
(4, 'Devimon', '2017-5-12', 5, true, 11);

-- Add new animals
INSERT INTO animals (ID, NAME, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
(5, 'Charmanser', '2022-02-8', 0, false, 11),
(6, 'Plantmon', '2020-11-15', 2, true, 5.7),
(7, 'Squirtle', '1993-04-02', 3, false, 12.13),
(8, 'aNGEMON', '2005-06-12', 1, true, 45),
(9, 'Boarmon', '2005-06-07', 7, true, 20.4),
(10, 'Blossom', '1998-10-13', 3, true, 17),
(11, 'Dito', '2022-05-14', 4, true, 22);

--Insert owners
INSERT INTO owners(full_name, age)
VALUES
('Sam Smith', 34),
('Jeniffer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- insert species
INSERT INTO species(name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals
SET species_id = 
CASE
  WHEN name LIKE '%mon' THEN (SELECT ID FROM species WHERE name = 'Digimon' LIMIT 1)
  ELSE (SELECT id from species WHERE name = 'Pokemon' LIMIT 1)
END;

UPDATE animals SET owner_id = 
CASE 
  WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
  WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jeniffer Orwell')
  WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
  WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
  WHEN name IN ('aNGEMON', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END;