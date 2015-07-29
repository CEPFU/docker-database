CREATE TABLE location_meta_data
(
  location_id SERIAL PRIMARY KEY NOT NULL,
  location_position GEOMETRY NOT NULL,
  location_description VARCHAR NOT NULL
);
