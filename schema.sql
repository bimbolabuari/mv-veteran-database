/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
     escape_attempts INT,
     neutered BOOLEAN,
     weight_kg DECIMAL,
     species_id INT,
     owner_id INT,
    CONSTRAINT species_id
      FOREIGN KEY(species_id)
      REFERENCES species(id)
      ON DELETE CASCADE,
    CONSTRAINT owner_id
      FOREIGN KEY(owner_id)
      REFERENCES owners(id)
      ON DELETE CASCADE
    );

ALTER TABLE animals ADD species VARCHAR(45);

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100),
  age INT
);

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name VARCHAR(45)
);
