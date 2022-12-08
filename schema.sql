/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL (4,2),
    PRIMARY KEY (id)
);
 /* Add a column species of type string to your animals table */ 
ALTER TABLE animals 
ADD COLUMN species VARCHAR(250);

/* Create owners table */
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(250) NOT NULL,    
    age INT, 
    PRIMARY KEY (id)
);
/* Create table name species */
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL, 
    PRIMARY KEY (id)
);

/* Remove species column from animals table */
ALTER TABLE animals 
DROP COLUMN species;
/* Add column species_id which is a foreign key referencing species table */
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id) REFERENCES species(id);

/* Add column owner_id which is a foreign key referencing the owners table */
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id) REFERENCES owners(id);