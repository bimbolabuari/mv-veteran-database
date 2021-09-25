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

-- What animals belong to Melody Pond?
SELECT name AS animal_name, full_name AS owner FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).

SELECT animals.name, species.name AS species FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.

SELECT full_name, name AS animal_name  FROM owners  LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?

SELECT COUNT(animals.name), species.name FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.

SELECT full_name AS owner, animals.name AS animal_name, species.name FROM owners JOIN animals ON owners.id = animals.owner_id JOIN species ON animals.species_id = species.id WHERE species.name = 'Digimon' AND full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.

SELECT full_name AS owner, animals.name AS animal_name, escape_attempts FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;

-- Who owns the most animals?

SELECT COUNT(name) AS owned, full_name AS fullName FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY fullName ORDER BY owned DESC LIMIT 1;

-- Who was the last animal seen by William Tatcher?
SELECT animals.name AS animal, vets.name AS vet, visit_date FROM visits JOIN animals ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tatcher' ORDER BY visit_date DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animals.name) FROM visits JOIN animals ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id  WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name AS vet, species.name AS specialization FROM specializations s JOIN species ON species.id = s.species_id RIGHT JOIN vets ON vets.id = s.vet_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name AS animal, vets.name AS vet, visit_date FROM visits v  JOIN animals ON animals.id = v.animal_id JOIN vets ON vets.id = v.vet_id WHERE vets.name = 'Stephanie Mendez' AND visit_date BETWEEN '01-04-2020' AND '30-08-2020';

-- What animal has the most visits to vets?
SELECT animals.name AS animal, COUNT(animals.name) AS visits FROM visits v JOIN animals ON animals.id = v.animal_id GROUP BY animals.name ORDER BY COUNT(animals.name) DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT v.visit_date, animals.name FROM visits v JOIN vets ON vets.id = v.vet_id JOIN animals ON animals.id = v.animal_id WHERE vets.name = 'Maisy Smith' GROUP BY animals.name, visit_date ORDER BY visit_date LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT visit_date, animals.*, species.name AS species, vets.name AS vet_name, vets.age, vets.date_of_graduation AS graduation  FROM visits v JOIN animals ON animals.id = v.animal_id JOIN vets ON vets.id = v.vet_id JOIN species ON species.id = animals.species_id ORDER BY visit_date DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(animals.name) AS non_specialized_visits FROM visits v JOIN animals ON animals.id = v.animal_id JOIN vets ON vets.id = v.vet_id LEFT JOIN specializations s ON v.vet_id = s.vet_id LEFT JOIN species ON species.id = s.species_id WHERE animals.species_id != s.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT COUNT(animals.species_id) AS species_analyzed, vets.name, species.name AS should_specialize_on FROM visits v JOIN animals ON animals.id = v.animal_id JOIN species ON animals.species_id = species.id JOIN vets ON vets.id = v.vet_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name, vets.name  ORDER BY species_analyzed DESC LIMIT 1;