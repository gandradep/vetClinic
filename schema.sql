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

/* Create table vets */
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,    
    age INT,
    date_of_graduation DATE, 
    PRIMARY KEY (id)
);

/* Create join table specializations */
CREATE TABLE specializations (
    id_vet INT,
    id_species INT, 
    PRIMARY KEY (id_vet, id_species),
    FOREIGN KEY(id_vet) REFERENCES vets (id), 
    FOREIGN KEY(id_species) REFERENCES species (id)
);

/* Create join table visits */
CREATE TABLE visits (
    id_vet INT,
    id_animal INT,
    date_of_visit DATE,     
    FOREIGN KEY(id_vet) REFERENCES vets (id), 
    FOREIGN KEY(id_animal) REFERENCES animals (id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Create Index on the visits and owners table for persormance and lesser excution time
CREATE INDEX id_animal_asc ON visits(id_animal ASC);
CREATE INDEX vet_ind ON visits(id_vet ASC);
CREATE INDEX email_index ON owners(email);


