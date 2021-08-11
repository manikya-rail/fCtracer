# Farm Tracer

## Installation

### Prerequistes

- [Postgres](https://postgresapp.com/)
- [Redis](https://redis.io/topics/quickstart)
- [RVM](https://rvm.io/)
- [Node.js](https://nodejs.org/en/)
- [Yarn](https://yarnpkg.com/lang/en/docs/install)

### Install

Get the `config/master.key` from this project's Wiki.

- `bin/setup`

If `puma` is struggling to install it's caused by the newest version of XCode.
Here is a fix from [Stackoverflow](https://stackoverflow.com/a/63201544/575985).

## Running Server

- `rails s`

## Tests

- `rspec`

## Importing Cherry data from spreadsheet

- `bundle exec rails cherry_data:import`
