## Greenfin Time Series DB

The purpose of this repository is to provide a scaffold for spinning up a
database with [TimescaleDB](timescale.com) enabled. The current data model is
very simplistic, but can be easily modified by changing the `create_tables`
file found in `/scripts`.

### What database tho?

We're using Postgresql along with TimescaleDB for collecting and working with
time series data.

For more, read this great introduction to [TimescaleDB](https://blog.timescale.com/when-boring-is-awesome-building-a-scalable-time-series-database-on-postgresql-2900ea453ee2) article.
