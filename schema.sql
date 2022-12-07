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