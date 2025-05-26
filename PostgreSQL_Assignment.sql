--  rangers table create
CREATE TABLE rangers (
  ranger_id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  region VARCHAR(200) NOT NULL
);

-- species table create
CREATE TABLE species (
  species_id SERIAL PRIMARY KEY,
  common_name VARCHAR(200) NOT NULL,
  scientific_name VARCHAR(200) NOT NULL,
  discovery_date DATE NOT NULL,
  conservation_status VARCHAR(200) DEFAULT 'Unknown'
);

-- sightings table create
CREATE TABLE sightings (
  sighting_id SERIAL PRIMARY KEY,
  species_id INT REFERENCES species(species_id),
  ranger_id INT REFERENCES rangers(ranger_id),
  location VARCHAR(100) NOT NULL,
  sighting_time TIMESTAMP NOT NULL,
  notes TEXT
);

-- data add to the database rangers
INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');


-- date add to database species
INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');



-- data add sightlit table
INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);





-- Problem 1
INSERT INTO rangers (name, region) VALUES ('Derek Fox', 'Coastal Plains');





-- Problem 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;







-- Problem 3
SELECT * FROM sightings WHERE location ILIKE '%Pass%';



-- Problem 4
SELECT rangers.name, COUNT(sightings.sighting_id) as total_sightings 
FROM rangers
LEFT JOIN sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY rangers.name





