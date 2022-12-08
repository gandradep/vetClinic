/*Queries that provide answers to the questions from all projects.*/

/* Find all animals whose name ends in "mon". */
SELECT * from animals WHERE name LIKE '%mon';
/* List the name of all animals born between 2016 and 2019. */
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
/* List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT name from animals WHERE neutered = 't' AND escape_attempts < 3;
/* List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT name, escape_attempts FROM animals WHERE  weight_kg > 10.5;
/* Find all animals that are neutered. */
SELECT * FROM animals WHERE  neutered = 't';
/* Find all animals not named Gabumon. */
SELECT * FROM animals WHERE NOT name = 'Gabumon';
/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Transaction update animals table setting species column to unspecified. Verify and rollBack. */
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Transaction update species to pokemon or digimon and commit */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

/* Transaction delete all records and rollback */
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Transaction update weights to positive, create SAVEPOINT and COMMIT*/
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT NUM_ONE;
UPDATE animals SET weight_kg=-1*weight_kg;
ROLLBACK TO NUM_ONE;
UPDATE animals SET weight_kg=-weight_kg WHERE weight_kg<0;
COMMIT;

/* How many animals are there? 10 */
SELECT COUNT(*) FROM animals;
/* How many animals have never tried to escape? 2 */
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
/* What is the average weight of animals? 15.55kg*/
SELECT AVG(weight_kg) FROM animals;
/* Who escapes the mot, neutered or not neutered animals? neutered  */
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
/* What is the minimum and maximum weight of each type of animal? */
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
/*What is the average number of escape attempts per animal type of those born between 1990 and 2000? 3 */
SELECT species, AVG(escape_attempts) 
FROM animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' 
GROUP BY species;

/* What animals belong to Melody Pond? */
SELECT name FROM animals JOIN owners ON owner_id=owners.id WHERE owners.full_name = 'Melody Pond';
/* List of all animals that are pokemon */
SELECT animals.name FROM animals JOIN species ON species_id=species.id WHERE species.name = 'Pokemon';
/* List all owners and their animals, remember to include those that don't own any animal */
SELECT full_name, name FROM animals RIGHT JOIN owners ON owner_id=owners.id;
/* How many animals are there per species? */
SELECT COUNT(a.name), s.name FROM animals a JOIN species s ON a.species_id = s.id GROUP BY s.name;
/* List all Digimon owned by Jennifer Orwell */
SELECT a.name 
FROM animals a 
JOIN owners o ON a.owner_id=o.id 
JOIN species s ON a.species_id=s.id 
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';
/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT name, escape_attempts 
FROM animals 
JOIN owners ON owner_id=owners.id 
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts=0;
/* Who owns the most animals? */
SELECT COUNT(a.name), o.full_name 
FROM owners o JOIN animals a ON a.owner_id = o.id 
GROUP BY o.full_name 
ORDER BY count DESC 
LIMIT 1;