
CREATE TABLE galaxy(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  number_of_stars INT,
  brightness INT,
  rating NUMERIC(3, 2),
  description TEXT,
  contains_sun BOOLEAN,
  contains_heat BOOLEAN,
);


CREATE TABLE star(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  galaxy INT REFERENCES galaxy(id),
  description TEXT,
  brightness INT,
  rating NUMERIC(3, 2),
  emits_heat BOOLEAN,
);

CREATE TABLE planet(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  star INT REFERENCES star(id),
  rating NUMERIC(3, 2),
  description TEXT,
  emits_heat BOOLEAN,
);

CREATE TABLE moon(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  planet INT REFERENCES planet(id),
  brightness INT,
  rating NUMERIC(3, 2),
  description TEXT,
  emits_heat BOOLEAN,
);

INSERT INTO moon VALUES(1, 'Earth moon', 4.9, 'Beautiful, no life', TRUE, 1);
INSERT INTO planet VALUES(4, 'Jupiter', 4.5, 'Beautiful, no life', TRUE, 2);