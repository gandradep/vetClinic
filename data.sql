/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, TRUE, 11.00);
/* Populate more animals to table */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, FALSE, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, TRUE, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, TRUE, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, TRUE, 22);

/* Data for the owners table */
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);

/* Data for species table */
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

/* Include species_id value */
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

/* Add values on owners_id column from animal table */
UPDATE animals SET owner_id = 1 WHERE name='Agumon';
UPDATE animals SET owner_id = 2 WHERE name='Gabumon' OR name='Pikachu';
UPDATE animals SET owner_id = 3 WHERE name='Devimon' OR name='Plantmon';
UPDATE animals SET owner_id = 4 WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owner_id = 5 WHERE name='Angemon' OR name='Boarmon';

/* ADD data to vets table */
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

/* Insert data for specialities */
INSERT INTO specializations (id_vet, id_species) VALUES (1, 1), (3, 1), (3, 2), (4, 2);

/* Insert data for visits */
INSERT INTO visits (id_vet, id_animal, date_of_visit) 
VALUES 
    (1, 1, '2020-05-24'),
    (3, 1, '2020-07-22'),
    (4, 2, '2021-02-02'),
    (2, 3, '2020-01-05'),
    (2, 3, '2020-03-08'),
    (2, 3, '2020-05-14'),
    (3, 4, '2021-05-04'),
    (4, 5, '2021-02-24'),
    (2, 6, '2019-12-21'),
    (1, 6, '2020-08-10'),
    (2, 6, '2021-04-07'),
    (3, 7, '2019-09-29'),
    (4, 8, '2020-10-03'),
    (4, 8, '2020-11-04'),
    (2, 9, '2019-01-24'),
    (2, 9, '2019-05-15'),
    (2, 9, '2020-02-27'),
    (2, 9, '2020-08-03'),
    (3, 10, '2020-05-24'),
    (1, 10, '2021-01-11');
