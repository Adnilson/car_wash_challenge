# README

# Cazoo challenge solution

###  Question:

What do you mean with this?

> "...all cars with an available from bigger than three months in the future should be filtered"

There can be many interpretations.


### Resuming...


As you asked to have docker, all components are in a network. Main app, PostgreSQL.

I decided not to use Sidekiq for simplicity and fast iteration. It could be added to this network as well with Redis.

## Instructions

### Configure environment variables

Create an .env file and copy contents from example-env

e.g.

`cp example-env .env`


### Build the app for development

`docker-compose build`

* Enliven the containers

`docker-compose up`

* Set up the database

`docker-compose run web rails db:create`

`docker-compose run web rails db:schema:load`

`docker-compose run web rails db:seed`

This seeding will create the Maker and Model tables for the cars


* Run tests

`docker-compose run web rails test`
