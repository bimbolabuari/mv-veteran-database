/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '02-03-2020', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '10-15-2018', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '01-07-2021', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '05-12-2017', 5, true, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '02-08-2020', 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '10-15-2022', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '04-02-1993', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '06-12-2005', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '06-07-2005', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '10-13-1998', 3, true, 17);
INSERT INTO owners  (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners  (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners  (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners  (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners  (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners  (full_name, age) VALUES ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Wiliam Tatcher', 45, '23-04-2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '17-01-2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '04-05-1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '08-06-2008');
INSERT INTO specializations (species_id, vet_id) VALUES ((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'William Tatcher'));
INSERT INTO specializations (species_id, vet_id) VALUES ((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'));
INSERT INTO specializations (species_id, vet_id) VALUES ((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'));
INSERT INTO specializations (species_id, vet_id) VALUES ((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'));
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '24-05-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '22-07-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '02-02-2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '05-01-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '08-03-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '14-05-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '04-05-2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '24-02-2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '21-12-2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '10-08-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '07-04-2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '29-09-2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '03-10-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '04-11-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '24-01-2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '15-05-2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '27-02-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '03-08-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '24-05-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '11-01-2021');


-- Modify your inserted animals so it includes the species_id value

BEGIN TRANSACTION;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';
COMMIT;

-- Modify your inserted animals to include owner information (owner_id)

BEGIN TRANSACTION;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Plantmon' OR name = 'Devimon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Squirtle' OR name = 'Blossom'  OR name = 'Charmander';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Boarmon' OR name = 'Angemon';
SELECT full_name AS owner, name FROM animals JOIN owners ON animals.owner_id = owners.id;
COMMIT;
SELECT full_name AS owner, name FROM animals JOIN owners ON animals.owner_id = owners.id;