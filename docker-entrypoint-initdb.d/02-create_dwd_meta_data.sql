CREATE TABLE dwd_meta_data
(
  location_id BIGINT NOT NULL,
  station_id BIGINT NOT NULL,
  from_date DATE NOT NULL,
  until_date DATE NOT NULL,
  station_height INT NOT NULL,
  federal_state VARCHAR NOT NULL,
  PRIMARY KEY (location_id, station_id),
  FOREIGN KEY (location_id) REFERENCES location_meta_data (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);
