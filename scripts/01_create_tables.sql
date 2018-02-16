DROP    SCHEMA IF EXISTS gf CASCADE;
CREATE  SCHEMA gf;

CREATE TABLE gf.clients {
  client_id SERIAL PRIMARY KEY,
  name TEXT,
  lat NUMERIC, -- TODO: does number need a precision? ex. 5 ?
  lon NUMERIC
}

CREATE TYPE SENSOR_TYPE AS ENUM ('temp', 'humidity', 'pH');

CREATE TABLE gf.sensors {
  sensor_id SERIAL PRIMARY KEY,
  owner INT NULL REFERENCES gf.clients(client_id) ON DELETE CASCADE,
  type SENSOR_TYPE
}

CREATE TABLE gf.records (
  time    TIMESTAMPTZ       NOT NULL,
  owner   INT               NULL        REFERENCES gf.sensors(sensor_id) ON DELETE CASCADE,
  value   DOUBLE PRECISION  NULL
);

-- This creates a hypertable that is partitioned by time using the values in the `time` column.
SELECT create_hypertable('gf.records', 'time');

-- OR you can additionally partition the data on another
--   dimension (what we call 'space partitioning').
-- E.g., to partition `location` into 4 partitions:

-- SELECT create_hypertable('conditions', 'time', 'location', 4);
