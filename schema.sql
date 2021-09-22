/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
     escape_attempts INT,
     neutered BOOLEAN,
     weight_kg DECIMAL,
     species VARCHAR(45)  
    );

    ALTER TABLE animals ADD species VARCHAR(45);
