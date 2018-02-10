DROP DATABASE IF EXISTS timeseries;
CREATE database timeseries TABLESPACE pg_default;

-- Extend the database with TimescaleDB
CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;

-- Add extension for encrypting/decrypting data
CREATE EXTENSION IF NOT EXISTS pgcrypto;
