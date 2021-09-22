/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '12-31-2019';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*update the animals table by setting the species column to unspecified */

BEGIN TRANSACTION;
-- BEGIN
UPDATE animals SET species = 'unspecified';
-- UPDATE 10
ROLLBACK;
-- ROLLBACK

/*Inside a transaction:
Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
Commit the transaction.
Verify that change was made and persists after commit.*/

BEGIN TRANSACTION;
-- BEGIN
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
-- UPDATE 6
UPDATE animals SET species = 'pokemon' WHERE species != 'digimon';
-- UPDATE 4
COMMIT;
-- COMMIT

/*Inside a transaction delete all records in the animals table, then roll back the transaction.*/

BEGIN TRANSACTION;
-- BEGIN
DELETE FROM animals;
-- DELETE 10
ROLLBACK;
-- ROLLBACK

/*Inside a transaction:
Delete all animals born after Jan 1st, 2022.
Create a savepoint for the transaction.
Update all animals' weight to be their weight multiplied by -1.
Rollback to the savepoint
Update all animals' weights that are negative to be their weight multiplied by -1.
Commit transaction*/

BEGIN TRANSACTION;
-- BEGIN
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
-- DELETE 1
SAVEPOINT deleteBirth;
-- SAVEPOINT
UPDATE animals SET weight_kg = weight_kg*-1 WHERE id > 0;
-- UPDATE 9
ROLLBACK TO SAVEPOINT deleteBirth;
-- ROLLBACK
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
-- UPDATE 3
COMMIT;
-- COMMIT


/*Write queries to answer the following questions:
How many animals are there?
How many animals have never tried to escape?
What is the average weight of animals?
Who escapes the most, neutered or not neutered animals?
What is the minimum and maximum weight of each type of animal?
What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/

SELECT COUNT(*) FROM animals;
 count
-------
     9
(1 row)


SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
 count
-------
     2
(1 row)


SELECT AVG(weight_kg) FROM animals;
         avg
---------------------
 16.6444444444444444
(1 row)


SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered;
 neutered | count
----------+-------
 f        |     3
 t        |     6
(2 rows)


SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
 species | min | max
---------+-----+-----
 pokemon  |  11 |  17
 digimon  |   8 |  45
(2 rows)

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '01-01-1990' AND '12-31-2000' GROUP BY species;
 species |        avg
---------+--------------------
         | 3.0000000000000000
(1 row)