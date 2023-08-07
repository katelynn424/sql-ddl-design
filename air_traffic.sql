-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  departure_city_id INTEGER REFERENCES cities(id) ON DELETE CASCADE,
  arrival_city_id INTEGER REFERENCES cities(id) ON DELETE CASCADE
);

INSERT INTO countries (name) VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO cities (name, country_id) VALUES
  ('Washington DC', 1),
  ('Tokyo', 2),
  ('London', 3),
  ('Los Angeles', 1),
  ('Seattle', 1),
  ('Mexico City', 1),
  ('Paris', 4),
  ('Casablanca', 5),
  ('Dubai', 6),
  ('Beijing', 7),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Sao Paolo', 8),
  ('Santiago', 9);

INSERT INTO tickets (first_name, last_name, seat, departure, arrival, airline, departure_city_id, arrival_city_id) VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08T09:00:00', '2018-04-08T12:00:00', 'United', 1, 5),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19T12:45:00', '2018-12-19T16:15:00', 'British Airways', 2, 3),
  ('Sonja', 'Pauley', '12F', '2018-01-02T07:00:00', '2018-01-02T08:03:00', 'Delta', 4, 6),
  ('Jennifer', 'Finch', '20A', '2018-04-15T16:50:00', '2018-04-15T21:00:00', 'Delta', 5, 7),
  ('Waneta', 'Skeleton', '23D', '2018-08-01T18:30:00', '2018-08-01T21:50:00', 'TUI Fly Belgium', 8, 9),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31T01:15:00', '2018-10-31T12:55:00', 'Air China', 10, 7),
  ('Berkie', 'Wycliff', '9E', '2019-02-06T06:00:00', '2019-02-06T07:47:00', 'United', 11, 12),
  ('Alvin', 'Leathes', '1A', '2018-12-22T14:42:00', '2018-12-22T15:56:00', 'American Airlines', 13, 14),
  ('Berkie', 'Wycliff', '32B', '2019-02-06T16:28:00', '2019-02-06T19:18:00', 'American Airlines', 12, 15),
  ('Cory', 'Squibbes', '10D', '2019-01-20T19:30:00', '2019-01-20T22:45:00', 'Avianca Brasil', 16, 17);
